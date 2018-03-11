drop table TRADE_HOUSES CASCADE CONSTRAINTS;
drop table TRADE_EXPOSITIONS CASCADE CONSTRAINTS;

-- создание таблицы банков
create table TRADE_HOUSES (
    ID NUMBER NOT NULL,
    HOUSE_NAME VARCHAR2(60) NOT NULL,
    HOUSE_ADDR VARCHAR2(60)
);

-- добавление индекса и первичного ключа
create unique index TH_PK_ID ON TRADE_EXPOSITIONS (ID);
alter table TRADE_HOUSES add constraint D_TH_PK_ID primary key (ID) enable;

-- создание таблицы Банкоматов
create table TRADE_EXPOSITIONS (
    ID NUMBER NOT NULL,
    HOUSE_ID NUMBER,
    TRADE_EXPOSITIONS_NAME VARCHAR2(50) NOT NULL,
    D_DATE DATE
);
-- также добавляем индекс и ключи для таблицы Банкоматов
create unique index UNIQUE_RECORD ON TRADE_EXPOSITIONS (ID);
alter table TRADE_EXPOSITIONS add constraint D_TE_PK_ID primary key (ID) enable;
alter table TRADE_EXPOSITIONS add constraint D_TE_FK_PID foreign key (HOUSE_ID) references TRADE_HOUSES (ID) enable;
