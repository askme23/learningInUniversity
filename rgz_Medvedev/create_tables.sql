drop table SPONSORS CASCADE CONSTRAINTS;
drop table PUBLISH CASCADE CONSTRAINTS;

-- создание таблицы банков
create table SPONSORS (
    ID NUMBER NOT NULL,
    SPONSOR_NAME VARCHAR2(60) NOT NULL
);

-- добавление индекса и первичного ключа
create unique index SP_PK_ID ON PUBLISH (ID);
alter table SPONSORS add constraint D_SP_PK_ID primary key (ID) enable;

-- создание таблицы Банкоматов
create table PUBLISH (
    ID NUMBER NOT NULL,
    SPR_ID NUMBER,
    PUBLISH_NAME VARCHAR2(50) NOT NULL,
    FINANS_AMOUNT NUMBER
);
-- также добавляем индекс и ключи для таблицы Банкоматов
create unique index UNIQUE_RECORD ON PUBLISH (ID);
alter table PUBLISH add constraint D_PBL_PK_ID primary key (ID) enable;
alter table PUBLISH add constraint D_PBL_FK_PID foreign key (SPR_ID) references SPONSORS (ID) enable;
