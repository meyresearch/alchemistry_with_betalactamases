#!/bin/bash

#SBATCH -o /home/jguven/projects/alchemistry/kpc2/old_config_partially_protonated/logs//heat_%a.slurm.out
#SBATCH -e /home/jguven/projects/alchemistry/kpc2/old_config_partially_protonated/logs//heat_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10


export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

LIG_NUMBER=$SLURM_ARRAY_TASK_ID

start=`date +%s`

python $MEZEHOME/equilibrate.py "ligand_$LIG_NUMBER" /home/jguven/projects/alchemistry/kpc2/old_config_partially_protonated/afe//protocol.dat

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
