grant select on sal to PUBLIC;
grant select on cust to up2;

select * 
  from TABLE_PRIVILEGES
 where owner in ('up1', 'up2');

revoke select on cust from up1, up2;
revoke select on sal from up1, up2;

select * 
  from TABLE_PRIVILEGES
 where owner in ('up1', 'up2');