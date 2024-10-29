CREATE DATABASE article_db;
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

-- auth server config 
-- generic config
INSERT INTO properties(application, profile, label, key, value)
VALUES ('auth-server','default','master','server.port','8080'),
       ('auth-server','default','master','logging.level.org.springframework.security','DEBUG'),
       ('auth-server','default','master','spring.datasource.url','jdbc:postgresql://127.0.0.1:5433/auth_db'),
       ('auth-server','default','master','spring.datasource.username','psql'),
       ('auth-server','default','master','spring.datasource.password','123'),
       ('auth-server','default','master','spring.security.oauth2.authorizationserver.issuer','http://127.0.0.1:${server.port}');

-- \connect article_db;

-- CREATE TABLE articles(
--     id SERIAL PRIMARY KEY,
--     user VARCHAR,
--     title VARCHAR
-- );
