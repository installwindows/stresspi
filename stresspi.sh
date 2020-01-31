#!/bin/bash
end=900
cpus=$(nproc --all)
logprefix=stresspi_$(date +%F-%H-%M-%S)
function cleanup() {
    killall stress
    exit 2
}
trap cleanup SIGINT

# start stressing the pi
stress -c $cpus &

# monitor and log temperature and cpu clock speed
# update every second
for ((i = 0; i < $end; i++)); do
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    temp_val=$(echo "scale=2;$temp/1000" | bc)
    # freq=$(vcgencmd measure_clock arm | cut -d"=" -f2)
    # freq_val=$(echo "scale=2;$freq/1000000" | bc)
    echo $temp_val | tee -a $logprefix.log
    sleep 1
done
killall stress
gnuplot -p -e "filename='$logprefix.log'" plot.gnu > $logprefix.png
