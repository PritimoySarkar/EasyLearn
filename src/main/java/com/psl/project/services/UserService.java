package com.psl.project.services;

import com.psl.project.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
