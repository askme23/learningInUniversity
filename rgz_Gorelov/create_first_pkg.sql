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
        -- add records to RESTAURANTS
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'Peoples');
        temp1 := GEN_ID.CURRVAL;
        
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'Шашлыкофф');
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'Дрова Мука');
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'Аджикинежаль');
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'RAGU');
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'Парк кафе');
        insert into RESTAURANTS
        values (GEN_ID.NEXTVAL, 'Небо');
        
        temp2 := GEN_ID.CURRVAL;
    
        -- add records to TECH_EQUIP
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Духовой шкаф Bosh', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Гриль Webber', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Тандыр', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Посудомоечная машина Bosh', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Каменная печь', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Стойки для разлива пива', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Плита', trunc(dbms_random.value(20000, 500000)));
        insert into TECH_EQUIP
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Кухонный комбайн', trunc(dbms_random.value(20000, 500000)));

        commit;
    exception when others then
        -- при любой ошибки откатываем транзакцию
        rollback;
    end ADD;

    procedure DEL is
    begin
        delete from TECH_EQUIP;
        delete from RESTAURANTS;
        commit;

        dbms_output.put_line('Таблицы RESTAURANTS и TECH_EQUIP очищены.');
    exception when others then
        -- аналогично, при любой ошибке октатываем транзакцию
        rollback;
    end DEL;
end PKG_CHANGE_TABLES;