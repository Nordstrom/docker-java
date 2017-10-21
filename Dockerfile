FROM quay.io/nordstrom/baseimage-ubuntu:16.04
MAINTAINER Nordstrom Kubernetes Platform Team "techk8s@nordstrom.com"

USER root

RUN apt-get update -qy \
 && apt-get install -qy \
      openjdk-8-jre-headless

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_OPTS ""
ENV JAVA_JAR  ""
ENV JAVA_ARGS ""

RUN update-ca-certificates --fresh

USER nordstrom

# shell form of CMD to enable env var interpolation
# `exec` to ensure signal propagation to JVM
# unquoted $JAVA_OPTS and $JAVA_ARGS to allow multiple values in each var
# quoted $JAVA_JAR to support whitespace in path to JAR
CMD exec java $JAVA_OPTS -jar "$JAVA_JAR" $JAVA_ARGS
