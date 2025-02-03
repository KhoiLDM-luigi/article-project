FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./${PROJECT}-*.jar /app/${PROJECT}.jar

ENTRYPOINT [ "java", "-jar", "/app/${PROJECT}.jar"]