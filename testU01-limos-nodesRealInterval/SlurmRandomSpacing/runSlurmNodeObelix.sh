#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node40
#SBATCH --partition=repro
#SBATCH --mem=0
#SBATCH --output=testU01Real-node40-2800-4096
#========================== TASKS ================================
compteur=2800
x=0
for i in {0..15}
do
    for j in {0..127}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatNode40RealStatusMts000M00$x.txt
        ./exe  "./mtsRand4K/mtsRand000M00$x" > resultatNode40RealStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
