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
gappa analyze correlation --jplace-path /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/jplace --mass-norm relative --point-mass --method spearman --metadata-table-file combinedmetadata.csv --metadata-separator-char comma  --write-nexus-tree --allow-file-overwriting
gappa analyze correlation --jplace-path /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/winter --mass-norm relative --point-mass --method spearman --metadata-table-file combinedmetadata_winter.csv --metadata-separator-char comma  --write-nexus-tree --allow-file-overwriting --out-dir /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/winter
gappa analyze correlation --jplace-path /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/spring --mass-norm relative --point-mass --method spearman --metadata-table-file combinedmetadata_spring.csv --metadata-separator-char comma  --write-nexus-tree --allow-file-overwriting --out-dir /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/spring
gappa analyze correlation --jplace-path /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/summer --mass-norm relative --point-mass --method spearman --metadata-table-file combinedmetadata_summer.csv --metadata-separator-char comma  --write-nexus-tree --allow-file-overwriting --out-dir /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/summer
gappa analyze correlation --jplace-path /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/fall --mass-norm relative --point-mass --method spearman --metadata-table-file combinedmetadata_fall.csv --metadata-separator-char comma  --write-nexus-tree --allow-file-overwriting --out-dir /scratch/lkittel1/RAxMLwithColloAndRAD_A_FINAL/fall
