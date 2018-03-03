drop table BANKS;
drop table CASH_MACHINE;

-- создание таблицы банков
create table BANKS (
    ID NUMBER NOT NULL,
    BANK_NAME VARCHAR2(60) NOT NULL
);
-- добавление индекса и первичного ключа
create unique index BANK_PK_ID ON BANKS (ID);
alter table BANKS add constraint D_BANK_PK_ID primary key (ID) enable;

-- создание таблицы Банкоматов
create table CASH_MACHINE (
    ID NUMBER NOT NULL,
    PID NUMBER,
    MACHINE_LOCATION VARCHAR2(50),
    SERIAL_KEY NUMBER NOT NULL
);
-- также добавляем индекс и ключи для таблицы Банкоматов
create unique index UNIQUE_RECORD ON CASH_MACHINE (ID, SERIAL_KEY);
alter table CASH_MACHINE add constraint D_CASH_PK_ID primary key (ID) enable;
alter table CASH_MACHINE add constraint D_CASH_FK_PID foreign key (PID) references BANKS (ID) enable;
