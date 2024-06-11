#!/bin/bash

#SBATCH -o /home/jguven/projects/alchemistry/model_1_vim2/logs//analyse_%x_%a.slurm.out
#SBATCH -e /home/jguven/projects/alchemistry/model_1_vim2/logs//analyse_%x_%a.slurm.err


export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse.sh
transformation=${transformations_array[$id]}

python $MEZEHOME/analysis.py /home/jguven/projects/alchemistry/model_1_vim2/afe/protocol.dat $transformation /home/jguven/projects/alchemistry/model_1_vim2/afe/experimental_K_i.csv

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
