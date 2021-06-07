package com.psl.project.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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
	private int attemptsLeft;
	private int rating;
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	@OneToMany
	@JoinColumn(name="ucid")
	private List<Attempt> attempts;
	
	public UserCourse() {
		super();
	}
	
	public UserCourse(Long uid, int cid, String status, int attemptsLeft, int rating) {
		super();
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.attemptsLeft = attemptsLeft;
		this.rating = rating;
	}

	public UserCourse(Long uid, int cid, String status, int attemptsLeft) {
		super();
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.attemptsLeft = attemptsLeft;
	}

	public UserCourse(int ucid, Long uid, int cid, String status, int attemptsLeft, List<Attempt> attempts) {
		super();
		this.ucid = ucid;
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.attemptsLeft = attemptsLeft;
		this.attempts = attempts;
	}
	public UserCourse(Long uid, int cid, String status, int attemptsLeft, List<Attempt> attempts) {
		super();
		this.uid = uid;
		this.cid = cid;
		this.status = status;
		this.attemptsLeft = attemptsLeft;
		this.attempts = attempts;
	}
	public int getAttemptsLeft() {
		return attemptsLeft;
	}
	public void setAttemptsLeft(int attemptsLeft) {
		this.attemptsLeft = attemptsLeft;
	}
	public List<Attempt> getAttempts() {
		return attempts;
	}
	public void setAttempts(List<Attempt> attempts) {
		this.attempts = attempts;
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
		
}
