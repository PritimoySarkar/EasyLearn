package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Course;

@Repository
public interface CourseDao extends JpaRepository<Course, Integer> {

	//@Query("from Course where cid=:id")
	//@Query("from Course c,UserCourse uc,User u where uc.cid=c.cid and uc.uid=u.uid and uid=:id")
	public List<Course> findCourseByCid(int cid);
	
	@Query(value="select c.* from course c,user_course uc where uc.cid=c.cid and uc.uid=?1",nativeQuery=true)
	public List<Course> findEnrolledCourses(int uid);
}
