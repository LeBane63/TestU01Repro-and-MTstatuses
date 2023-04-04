# TestU01Repro-and-MTstatuses
REPRODUCING RESULTS

On a purpose of reproducible research, we found pertinent to add a reproducibility part to this paper. 
The original idea to create a “reproducibility” section in a research paper to enhance reproducibility in the writing process and in the reviewing process comes from (Bajpai et al. 2017).
Code 1: Example of Bash script used in our experiment.

We used Bash scripts to run our experiments, with or without the Slurm Workload Manager (Code 1). 
In the code repository, you will find 6 folders: “testU01-nodes”, “testU01-ru01”, “testU01-hpcsmp”, and the three same names with “RealInterval” at the end. 
Three of them contains the scripts and results for TestU01 on 32 bits integers, and the three others contains scripts and results for TestU01 on the [0,1] real interval.
Inside these folders, there will be again three folders for the three methods we checked: MT Index status, Random spacing and Sequence Splitting.
These folders contains the source code of TestU01, directly taken from L’Ecuyer website. They also contain the Mersenne Twister source code. 
Our code to execute the tests, named testMT.c, is based on the examples from L’Ecuyer (ex7.c). 
In each experiment folder, you can find a folder containing the statuses used for the experiment (mtsSeed for the 4096 statuses from index sequence, mtsRand for the 4096 statuses from random spacing and mtsSeq for the 4096 statuses from sequence splitting).
You can find all the result files from the Big Crush test in files named “resultStatusMts000M00XXXX” (from 0000 to 4095). 
If you want to go further, the best would be to try to reproduce our results on your machine.
Copy the source code of testU01 and MT in another folder (this supposes installing TestU01). You can find full documentation on the TestU01 website.
You have to run “./configure”, then  “make” and after that “make install” like for many libraries.
If you do not have root privilege, you should also run “./configure –prefix=<installDirectory>”. 
The previous part of installation is not mandatory if you just copy our work folder, library is already installed in the folder named “installDirectory” (you just have to delete all results files with “rm result*”, and you will obtain a folder with TestU01 already installed plus MT).
Then, you have to execute the 3 following export lines, using the path to the installDirectory (you can use “pwd” command in the installDirectory folder to get an absolute path, and replace <install directory> by the result of pwd :
Code 2: Library path used for TestU01 testing
Then, to compile, you have to run “gcc testMT.c mt19937ar.c -O2 -o executable -ltestu01 -lprobdist -lmylib -lm”. 
After that, you can just run your executable by running “./executable [path of the MT status to test] > resultFilename.txt” and that’s all. 
It will run the Big Crush test on your MT status, saving the output in a file named “resultFilename.txt”.
By modifying the file testMT.c, you can work with 32 bits integers or with [0,1] real numbers.
You can draw your own experiments and try to reproduce the conclusions of this paper. 
Trust in Science comes from reproducible experiments which lead to the same conclusion.
