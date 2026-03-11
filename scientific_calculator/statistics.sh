#!/bin/bash

stats_mean() {

numbers=("$@")

sum=0

for n in "${numbers[@]}"
do
sum=$(echo "$sum + $n" | bc)
done

count=${#numbers[@]}

echo "$(echo "$sum / $count" | bc -l)"
}

stats_menu() {

echo "Statistics"
echo "Enter numbers separated by space"

read -a nums

mean=$(stats_mean "${nums[@]}")

echo "Mean = $mean"

}