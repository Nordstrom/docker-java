FROM nordstrom/baseimage-ubuntu:14.04.3
MAINTAINER Innovation Platform Team "invcldtm@nordstrom.com"

RUN apt-get update -qy \
 && apt-get install -qy \
     openjdk-7-jre-headless

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
