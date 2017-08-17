FROM ubuntu:16.04
MAINTAINER haliphax <https://github.com/haliphax/>
RUN useradd -m x84
ADD ./payload/dosemu /home/x84/.dosemu
ADD ./payload/scripts /home/x84/scripts
RUN mkdir /home/x84/.x84 && \
    mkdir /home/x84/bbs && \
    mkdir /home/x84/x84-sftp_root && \
    chown x84:x84 -R /home/x84 && \
    sed -i 's/ main/ main contrib/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
        build-essential libssl1.0.0 libssl-dev libffi6 libffi-dev \
        python2.7 python2.7-dev python-pip dosemu
RUN pip install -U x84[with_crypto]
RUN apt-get purge -y build-essential libssl-dev libffi-dev python2.7-dev && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME [ "/home/x84/.x84", "/home/x84/bbs", "/home/x84/x84-sftp_root" ]
EXPOSE 6022
EXPOSE 6023
EXPOSE 8443
USER x84
ENV HOME /home/x84
CMD /home/x84/scripts/init.sh
