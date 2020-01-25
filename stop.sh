#!/bin/sh

docker-compose down

DIR=./config
sudo chown -R 1000:1000 $DIR

LOGFILE=./config/traefik.toml
sudo chmod 664 $LOGFILE

LOGFILE=./config/rules.toml
sudo chmod 664 $LOGFILE

DIR=./letsencrypt
sudo chown -R 1000:1000 $DIR

LOGFILE=./letsencrypt/acme.json
sudo chmod 664 $LOGFILE

FILE=./socket
sudo chown -R 1000:1000 $DIR

LOGFILE=./socket/docker.sock
sudo chmod 664 $LOGFILE

DIR=./log
sudo chown -R 1000:1000 $DIR

LOGFILE=./log/access.log
sudo chmod 664 $LOGFILE

LOGFILE=./log/access.log
sudo chmod 664 $LOGFILE
