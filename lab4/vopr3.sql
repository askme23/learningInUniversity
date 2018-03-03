create sequence n_snum start with 3000 increment by 1;
/
create or replace trigger new_snum 
before INSERT on sal
for each row
begin
  select n_snum.nextval
    into :new.snum
    from dual;
end;

