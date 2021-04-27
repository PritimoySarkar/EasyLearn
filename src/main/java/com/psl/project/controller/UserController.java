package com.psl.project.controller;

import com.psl.project.custom.CourseScore;
import com.psl.project.model.Course;
import com.psl.project.model.Quiz;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.QuizService;
import com.psl.project.services.SecurityService;
import com.psl.project.services.UserService;
import com.psl.project.services.UserServiceImpl;
import com.psl.project.validator.UserValidator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;    
    
    @Autowired
    CourseService courseService;
    
    @Autowired
    QuizService quizService;
    
    //Show user Dashbaord
    @GetMapping("/dashboard")
    public String showDashboard(HttpServletRequest request,@RequestParam Map<String,String> response) {
    	//Accessing cookies to retrieve userid
    	Cookie[] cookies = request.getCookies();
    	List<CourseScore> cs = new ArrayList<CourseScore>();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//Getting user details of the user using userid from cookie
				Optional<User> user = userService.findByID(Long.parseLong(c.getValue()));
				
				//Set user details to request
				request.setAttribute("user", user);
				
				//Getting details of the course user have enrolled
				List<UserCourse> userCourses = courseService.getAllEnrolledUserCourses(Long.parseLong(c.getValue()));
				for(UserCourse uc: userCourses) {
					//Getting course details for each course user has enrolled
					Optional<Course> course = courseService.getCourse(uc.getCid());
					
					//Getting quiz details for each course user has enrolled
					List<Quiz> quizs = quizService.getQuiz(uc.getCid());
					int totalMarks = quizs.get(0).getTotal_score();
					
					//Creating coursescore object to wrap show course name quiz score and test result status
					CourseScore courseScore = new CourseScore(course.get().getCname(),uc.getStatus(),String.valueOf(uc.getScore()*100/totalMarks) );
					
					//Adding the coursecore objects to a coursescore list
					cs.add(courseScore);
				}
			}
		}
		//Passing the coursescore list through request to show it on profile page
		request.setAttribute("coursescore", cs);
        return "dashboard";
    }
    
    //Save user details to cookies for further uses
    @PostMapping("/saveuser")
    public String saveUserId(HttpServletResponse serResponse,HttpServletRequest request,@RequestParam Map<String,String> response) {
        //Get the user details using username retrieved from auto-submitted form
    	User user = userService.findByUsername(response.get("username"));
        
    	//Creating new cookie to hold the user id of logged in user 
    	Cookie cookie = new Cookie("userid",String.valueOf(user.getId()));
        cookie.setMaxAge(-1);
        
        //Save Cookie
        serResponse.addCookie(cookie);
        return "redirect:/";
    }


}
