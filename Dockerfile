FROM node:8-slim

RUN apt-get update \
    && apt-get -y --no-install-recommends install git \
    && git clone https://github.com/Akkadius/glass-isc-dhcp.git /opt/glass

WORKDIR /opt/glass

RUN mkdir logs \
    && chmod u+x ./bin/ -R \
    && chmod u+x *.sh \
    && npm install

VOLUME /var/lib/dhcp/ /var/log/dhcp.log /etc/dhcp/ /opt/glass/config

EXPOSE 3000

ENTRYPOINT ["npm", "start"]
