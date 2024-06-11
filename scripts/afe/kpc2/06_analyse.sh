#!/bin/bash

#SBATCH -o /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/logs/analysis.slurm.out
#SBATCH -e /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/logs/analysis.slurm.err

export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

AFE_INPUT_DIR=/backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/afe/

export ligands_dat_file=${AFE_INPUT_DIR}/ligands.dat
export transformations_file=${AFE_INPUT_DIR}/meze_network.csv

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse.sh

for transformation in ${transformations_array[@]}
do
	echo $transformation
	python $MEZEHOME/analysis.py /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/afe/protocol.dat $transformation /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/afe/experimental_K_i.csv
done
end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
