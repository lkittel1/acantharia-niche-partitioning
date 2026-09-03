#!/bin/bash
#SBATCH --job-name=EPAng
#SBATCH --partition=public
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=4-00:00:00
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lakittellporter@asu.edu
#SBATCH --output=PPCESS_%j.out
#SBATCH --error=PPCESS_%j.err

module purge
module load openmpi/4.1.5
module load epa-ng/0.3.8

mpirun -np 1 epa-ng-mpi \
  --ref-msa SILVAPR2DataAligned.fasta \
  --tree RAxML_bestTree.RAxML_constrained \
  --query OurDataAligned.fasta \
  --model RAxML_info.RAxML_constrained \
  --threads 8 \
  --redo