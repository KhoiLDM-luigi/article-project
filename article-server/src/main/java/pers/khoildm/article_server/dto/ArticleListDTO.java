package pers.khoildm.article_server.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pers.khoildm.article_server.model.Article;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleListDTO {
    int total = 0;
    ArrayList<ArticleDTO> articles = new ArrayList<>();

    public ArticleListDTO(List<Article> articles) {
        for (Article article : articles) {
            this.articles.add(new ArticleDTO(article));
        }
        this.total = this.articles.size();
    }
}
