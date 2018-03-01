declare
    cursor get_rate is
    select cu.*
      from cust cu
    where rating > (select avg(rating)
                      from cust)
      and rownum < 5;
  
    c_record get_rate%rowtype;
begin
/*курсорный цикл*/
    for v in get_rate loop
        dbms_output.put_line('Курсорный цикл:');
        dbms_output.put_line('У покупателя ' || v.cname || ' рейтинг ' || v.rating);
    end loop;
    
    /*обычный цикл*/
    open get_rate;
        loop
            fetch get_rate into c_record;
            if get_rate%NOTFOUND then
                exit;
            end if;
            
            dbms_output.put_line('Обычный цикл:');
            dbms_output.put_line('У покупателя ' || c_record.cname || ' рейтинг ' || c_record.rating);
        end loop;
    close get_rate;
end;
