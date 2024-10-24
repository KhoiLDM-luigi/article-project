package pers.khoildm.auth_server.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pers.khoildm.auth_server.model.AuthUser;

import java.util.Optional;

public interface UserRepository extends JpaRepository<AuthUser, Long> {
    Optional<AuthUser> findByUsername(String username);
}
