#!/bin/bash
#PBS -l walltime=24:00:00
#PBS -l nodes=4:ppn=16
#PBS -m ae -M agb1n19@soton.ac.uk

module load singularity/3.2.0
cd
#singularity exec plnr_cmaes.simg ~/cc/run_random.sh
singularity exec plnr_cmaes43.simg ~/cc/3r_pol.sh

