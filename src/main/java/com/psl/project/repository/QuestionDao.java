package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Question;

@Repository
public interface QuestionDao extends JpaRepository<Question, Long>{

	//Method to find Question details using quiz id in sorted order according to serial no.
	public List<Question> findByQidOrderBySlnoAsc(int qid);
}
