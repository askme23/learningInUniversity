create or replace trigger logger_all
after INSERT OR DELETE OR UPDATE on sal
for each row
begin
    insert into table_log
    values ('insert', 'sal', user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
end;