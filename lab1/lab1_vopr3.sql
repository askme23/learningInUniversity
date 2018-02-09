declare
    s_name varchar2(40);
begin
    UPDATE SAL
       SET COMM = 0.20
     WHERE CITY = 'New York'
 RETURNING sname into s_name;
    
    dbms_output.put_line(s_name);
end;