declare 
    CURSOR c_sals IS
    SELECT s.SNAME,
           s.COMM
      FROM SAL s
     WHERE s.CITY != 'London'
       AND ROWNUM < 3;
       
    s_records c_sals%ROWTYPE;
begin
    open c_sals;
        loop
            fetch c_sals into s_records;
            if c_sals%NOTFOUND then
                exit;
            end if;
            
            dbms_output.put_line('Продавец - ' || s_records.SNAME || ' имеет комиссионные - ' || '0' || to_char(s_records.COMM));
        end loop;
    close c_sals;
end;