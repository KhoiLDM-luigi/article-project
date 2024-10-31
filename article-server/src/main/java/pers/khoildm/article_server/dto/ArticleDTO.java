package pers.khoildm.article_server.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pers.khoildm.article_server.model.Article;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDTO {
    String by;
    String title;
    String content;

    public ArticleDTO(Article article) {
        this.by = article.getUsername();
        this.title = article.getTitle();
        this.content = article.getContent();
    }
}
