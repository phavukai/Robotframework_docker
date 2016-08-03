FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y \
    firefox=45.0.2+build1-0ubuntu1 \
    python3-pip \
    libglu1 \
    python-dev \
    libudev-dev \
    python3-tk \
    python3-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    robotframework \
    future \
    python-uinput \
    python_xlib


RUN wget https://github.com/HelioGuilherme66/robotframework-selenium2library/archive/v1.8.0b1.tar.gz \
    && tar xvfz v1.8.0b1.tar.gz \
    && cd robotframework-selenium2library-1.8.0b1/ \
    && python3 setup.py install \
    && cd .. \
    && rm -rf v1.8.0b1.tar.gz robotframework-selenium2library-1.8.0b1




ENV DISPLAY=xvfb:0


RUN pip3 install \
    pyautogui



WORKDIR /
COPY pybot.sh /usr/local/bin/
RUN chmod ug+x /usr/local/bin/pybot.sh
ENTRYPOINT ["/usr/local/bin/pybot.sh"]
CMD ["--help"]
