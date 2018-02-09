declare
  m_amount number;
  c_name VARCHAR2(40);
  cname_error exception;
begin
  select avg(amt)
    into m_amount
    from ord;

        select cu.cname
          into c_name
          from ord o
               join cust cu on cu.cnum = o.cnum
         where o.amt > m_amount
           and rownum = 1;
         
         if c_name is not null then
            raise cname_error;
         end if;
  
exception when cname_error then
    dbms_output.put_line(c_name);
end;