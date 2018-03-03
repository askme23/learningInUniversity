delete from sal_copy;
truncate table ord_copy;
delete from cust_copy;

--rollback;
--все таблицы будут пустыми, потому что truncate 
--все закоммитит и rollback уже ни на что не повлияет