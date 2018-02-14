create or replace trigger logger_all
after INSERT OR DELETE OR UPDATE on sal
for each row
declare 
    sAction varchar2(15);
begin
    if INSERTING then
        sAction := 'insert';
    elsif UPDATING then
        sAction := 'update';
    elsif DELETING then
        sAction := 'delete';
    end if;

    insert into table_log
    values (sAction, 'sal', user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
    commit;
end;