FROM ubuntu:14.04
MAINTAINER mib4fun <jeanvincent45@gmail.com>

# Install Spotify and PulseAudio.
WORKDIR /usr/src
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 \
	&& echo deb http://repository.spotify.com stable non-free > /etc/apt/sources.list.d/spotify.list \
	&& apt-get update \
	&& apt-get install -y \
		spotify-client xdg-utils libxss1 \
		pulseaudio \
		ttf-wqy-zenhei \
	&& apt-get clean \
	&& echo enable-shm=no >> /etc/pulse/client.conf

RUN apt-get install -qqy wget   apache2 apache2-bin apache2-data apache2-utils file inotify-tools libapache2-mod-php5 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libinotifytools0 libjson-c2 liblua5.1-0 libmagic1 libonig2 libperl4-corelibs-perl libqdbm14 libqt4-xml libqtcore4 libqtdbus4 lsof mime-support php5-cli php5-common php5-curl php5-json php5-readline php5-sqlite psmisc qdbus qtchooser qtcore4-l10n ssl-cert xautomation
RUN cd /tmp && \
    wget http://www.olejon.net/code/spotcommander/files/spotcommander-latest.deb && \
        dpkg -i spotcommander-latest.deb

# Spotify data.
VOLUME ["/data/cache", "/data/config"]
WORKDIR /data
RUN mkdir -p /data/cache \
	&& mkdir -p /data/config

# PulseAudio server.
ENV PULSE_SERVER /run/pulse/native

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["spotify"]
