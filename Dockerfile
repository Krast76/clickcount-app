FROM maven:3-openjdk-8 as build
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN mvn clean package

FROM jetty:9-jdk8
COPY --from=build /usr/src/app/target/clickCount.war /var/lib/jetty/webapps/ROOT.war
ENV REDIS_HOST redis
EXPOSE 8080

