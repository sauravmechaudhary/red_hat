#!/bin/bash

MEMORY=0

show_memory() {
echo "Memory = $MEMORY"
}

clear_memory() {
MEMORY=0
echo "Memory cleared"
}

memory_add() {
value="$1"
MEMORY=$(echo "$MEMORY + $value" | bc)
}

memory_sub() {
value="$1"
MEMORY=$(echo "$MEMORY - $value" | bc)
}