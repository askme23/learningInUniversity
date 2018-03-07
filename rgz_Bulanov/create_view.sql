create or replace view BANKS_AND_MACHINE as
select b.*,
       cm.ID,
       cm.MACHINE_LOCATION
  from BANKS b 
       join CASH_MACHINE cm on b.ID = cm.PID
 where b.BANK_NAME not in ('Тинькофф', 'Райффайзен');