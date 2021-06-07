package com.psl.project.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.psl.project.model.AnswersBackup;
import com.psl.project.model.Attempt;
import com.psl.project.model.Quiz;
import com.psl.project.model.UserCourse;
import com.psl.project.services.AttemptService;
import com.psl.project.services.CourseService;
import com.psl.project.services.LectureService;
import com.psl.project.services.QuestionService;
import com.psl.project.services.QuizService;

@Controller
public class LectureController {

	@Autowired
	LectureService service;
	
	@Autowired
	QuizService qservice;
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	AttemptService attemptService;
	
	@Autowired
	QuestionService questionService;
	
	//Showing the page containing all the lectures of a specific course
	@PostMapping(value="course/lectures/{course}")
	public String showAllLectures(HttpSession session,HttpServletRequest request, @PathVariable("course") int cid) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			UserCourse userCourse = courseService.getUserCourses(Integer.parseInt(session.getAttribute("userid").toString()), cid).get(0);
			List<Attempt> attempts =  attemptService.getAttemptsByUsercourseAndAttempt(userCourse.getUcid(), (5-userCourse.getAttemptsLeft()));
			if(attempts.size()>0) {
				for(Attempt attempt:attempts) {
					Timestamp startTime = attempt.getTimestamp();
					Timestamp currentTime = new Timestamp(new Date().getTime());
					int elapsedSeconds=Math.round((currentTime.getTime() - startTime.getTime())/1000);
					List<Quiz> quizs = courseService.getCourse(cid).get().getQuiz();
					if(quizs.size()>0) {
						int totalSeconds = quizs.get(0).getTime()*60;
						int remainingTime = totalSeconds - elapsedSeconds;
						System.out.println("Reamining Time in seconds: "+remainingTime);
						if(remainingTime>0) {
							request.setAttribute("assessment_status", "Running");
							request.setAttribute("aid", attempt.getAid());
							break;
						}
					}
				}
				if(request.getAttribute("aid")==null) {
					request.setAttribute("assessment_status", "New");
				}
			}
			else {
				request.setAttribute("assessment_status", "New");
			}
			request.setAttribute("attemptLeft", userCourse.getAttemptsLeft());
		}
		request.setAttribute("lectures",service.getAllLectures(cid));
		request.setAttribute("cid",cid);
		request.setAttribute("cname",courseService.getCourse(cid).get().getCname());
		request.setAttribute("quiz", qservice.getQuiz(cid).get(0));
		return "user/lectures";
	}
}
