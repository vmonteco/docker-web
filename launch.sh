#!/bin/sh

NAME=$1

# Base directories :
BASEIN="/srv/http/www"
BASEOUT=$(pwd)

echo $BASEOUT

# Container ports :
PORTS="-p 10080:80"
# PORTS=""

# Database :
DBINDIR=$BASEIN"/data"
DBIN=$DBINDIR"/httpdb.sqlite3"
DBOUTDIR="./data"
DBOUT=$DBOUTDIR"/db.sqlite3"

# SRC :
SRCIN=$BASEIN"htdocs"
SRCOUT="./src"

# Conf :
# CONFIN=$BASEIN"/conf/httpd-app.conf"
# CONFOUT="$BASEOUT/conf/httpd-app.conf"
CONFIN="/etc/httpd/conf/httpd.conf"
CONFOUT=$BASEOUT"/conf/httpd.conf"


# Logs :
LOGSIN=$BASEIN"/logs"
LOGSOUT=$BASEOUT"/logs"

# Container volumes :
#DBVOL="-v "$DBOUTDIR":"$DBINDIR
#SRCVOL="-v "$SRCIN":"$SRCOUT
CONFVOL="-v $CONFOUT:$CONFIN"
LOGSVOL="-v $LOGSOUT:$LOGSIN"
#VOLUMES=$DBVOL $SRCVOL $CONFVOL
BASEVOL="-v $BASEOUT:$BASEIN"
VOLUMES="$CONFVOL $BASEVOL $LOGSVOL"
# Other options :
OTHER=" --net=host "
OTHER=""
# shell mode :
SHELL="--rm -ti"
# Daemonize mode :
DAEMON="-d"
# Default
DEFAULT=$DAEMON
#DEFAULT=$SHELL

# Building docker image.
#docker build -t $NAME .

# creating files if it doesn't exist.
mkdir -p $DBOUTDIR
touch $DBOUT
mkdir -p $LOGSOUT

CMD="docker run $DEFAULT $OTHER $PORTS $VOLUMES $NAME"

# Running site :
echo $CMD
$CMD
