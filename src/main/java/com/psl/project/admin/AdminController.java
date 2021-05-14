package com.psl.project.admin;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.custom.CourseScore;
import com.psl.project.model.Course;
import com.psl.project.model.Quiz;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.QuizService;
import com.psl.project.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	QuizService quizService;

	//All Get Mappings	
	@GetMapping({"/home",""})
	public String showAdminHome(HttpSession session) {
		// Accessing Principal object to get logged in user's username
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			// Get the user details using username retrieved from auto-submitted form
			User user = userService.findByUsername(((UserDetails) principal).getUsername());
			
			// Storing userid to Session
			session.setAttribute("userid", user.getId().toString());
		}
		return "admin/index";
	}
	
	@GetMapping(value="/courses")
	public String showAdminCourses(Model model,HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		model.addAttribute("newCourse",new Course());
		return "admin/courses";
	}
	
	@GetMapping(value="/users")
	public String showAdminUsers(Model model,HttpServletRequest request) {
		request.setAttribute("users", userService.getAllUsers());
		return "admin/users";
	}
	
	@GetMapping(value="/quizzes")
	public String showAdminQuizzes(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		return "admin/quizzes";
	}
	
	@GetMapping(value="/lectures")
	public String showAdminLectures(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		return "admin/lectures";
	}
	
	// Show user Dashbaord
	@GetMapping("/dashboard")
	public String showDashboard(HttpServletRequest request, @RequestParam Map<String, String> response,
			HttpSession session) {
	List<CourseScore> cs = new ArrayList<CourseScore>();
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		}
		else {
			// Getting user details of the user using userid from cookie
			Optional<User> user = userService.findByID(Long.parseLong(session.getAttribute("userid").toString()));
	
			// Set user details to request
			request.setAttribute("user", user);
		}
		// Passing the coursescore list through request to show it on profile page
		request.setAttribute("coursescore", cs);
		return "admin/dashboard";
	}
	
	//Individual User's profile page
	@GetMapping("/userProfile/{uid}")
	public String showIndividualUserProfile(HttpServletRequest request,@PathVariable("uid") Long uid) {
		List<CourseScore> cs = new ArrayList<CourseScore>();
			// Getting user details of the user using userid from cookie
			User user = userService.findByID(uid).get();

			// Set user details to request
			request.setAttribute("user", user);

			// Getting details of the course user have enrolled
			List<UserCourse> userCourses = courseService.getAllEnrolledUserCourses(uid);
			request.setAttribute("userCourses", userCourses);
			for (UserCourse uc : userCourses) {
				// Getting course details for each course user has enrolled
				Optional<Course> course = courseService.getCourse(uc.getCid());

				// Getting quiz details for each course user has enrolled
				List<Quiz> quizs = quizService.getQuiz(uc.getCid());
				int totalMarks = quizs.get(0).getTotal_score();

				// Creating coursescore object to wrap show course name quiz score and test
				// result status
				CourseScore courseScore = new CourseScore(uc.getUcid(),course.get().getCname(), uc.getStatus());

				// Adding the coursecore objects to a coursescore list
				cs.add(courseScore);
			}
		// Passing the coursescore list through request to show it on profile page
		request.setAttribute("coursescore", cs);
		return "admin/individualUser";
	}
}
