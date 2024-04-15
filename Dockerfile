FROM alpine:3.19

LABEL authors="Auto*Mat, z. s. auto-mat@auto-mat.cz"
LABEL maintainer="Auto*Mat, z. s. auto-mat@auto-mat.cz"

RUN apk add --update --no-cache nfs-utils wget; \
    cd /usr/local/bin/ \
    && wget https://github.com/kahing/goofys/releases/latest/download/goofys \
    && chmod +x goofys
COPY ./backup.sh /usr/local/bin
RUN chmod +x /usr/local/bin/backup.sh

CMD ["/bin/sh"]