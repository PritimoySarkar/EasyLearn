package com.psl.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.LectureService;
import com.psl.project.services.QuizService;

@Controller
public class LectureController {

	@Autowired
	LectureService service;
	
	@Autowired
	QuizService qservice;
	
	@Autowired
	CourseService courseService;
	
	//Showing the page containing all the lectures of a specific course
	@PostMapping(value="course/lectures/{course}")
	public String showAllLectures(HttpSession session,HttpServletRequest request, @PathVariable("course") int cid) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			UserCourse userCourse = courseService.getUserCourses(Integer.parseInt(session.getAttribute("userid").toString()), cid).get(0);
			request.setAttribute("attemptLeft", userCourse.getAttemptsLeft());
		}
		request.setAttribute("lectures",service.getAllLectures(cid));
		request.setAttribute("cid",cid);
		request.setAttribute("cname",courseService.getCourse(cid).get().getCname());
		request.setAttribute("quiz", qservice.getQuiz(cid).get(0));
		return "user/lectures";
	}
}
