package com.psl.project.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Course;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.CourseService;
import com.psl.project.services.UserService;

@Controller
public class CourseController {

	@Autowired
	CourseService courseservice;

	@Autowired
	private UserService userService;

	// To show all available Courses
	@GetMapping(value = "/allcourses")
	public String showAllCourses(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		// Accessing Principal object to get logged in user's username
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			// Get the user details using username retrieved from auto-submitted form
			User user = userService.findByUsername(((UserDetails) principal).getUsername());

			// Storing userid to Session
			session.setAttribute("userid", user.getId().toString());
			
			// Retrieving enrolled courses by that user using userid from user object
			List<Course> enrolledCourses = courseservice.getAllEnrolledCourses(user.getId().intValue());

			// Adding enrolled courses details to request
			request.setAttribute("enrolledCourses", enrolledCourses);

			// Retrieving not enrolled courses by that user using userid got from the cookie
			List<Course> notEnrolledCourses = courseservice.getAllNotEnrolledCourses(user.getId().intValue());

			// Adding not enrolled courses details to request
			request.setAttribute("notEnrolledCourses", notEnrolledCourses);
			
			//Adding user role to request
			request.setAttribute("userRole", user.getRoles().get(0).getName());
		}
		return "user/allCourses";
	}

	// To show only enrolled courses by the user
	@GetMapping(value = "/enrolledcourses")
	public String showEnrolledCourse(HttpServletRequest request, HttpSession session) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			// Retrieving enrolled courses by that user using userid got from session
			List<Course> enrolledCourses = courseservice
					.getAllEnrolledCourses(Integer.parseInt(session.getAttribute("userid").toString()));
			request.setAttribute("courses", enrolledCourses);
		}
		return "user/enrolledCourses";
	}
	
	// To show only enrolled courses by the user
		@GetMapping(value = "user/enrolledcourses")
		public String showEnrolledCourseUser(HttpServletRequest request, HttpSession session) {
			// Checking if userid session is expired or not
			if (session.getAttribute("userid") == null) {
				return "redirect:/";
			} else {
				// Retrieving enrolled courses by that user using userid got from session
				List<Course> enrolledCourses = courseservice
						.getAllEnrolledCourses(Integer.parseInt(session.getAttribute("userid").toString()));
				request.setAttribute("courses", enrolledCourses);
			}
			return "user/enrolledCourses";
		}

	// To enroll a course by the user
	@PostMapping(value = "/enroll")
	public String enrollCourse(HttpServletRequest request, @RequestParam Map<String, String> response,HttpSession session) {
		// Checking if userid session is expired or not
		if (session.getAttribute("userid") == null) {
			return "redirect:/";
		} else {
			// Checking if the user has enrolled in that course already
			List<UserCourse> userCourses = courseservice.getUserCourses(Integer.parseInt(session.getAttribute("userid").toString()), Integer.parseInt(response.get("cid")));
			if (userCourses.isEmpty()) {
				// Enrolling the course for that user only if the course was not enrolled by
				// that user before
				UserCourse uc = new UserCourse(Long.parseLong(session.getAttribute("userid").toString()), Integer.parseInt(response.get("cid")),"Enrolled",5);
				courseservice.insertUserCourse(uc);
			}
		}
		return "redirect:/enrolledcourses";
	}
	
	@GetMapping(value="/inall")
	public String insertAllCourses(Model model,HttpServletRequest request) throws IOException, IllegalStateException {
		System.out.println("Working in all");
		List<Long> uid = new ArrayList<Long>(); 
		List<Integer> cid = new ArrayList<Integer>();
		List<Integer> rating = new ArrayList<Integer>();
		try  
		{  
			//the file to be opened for reading  
			FileInputStream uidStream=new FileInputStream("D:\\uid.txt");
			FileInputStream cidStream=new FileInputStream("D:\\cid.txt");
			FileInputStream ratingStream=new FileInputStream("D:\\rating.txt");
			Scanner sc=new Scanner(uidStream,"UTF-8");    //file to be scanned
			Scanner sc2=new Scanner(cidStream,"UTF-8");
			Scanner sc3=new Scanner(ratingStream,"UTF-8");
			//returns true if there is another line to read
			int count=0;
			while(sc.hasNextLine())  
			{  
				count+=1;
				uid.add(Long.parseLong(sc.nextLine()));
			}
			System.out.println(count);
			count=0;
			while(sc2.hasNextLine())  
			{  
				count+=1;
				cid.add(Integer.parseInt(sc2.nextLine()));
			}
			System.out.println(count);
			count=0;
			while(sc3.hasNextLine())  
			{  
				count+=1;
				rating.add(Integer.parseInt(sc3.nextLine()));
			}
			System.out.println(count);
			
			for(int i=0;i<uid.size();i++) {
				List<UserCourse> existing = courseservice.getUserCourses(uid.get(i).intValue(),cid.get(i));
				if(existing.size()==0) {
					UserCourse temp = new UserCourse(uid.get(i),cid.get(i),"Enrolled",5,rating.get(i));
					courseservice.insertUserCourse(temp);
					System.out.println("inserted: "+i);
				}
				//System.out.println("inserted: "+i);
				//courseService.insertCourse(temp);
			}
			sc.close();     //closes the scanner  
			sc2.close();     //closes the scanner
			sc3.close();     //closes the scanner
		}  
		catch(IOException e)  
		{  
			e.printStackTrace();  
		}      
		

		return "redirect:/";
	}
	
}
