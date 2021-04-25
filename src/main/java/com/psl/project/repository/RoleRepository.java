package com.psl.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psl.project.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
