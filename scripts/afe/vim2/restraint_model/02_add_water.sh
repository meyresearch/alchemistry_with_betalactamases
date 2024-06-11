#!/bin/bash

#SBATCH -o <project-directory>/logs/add_water_%a.slurm.out
#SBATCH -e <project-directory>/logs/add_water_%a.slurm.err

export ligands_dat_file=<project-directory>/afe/ligands.dat
export transformations_file=<project-directory>/afe/meze_network.csv

source $MEZEHOME/parse.sh 

export MEZEHOME=<path-to-meze-clone>/projects/metalloenzymes/meze/

lig_i=$SLURM_ARRAY_TASK_ID
ligand=${ligand_array[$lig_i]}

start=`date +%s`

python $MEZEHOME/solvate.py "$ligand" <project-directory>/afe/protocol.dat

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
