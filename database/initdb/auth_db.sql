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

-- org.springframework.security.oauth2.server.authorization
CREATE TABLE oauth2_authorization_consent (
    registered_client_id varchar(100) NOT NULL,
    principal_name varchar(200) NOT NULL,
    authorities varchar(1000) NOT NULL,
    PRIMARY KEY (registered_client_id, principal_name)
);

-- org.springframework.security.oauth2.server.authorization.client
CREATE TABLE oauth2_authorization (
    id varchar(100) NOT NULL,
    registered_client_id varchar(100) NOT NULL,
    principal_name varchar(200) NOT NULL,
    authorization_grant_type varchar(100) NOT NULL,
    authorized_scopes varchar(1000) DEFAULT NULL,
    attributes TEXT DEFAULT NULL,
    state varchar(500) DEFAULT NULL,
    authorization_code_value TEXT DEFAULT NULL,
    authorization_code_issued_at timestamp DEFAULT NULL,
    authorization_code_expires_at timestamp DEFAULT NULL,
    authorization_code_metadata TEXT DEFAULT NULL,
    access_token_value TEXT DEFAULT NULL,
    access_token_issued_at timestamp DEFAULT NULL,
    access_token_expires_at timestamp DEFAULT NULL,
    access_token_metadata TEXT DEFAULT NULL,
    access_token_type varchar(100) DEFAULT NULL,
    access_token_scopes varchar(1000) DEFAULT NULL,
    oidc_id_token_value TEXT DEFAULT NULL,
    oidc_id_token_issued_at timestamp DEFAULT NULL,
    oidc_id_token_expires_at timestamp DEFAULT NULL,
    oidc_id_token_metadata TEXT DEFAULT NULL,
    refresh_token_value TEXT DEFAULT NULL,
    refresh_token_issued_at timestamp DEFAULT NULL,
    refresh_token_expires_at timestamp DEFAULT NULL,
    refresh_token_metadata TEXT DEFAULT NULL,
    user_code_value TEXT DEFAULT NULL,
    user_code_issued_at timestamp DEFAULT NULL,
    user_code_expires_at timestamp DEFAULT NULL,
    user_code_metadata TEXT DEFAULT NULL,
    device_code_value TEXT DEFAULT NULL,
    device_code_issued_at timestamp DEFAULT NULL,
    device_code_expires_at timestamp DEFAULT NULL,
    device_code_metadata TEXT DEFAULT NULL,
    PRIMARY KEY (id)
);

-- Data

INSERT INTO auth_role(id, name, description) 
VALUES (1, 'admin', 'system admin'),
       (2, 'user', 'user');

INSERT INTO auth_user(id, username, password, role_id, email)
VALUES (1, 'spring-admin', '$2a$12$C49cwDwTBN4HeLTekMPiO./roEgxKxlGTRbCdrm.WL8wH7viouj/O', 1, 'admin@spring.pers');


-- oauth client
INSERT INTO oauth2_registered_client (
    id, client_id, client_id_issued_at, client_secret, client_name, 
    client_authentication_methods, authorization_grant_types, redirect_uris, scopes, 
    client_settings, token_settings
)
VALUES (
    gen_random_uuid(), 'articles-client', CURRENT_TIMESTAMP, '$2a$12$djoKXwrUalKsucgpyjf.C.u8f.LalvzIXKxe.xSN3xc.ikB9pfm6i', 
    'Articles Client', 'client_secret_post', 'authorization_code refresh_token', 
    'http://127.0.0.1:8082/login/oauth2/code/spring', 'openid articles.read',
    '{"requireProofKey":true, "requireAuthorizationConsent":true}', 
    '{"accessTokenTimeToLive":"PT1H", "refreshTokenTimeToLive":"PT24H"}'
);

-- Debug Client configuration
INSERT INTO oauth2_registered_client (
    id, client_id, client_id_issued_at, client_secret, client_name, 
    client_authentication_methods, authorization_grant_types, redirect_uris, scopes, 
    client_settings, token_settings
)
VALUES (
    gen_random_uuid(), 'debug', CURRENT_TIMESTAMP, '$2a$12$fuwGsYQf8n7fTBObG6SHOuZsC/uEXzPkP0U0SnlB7dZBVQtn/mgEC', 
    'Articles Client', 'client_secret_post', 'authorization_code refresh_token', 
    'https://oidcdebugger.com/debug', 'openid articles.read',
    '{"requireProofKey":true, "requireAuthorizationConsent":true}', 
    '{"accessTokenTimeToLive":"PT1H", "refreshTokenTimeToLive":"PT24H"}'
);