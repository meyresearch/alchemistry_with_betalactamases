#!/bin/bash

#SBATCH -o <project-directory>/logs//meze_%a.slurm.out
#SBATCH -e <project-directory>/logs//meze_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10


export MEZEHOME=<path-to-meze-clone>/metalloenzymes/meze/

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse.sh
transformation=${transformations_array[$id]}

python $MEZEHOME/meze.py <project-directory>/afe/protocol.dat $transformation

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
