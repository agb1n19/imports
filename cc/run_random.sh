#!/bin/bash
export BOTS_DIR=~/planar_robo
export SFERES_DIR=~/sferes2
export RESULTS_DIR=~/planar_robo/results
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:/lyceum/agb1n19/planar_robo/lib/


export BUILD_GRAPHIC=False
export NUM_CORES=16

export BUILD_TRAIN=True
export BUILD_TEST=False
export BUILD_META=False
bash ~/planar_metacmaes/scripts/make.sh
bash ~/planar_metacmaes/scripts/train_recovery.sh ~/planar_robo/results random "damage" a1

export BUILD_TEST=True
export BUILD_TRAIN=False
export BUILD_META=False
bash ~/planar_metacmaes/scripts/make.sh
bash ~/planar_metacmaes/scripts/test_recovery.sh ~/planar_robo/results random "damage" b1
