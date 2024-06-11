#!/bin/bash
#SBATCH -o /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/md/logs/md_%a.slurm.out
#SBATCH -e /backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/md/logs/md_%a.slurm.err
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=10

export ligands_dat_file=/backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/md/md_input_files/ligands.dat

export MEZEHOME=/home/jguven/projects/metalloenzymes/meze/

source $MEZEHOME/parse.sh

lig_i=$SLURM_ARRAY_TASK_ID
ligand=${ligand_array[$lig_i]}

start=`date +%s`

python $MEZEHOME/md.py $ligand -if "/backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/md/inputs/protein/kpc2_setup_input.pdb" --ligand-charge -1 --group-name kpc2 --non-metal

end=`date +%s`
runtime=$((end - start))

echo "Finished in $runtime seconds, or $((runtime/60)) minutes"

