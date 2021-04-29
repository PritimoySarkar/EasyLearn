package com.psl.project.services;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Ignore;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;



@RunWith(SpringRunner.class)
@SpringBootTest
public class SecurityServiceImplTest{
	
	@Autowired
	SecurityServiceImpl securityServiceImpl;
	
	@Autowired 
	UserDetailsService userDetailsService;
	
	@MockBean
	UserDetails ud;
	
	@MockBean
	SecurityContext securityContext;
	
	@MockBean
	Authentication authentication;
	
	@MockBean
	SecurityContextHolder securityContextHolder;
	
	//@MockBean
	
	
	
	@Test
	public void findLoggedInUserTest() {
		
		Mockito.when(SecurityContextHolder.getContext()).thenReturn(securityContext);
		Mockito.when(securityContext.getAuthentication()).thenReturn(authentication);
		Mockito.when(authentication.getDetails()).thenReturn(ud);
		
		Mockito.when(ud.getUsername()).thenReturn("TestName");
		
		assertEquals(securityServiceImpl.findLoggedInUsername(),"TestName");
		
		Mockito.verify(SecurityContextHolder.getContext().getAuthentication()).getDetails();
		Mockito.verify(ud).getUsername();
		
		
		
	}
	
}