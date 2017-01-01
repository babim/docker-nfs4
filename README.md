Thanks cpuguy83

# NFS4
[NFS v4 server](http://nfs.sourceforge.net/)

## RUN
`docker run -it --name nfs-server -p 111:111/tcp -p 111:111/udp -p 2049:2049/tcp -p 2049:2049/udp --privileged -v /nfsdata:/share babim/nfs:debian  /share/to/share /share/to/share2 /share/to/shareN`

## ENVIRONMENT VALUE
`volume = /share`
```
FOLDERSHARE (default: rw,async,no_root_squash,no_subtree_check)
FOLDERIP (default: *)
```
