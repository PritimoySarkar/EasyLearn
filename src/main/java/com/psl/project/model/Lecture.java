package com.psl.project.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="lecture")
public class Lecture {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lid;
	private String lname;
	private String url;
	private int slno;
	private int cid;
	
	@ManyToMany(mappedBy = "lectures")
	private List<User> users;
	
	public Lecture() {
		super();
	}
	public Lecture(String lname, String url, int slno, int cid) {
		super();
		this.lname = lname;
		this.url = url;
		this.slno = slno;
		this.cid = cid;
	}
	public int getLid() {
		return lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
}
