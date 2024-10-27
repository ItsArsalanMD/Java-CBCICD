# Use the official Maven image to build the project
FROM maven:3-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the project and package it as a jar file
RUN mvn clean package

# Use a lightweight JDK image to run the application
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Define the entry point to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
