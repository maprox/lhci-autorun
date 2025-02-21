FROM patrickhulce/lhci-client

LABEL org.opencontainers.image.authors="box@sunsay.ru"

RUN cd ~ && git clone https://github.com/maprox/lhci-autorun.git
WORKDIR /home/lhci/lhci-autorun

CMD [ "bash", "run.sh" ]
