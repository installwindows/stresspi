#!/bin/bash
echo "Number of args: $#"
echo "$*"
echo "$@"
for arg in "$@"; do
	echo $arg
done
