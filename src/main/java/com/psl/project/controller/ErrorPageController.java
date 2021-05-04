package com.psl.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.psl.project.model.User;
import com.psl.project.services.UserService;

@RestController
public class ErrorPageController implements ErrorController {
	
	@Autowired
	UserService userService;
	
	//A controller to handle all error pages
	@RequestMapping("/error")
    public ModelAndView handleError(HttpServletResponse response, HttpSession session, HttpServletRequest request)
    {
        ModelAndView modelAndView = new ModelAndView();
        Object userid = session.getAttribute("userid");
        if (session.getAttribute("userid") != null) {
        	User user = userService.findByID(Long.parseLong(userid.toString())).get();
        	System.out.println(user.getRoles().get(0).getName());
        	modelAndView.addObject("userRole", user.getRoles().get(0).getName());
		}
        //returning different error page depending on the error response code
        if (response.getStatus() == HttpStatus.NOT_FOUND.value()) {
            modelAndView.setViewName("error/errorPage-404");
        }
        else if (response.getStatus() == HttpStatus.FORBIDDEN.value()) {
            modelAndView.setViewName("error/errorPage-403");
        }
        else if (response.getStatus() == HttpStatus.METHOD_NOT_ALLOWED.value()) {
            modelAndView.setViewName("error/errorPage-405");
        }
        else if (response.getStatus() == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            modelAndView.setViewName("error/errorPage-500");
        }
        else {
            modelAndView.setViewName("error/errorPage");
        }
 
        return modelAndView;
    }
 
	//returning to '/error' whenever an error occurs
    @Override
    public String getErrorPath() {
        return "/error";
    }
}
