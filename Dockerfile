FROM stackbrew/ubuntu:precise
MAINTAINER Jesse Reynolds @jessereynolds

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    ruby1.9.1-full \
    libssl-dev \
    libreadline-dev \
    libxslt1-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libexpat1-dev \
    libicu-dev

RUN gem install bundler --no-ri --no-rdoc

RUN git clone https://github.com/flapjack/omnibus-ubuntu.git && \
    cd omnibus-ubuntu && \
    bundle install --binstubs

RUN git clone --branch omnibus3 https://github.com/flapjack/omnibus-flapjack.git && \
    cd omnibus-flapjack && \
    bundle install --binstubs && \
    bin/omnibus build flapjack-dependencies

