#!/bin/bash

source engine.sh
source memory.sh
source history.sh
source variables.sh
source matrix.sh
source statistics.sh
source config.sh

print_banner() {
echo "====================================="
echo "       Bash Scientific Calculator"
echo "====================================="
echo "Type 'help' for commands."
}

print_help() {
cat << EOF
Commands
--------
help        show help
exit        quit calculator
history     show history
mem         show memory
mc          clear memory
mode        switch DEG/RAD
vars        show variables
matrix      matrix operations
stats       statistics mode
EOF
}

print_banner

while true
do
read -p "calc> " input

case "$input" in

exit)
exit
;;

help)
print_help
;;

history)
show_history
;;

mem)
show_memory
;;

mc)
clear_memory
;;

mode)
toggle_mode
;;

vars)
show_vars
;;

matrix)
matrix_menu
;;

stats)
stats_menu
;;

*=*)
set_variable "$input"
;;

*)
result=$(evaluate_expression "$input")
echo "Result = $result"
add_history "$input = $result"
;;

esac

done