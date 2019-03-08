FROM nvidia/cudagl:10.0-base-ubuntu18.04

# Install blender
RUN echo "deb http://ppa.launchpad.net/thomas-schiex/blender/ubuntu bionic main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D32A3245446233723DECE00F7281E3E842A98114 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    blender && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/blender

CMD [ "blender" ]
