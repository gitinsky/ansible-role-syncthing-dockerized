FROM alpine:3.4
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 8080
EXPOSE 22000

RUN apk update && apk add sudo && adduser -D -G users -u {{ syncthing_uid }} syncthing && mkdir /config && chown syncthing /config && mkdir /home/syncthing/Sync && chown syncthing /home/syncthing/Sync
VOLUME /home/syncthing/Sync
ADD https://github.com/syncthing/syncthing/releases/download/v0.14.13/syncthing-linux-amd64-v0.14.13.tar.gz /syncthing.tar.gz
RUN tar -xzf syncthing.tar.gz && mv sync*/syncthing /syncthing && rm syncthing.tar.gz
CMD ["/usr/bin/sudo","-u","syncthing","/syncthing","-home","/config","-gui-address=0.0.0.0:8080"]
