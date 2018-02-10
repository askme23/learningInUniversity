create role my_role;
grant select, update, insert, update on sal to my_role;
grant my_role to up1, up2;

select * 
  from TABLE_PRIVILEGES
 where owner in ('up1', 'up2');
 
revoke insert on sal from my_role;

select * 
  from TABLE_PRIVILEGES
 where owner in ('up1', 'up2');