package com.psl.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.Attempt;
import com.psl.project.repository.AttemptDao;

@Service
public class AttemptService {
	@Autowired
	AttemptDao attemptDao;
	
	public void insertAttempt(Attempt a) {
		attemptDao.save(a);
	}
	
	public Optional<Attempt> getAttemptById(Long aid) {
		return attemptDao.findById(aid);
	}
	
	public List<Attempt> getAttemptsByUsercourse(int ucid){
		return attemptDao.findByUcid(ucid);
	}
	
	public List<Attempt> getAttemptsByUsercourseAndAttempt(int ucid,int attemptNo){
		return attemptDao.findByUcidAndAttemptNo(ucid, attemptNo);
	}
}
