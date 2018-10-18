:: Must be sorte first
:: For age data, convert one big file to multiple year files w/ strata and hauls incremented (original Must be sorted)
:: c:\bin\sort ..\sql\poll_len.dat >tmp.dat
:: move tmp.dat atka_age.dat
:: awk "$6==%1{print $0}" length.dat >lenall19%1.dat
:: sampler
awk "NF==13{print $0} " tmp.dat | awk -fa2.awk 
:: awk "$6==%1{print $0}" length.dat >lenall19%1.dat
:: sampler
