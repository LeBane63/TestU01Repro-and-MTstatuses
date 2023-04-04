#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcsmp01
#SBATCH --partition=smp
#SBATCH --mem-per-cpu=4096
#SBATCH --output=testU01Real-smp-0000-4096
#========================== TASKS ================================
compteur=2048
x=0
for i in {0..3}
do
    for j in {0..511}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatRealStatusMts000M00$x.txt
        ./exe  "./mtsRand4K/mtsRand000M00$x" > resultatRealStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
