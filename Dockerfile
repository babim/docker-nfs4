FROM babim/debianbase
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install -y nfs-kernel-server runit inotify-tools -qq && mkdir /share \
	&& rm -f /etc/exports && ln -sf /share/exports /etc/exports
RUN mkdir -p /exports

RUN mkdir -p /etc/sv/nfs
ADD nfs.init /etc/sv/nfs/run
ADD nfs.stop /etc/sv/nfs/finish

ADD nfs_setup.sh /usr/local/bin/nfs_setup

RUN chmod +x /usr/local/bin/nfs_setup && \
    chmod +x /etc/sv/nfs/finish && \
    chmod +x /etc/sv/nfs/run

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

VOLUME /exports

EXPOSE 111/udp 2049/tcp

ENTRYPOINT ["/usr/local/bin/nfs_setup"]
