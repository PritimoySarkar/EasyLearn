package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Progress;

@Repository
public interface ProgressDao extends JpaRepository<Progress, Long>{
	
	public List<Progress> findByUidAndLid(Long uid,int lid);
}
