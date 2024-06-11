#!/bin/bash

###TODO IN SETUP.PY:
# setup $MEZEHOME
###
###TODO How to activate correct environment? 

N_LIGANDS=15 # change back to 16; edited also ligands.dat
MD_INPUT_FILES_DIR=/home/jguven/projects/alchemistry/model_0_vim2/md/md_input_files/

sbatch --parsable --array=0-$((${N_LIGANDS}-1)) $MD_INPUT_FILES_DIR/./10_md.sh
