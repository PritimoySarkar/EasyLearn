package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Question;

@Repository
public interface QuestionDao extends JpaRepository<Question, Long>{

	public List<Question> findByQid(int qid);
}
