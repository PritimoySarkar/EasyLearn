package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.UserCourse;

@Repository
public interface UserCourseDao extends JpaRepository<UserCourse, Long>{
	public List<UserCourse> findByUid(Long uid);
	
	//Method to find usercours details using userid and courseid
	@Query(value="select * from user_course where uid=?1 and cid=?2",nativeQuery=true)
	public List<UserCourse> findByUserAndCourse(int uid,int cid);
}
