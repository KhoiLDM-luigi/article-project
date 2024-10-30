package pers.khoildm.auth_server.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    @Order(2)
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // this is for testing purposes
                .authorizeHttpRequests(authorizeRequests -> authorizeRequests
                        .requestMatchers("/error", "register").permitAll()
                        .requestMatchers("/users/profile").hasAuthority("SCOPE_profile")
                        .anyRequest().authenticated())
                .oauth2ResourceServer(oauth2 -> oauth2.jwt(Customizer.withDefaults())) // use to authenticate user's
                                                                                       // auth
                                                                                       // resource
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/authentication")
                        .permitAll())
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout=true")

                        .permitAll());

        return http.build();
    }

    @Bean
    PasswordEncoder defaultPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
