Docker NFS Server
================
Thanks cpuguy83

Usage
----

```bash
docker run -d --name nfs-client --link nfs:nfs babim/nfs:client.debian /path/on/nfs/server:/path/on/client
``` 

Environment:

* Your server NFS default is nfs
* use `-e SERVERIP=192.168.1.10` to set nfs server IP