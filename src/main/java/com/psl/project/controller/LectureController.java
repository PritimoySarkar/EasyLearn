package com.psl.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String showAllLectures(HttpServletRequest request, @PathVariable("course") int cid) {
		request.setAttribute("lectures",service.getAllLectures(cid));
		request.setAttribute("course",cid);
		request.setAttribute("cname",courseService.getCourse(cid).get().getCname());
		request.setAttribute("quiz", qservice.getQuiz(cid).get(0));
		return "user/lectures";
	}
	
}
