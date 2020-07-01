ARG REPOSITORY=https://github.com/gordalina/cachetool.git
ARG REF=5.1.3
ARG TARGET_DIR=/opt/cachetool

FROM composer:latest AS builder

ARG REPOSITORY
ARG REF
ARG TARGET_DIR

WORKDIR ${TARGET_DIR}

RUN cd ${TARGET_DIR} \
 && git clone ${REPOSITORY} .

RUN git checkout ${REF} \
 && composer install --no-dev --optimize-autoloader \
 && rm -rf .git*


FROM php:7.4-cli-buster

MAINTAINER Sbit.io <soporte@sbit.io>

ARG TARGET_DIR

WORKDIR ${TARGET_DIR}

ENV PATH=$PATH:$TARGET_DIR/bin

COPY --from=builder ${TARGET_DIR} ${TARGET_DIR}

ENTRYPOINT [ "/opt/cachetool/bin/cachetool" ]
CMD [ "list" ]
