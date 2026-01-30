# Use the official Java runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container to /app
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/CICDNew-0.0.1-SNAPSHOT.jar CICDNew.jar

# Expose port 8080 for our application
EXPOSE 8080

# Run the JAR file
CMD ["java","-jar","CICDNew.jar"]