#!/bin/bash
#SBATCH --job-name=apptainer
#SBATCH --output=apptainer.out
#SBATCH --error=apptainer.err
#SBATCH --time=00:10:00
#SBATCH --partition=qcpu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --account=dd-24-88

module load apptainer/1.2.5
apptainer exec c3b-template.sif
EOF