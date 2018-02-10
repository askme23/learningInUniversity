CREATE OR REPLACE PACKAGE exec_sup_proc is
    procedure print_surname;
end exec_sup_proc;
/
create or replace package body exec_sup_proc is
    procedure print_surname is
    begin
        dbms_output.put_line(pkg_sup_proc.get_min_surname('Bulanov', 'Gorelovv'));
        dbms_output.put_line(pkg_sup_proc.get_max_surname('Bulanov', 'Gorelovv'));
    end print_surname;
end exec_sup_proc;
/
begin
    exec_sup_proc.print_surname();
end;