FROM debian:buster

RUN apt-get update && \
    apt-get install -y texlive-full python3-pygments make && \
    apt-get purge -y *-doc && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*i

RUN echo "Europe/Berlin" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

VOLUME ["/latex"]
WORKDIR /latex
CMD ["make","remake"]

