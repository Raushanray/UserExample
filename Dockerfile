# Use the official OpenJDK image as the base image
FROM openjdk:17-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
RUN wget -O mysql-connector-java-latest.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/VERSION/mysql-connector-java-VERSION.jar
COPY mysql-connector-java-latest.jar /app
ENV CLASSPATH=/app/mysql-connector-java-latest.jar:$CLASSPATH
EXPOSE 8085
ENTRYPOINT ["java","-jar","/app.jar"]
