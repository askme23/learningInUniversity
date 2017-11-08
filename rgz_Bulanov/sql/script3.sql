ACCEPT v1 CHAR PROMPT 'Введите номер:'

select t3.N,
       t3.region
  from p4303 t3
 where t3.district in (select t.district 
                         from p4303 t
                        where t.N <= '&v1')