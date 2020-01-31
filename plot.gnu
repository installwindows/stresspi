set terminal png
set ylabel "°C"
set xlabel "t/s"
plot filename using 1 title 'temperature (°C)' with lines
