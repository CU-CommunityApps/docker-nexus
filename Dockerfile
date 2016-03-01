# Nexus deploy

# Pull base image.
FROM dtr.cucloud.net/cs/java

# File Author / Maintainer
MAINTAINER Shawn Bower

ENV VERSION 2.12.0-01

RUN cd /usr/local && \
    wget -qO- http://download.sonatype.com/nexus/oss/nexus-${VERSION}-bundle.tar.gz | tar xz && \
    ln -s nexus-${VERSION} nexus && \
    rm -rf /usr/local/sonatype-work/nexus && \
    ln -s /nexus /usr/local/sonatype-work/nexus && \
    rm -rf /usr/local/nexus/tmp && \
    ln -s /nexus/tmp/ /usr/local/nexus/tmp

VOLUME /nexus

EXPOSE 8081

ENV CONTEXT_PATH /nexus

CMD RUN_AS_USER=root NEXUS_CONTEXT_PATH=$CONTEXT_PATH /usr/local/nexus/bin/nexus console
