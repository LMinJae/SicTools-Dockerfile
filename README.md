SicTools-Dockerfile
===

Dockerized [SicTools](https://jurem.github.io/SicTools/)

# Requirements
- Setup X11 server
  - On Windows
    - If you use WSL(Windows Subsystem for Linux), figure out WSLg is enabled(it provide x11, and pulseaudio)
      - if not config your environment using x11 server for example VcXsrv, Xming, or etc
- Docker or equivalent like Podman

# How to Use
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools
```
First line `-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY` is passing X11 server information for display GUI
