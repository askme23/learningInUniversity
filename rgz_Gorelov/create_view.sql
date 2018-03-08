create or replace view RESTAURANTS_AND_QUIPMENT as
select r.*,
       te.EQUIP_NAME
  from RESTAURANTS r 
       join TECH_EQUIP te on r.ID = te.REST_ID
 where r.REST_NAME <> 'RAGU';