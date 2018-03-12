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
        -- add records to ADVERT_AGENCY
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Росагенство');
        temp1 := GEN_ID.CURRVAL;
        
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Бухгалтер');
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Кронос');
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Рекламное агенство Пегас');
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Спэйс');
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Ворон');
        insert into ADVERT_AGENCY
        values (GEN_ID.NEXTVAL, 'Полином');
        
        temp2 := GEN_ID.CURRVAL;
    
        -- add records to SERVICES_TYPES
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Печать баннеров');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Печать газет и журналов');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Услуги типографии');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Печать газет');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Полиграфия');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Пиар');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Создание рекламы');
        insert into SERVICES_TYPES
        values (GEN_ID.NEXTVAL, trunc(dbms_random.value(temp1, temp2)), 'Продвижение в интернете');

        commit;
    exception when others then
        raise_application_error(-20001, 'Возникла следующая ошибка -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end ADD;

    procedure DEL is
    begin
        delete from SERVICES_TYPES;
        delete from ADVERT_AGENCY;
        commit;

        dbms_output.put_line('Таблицы ADVERT_AGENCY и SERVICES_TYPES очищены.');
    exception when others then
        raise_application_error(-20001, 'Возникла следующая ошибка -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end DEL;
end PKG_CHANGE_TABLES;