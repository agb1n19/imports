export BOTS_DIR=~/planar_robo
export SFERES_DIR=~/sferes2
export RESULTS_DIR=~/planar_robo/results
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:/lyceum/np3n19/planar_robo/lib/


cd
git clone git@github.com:agb1n19/planar_metacmaes.git
cd ~/planar_metacmaes/
mkdir extras
cd ~/planar_metacmaes/extras/
git clone git://github.com/dartsim/dart.git
cd dart
git checkout v6.3.0
mkdir build
cd build
cmake -DDART_ENABLE_SIMD=ON -DCMAKE_INSTALL_PREFIX=$BOTS_DIR ..
make -j4
make install
cd ~/planar_metacmaes/planar_dart/
./waf configure --prefix=$BOTS_DIR
./waf
./waf install
cd
git clone https://github.com/sferes2/sferes2.git
cd ~/sferes2/modules
git clone https://github.com/resilient-swarms/map_elites.git
cd ~/sferes2
./waf configure
./waf
mkdir -p exp && cd exp
cp -r ~/planar_metacmaes/planar_cmaes/ ~/sferes2/exp
cp -r ~/planar_metacmaes/meta-cmaes/ ~/planar_robo/include
cp -r ~/planar_metacmaes/planar_cmaes/armBody.skel ~/planar_robo/share/armBody.skel
cd ~/sferes2
export BUILD_META=True
./waf configure --exp planar_cmaes
./waf --exp planar_cmaes

