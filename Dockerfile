# Use Eclipse Temurin (OpenJDK) 21
FROM eclipse-temurin:21-jdk-jammy AS build

# Install Maven and wget
RUN apt-get update && \
    apt-get install -y maven wget && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src
COPY WebContent ./WebContent

# Build the application (this also downloads webapp-runner via pom.xml)
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Copy WAR file and webapp-runner from build stage
COPY --from=build /app/target/TrainBook-1.0.0-SNAPSHOT.war ./app.war
COPY --from=build /app/target/dependency/webapp-runner.jar ./webapp-runner.jar

# Expose port (Railway will override with $PORT)
EXPOSE 8080

# Run the application
CMD java -jar webapp-runner.jar --port ${PORT:-8080} app.war
