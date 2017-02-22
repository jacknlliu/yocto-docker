FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# install yocto essential
RUN apt-get -y update && apt-get install -q -y --no-install-recommends gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat libsdl1.2-dev xterm cpio file

# install FASTRTPS dependencies
RUN apt-get install -q -y  --no-install-recommends libboost-all-dev cmake

RUN useradd -m --disabled-password yocto

USER yocto
