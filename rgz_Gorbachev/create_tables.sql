drop table ADVERT_AGENCY CASCADE CONSTRAINTS;
drop table SERVICES_TYPES CASCADE CONSTRAINTS;

-- создание таблицы банков
create table ADVERT_AGENCY (
    ID NUMBER NOT NULL,
    AGENCY_NAME VARCHAR2(60) NOT NULL
);
-- добавление индекса и первичного ключа
create unique index AGENCY_PK_ID ON ADVERT_AGENCY (ID);
alter table ADVERT_AGENCY add constraint D_AGENCY_PK_ID primary key (ID) enable;

-- создание таблицы Банкоматов
create table SERVICES_TYPES (
    ID NUMBER NOT NULL,
    PID NUMBER,
    SERVICE_TYPE VARCHAR2(50)
);
-- также добавляем индекс и ключи для таблицы Банкоматов
alter table SERVICES_TYPES add constraint D_SERVICE_PK_ID primary key (ID) enable;
alter table SERVICES_TYPES add constraint D_SERVICE_FK_PID foreign key (PID) references ADVERT_AGENCY (ID) enable;