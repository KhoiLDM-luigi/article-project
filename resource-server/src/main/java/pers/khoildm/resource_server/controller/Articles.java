package pers.khoildm.resource_server.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("articles")
public class Articles {
    @GetMapping("")
    public ResponseEntity<String[]> getArticles() {
        return new ResponseEntity<>(new String[] { "Article 1", "Article 2", "Article 3" }, HttpStatus.FOUND);
    }
}
