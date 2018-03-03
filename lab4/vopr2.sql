create or replace view cu_avg_amt as 
select cu.cname,
       avg(o.amt) as summ
  from cust cu
       join ord o on o.cnum = cu.cnum
 group by cu.cname;
 
 /
 
 grant select on cu_avg_amt to PUBLIC;
 grant select on cust to UP2;
 grant select on ord to UP2;