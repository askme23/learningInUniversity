declare
  min_rating VARCHAR2(30);
  error_rating exception;
begin
  select min(rating)
    into min_rating
    from cust;
    
    if min_rating < 200 then
      raise error_rating; 
    end if;  
exception 
  when error_rating then
    dbms_output.put_line('У покупателя рейтинг меньше 200');
  when no_data_found then
    dbms_output.put_line('Данные не найдены');
  when others then
    dbms_output.put_line('Что - то пошло не так');
end;