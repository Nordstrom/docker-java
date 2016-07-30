FROM quay.io/nordstrom/baseimage-ubuntu:16.04
MAINTAINER Store Modernization Platform Team "stmdrnztnpfrm@nordstrom.com"

USER root

RUN apt-get update -qy \
 && apt-get install -qy \
      openjdk-8-jre-headless

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN update-ca-certificates --fresh

USER ubuntu
