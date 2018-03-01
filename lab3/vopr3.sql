declare 
    s_snum SAL.snum%type := 1010;
    s_sname SAL.sname%type := 'Igor';
    s_city SAL.city%type := 'Novosib';
    s_comm SAL.comm%type := 0.13;
    s_query varchar2(200);
begin
    s_query :='insert into SAL values (' || s_snum || ',' || '''' || s_sname || '''' || ',' || '''' || s_city || '''' || ',' || to_char(s_comm, '9.99') || ')';
    execute immediate s_query;
end;