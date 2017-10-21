# docker-java

Nordstrom's Ubuntu-derived baseimage for Java. This repository includes both an image with a headless JRE, published to `quay.io/nordstrom/java`, and an image with a full JDK, published to `quay.io/nordstrom/java-jdk`. The JRE image is intended to be used as a deployable runtime environment, while the JDK image is intended to be used as a build environment (at least as the basis for one).

The JRE image includes a `CMD` that supports specifying `JAVA_OPTS`, `JAVA_JAR`, and `JAVA_ARGS` in derived images. Intended usage is as follows:

- supply JVM flags in `JAVA_OPTS`, ex: `-Xms2048m -Xmx2048m`
- supply path to JAR file in `JAVA_JAR`, ex: `/app.jar`
- supply args to application in `JAVA_ARGS`, ex: `config.yaml`

With the values mentioned in the examples above, the final command would be:

```
java -Xms2048m -Xmx2048m -jar /app.jar config.yaml
```

We intend to publish a tag for each image for each major version of Java[1]. We will probably only actively maintain images for a single major Java version at a time (so far, just `8`).

[1] Yes, this means that we overwrite the tag value when updating. Maintaining fine-grained versioning in the `FROM` of a Dockerfile is a significant hassle (which would be necessary if we used immutable tags), so mutating the tag value is a compromise.
