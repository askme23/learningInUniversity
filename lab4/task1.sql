--table_log - таблица, куда будем добавлять

create or replace trigger logger
after insert on sal
for each row
begin
    insert into table_log
    values ('insert', 'sal', user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
end;