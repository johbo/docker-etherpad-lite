#
# Etherpad lite Dockerfile
#
# Based on instructions from https://github.com/ether/etherpad-lite
#

FROM dockerfile/nodejs

MAINTAINER Johannes Bornhold <johannes@bornhold.name>


# Prepare etherpad
RUN useradd -m etherpad
WORKDIR /home/etherpad

# Dependencies based on docs
RUN apt-get -y install \
    gzip git-core curl python libssl-dev pkg-config build-essential

RUN wget https://github.com/ether/etherpad-lite/archive/master.zip &&\
    unzip master &&\
    rm -f master.zip &&\
    mv etherpad-lite-master src &&\
    sed '/installDeps.sh/d' bin/run.sh -i &&\
    chown -R ehterpad: src

# Add the settings
ADD config/settings.json settings.json

# Install dependencies
# TODO: install plugins?
RUN bin/installDeps.sh


USER etherpad
EXPOSE 9001
WORKDIR /home/etherpad/src

# TODO: Wrapper script to inject password and session key from the outside
CMD ["bin/run.sh"]
