FROM ubuntu:22.04

RUN apt-get update && apt-get -y --no-install-recommends install \
    7zip \
    ca-certificates \
    curl \
    fontforge=1:20201107* \
    python2 \
    ttfautohint=1.8.3-2build1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py \
    && python2 get-pip.py \
    && pip2 install --no-cache-dir fonttools==3.44.0 \
    && rm get-pip.py
WORKDIR /src
