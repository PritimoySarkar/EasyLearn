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
		//model.addAttribute("newLecture",new Quiz());
		model.addAttribute("newQuestion",new Question());
		List<Quiz> quiz = quizService.getQuiz(cid);
		String qname=courseService.getCourse(cid).get().getCname();
		int qid;
		if(quiz.size()==0) {
			Quiz tempQuiz = new Quiz();
			tempQuiz.setCid(cid);
			tempQuiz.setQname(qname);
			tempQuiz.setTotal_score(0);
			quizService.insertQuiz(tempQuiz);
			qid = quizService.getQuiz(cid).get(0).getQid();
			request.setAttribute("quizName", quizService.getQuiz(cid).get(0).getQname());
		}
		else {qid=quiz.get(0).getQid();request.setAttribute("quizName", quiz.get(0).getQname());}
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}
	
	@PostMapping(value="/add/question/{cid}/{qid}")
	public String addAdminQuestion(Model model,HttpServletRequest request,@ModelAttribute("newQuestion") Question question,@PathVariable("qid") int qid,@PathVariable("cid") int cid) {
		//System.out.println("Question: "+question.getQuestion()+" "+question.getOption3()+" "+question.getAnswer()+" "+question.getQid());
		int totalQuestions = questionService.getQuestions(qid).size();
		question.setSlno(totalQuestions+1);
		questionService.insertQuestion(question);
		
		Quiz quiz = quizService.getQuizById(qid).get();
		quiz.setTotal_score(totalQuestions+1);
		quizService.insertQuiz(quiz);
		
		model.addAttribute("newQuestion",new Question());
		request.setAttribute("quizName", quizService.getQuizById(qid).get().getQname());
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}
	
	@PostMapping(value="/remove/question/{cid}/{qid}")
	public String removeAdminQuestion(Model model,@RequestParam Map<String, String> response,HttpServletRequest request,@PathVariable("qid") int qid,@PathVariable("cid") int cid) {
		System.out.println(response.get("qqid"));

		//Taking backup of the serial number of the question to bea deleted
		int slno = questionService.getQuestionsByQqid(Integer.parseInt(response.get("qqid"))).get().getSlno();
		
		//Delete that specific question
		questionService.removeQuestion(Integer.parseInt(response.get("qqid")));
		
		//Decrease serial number of all next question
		questionService.syncQuestions(slno, qid);
		
		model.addAttribute("newQuestion",new Question());
		request.setAttribute("quizName", quizService.getQuizById(qid).get().getQname());
		request.setAttribute("questions", questionService.getQuestions(qid));
		request.setAttribute("cid", cid);
		request.setAttribute("qid", qid);
		return "admin/questions";
	}

}
