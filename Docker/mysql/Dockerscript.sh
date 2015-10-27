#!/bin/bash
docker build -t img-mysql
docker run -it -d -e MYSQL_ROOT_PASSWORD=password -p 3307:3306 --name mysql img-mysql
