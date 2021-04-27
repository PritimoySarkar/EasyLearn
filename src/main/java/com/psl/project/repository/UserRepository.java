package com.psl.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psl.project.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    //Method to find user details using username
	User findByUsername(String username);
}
