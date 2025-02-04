# ARTICLE MICROSERVICES

A group of related services for a article platform

- PostgresSQL for Database
- auth-server for user's profile and authentication
- article-server for article access
- config-server and eureka as spring cloud platform
- article-client, a barely functional web client with authentication, and perform CRUD(add, view, edit) with article-server via its API

This project is for learning Spring Security, OAuth 2.0, and implementing a authorization server protecting resources in a microservices system

No other security concern/standard are in mind in this system

Web client is really bad(lol)

[OAuth 2.0 learning](doc/oauth2.md)
[Spring Start Up sequence](doc/spring-starter.md)
