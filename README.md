# Alchemistry with betalactamases

This repository contains the input data for the AFE and MD workflows that can be input to the [meze workflow](https://github.com/meyresearch/metalloenzymes)

The `scripts` folder is split into `md` and `afe`:

- `md`: The `slurm_md.sh` script can be used to run MD with the `meze` workflow for all ligands, or using the script `10_md.sh` directly. The file paths should be changed as needed in these two scripts. There is also an example `cpptraj.in` file that can be used to calculate the RMSD of the active site + ligand of the metal protein. 
- `afe`: Similar to the MD workflow, the `slurm_all.sh` can be used to run the whole workflow, or each of the scripts for solvation, equilibration, etc. can be ran separately as needed. 


The MD workflow has a similar directory hierarchy as `meze`: 

```
/path/to/project/
    |--- inputs/                Input files (set-up by user)
    |   |--- ligands/           Ligand .sdf or .mol2 files (set-up by user)
    |   |--- protein/           Protein .pdb file (set-up by user)
    |--- outputs/               Folder for saving the results of MD runs
    |--- md_input_files/        Input files for running the MD runs
    |   |--- protocol.dat       Datafile with network information
    |   |--- ligands.dat        Datafile containing ligand names, e.g. ligand_1, ligand_2, ...
    |   |--- 10_md.sh           Bash script to run an individual MD simulation with AmberMD.
    |   |--- slurm_md.sh        SLURM script which executes all of the above bash scripts
    |--- equilibration/         Folder for saving the minimisation and equilibration outputs for bound ligands
    |--- logs/                  Folder for keeping SLURM log files
```

Note that this part of the `meze` code is still under development, so the MD input files will have to be set up manually. 
