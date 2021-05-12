package com.psl.project.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.psl.project.model.Attempt;
import com.psl.project.services.AttemptService;

@RestController
public class AttemptController {

	@Autowired
	AttemptService attemptService;
	
	@GetMapping("/user/attempts/{ucid}")
	public List<Attempt> showAttemptsForUsercourse(@PathVariable("ucid") int ucid){
		return attemptService.getAttemptsByUsercourse(ucid);
	}
}
