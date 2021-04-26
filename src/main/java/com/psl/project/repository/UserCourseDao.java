package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.UserCourse;

@Repository
public interface UserCourseDao extends JpaRepository<UserCourse, Long>{
	public List<UserCourse> findByUid(int uid);
}
