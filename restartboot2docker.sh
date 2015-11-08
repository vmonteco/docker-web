#!/bin/zsh

BASEDIR=$(pwd)

# Src
NAME1=""
VOL1OUT="$BASEDIR/$NAME1"
VOL1IN="/$NAME1"
VOL1="$VOL1OUT=$NAME1"

# Database
NAME2=""
VOL2OUT="$BASEDIR/$NAME2"
VOL2IN="/NAME2"
VOL2="$VOL2OUT=$NAME2"

# Configuration
NAME3=""
VOL3OUT="$BASEDIR/$NAME3"
VOL3IN="/$NAME3"
VOL3="$VOL3OUT=$NAME3"

VOLUMES="--vbox-share\"$VOL1 VOL2 VOL3\""

if [[ boot2docker status == "running" ]]; then
	boot2docker down
else
	echo "boot2docker already down."
fi

echo "restarting boot2docker..."
