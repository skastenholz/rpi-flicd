FROM balenalib/armv7hf-debian:sid-build as build
MAINTAINER Stefan Kastenholz <stefan.kastenholz@gmail.com>

RUN install_packages wget
RUN wget --no-check-certificate -qO - 'https://github.com/50ButtonsEach/fliclib-linux-hci/archive/2.0.2.tar.gz' | tar xvz

FROM balenalib/armv7hf-debian:sid-run

VOLUME /var/local/flicd/data
COPY --from=build fliclib-linux-hci-2.0.2/bin/armv6l/flicd .

EXPOSE 5551

CMD ./flicd -f /var/local/flicd/data/flic.sqlite3 -s 0.0.0.0 -p 5551
