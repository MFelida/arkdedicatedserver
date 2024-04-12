#!/bin/bash

set -e
steamcmd +login anonymous +force_install_dir /home/steam/server +app_update $GAME_ID +quit
chown -R "$USER:$USER" "/home/steam/server"

ulimit -n 100000
steamcmd +login anonymous +runscript runark.sh
