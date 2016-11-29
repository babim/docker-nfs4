Thanks JoeBiellik

# NFS4
[NFS v4 server](http://nfs.sourceforge.net/) server running on [Alpine Linux](https://hub.docker.com/_/alpine/).

## RUN
`docker run -it --name nfs-server -p 111:111/tcp -p 111:111/udp -p 2049:2049/tcp -p 2049:2049/udp --privileged -v /nfsdata:/share babim/nfs`

## ENVIRONMENT VALUE
`volume = /share`
```
FOLDER1 (default: data)
FOLDER1SHARE (default: rw,async,no_root_squash,no_subtree_check)
FOLDER1IP (default: *)

FOLDER2
FOLDER2SHARE
FOLDER2IP

FOLDER3
FOLDER3SHARE
FOLDER3IP

FOLDER4
FOLDER4SHARE
FOLDER4IP
```
