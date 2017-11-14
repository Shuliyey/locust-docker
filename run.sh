#!/bin/ash

if [ "$(echo ${ENDPOINT})" ]; then
  ENDPOINT="--host=${ENDPOINT}"
fi

locust $ENDPOINT $MODE

