package com.psl.project.services;


import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.LinkedList;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.GrantedAuthority;

import com.psl.project.repository.UserRepository;
import com.psl.project.model.User;
import com.psl.project.model.Role;
import com.psl.project.model.Course;
import java.util.HashSet;
//import java.util.LinkedList;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserDetailsServiceImplTest{
	
	
	@Autowired 
	UserDetailsServiceImpl userDetailsServiceImpl;
	
	@MockBean
	UserRepository userRepository;
	
	
	@Test
	public void loadUserByUsernameTest() {
		User u = new User(1L,"TestUserName","TestPassword","TestPasswordConfirm",new HashSet<Role>(),new LinkedList<Course>());
		Mockito.when(userRepository.findByUsername("TestUserName")).thenReturn(u);
		
		UserDetails ud = new org.springframework.security.core.userdetails.User("TestUserName", "TestPassword", new HashSet<GrantedAuthority>());
		
		assertEquals(userDetailsServiceImpl.loadUserByUsername("TestUserName"),ud);
		
		Mockito.verify(userRepository).findByUsername("TestUserName");
	}
	
}

