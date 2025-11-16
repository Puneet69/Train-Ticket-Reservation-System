# Use Eclipse Temurin (OpenJDK) 21
FROM eclipse-temurin:21-jdk-jammy AS build

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src
COPY WebContent ./WebContent

# Build the application
RUN mvn clean package -DskipTests

# Download webapp-runner using wget
RUN mkdir -p target/dependency && \
    wget -q https://repo1.maven.org/maven2/com/heroku/webapp-runner/9.0.96.1/webapp-runner-9.0.96.1.jar \
    -O target/dependency/webapp-runner-9.0.96.1.jar

# Runtime stage
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

# Copy WAR file and webapp-runner from build stage
COPY --from=build /app/target/TrainBook-1.0.0-SNAPSHOT.war ./app.war
COPY --from=build /app/target/dependency/webapp-runner-9.0.96.1.jar ./webapp-runner.jar

# Expose port (Railway will override with $PORT)
EXPOSE 8080

# Run the application
CMD java -jar webapp-runner.jar --port ${PORT:-8080} app.war
