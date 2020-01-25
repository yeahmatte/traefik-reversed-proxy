#!/bin/sh

FILE=./config
if [ -d "$FILE" ]; then
    echo "Config directory exists"
else
    mkdir $FILE
    echo "Config directory created"
fi

python install_tools/start.py

CONFFILE=./config/traefik.toml
if [ -f "$CONFFILE" ]; then
    echo "$CONFFILE exists"
else
    echo "No Configuration File, aborting"
    exit 1
fi

CONFFILE=./config/rules.toml
if [ -f "$CONFFILE" ]; then
    echo "$CONFFILE exists"
else
    echo "No rules File, aborting"
    exit 1
fi

DIR=./config
#sudo chown 1883:1883 $DIR -R

# ======== CERTIFICATES ==========
FILE=./letsencrypt
if [ -d "$FILE" ]; then
    echo "$FILE directory exists"
else
    mkdir $FILE
    echo "$FILE directory created"
fi

ACMEFile=./letsencrypt/acme.json
if [ -f "$ACMEFile" ]; then
    echo "$ACMEFile exists"
else
    touch $ACMEFile
fi
chmod 600 ACMEFile
DIR=./letsencrypt
#sudo chown 1883:1883 $DIR -R

# ======== Socket ==========
FILE=./socket
if [ -d "$FILE" ]; then
    echo "$FILE directory exists"
else
    mkdir $FILE
    echo "$FILE directory created"
fi

SOCKFILE=./socket/docker.sock
if [ -f "$SOCKFILE" ]; then
    echo "$SOCKFILE exists"
else
    touch $SOCKFILE
fi

DIR=./socket
#sudo chown 1883:1883 $DIR -R

# ======== Log file ==========

DIR=./log
if [ -d "$DIR" ]; then
    echo "$DIR directory exists"
else
    mkdir $DIR
    echo "$DIR directory created"
fi

LOGFILE=./log/traefik.log
if [ -f "$LOGFILE" ]; then
    echo "$LOGFILE exists"
else
    touch $LOGFILE
fi
sudo chmod o+w $LOGFILE

LOGFILE=./log/access.log
if [ -f "$LOGFILE" ]; then
    echo "$LOGFILE exists"
else
    touch $LOGFILE
fi
sudo chmod o+w $LOGFILE
#sudo chown 1883:1883 $DIR -R


#docker-compose pull
sudo docker-compose up -d
