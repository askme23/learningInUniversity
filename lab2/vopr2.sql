declare
    cursor get_rate is
    select cu.*
      from cust cu
    where rating > (select avg(rating)
                      from cust)
      and rownum < 5;
  
    c_record get_rate%rowtype;
begin
/*��������� ����*/
    for v in get_rate loop
        dbms_output.put_line('��������� ����:');
        dbms_output.put_line('� ���������� ' || v.cname || ' ������� ' || v.rating);
    end loop;
    
    /*������� ����*/
    open get_rate;
        loop
            fetch get_rate into c_record;
            if get_rate%NOTFOUND then
                exit;
            end if;
            
            dbms_output.put_line('������� ����:');
            dbms_output.put_line('� ���������� ' || c_record.cname || ' ������� ' || c_record.rating);
        end loop;
    close get_rate;
end;
