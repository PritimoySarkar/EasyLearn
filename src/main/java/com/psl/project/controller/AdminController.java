package com.psl.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.psl.project.services.CourseService;

@Controller
public class AdminController {
	
	@Autowired
	CourseService courseService;

	@GetMapping(value="/admin")
	public String showAdminLogin() {
		System.out.println("opening admin login");
		return "admin/login";
	}
	
	@GetMapping(value="/admin/home")
	public String showAdminHome() {
		return "admin/index";
	}
	
	@GetMapping(value="/admin/courses")
	public String showAdminCourses(HttpServletResponse response,HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		return "admin/courses";
	}
	
	@GetMapping(value="/admin/quizzes")
	public String showAdminQuizzes() {
		return "admin/index";
	}
	
	@GetMapping(value="/admin/lectures")
	public String showAdminLectures() {
		return "admin/index";
	}
}
