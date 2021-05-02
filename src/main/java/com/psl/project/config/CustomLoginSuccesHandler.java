package com.psl.project.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

@Configuration
public class CustomLoginSuccesHandler extends SimpleUrlAuthenticationSuccessHandler{

	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response,Authentication authentication) throws IOException{
		
		String targetUrl=determineTargetUrl(authentication);
		if(response.isCommitted()) {
			return;
		}
		RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}
	
	protected String determineTargetUrl(Authentication authentication) {
		String url="/admin?error=true";
		
		Collection<? extends GrantedAuthority> authoritires = authentication.getAuthorities();
		List<String> roles = new ArrayList<String>();
		for(GrantedAuthority g: authoritires) {
			roles.add(g.getAuthority());
		}
		
		if(roles.contains("USER")) {
			url="/";
		}
		else if(roles.contains("ADMIN")) {
			url="/admin/home";
		}
		return url;
	}
}
