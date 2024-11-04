package pers.khoildm.article_server.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import pers.khoildm.article_server.dto.ArticleFormDTO;
import pers.khoildm.article_server.dto.ArticleListDTO;
import pers.khoildm.article_server.model.Article;
import pers.khoildm.article_server.repository.ArticleRepository;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("articles")
@RequiredArgsConstructor
public class ArticlesController {
    private final ArticleRepository articleRepository;

    @CrossOrigin
    @GetMapping("")
    public ResponseEntity<ArticleListDTO> getArticles(@RequestParam(required = false) String username) {
        List<Article> articles = (username != null) ? articleRepository.findByUsername(username)
                : articleRepository.findAll();
        ArticleListDTO responses = new ArticleListDTO(articles);

        return new ResponseEntity<>(responses, HttpStatus.OK);
    }

    @PostMapping("")
    @PreAuthorize("hasAuthority('SCOPE_articles.write')")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void postMethodName(@RequestBody ArticleFormDTO form, @AuthenticationPrincipal Jwt token) {
        String username = token.getClaimAsString("sub");
        Article article = new Article();
        article.setUsername(username);
        article.setTitle(form.getTitle());
        article.setContent(form.getContent());
        articleRepository.save(article);
    }

}
