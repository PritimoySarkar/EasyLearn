package com.psl.project.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.psl.project.model.User;
import com.psl.project.services.UserService;


@Controller
public class UserController {
	@Autowired
	UserService service;
	
	@RequestMapping(value="/userRegister",method=RequestMethod.GET)
	public String RegisterForm(Model model) {
		model.addAttribute("user",new User());
		return "userReg";
	}
	
	@RequestMapping(value="/userRegister",method=RequestMethod.POST)
	public String RegisterUser(@RequestBody String userRegistration) {
		//if(result.hasErrors()) return "user";
		//service.inseertUser(u);
		//System.out.println(name);
		//System.out.println(email);
		System.out.println(userRegistration);
		//User user = new User(name,email,password,"");
		//service.insertUser(user);
		return "courses";
	}
	
	@GetMapping(value="/users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", service.getAllUsers());
		//System.out.println(service.getAllUsers());
		return "courses";
	}
}
