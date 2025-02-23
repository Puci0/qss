FROM openjdk:23-jdk-slim

WORKDIR /java-docker

RUN apt-get update && apt-get install -y maven

COPY ../../services/backend/announcements_comments .

RUN mvn clean install

EXPOSE 8080

CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
