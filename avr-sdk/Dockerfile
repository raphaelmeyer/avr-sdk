FROM raphaelmeyer/base:1.0.0

MAINTAINER Raphael Meyer <raphael.meyer@bbv.ch>

USER root

RUN apt-get update && apt-get install -y \
  avr-libc \
  avrdude \
  gdb \
  gcc-avr \
  cmake \
  make

USER user

VOLUME ["/workspace"]
WORKDIR /workspace

