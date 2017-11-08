ACCEPT v1 CHAR PROMPT 'Введите букву, с которой будет начинаться вывод:'

select region
  from p4303
 where region > ASCII('&v1' + 1);
