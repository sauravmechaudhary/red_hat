#!/bin/bash

declare -A VARIABLES

set_variable() {

var=$(echo "$1" | cut -d '=' -f1)
value=$(echo "$1" | cut -d '=' -f2)

value=$(echo "$value" | bc -l)

VARIABLES[$var]=$value

echo "$var = $value"
}

replace_variables() {

expr="$1"

for v in "${!VARIABLES[@]}"
do
expr=$(echo "$expr" | sed "s/\b$v\b/${VARIABLES[$v]}/g")
done

echo "$expr"
}

show_vars() {

echo "------ VARIABLES ------"

for v in "${!VARIABLES[@]}"
do
echo "$v = ${VARIABLES[$v]}"
done

}