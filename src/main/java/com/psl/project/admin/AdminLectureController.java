package com.psl.project.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Lecture;
import com.psl.project.services.CourseService;
import com.psl.project.services.LectureService;

@Controller
@RequestMapping("/admin")
public class AdminLectureController {
	@Autowired
	CourseService courseService;
	
	@Autowired
	LectureService lectureService;

	@PostMapping(value="/lectures/{cid}")
	public String showAdminCourseLectures(Model model,HttpServletRequest request,@PathVariable("cid") int cid) {
		request.setAttribute("cid", cid);
		request.setAttribute("courseName", courseService.getCourse(cid).get().getCname());
		model.addAttribute("newLecture",new Lecture());
		request.setAttribute("lectures", lectureService.getAllLectures(cid));
		return "admin/courseLectures";
	}
	
	@PostMapping(value="/add/lecture")
	public String addAdminLectures(@ModelAttribute("newLecture") Lecture lecture,HttpServletRequest request) {
		int totalLectures = lectureService.getAllLectures(lecture.getCid()).size();
		lecture.setSlno(totalLectures+1);
		lectureService.insertLecture(lecture);
		request.setAttribute("lectures", lectureService.getAllLectures(lecture.getCid()));
		return "admin/courseLectures";
	}
	
	@PostMapping(value="/remove/lecture/{cid}/{lid}")
	public String removeAdminLecture(Model model,HttpServletRequest request,
			@PathVariable("cid") int cid,
			@PathVariable("lid") int lid,
			@RequestParam Map<String, String> response) {
		System.out.println("Lecture Id: "+response.get("lid"));
		
		model.addAttribute("newLecture",new Lecture());
		request.setAttribute("cid", cid);
		request.setAttribute("courseName", courseService.getCourse(cid).get().getCname());
		request.setAttribute("lectures", lectureService.getAllLectures(cid));
		return "admin/courseLectures";
	}
}
