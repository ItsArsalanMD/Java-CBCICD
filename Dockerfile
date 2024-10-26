# Use the official OpenJDK image as a base image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the compiled jar file to the container
COPY target/*.jar app.jar

# Define the entry point to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
