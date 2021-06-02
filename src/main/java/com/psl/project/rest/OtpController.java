package com.psl.project.rest;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.psl.project.model.User;
import com.psl.project.services.SmtpMailSender;
import com.psl.project.services.UserService;
import com.psl.project.validator.UserValidator;

@RestController
public class OtpController {
	@Autowired
    private UserValidator userValidator;
	
	@Autowired
	UserService userService;
	
	@Autowired
    private SmtpMailSender smtpMailSender;
	
	//Request OTP for creating account
    @PostMapping("/request")
    public Map<String,String> sendOtp(@ModelAttribute("userForm") User userForm, BindingResult bindingResult,@RequestParam Map<String,String> responses) throws MessagingException {
    	Map<String,String> response = new HashMap<String, String>();    	
    	userValidator.validateUsername(userForm, bindingResult);
    	User user = userService.findByUsername(responses.get("username"));
    	if (bindingResult.hasErrors()) {
    		//If user inputs contain any error get back to registration page
    		response.put("status", "invalid");
        }
    	else if(user != null) {
    		response.put("status", "exist");
    	}
    	else {
    		String encodedPassword = smtpMailSender.send(responses.get("username"), "Welcome - Easy Learn - One Time Password", "<h1>Welcome Email Body</h1>","welcome");
    		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
    		String encodedUsername = encoder.encode(responses.get("username"));
    		response.put("encodedUsername", encodedUsername);
    		response.put("encodedOtp", encodedPassword);
    		response.put("status", "true");
    	}
    	return response;
    }
	
	//Request OTP for reset password
    @PostMapping("/reset")
    public Map<String,String> changePassword(@RequestParam Map<String,String> responses) throws MessagingException {
    	Map<String,String> response = new HashMap<String, String>();
    	User user = userService.findByUsername(responses.get("username"));
    	if(user == null) {
    		response.put("status", "false");
    	}
    	else {
    		String encodedPassword = smtpMailSender.send(responses.get("username"), "Forget Password - Easy Learn - One Time Password", "<h1>Forget Password Body</h1>","reset");
    		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
    		String encodedUsername = encoder.encode(responses.get("username"));
    		response.put("encodedUsername", encodedUsername);
    		response.put("encodedOtp", encodedPassword);
    		response.put("status", "true");
    	}
    	return response;
    }
    
    @PostMapping("/otpmatch")
    public boolean otpMatcher(HttpServletRequest request, @RequestParam Map<String,String> responses) {
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);
    	if(encoder.matches(responses.get("otp"), responses.get("encodedOtp"))) {
    		return true;
    	}
    	return false;
    }
}
