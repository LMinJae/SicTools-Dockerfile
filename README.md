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
## Build image
```sh
git clone git@github.com:LMinJae/SicTools-Dockerfile.git
cd SicTools-Dockerfile
docker build -t sictools .
```

## Using
First line `-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY` is passing X11 server information for display GUI

### To run simulator
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools
```

### To run assembler
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools sic.Asm source.asm
```
where source.asm is the file to be compiled.

### To get assembler help
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools sic.Asm -help
```

### To run linker
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools sic.Link -o out.obj in1.obj in2.obj ...
```
where out.obj is the output file and in1, in2,… are .obj files to be linked.

### To get linker help
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools sic.Link -help
```

### To get graphical linker interface
```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
          -it \
          -v .:/tmp \
          sictools sic.Link -g
```
