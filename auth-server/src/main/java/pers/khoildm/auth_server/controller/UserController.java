package pers.khoildm.auth_server.controller;

import java.security.Principal;

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

    @GetMapping("profile")
    public AuthUser getProfile(Principal principal) {
        String username = principal.getName();
        AuthUser user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("user not found"));
        return user;
    }

}
