package com.psl.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Course;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;

@Controller
public class CourseController {

	@Autowired
	CourseService courseservice;
	
	
	@GetMapping(value="/allcourses")
	public String showAllCourses(HttpServletRequest request) {
		request.setAttribute("courses", courseservice.getAllCourses());
		Cookie[] cookies = request.getCookies();
		//System.out.println(cookies);
		//System.out.println(cookies[0].getName()+" "+cookies[0].getValue());
		return "allCourses";
	}
	
	@GetMapping(value="/enrolledcourses")
	public String showEnrolledCourse(HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				List<Course> enrolledCourses = courseservice.getAllEnrolledCourses(Integer.parseInt(c.getValue()));
				request.setAttribute("courses", enrolledCourses);
			}
		}
		return "enrolledCourses";
	}
	
	@GetMapping(value="/course/{name}")
	public String showCourse() {
		return "lectures";
	}
	
	@PostMapping(value="/enroll")
	public String enrollCourse(HttpServletRequest request,@RequestParam Map<String,String> response) {
		Cookie[] cookies = request.getCookies();
		System.out.println(response.get("cid"));
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				List<UserCourse> userCourses = courseservice.getUserCourses(Integer.parseInt(c.getValue()),Integer.parseInt(response.get("cid")));
				if(userCourses.isEmpty()) {
					UserCourse uc = new UserCourse(Long.parseLong(c.getValue()),Integer.parseInt(response.get("cid")),"Enrolled",-1);
					courseservice.insertUserCourse(uc);
				}
			}
		}
		return "redirect:/enrolledcourses";
	}
}
