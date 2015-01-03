FROM gitinsky/baseimage:0.1.0
MAINTAINER Git In Sky <support@gitinsky.com>

RUN useradd --no-create-home -g users --uid 22000 syncthing && mkdir /config && chown syncthing /config && apt-get install redir
ADD https://github.com/syncthing/syncthing/releases/download/v0.10.14/syncthing-linux-amd64-v0.10.14.tar.gz /syncthing.tar.gz
RUN tar -xzf syncthing.tar.gz && mv sync*/syncthing /syncthing && rm syncthing.tar.gz
ADD syncthing.rb /etc/eye/syncthing.rb
