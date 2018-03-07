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
        -- add records to BANKS
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Альфа Банк');
        temp1 := GEN_ID.CURRVAL;
        
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Сбербанк');
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'ВТБ');
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Тинькофф');
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Европа Банк');
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Райффайзен');
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Левобережный');
        
        temp2 := GEN_ID.CURRVAL;
    
        -- add records to CASH_MACHINE
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Барвихинская 76', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Барминовская 43', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Глинки 6', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Маршала Василевского 66', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Садовая 12', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Веселова 44', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Батюнинская 74', trunc(dbms_random.value(100, 15000)));
        insert into CASH_MACHINE
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Кирова 5', trunc(dbms_random.value(100, 15000)));

        commit;
    exception when others then
        -- неважно что произойдет, любая ошибка должна вызывать откат транзакции
        rollback;
    end ADD;

    procedure DEL is
    begin
        delete from CASH_MACHINE;
        delete from BANKS;
        commit;

        dbms_output.put_line('Таблицы BANKS и CASH_MACHINE очищены.');
    exception when others then
        -- любая ошибка должна вызывать откат транзакции
        rollback;
    end DEL;
end PKG_CHANGE_TABLES;