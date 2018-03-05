FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/hello.jar app.jar
EXPOSE 4567
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]