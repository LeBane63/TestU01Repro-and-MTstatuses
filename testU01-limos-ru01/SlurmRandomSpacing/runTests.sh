#!/bin/bash

compteur=0
x=0
for i in {0..18}
do
    for j in {0..239}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatStatusMts000M00$x.txt
        ./exe  "./mtsRand4K/mtsRand000M00$x" > resultatStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
