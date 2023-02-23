#!/bin/bash
set +x
cd /src/
echo "Application installation starts......"
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
        echo "Directory is not Empty, Please deleted hiden file and directory"
    else
        cd /src/
        tar cf - --one-file-system -C /distribution . | tar xf -
        npm install nodemon --save-dev && npm install
        npm install
        rm -rf /distribution
fi
chown -R node:node /src 2> /dev/null
echo "Application installation done successfully"
exec "$@"
