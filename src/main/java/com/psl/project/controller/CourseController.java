package com.psl.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.psl.project.services.CourseService;

@Controller
public class CourseController {

	@Autowired
	CourseService courseservice;
	
	@GetMapping(value="/courses")
	public String showAllCourse(HttpServletRequest request) {
		request.setAttribute("courses", courseservice.getAllCourses());
		return "courses";
	}
	
	@GetMapping(value="/allcourses")
	public String showAllCourses(HttpServletRequest request) {
		request.setAttribute("courses", courseservice.getAllCourses());
		return "allCourses";
	}
	
	@GetMapping(value="/enrolledcourses")
	public String showEnrolledCourse(HttpServletRequest request) {
		request.setAttribute("courses", courseservice.getAllEnrolledCourses());
		return "enrolledCourses";
	}
	
	@GetMapping(value="/course/{name}")
	public String showCourse() {
		return "lectures";
	}
}
