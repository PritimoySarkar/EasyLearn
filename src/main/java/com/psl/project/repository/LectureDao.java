package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Lecture;

@Repository
public interface LectureDao extends JpaRepository<Lecture, Long>{

	//Method to find lectures details using courseid in sorted order according to serial no.
	public List<Lecture> findByCidOrderBySlnoAsc(int cid);
}
