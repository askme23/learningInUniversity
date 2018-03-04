create or replace trigger ALLOW_CHANGE_EQUIP_COST
before update on TECH_EQUIP
for each row
declare
    date_error exception;
    n_day NUMBER;
begin
    select extract(day from sysdate)
      into n_day
      from dual;

    if n_day >= 20 then
        raise date_error;
    end if;

exception 
    when date_error then
        dbms_output.put_line('Изменять стоимость возможно только до 20 числа.');
    when others then
        dbms_output.put_line('Ошибка при попытке изменения.');
end;