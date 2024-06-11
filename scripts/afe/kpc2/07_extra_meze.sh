#!/bin/bash

#SBATCH -o /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/logs//extra_meze_%a.slurm.out
#SBATCH -e /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/logs//extra_meze_%a.slurm.err

extra_transformations=/backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/afe/extra_transformations.csv

export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse_extra_edges.sh
transformation=${transformations_array[$id]}

python $MEZEHOME/meze.py afe/protocol.dat $transformation --extra-transformations $extra_transformations

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
