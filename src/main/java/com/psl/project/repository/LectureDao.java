package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Lecture;

@Repository
public interface LectureDao extends JpaRepository<Lecture, Long>{

//	@Query("SELECT * FROM lms.lecture where cid=?1")
	public List<Lecture> findByCid(int cid);
}
