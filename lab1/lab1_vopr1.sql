declare
  default_snum INTEGER default 1001;
  v_snum INTEGER;
begin
  loop
    select snum
    into v_snum
    from sal
    where snum = default_snum;
    
    default_snum := default_snum + 1;
  end loop;
exception when no_data_found then
    dbms_output.put_line(default_snum);
end;