drop table print_sequence;
drop sequence n_val;

create table print_sequence(
    n_value number
);
    
create sequence n_val increment by 4
    start with 23;
/
begin   
    for counter IN 1..3 loop
        insert into print_sequence(n_value)
        values(n_val.nextval + dbms_random.random / 1000);
    end loop;
end;
/
select *
  from print_sequence;
    
    