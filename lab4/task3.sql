create or replace trigger sal_logger
before INSERT on sal
for each row
begin
    if lower(:new.city) = 'rome' then
        raise_application_error(-20666, 'not rome'); 
    else 
        insert into table_log
        values ('insert', 'sal', user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
        commit;
    end if;
end;