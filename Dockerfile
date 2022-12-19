FROM ubuntu:22.04

WORKDIR /src
COPY . .
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl \
    fontforge=1:20201107~dfsg-4build1 \
    python2 \
    ttfautohint=1.8.3-2build1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py \
    && python2 get-pip.py \
    && pip2 install --no-cache-dir fonttools==3.44.0
ENTRYPOINT ["./make_hackgen.sh"]