# For age data, convert one big file to multiple year files w/ strata and hauls incremented (original Must be sorted)
{pw=0.0000148769177516369*$13^2.826} 
{yy=$6}
{dif=$12-pw} 
dif< 0{pw2 = -dif/pw} 
dif>=0{pw2 =  dif/pw} 
{area=substr($2,1,2);month=$4}
(area==52&&month<6) {strata=1}
(area<=51&&month<6) {strata=1}
(area==52&&month>5) {strata=2}
(area>=50&& area<=51&&month>5) {strata=3}
#                 1    2    3    4    5                                                            16     17
# Cutout data w/ Dev greater than 70%
area!=54 && pw2<0.7{
if($1!=x){cnt[yy]++} ; x=$1;
print strata,$2+0,$3+0,$4+0,$5+0,$6+0,$7+0,$8+0,$9+0,$10+0,$11+0,$12+0,$13+0,$14+0,$15+0,cnt[yy] > "age"yy".dat"}
#print strata,$2+0,$3+0,$4+0,$5+0,$6+0,$7+0,$8+0,$9+0,$10+0,$11+0,$12+0,$13+0,$14+0,$15+0,cnt[yy], pw2 > "age"yy".dat"}
