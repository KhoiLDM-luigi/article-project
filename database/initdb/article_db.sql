CREATE DATABASE article_db;

\connect article_db;

CREATE TABLE articles(
    id SERIAL PRIMARY KEY,
    owner VARCHAR,
    title VARCHAR,
    content TEXT
);

INSERT INTO articles(owner, title, content)
VALUES ('spring-admin', 'Article A', 'This is a article A by spring-admin.'),
       ('spring-admin', 'Article B', 'This is a article B by spring-admin.'),
       ('test', 'Article C', 'This is a article C by test.'),
       ('test', 'Article D', 'This is a article D by test.'),
       ('test', 'Article E', 'This is a article E by test.\nThis have a bit longer content.');