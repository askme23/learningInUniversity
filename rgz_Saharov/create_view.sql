create or replace view HOUSES_AND_EXPOSITIONS as
select th.ID,
       th.HOUSE_NAME,
       te.TRADE_EXPOSITIONS_NAME,
       te.D_DATE
  from TRADE_HOUSES th 
       join TRADE_EXPOSITIONS te on th.ID = te.HOUSE_ID
 where D_DATE < '13.05.2018';
       