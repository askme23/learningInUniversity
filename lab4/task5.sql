delete from copy_sal;
delete from copy_cust;
truncate table copy_ord;
rollback;
--��� ������� ����� �������, ������ ��� truncate 
--��� ���������� � rollback ��� �� �� ��� �� ��������