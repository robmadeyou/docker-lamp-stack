#!/bin/bash
docker build -t img-mysql
docker run -it -d -e MYSQL_ROOT_PASSWORD=secrets -p 3310:3306 --name mysql img-mysql
