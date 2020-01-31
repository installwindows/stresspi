#!/bin/bash
arg1=1
arg2="1"
arg3="hello"
arg4="$arg3 world"
arg6=ceciestunmot
arg7=$(bc <<< "scale=2; $arg1/2")
logfile=stresspi$(date +%F-%H-%M-%S).log

./args $arg1 $arg2 $arg3 "$arg4" $arg6 $arg7 $logfile
