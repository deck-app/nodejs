#!/bin/bash
set -e
chown -R node:node /src/
cd /src/
if [[ -f "/src/package.json" ]] ;
then
    if [[ -d "/src/node_modules" ]] ;
    then
        echo "NPM optimize autoloader"
        npm update
    else
        echo "NPM install"
        npm install
    fi

fi
if [[ "$(ls -A "/src/")" ]] ;
    then
        echo "Directory is not Empty"
    else
        cd /src/
        tar cf - --one-file-system -C /distribution . | tar xf -
        npm install -g nodemon && npm install
        # sudo rm -rf /distribution
fi
chown -R node:node /src
exec "$@"
