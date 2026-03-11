#!/bin/bash

declare -a HISTORY

add_history() {
HISTORY+=("$1")
}

show_history() {

echo "------ HISTORY ------"

for item in "${HISTORY[@]}"
do
echo "$item"
done

}