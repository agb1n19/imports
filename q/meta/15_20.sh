#!/bin/bash
#PBS -l walltime=24:00:00
#PBS -l nodes=16:ppn=16
#PBS -m ae -M agb1n19@soton.ac.uk
#PBS -l qos=standard
module load singularity/3.2.0
cd
singularity exec plnr_cmaes.simg ~/cc/meta/15_20.sh
