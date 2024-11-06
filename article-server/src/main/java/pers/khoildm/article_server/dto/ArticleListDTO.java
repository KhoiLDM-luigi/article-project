package pers.khoildm.article_server.dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pers.khoildm.article_server.controller.ArticlesController;
import pers.khoildm.article_server.model.Article;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleListDTO {
    int total = 0;
    ArrayList<ArticleDTO> articles = new ArrayList<>();

    public ArticleListDTO(List<Article> articles) {
        for (Article article : articles) {
            ArticleDTO dto = new ArticleDTO(article);
            dto.add(WebMvcLinkBuilder
                    .linkTo(WebMvcLinkBuilder.methodOn((ArticlesController.class)).getArticleById(article.getId()))
                    .withSelfRel());
            this.articles.add(new ArticleDTO(article));
        }
        this.total = this.articles.size();
    }
}