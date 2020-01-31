#!/bin/bash
end=10
for i in {0..10}
do
	echo $i
	sleep 1
done

for ((i = 0; i <= $end; i++)); do
	echo $i
done
