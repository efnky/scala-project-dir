FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/* && \
    curl -fL https://github.com/sbt/sbt/releases/download/v1.10.6/sbt-1.10.6.tgz | tar -xz -C /opt && \
    ln -s /opt/sbt/bin/sbt /usr/local/bin/sbt
COPY project ./project
COPY build.sbt ./
RUN sbt update
COPY . .
RUN sbt compile