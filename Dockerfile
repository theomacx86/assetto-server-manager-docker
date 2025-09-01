FROM ubuntu:25.04

EXPOSE 8772
EXPOSE 9600
EXPOSE 9600/udp
EXPOSE 8081

#Install SSL certificates and SteamCMD
RUN  add-apt-repository multiverse;  dpkg --add-architecture i386;  apt update; \
    echo steam steam/question select "I AGREE" |  debconf-set-selections; \
    echo steam steam/license note '' | debconf-set-selections; \
    yes |  apt install steamcmd; ln -s /usr/games/steamcmd /bin/steamcmd; \
    apt-get update && apt-get install -y ca-certificates wget unzip;

#Install Server Manager
RUN wget https://github.com/JustaPenguin/assetto-server-manager/releases/download/v1.7.9/server-manager_v1.7.9.zip; \
    unzip server-manager_v1.7.9.zip; mv linux/ server/; rm -fr server/config.yml;

WORKDIR /server
ENTRYPOINT ./server-manager
