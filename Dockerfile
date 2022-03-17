FROM bitnami/minideb:bullseye as base

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -qq -y \
        wget \
        default-jre \
        && rm -rf /var/lib/apt/lists/*

FROM base

ENV VERSION v2.0.1

RUN cd /opt && wget https://github.com/jurem/SicTools/releases/download/"$VERSION"/sictools.jar

WORKDIR /tmp
ENTRYPOINT ["/usr/bin/java", "-cp", "/opt/sictools.jar"]
CMD ["sic.Sim"]
