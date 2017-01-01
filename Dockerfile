FROM babim/alpinebase

RUN apk add --no-cache nfs-utils && mkdir /share

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
