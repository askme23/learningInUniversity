create or replace package PKG_CHANGE_DATA is 
    procedure ADD;
    procedure DEL;
    procedure DEL_SERVICE (DEL_ID NUMBER);
    procedure CREATE_TRIGGER;
end PKG_CHANGE_DATA;
/
create or replace package body PKG_CHANGE_DATA is
    procedure ADD is
    begin
        PKG_CHANGE_TABLES.ADD();
    end ADD;

    procedure DEL is
    begin
        PKG_CHANGE_TABLES.DEL();
    end DEL;

    procedure DEL_SERVICE(DEL_ID NUMBER) is
    begin
        delete 
          from SERVICES_TYPES st
         where st.ID = DEL_ID;
        commit;

    exception when others then
        raise_application_error(-20001, 'Возникла следующая ошибка -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end DEL_SERVICE;

    procedure CREATE_TRIGGER is   
    begin
        execute immediate 'drop trigger REG_DEL';
        execute immediate 'create or replace trigger REG_DEL
                            before delete on SERVICES_TYPES
                            for each row
                            declare
                                s_user VARCHAR2(50);
                            begin
                                select user
                                  into s_user
                                  from dual;
                                  
                                insert into LOG_SERVICE_TABLE
                                values(s_user, :old.ID, :old.PID, :old.SERVICE_TYPE);
                                
                            exception when others then
                                dbms_output.put_line(''Незможно добавить запись в таблицу LOG_SERVICE_TABLE'');
                            end;';
    exception when OTHERS then
        dbms_output.put_line('Невозможно создать триггер');
        raise_application_error(-20001, 'Возникла следующая ошибка -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end CREATE_TRIGGER;
end PKG_CHANGE_DATA;