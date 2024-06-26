# syntax=docker/dockerfile:1

FROM openjdk:17-buster

ARG ATM9SKY_VERSION

LABEL version=${ATM9SKY_VERSION:-1.0.3}

RUN apt-get update && apt-get upgrade -y

RUN apt-get update && apt-get install -y curl unzip && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]
