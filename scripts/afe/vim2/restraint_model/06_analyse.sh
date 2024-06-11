#!/bin/bash

#SBATCH -o <project-directory>/logs/analysis.slurm.out
#SBATCH -e <project-directory>/logs/analysis.slurm.err


export MEZEHOME=<path-to-meze-clone>/metalloenzymes/meze/

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse.sh
transformation=${transformations_array[$id]}

python $MEZEHOME/analysis.py <project-directory>/afe/protocol.dat $transformation <project-directory>/afe/experimental_K_i.csv 

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
