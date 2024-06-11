#!/bin/bash

#SBATCH -o <project-directory>/logs/analysis.slurm.out
#SBATCH -e <project-directory>/logs/analysis.slurm.err

export MEZEHOME=<path-to-meze-clone>/metalloenzymes/meze/

AFE_INPUT_DIR=<project-directory>/afe/

export ligands_dat_file=${AFE_INPUT_DIR}/ligands.dat
export transformations_file=${AFE_INPUT_DIR}/meze_network.csv

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse.sh

for transformation in ${transformations_array[@]}
do
	echo $transformation
	python $MEZEHOME/analysis.py <project-directory>/afe/protocol.dat $transformation <project-directory>/afe/experimental_K_i.csv
done
end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
