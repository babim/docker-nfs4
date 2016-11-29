FROM babim/alpinebase

RUN apk add --no-cache nfs-utils && mkdir -p /share/data \
	&& rm -f /etc/exports && ln -sf /share/exports /etc/exports

EXPOSE 111/udp 2049/tcp

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/share"]
CMD ["/entrypoint.sh"]
