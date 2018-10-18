#for i in `seq 11 19`; 
#do
 #./run_alk.sh  $i
#done
for i in `seq 1999 2014`; 
do
 ./sam -nox -ind data/sam_$i.dat 
done
