package com.psl.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psl.project.model.Course;
import com.psl.project.model.Lecture;
import com.psl.project.model.Question;
import com.psl.project.model.Quiz;
import com.psl.project.services.CourseService;
import com.psl.project.services.LectureService;
import com.psl.project.services.QuestionService;
import com.psl.project.services.QuizService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	QuizService quizService;

	//All Get Mappings
//	@GetMapping(value="/admin")
//	public String showAdminLogin() {
//		System.out.println("opening admin login");
//		return "admin/login";
//	}
	
	@GetMapping({"/home",""})
	public String showAdminHome() {
		return "admin/index";
	}
	
	@GetMapping(value="/courses")
	public String showAdminCourses(Model model,HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		model.addAttribute("newCourse",new Course());
		return "admin/courses";
	}
	
	@GetMapping(value="/quizzes")
	public String showAdminQuizzes(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		return "admin/quizzes";
	}
	
	@GetMapping(value="/lectures")
	public String showAdminLectures(HttpServletRequest request) {
		request.setAttribute("courses", courseService.getAllCourses());
		return "admin/lectures";
	}
	
	//All Post Mappings
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
	
	@PostMapping(value="/quiz/add/{cid}")
	public String addAdminQuizzes(Model model,HttpServletRequest request,@PathVariable("cid") int cid) {
		model.addAttribute("newLecture",new Quiz());
		model.addAttribute("newQuestion",new Question());
		List<Quiz> quiz = quizService.getQuiz(cid);
		String qname=courseService.getCourse(cid).get().getCname();
		int qid;
		if(quiz.size()==0) {
			Quiz tempQuiz = new Quiz();
			tempQuiz.setCid(cid);
			tempQuiz.setQname(qname);
			tempQuiz.setTotal_score(0);
			quizService.insertQuiz(tempQuiz);
			qid = quizService.getQuiz(cid).get(0).getQid();
			request.setAttribute("quizName", quizService.getQuiz(cid).get(0).getQname());
		}
		else {qid=quiz.get(0).getQid();request.setAttribute("quizName", quiz.get(0).getQname());}
		request.setAttribute("questions", questionService.getQuestions(qid));
		//request.setAttribute("courses", courseService.getAllCourses());
		return "admin/questions";
	}
}
