for i in 1 2 3
do
	for j in 2 10
	do
	qsub ~/q/meta/1${i}_${j}.sh
	done
done

for i in 6 2 3 4 5
do 
	qsub ~/q/${i}t.sh
done
