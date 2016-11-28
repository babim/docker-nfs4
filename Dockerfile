FROM babim/alpinebase

RUN apk add --no-cache nfs-utils && mkdir -p /nfs/config /nfs/data

EXPOSE 111/udp 2049/tcp

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/nfs"]
CMD ["/entrypoint.sh"]
