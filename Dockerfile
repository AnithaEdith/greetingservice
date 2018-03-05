FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/AnithaEdith/greetingservice.git (1)
FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/greetingservice /app (2)
RUN mvn install (3)
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/hello.jar /app (4)
EXPOSE 4567
CMD ["java -jar hello.jar"] (5)