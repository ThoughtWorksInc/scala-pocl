FROM popatry/scala-pocl:miniconda3-pocl

LABEL maintainer "Yang Bo <atryyang@thoughtworks.com>"

RUN echo deb http://ftp.debian.org/debian jessie-backports main contrib non-free >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install apt-transport-https -y && \
    rm -rf /var/lib/apt/lists/*

RUN (echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list) && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && apt-get install sbt openjdk-8-jdk -y && \
    rm -rf /var/lib/apt/lists/*
