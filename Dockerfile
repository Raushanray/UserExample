# Use the official OpenJDK 17 Alpine image as the base image
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file of your application to the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Install MySQL client dependencies using apk
RUN apk update && apk add mysql-client

# Expose the port on which your Java application listens
EXPOSE 8085

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "/app/app.jar"]


