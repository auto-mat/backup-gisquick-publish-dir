# K8 backup-gisquick-qgis-server-files Docker image

### Usage
K8 Cron job backup GISQUICK QGIS server files on the AWS S3 gisquick-backup bucket.

### Build Docker backup-gisquick-qgis-server-files image and run container

```bash
# Build Docker image
docker buildx build -t backup-gisquick-qgis-server-files .

# Run Docker container
docker run -it --rm \
--env="AWS_ACCESS_KEY_ID=<CHANGE_IT>" \
--env="AWS_SECRET_ACCESS_KEY=<CHANGE_IT>" \
--env="NFS_SERVER_ADDRESS=<CHANGE_IT>" \
--name=backup-gisquick-qgis-server-files \
backup-gisquick-qgis-server-files OR auto0mat/backup-gisquick-qgis-server-files:latest
```

### Licence

[GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html) or later.
