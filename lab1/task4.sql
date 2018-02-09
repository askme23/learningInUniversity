DECLARE
  last_name VARCHAR2(40);
  status VARCHAR2(40) default '0';
  return_code INTEGER default 0;
BEGIN
   SELECT sname 
     INTO last_name 
     FROM study.sal
    WHERE snum = 5000;
EXCEPTION
   when OTHERS then
    status := 'Данные не найдены';
    return_code := 5;
    
    dbms_output.put_line(status);
    dbms_output.put_line(return_code);
END;