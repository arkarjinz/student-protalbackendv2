package org.example.studentprotal.dao;

import org.example.studentprotal.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleDao extends JpaRepository<Role,Integer> {
    Optional<Role> findByRoleName(String roleName);
}
