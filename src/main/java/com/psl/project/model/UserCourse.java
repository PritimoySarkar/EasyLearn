package com.psl.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_course")
public class UserCourse {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ucid;
	private Long uid;
	private int cid;
	private String status;
	private int score;
	
	public UserCourse() {
		super();
	}
	
	public UserCourse(Long uid, int cid, String status, int score) {
		super();
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.score = score;
	}

	public UserCourse(int ucid, Long uid, int cid, String status, int score) {
		super();
		this.ucid = ucid;
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.score = score;
	}
	public int getUcid() {
		return ucid;
	}
	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
		
}
