# Nexus deploy

# Pull base image.
FROM docker.cucloud.net/java

# File Author / Maintainer
MAINTAINER Shawn Bower

RUN cd /usr/local && \
    wget -qO- http://download.sonatype.com/nexus/oss/nexus-2.10.0-02-bundle.tar.gz | tar xz && \
    ln -s nexus-2.10.0-02 nexus && \
    rm -rf /usr/local/sonatype-work/nexus && \
    ln -s /nexus /usr/local/sonatype-work/nexus

VOLUME /nexus

EXPOSE 8081

ENV CONTEXT_PATH /nexus

CMD RUN_AS_USER=root NEXUS_CONTEXT_PATH=$CONTEXT_PATH /usr/local/nexus/bin/nexus console
