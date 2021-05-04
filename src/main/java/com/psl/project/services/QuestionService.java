package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
	
	//Method to get all questions details of a quiz using quiz id
	public Optional<Question> getQuestionsByQqid(int qqid){
		Optional<Question> question = questiondao.findById(qqid);
		return question;
	}
	
	//Method to remove question in the database
	public void removeQuestion(int qqid) {
		questiondao.deleteById(qqid);;
	}
	
	//Decrease all next questions serial number by 1
	public void syncQuestions(int slno,int qid) {
		questiondao.decreaseAllNextQuestions(slno, qid);
	}
}
