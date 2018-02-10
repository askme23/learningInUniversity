CREATE OR REPLACE PACKAGE Pack IS
  PROCEDURE Sal_cnt(sal_city VARCHAR2);
  PROCEDURE Cust_cnt(cust_city VARCHAR2);
END Pack;
/
CREATE OR REPLACE PACKAGE BODY Pack IS
  cnt NUMBER;
  
  PROCEDURE Sal_cnt (sal_city VARCHAR2) IS    
    cursor cur(vCity VARCHAR2) is
    select count(*)
      from sal
     where city = vCity;
  BEGIN
    open cur(sal_city);
        fetch cur into cnt;
        DBMS_OUTPUT.put_line('Sal count = ' || cnt);
    close cur;
  END Sal_cnt;
  PROCEDURE Cust_cnt (cust_city VARCHAR2) IS
    cursor cur(vCity VARCHAR2) is
     select count(*)
       from cust
      where city = vCity;
  BEGIN
    open cur(cust_city);
        fetch cur into cnt;
        DBMS_OUTPUT.put_line('Cust count = ' || cnt);
    close cur;
  END Cust_cnt;
END Pack;
/
BEGIN
    Pack.Sal_cnt('London');
END;