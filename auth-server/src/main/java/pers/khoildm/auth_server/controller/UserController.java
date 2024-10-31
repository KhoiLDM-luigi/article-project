package pers.khoildm.auth_server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import pers.khoildm.auth_server.dto.ProfileDTO;
import pers.khoildm.auth_server.model.AuthUser;
import pers.khoildm.auth_server.repository.UserRepository;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {
    private final UserRepository userRepository;

    @GetMapping("profile")
    public ResponseEntity<ProfileDTO> getProfile(@AuthenticationPrincipal Jwt token) {
        String username = token.getClaimAsString("sub");
        AuthUser user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("user not found"));
        ProfileDTO response = new ProfileDTO(user);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
