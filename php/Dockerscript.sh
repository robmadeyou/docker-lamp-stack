#!/bin/bash
docker build -t img-app .
docker run -it -d -v app/:/var/www/ -p 8080:80 --name app img-app
