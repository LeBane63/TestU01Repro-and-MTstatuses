#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --mem=0
#SBATCH --partition=repro
#SBATCH --output=testU01-Node40-0000-2048
#========================== TASKS ================================
compteur=0
x=0
for i in {0..15}
do
    for j in {0..127}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatNode40StatusMts000M00$x.txt
        ./exe  "./mtsRand4K/mtsRand000M00$x" > resultatNode40StatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
