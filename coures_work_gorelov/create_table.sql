-- create table of communucation services and set a constraint
create table D_COMMUNICATION_SERVICES (
    id number not null,
    name_of_service varchar2(300) not null,
    serv_designation varchar2(600)
);

create unique index D_COMMUNICATION_SERVICES_PK_ID ON D_COMMUNICATION_SERVICES (id);
alter table D_COMMUNICATION_SERVICES add constraint D_COMMUNICATION_SERVICES_ID primary key (id) enable;



-- create table of phone company and set a constraint
create table D_PHONE_COMPANY (
    id number not null,
    comp_name varchar2(100) not null,
    comp_address varchar(100),
    comp_staff number(10)
);

alter table D_PHONE_COMPANY add constraint D_PHONE_COMPANY_FK_ID foreign key (id) references D_COMMUNICATION_SERVICES (id) enable;


