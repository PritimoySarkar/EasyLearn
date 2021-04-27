package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;

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
}
