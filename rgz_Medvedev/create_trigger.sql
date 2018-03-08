create table REG_TABLE as
      select * 
        from PUBLISH;
delete from REG_TABLE;
commit;
-----------------------------------------------------
create or replace trigger SAVE_CHANGE_PUBLISH
after update on PUBLISH
for each row
begin
    insert into REG_TABLE(ID, SPR_ID, PUBLISH_NAME)
    values(:OLD.ID, :OLD.SPR_ID, :OLD.PUBLISH_NAME, :OLD.FINANS_AMOUNT);
end;