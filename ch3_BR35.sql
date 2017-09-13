--1
select o.onum, 
       o.amt * 0,8 || 'euro', 
       s.sname, 
       s.comm
  from ORD o
  join SAL s on o.snum = s.snum
 where extract(day from o.odate) <> 4;
 
 --2
 select o.onum, s.city, s.sname, cu.cname
   from ORD o
   join SAL s on o.SNUM = s.SNUM
   join CUST cu on s.CNUM = cu.CNUM
  where s.CITY like 'B%'
  order by onum;
  
  --3
 select s.sname, sum(o.amt), s.comm
    from SAL s
    join ORD o on s.snum = o.snum
    join CUST cu on cu.snum = s.snum
  where extract(day from o.odate) = 4
    and extract(day from o.odate) = 5
  order by s.sname;
  
  --4
  select o.onum, o.amt, cu.city, s.sname, cu.cname
   from ord o
        join sal s on o.snum = s.snum 
        join cust cu on o.cnum = cu.cnum
  where cu.city between 'A' and 'M';
  
  --5
  select distinct o.onum, s.sname
    from ord o
    join sal s on ord.snum = s.snum;
  
  --6
  select cu.cname
  from (select * 
          from sal
         where comm > .12) t 
  join cust cu on t.snum = cu.snum;
  
  --7
  select s.sname, sum(o.amt) summ
    from sal s
    join ord o on s.snum = o.snum
    group by s.sname
    having summ > (select max(amt)
                   from ord);