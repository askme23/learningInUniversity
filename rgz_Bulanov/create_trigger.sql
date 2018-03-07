create or replace trigger CHECK_ON_OWNER
before insert on CASH_MACHINE
declare
    s_owner TABLE_PRIVILEGES.OWNER%type;
    owner_error exception;
begin
    select tp.OWNER
      into s_owner
      from TABLE_PRIVILEGES tp
     where tp.TABLE_NAME = 'CASH_MACHINE';

    if s_owner != user then
        raise owner_error;
    end if;

exception 
    when owner_error then
        dbms_output.put_line('Данный пользователь не является владельцем таблицы CASH_MACHINE и соответственно не может удалять банкоматы.');
    when others then
        dbms_output.put_line('Ошибка при попытке удаления.');
end;