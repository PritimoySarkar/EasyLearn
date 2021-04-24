package com.psl.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String showLoginForm() {
		return "login";
	}
	
	@RequestMapping("/register")
	public String showRegistrationForm() {
		return "register";
	}
	
	/*
	@RequestMapping(path="/processform", method=RequestMethod.POST)
	public String handleForm(@RequestParam("email") String email, Model model) {
		// store in database
		model.addAttribute("email", email);
		return "registrationSuccessful";
	}*/
	
//	@RequestMapping(path="/processform", method=RequestMethod.POST)
//	public String handleForm(@ModelAttribute User user, Model model) {
//		System.out.println(user);
//		return "registrationSuccessful";
//	}
}
