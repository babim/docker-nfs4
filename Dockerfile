FROM babim/debianbase

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y nfs-common inotify-tools -qq

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

ADD nfs-client.sh /usr/local/bin/nfs-client
RUN chmod +x /usr/local/bin/nfs-client
ENTRYPOINT ["/usr/local/bin/nfs-client"]

