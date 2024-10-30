CREATE DATABASE article_db;

\connect article_db;

CREATE TABLE articles(
    id SERIAL PRIMARY KEY,
    owner VARCHAR,
    title VARCHAR
);
