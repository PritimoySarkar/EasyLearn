package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Course;

@Repository
public interface CourseDao extends JpaRepository<Course, Integer> {

	//Method to find course details by courseid
	public List<Course> findCourseByCid(int cid);
	
	//Method to find enrolled courses details for a specific user
	@Query(value="select c.* from course c,user_course uc where uc.cid=c.cid and uc.uid=?1",nativeQuery=true)
	public List<Course> findEnrolledCourses(int uid);
	
	//Method to find not enrolled courses details for a specific user
	@Query(value="select * from course where cid not in (select c.cid from course c,user_course uc where uc.cid=c.cid and uc.uid=?1);",nativeQuery=true)
	public List<Course> findNotEnrolledCourses(int uid);
}
