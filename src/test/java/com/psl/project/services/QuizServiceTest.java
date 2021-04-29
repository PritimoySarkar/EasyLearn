package com.psl.project.services;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.psl.project.repository.QuizDao;
import com.psl.project.model.Quiz;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.LinkedList;
import java.util.Optional;


@RunWith(SpringRunner.class)
@SpringBootTest
public class QuizServiceTest{
	
	@Autowired
	QuizService quizService;
	
	@MockBean
	QuizDao quizDao;
	
	
	@Test
	public void getQuizTest() {
		
		Mockito.when(quizDao.findByCid(1)).thenReturn(new LinkedList<Quiz>());
		
		assertEquals(quizService.getQuiz(1),new LinkedList<Quiz>());
		
		Mockito.verify(quizDao).findByCid(1);
		
		
	}
	
	
	@Test
	public void getQuizByIdTest() {
		
		Mockito.when(quizDao.findById(1)).thenReturn(Optional.empty());
		
		assertEquals(quizService.getQuizById(1),Optional.empty());
		
		Mockito.verify(quizDao).findById(1);
		
	}
	
	
}