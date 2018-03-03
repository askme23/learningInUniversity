create or replace package PKG_CHANGE_TABLES is 
    procedure ADD ();
    procedure DEL ();
end PKG_CHANGE_TABLES;
/
create or replace package body PKG_CHANGE_TABLES is
    procedure ADD is
        create sequence GEN_ID increment by 1
        start with 1;

        temp1 NUMBER;
        temp2 NUMBER;
    begin

        temp1 := GEN_ID.CURVAL;
        -- add records to BANKS
        insert into BANKS
        values (GEN_ID.NEXTVAL, 'Альфа Банк');
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
        
        temp2 := GEN_ID.CURVAL;
        -- ставим точку отсчет снова на 1
        alter sequence GEN_ID start with 1;
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
    end ADD;

    procedure DEL is
    begin
        delete from BANKS;
        delete from CASH_MACHINE;
        commit;

        dbms_output.put_line('Таблицы BANKS и CASH_MACHINE очищены.');
    end DEL;
end PKG_CHANGE_TABLES;