declare
    CURSOR c_ord(p_Date VARCHAR2) IS
    select o.*
      from ORD o
     where extract(day from o.ODATE) > 4
       and o.ODATE = to_date(p_Date);
begin
    FOR v_ord IN c_ord('06.01.2009') LOOP
        DBMS_OUTPUT.PUT_LINE('Заказ ' ||v_ord.onum|| ' сумма ' ||v_ord.amt);
    END LOOP;
end;