FROM babim/alpinebase

ENV FSTYPE nfs4
ENV MOUNT_OPTIONS nfsvers=4
ENV MOUNTPOINT /mnt/nfs-1

RUN apk add --no-cache nfs-utils

# would only be used if extending an running a different main process in fg
# RUN rc-update add nfs

# https://github.com/rancher/os/issues/641#issuecomment-157006575
RUN rm /sbin/halt /sbin/poweroff /sbin/reboot

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
