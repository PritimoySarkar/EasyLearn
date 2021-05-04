package com.psl.project.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Course;
import com.psl.project.services.CourseService;

@Controller
@RequestMapping("/admin")
public class AdminCourseController {
	
	@Autowired
	CourseService courseService;
	
	@PostMapping(value="/courses")
	public String saveAdminCourses(@ModelAttribute("newCourse") Course course,HttpServletRequest request) {
		//Saving new course in the database
        courseService.insertCourse(course);
        //request.setAttribute("courses", courseService.getAllCourses());
		return "redirect:/admin/courses";
	}
	
	@PostMapping(value="/course/delete/{cid}")
	public String removeAdminCourses(@ModelAttribute("newCourse") Course course,@RequestParam Map<String,String> response) {
		//Deleting course in the database
		courseService.deleteCourse(Integer.parseInt(response.get("cid")));
		return "redirect:/admin/courses";
	}

}
