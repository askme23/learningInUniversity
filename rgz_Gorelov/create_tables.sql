drop table RESTAURANTS CASCADE CONSTRAINTS;
drop table TECH_EQUIP CASCADE CONSTRAINTS;

-- создание таблицы банков
create table RESTAURANTS (
    ID NUMBER NOT NULL,
    REST_NAME VARCHAR2(60) NOT NULL
);
-- добавление индекса и первичного ключа
create unique index REST_PK_ID ON RESTAURANTS (ID);
alter table RESTAURANTS add constraint D_REST_PK_ID primary key (ID) enable;

-- создание таблицы Банкоматов
create table TECH_EQUIP (
    ID NUMBER NOT NULL,
    REST_ID NUMBER,
    EQUIP_NAME VARCHAR2(50) NOT NULL,
    N_COST NUMBER
);
-- также добавляем индекс и ключи для таблицы Банкоматов
create unique index UNIQUE_RECORD ON TECH_EQUIP (ID);
alter table TECH_EQUIP add constraint D_EQUIP_PK_ID primary key (ID) enable;
alter table TECH_EQUIP add constraint D_EQUIP_FK_PID foreign key (REST_ID) references RESTAURANTS (ID) enable;
