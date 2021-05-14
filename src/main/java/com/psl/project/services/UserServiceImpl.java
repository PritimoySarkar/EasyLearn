package com.psl.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.psl.project.model.User;
import com.psl.project.repository.RoleRepository;
import com.psl.project.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //Method to save user in the database
    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new ArrayList<>(roleRepository.findByName("USER")));
        userRepository.save(user);
    }
    
    //Method to get all users from the database
    @Override
    public List<User> getAllUsers(){
    	return userRepository.findAll();
    }

    //Method to get user details using username
    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    //Method to get user detail user id
    public Optional<User> findByID(Long id){
    	Optional<User> user = userRepository.findById(id);
    	return user;
    }
}
