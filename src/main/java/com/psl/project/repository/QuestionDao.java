package com.psl.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Question;

@Repository
public interface QuestionDao extends JpaRepository<Question, Integer>{

	//Method to find Question details using quiz id in sorted order according to serial no.
	public List<Question> findByQidOrderBySlnoAsc(int qid);
	
	//Method to decrease serial number of all questions after a specific serial number
	@Transactional
	@Modifying
	@Query(value="update questions set slno = slno-1 where slno>=?1 and qid=?2",nativeQuery = true)
	public void decreaseAllNextQuestions(int slno,int qid);
	
	//Method to decrease serial number of all questions after a specific serial number
	@Transactional
	@Modifying
	@Query(value="update questions set slno = slno+1 where slno>=?1 and qid=?2",nativeQuery = true)
	public void increaseAllNextQuestions(int slno,int qid);
}
