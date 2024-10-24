package pers.khoildm.auth_server.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import pers.khoildm.auth_server.dto.RegisterDTO;
import pers.khoildm.auth_server.model.AuthRole;
import pers.khoildm.auth_server.model.AuthUser;
import pers.khoildm.auth_server.repository.RoleRepository;
import pers.khoildm.auth_server.repository.UserRepository;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@AllArgsConstructor
public class AuthController {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        RegisterDTO form = new RegisterDTO();
        model.addAttribute("user", form);
        return "register";
    }

    @PostMapping("/register")
    public String registerProcess(@Valid @ModelAttribute("user") RegisterDTO formData, HttpSession session)
            throws RuntimeException {
        // form final validation
        if (userRepository.findByUsername(formData.getUsername()).isPresent()) {
            session.setAttribute("REGISTRATION_FAILED", "Username already exist...");
            return "redirect:/register?error";
        }

        if (!formData.getPassword().equals(formData.getMatchingPassword())) {
            session.setAttribute("REGISTRATION_FAILED", "password do not match");
            return "redirect:/register?error";
        }

        AuthRole role = roleRepository.findByName("user")
                .orElseThrow(() -> new RuntimeException("Internal server error Role query failed"));

        String password = passwordEncoder.encode(formData.getPassword());
        AuthUser user = new AuthUser();
        user.setUsername(formData.getUsername());
        user.setPassword(password);
        user.setEmail(formData.getEmail());
        user.setRole(role);

        userRepository.save(user);
        return "redirect:/login";
    }

}
