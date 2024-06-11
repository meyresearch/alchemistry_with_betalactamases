#!/bin/bash

N_LIGANDS=16
ENGINE=SOMD
AFE_INPUT_DIR=<project-directory>/afe/

export ligands_dat_file=${AFE_INPUT_DIR}/ligands.dat
export transformations_file=${AFE_INPUT_DIR}/meze_network.csv

source $MEZEHOME/parse.sh 

solvation_job_id=$(sbatch --parsable --array=1-$N_LIGANDS $AFE_INPUT_DIR/02_add_water.sh)
echo "Adding water with slurm job $solvation_job_id"

heating_job_id=$(sbatch --dependency=afterok:${solvation_job_id} --parsable --array=1-$N_LIGANDS $AFE_INPUT_DIR/03_heat_meze.sh)
echo "Heating meze with slurm job $heating_job_id"

meze_job_id=$(sbatch --dependency=afterok:${heating_job_id} --parsable --array=0-$((${#transformations_array[@]}-1)) $AFE_INPUT_DIR/04_meze.sh)
echo "Preparing AFE with slurm job $prepafe_job_id"

for i in "${!transformations_array[@]}"
do
   afe_job_id=$(sbatch --dependency=afterok:${meze_job_id} --parsable --job-name=${transformations_array[i]} --array=0-$((${n_windows_array[i]}-1)) $AFE_INPUT_DIR/05_run_$ENGINE.sh ${transformations_array[i]} "${lambdas_array[i]}")
   echo "Submitted AFE slurm job $afe_job_id"
done

analysis_job_id=$(sbatch --parsable --job-name=analysis $AFE_INPUT_DIR/06_analyse.sh )
echo "Submitted analysis slurm job $analysis_job_id"
