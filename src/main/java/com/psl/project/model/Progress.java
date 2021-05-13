package com.psl.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "progress")
public class Progress {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long pid;
	private Long uid;
	private int lid;
	private String status;
	
	public Progress() {
		super();
	}
	public Progress(Long pid, Long uid, int lid, String status) {
		super();
		this.pid = pid;
		this.uid = uid;
		this.lid = lid;
		this.status = status;
	}
	public Progress(Long uid, int lid, String status) {
		super();
		this.uid = uid;
		this.lid = lid;
		this.status = status;
	}
	public Long getPid() {
		return pid;
	}
	public void setPid(Long pid) {
		this.pid = pid;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
