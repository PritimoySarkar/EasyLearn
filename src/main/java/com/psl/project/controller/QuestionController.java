package com.psl.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Question;
import com.psl.project.model.Quiz;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.QuestionService;
import com.psl.project.services.QuizService;

@Controller
public class QuestionController {

	@Autowired
	QuestionService service;
	
	@Autowired
	QuizService quizService;
	
	@Autowired
	CourseService courseService;
	
	//Show all questions corresponding to a course
	@PostMapping(value="/course/{qid}/quiz")
	public String showQuestion(HttpServletRequest request, @PathVariable("qid") int qid) {
		request.setAttribute("questions", service.getQuestions(qid));
		return "questionPage";
	}
	
	//Get Score after attempting a test
	@PostMapping(value="/quiz/scorecard")
	public String submitQuestion(@RequestParam Map<String, String> responses,HttpServletRequest request) {
		//Get all question details using quiz id
		List<Question> qq = service.getQuestions(Integer.parseInt(responses.get("qid")));
		
		//Taking backup of the quiz ID
		int quizId=Integer.parseInt(responses.get("qid"));
		
		//Removing quizid from response for ease of checking correct answer to calculate score
		responses.remove("qid");
		
		//Code for score Calculation Starts here
		Map<String,String> answers = new HashMap<>();
		for(Question q: qq) {
			//saving all correct answers of all questions from database to a Map 
			answers.put(String.valueOf(q.getQqid()), q.getAnswer());
		}
		//Initializing score and test status valriable
		int score=0;
		String status="";
		for(String key: responses.keySet()) {
			//If answers received from response is same as correct answer score is increased
			if(responses.get(key).equals(answers.get(key))) {
				score++;
			}
		}
		//Determining test status
		if((score*100)/answers.size()<70) status="Failed";
		else status="Passed";
		
		//Setting test score and test status to request
		request.setAttribute("score", score);
		request.setAttribute("status", status);
		//Code for score calculation ends here
		
		
		//Code for saving score to Database starts here
		//Getting quiz details using quiz id
		Optional<Quiz> quiz = quizService.getQuizById(quizId);
		
		//accessing cookie to retrieve userid
		Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//Getting usercourse using user id from cookie and course id from quiz details to save score into the database 
				List<UserCourse> userCourses = courseService.getUserCourses(Integer.parseInt(c.getValue()), quiz.get().getCid());
				
				//Get the usercourse details
				UserCourse uc = userCourses.get(0);
				
				//Update the score and test status in the usercourse object
				uc.setScore(score);
				uc.setStatus(status);
				
				//adding the usercourse back into the database so the updated score and test staus will be saved in the database
				courseService.insertUserCourse(uc);
				
			}
		}
		
		return "scorecard";
	}
}
