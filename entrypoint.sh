#!/bin/sh -e

# set value
FOLDER1=${FOLDER1:-data}
FOLDER1SHARE=${FOLDER1SHARE:-rw,async,no_root_squash,no_subtree_check}
FOLDER1IP=${FOLDER1IP:-*}

FOLDERSHARE=${FOLDER1SHARE:-rw,async,no_root_squash,no_subtree_check}
FOLDERIP=${FOLDER1IP:-*}

#FOLDER2=${FOLDER2:-data2}
FOLDER2SHARE=${FOLDER2SHARE:-$FOLDER1SHARE}
FOLDER2IP=${FOLDER2IP:-*}

#FOLDER3=${FOLDER3:-data3}
FOLDER3SHARE=${FOLDER3SHARE:-$FOLDER1SHARE}
FOLDER3IP=${FOLDER3IP:-*}

#FOLDER4=${FOLDER4:-data4}
FOLDER4SHARE=${FOLDER4SHARE:-$FOLDER1SHARE}
FOLDER4IP=${FOLDER4IP:-*}

# set config
if [ ! -f "/share/exports" ]; then
  touch /share/exports

if [[ ! -z "${FOLDER}" ]]; then
for mnt in "${FOLDER}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  mkdir -p $src
  echo "$src $FOLDERIP($FOLDERSHARE)" >> /share/exports
done
fi

if [[ ! -z "${FOLDER1}" ]]; then
if [ ! -d "/share/$FOLDER1" ]; then mkdir -p /share/$FOLDER1; fi
cat <<EOF>> /share/exports

## share $FOLDER1
/share/$FOLDER1 $FOLDER1IP($FOLDER1SHARE)
EOF
fi

if [[ ! -z "${FOLDER2}" ]]; then
if [ ! -d "/share/$FOLDER2" ]; then mkdir -p /share/$FOLDER2; fi
cat <<EOF>> /share/exports

## share $FOLDER2
/share/$FOLDER2 $FOLDER2IP($FOLDER2SHARE)
EOF
fi

if [[ ! -z "${FOLDER3}" ]]; then
if [ ! -d "/share/$FOLDER3" ]; then mkdir -p /share/$FOLDER3; fi
cat <<EOF>> /share/exports

## share $FOLDER3
/share/$FOLDER3 $FOLDER3IP($FOLDER3SHARE)
EOF
fi

if [[ ! -z "${FOLDER4}" ]]; then
if [ ! -d "/share/$FOLDER4" ]; then mkdir -p /share/$FOLDER4; fi
cat <<EOF>> /share/exports

## share $FOLDER4
/share/$FOLDER4 $FOLDER4IP($FOLDER4SHARE)
EOF
fi

fi

if [ ! -d "/proc/fs/nfsd" ]; then mkdir -p /proc/fs/nfsd; fi
if [ ! -d "/proc/fs/nfs" ]; then mkdir -p /proc/fs/nfs; fi

# run services
/usr/sbin/exportfs -r
/sbin/rpcbind --
/usr/sbin/rpc.nfsd |:
/usr/sbin/rpc.mountd -F
