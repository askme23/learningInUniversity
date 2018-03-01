drop table shedule_matrix;
/
create or replace package operations_with_matrix is
    procedure create_shedule_matrix;
end operations_with_matrix;
/
create or replace package body operations_with_matrix is
    procedure create_shedule_matrix is
    begin
        execute immediate 'create table shedule_matrix as
        (select sh.disc_name,
                decode(sh.DAY_OF_WEEK, ''Вторник'', sh.lect_hall, null) Вторник,
                decode(sh.DAY_OF_WEEK, ''Среда'', sh.lect_hall, null) Среда,
                decode(sh.DAY_OF_WEEK, ''Четверг'', sh.lect_hall, null) Четверг,
                decode(sh.DAY_OF_WEEK, ''Суббота'', sh.lect_hall, null) Суббота
           from Shedule sh)';
    end create_shedule_matrix;
end operations_with_matrix;