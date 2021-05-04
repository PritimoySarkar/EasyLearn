package com.psl.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Lecture;

@Repository
public interface LectureDao extends JpaRepository<Lecture, Long>{

	//Method to find lectures details using courseid in sorted order according to serial no.
	public List<Lecture> findByCidOrderBySlnoAsc(int cid);
	
	//Method to decrease serial number of all lectures after a specific serial number
	@Transactional
	@Modifying
	@Query(value="update lecture set slno = slno-1 where slno>=?1 and qid=?2",nativeQuery = true)
	public void decreaseAllNextLectures(int slno,int cid);
	
	//Method to increase serial number of all lectures after a specific serial number
	@Transactional
	@Modifying
	@Query(value="update lecture set slno = slno+1 where slno>=?1 and qid=?2",nativeQuery = true)
	public void increaseAllNextLectures(int slno,int cid);
}
