package com.psl.project.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name="course")
public class Course {
	
	@Id
	private int cid;
	private String cname;
	private String description;
	
	@ManyToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinTable(name="user_course",joinColumns = @JoinColumn(name="cid"),inverseJoinColumns = @JoinColumn(name="uid"))
	private List<User> users = new ArrayList<User>();
	
	
	public Course(int cid, String cname, String description, List<User> users) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.description = description;
		this.users = users;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
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
