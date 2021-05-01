package com.psl.project.controller;

import com.psl.project.custom.CourseScore;
import com.psl.project.model.Course;
import com.psl.project.model.Quiz;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.QuizService;
import com.psl.project.services.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	CourseService courseService;

	@Autowired
	QuizService quizService;

	@GetMapping("/loggedUsers")
	public String getLoggedUsers() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			String username = ((UserDetails) principal).getUsername();
			// String uid = ((UserDetails)principal).getAuthorities();
			System.out.println(username);
			// System.out.println();
		} else {
			String username = principal.toString();
			System.out.println(username);
		}
		return "users";
	}

	// Show user Dashbaord
	@GetMapping("/dashboard")
	public String showDashboard(HttpServletRequest request, @RequestParam Map<String, String> response,
			HttpSession session) {
		List<CourseScore> cs = new ArrayList<CourseScore>();
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			// Getting user details of the user using userid from cookie
			Optional<User> user = userService.findByID(Long.parseLong(session.getAttribute("userid").toString()));

			// Set user details to request
			request.setAttribute("user", user);

			// Getting details of the course user have enrolled
			List<UserCourse> userCourses = courseService
					.getAllEnrolledUserCourses(Long.parseLong(session.getAttribute("userid").toString()));
			for (UserCourse uc : userCourses) {
				// Getting course details for each course user has enrolled
				Optional<Course> course = courseService.getCourse(uc.getCid());

				// Getting quiz details for each course user has enrolled
				List<Quiz> quizs = quizService.getQuiz(uc.getCid());
				int totalMarks = quizs.get(0).getTotal_score();

				// Creating coursescore object to wrap show course name quiz score and test
				// result status
				CourseScore courseScore = new CourseScore(course.get().getCname(), uc.getStatus(),
						String.valueOf(uc.getScore() * 100 / totalMarks));

				// Adding the coursecore objects to a coursescore list
				cs.add(courseScore);
			}
		}
		// Passing the coursescore list through request to show it on profile page
		request.setAttribute("coursescore", cs);
		return "dashboard";
	}
}
