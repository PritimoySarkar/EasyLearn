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
	
	//To show all available Courses
	@GetMapping(value="/allcourses")
	public String showAllCourses(HttpServletRequest request) {
		
		//Accessing cookie to retrieve userid
		Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//Retrieving enrolled courses by that user using userid got from the cookie
				List<Course> enrolledCourses = courseservice.getAllEnrolledCourses(Integer.parseInt(c.getValue()));
				
				//Adding enrolled courses details to request
				request.setAttribute("enrolledCourses", enrolledCourses);
				
				//Retrieving not enrolled courses by that user using userid got from the cookie
				List<Course> notEnrolledCourses = courseservice.getAllNotEnrolledCourses(Integer.parseInt(c.getValue()));
				
				//Adding not enrolled courses details to request
				request.setAttribute("notEnrolledCourses", notEnrolledCourses);
			}
		}
		return "allCourses";
	}
	
	//To show only enrolled courses by the user
	@GetMapping(value="/enrolledcourses")
	public String showEnrolledCourse(HttpServletRequest request) {
		//Accessing cookie to retrieve userid
		Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//Retrieving enrolled courses by that user using userid got from the cookie
				List<Course> enrolledCourses = courseservice.getAllEnrolledCourses(Integer.parseInt(c.getValue()));
				request.setAttribute("courses", enrolledCourses);
				
				//Retrieving not enrolled courses by that user using userid got from the cookie
				List<Course> notEnrolledCourses = courseservice.getAllNotEnrolledCourses(Integer.parseInt(c.getValue()));
				System.out.println(notEnrolledCourses);
			}
		}
		return "enrolledCourses";
	}
	
	//To enroll a course by the user
	@PostMapping(value="/enroll")
	public String enrollCourse(HttpServletRequest request,@RequestParam Map<String,String> response) {
		//Accessing cookie to retrieve userid
		Cookie[] cookies = request.getCookies();
		System.out.println(response.get("cid"));
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//Checking if the user has enrolled in that course already
				List<UserCourse> userCourses = courseservice.getUserCourses(Integer.parseInt(c.getValue()),Integer.parseInt(response.get("cid")));
				if(userCourses.isEmpty()) {
					//Enrolling the course for that user only if the course was not enrolled by that user before
					UserCourse uc = new UserCourse(Long.parseLong(c.getValue()),Integer.parseInt(response.get("cid")),"Enrolled",-1);
					courseservice.insertUserCourse(uc);
				}
			}
		}
		return "redirect:/enrolledcourses";
	}
}
