FROM openjdk:8
EXPOSE 8080
ADD target/spring-jenkins-integration.jar spring-jenkins-integration.jar
ENTRYPOINT ["java","-jar","/spring-jenkins-integration.jar"]