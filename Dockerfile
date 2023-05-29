FROM ubuntu:20.04

WORKDIR /app

COPY . /app

RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common

RUN chmod +x prepare_env.sh

RUN ./prepare_env.sh
