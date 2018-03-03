grant select on sal to public;
grant select on cust to up2;

select * 
  from TABLE_PRIVILEGES
 where GRANTEE = 'PUBLIC';

revoke select on cust from up2;
revoke select on sal from up2;
revoke select on sal from up1;

select * 
  from TABLE_PRIVILEGES
 where GRANTEE in ('UP1', 'UP2');