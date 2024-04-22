#!/usr/bin/env sh

MNT_DIR="$HOME/.mnt"
AWS_DIR="$HOME/.aws"
NFS_SERVER_MOUNT_DIR=/nfs-server

mkdir -p "$MNT_DIR" "$NFS_SERVER_MOUNT_DIR" "$AWS_DIR"
echo "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
" > "$AWS_DIR"/credentials
chmod 0600 "$AWS_DIR"/credentials
s3fs gisquick-backup "$MNT_DIR"
mount -t nfs4 "$NFS_SERVER_ADDRESS":/ $NFS_SERVER_MOUNT_DIR
tar -czf "$MNT_DIR"/qgis-server/backup-qgis-server-publish-"$(date '+%Y-%m-%d')".tar.gz /$NFS_SERVER_MOUNT_DIR/qgis-server-publish
tar -czf "$MNT_DIR"/qgis-server/backup-qgis-server-plugin-"$(date "+%Y-%m-%d")".tar.gz /$NFS_SERVER_MOUNT_DIR/qgis-server-plugin
umount "$MNT_DIR"
