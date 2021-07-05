package com.nku.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nku.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
}
