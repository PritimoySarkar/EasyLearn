package com.psl.project.services;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Optional;
import java.util.HashSet;

import com.psl.project.repository.UserRepository;
import com.psl.project.repository.RoleRepository;
import com.psl.project.model.Course;
import com.psl.project.model.Role;
import com.psl.project.model.User;


@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceImplTest{
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@MockBean
	UserRepository userRepository;
	
	@MockBean
	RoleRepository roleRepository;
	
	
	@Test
	public void saveTest() {
		
		User u = new User(1L,"TestUserName","TestPassword","TestPasswordConfirm",new HashSet<Role>(),new LinkedList<Course>());
		Mockito.when(userRepository.save(u)).thenReturn(u);
		userServiceImpl.save(u);
		
		Mockito.verify(userRepository).save(u);
		
	}
	
	
	@Test
	public void findByUsernameTest() {
		
		User u = new User(1L,"TestUserName","TestPassword","TestPasswordConfirm",new HashSet<Role>(),new LinkedList<Course>());
		Mockito.when(userRepository.findByUsername("TestUserName")).thenReturn(u);
		
		assertEquals(userServiceImpl.findByUsername("TestUserName"),u);
		
		Mockito.verify(userRepository).findByUsername("TestUserName");
		
	}
	
	
	@Test
	public void findByIDTest() {
		
		Mockito.when(userRepository.findById(1L)).thenReturn(Optional.empty());
		
		assertEquals(userServiceImpl.findByID(1L),Optional.empty());
		
		Mockito.verify(userRepository).findById(1L);
		
	}
	
	
}