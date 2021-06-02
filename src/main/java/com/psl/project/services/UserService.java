package com.psl.project.services;

import java.util.List;
import java.util.Optional;

import com.psl.project.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
    
    public Optional<User> findByID(Long id);
    
    public List<User> getAllUsers();
    
    public void forgotPassword(String username);
    
    public void updatePassword(String password, String token);
}
