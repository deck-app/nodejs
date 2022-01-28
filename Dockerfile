ARG NODEJS_VERSION
FROM node:${NODEJS_VERSION}-alpine as base

WORKDIR /src
RUN apk add git nano bash
EXPOSE 3000

FROM base as production
ENV NODE_ENV=production
COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh
ENTRYPOINT [ "install.sh" ]
CMD ["node", "bin/www"]

FROM base as dev
ENV NODE_ENV=development
COPY install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh
ENTRYPOINT [ "install.sh" ]
CMD ["nodemon", "bin/www"]