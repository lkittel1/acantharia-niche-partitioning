#!/bin/bash
#SBATCH -p public
#SBATCH -c 20
#SBATCH -t 1-00:00:00
#SBATCH --mem=64G
#SBATCH --mail-type=ALL
#SBATCH -o PPCESS_%j.out
#SBATCH -e PPCESS_%j.err      
#SBATCH --mail-user=lkittel1@asu.edu

module purge
module load gappa

gappa analyze placement-factorization --jplace-path /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/jplace --point-mass --metadata-table-file factormetadata.csv --metadata-separator-char comma --write-nexus-tree --verbose --allow-file-overwriting