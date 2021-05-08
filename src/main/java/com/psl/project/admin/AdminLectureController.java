package com.psl.project.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//Adding all attributes in model and request to render the page with proper details
		request.setAttribute("cid", cid);
		request.setAttribute("courseName", courseService.getCourse(cid).get().getCname());
		model.addAttribute("newLecture",new Lecture());
		request.setAttribute("lectures", lectureService.getAllLectures(cid));
		return "admin/courseLectures";
	}
	
	//Edit Lecture
	@PostMapping(value="/edit/lecture/{cid}")
	public String editAdminCourseLectures(@RequestParam Map<String, String> responses,Model model,HttpServletRequest request,HttpServletResponse response,@PathVariable("cid") int cid) {
		Lecture lecture = lectureService.getLectures(Integer.parseInt(responses.get("editLid"))).get();
		
		//Set updated value from response to lecture object 
		lecture.setLname(responses.get("editName"));
		lecture.setUrl(responses.get("editUrl"));
		
		//Checking if Serial number was changed
		if(lecture.getSlno()!=Integer.parseInt(responses.get("editSlno"))) {
			int oldSlno = lecture.getSlno();
			
			//Decreasing all next lecture's serial number by 1
			lectureService.syncLecturesDown(oldSlno, cid);
			
			//Increasing all next lecture's serial number by 1
			lectureService.syncLecturesUp(Integer.parseInt(responses.get("editSlno")), cid);
			
			//Changing the serial number in the lecture object
			lecture.setSlno(Integer.parseInt(responses.get("editSlno")));
		}
		//Inserting updated lecture object in the database
		lectureService.insertLecture(lecture);
		
		//Adding all attributes in model and request to render the page with proper details
		request.setAttribute("cid", cid);
		request.setAttribute("courseName", courseService.getCourse(cid).get().getCname());
		model.addAttribute("newLecture",new Lecture());
		request.setAttribute("lectures", lectureService.getAllLectures(cid));
		return "admin/courseLectures";
	}
	
	@PostMapping(value="/add/lecture")
	public String addAdminLectures(Model model,@ModelAttribute("newLecture") Lecture lecture,HttpServletRequest request) {
		//Increasing all next lecture's serial number by 1
		lectureService.syncLecturesUp(lecture.getSlno(), lecture.getCid());
		
		//Insert the lecture in the database
		lectureService.insertLecture(lecture);
		
		//Setting model and lecture attribute to render the page again
		request.setAttribute("cid", lecture.getCid());
		model.addAttribute("newLecture",new Lecture());
		request.setAttribute("lectures", lectureService.getAllLectures(lecture.getCid()));
		return "admin/courseLectures";
	}
	
	@PostMapping(value="/remove/lecture/{cid}/{lid}")
	public String removeAdminLecture(Model model,HttpServletRequest request,
			@PathVariable("cid") int cid,
			@PathVariable("lid") int lid,
			@RequestParam Map<String, String> response) {
		//Taking backup of the serial number
		int serialNo = Integer.parseInt(response.get("slno"));
		
		//Removing the lecture
		lectureService.removeLecture(lid);
		
		//Decreasing all next lecture's serial number by 1
		lectureService.syncLecturesDown(serialNo, cid);
		
		
		//Adding all attributes in model and request to render the page with proper details
		model.addAttribute("newLecture",new Lecture());
		request.setAttribute("cid", cid);
		request.setAttribute("courseName", courseService.getCourse(cid).get().getCname());
		request.setAttribute("lectures", lectureService.getAllLectures(cid));
		return "admin/courseLectures";
	}
}
