#!/bin/bash
while getopts ":a:b:c:" opts; do
	case $opts in
		a)
			my_a=$OPTARG
			echo "a: $my_a"
			;;
		b)
			my_b=$OPTARG
			echo "b: $my_b"
			;;
		c)
			my_c=$OPTARG
			echo "c: $my_c"
			;;
		?)
			echo "Invalid Option $OPTARG"
			exit 1
			;;
		:)
			echo "Invalid Option $OPTARG"
			exit 1
			;;
	esac
done
