#!/bin/bash
#SBATCH -o /home/jguven/projects/alchemistry/model_0_vim2/md/logs/md_%a.slurm.out
#SBATCH -e /home/jguven/projects/alchemistry/model_0_vim2/md/logs/md_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10

export ligands_dat_file=/home/jguven/projects/alchemistry/model_0_vim2/md/md_input_files/ligands.dat

export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

source $MEZEHOME/parse.sh

lig_i=$SLURM_ARRAY_TASK_ID
ligand=${ligand_array[$lig_i]}

start=`date +%s`

echo "md workflow for $ligand"

python $MEZEHOME/md.py $ligand -if "/home/jguven/projects/alchemistry/model_0_vim2/md/inputs/protein/vim2.input.pdb" --ligand-charge -2 --group-name vim2

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"

