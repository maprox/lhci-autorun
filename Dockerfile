FROM node:latest

LABEL org.opencontainers.image.authors="box@sunsay.ru"

RUN apt update
RUN apt install -y git

RUN npm i -g @lhci/cli

RUN mkdir -p /opt/lhci-client
COPY . /opt/lhci-client
WORKDIR /opt/lhci-client

CMD [ "bash", "run.sh" ]
