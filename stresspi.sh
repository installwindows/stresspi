#!/bin/bash

end=60
cpus=$(nproc --all)
logfile=stresspi_$(date +%F-%H-%M-%S).log
stress -c $cpus -t $end &
while [ $SECONDS -lt $end ]; do
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    freq=$(vcgencmd measure_clock arm | cut -d"=" -f2)
    echo $(echo "scale=2;$temp/1000" | bc) $(echo "scale=2;$freq/1000000" | bc) | tee -a $logfile
    sleep 1
done &
wait
