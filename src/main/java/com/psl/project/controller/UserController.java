package com.psl.project.controller;

import com.psl.project.custom.CourseScore;
import com.psl.project.model.Course;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
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
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    CourseService courseService;

    @GetMapping("/registration")
    public String registration(Model model,HttpServletRequest request) {
    	Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				return "redirect:/allcourses";
			}
		}
		
        model.addAttribute("userForm", new User());

        return "registration";
    }
    
    @GetMapping("/dashboard")
    public String showDashboard(HttpServletRequest request,@RequestParam Map<String,String> response) {
    	Cookie[] cookies = request.getCookies();
    	List<CourseScore> cs = new ArrayList<CourseScore>();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				Optional<User> user = userService.findByID(Long.parseLong(c.getValue()));
				request.setAttribute("user", user);
				List<UserCourse> userCourses = courseService.getAllEnrolledUserCourses(Long.parseLong(c.getValue()));
				for(UserCourse uc: userCourses) {
					Optional<Course> course = courseService.getCourse(uc.getCid());
					System.out.println(course.get().getCname()+" "+uc.getStatus()+" "+uc.getScore());
					CourseScore courseScore = new CourseScore(course.get().getCname(),uc.getStatus(),String.valueOf(uc.getScore()) );
					cs.add(courseScore);
				}
			}
		}
		request.setAttribute("coursescore", cs);
        return "dashboard";
    }
    
    @PostMapping("/saveuser")
    public String saveUserId(HttpServletResponse serResponse,HttpServletRequest request,@RequestParam Map<String,String> response) {
        User user = userService.findByUsername(response.get("username"));
        Cookie cookie = new Cookie("userid",String.valueOf(user.getId()));
        cookie.setMaxAge(-1); 
        serResponse.addCookie(cookie);
        System.out.println("Cookie saved");
        return "redirect:/allcourses";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/allcourses";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout,HttpServletRequest request) {
    	Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				return "redirect:/allcourses";
				
			}
		}
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
        return "redirect:/allcourses";
    }
}
