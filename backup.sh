#!/usr/bin/env sh

MNT_S3_BUCKET_DIR="$HOME/.mnt_s3_bucket"
AWS_CREDENTIALS_DIR="$HOME/.aws"
NFS_SERVER_MOUNT_DIR="$HOME/.mnt_nfs_server"

mkdir -p "$MNT_S3_BUCKET_DIR" "$NFS_SERVER_MOUNT_DIR" "$AWS_CREDENTIALS_DIR"
echo "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
" > "$AWS_CREDENTIALS_DIR"/credentials
chmod 0600 "$AWS_CREDENTIALS_DIR"/credentials
s3fs gisquick-backup "$MNT_S3_BUCKET_DIR"
mount -t nfs4 "$NFS_SERVER_ADDRESS":/ "$NFS_SERVER_MOUNT_DIR"
tar -czf "$MNT_S3_BUCKET_DIR"/qgis-server/backup-qgis-server-publish-"$(date '+%Y-%m-%d')".tar.gz "$NFS_SERVER_MOUNT_DIR"/qgis-server-publish
tar -czf "$MNT_S3_BUCKET_DIR"/qgis-server/backup-qgis-server-plugin-"$(date "+%Y-%m-%d")".tar.gz "$NFS_SERVER_MOUNT_DIR"/qgis-server-plugin
umount "$MNT_S3_BUCKET_DIR"
