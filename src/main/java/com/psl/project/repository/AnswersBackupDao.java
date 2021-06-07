package com.psl.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.AnswersBackup;

@Repository
public interface AnswersBackupDao extends JpaRepository<AnswersBackup, Long>{

	public List<AnswersBackup> findAnswersBackupByAid(Long aid);
	
	public List<AnswersBackup> findAnswersBackupByAidAndQqid(Long aid,int qqid);
	
	//Method to delete temporary attempts
	@Transactional
	public void deleteByAid(Long aid);
}
