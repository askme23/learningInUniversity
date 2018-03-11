create or replace trigger FORBID_ADD_AFTERNOON
before insert on TRADE_EXPOSITIONS 
declare
    DATE_ERROR exception;
begin
    
    if extract(hour from localtimestamp) > 18 then
        raise DATE_ERROR;
    end if;
    
exception when DATE_ERROR then
    dbms_output.put_line('Вставка новой выставки в таблицу TRADE_EXPOSITIONS в вечернее время запрещена');
end;