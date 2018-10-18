/* age script for revised aug 98 */
spool age_yfs.dat
set pagesize 0;
set linesize 65;
set termout off;
set feedback off;

select h.vessel_type        ||' '||
  h.nmfs_area               ||' '||
  h.bottom_depth            ||' '||
  to_char(x.haul_date,'mm') ||' '||
  to_char(x.haul_date,'dd') ||' '||
  to_char(x.haul_date,'yy') ||' '||
  h.latitude                ||' '||
  h.longitude               ||' '||
  NVL(x.age,-9)             ||' '||
  DECODE(x.sex,'M',1,'F',2,
								 'U',3,null)||' '||
  x.species                 ||' '||
  NVL(x.weight,-9)          ||' '||
  x.length                  ||' '||
  x.specimen_number         ||' '||
  x.sampling_system
from 
	norpac.domestic_haul h, 
	norpac.domestic_age x
where
/*join between domestic_age and domestic_hauls*/
  h.haul_join=x.haul_join and
/*user specifications*/
  x.species =140 and
  h.nmfs_area between 500 and 599 and
  h.year <= 1993 ;
select 
'-9'||' '||
p.nmfs_area_code||' '||
'-9'||' '||
to_char(x.haul_date,'mm')||' '||
to_char(x.haul_date,'dd')||' '||
to_char(x.haul_date,'yy')||' '||
'-9'||' '||
'-9'||' '||
NVL(x.age,-9)||' '||
DECODE(x.sex,'M',1,'F',2,'U',3,null)||' '||
x.species||' '||
NVL(x.weight,-9)||' '||
x.length||' '||
x.specimen_number||' '||
x.sampling_system
from obsint.domestic_port p, obsint.domestic_age x
where
      /*join between domestic_age and domestic_port_sample*/ 
      p.port_join=x.port_join and
/*user specifications*/
x.species =140 and
p.nmfs_area_code between 500 and 599 and
x.year <= 1993 ;
spool off;
