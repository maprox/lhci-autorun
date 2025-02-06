FROM node:latest

LABEL org.opencontainers.image.authors="box@sunsay.ru"

# Install utilities
RUN apt-get update --fix-missing && apt-get -y upgrade && apt-get install -y git wget gnupg && apt-get clean

# Install latest chrome stable package.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update \
    && apt-get install -y google-chrome-stable --no-install-recommends \
    && apt-get clean

# Install lhci cli tool
RUN npm i -g @lhci/cli

# Setup a user to avoid doing everything as root
RUN groupadd --system lhci && \
  useradd --system --create-home --gid lhci lhci && \
  chown --recursive lhci:lhci /home/lhci

USER lhci
WORKDIR /home/lhci
RUN git clone https://github.com/maprox/lhci-autorun.git
WORKDIR /home/lhci/lhci-autorun

CMD [ "bash", "run.sh" ]
