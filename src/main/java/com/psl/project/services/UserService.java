package com.psl.project.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.User;
import com.psl.project.repository.UserDao;

@Service
public class UserService {
	
	@Autowired
	UserDao dao;
	
	public void insertUser(User u) {
		//Call Dao insert method
		dao.save(u);
		System.out.println("Dao will save the user to DB");
	}
	
	public List<User> getAllUsers(){
		List<User> users = new ArrayList<User>();
		for(User user: dao.findAll()) {
			users.add(user);
			//System.out.println("User fetched: "+user);
		}
		return users;
	}
}
