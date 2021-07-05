package com.nku.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nku.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
