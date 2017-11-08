ACCEPT v1 CHAR PROMPT 'Выберите какой округ должен отбрасываться(первый или последний по алфавиту):'

select t.district,
       t.capital
  from p4303 t
where t.district != (case '&v1'
                        when 1 then 
                            (select MIN(t1.district)
                               from p4303 t1)
                        when 2 then 
                            (select MAX(t1.district)
                               from p4303 t1) 
                     end)