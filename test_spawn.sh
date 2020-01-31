#!/bin/bash
name(){
    sleep 2
    echo "MY NAME"
}

name &

sleep 1
echo "LOL"
wait
