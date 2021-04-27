package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Quiz;

@Repository
public interface QuizDao extends JpaRepository<Quiz, Integer>{

	//Method to find quiz details using course id
	public List<Quiz> findByCid(int cid);
}
