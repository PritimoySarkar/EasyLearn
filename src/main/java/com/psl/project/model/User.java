package com.psl.project.model;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name="uid")
    private Long id;

    private String username;
    private String password;
    private String profilePicture;

    @Transient
    private String passwordConfirm;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
    		name="user_roles",
    				joinColumns = { @JoinColumn(name = "users_id") }, 
    		        inverseJoinColumns = { @JoinColumn(name = "roles_id") }
    		)
    private List<Role> roles;

    @ManyToMany(mappedBy = "users")
    private List<Course> courses = new ArrayList<Course>(); 
    
    public User() {
		super();
	}

	public User(Long id, String username, String password, String passwordConfirm, List<Role> roles,
			List<Course> courses) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.roles = roles;
		this.courses = courses;
	}

	public User(Long id, String username, String password, String profilePicture, String passwordConfirm,
			List<Role> roles, List<Course> courses) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.profilePicture = profilePicture;
		this.passwordConfirm = passwordConfirm;
		this.roles = roles;
		this.courses = courses;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
