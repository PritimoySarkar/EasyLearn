package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Question;
import com.psl.project.repository.QuestionDao;

@Service
public class QuestionService {

	@Autowired
	QuestionDao questiondao;
	
	//Method to insert new question in the database
	public void insertQuestion(Question q) {
		questiondao.save(q);
		System.out.println("Question saved");
	}
	
	//Method to get all questions details
	public List<Question> getAllQuestions(){
		List<Question> questions = new ArrayList<Question>();
		for(Question q: questiondao.findAll()) {
			questions.add(q);
		}
		return questions;
	}
	
	//Method to get all questions details of a quiz using quiz id
	public List<Question> getQuestions(int qid){
		List<Question> questions = new ArrayList<Question>();
		for(Question q: questiondao.findByQidOrderBySlnoAsc(qid)) {
			questions.add(q);
		}
		return questions;
	}
}
