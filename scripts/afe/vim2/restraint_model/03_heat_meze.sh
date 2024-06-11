#!/bin/bash

#SBATCH -o /home/jguven/projects/alchemistry/vim2/logs//heat_%a.slurm.out
#SBATCH -e /home/jguven/projects/alchemistry/vim2/logs//heat_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10

export ligands_dat_file=/home/jguven/projects/alchemistry/vim2/afe/ligands.dat
export transformations_file=/home/jguven/projects/alchemistry/vim2/afe//meze_network.csv

source $MEZEHOME/parse.sh

export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

lig_i=$SLURM_ARRAY_TASK_ID
ligand=${ligand_array[$lig_i]}

start=`date +%s`

python $MEZEHOME/equilibrate.py "$ligand" /home/jguven/projects/alchemistry/vim2/afe//protocol.dat

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
