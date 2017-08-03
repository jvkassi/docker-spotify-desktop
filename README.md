docker.io - Spotify Desktop
===================================================

Simple dockerfile for launching spotfiy desktop app


Configuration
------------


None


Pull the image it
--------

`docker pull mib4fun/spotify-desktop`


Run it
------

Replace the variables

```bash

docker run  \
  --env=DISPLAY=unix$DISPLAY \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
  --volume=/run/user/$USER_UID/pulse:/run/pulse:ro \
  -d spotify

```


Or build it
------------

```bash
git clone https://github.com/mib4fun/docker-spotify-desktop
cd docker-spotify-desktop
docker build -t spotify-desktop .
```
