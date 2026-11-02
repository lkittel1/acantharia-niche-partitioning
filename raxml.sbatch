#!/bin/bash
#SBATCH --job-name=raxml_raw
#SBATCH --output=raxml_raw.out
#SBATCH --error=raxml_raw.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64G
#SBATCH --mail-user=lkittel1@asu.edu
#SBATCH --mail-type=END,FAIL

# Add RAxML to PATH
export PATH=$PATH:/scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/standard-RAxML

# Move to working directory
cd /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/

# Run RAxML with pthreads (uses multiple CPUs)
raxmlHPC-PTHREADS -f a \
  -g LeoTree.newick \
  -s SILVAPR2_fixed.fasta \
  -p 12345 \
  -m GTRGAMMA \
  -x 12345 \
  -N 10000 \
  -T 20 \
  -n RAxML_constrained