#!/bin/bash

compteur=0
x=0
for i in {0..17}
do
    for j in {0..239}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatRealStatusMts000M00$x.txt
        ./exe  "./mtSeed/mtsSeed000M00$x" > resultatRealStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
