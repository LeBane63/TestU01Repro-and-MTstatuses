#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcsmp01
#SBATCH --partition=smp
#SBATCH --mem-per-cpu=4096
#SBATCH --output=testU01-smp-0000-4096
#========================== TASKS ================================
compteur=0
x=0
for i in {0..7}
do
    for j in {0..511}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatStatusMts000M00$x.txt
        ./exe  "./mtsRand4K/mtsRand000M00$x" > resultatStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
