@echo off
rm -f tmp

:: Age Data========================================
call bat\cleanwt  sql\age.atsea.%1 >tmp
call bat\cleanwt  sql\age.port.%1 >>tmp
vi tmp
:: copy ageall%1.dat tmp
:: Restratify
awk -fbat\a2.awk  tmp | c:\bin\sort  -k16 >tmp2
:: Re-index
awk "$16!=x{cnt++} {x=$16;print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,cnt}" tmp2 >data\ageall%1.dat

:: Length Data========================================
cp  sql\length.atsea.%1 tmp
cat sql\length.port.%1 >>tmp
vi tmp
:: copy lenall%1.dat tmp
:: Restratify
awk -fbat\a1.awk  tmp | c:\bin\sort  -k14 >tmp2
:: Re-index
awk "$14!=x{cnt++} {x=$14;print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,cnt}" tmp2 > data\lenall%1.dat
