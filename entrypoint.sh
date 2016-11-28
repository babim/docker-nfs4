#!/bin/sh -eu

# set value
FOLDER1=${FOLDER1:-data}
FOLDER1SHARE=${FOLDER1SHARE:-rw,fsid=0,root_squash,no_subtree_check,insecure}
FOLDER1IP=${FOLDER1IP:-*}

#FOLDER2=${FOLDER2:-data}
FOLDER2SHARE=${FOLDER2SHARE:-rw,fsid=0,root_squash,no_subtree_check,insecure}
FOLDER2IP=${FOLDER2IP:-*}

#FOLDER3=${FOLDER3:-data}
FOLDER3SHARE=${FOLDER3SHARE:-rw,fsid=0,root_squash,no_subtree_check,insecure}
FOLDER3IP=${FOLDER3IP:-*}

#FOLDER4=${FOLDER4:-data}
FOLDER4SHARE=${FOLDER4SHARE:-rw,fsid=0,root_squash,no_subtree_check,insecure}
FOLDER4IP=${FOLDER4IP:-*}

# set config
if [ ! -f "/nfs/exportfs" ]; then
if [ ! -D "/nfs/$FOLDER1" ]; then mkdir -p /nfs/$FOLDER1; fi
cat <<EOF>> /nfs/exportfs
/nfs/$FOLDER1 $FOLDER1IP($FOLDER1SHARE)
EOF

if [[ ! -z "${FOLDER2}" ]]; then
if [ ! -D "/nfs/$FOLDER2" ]; then mkdir -p /nfs/$FOLDER2; fi
cat <<EOF>> /nfs/exportfs
/nfs/$FOLDER2 $FOLDER2IP($FOLDER2SHARE)
EOF
fi
if [[ ! -z "${FOLDER3}" ]]; then
if [ ! -D "/nfs/$FOLDER3" ]; then mkdir -p /nfs/$FOLDER3; fi
cat <<EOF>> /nfs/exportfs
/nfs/$FOLDER3 $FOLDER3IP($FOLDER3SHARE)
EOF
fi
if [[ ! -z "${FOLDER4}" ]]; then
if [ ! -D "/nfs/$FOLDER4" ]; then mkdir -p /nfs/$FOLDER4; fi
cat <<EOF>> /nfs/exportfs
/nfs/$FOLDER4 $FOLDER4IP($FOLDER4SHARE)
EOF
fi

fi

# run services
/usr/sbin/exportfs -r
/sbin/rpcbind --
/usr/sbin/rpc.nfsd |:
/usr/sbin/rpc.mountd -F
