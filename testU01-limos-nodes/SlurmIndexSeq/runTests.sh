#!/bin/bash

compteur=0
x=0
for i in {0..100}
do
    for j in {0..50}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatStatusMts000M00$x.txt
        ./exe  "./Status-MT-8K-10p12/all/mts000M00$x" > resultatStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
