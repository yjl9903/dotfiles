#!/bin/bash

case "$1" in
  "up")
    docker compose up -d
    ;;
  "backup")
    zip -r archive.zip /etc/alist
    ;;
  "update")
    docker compose pull
    docker compose up -d
    ;;
  *)
    echo ""
    ;;
esac
