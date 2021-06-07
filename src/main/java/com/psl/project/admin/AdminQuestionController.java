package com.psl.project.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Question;
import com.psl.project.model.Quiz;
import com.psl.project.services.CourseService;
import com.psl.project.services.QuestionService;
import com.psl.project.services.QuizService;

@Controller
@RequestMapping("/admin")
public class AdminQuestionController {
	@Autowired
	CourseService courseService;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	QuizService quizService;
	
	@PostMapping(value="/quiz/add/{cid}")
	public String addAdminQuizzes(Model model,HttpServletRequest request,@PathVariable("cid") int cid) {
		
		List<Quiz> quiz = quizService.getQuiz(cid);
		String qname=courseService.getCourse(cid).get().getCname();
		int qid;
		
		//Check if Quiz already exist
		//If Quiz doesn't exist
		if(quiz.size()==0) {
			//Create Quiz object
			Quiz tempQuiz = new Quiz();
			
			//Set attributes into quiz object
			tempQuiz.setCid(cid);
			tempQuiz.setQname(qname);
			tempQuiz.setTotal_score(0);
			tempQuiz.setTime(0);
			
			//Insert the customized QUiz object into the database
			quizService.insertQuiz(tempQuiz);
			
			//Taking backup of Quiz object
			qid = quizService.getQuiz(cid).get(0).getQid();
			
			//Adding quiz Name to request
			request.setAttribute("quizName", quizService.getQuiz(cid).get(0).getQname());
		}
		//If Quiz exist
		else {
			//Get the QUiz
			qid=quiz.get(0).getQid();
			
			//Set the Quiz Name to request
			request.setAttribute("quizName", quiz.get(0).getQname());
		}
		//Adding all attributes in model and request to render the page with proper details
		model.addAttribute("newQuestion",new Question());
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}
	
	@PostMapping(value="/add/question/{cid}/{qid}")
	public String addAdminQuestion(Model model,HttpServletRequest request,@ModelAttribute("newQuestion") Question question,@PathVariable("qid") int qid,@PathVariable("cid") int cid) {
		int totalQuestions = questionService.getQuestions(qid).size();
		//question.setSlno(totalQuestions+1);
		
		//Increasing all next lecture's serial number by 1
		questionService.syncQuestionsUp(question.getSlno(), question.getQid());
		
		//Inserting the question into the database
		questionService.insertQuestion(question);
		
		//Adding 1 score with total score 
		Quiz quiz = quizService.getQuizById(qid).get();
		quiz.setTotal_score(totalQuestions+1);
		quiz.setTime(totalQuestions+1);
		quizService.insertQuiz(quiz);
		
		//Adding all attributes in model and request to render the page with proper details
		model.addAttribute("newQuestion",new Question());
		request.setAttribute("quizName", quizService.getQuizById(qid).get().getQname());
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}
	
	@PostMapping(value="/remove/question/{cid}/{qid}")
	public String removeAdminQuestion(Model model,@RequestParam Map<String, String> response,HttpServletRequest request,@PathVariable("qid") int qid,@PathVariable("cid") int cid) {
		//Taking backup of the serial number of the question to bea deleted
		int slno = questionService.getQuestionsByQqid(Integer.parseInt(response.get("qqid"))).get().getSlno();
		
		//Delete that specific question
		questionService.removeQuestion(Integer.parseInt(response.get("qqid")));
		
		//Decrease serial number of all next question
		questionService.syncQuestionsDown(slno, qid);
		
		//Adding all attributes in model and request to render the page with proper details
		model.addAttribute("newQuestion",new Question());
		request.setAttribute("quizName", quizService.getQuizById(qid).get().getQname());
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}
	
	@PostMapping(value="/edit/question/{cid}/{qid}")
	public String editAdminQuestion(Model model,@RequestParam Map<String, String> response,HttpServletRequest request,@PathVariable("qid") int qid,@PathVariable("cid") int cid) {
		for(String key:response.keySet()) {
			System.out.println(key+" "+response.get(key));
		}
		System.out.println("Quiz Id: "+qid);
		//Fetching question object from database for the corresponding question ID 
		Question question = questionService.getQuestionsByQqid(Integer.parseInt(response.get("editQid"))).get();
		
		if(Integer.parseInt(response.get("editSlno"))!=question.getSlno()) {
			System.out.println("Serial no. changed");
			int oldSlno = question.getSlno();
			
			//Decreasing all next questions's serial number by 1
			questionService.syncQuestionsDown(oldSlno, qid);
			
			//Decreasing all next questions's serial number by 1
			questionService.syncQuestionsUp(Integer.parseInt(response.get("editSlno")), qid);
			
			//Changing the serial number of the question object
			question.setSlno(Integer.parseInt(response.get("editSlno")));
		}
		
		//setting changed values of question's object's attribute into the question object
		question.setQuestion(response.get("editQuestion"));
		question.setOption1(response.get("editO1"));
		question.setOption2(response.get("editO2"));
		question.setOption3(response.get("editO3"));
		question.setOption4(response.get("editO4"));
		question.setAnswer(response.get("answer"));
		
		//Inserting customized question object in the database
		questionService.insertQuestion(question);
		
		//Adding all attributes in model and request to render the page with proper details
		model.addAttribute("newQuestion",new Question());
		request.setAttribute("quizName", quizService.getQuizById(qid).get().getQname());
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}

}
