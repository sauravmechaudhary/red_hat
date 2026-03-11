#!/bin/bash

CONFIG_FILE="$HOME/.bashcalc"

load_config() {

if [ -f "$CONFIG_FILE" ]; then
source "$CONFIG_FILE"
fi

}

save_config() {

echo "MODE=$MODE" > "$CONFIG_FILE"

}