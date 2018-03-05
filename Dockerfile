FROM anapsix/alpine-java

MAINTAINER Jerome Loisel

ADD target/app.jar app.jar

ADD entrypoint.sh /entrypoint.sh

EXPOSE 4567

ENTRYPOINT ["/entrypoint.sh"]
