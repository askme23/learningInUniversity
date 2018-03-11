drop sequence GEN_ID_HOUSE_HOUSE;
drop sequence GEN_ID_EXP;

create sequence GEN_ID_HOUSE increment by 1
    start with 1;
create sequence GEN_ID_EXP increment by 1
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
        -- add records to TRADE_HOUSES
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Усольское раздолье', 'Батайская 40');
        temp1 := GEN_ID_HOUSE.CURRVAL;
        
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Ленинский', 'Молодёжная 22');
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Дом офицеров', 'Вагонников 3-я 11');
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Галерея', 'Барвихинская 62');
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Усадьба Сахаровых', 'Бакинская 40');
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Венский дом', 'Бакунинская 76');
        insert into TRADE_HOUSES
        values (GEN_ID_HOUSE.NEXTVAL, 'Сибирская палата', 'Адмирала Руднева 44');
        
        temp2 := GEN_ID_HOUSE.CURRVAL;
    
        -- add records to TRADE_EXPOSITIONS
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Праздничный удел', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Выставка меха', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Праздничная выставка', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Новогодняя выставка', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Выставка5', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Выставка6', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Выставка7', '' || to_date(sysdate + dbms_random.value(1, 120)));
        insert into TRADE_EXPOSITIONS
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Выставка8', '' || to_date(sysdate + dbms_random.value(1, 120)));

        commit;
    exception when others then
        -- при любой ошибки откатываем транзакцию
        raise_application_error(-20001, 'Возникла следующая ошибка со следующим кодом-' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end ADD;

    procedure DEL is
    begin
        delete from TRADE_EXPOSITIONS;
        delete from TRADE_HOUSES;
        commit;

        dbms_output.put_line('Таблицы TRADE_HOUSES и TRADE_EXPOSITIONS очищены.');
    exception when others then
        -- аналогично, при любой ошибке октатываем транзакцию
        raise_application_error(-20001, 'Возникла следующая ошибка со следующим кодом-' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end DEL;
end PKG_CHANGE_TABLES;