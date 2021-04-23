package com.psl.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	@Id
	private int uid;
	private String name;
	private String email;
	private String password;
	private String profilePicture;
	
	//Constructors
	
	public User(String name, String email, String password, String profilePicture) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.profilePicture = profilePicture;
	}
	public User() {
		super();
	}

	//Getters and Setters
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	
	
}
