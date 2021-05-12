package com.psl.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Course;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.UserService;

@Controller
public class CourseController {

	@Autowired
	CourseService courseservice;

	@Autowired
	private UserService userService;

	// To show all available Courses
	@GetMapping(value = "/allcourses")
	public String showAllCourses(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		// Accessing Principal object to get logged in user's username
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			// Get the user details using username retrieved from auto-submitted form
			User user = userService.findByUsername(((UserDetails) principal).getUsername());

			// Storing userid to Session
			session.setAttribute("userid", user.getId().toString());
			
			// Retrieving enrolled courses by that user using userid from user object
			List<Course> enrolledCourses = courseservice.getAllEnrolledCourses(user.getId().intValue());

			// Adding enrolled courses details to request
			request.setAttribute("enrolledCourses", enrolledCourses);

			// Retrieving not enrolled courses by that user using userid got from the cookie
			List<Course> notEnrolledCourses = courseservice.getAllNotEnrolledCourses(user.getId().intValue());

			// Adding not enrolled courses details to request
			request.setAttribute("notEnrolledCourses", notEnrolledCourses);
			
			//Adding user role to request
			request.setAttribute("userRole", user.getRoles().get(0).getName());
		}
		return "user/allCourses";
	}

	// To show only enrolled courses by the user
	@GetMapping(value = "/enrolledcourses")
	public String showEnrolledCourse(HttpServletRequest request, HttpSession session) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			// Retrieving enrolled courses by that user using userid got from session
			List<Course> enrolledCourses = courseservice
					.getAllEnrolledCourses(Integer.parseInt(session.getAttribute("userid").toString()));
			request.setAttribute("courses", enrolledCourses);
		}
		return "user/enrolledCourses";
	}
	
	// To show only enrolled courses by the user
		@GetMapping(value = "user/enrolledcourses")
		public String showEnrolledCourseUser(HttpServletRequest request, HttpSession session) {
			// Checking if userid session is expired or not
			if (session.getAttribute("userid") == null) {
				return "redirect:/";
			} else {
				// Retrieving enrolled courses by that user using userid got from session
				List<Course> enrolledCourses = courseservice
						.getAllEnrolledCourses(Integer.parseInt(session.getAttribute("userid").toString()));
				request.setAttribute("courses", enrolledCourses);
			}
			return "user/enrolledCourses";
		}

	// To enroll a course by the user
	@PostMapping(value = "/enroll")
	public String enrollCourse(HttpServletRequest request, @RequestParam Map<String, String> response,HttpSession session) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			// Checking if the user has enrolled in that course already
			List<UserCourse> userCourses = courseservice.getUserCourses(Integer.parseInt(session.getAttribute("userid").toString()), Integer.parseInt(response.get("cid")));
			if (userCourses.isEmpty()) {
				// Enrolling the course for that user only if the course was not enrolled by
				// that user before
				UserCourse uc = new UserCourse(Long.parseLong(session.getAttribute("userid").toString()), Integer.parseInt(response.get("cid")),"Enrolled",5);
				courseservice.insertUserCourse(uc);
			}
		}
		return "redirect:/enrolledcourses";
	}
}
