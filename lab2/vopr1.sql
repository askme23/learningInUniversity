ACCEPT s_city CHAR PROMPT '����� ����������(��):';
/
declare
    cursor cust is 
    SELECT * 
      FROM cust
     WHERE city = '&s_city'; 
begin
    dbms_output.put_line('��������� �������� �� ������ ' || '&s_city' || ':');
    FOR v_z IN cust LOOP
      DBMS_OUTPUT.PUT_LINE('   �������� ' || v_z.cname);
    END LOOP;
end;