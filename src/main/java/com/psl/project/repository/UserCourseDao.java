package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.UserCourse;

@Repository
public interface UserCourseDao extends JpaRepository<UserCourse, Integer>{
	public List<UserCourse> findByUid(Long uid);
	
	//Method to find usercours details using userid and courseid
	@Query(value="select * from user_course where uid=?1 and cid=?2",nativeQuery=true)
	public List<UserCourse> findByUserAndCourse(int uid,int cid);
	
	//Method to get count of passed tests by a user
	@Query(value="SELECT count(*) FROM user_course where uid=?1 and status = 'Passed'",nativeQuery=true)
	public int findPassedQuizzesByUser(Long uid);
	
	//Method to get count of passed tests by a user
	@Query(value="SELECT count(*) FROM user_course where uid=?1 and status = 'Failed'",nativeQuery=true)
	public int findFailedQuizzesByUser(Long uid);
}
