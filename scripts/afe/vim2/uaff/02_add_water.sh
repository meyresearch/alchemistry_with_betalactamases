#!/bin/bash

#SBATCH -o /home/jguven/projects/uaff/vim2/logs//add_water_%a.slurm.out
#SBATCH -e /home/jguven/projects/uaff/vim2/logs//add_water_%a.slurm.err

export ligands_dat_file=/home/jguven/projects/uaff/vim2/afe/ligands.dat
export transformations_file=/home/jguven/projects/uaff/vim2/afe//meze_network.csv

source $MEZEHOME/parse.sh 

export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

lig_i=$SLURM_ARRAY_TASK_ID
ligand=${ligand_array[$lig_i]}

start=`date +%s`

python $MEZEHOME/solvate.py "$ligand" /home/jguven/projects/uaff/vim2/afe//protocol.dat

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
