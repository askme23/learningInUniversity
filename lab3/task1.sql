create or replace procedure change_dep
(
    current_number in integer,
    new_number in integer
) as
begin
    update dep
       set num = new_number
     where num = current_number;
end;