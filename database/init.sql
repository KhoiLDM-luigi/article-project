CREATE DATABASE auth_db;
CREATE DATABASE article_db;

\connect auth_db;

CREATE TABLE auth_role(
    id SERIAL primary key,
    name VARCHAR,
    description VARCHAR
);

CREATE TABLE auth_user(
    id SERIAL primary key,
    username VARCHAR,
    password VARCHAR,
    role_id INT REFERENCES auth_role,
    email VARCHAR
);

INSERT INTO auth_role(id, name, description) 
VALUES (1, 'admin', 'system admin'),
       (2, 'user', 'user');

INSERT INTO auth_user(id, username, password, role_id, email)
VALUES (1, 'spring-admin', '$2a$12$C49cwDwTBN4HeLTekMPiO./roEgxKxlGTRbCdrm.WL8wH7viouj/O', 1, 'admin@spring.pers');

-- \connect article_db;

-- CREATE TABLE articles(
--     id SERIAL primary key,
--     user VARCHAR,
--     title VARCHAR
-- );