#!/bin/zsh

NAME=$1


#tar -czh . | docker build -t $NAME -
docker build -t $NAME .