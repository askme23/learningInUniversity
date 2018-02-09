select max(decode(o.snum, 1001, o.amt, null)),
       max(decode(o.snum, 1002, o.amt, null)),
       max(decode(o.snum, 1003, o.amt, null)),
       max(decode(o.snum, 1004, o.amt, null)),
       max(decode(o.snum, 1007, o.amt, null))
  from sal s
       join ord o on o.snum = s.snum
 group by s.sname;
