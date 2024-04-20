#!/usr/bin/env sh

MNT_DIR="$HOME/.mnt"
NFS_SERVER_MOUNT_DIR=/nfs-server

mkdir -p "$MNT_DIR" "$NFS_SERVER_MOUNT_DIR"
goofys gisquick-backup "$MNT_DIR"
mount -t nfs4 "$NFS_SERVER_ADDRESS":/ $NFS_SERVER_MOUNT_DIR
tar -czf ./.mnt/qgis-server/backup-qgis-server-publish-"$(date '+%Y-%m-%d')".tar.gz /$NFS_SERVER_MOUNT_DIR/qgis-server-publish
tar -czf ./.mnt/qgis-server/backup-qgis-server-plugin-"$(date "+%Y-%m-%d")".tar.gz /$NFS_SERVER_MOUNT_DIR/qgis-server-plugin
umount "$MNT_DIR"
