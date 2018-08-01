#!/bin/bash
#SBATCH --ntasks 24 --nodes 1 -p stajichlab --out proteinortho.%A.log -J proteinOrtho --mem 8G

module load proteinortho
CPUS=2
if [ $SLURM_CPUS_ON_NODE ]; then
	CPUS=$SLURM_CPUS_ON_NODE
fi
mkdir -p /scratch/$USER/MhetOrtho
proteinortho5.pl -temp=/scratch/$USER/MhetOrtho -project=Mhet -cpus=$CPUS pep/*.fasta
