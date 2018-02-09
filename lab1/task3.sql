declare
  max_date DATE;
begin
  select max(ODATE)
    into max_date
    from ORD;
    
    dbms_output.put_line(max_date);
exception when no_data_found then
  dbms_output.put_line('No date');
end;