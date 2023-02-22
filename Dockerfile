ARG NODEJS_VERSION
FROM node:${NODEJS_VERSION}-alpine as base

WORKDIR /src
RUN apk add nano bash tar
RUN apk --no-cache add shadow sudo
EXPOSE 3000
COPY distribution/ /distribution/
COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh
RUN chown -R node:node /usr/local/bin/
RUN chown -R node:node /usr/local/lib/node_modules
RUN chown -R node:node /src/
ENTRYPOINT [ "install.sh" ]
USER node
CMD [ "node" ]
