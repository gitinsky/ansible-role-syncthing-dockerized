FROM gitinsky/baseimage:0.1.0
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 8080

RUN useradd -m -g users --uid {{ syncthing_uid }} syncthing && mkdir /config && chown syncthing /config && apt-get update && apt-get install redir && mkdir /home/syncthing/Sync && chown syncthing /home/syncthing/Sync
VOLUME /home/syncthing/Sync
ADD https://github.com/syncthing/syncthing/releases/download/v0.10.14/syncthing-linux-amd64-v0.10.14.tar.gz /syncthing.tar.gz
RUN tar -xzf syncthing.tar.gz && mv sync*/syncthing /syncthing && rm syncthing.tar.gz
ADD syncthing.rb /etc/eye/syncthing.rb
