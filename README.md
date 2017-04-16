#### Thanks https://github.com/flaccid/docker-nfs-client

## RUN
Basic example, mounting NFS within container:
```
$ docker run -it --privileged=true --net=host -v /mnt/nfs-1 -e SERVER=192.168.0.9 -e SHARE=movies babim/nfs:client
```
Writing back to the host:


```
docker run -itd \
    --privileged=true \
    --net=host \
    --name nfs-movies \
    -v /media/nfs-movies:/mnt/nfs-1:shared \
    -e SERVER=192.168.0.9 \
    -e SHARE=movies \
    babim/nfs:client
```
