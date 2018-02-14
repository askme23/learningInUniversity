ACCEPT s_city CHAR PROMPT 'Город покупатела(ей):';
/
declare
    cursor cust is 
    SELECT * 
      FROM cust
     WHERE city = '&s_city'; 
begin
    dbms_output.put_line('Следующие продавцы из города ' || '&s_city' || ':');
    FOR v_z IN cust LOOP
      DBMS_OUTPUT.PUT_LINE('   Продавец ' || v_z.cname);
    END LOOP;
end;