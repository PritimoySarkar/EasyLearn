package com.psl.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.psl.project.model.User;
import com.psl.project.repository.RoleRepository;
import com.psl.project.repository.UserRepository;

import java.lang.StackWalker.Option;
import java.util.HashSet;
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
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
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
