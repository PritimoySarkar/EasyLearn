package com.psl.project.services;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.LinkedList;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.psl.project.repository.LectureDao;
import com.psl.project.model.Lecture;



@RunWith(SpringRunner.class)
@SpringBootTest
public class LectureServiceTest{
	
	
	@Autowired
	LectureService lectureService;
	
	@MockBean
	LectureDao lectureDao;
	
	@Test
	public void getAllLecturesTest() {
		
		Mockito.when(lectureDao.findByCidOrderBySlnoAsc(1)).thenReturn(new LinkedList<Lecture>());
		
		assertEquals(lectureService.getAllLectures(1),new LinkedList<Lecture>());
		
		Mockito.verify(lectureDao).findByCidOrderBySlnoAsc(1);
		
	}
	
	
}