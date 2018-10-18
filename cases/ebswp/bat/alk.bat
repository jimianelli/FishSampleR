echo off 
set /a year=%1+1990
echo %year%
:: call makestrata %year%

awk "{print $%1}" runs.dat >sam.dat
echo %1
sam -ind sam.dat
:: pause
cat  lf_%year%.dat >> catch_at_len_ALL.dat
cat  wtage%year%_str.out >> wtage_str.dat
cat catage%year%.out >>catage.dat
cat  wtage%year%.out >> wtage.dat
:: cat  wtage.out >> wtage.dat
echo done


