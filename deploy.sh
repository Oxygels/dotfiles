#!/bin/bash

if [ "$#" -eq 0 ]; then
    rsync -r -v --exclude ".git" --exclude "deploy.sh" "." "$HOME"

elif [ "$#" -eq 1 ]; then
    rsync -r -v --exclude ".git" --exclude "deploy.sh" "." "$1:"

else
    echo "Usage: deploy.sh [user@]hostname"
    exit 1
fi
