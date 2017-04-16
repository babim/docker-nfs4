FROM babim/alpinebase

RUN apk add --no-cache nfs-utils && mkdir -p /share /mnt/nfs /var/www/uploads

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
