#!/bin/bash

set -e

docker build -t bakery-site:latest .
docker run -d --name bakery-check -p 8085:80 bakery-site:latest
sleep 2
curl -fsS http://localhost:8085/ > /dev/null
docker rm -f bakery-check

docker rm -f bakery-live
docker run -d --name bakery-live -p 8082:80 bakery-site:latest
curl -fsS http://localhost:8082/ > /dev/null

