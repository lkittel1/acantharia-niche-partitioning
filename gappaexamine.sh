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

gappa examine lwr-distribution --jplace-path ./ --allow-file-overwriting
gappa examine lwr-list --jplace-path ./ --allow-file-overwriting
gappa examine edpl --jplace-path ./ --allow-file-overwriting
gappa examine heat-tree --jplace-path ./ --point-mass --write-nexus-tree --allow-file-overwriting