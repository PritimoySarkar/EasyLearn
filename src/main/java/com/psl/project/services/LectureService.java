package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Lecture;
import com.psl.project.repository.LectureDao;


@Service
public class LectureService {

	@Autowired
	LectureDao lecturedao;
	
	//Method to get all lectures details of a course using courseid
	public List<Lecture> getAllLectures(int cid){
		List<Lecture> lectures = new ArrayList<Lecture>();
		for(Lecture lecture: lecturedao.findByCidOrderBySlnoAsc(cid)) {
			lectures.add(lecture);
		}
		return lectures;
	}
	
	//Method to get all lectures details of a course using courseid
		public Optional<Lecture> getLectures(int lid){
			Optional<Lecture> lecture = lecturedao.findById(lid);
			return lecture;
		}
	
	//Insert New Lecture
	public void insertLecture(Lecture lecture) {
		lecturedao.save(lecture);
	}
	
	//Remove Lecture
	public void removeLecture(int lid) {
		lecturedao.deleteById(lid);
	}
	
	//Method to increase serial number of all next lectures
	public void syncLecturesUp(int slno,int cid) {
		lecturedao.increaseAllNextLectures(slno, cid);
	}
	
	//Method to decrease serial number of all next lectures
	public void syncLecturesDown(int slno,int cid) {
		lecturedao.decreaseAllNextLectures(slno, cid);
	}
}
