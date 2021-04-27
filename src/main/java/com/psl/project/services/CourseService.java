package com.psl.project.services;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
	
	//Method to insert new userCourse in the database
	public void insertUserCourse(UserCourse uc) {
		userCourse.save(uc);
		System.out.println("Course enrolled for the user");
	}
	
	//Method to insert new Course in the database
	public void insertCourse(Course c) {
		coursedao.save(c);
		System.out.println("Course Saved");
	}
	
	//Method to get Course from the database using courseid
	public Optional<Course> getCourse(int cid) {
		Optional<Course> course = coursedao.findById(cid);
		return course;
	}
	
	//Method to get all the course details
	public List<Course> getAllCourses(){
		List<Course> courses = new ArrayList<Course>();
		for(Course course: coursedao.findAll()) {
			courses.add(course);
		}
		return courses;
	}
	
	//Method to get userCourse from userid and courseid
	public List<UserCourse> getUserCourses(int uid,int cid){
		List<UserCourse> userCourses = userCourse.findByUserAndCourse(uid, cid);
		return userCourses;
	}
	
	//Method to get all not enrolled courses of an user
		public List<Course> getAllNotEnrolledCourses(int uid){
			List<Course> courses = new ArrayList<Course>();
			for(Course course: coursedao.findNotEnrolledCourses(uid)) {
				courses.add(course);
			}
			return courses;
		}
	
	//Method to get all enrolled courses of an user
	public List<Course> getAllEnrolledCourses(int uid){
		List<Course> courses = new ArrayList<Course>();
		for(Course course: coursedao.findEnrolledCourses(uid)) {
			courses.add(course);
		}
		return courses;
	}
	
	//Method to get enrolled usercourse details using userid 
	public List<UserCourse> getAllEnrolledUserCourses(Long uid){
		List<UserCourse> userCourses = userCourse.findByUid(uid);
		return userCourses;
	}
}
