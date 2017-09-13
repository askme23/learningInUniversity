--1
  create table my_cust 
  as select *
       from STUDY.CUST;
  
--2
  alter table my_cust
    add (CONSTRAINT pk_my_cust PRIMARY KEY (my_cust));

--3
  drop table my_cust;

  create table my_cust 
  as select *
       from STUDY.CUST;

  alter table my_cust
    add (CONSTRAINT pk_my_cust PRIMARY KEY (my_cust));
    
--4
  insert into my_cust 
    values (2008, 'Ruslan', 'Novosibirsk', 300, 1021),
           (2009, 'Igor', 'Novosibirsk', 400, 1022);
           
  select *
    from my_cust;
    
  delete from my_cust
   where snum = 1021;
   
  select *
    from my_cust;

--5
  insert into my_cust 
    values (2008, 'Ruslan', 'Novosibirsk', 300, 1023),
           (2009, 'Igor', 'Novosibirsk', 400, 1022);
           
  select *
    from my_cust;
    
  update my_cust
  set rating = rating * 2;
  
  select *
    from my_cust;
    
--6
  select s.sname as name,
         s.city as city,
         s.comm as comm,
         count(*) as count_of_ord,
         sum(o.amt) as summ
    from sal s
    left join ord o on o.snum = s.snum
   where s.snam = '&var_sname';
   
--7
  select s.sname name_of_saler,
         cu.cname name_of_custer
    from sal s
    join cust cu on s.snum = cu.snum
    where cu.city = s.city
      and s.city = '&var_city';
