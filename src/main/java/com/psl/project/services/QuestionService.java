package com.psl.project.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psl.project.model.AnswersBackup;
import com.psl.project.model.Attempt;
import com.psl.project.model.Course;
import com.psl.project.model.Question;
import com.psl.project.model.Quiz;
import com.psl.project.repository.AnswersBackupDao;
import com.psl.project.repository.QuestionDao;

@Service
public class QuestionService {

	@Autowired
	QuestionDao questiondao;
	
	@Autowired
	AnswersBackupDao answersBackupDao;
	
	@Autowired
	AttemptService attemptService;
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	QuestionService questionService;
	
	//Method to insert new question in the database
	public void insertQuestion(Question q) {
		questiondao.save(q);
	}
	
	//Method to get all questions details
	public List<Question> getAllQuestions(){
		List<Question> questions = new ArrayList<Question>();
		for(Question q: questiondao.findAll()) {
			questions.add(q);
		}
		return questions;
	}
	
	//Method to get all questions details of a quiz using quiz id
	public List<Question> getQuestions(int qid){
		List<Question> questions = new ArrayList<Question>();
		for(Question q: questiondao.findByQidOrderBySlnoAsc(qid)) {
			questions.add(q);
		}
		return questions;
	}
	
	//Method to get all questions details of a quiz using quiz id
	public Optional<Question> getQuestionsByQqid(int qqid){
		Optional<Question> question = questiondao.findById(qqid);
		return question;
	}
	
	//Method to remove question in the database
	public void removeQuestion(int qqid) {
		questiondao.deleteById(qqid);;
	}
	
	//Decrease all next questions serial number by 1
	public void syncQuestionsDown(int slno,int qid) {
		questiondao.decreaseAllNextQuestions(slno, qid);
	}
	
	//Decrease all next questions serial number by 1
	public void syncQuestionsUp(int slno,int qid) {
		questiondao.increaseAllNextQuestions(slno, qid);
	}
	
	public void insertAnswersBackup(AnswersBackup ab) {
		answersBackupDao.save(ab);
	}
	
	public void removeAnswersBackup(Long aid) {
		answersBackupDao.deleteByAid(aid);
	}
	
	public List<AnswersBackup> getAnswersBackup(Long aid) {
		return answersBackupDao.findAnswersBackupByAid(aid);
	}
	
	public List<AnswersBackup> getAnswersBackup(Long aid,int qqid) {
		return answersBackupDao.findAnswersBackupByAidAndQqid(aid, qqid);
	}
	
	public int calculateScore(List<AnswersBackup> responses,Long aid) {
		//Fetching UCID from attempt using aid
		int ucid = attemptService.getAttemptById(aid).get().getUcid();
		
		//Fetching CID from UserCourse using ucid
		int cid = courseService.getUserCourse(ucid).get().getCid();
		
		//Fetching course from using cid
		Course course = courseService.getCourse(cid).get();
		
		//Fetching qid from course using cid
		int qid = course.getQuiz().get(0).getQid();
		
		//Fetching questions from quiz using quizID
		List<Question> questions = questionService.getQuestions(qid);
		
		//Initializing Map of right_answers and selected_ansers for checking correct answers and counting score
		Map<String, String> right_answers = new HashMap<String, String>();
		Map<String, String> selected_answers = new HashMap<String, String>();
		
		//Putting values inside selected_answers map 
		for(Question q:questions) {
			right_answers.put(Integer.toString(q.getQqid()), q.getAnswer());
		}
		
		//counting correct answer
		int score = 0;
		for(AnswersBackup ab:responses) {
			//selected_answers.put(Integer.toString(ab.getQqid()), ab.getAnswer());
			if(ab.getAnswer().equals(right_answers.get(Integer.toString(ab.getQqid())))) {
				score+=1;
			}
		}
		return score;
	}
	
	public void startTimer(Long aid,Integer questionsCount) {
		Timer t = new Timer();  
		TimerTask tt = new TimerTask() {  
		    @Override  
		    public void run() {  
		        System.out.println("Fetching answers backup on timeout: ");
		        List<AnswersBackup> answersBackup = getAnswersBackup(aid);
		        //System.out.println("Recived all answers backup");
		        
		        //CHEcking if the attempt exist or not
		        if(!attemptService.getAttemptById(aid).isEmpty()) {
		        	//Fetching the attempt using aid
		        	Attempt attempt =  attemptService.getAttemptById(aid).get();
		        	
		        	//calculating the score
		        	int score = calculateScore(answersBackup, aid);
		        	String status = "";
		        	
		        	//Determining the status based on score
		        	if((score/questionsCount)*100>=70){
		        		status = "Passed";
		        	}
		        	else {
		        		status = "Failed";
		        	}
		        	
		        	//changing score and status of the fetched attempt object
		        	attempt.setScore(score);
		        	attempt.setStatus(status);
		        	
		        	//Inserting the modified attempt object abck into the database
		        	attemptService.insertAttempt(attempt);
		        	
		        	//Removing answers backup from answers_backup table
		        	removeAnswersBackup(aid);
		        }
		        //System.out.println("Removed all answers backup");
		    };  
		};  
		System.out.println("Setting timer for "+questionsCount+" minutes");
		t.schedule(tt,questionsCount*60*1000);
	}
}
