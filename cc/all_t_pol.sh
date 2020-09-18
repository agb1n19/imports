#!/bin/bash
export USR_ACC=np3n19
export BOTS_DIR=/lyceum/${USR_ACC}/planar_robo
export SFERES_DIR=/lyceum/${USR_ACC}/sferes2
export RESULTS_DIR=/lyceum/${USR_ACC}/planar_robo/results
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:/lyceum/${USR_ACC}/planar_robo/lib/


export BUILD_GRAPHIC=False
export NUM_CORES=16

for i in 1 2 3
do
export replicate=exppol$i
export BUILD_TRAIN=True
export BUILD_TEST=False
export BUILD_META=False
bash ~/planar_metacmaes/scripts/make.sh
${SFERES_DIR}/build/exp/planar_cmaes/train_damage_control_binary --load ${RESULTS_DIR}/pol/${replicate}/gen_7000 --d ${RESULTS_DIR}/pol/${replicate} -o ${RESULTS_DIR}/pol/${replicate}/damage_trainperformance

export BUILD_TEST=True
export BUILD_TRAIN=False
export BUILD_META=False
bash ~/planar_metacmaes/scripts/make.sh
${SFERES_DIR}/build/exp/planar_cmaes/test_damage_control_binary --load ${RESULTS_DIR}/pol/${replicate}/gen_7000 --d ${RESULTS_DIR}/pol/${replicate} -o ${RESULTS_DIR}/pol/${replicate}/damage_performance
done
