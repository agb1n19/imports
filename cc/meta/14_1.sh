#!/bin/bash
export USER_ACC=np3n19
export BOTS_DIR=/lyceum/${USER_ACC}/planar_robo
export SFERES_DIR=/lyceum/${USER_ACC}/sferes2
export RESULTS_DIR=/lyceum/${USER_ACC}/planar_robo/results
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:/lyceum/${USER_ACC}/planar_robo/lib/


export BUILD_GRAPHIC=False
export BUILD_META=True
export NUM_CORES=16
export replicate_number=m4_1

cp -r ~/params/include1/params.hpp ~/planar_robo/include/meta-cmaes/
bash ~/planar_metacmaes/scripts/make.sh

mkdir -p ${RESULTS_DIR}/damage_meta/exp${replicate_number}
${SFERES_DIR}/build/exp/planar_cmaes/planarCMAES_damage_meta_binary ${replicate_number} --d ${RESULTS_DIR}/damage_meta/exp${replicate_number} >> ~/log${replicate_number}.txt
