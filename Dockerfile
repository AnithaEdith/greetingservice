FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/AnithaEdith/greetingservice.git
FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/greetingservice /app
RUN mvn install
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/hello.jar /app
CMD ["java -jar hello.jar"]
