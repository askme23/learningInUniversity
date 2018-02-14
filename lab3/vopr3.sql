declare 
    s_snum sal.snum%type := 1111;
    s_sname sal.sname%type := 'Ruslan';
    s_city sal.city%type := 'Novosib';
    s_comm sal.comm%type := 0.12;
begin
    execute immediate ('insert into SAL values (' || s_snum || ',' || s_sname || ',' || s_city || ',' || s_comm || ')');
end;