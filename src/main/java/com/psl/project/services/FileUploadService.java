package com.psl.project.services;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.psl.project.model.User;
import com.psl.project.repository.UserRepository;

@Service
public class FileUploadService {

	@Autowired
	UserRepository userRepo;
	
	public void uploadProfilePic(String uid, MultipartFile file) throws IllegalStateException, IOException {
		//Fetching user details for corresponding user id
		User user = userRepo.findById(Long.parseLong(uid)).get();
		//Checking if Profile picture exist
		if(user.getProfilePicture()!=null && !user.getProfilePicture().isEmpty()) {
			File fileToDelete = new File("C:\\Users\\User\\eclipse-workspace\\spring-web-lms\\src\\main\\webapp\\resources\\profilePicture\\"+user.getProfilePicture());
		    boolean success = fileToDelete.delete();
		}
		
		String timeStamp=new Timestamp(System.currentTimeMillis()).toString();
		String relativePath = timeStamp+"_"+uid;
		relativePath=relativePath.replace(':', '-');
		relativePath=relativePath.replace(' ', '_');
		int index = file.getOriginalFilename().lastIndexOf('.');
	    if(index > 0) {
	      String extension = file.getOriginalFilename().substring(index + 1);
	      relativePath+="."+extension; 
	    }
		file.transferTo(new File("C:\\Users\\User\\eclipse-workspace\\spring-web-lms\\src\\main\\webapp\\resources\\profilePicture\\"+relativePath));
		
		user.setProfilePicture(relativePath);
		userRepo.save(user);
	}
}
