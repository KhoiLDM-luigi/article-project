package pers.khoildm.auth_server.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import pers.khoildm.auth_server.model.AuthRole;

public interface RoleRepository extends JpaRepository<AuthRole, Long> {
    Optional<AuthRole> findByName(String name);
}
