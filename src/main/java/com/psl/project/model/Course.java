package com.psl.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="course")
public class Course {
	
	@Id
	private int cid;
	private String cname;
	private String description;
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Course() {
		super();
	}
	public Course(int cid, String cname, String description) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.description = description;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Course(String cname, String description) {
		super();
		this.cname = cname;
		this.description = description;
	}
	
	
}
