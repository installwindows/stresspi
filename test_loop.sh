#!/bin/bash
end=5
while [ $SECONDS -lt $end ]; do
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    echo $(($temp/1000))
    sleep 1
done &

sleep 2
echo "Hello"
wait
