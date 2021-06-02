package com.psl.project.services;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class SmtpMailSender {
	@Autowired
	private JavaMailSender javaMailSender;
	
	private static String readLineByLineJava8(String filePath) 
    {
        StringBuilder contentBuilder = new StringBuilder();
 
        try (Stream<String> stream = Files.lines( Paths.get(filePath), StandardCharsets.UTF_8)) 
        {
            stream.forEach(s -> contentBuilder.append(s).append("\n"));
        }
        catch (IOException e) 
        {
            e.printStackTrace();
        }
 
        return contentBuilder.toString();
    }
	
	public String send(String to,String subject, String body) throws MessagingException {
		//Get the html template for sending OTP mail
		String filePath = "src\\main\\resources\\mail.html";
		String htmlBody = readLineByLineJava8( filePath );
		
		//Create random OTP
		int min = 100000;
		int max = 999999;
		int otp = (int)Math.floor(Math.random()*(max-min+1)+min);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
		String encodedPassword = encoder.encode(String.valueOf(otp));
		
		//Inserting the OTP in the mail template
		htmlBody = htmlBody.replace("123456", String.valueOf(otp));
		
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		
		//Setting sender receiver Subject and message body
		helper.setFrom("0bloggingmania@gmail.com");
		helper.setSubject(subject);
		helper.setTo(to);
		message.setContent(htmlBody, "text/html");
		
		//Send the mail
		javaMailSender.send(message);
		
		//Return the OTP in encoded format
		return encodedPassword;
	}
}
