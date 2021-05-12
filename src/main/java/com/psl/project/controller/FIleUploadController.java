package com.psl.project.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.psl.project.services.FileUploadService;

@Controller
public class FIleUploadController {

	@Autowired
	FileUploadService fileUploadService;
	
	@PostMapping("user/uploadProfilePicture")
	public String uploadProfilePicture(@RequestParam("file") MultipartFile file,@RequestParam("editUid") String uid) throws IllegalStateException, IOException {
		System.out.println(uid);
		fileUploadService.uploadProfilePic(uid,file);
		return "redirect:/dashboard";
	}
}
