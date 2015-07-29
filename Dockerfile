FROM ubuntu:15.04

RUN \
  apt-get -y install apt-transport-https curl && \
  echo "deb https://deb.nodesource.com/node_0.12 vivid main" > /etc/apt/sources.list.d/nodesource.list && \
  echo "deb-src https://deb.nodesource.com/node_0.12 vivid main" >> /etc/apt/sources.list.d/nodesource.list && \
  curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  apt-get -qq update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install \
  libpq-dev \
  libgeos-dev \
  python \
  nodejs \
  git \
  > /dev/null \
  && apt-get clean && rm -rf /var/lib/apt/lists/* && rm /etc/apt/sources.list.d/nodesource.list

# update pip
RUN curl https://raw.githubusercontent.com/pypa/pip/master/contrib/get-pip.py | python

ENV C_FORCE_ROOT=1
ENV PORT=8080
EXPOSE 8080

WORKDIR /qudos/
