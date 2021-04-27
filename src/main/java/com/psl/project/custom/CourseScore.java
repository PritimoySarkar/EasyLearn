package com.psl.project.custom;

//A custom class created for sending coursename,testscore and test status data  from controller to view wrapped in an object
public class CourseScore {
	private int csid;
	private String cname;
	private String status;
	private String score;
	public CourseScore() {
		super();
	}
	public CourseScore(String cname, String status, String score) {
		super();
		this.cname = cname;
		this.status = status;
		this.score = score;
	}
	
	public CourseScore(int csid, String cname, String status, String score) {
		super();
		this.csid = csid;
		this.cname = cname;
		this.status = status;
		this.score = score;
	}
	public int getCsid() {
		return csid;
	}
	public void setCsid(int csid) {
		this.csid = csid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
}
