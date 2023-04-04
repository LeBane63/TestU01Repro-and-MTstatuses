#!/bin/bash
#================= OPTIONS (s'applique à chaque job du tableau) =========================
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --nodelist=node35
#SBATCH --mem=0
#SBATCH --output=testU01-Node35-2500-5000
#========================== TASKS ================================
compteur=3972
x=0
for i in {0..1}
do
    for j in {0..63}
    do
        x=$(printf "%04d" $compteur)
        echo $x
        echo $x > resultatNode36StatusMts000M00$x.txt
        ./exe  "./Status-MT-8K-10p12/all/mts000M00$x" > resultatNode36StatusMts000M00$x.txt &
        compteur=$(($compteur+1))
    done
    wait
done
