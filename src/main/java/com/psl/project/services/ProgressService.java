package com.psl.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Progress;
import com.psl.project.repository.ProgressDao;

@Service
public class ProgressService {

	@Autowired
	ProgressDao progressDao;
	
	public void insertProgress(Progress p) {
		progressDao.save(p);
	}
	
	public List<Progress> getProgressesByUidAndLid(Long uid,int lid){
		return progressDao.findByUidAndLid(uid, lid);
	}
}
