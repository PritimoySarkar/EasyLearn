package com.psl.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="answers_backup")
public class AnswersBackup {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long abid;
	private Long aid;
	private int qqid;
	private String answer;
	
	public AnswersBackup() {
		super();
	}
	public AnswersBackup(Long abid, Long aid, int qqid, String answer) {
		super();
		this.abid = abid;
		this.aid = aid;
		this.qqid = qqid;
		this.answer = answer;
	}
	public Long getAbid() {
		return abid;
	}
	public void setAbid(Long abid) {
		this.abid = abid;
	}
	public Long getAid() {
		return aid;
	}
	public void setAid(Long aid) {
		this.aid = aid;
	}
	public int getQqid() {
		return qqid;
	}
	public void setQqid(int qqid) {
		this.qqid = qqid;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
