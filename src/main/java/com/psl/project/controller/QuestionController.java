package com.psl.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Attempt;
import com.psl.project.model.Question;
import com.psl.project.model.Quiz;
import com.psl.project.model.UserCourse;
import com.psl.project.services.AttemptService;
import com.psl.project.services.CourseService;
import com.psl.project.services.QuestionService;
import com.psl.project.services.QuizService;

@Controller
@RequestMapping("/course")
public class QuestionController {

	@Autowired
	QuestionService service;

	@Autowired
	QuizService quizService;

	@Autowired
	CourseService courseService;
	
	@Autowired
	AttemptService attemptService;

	// Show all questions corresponding to a course
	@PostMapping(value = "/{qid}/quiz")
	public String showQuestion(@RequestParam Map<String, String> responses,HttpServletRequest request,@PathVariable("qid") int qid,HttpSession session) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			//Fetch UserCourse details
			UserCourse userCourse = courseService.getUserCourses(Integer.parseInt(session.getAttribute("userid").toString()), Integer.parseInt(responses.get("cid"))).get(0);
			int remainingAttempt = userCourse.getAttemptsLeft();
			userCourse.setAttemptsLeft(remainingAttempt-1);
			courseService.insertUserCourse(userCourse);
			Attempt attempt = new Attempt(userCourse.getUcid(),6-remainingAttempt,0,"Failed");
			request.setAttribute("attempt", attempt);
			attemptService.insertAttempt(attempt);
		}
		request.setAttribute("questions", service.getQuestions(qid));
		return "user/questionPage";
	}

	// Get Score after attempting a test
	@PostMapping(value = "/quiz/scorecard")
	public String submitQuestion(@RequestParam Map<String, String> responses, HttpServletRequest request,
			HttpSession session) {
		// Get all question details using quiz id
		List<Question> qq = service.getQuestions(Integer.parseInt(responses.get("qid")));

		// Taking backup of the quiz ID
		int quizId = Integer.parseInt(responses.get("qid"));
		
		//Taking backup of attempt ID
		Long aid=Long.parseLong(responses.get("aid"));

		// Removing quizid and attempid from response for ease of checking correct answer to
		// calculate score
		responses.remove("qid");
		responses.remove("aid");

		// Code for score Calculation Starts here
		Map<String, String> answers = new HashMap<>();
		for (Question q : qq) {
			// saving all correct answers of all questions from database to a Map
			answers.put(String.valueOf(q.getQqid()), q.getAnswer());
		}
		// Initializing score and test status variable
		int score = 0;
		String status = "";
		for (String key : responses.keySet()) {
			// If answers received from response is same as correct answer score is
			// increased
			System.out.println(key+" "+responses.get(key));
			if (responses.get(key).equals(answers.get(key))) {
				score++;
			}
		}
		// Determining test score percentage
		int scorePercent = Math.round((score * 100)/answers.size());
		
		// Determining test status
		if ((score * 100) / answers.size() < 70)
			status = "Failed";
		else
			status = "Passed";

		// Setting test score and test status to request
		request.setAttribute("score", score);
		request.setAttribute("status", status);
		// Code for score calculation ends here

		// Code for saving score to Database starts here
		// Getting quiz details using quiz id
		Optional<Quiz> quiz = quizService.getQuizById(quizId);

		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			// Getting usercourse using user id from cookie and course id from quiz details
			// to save score into the database
			List<UserCourse> userCourses = courseService
					.getUserCourses(Integer.parseInt(session.getAttribute("userid").toString()), quiz.get().getCid());

			// Get the usercourse details
			UserCourse uc = userCourses.get(0);
			
			//Getiing Attempt object using aid
			Attempt attempt = attemptService.getAttemptById(aid).get();
			
			//Setting attributes to attempt object
			attempt.setScore(scorePercent);
			attempt.setStatus(status);
			
			//Putting attribute object back to the database
			attemptService.insertAttempt(attempt);

			// Update the score and test status in the usercourse object
			if(status.equals("Passed")) {
				uc.setStatus(status);
			}
			else {
				if(uc.getStatus().equals("Enrolled")) uc.setStatus(status);
			}

			// adding the usercourse back into the database so the updated score and test
			// staus will be saved in the database
			courseService.insertUserCourse(uc);
		}
		return "user/scorecard";
	}
}
