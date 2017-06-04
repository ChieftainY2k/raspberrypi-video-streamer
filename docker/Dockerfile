FROM alexellis2/streaming:17-5-2017

RUN apt-get update && \
  apt-get -y install libraspberrypi-bin && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/

COPY stream-youtube.sh .
RUN chmod u+x stream-youtube.sh

ENTRYPOINT ["/bin/bash"]
