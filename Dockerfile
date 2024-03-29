# Use the official OpenJDK 17 Alpine image as the base image
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file of your application to the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Download MySQL Connector/J for Java 17
RUN wget -O mysql-connector-java-latest.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar

# Set the classpath to include MySQL Connector/J JAR file
ENV CLASSPATH=/app/mysql-connector-java-latest.jar:$CLASSPATH

# Expose the port on which your Java application listens
EXPOSE 8085

# Set the entry point for the container
ENTRYPOINT ["java","-jar","/app/app.jar"]

