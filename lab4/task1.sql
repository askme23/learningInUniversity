--table_log - �������, ���� ����� ���������
drop table table_log;
drop trigger logger;

create table table_log (
  s_action varchar2(40),
  s_table varchar2(20),
  s_user varchar2(20),
  s_date varchar2(40)
);

create or replace trigger logger
after insert on sal
for each row
begin
    insert into table_log
    values ('insert', 'sal', user, to_char(SYSTIMESTAMP, 'dd.mm.yyyy hh24:mi'));
end;