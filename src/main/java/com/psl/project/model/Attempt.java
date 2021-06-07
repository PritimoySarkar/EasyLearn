package com.psl.project.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="attempts")
public class Attempt {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long aid;
	private int ucid;
	private int attemptNo;
	private int score;
	private String status;
	private Timestamp timestamp;
	
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	@OneToMany
	@JoinColumn(name="aid")
	private List<AnswersBackup> answerBackups;
	
	public List<AnswersBackup> getAnswerBackups() {
		return answerBackups;
	}
	public void setAnswerBackups(List<AnswersBackup> answerBackups) {
		this.answerBackups = answerBackups;
	}
	public Attempt(Long aid, int ucid, int attemptNo, int score, String status, List<AnswersBackup> answerBackups) {
		super();
		this.aid = aid;
		this.ucid = ucid;
		this.attemptNo = attemptNo;
		this.score = score;
		this.status = status;
		this.answerBackups = answerBackups;
	}
	public Attempt() {
		super();
	}public Attempt(int ucid, int attemptNo, int score, String status) {
		super();
		this.ucid = ucid;
		this.attemptNo = attemptNo;
		this.score = score;
		this.status = status;
	}

	public Attempt(Long aid, int ucid, int attemptNo, int score, String status) {
		super();
		this.aid = aid;
		this.ucid = ucid;
		this.attemptNo = attemptNo;
		this.score = score;
		this.status = status;
	}
	public Long getAid() {
		return aid;
	}
	public void setAid(Long aid) {
		this.aid = aid;
	}
	public int getUcid() {
		return ucid;
	}
	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	public int getAttemptNo() {
		return attemptNo;
	}
	public void setAttemptNo(int attemptNo) {
		this.attemptNo = attemptNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Attempt(int ucid, int attemptNo, int score, String status, Timestamp timestamp) {
		super();
		this.ucid = ucid;
		this.attemptNo = attemptNo;
		this.score = score;
		this.status = status;
		this.timestamp = timestamp;
	}
	
}
