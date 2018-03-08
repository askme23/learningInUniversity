drop sequence GEN_ID;
create sequence GEN_ID increment by 1
        start with 1;
/  
create or replace package PKG_CHANGE_TABLES is 
    procedure ADD;
    procedure DEL;
end PKG_CHANGE_TABLES;
/
create or replace package body PKG_CHANGE_TABLES is
    temp1 NUMBER;
    temp2 NUMBER;

    procedure ADD is
    begin
        -- add records to SPONSORS
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсор1');
        temp1 := GEN_ID.CURRVAL;
        
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсор2');
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсор3');
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсо4');
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсо5');
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсо6');
        insert into SPONSORS
        values (GEN_ID.NEXTVAL, 'Спонсор7');
        
        temp2 := GEN_ID.CURRVAL;
    
        -- add records to PUBLISH
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство1', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство2', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство3', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство4', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство5', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство6', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство7', dbms_random.value(2000, 15000));
        insert into PUBLISH
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Издательство8', dbms_random.value(2000, 15000));

        commit;
    exception when others then
        -- при любой ошибки откатываем транзакцию
        rollback;
    end ADD;

    procedure DEL is
    begin
        delete from SPONSORS;
        delete from PUBLISH;
        commit;

        dbms_output.put_line('Таблицы SPONSORS и PUBLISH очищены.');
    exception when others then
        -- аналогично, при любой ошибке октатываем транзакцию
        rollback;
    end DEL;
end PKG_CHANGE_TABLES;