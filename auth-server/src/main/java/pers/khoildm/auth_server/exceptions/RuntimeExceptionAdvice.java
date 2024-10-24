package pers.khoildm.auth_server.exceptions;

import java.util.logging.Logger;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j2;

@ControllerAdvice
@Log4j2
public class RuntimeExceptionAdvice {
    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<ExceptionDTO> runtimeExceptionHandler(RuntimeException ex) {
        ExceptionDTO res = new ExceptionDTO(ex.getMessage(), "");
        log.error(ex.getMessage());
        return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(OAuth2AuthenticationException.class)
    public ResponseEntity<ExceptionDTO> oauthAuthExceptionHandler(OAuth2AuthenticationException ex) {
        log.error(ex.getMessage());
        return new ResponseEntity<>(new ExceptionDTO(ex.getMessage(), ""), HttpStatus.UNAUTHORIZED);
    }
}
