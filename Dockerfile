# Use the official Java runtime as a parent image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory in the container to /app
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/course-service.jar app.jar

# Expose port 8080 for our application
EXPOSE 8080

# Run the JAR file
CMD ["java","-jar","course-service.jar"]