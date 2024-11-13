package pers.khoildm.article_server.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import pers.khoildm.article_server.dto.ArticleDTO;
import pers.khoildm.article_server.dto.ArticleFormDTO;
import pers.khoildm.article_server.dto.ArticleListDTO;
import pers.khoildm.article_server.model.Article;
import pers.khoildm.article_server.repository.ArticleRepository;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("articles")
@RequiredArgsConstructor
public class ArticlesController {
    private final ArticleRepository articleRepository;

    @GetMapping("")
    public ResponseEntity<CollectionModel<ArticleDTO>> getArticles(@RequestParam(required = false) String username) {
        List<Article> articles = (username != null) ? articleRepository.findByUsername(username)
                : articleRepository.findAll();

        ArrayList<ArticleDTO> dtos = new ArrayList<>();
        for (Article article : articles) {
            ArticleDTO dto = new ArticleDTO(article);
            dto.add(WebMvcLinkBuilder
                    .linkTo(WebMvcLinkBuilder.methodOn((ArticlesController.class)).getArticleById(article.getId()))
                    .withSelfRel());
            dtos.add(dto);
        }

        CollectionModel<ArticleDTO> responses = CollectionModel.of(dtos);

        return new ResponseEntity<>(responses, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<ArticleDTO> getArticleById(@PathVariable Long id) {
        Article article = articleRepository.getReferenceById(id);
        ArticleDTO dto = new ArticleDTO(article);
        dto.add(WebMvcLinkBuilder.linkTo(WebMvcLinkBuilder.methodOn((ArticlesController.class)).getArticleById(id))
                .withSelfRel());
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('SCOPE_articles.write')")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void putMethodName(@PathVariable Long id, @RequestBody ArticleFormDTO form) {
        Article article = articleRepository.getReferenceById(id);
        article.setContent(form.getContent());
        article.setTitle(form.getTitle());
        articleRepository.save(article);
    }

    @PostMapping("/")
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
