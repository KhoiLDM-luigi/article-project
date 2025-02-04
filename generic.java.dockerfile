FROM openjdk:17-jdk-slim

RUN apt update && apt-get install -y curl 

WORKDIR /app

COPY ./${PROJECT}-*.jar /app/${PROJECT}.jar

ENTRYPOINT [ "java", "-Xmx512m", "-jar", "/app/${PROJECT}.jar"]