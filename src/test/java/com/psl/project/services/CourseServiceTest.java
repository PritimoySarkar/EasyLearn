package com.psl.project.services;

import com.psl.project.model.Course;
import com.psl.project.model.UserCourse;
import com.psl.project.repository.CourseDao;
import com.psl.project.repository.UserCourseDao;
import com.psl.project.services.CourseService;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedList;
import java.util.Optional;



@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseServiceTest{
	
	@Autowired
	CourseService courseService;
	
	@MockBean
	CourseDao courseDao;
	
	@MockBean
	UserCourseDao userCourseDao;
	
	
	
	
	@Test
	public void insertUserCourseTest() {
		
		UserCourse uc = new UserCourse();
		uc.setCid(99);
		uc.setUcid(1);
		uc.setUid(1L);;
		uc.setScore(12);
		uc.setStatus("Test");
		
		Mockito.when(userCourseDao.save(uc)).thenReturn(uc);
		
		courseService.insertUserCourse(uc);
		
		Mockito.verify(userCourseDao).save(uc);
	}
	
	
	@Test
	public void insertCourseTest() {
		
		Course c = new Course();
		c.setCid(1);;
		c.setCname("Test course");
		c.setDescription("Test description");
		c.setUsers(new LinkedList<>());
		
		Mockito.when(courseDao.save(c)).thenReturn(c);
		
		courseService.insertCourse(c);
		
		Mockito.verify(courseDao).save(c);
		
		
	}
	
	
	@Test
	public void getCourseTest() {
		
		Mockito.when(courseDao.findById(2)).thenReturn(Optional.empty());
		
		courseService.getCourse(2);
		
		Mockito.verify(courseDao).findById(2);
		
	}
	
	
	@Test 
	public void getAllCoursesTest() {
		
		Mockito.when(courseDao.findAll()).thenReturn(new LinkedList<Course>());
		
		assertEquals(courseService.getAllCourses(),new LinkedList<Course>());
		
		Mockito.verify(courseDao).findAll();
		
	}
	
	
	@Test
	public void getUserCoursesTest() {
		
		Mockito.when(userCourseDao.findByUserAndCourse(1, 2)).thenReturn(new LinkedList<UserCourse>());
		
		assertEquals(courseService.getUserCourses(1, 2),new LinkedList<UserCourse>());
		
		Mockito.verify(userCourseDao).findByUserAndCourse(1, 2);
		
		
	}
	
	
	@Test
	public void getAllNotEnrolledCoursesTest() {
		
		Mockito.when(courseDao.findNotEnrolledCourses(2)).thenReturn(new LinkedList<Course>());
		
		assertEquals(courseService.getAllNotEnrolledCourses(2), new LinkedList<Course>());
		
		Mockito.verify(courseDao).findNotEnrolledCourses(2);
		
	}
	
	
	@Test
	public void getAllEnrolledCoursesTest() {
		
		Mockito.when(courseDao.findEnrolledCourses(3)).thenReturn(new LinkedList<Course>());
		
		assertEquals(courseService.getAllEnrolledCourses(3), new LinkedList<Course>());
		
		Mockito.verify(courseDao).findEnrolledCourses(3);
		
	}
	
	@Test
	public void getAllEnrolledUserCoursesTest() {
		
		Mockito.when(userCourseDao.findByUid(1L)).thenReturn(new LinkedList<UserCourse>());
		
		assertEquals(courseService.getAllEnrolledUserCourses(1L),new LinkedList<UserCourse>());
		
		Mockito.verify(userCourseDao).findByUid(1L);
		
	}
	
	
}





