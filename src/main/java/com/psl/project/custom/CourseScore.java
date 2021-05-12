package com.psl.project.custom;

//A custom class created for sending coursename,testscore and test status data  from controller to view wrapped in an object
public class CourseScore {
	private int csid;
	private int ucid;
	private String cname;
	private String status;
	public CourseScore() {
		super();
	}
	public CourseScore(String cname, String status) {
		super();
		this.cname = cname;
		this.status = status;
	}
	
	public int getUcid() {
		return ucid;
	}
	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	
	public CourseScore(int ucid, String cname, String status) {
		super();
		this.ucid = ucid;
		this.cname = cname;
		this.status = status;
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
}
