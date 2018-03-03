create table more5000 (user_name varchar2(30), s_date varchar2(40));
create table less5000 (user_name varchar2(30), s_date varchar2(40));
/
create or replace trigger ord_logger
before INSERT on ord
for each row
begin
    if :new.amt > 5000 then 
        insert into more5000
        values (user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
    else
       insert into less5000
        values (user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
    end if;
end;