# Build stage
FROM gradle:jdk17-jammy AS build
WORKDIR /home/gradle/src

COPY --chown=gradle:gradle . .
RUN gradle build --no-daemon

# Package stage
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Copy the built jar
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
