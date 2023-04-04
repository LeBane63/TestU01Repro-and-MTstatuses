#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=hpcsmp01
#SBATCH --partition=smp
#SBATCH --output=testU01Real-hpcSmp-0000-4096
#========================== TASKS ================================
compteur=3584
x=0
for i in {0..0}
do
    for j in {0..511}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatRealSmpStatusMts000M00$x.txt
        ./exe  "./Status-MT-8K-10p12/all/mts000M00$x" > resultatRealSmpStatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
