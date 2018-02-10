create or replace package pkg_sup_proc IS
    function get_min_surname
    (
        first_student VARCHAR2,
        second_student VARCHAR2
    ) return VARCHAR2;
    
    function get_max_surname
    (
        first_student VARCHAR2,
        second_student VARCHAR2
    ) return VARCHAR2;
end pkg_sup_proc;
/
create or replace package body pkg_sup_proc is
    function get_min_surname
    (
        first_student in VARCHAR2,
        second_student in VARCHAR2
    ) return VARCHAR2 is 
    begin
        if length(first_student) > length(second_student) then
            return first_student;
        else 
            return second_student;
        end if;
    end get_min_surname;
    
    function get_max_surname
    (
        first_student in VARCHAR2,
        second_student in VARCHAR2
    ) return VARCHAR2 is 
    begin
        if length(first_student) < length(second_student) then
            return first_student;
        else 
            return second_student;
        end if;
    end get_max_surname;
end pkg_sup_proc;

