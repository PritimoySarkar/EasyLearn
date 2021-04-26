package com.psl.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_course")
public class UserCourse {

	@Id
	private int ucid;
	private int uid;
	private int cid;
	private String status;
	private int score;
	
	public UserCourse() {
		super();
	}
	
	public UserCourse(int uid, int cid, String status, int score) {
		super();
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.score = score;
	}

	public UserCourse(int ucid, int uid, int cid, String status, int score) {
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
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
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
