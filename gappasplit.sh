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

gappa edit split --jplace-path epa_result.jplace --otu-table-file data.pick.count_table.txt