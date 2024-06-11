# Alchemistry with betalactamases

This repository contains the input data for the AFE and MD workflows that can be input to the [meze workflow](https://github.com/meyresearch/metalloenzymes)

The `scripts` folder is split into `md` and `afe`:

- `md`: The `slurm_md.sh` script can be used to run MD with the `meze` workflow for all ligands, or using the script `10_md.sh` directly. The file paths should be changed as needed in these two scripts.
- `afe`: Similar to the MD workflow, the `slurm_all.sh` can be used to run the whole workflow, or each of the scripts for solvation, equilibration, etc. can be ran separately as needed. 
