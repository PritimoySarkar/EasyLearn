package com.psl.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Lecture;

@Repository
public interface LectureDao extends JpaRepository<Lecture, Integer>{

	//Method to find lectures details using courseid in sorted order according to serial no.
	public List<Lecture> findByCidOrderBySlnoAsc(int cid);
	
	//Method to count total lectures of a course
	@Query(value="SELECT count(*) FROM lecture where cid=?1",nativeQuery = true)
	public int getLectureCountByCid(int cid);
	
	//Method to get count of in progress leture
	@Query(value="SELECT count(*) FROM progress where uid=?1 and lid in (SELECT lid FROM lms.lecture where cid =?2) and status = 'Progress'",nativeQuery = true)
	public int getProgressLectureCountByCid(Long uid,int cid);
	
	//Method to get count of completed leture
	@Query(value="SELECT count(*) FROM progress where uid=?1 and lid in (SELECT lid FROM lms.lecture where cid =?2) and status = 'Completed'",nativeQuery = true)
	public int getCompletedLectureCountByCid(Long uid,int cid);
		
	//Method to get count of marked for review leture
	@Query(value="SELECT count(*) FROM progress where uid=?1 and lid in (SELECT lid FROM lms.lecture where cid =?2) and status = 'Review'",nativeQuery = true)
	public int getReviewLectureCountByCid(Long uid,int cid);
	
	//Method to decrease serial number of all lectures after a specific serial number
	@Transactional
	@Modifying
	@Query(value="update lecture set slno = slno-1 where slno>=?1 and cid=?2",nativeQuery = true)
	public void decreaseAllNextLectures(int slno,int cid);
	
	//Method to increase serial number of all lectures after a specific serial number
	@Transactional
	@Modifying
	@Query(value="update lecture set slno = slno+1 where slno>=?1 and cid=?2",nativeQuery = true)
	public void increaseAllNextLectures(int slno,int cid);
}
