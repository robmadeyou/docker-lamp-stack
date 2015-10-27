#!/bin/bash

LOCATION=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

chmod -R ugo+rw app;

cp configs/site.config.php app/settings/

docker build -t img-app .
docker run -d --rm -v $LOCATION/app:/var/www/app -p 8080:80 --name app img-app
