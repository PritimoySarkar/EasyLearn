package com.psl.project.services;

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
	UserCourseDao userCourseDao;
	
	//Method to insert new userCourse in the database
	public void insertUserCourse(UserCourse uc) {
		userCourseDao.save(uc);
	}
	
	//Method to insert new Course in the database
	public void insertCourse(Course c) {
		coursedao.save(c);
	}
	
	//Method to delete a COurse in the database
	public void deleteCourse(int cid) {
		coursedao.deleteById(cid);
	}
	
	//Method to get Course from the database using courseid
	public Optional<Course> getCourse(int cid) {
		Optional<Course> course = coursedao.findById(cid);
		return course;
	}
	
	//Method to get Course from the database using courseid
		public Optional<UserCourse> getUserCourse(int ucid) {
			Optional<UserCourse> userCourse = userCourseDao.findById(ucid);
			return userCourse;
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
		List<UserCourse> userCourses = userCourseDao.findByUserAndCourse(uid, cid);
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
		List<UserCourse> userCourses = userCourseDao.findByUid(uid);
		return userCourses;
	}
}
