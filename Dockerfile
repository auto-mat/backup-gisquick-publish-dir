FROM debian:bookworm

LABEL authors="Auto*Mat, z. s. auto-mat@auto-mat.cz"
LABEL maintainer="Auto*Mat, z. s. auto-mat@auto-mat.cz"

RUN apt-get update -y && apt-get install -y s3fs nfs-common;
COPY ./backup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/backup.sh

CMD ["/bin/sh"]