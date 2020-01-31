#!/bin/bash

end=60
cpus=$(nproc --all)
logfile=stresspi_$(date +%F-%H-%M-%S).log
stress -c $cpus -t $end &
while [ $SECONDS -lt $end ]; do
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    echo $(($temp/1000)) | tee -a $logfile
    sleep 1
done &
wait
