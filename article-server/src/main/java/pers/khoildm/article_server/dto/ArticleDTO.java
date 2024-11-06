package pers.khoildm.article_server.dto;

import org.springframework.hateoas.RepresentationModel;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import pers.khoildm.article_server.model.Article;

@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDTO extends RepresentationModel<ArticleDTO> {
    String by;
    String title;
    String content;

    public ArticleDTO(Article article) {
        this.by = article.getUsername();
        this.title = article.getTitle();
        this.content = article.getContent();
    }
}
