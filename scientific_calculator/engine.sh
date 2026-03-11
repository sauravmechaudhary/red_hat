#!/bin/bash

MODE="RAD"

evaluate_expression() {

expr="$1"

expr=$(replace_variables "$expr")

expr=$(convert_trig "$expr")

result=$(echo "$expr" | bc -l 2>/dev/null)

if [ $? -ne 0 ]; then
echo "Syntax ERROR"
else
echo "$result"
fi
}

convert_trig() {

expr="$1"

expr=$(echo "$expr" | sed -E 's/sin\(([^)]+)\)/s(\1)/g')
expr=$(echo "$expr" | sed -E 's/cos\(([^)]+)\)/c(\1)/g')
expr=$(echo "$expr" | sed -E 's/tan\(([^)]+)\)/s(\1)\/c(\1)/g')

if [ "$MODE" = "DEG" ]; then
expr=$(echo "$expr" | sed -E 's/s\(([^)]+)\)/s((\1)*3.1415926535\/180)/g')
expr=$(echo "$expr" | sed -E 's/c\(([^)]+)\)/c((\1)*3.1415926535\/180)/g')
fi

echo "$expr"
}

toggle_mode() {

if [ "$MODE" = "RAD" ]; then
MODE="DEG"
else
MODE="RAD"
fi

echo "Mode = $MODE"
}