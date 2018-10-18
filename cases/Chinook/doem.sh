for i in `seq 1 10`; 
do
 ./run_alk.sh  $i
 ./sam -nox 
done
#for i in `seq 2008 2017`; 
#do
 #./sam -nox -ind data/sam_$i.dat 
#done
