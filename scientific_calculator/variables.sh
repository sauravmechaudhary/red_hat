#!/bin/bash

# associative array for variables
declare -A VARIABLES

# -------------------------
# set variable
# -------------------------
set_variable() {

input="$1"

var=$(echo "$input" | cut -d '=' -f1 | xargs)
value=$(echo "$input" | cut -d '=' -f2)

# replace variables inside expression
value=$(replace_variables "$value")

# evaluate expression
value=$(echo "$value" | bc -l)

VARIABLES[$var]=$value

echo "$var = $value"
}

# -------------------------
# replace variables in expression
# -------------------------
replace_variables() {

expr="$1"

for v in "${!VARIABLES[@]}"
do
expr=$(echo "$expr" | sed -E "s/\b$v\b/${VARIABLES[$v]}/g")
done

echo "$expr"
}

# -------------------------
# show variables
# -------------------------
show_vars() {

echo "------ VARIABLES ------"

for v in "${!VARIABLES[@]}"
do
echo "$v = ${VARIABLES[$v]}"
done

}
