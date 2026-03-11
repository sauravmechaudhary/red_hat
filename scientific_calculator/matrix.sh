#!/bin/bash

parse_matrix() {
echo "$1" | tr ',' ' '
}

matrix_add() {

a=($(parse_matrix "$1"))
b=($(parse_matrix "$2"))

if [ ${#a[@]} -ne ${#b[@]} ]; then
echo "Matrix sizes must match"
return
fi

result=()

for ((i=0;i<${#a[@]};i++))
do
sum=$(echo "${a[$i]} + ${b[$i]}" | bc)
result+=($sum)
done

echo "Result Matrix:"
echo "${result[@]}"
}

matrix_multiply() {

a=($(parse_matrix "$1"))
b=($(parse_matrix "$2"))

if [ ${#a[@]} -ne ${#b[@]} ]; then
echo "For now multiplication requires equal size vectors"
return
fi

result=0

for ((i=0;i<${#a[@]};i++))
do
temp=$(echo "${a[$i]} * ${b[$i]}" | bc)
result=$(echo "$result + $temp" | bc)
done

echo "Dot Product Result:"
echo "$result"
}

matrix_menu() {

echo "Matrix Operations"
echo "1 Add matrices"
echo "2 Multiply matrices"

read -p "Choice: " c

case $c in

1)

read -p "Matrix A (example: 1,2,3): " a
read -p "Matrix B (example: 4,5,6): " b

matrix_add "$a" "$b"

;;

2)

read -p "Matrix A (example: 1,2,3): " a
read -p "Matrix B (example: 4,5,6): " b

matrix_multiply "$a" "$b"

;;

esac

}