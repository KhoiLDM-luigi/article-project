package pers.khoildm.auth_server.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import pers.khoildm.auth_server.model.AuthUser;
import pers.khoildm.auth_server.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/users")
@AllArgsConstructor
public class UserController {
    private final UserRepository userRepository;

    @GetMapping("")
    public ResponseEntity<List<AuthUser>> getUser() {
        List<AuthUser> users = userRepository.findAll();
        return new ResponseEntity<>(users, HttpStatus.FOUND);
    }

}
