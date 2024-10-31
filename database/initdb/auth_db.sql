-- PostgresSQL 17.0

CREATE DATABASE auth_db;

\connect auth_db;

-- SCHEMA

CREATE TABLE auth_role(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    description VARCHAR
);

CREATE TABLE auth_user(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    role_id INT REFERENCES auth_role,
    email VARCHAR(255)
);

-- org.springframework.security.oauth2.server.authorization.client
CREATE TABLE oauth2_registered_client (
    id varchar(100) NOT NULL,
    client_id varchar(100) NOT NULL,
    client_id_issued_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_secret varchar(200) DEFAULT NULL,
    client_secret_expires_at timestamp DEFAULT NULL,
    client_name varchar(200) NOT NULL,
    client_authentication_methods varchar(1000) NOT NULL,
    authorization_grant_types varchar(1000) NOT NULL,
    redirect_uris varchar(1000) DEFAULT NULL,
    post_logout_redirect_uris varchar(1000) DEFAULT NULL,
    scopes varchar(1000) NOT NULL,
    client_settings varchar(2000) NOT NULL,
    token_settings varchar(2000) NOT NULL,
    PRIMARY KEY (id)
);

-- Data

INSERT INTO auth_role(id, name, description) 
VALUES (1, 'admin', 'system admin'),
       (2, 'user', 'user');

INSERT INTO auth_user(id, username, password, role_id, email)
VALUES (1, 'spring-admin', '$2a$12$C49cwDwTBN4HeLTekMPiO./roEgxKxlGTRbCdrm.WL8wH7viouj/O', 1, 'admin@spring.pers'), -- bcrypt 123
       (2, 'test', '$2a$12$C49cwDwTBN4HeLTekMPiO./roEgxKxlGTRbCdrm.WL8wH7viouj/O', 2, 'test@test.mail'); -- bcrypt 123


-- oauth client
INSERT INTO oauth2_registered_client (
    id, client_id, client_id_issued_at, client_secret, client_name, 
    client_authentication_methods, authorization_grant_types, redirect_uris, scopes, 
    client_settings, token_settings
)
VALUES (
    gen_random_uuid(), 'articles-client', CURRENT_TIMESTAMP, '$2a$12$djoKXwrUalKsucgpyjf.C.u8f.LalvzIXKxe.xSN3xc.ikB9pfm6i', -- bcrypt: "123123123"
    'Articles Client', 'client_secret_post', 'authorization_code,refresh_token', 
    'http://127.0.0.1:8082/login/oauth2/code/spring', 'openid,articles.read',
    '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":false}', 
    '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",3600.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",3600.000000000],"settings.token.authorization-code-time-to-live":["java.time.Duration",300.000000000]}'
);

-- Debug Client configuration
INSERT INTO oauth2_registered_client (
    id, client_id, client_id_issued_at, client_secret, client_name, 
    client_authentication_methods, authorization_grant_types, redirect_uris, scopes, 
    client_settings, token_settings
)
VALUES (
    gen_random_uuid(), 'debug', CURRENT_TIMESTAMP, '$2a$12$fuwGsYQf8n7fTBObG6SHOuZsC/uEXzPkP0U0SnlB7dZBVQtn/mgEC', -- bcrypt: "secret"
    'Debug Client', 'client_secret_post', 'authorization_code,refresh_token', 
    'https://oidcdebugger.com/debug', 'openid,articles.read,profile',
    '{"@class":"java.util.Collections$UnmodifiableMap","settings.client.require-proof-key":false,"settings.client.require-authorization-consent":false}', 
    '{"@class":"java.util.Collections$UnmodifiableMap","settings.token.reuse-refresh-tokens":true,"settings.token.id-token-signature-algorithm":["org.springframework.security.oauth2.jose.jws.SignatureAlgorithm","RS256"],"settings.token.access-token-time-to-live":["java.time.Duration",3600.000000000],"settings.token.access-token-format":{"@class":"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat","value":"self-contained"},"settings.token.refresh-token-time-to-live":["java.time.Duration",3600.000000000],"settings.token.authorization-code-time-to-live":["java.time.Duration",300.000000000]}'
);