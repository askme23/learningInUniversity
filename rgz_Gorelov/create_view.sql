create or replace view RESTAURANTS_AND_QUIPMENT as
select r.*,
       te.EQUIP_NAME,
       te.N_COST
  from RESTAURANTS r 
       join TECH_EQUIP te on r.ID = te.REST_ID;