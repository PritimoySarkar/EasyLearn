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
@Table(name="quiz")
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int qid;
	private String qname;
	private int total_score;
	private int cid;
	
	@OneToMany
	@JoinColumn(name="qid")
	private List<Question> questions;
	
	public Quiz(int qid, String qname, int total_score, int cid, List<Question> questions) {
		super();
		this.qid = qid;
		this.qname = qname;
		this.total_score = total_score;
		this.cid = cid;
		this.questions = questions;
	}
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public Quiz() {
		super();
	}
	public Quiz(int qid, String qname, int total_score, int cid) {
		super();
		this.qid = qid;
		this.qname = qname;
		this.total_score = total_score;
		this.cid = cid;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
}
