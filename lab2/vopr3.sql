declare
    cursor c_count is
    select cu.city, 
           count(*) cnt
      from cust cu
     group by cu.city;
     
     type arr_count is table of NUMBER
     index by varchar(30);
     
     cnt_cust_in_city arr_count;
     s_index varchar(30);
begin
    for v in c_count loop
        cnt_cust_in_city(v.city) := v.cnt;
    end loop;
    
    --получаем ключи массива
    s_index := cnt_cust_in_city.last();
    dbms_output.put_line('Последний элемент: ' || 'Город - ' || s_index || ' количество продавцов - ' || cnt_cust_in_city(s_index));
    s_index := cnt_cust_in_city.prior(s_index);
    dbms_output.put_line('Предпоследний элемент: ' || 'Город - ' || s_index || ' количество продавцов - ' || cnt_cust_in_city(s_index));
end;