package com.psl.project.validator;

import com.psl.project.model.User;
import com.psl.project.services.UserService;

import java.util.regex.Pattern;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

//Class to validate if user's input was errorfree or not
@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        //Check for empty field or blank space entered in the username
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty" );
        
        //First name Validation
        if (user.getFirstname()==null) {
        	errors.rejectValue("firstname", "Blank.userForm.firstname");
        }
        if (!user.getFirstname().matches("^[a-zA-Z]*$")) {
        	errors.rejectValue("firstname", "Pattern.userForm.firstname");
        }
        if (user.getFirstname().length()>32) {
        	errors.rejectValue("firstname", "Size.userForm.firstname");
        }
        
        //Last name Validation
        if (!user.getLastname().matches("^[a-zA-Z]*$")) {
        	errors.rejectValue("lastname", "Pattern.userForm.lastname");
        }
        if (user.getLastname().length()>32) {
        	errors.rejectValue("lastname", "Size.userForm.lastname");
        }
        
        //Email Id regex
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +  //part before @
                "(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$"; 
        Pattern pat = Pattern.compile(emailRegex);
 
        //check username format if valid email address or not
        if (!pat.matcher(user.getUsername()).matches()) {
        	errors.rejectValue("username", "Pattern.userForm.username");
        }
        
        //Set error if the username already exist in the database
        if ( userService.findByUsername( user.getUsername()) != null ) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }
        
        //Check for empty field or blank space entered in the username
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        
        //OTP Validation
        if (user.getOtp().length() < 6 || user.getOtp().length() > 6) {
        	errors.rejectValue("otp", "Blank.userForm.otp");
        }
        
        //Set error if length of the username is less than 8 or greater than 32
        if ( user.getPassword().length() < 8 || user.getPassword().length() > 32 ) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        //Set error if entered password and confirm password is different
        if ( !user.getPasswordConfirm().equals(user.getPassword()) ) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }
    
    public void validatePassword(Object o, Errors errors) {
        User user = (User) o;
        //Check for empty field or blank space entered in the username
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty" );

        //Check for empty field or blank space entered in the username
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        
        //Set error if length of the username is less than 8 or greater than 32
        if ( user.getPassword().length() < 8 || user.getPassword().length() > 32 ) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        //Set error if entered password and confirm password is different
        if ( !user.getPasswordConfirm().equals(user.getPassword()) ) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }
    
    public void validateUsername(Object o, Errors errors) {
        User user = (User) o;
        //Email Id regex
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +  //part before @
                "(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$"; 
        Pattern pat = Pattern.compile(emailRegex);
 
        //check username format if valid email address or not
        if (!pat.matcher(user.getUsername()).matches()) {
        	errors.rejectValue("username", "Pattern.userForm.username");
        }
    }
}
