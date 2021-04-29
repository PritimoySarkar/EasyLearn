package com.psl.project.services;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.psl.project.repository.QuestionDao;
import com.psl.project.model.Question;

import java.util.LinkedList;



@RunWith(SpringRunner.class)
@SpringBootTest
public class QuestionServiceTest{
	
	@Autowired 
	QuestionService questionService;
	
	@MockBean
	QuestionDao questiondao;
	
	
	@Test
	public void insertQuestionTest() {
		
		Question q = new Question(1,2,3,"Test question","Test opt 1","Test opt 2","Test opt 3","Test opt 4","Test ans");
		
		Mockito.when(questiondao.save(q)).thenReturn(q);
		
		questionService.insertQuestion(q);
		
		Mockito.verify(questiondao).save(q);
		
	}
	
	
	@Test
	public void getAllQuestionsTest() {
		
		Mockito.when(questiondao.findAll()).thenReturn(new LinkedList<Question>());
		
		assertEquals(questionService.getAllQuestions(),new LinkedList<Question>());
		
		Mockito.verify(questiondao).findAll();		
		
	}
	
	
	@Test
	public void getQuestionsTest() {		
		
		Mockito.when(questiondao.findByQidOrderBySlnoAsc(2)).thenReturn(new LinkedList<Question>());
		
		assertEquals(questionService.getQuestions(2),new LinkedList<Question>());
		
		Mockito.verify(questiondao).findByQidOrderBySlnoAsc(2);
		
	}
	
	
}