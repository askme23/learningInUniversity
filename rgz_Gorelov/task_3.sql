/***** 1 *****/
select t.COMMAND
  from p4307 t
order by @seq;

/***** 2 *****/
select count(t.COMMAND), 
       t.COMMAND_TYPE 
  from p4307 t 
 where t.COMMAND != @com
 group by t.COMMAND_TYPE

/***** 3 *****/
select t.COMMAND
  from p4307 t
 where t.COMMAND_TYPE NOT IN (select t.COMMAND_TYPE
                                from p4307 t
                               where t.COMMAND LIKE '%TER%'
                            group by t.COMMAND_TYPE)
 order by t.COMMAND

