FROM golang:1.13-alpine

ARG TERRAFORM_VERSION=0.12.8
ARG FLYWAY_VERSION=6.0.7

RUN apk --no-cache add make git zip curl bash openjdk8 nss

RUN curl -O https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/

RUN curl -O https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    tar xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    rm flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    ln -s `pwd`/flyway-${FLYWAY_VERSION}/flyway /usr/local/bin/flyway
