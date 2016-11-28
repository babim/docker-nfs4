FROM babim/alpinebase

RUN apk add --no-cache nfs-utils && mkdir -p /nfs/data \
	&& rm -f /etc/exportfs && ln -sf /nfs/exportfs /etc/exportfs

EXPOSE 111/udp 2049/tcp

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/nfs"]
CMD ["/entrypoint.sh"]
