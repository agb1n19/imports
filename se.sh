export BOTS_DIR=~/planar_robo
export SFERES_DIR=~/sferes2
export RESULTS_DIR=~/planar_robo/results
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib:/lyceum/np3n19/planar_robo/lib/

cd
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=11dC_aUOme55Pwwv7VynECyJ5yzC355Nz' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=11dC_aUOme55Pwwv7VynECyJ5yzC355Nz" -O plnr_cmaes.simg && rm -rf /tmp/cookies.txt
cd

for i in 2 3 4 5 6
do
	for j in 1 2 3 4 5
	do
		cp plnr_cmaes.simg plnr_cmaes$i$j.simg
	done
done

module load singularity/3.2.0
cd
singularity exec plnr_cmaes.simg ~/sing_set.sh


cd ~/cc/

for i in 1 2 3 4 5
do
	chmod 777 $ir_r.sh $ir_ra.sh $ir_r.sh $ir_as.sh $ir_pos.sh $ir_pol.sh
done
cd
for i in 6 2 3 4 5
do
	for j in 1 2 3 4 5
	do
		qsub ~/q/$i$i.sh
	done
done

qstat
