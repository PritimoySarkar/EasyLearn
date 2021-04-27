package com.psl.project.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ErrorPageController implements ErrorController {
	
	//A controller to handle all error pages
	@RequestMapping("/error")
    public ModelAndView handleError(HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        
        //returning different error page depending on the error response code
        if (response.getStatus() == HttpStatus.NOT_FOUND.value()) {
            modelAndView.setViewName("errorPage-404");
        }
        else if (response.getStatus() == HttpStatus.FORBIDDEN.value()) {
            modelAndView.setViewName("errorPage-403");
        }
        else if (response.getStatus() == HttpStatus.METHOD_NOT_ALLOWED.value()) {
            modelAndView.setViewName("errorPage-405");
        }
        else if (response.getStatus() == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            modelAndView.setViewName("errorPage-500");
        }
        else {
            modelAndView.setViewName("errorPage");
        }
 
        return modelAndView;
    }
 
	//returning to '/error' whenever an error occurs
    @Override
    public String getErrorPath() {
        return "/error";
    }
}
