#### Thanks https://github.com/flaccid/docker-nfs-client

## RUN
`docker run -it --privileged=true --net=host -v /mnt/nfs babim/nfs:client 192.168.1.100:/mnt/nfs /mnt/nfs`
