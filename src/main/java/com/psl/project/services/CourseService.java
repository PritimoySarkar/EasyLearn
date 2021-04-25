package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Course;
import com.psl.project.repository.CourseDao;

@Service
public class CourseService {

	@Autowired
	CourseDao coursedao;
	
	public void insertCourse(Course c) {
		coursedao.save(c);
		System.out.println("Course Saved");
	}
	
	public List<Course> getAllCourses(){
		List<Course> courses = new ArrayList<Course>();
		for(Course course: coursedao.findAll()) {
			courses.add(course);
		}
		return courses;
	}
	
	public List<Course> getAllEnrolledCourses(){
		List<Course> courses = new ArrayList<Course>();
		for(Course course: coursedao.findCourseByCid(1)) {
			courses.add(course);
		}
		return courses;
	}
}
