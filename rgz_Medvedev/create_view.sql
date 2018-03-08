create or replace view SPONSORS_AND_PUBLISH as
select spr.*,
       pbl.ID PUBLISH_ID,
       pbl.PUBLISH_NAME
  from SPONSORS spr
       join PUBLISH pbl on spr.ID = pbl.SPR_ID
 where pbl.PUBLISH_NAME <> 'Издательство6';