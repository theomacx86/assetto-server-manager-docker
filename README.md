# asseto-server-manager-docker

This is a docker to run an instance of Asseto Server Manager (https://github.com/JustaPenguin/assetto-server-manager)

I made this one because the original one uses a prebuilt SteamCMD which is unreliable. This image is based on Ubuntu 25 and grabs the binary from the APT repository.

You need a valid config.yml to map to the docker. to build:

```bash
docker build -t acs:latest .
```

To run:
```bash
docker run -t --name acs \
    -v server:/server/assetto \
    -v $(pwd)/config.yml:/server/config.yml \
    -p 8772:8772 \
    -p 9600:9600 \
    -p 9600:9600/udp \
    -p 8081:8081 \
    acs:latest
```
