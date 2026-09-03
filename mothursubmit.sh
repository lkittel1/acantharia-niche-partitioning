#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --time=6-00:00:00
#SBATCH --mem=64G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lkittel1@asu.edu
#SBATCH --output=PPCESS_%j.out
#SBATCH --error=PPCESS_%j.err

module purge
module load mothur-1.48.0-gcc-11.2.0
mothur mothur.sh