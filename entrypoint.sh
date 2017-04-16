#! /bin/sh -e

set -m

# set value
FSTYPE2=${FSTYPE2:-$FSTYPE}
MOUNT_OPTIONS2=${MOUNT_OPTIONS2:-$MOUNT_OPTIONS}
SERVER2=${SERVER2:-$SERVER}
SHARE2=${SHARE2:-$SHARE}
MOUNTPOINT2=${MOUNTPOINT2:-$MOUNTPOINT}

FSTYPE3=${FSTYPE3:-$FSTYPE}
MOUNT_OPTIONS3=${MOUNT_OPTIONS3:-$MOUNT_OPTIONS}
SERVER3=${SERVER3:-$SERVER}
SHARE3=${SHARE3:-$SHARE}
MOUNTPOINT3=${MOUNTPOINT3:-$MOUNTPOINT}

FSTYPE4=${FSTYPE4:-$FSTYPE}
MOUNT_OPTIONS4=${MOUNT_OPTIONS4:-$MOUNT_OPTIONS}
SERVER4=${SERVER4:-$SERVER}
SHARE4=${SHARE4:-$SHARE}
MOUNTPOINT4=${MOUNTPOINT4:-$MOUNTPOINT}

FSTYPE5=${FSTYPE5:-$FSTYPE}
MOUNT_OPTIONS5=${MOUNT_OPTIONS5:-$MOUNT_OPTIONS}
SERVER5=${SERVER5:-$SERVER}
SHARE5=${SHARE5:-$SHARE}
MOUNTPOINT5=${MOUNTPOINT5:-$MOUNTPOINT}

# run
mkdir -p "$MOUNTPOINT"

rpcbind -f &
mount -t "$FSTYPE" -o "$MOUNT_OPTIONS" "$SERVER:$SHARE" "$MOUNTPOINT"
mount | grep nfs

# run other
if [[ ! -z "${SERVER2}" ]]; then
mkdir -p "$MOUNTPOINT2"
mount -t "$FSTYPE2" -o "$MOUNT_OPTIONS2" "$SERVER2:$SHARE2" "$MOUNTPOINT2"
mount | grep nfs
fi
if [[ ! -z "${SERVER3}" ]]; then
mkdir -p "$MOUNTPOINT3"
mount -t "$FSTYPE3" -o "$MOUNT_OPTIONS3" "$SERVER3:$SHARE3" "$MOUNTPOINT3"
mount | grep nfs
fi
if [[ ! -z "${SERVER4}" ]]; then
mkdir -p "$MOUNTPOINT4"
mount -t "$FSTYPE4" -o "$MOUNT_OPTIONS4" "$SERVER4:$SHARE4" "$MOUNTPOINT4"
mount | grep nfs
fi
if [[ ! -z "${SERVER5}" ]]; then
mkdir -p "$MOUNTPOINT5"
mount -t "$FSTYPE5" -o "$MOUNT_OPTIONS5" "$SERVER5:$SHARE5" "$MOUNTPOINT5"
mount | grep nfs
fi
fg
