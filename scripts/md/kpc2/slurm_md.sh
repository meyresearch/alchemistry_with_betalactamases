#!/bin/bash

###TODO IN SETUP.PY:
# setup $MEZEHOME
###
###TODO How to activate correct environment? 

N_LIGANDS=16
MD_INPUT_FILES_DIR=/backups/jguven/kpc2_most_recent_results/old_config_partially_protonated/md/md_input_files/

sbatch --parsable --array=1-$((${N_LIGANDS}-1)) $MD_INPUT_FILES_DIR/./10_md.sh
