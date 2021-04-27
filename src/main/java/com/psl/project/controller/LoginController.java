package com.psl.project.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.User;
import com.psl.project.services.SecurityService;
import com.psl.project.services.UserService;
import com.psl.project.validator.UserValidator;

@Controller
public class LoginController {
	
    @Autowired
    private UserService userService;
	
	@Autowired
    private UserValidator userValidator;
	
    @Autowired
    private SecurityService securityService;
    
    //Opening User Registration Page
    @GetMapping("/registration")
    public String registration(Model model,HttpServletRequest request) {
    	//Accessing cookies to check if user logged in already
    	Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//If user is logged in redirect to Home page
				return "redirect:/allcourses";
			}
		}
		
        model.addAttribute("userForm", new User());

        return "registration";
    }
    
    //Registering new user
    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        //Checking if all constrain is passed and same username doesn't exist
    	userValidator.validate(userForm, bindingResult);
    	if (bindingResult.hasErrors()) {
    		//If user inputs contain any error get back to registration page
    		return "registration";
        }
        
        //Saving new user in the database
        userService.save(userForm);
        
        //Automatically logging in the user after registration completes
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        
        //redirecting user to Home page
        return "redirect:/allcourses";
    }

    //Opening User Login page
    @GetMapping("/login")
    public String login(Model model, String error, String logout,HttpServletRequest request) {
    	//Accessing cookies to check if user logged in already
    	Cookie[] cookies = request.getCookies();
		for(Cookie c:cookies) {
			if(c.getName().equals("userid")) {
				//If user inputs contain any error get back to registration page
				return "redirect:/allcourses";
				
			}
		}
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    //Redirecting user to Home page 'allCourse' after logging in
    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
        return "redirect:/allcourses";
    }
}
