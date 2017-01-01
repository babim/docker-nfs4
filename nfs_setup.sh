#!/bin/bash

set -e

FOLDERSHARE=${FOLDERSHARE:-rw,async,no_root_squash,no_subtree_check}
FOLDERIP=${FOLDERIP:-*}

if [ ! -f "/share/exports" ]; then
mounts="${@}"

for mnt in "${mounts[@]}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  mkdir -p $src
  echo "$src $FOLDERIP($FOLDERSHARE)" >> /share/exports
done
fi

exec runsvdir /etc/sv
