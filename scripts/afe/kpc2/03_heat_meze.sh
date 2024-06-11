#!/bin/bash

#SBATCH -o <project-directory>/logs//heat_%a.slurm.out
#SBATCH -e <project-directory>/logs//heat_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10


export MEZEHOME=<path-to-meze-clone>/metalloenzymes/meze/

LIG_NUMBER=$SLURM_ARRAY_TASK_ID

start=`date +%s`

python $MEZEHOME/equilibrate.py "ligand_$LIG_NUMBER" <project-directory>/afe//protocol.dat

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"
