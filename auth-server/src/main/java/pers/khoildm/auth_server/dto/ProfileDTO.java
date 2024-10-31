package pers.khoildm.auth_server.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pers.khoildm.auth_server.model.AuthUser;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfileDTO {
    String username;
    String email;
    String role;

    public ProfileDTO(AuthUser user) {
        this.username = user.getUsername();
        this.email = user.getEmail();
        this.role = user.getRole().getName();
    }
}
