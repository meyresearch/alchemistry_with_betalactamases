#!/bin/bash

N_LIGANDS=16
MD_INPUT_FILES_DIR=<project-directory>/md_input_files/

sbatch --parsable --array=0-$((${N_LIGANDS}-1)) $MD_INPUT_FILES_DIR/./10_md.sh
