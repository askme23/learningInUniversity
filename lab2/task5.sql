drop table ord_of_sal;
drop sequence new_val;

create table ord_of_sal(
    n_id NUMBER,
    s_name VARCHAR2(40),
    n_summ NUMBER
);

create sequence new_val increment by 2
    start with 5000;
/
declare
    cursor cur IS
    select s.sname,
           sum(o.amt) summ
     from sal s join ord o on o.snum = s.snum
  group by s.sname;
  
  s_records cur%ROWTYPE;
begin 
    open cur;
        loop 
            fetch cur into s_records;
            if cur%NOTFOUND then
                exit;
            end if;
            
            insert into ord_of_sal
            values (new_val.nextval, s_records.sname, s_records.summ);
        end loop;
    close cur;
end;
/
select *
  from ord_of_sal;