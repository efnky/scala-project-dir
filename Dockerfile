FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21.0.5_11_1.10.7_2.13.16 AS builder
WORKDIR /src
COPY build.sbt ./
COPY project ./project
RUN sbt update
COPY src ./src
RUN sbt stage

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
RUN groupadd -r appuser && useradd -r -g appuser -u 1001 appuser
COPY --from=builder /src/target/universal/stage /app
EXPOSE 8080
USER 1001
CMD ["bin/scala-project-dir"]