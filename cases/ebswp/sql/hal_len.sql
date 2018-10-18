/* sql\@run.sql */
spool hallength.csv
set pagesize 0;
set linesize 280;
set termout off;
set feedback off;

select h.vessel||','||
   h.haul||',' ||
   h.cruise||',' ||
   to_char(h.haul_date,'mm')     ||','||
   to_char(h.haul_date,'dd')     ||','|| 
   to_char(h.haul_date,'yyyy')   ||','||
   to_char((h.latdd_end+h.latdd_start)/2,'09.999') ||','||
   to_char((h.londd_end+h.londd_start)/2,'099.999') ||','||
   h.gear_type                   ||','||
   h.vessel_type                 ||','||
   to_char((h.retrieval_date-h.deployment_date)*60,'9999.999') ||','|| 
   to_char(h.fishing_depth_fathoms*1.8288,'9999.99')||','||
   to_char(h.BOTTOM_DEPTH_fathoms*1.8288 ,'9999.99')||','||
   h.official_total_catch        ||','||
   sum(decode(x.species,201,x.extrapolated_weight) )||','||
   sum(decode(x.species,201,x.extrapolated_number) )||','||
   sum(decode(x.species,202,x.extrapolated_weight) )||','||
   sum(decode(x.species,202,x.extrapolated_number) )||','||
   sum(decode(x.species,120,x.extrapolated_weight) )||','||
   sum(decode(x.species,120,x.extrapolated_number) )||','||
   sum(decode(x.species,140,x.extrapolated_weight) )||','||
   sum(decode(x.species,140,x.extrapolated_number) )||','||
   sum(decode(x.species,101,x.extrapolated_weight) )||','||
   sum(decode(x.species,101,x.extrapolated_number) )||','||
   sum(decode(x.species,222,x.extrapolated_number) )||','||
   sum(decode(x.species,221, x.extrapolated_number, 223 , x.extrapolated_number ,224 , x.extrapolated_number ,225 , 
                             x.extrapolated_number ,226 , x.extrapolated_number ,227 , x.extrapolated_number ,228 , 
                             x.extrapolated_number ,229 , x.extrapolated_number) ) ||','||
   /* sum(decode(x.species,221,x.extrapolated_number) )*/
   to_char(h.deployment_date,'mm/dd/yy,hh24mi')||','||
   h.deploy_latitude         ||','||
   h.deploy_longitude_converted        ||','||
   h.cdq_code                    ||','||
   h.obsvr_est_discards            ||','||
   h.total_hooks_pots            ||','||
   h.nmfs_area                   ||','||
   h.PERFORMANCE                 ||','||
   l.length                      ||','||
   sum(FREQUENCY)
 from 
   obsint.debriefed_length  l, 
   obsint.debriefed_haul  h, 
   obsint.debriefed_spcomp  x
where
  /*join between domestic_age and domestic_hauls trunc(h.latitude/100)+ h.latitude-(trunc(h.latitude/100) ||','|| trunc(h.longitude/100)||','|| */      
  h.haul_join=x.haul_join and h.haul_join=l.haul_join and
  h.year > 1990 and
  l.species = 101 and
  /* x.species IN (201, 202, 101, 120, 140, 221, 222, 223, 224, 225, 226, 227, 228, 229) and */ 
  h.gear_type between 1 and 8 and 
  h.nmfs_area between 500 and 550
group by h.vessel, h.cruise, h.haul,
   to_char(h.haul_date,'mm') ,
   to_char(h.haul_date,'dd') ,
   to_char(h.haul_date,'yyyy') ,
   to_char((h.latdd_end+h.latdd_start)/2,'09.999'),
   to_char((h.londd_end+h.londd_start)/2,'099.999'),
   h.gear_type                ,
   h.vessel_type                ,
   to_char((h.retrieval_date-h.deployment_date)*60,'9999.999'),
   to_char(h.fishing_depth_fathoms*1.8288,'9999.99'),
   to_char(h.BOTTOM_DEPTH_fathoms*1.8288 ,'9999.99'),
   h.official_total_catch        ,
   to_char(h.deployment_date,'mm/dd/yy,hh24mi'),
   h.deploy_latitude         ,
   h.deploy_longitude_converted        ,
   h.cdq_code                    ,
   h.total_hooks_pots                    ,
   h.nmfs_area                   ,
   h.obsvr_est_discards                   ,
   h.PERFORMANCE ,
   l.length                   
  ;
  spool off;
/*    select sum(sample_weight),sum(allocated_sample_weight),sum(extrapolated_weight) from norpac.inseason_spcomp_detail where species=201 and year=2007;
   */

