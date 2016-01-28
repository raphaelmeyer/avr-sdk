FROM raphaelmeyer/avr-base

MAINTAINER Raphael Meyer <raphael.meyer@bbv.ch>

USER root

RUN apt-get update && apt-get install -y \
  gcc-avr \
  cmake \
  make

USER user

VOLUME ["/workspace"]
WORKDIR /workspace

