package com.psl.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Quiz;
import com.psl.project.repository.QuizDao;

@Service
public class QuizService {

	@Autowired
	QuizDao dao;
	
	//Method to get quiz details of a course using course id
	public List<Quiz> getQuiz(int cid) {
		List<Quiz> quiz = dao.findByCid(cid);
		return quiz;
	}
	
	//Method to get quiz details of a quiz using quiz id
	public Optional<Quiz> getQuizById(int id) {
		Optional<Quiz> q = dao.findById(id);
		return q;
	}
}
