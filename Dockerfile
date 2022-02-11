ARG NODEJS_VERSION
FROM node:${NODEJS_VERSION}-alpine as base

WORKDIR /src
RUN apk add nano bash tar
EXPOSE 3000
COPY distribution/ /distribution/
COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh
ENTRYPOINT [ "install.sh" ]
CMD [ "node" ]
