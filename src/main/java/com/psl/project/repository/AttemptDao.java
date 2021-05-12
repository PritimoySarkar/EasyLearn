package com.psl.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.psl.project.model.Attempt;

@Repository
public interface AttemptDao extends JpaRepository<Attempt, Long>{
	public List<Attempt> findByUcid(int ucid);
}
