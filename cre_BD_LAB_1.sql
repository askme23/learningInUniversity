create or replace PROCEDURE BD_LAB_1   IS
  str varchar2(32767);
  len number;
  sl  number := 250;
  p   number;
BEGIN
  str := BD_TXT_LAB1;
  len := length(str);
  p := 0;
  dbms_output.enable(100000);
  while p<len+sl loop
--  while p<20000 loop
    dbms_output.put(substr(str,p+1,sl));
    p := p+sl;
    if (mod(p,2500)=0) then
      dbms_output.new_line;
--      dbms_output.put_line('p='||p);
    end if;  
  end loop;
  dbms_output.new_line;
EXCEPTION
    WHEN others THEN
      dbms_output.put_line('Îøèáêà'||'');
END BD_LAB_1;
/
