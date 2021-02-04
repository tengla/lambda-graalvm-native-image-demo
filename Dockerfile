FROM gradle:6.3.0-jdk11 as builder
COPY --chown=gradle:gradle . /usr/src/app
WORKDIR /usr/src/app
RUN ./gradlew build --no-daemon

# graalvm native-image on lambda
FROM amazonlinux:2018.03.0.20191014.0 as graalvm
ENV LANG=en_US.UTF-8
RUN yum install -y gcc gcc-c++ libc6-dev zlib1g-dev curl bash zlib zlib-devel zip
ENV GRAAL_VERSION 21.0.0
ENV JDK_VERSION java11
ENV GRAAL_FILENAME graalvm-ce-${JDK_VERSION}-linux-amd64-${GRAAL_VERSION}.tar.gz
RUN curl -4 -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/${GRAAL_FILENAME} -o /tmp/${GRAAL_FILENAME}
RUN tar -zxvf /tmp/${GRAAL_FILENAME} -C /tmp \
    && mv /tmp/graalvm-ce-${JDK_VERSION}-${GRAAL_VERSION} /usr/lib/graalvm
RUN rm -rf /tmp/*
CMD ["/usr/lib/graalvm/bin/native-image"]

FROM graalvm
ENV APP_VERSION 0.1
COPY --from=builder /usr/src/app /usr/src/app
WORKDIR /usr/src/app
RUN /usr/lib/graalvm/bin/gu install native-image
RUN /usr/lib/graalvm/bin/native-image --install-exit-handlers \
    --no-fallback \
    -jar build/libs/trafficinfo-baseline-lambda-${APP_VERSION}}-all.jar
RUN chmod 777 bootstrap lambda
RUN zip -j function.zip bootstrap lambda
EXPOSE 8080
ENTRYPOINT ["/usr/src/app/lambda"]
