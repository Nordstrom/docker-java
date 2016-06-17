FROM quay.io/nordstrom/baseimage-ubuntu:16.04
MAINTAINER Innovation Platform Team "invcldtm@nordstrom.com"

USER root

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86F44E2A \
 && echo "deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main" \
      > /etc/apt/sources.list.d/java.list

RUN apt-get update -qy \
 && apt-get install -qy \
      openjdk-8-jre-headless

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN update-ca-certificates --fresh

USER ubuntu