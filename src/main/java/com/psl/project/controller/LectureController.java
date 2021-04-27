package com.psl.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.psl.project.repository.QuizDao;
import com.psl.project.services.LectureService;
import com.psl.project.services.QuestionService;
import com.psl.project.services.QuizService;

@Controller
public class LectureController {

	@Autowired
	LectureService service;
	
	@Autowired
	QuizService qservice;
	
	//Showing the page containing all the lectures of a specific course
	@PostMapping(value="/lectures/{course}/{cname}")
	public String showAllLectures(HttpServletRequest request, @PathVariable("course") int cid, @PathVariable("cname") String cname) {
		request.setAttribute("lectures",service.getAllLectures(cid));
		request.setAttribute("course",cid);
		request.setAttribute("cname",cname);
		request.setAttribute("quiz", qservice.getQuiz(cid).get(0));
		return "lectures";
	}
	
}
