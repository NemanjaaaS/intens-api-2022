FROM maven:3.9.7 AS build

WORKDIR /app

COPY . /app

RUN mvn clean install

FROM openjdk:8-jdk

WORKDIR /app

COPY --from=build /app/target/praksa2022-0.0.1-SNAPSHOT.jar /app

ENV PORT=8080

CMD ["java", "-jar", "praksa2022-0.0.1-SNAPSHOT.jar"]
