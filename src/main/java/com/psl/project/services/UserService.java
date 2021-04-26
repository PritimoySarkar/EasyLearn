package com.psl.project.services;

import java.util.Optional;

import com.psl.project.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
    
    public Optional<User> findByID(Long id);
}
