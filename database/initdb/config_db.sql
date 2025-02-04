CREATE DATABASE config_db;

\connect config_db

CREATE TABLE properties(
    id SERIAL PRIMARY KEY,
    application VARCHAR(50) NOT NULL,
    profile VARCHAR(50) NOT NULL,
    label VARCHAR(50) NOT NULL,
    key VARCHAR(255) NOT NULL,
    value VARCHAR(255) NOT NULl
);

-- auth-server configs
INSERT INTO properties(application, profile, label, key, value)
VALUES ('auth-server','dev','master','server.port','8081'),
       ('auth-server','dev','master','spring.datasource.url','jdbc:postgresql://127.0.0.1:5433/auth_db'),
       ('auth-server','dev','master','spring.datasource.username','psql'),
       ('auth-server','dev','master','spring.datasource.password','123'),
       ('auth-server','dev','master','spring.security.oauth2.authorizationserver.issuer','http://127.0.0.1:${server.port}'),
       ('auth-server','dev','master','logging.level.org.springframework.security','DEBUG'),
       ('auth-server','dev','master','logging.level.root','INFO'),
       ('auth-server','docker','master','server.port','8081'),
       ('auth-server','docker','master','spring.datasource.url','jdbc:postgresql://article-db:5432/auth_db'),
       ('auth-server','docker','master','spring.datasource.username','psql'),
       ('auth-server','docker','master','spring.datasource.password','123'),
       ('auth-server','docker','master','spring.security.oauth2.authorizationserver.issuer','http://auth-server:${server.port}'),
       ('auth-server','docker','master','logging.level.org.springframework.security','DEBUG'),
       ('auth-server','docker','master','logging.level.root','INFO');

-- article-server configs
INSERT INTO properties(application, profile, label, key, value)
VALUES ('article-server','dev','master','server.port','8082'),
       ('article-server','dev','master','spring.datasource.url','jdbc:postgresql://127.0.0.1:5433/article_db'),
       ('article-server','dev','master','spring.datasource.username','psql'),
       ('article-server','dev','master','spring.datasource.password','123'),
       ('article-server','dev','master','spring.security.oauth2.resourceserver.jwt.issuer-uri','http://127.0.0.1:8081'),
       ('article-server','dev','master','logging.level.org.springframework.security','DEBUG'),
       ('article-server','dev','master','logging.level.root','INFO'),
       ('article-server','docker','master','server.port','8082'),
       ('article-server','docker','master','spring.datasource.url','jdbc:postgresql://article-db:5432/article_db'),
       ('article-server','docker','master','spring.datasource.username','psql'),
       ('article-server','docker','master','spring.datasource.password','123'),
       ('article-server','docker','master','spring.security.oauth2.resourceserver.jwt.issuer-uri','http://auth-server:8081'),
       ('article-server','docker','master','logging.level.org.springframework.security','DEBUG'),
       ('article-server','docker','master','logging.level.root','INFO');
