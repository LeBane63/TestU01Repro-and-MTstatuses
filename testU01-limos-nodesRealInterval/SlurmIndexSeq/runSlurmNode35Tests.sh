#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node39
#SBATCH --mem=0
#SBATCH --output=testU01Real-Node35-4094-4096
#========================== TASKS ================================
compteur=4095
x=0
for i in {0..0}
do
    for j in {0..0}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatRealNode35StatusMts000M00$x.txt
        ./exe  "./mtSeed/mtsSeed000M00$x" > resultatRealNode35StatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
