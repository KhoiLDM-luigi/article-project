package pers.khoildm.article_server.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pers.khoildm.article_server.model.Article;

public interface ArticleRepository extends JpaRepository<Article, Long> {
    List<Article> findByUsername(String username);
}
