package com.psl.project.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.psl.project.model.AnswersBackup;
import com.psl.project.services.QuestionService;

@RestController
public class QuestionRestController {
	
	@Autowired
	QuestionService questionService;
	
	@PostMapping(value="/user/questions/autosub")
	public Boolean autoFetchAnswer(HttpServletResponse response,
								@RequestParam Map<String,String> responses,
								HttpSession session) {
		responses.remove("_csrf");
		Long aid = Long.parseLong(responses.get("aid"));
		responses.remove("aid");
		for(String key: responses.keySet()) {
			List<AnswersBackup> answerBackups = questionService.getAnswersBackup(aid, Integer.parseInt(key));
			if(answerBackups.size()>0) {
				AnswersBackup temp = answerBackups.get(0);
				//temp.setQqid(Integer.parseInt(key));
				temp.setAnswer(responses.get(key));
				questionService.insertAnswersBackup(temp);
			}
			else {
				AnswersBackup temp = new AnswersBackup();
				temp.setAid(aid);
				temp.setQqid(Integer.parseInt(key));
				temp.setAnswer(responses.get(key));
				questionService.insertAnswersBackup(temp);
			}
		}
		return true;
	}
}
