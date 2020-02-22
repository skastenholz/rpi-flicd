FROM balenalib/armv7hf-debian:sid-build
MAINTAINER Stefan Kastenholz <stefan.kastenholz@gmail.com>

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget --no-check-certificate -qO - 'https://github.com/50ButtonsEach/fliclib-linux-hci/archive/2.0.1.tar.gz' | tar xvz
RUN cd fliclib-linux-hci-* && mv bin/armv6l/flicd /usr/local/bin/flicd && cd .. && rm -r fliclib-linux-hci-*

VOLUME /var/local/flicd/data

EXPOSE 5551

CMD /usr/local/bin/flicd -f /var/local/flicd/data/flic.sqlite3 -s 0.0.0.0 -p 5551
