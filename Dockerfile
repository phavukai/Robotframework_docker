FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y \
    firefox=45.0.2+build1-0ubuntu1 \
    python3-pip \
    libglu1 \
    python-dev \
    libudev-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    robotframework \
    future \
    python-uinput \
    robotframework-selenium2library


ENV DISPLAY=xvfb:0

WORKDIR /
COPY pybot.sh /usr/local/bin/
RUN chmod ug+x /usr/local/bin/pybot.sh
ENTRYPOINT ["/usr/local/bin/pybot.sh"]
CMD ["--help"]
