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
                decode(sh.DAY_OF_WEEK, ''�������'', sh.lect_hall, null) �������,
                decode(sh.DAY_OF_WEEK, ''�����'', sh.lect_hall, null) �����,
                decode(sh.DAY_OF_WEEK, ''�������'', sh.lect_hall, null) �������,
                decode(sh.DAY_OF_WEEK, ''�������'', sh.lect_hall, null) �������
           from Shedule sh)';
    end create_shedule_matrix;
end operations_with_matrix;