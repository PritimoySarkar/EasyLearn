package com.psl.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Question;
import com.psl.project.services.QuestionService;

@Controller
public class QuestionController {

	@Autowired
	QuestionService service;
	
	@GetMapping(value="/course/{qid}/quiz")
	public String showQuestion(HttpServletRequest request, @PathVariable("qid") int qid) {
		request.setAttribute("questions", service.getQuestions(qid));
		return "questionPage";
	}
	
	@PostMapping(value="/quiz/scorecard")
	public String submitQuestion(@RequestParam Map<String, String> responses,HttpServletRequest request) {
		List<Question> qq = service.getQuestions(Integer.parseInt(responses.get("qid")));
		int quizId=Integer.parseInt(responses.get("qid"));
		responses.remove("qid");
		Map<String,String> answers = new HashMap<>();
		for(Question q: qq) {
			//System.out.println(q.getQqid()+" "+q.getAnswer());
			answers.put(String.valueOf(q.getQqid()), q.getAnswer());
		}
		System.out.println("Responses: ");
		
		int score=0;
		String status="";
		for(String key: responses.keySet()) {
			//System.out.println(key+" "+responses.get(key));
			if(responses.get(key).equals(answers.get(key))) {
				score++;
			}
		}
		System.out.println("Total Score: "+score);
		if((score*100)/answers.size()<70) status="Failed";
		else status="Passed";
		
		request.setAttribute("score", score);
		request.setAttribute("status", status);
		return "scorecard";
	}
}
