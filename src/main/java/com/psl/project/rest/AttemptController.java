package com.psl.project.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.psl.project.model.Attempt;
import com.psl.project.model.Progress;
import com.psl.project.model.Quiz;
import com.psl.project.model.User;
import com.psl.project.model.UserCourse;
import com.psl.project.services.AttemptService;
import com.psl.project.services.CourseService;
import com.psl.project.services.LectureService;
import com.psl.project.services.ProgressService;
import com.psl.project.services.QuizService;
import com.psl.project.services.SmtpMailSender;
import com.psl.project.services.UserService;

import javassist.bytecode.stackmap.TypeData.ClassName;

@RestController
public class AttemptController {

	@Autowired
	CourseService courseService;
	
	@Autowired
	AttemptService attemptService;
	
	@Autowired
	ProgressService progressService;
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	UserService userService;
	
	Logger logger = LoggerFactory.getLogger(AttemptController.class);
	
	@GetMapping("/user/attempts/{ucid}")
	public List<Attempt> showAttemptsForUsercourse(@PathVariable("ucid") int ucid){
		return attemptService.getAttemptsByUsercourse(ucid);
	}
	
	@GetMapping("/user/progress/{ucid}")
	public Map<String,Integer> showProgressForUsercourse(@PathVariable("ucid") int ucid){
		Map<String,Integer> statusCount = new HashMap<String, Integer>();
		UserCourse userCourse = courseService.getUserCourse(ucid).get();
		int totalLectures = lectureService.getLectureCount(userCourse.getCid());
		if(totalLectures>0) {
			int progressLecture = lectureService.getInProgressLectureCount(userCourse.getUid(), userCourse.getCid());
			int completedLecture = lectureService.getCompletedLectureCount(userCourse.getUid(), userCourse.getCid());
			int reviewLecture = lectureService.getReviewLectureCount(userCourse.getUid(), userCourse.getCid());
			
			statusCount.put("Unexplored", Math.round(((totalLectures-progressLecture+completedLecture+reviewLecture)*100)/totalLectures));
			statusCount.put("Progress", Math.round((progressLecture*100)/totalLectures));
			statusCount.put("Completed", Math.round((completedLecture*100)/totalLectures));
			statusCount.put("Review", Math.round((reviewLecture*100)/totalLectures));
		}
		else {
			statusCount.put("Unexplored", 0);
			statusCount.put("Progress", 0);
			statusCount.put("Completed", 0);
			statusCount.put("Review", 0);
		}
		return statusCount;
	}
	
	@PostMapping(value="/user/lecture")
	public void setLectureAsCompleted(HttpServletResponse response,@RequestParam Map<String,String> responses,HttpSession session) throws IOException {
		if (session.getAttribute("userid") == null) {
			response.sendRedirect("/");
		} else {
			Long uid = Long.parseLong(session.getAttribute("userid").toString());
			int lid = Integer.parseInt(responses.get("lid"));
			List<Progress> progresses = progressService.getProgressesByUidAndLid(uid, lid);
			if(progresses.size()>0) {
				Progress progress = progresses.get(0);
				progress.setStatus(responses.get("status"));
				progressService.insertProgress(progress);
			}
			else {
				progressService.insertProgress(new Progress(uid, lid, responses.get("status")));
			}
			
		}
		
	}
	
	@PostMapping(value="/user/lecture/check")
	public String getLectureStatus(HttpServletResponse response,@RequestParam Map<String,String> responses,HttpSession session) throws IOException {
		if (session.getAttribute("userid") == null) {
			response.sendRedirect("/");
			return "";
		} else {
			Long uid = Long.parseLong(session.getAttribute("userid").toString());
			int lid = Integer.parseInt(responses.get("lid"));
			List<Progress> progresses = progressService.getProgressesByUidAndLid(uid, lid);
			if(progresses.size()>0) {
				return progresses.get(0).getStatus();
			}
			else {
				return "Unexplored";
			}
		}
		
	}
	
	//Handle ajax call to count passed tests by the user
	@GetMapping(value="/admin/users/passcount/{uid}")
	public int getPassCount(@PathVariable("uid") Long uid) {
		return courseService.getPassedQuizzes(uid);
	}
	
	//Handle ajax call to count failed tests by the user
	@GetMapping(value="/admin/users/failcount/{uid}")
	public int getFailCount(@PathVariable("uid") Long uid) {
		return courseService.getFailedQuizzes(uid);
	}
}
