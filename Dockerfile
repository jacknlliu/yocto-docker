FROM ubuntu:16.04

MAINTAINER Jack Liu <jacknlliu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ENV NORMAL_USER yocto

# install yocto essential
RUN apt-get -y update && apt-get install -q -y --no-install-recommends gawk wget git-core diffstat unzip texinfo gcc-multilib \
build-essential chrpath socat libsdl1.2-dev xterm cpio file

# install FASTRTPS dependencies
RUN apt-get install -q -y  --no-install-recommends libboost-all-dev cmake


# install basic tools
RUN apt-get install -q -y  --no-install-recommends vim

# setup sudoers
RUN apt-get install -q -y --no-install-recommends sudo

RUN adduser --home /home/$NORMAL_USER --disabled-password $NORMAL_USER

RUN echo "$NORMAL_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/99_aptget


# apt-get autoclean
RUN apt-get autoclean -y \
&& apt-get autoremove -y \
&& rm -rf /var/lib/apt/lists/*

# switch to $NORMAL_USER
ENV HOME /home/$NORMAL_USER
USER $NORMAL_USER
