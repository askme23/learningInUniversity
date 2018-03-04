create or replace view BANKS_AND_MACHINE as
select b.*,
       cm.MACHINE_LOCATION,
       cm.SERIAL_KEY
  from BANKS b 
       join CASH_MACHINE cm on b.ID = cm.PID;

-- /

-- create or replace function policy_func (p_schema varchar2, p_object varchar2) 
-- return varchar2 is
-- begin
--    if (user != 'br36') then
--       return 'clientoffice in (10, 20, 30)';
--    elseif
--       return 'clientoffice = (select useroffice from users where username = user)';
--    end if;
-- end;
    