package com.psl.project.validator;

import com.psl.project.model.User;
import com.psl.project.services.UserService;

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
        
        //Set error if length of the username is less than 6 or greater than 32
        if ( user.getUsername().length() < 6 || user.getUsername().length() > 32 ) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        
        //Set error if the username already exist in the database
        if ( userService.findByUsername( user.getUsername()) != null ) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

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
}
