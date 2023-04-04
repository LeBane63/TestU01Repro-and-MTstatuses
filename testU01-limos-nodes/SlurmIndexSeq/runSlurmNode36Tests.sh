#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node36
#SBATCH --mem=0
#SBATCH --output=testU01-Node36-2048-4096
#========================== TASKS ================================
compteur=2048
x=0
for i in {0..31}
do
    for j in {0..63}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatNode36StatusMts000M00$x.txt
        ./exe  "./mtSeed/mtsSeed000M00$x" > resultatNode36StatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
