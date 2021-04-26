package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Course;
import com.psl.project.model.UserCourse;
import com.psl.project.repository.CourseDao;
import com.psl.project.repository.UserCourseDao;

@Service
public class CourseService {

	@Autowired
	CourseDao coursedao;
	
	@Autowired
	UserCourseDao userCourse;
	
	public void insertUserCourse(UserCourse uc) {
		userCourse.save(uc);
		System.out.println("Course enrolled for the user");
	}
	
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
	
	public List<UserCourse> getUserCourses(int uid,int cid){
		//List<UserCourse> userCourses = new ArrayList<UserCourse>();
		List<UserCourse> userCourses = userCourse.findByUserAndCourse(uid, cid);
		return userCourses;
	}
	
	public List<Course> getAllEnrolledCourses(int uid){
		List<Course> courses = new ArrayList<Course>();
		for(Course course: coursedao.findEnrolledCourses(uid)) {
			courses.add(course);
		}
		return courses;
	}
}
