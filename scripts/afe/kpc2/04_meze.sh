#!/bin/bash

#SBATCH -o /home/jguven/projects/alchemistry/kpc2/old_config_partially_protonated/logs//meze_%a.slurm.out
#SBATCH -e /home/jguven/projects/alchemistry/kpc2/old_config_partially_protonated/logs//meze_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10


export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

start=`date +%s`

id=$SLURM_ARRAY_TASK_ID

source $MEZEHOME/parse.sh
transformation=${transformations_array[$id]}

python $MEZEHOME/meze.py /home/jguven/projects/alchemistry/kpc2/old_config_partially_protonated/afe//protocol.dat $transformation

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
