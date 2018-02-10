delete from copy_sal;
delete from copy_cust;
truncate table copy_ord;
rollback;
--все таблицы будут пустыми, потому что truncate 
--все закоммитит и rollback уже ни на что не повлияет