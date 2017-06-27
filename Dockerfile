FROM ubuntu:16.04

MAINTAINER Stanley Förster <stanley.foerster@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp/tex

RUN \
    apt-get -qq -y update && \
    apt-get -qq -y dist-upgrade && \
    apt-get -qq -y install \
        wget \
        perl-tk \
        ghostscript \
        make \
    && \    
    apt-get -qq -y clean

COPY texlive-full.profile .

RUN \
    wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar --strip-components 1 -xf install-tl-unx.tar.gz && \
    ./install-tl -profile texlive-full.profile -repository http://ftp.fernuni-hagen.de/ftp-dir/pub/mirrors/www.ctan.org/systems/texlive/tlnet

ENV MANPATH="/usr/local/texlive/texmf-dist/doc/man:${MANPATH}"
ENV INFOPATH="/usr/local/texlive/texmf-dist/doc/info:${INFOPATH}"
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"

WORKDIR /tex

RUN rm -rf /tmp/tex
