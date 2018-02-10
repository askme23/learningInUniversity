create or replace trigger sal_logger
after INSERT on sal
for each row
begin
    if lower(:new.city) = 'rome' then
        raise_application_error(-20666, 'Нельзя добавлять продавца из Рима'); 
    else 
        insert into table_log
        values ('insert', 'sal', user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
    end if;
end;