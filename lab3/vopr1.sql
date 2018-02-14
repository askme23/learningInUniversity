create table Shedule(
    id NUMBER not null,
    disc_name varchar2(80),
    day_of_week varchar2(20),
    lect_hall varchar2(10)
);

alter table Shedule add constraint shedule_pk_id primary key (id) enable;

create sequence cnt increment by 1
start with 1;

insert into Shedule
    values(cnt.nextval, 'Сетевые базы данных', 'Вторник', '425');
insert into Shedule
    values(cnt.nextval, 'Сетевое ПО', 'Среда', '407');
insert into Shedule
    values(cnt.nextval, 'ТСВПиС', 'Четверг', '432');
insert into Shedule
    values(cnt.nextval, 'Современные технологии программирования', 'Суббота', '432');
