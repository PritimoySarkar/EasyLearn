package com.psl.project.controller;

import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.User;
import com.psl.project.rest.AttemptController;
import com.psl.project.services.SecurityService;
import com.psl.project.services.SmtpMailSender;
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
    
    @Autowired
    SmtpMailSender smtpMailSender;
    
    Logger logger = LoggerFactory.getLogger(LoginController.class);
    
    //Opening User Registration Page
    @GetMapping("/registration")
    public String registration(Model model,HttpServletRequest request) {
    	//Getting username by getcontext to check if user is logged in or not
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if (principal instanceof UserDetails) {
    		//Redirecting to allCourses if user is logged in
    		return "redirect:/allcourses";
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
    	
    	//Getting username by getcontext to check if user is logged in or not
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if (principal instanceof UserDetails) {
    		String userRole = userService.findByUsername(((UserDetails) principal).getUsername()).getRoles().get(0).getName();
    		if(userRole.equals("ADMIN")) {
    			//Redirecting to allCourses if user is logged in 
        		return "redirect:/admin";
    		}
    		else {
    			//Redirecting to allCourses if user is logged in 
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
    
    //Forget Password controller
    @GetMapping("/reset")
    public String resetPassword() {
    	return "forgetPassword";
    }
    
    @PostMapping("/submitotp")
    public String submitOtp(Model model,HttpServletRequest request,@RequestParam Map<String,String> responses) {
    	//System.out.println(responses);
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
    	if(encoder.matches(responses.get("otp"), responses.get("encodedOtp"))) {
    		request.setAttribute("username", responses.get("username"));
        	request.setAttribute("encodedUsername", responses.get("encodedUsername"));
        	model.addAttribute("userForm", new User());
        	return "resetPassword";
    	}
    	else {
    		return "forgetPassword";
    	}	
    }
    
    //Password change form submission
    @PostMapping("/changepassword")
    public String changePassword(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
    	userValidator.validatePassword(userForm, bindingResult);
    	if (bindingResult.hasErrors()) {
    		//If user inputs contain any error get back to registration page
    		return "resetPassword";
        }
    	else {
    		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
    		if(encoder.matches(userForm.getUsername(), userForm.getEncodedUsername())) {
    			User tempUser = userService.findByUsername(userForm.getUsername());
    			tempUser.setPassword(userForm.getPassword());
    			logger.info("Password: "+userForm.getPassword());
    			userService.save(tempUser);
    		}
    	}
    	return "redirect:/login";
    }
}
