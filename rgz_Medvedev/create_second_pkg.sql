create or replace package PKG_CHANGE_DATA is
    -- тип ссылка на курсор
    type cur is ref cursor;
    
    procedure ADD;
    procedure DEL;
    procedure CHANGE_PUBLISH_NAME (RECORD_ID NUMBER, NEW_PUBLISH_NAME VARCHAR2);
    function FIND_GENEROUS_SPONSOR (EXCLUDING_SPR VARCHAR2) RETURN cur;
    procedure PRINT_GENEROUS_SPONSOR (SPR cur);
end PKG_CHANGE_DATA;
/
create or replace package body PKG_CHANGE_DATA is
    procedure ADD 
    is
    begin
        PKG_CHANGE_TABLES.ADD();
    end ADD;
----------------------------------------------------
    procedure DEL is
    begin
        PKG_CHANGE_TABLES.DEL();
    end DEL;
-----------------------------------------------------
    procedure CHANGE_PUBLISH_NAME(RECORD_ID NUMBER, NEW_PUBLISH_NAME VARCHAR2) 
    is
    begin
        update PUBLISH
           set PUBLISH_NAME = NEW_PUBLISH_NAME
         where ID = RECORD_ID;
        commit;

    exception when others then
        -- при возникновении любой ошибки откатываем транзакцию
        rollback;
        raise_application_error(-20001, 'Возникла следующая ошибка со следующим кодом-' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end CHANGE_PUBLISH_NAME;
----------------------------------------------------------------------------
    procedure PRINT_GENEROUS_SPONSOR(SPR cur) 
    is
        type rec is record
        (
            ID NUMBER,
            SPONSOR_NAME VARCHAR2(60),
            PUBLISH_NAME VARCHAR2(50),
            FINANS_AMOUNT NUMBER
        );
        
        c_var rec;
    begin
        dbms_output.put_line('Информация о самом щедром спонсоре:');
        loop
            fetch SPR into c_var;
            exit when SPR%notfound;
            dbms_output.put_line('Спонсор - ' || c_var.SPONSOR_NAME || ', финансируемое издательство - ' || c_var.PUBLISH_NAME || ', сумма финансирования - ' || c_var.FINANS_AMOUNT);
        end loop;
    end PRINT_GENEROUS_SPONSOR;
-------------------------------------------------------
    function FIND_GENEROUS_SPONSOR(EXCLUDING_SPR in VARCHAR2) 
        -- возвращаем ссылку на курсор
        return cur
    is
        -- создание курсора
        v_cur cur;
    begin
        open v_cur for select sp.*,
                            pbl.PUBLISH_NAME,
                            trunc(pbl.FINANS_AMOUNT, 3) FINANS_AMOUNT 
                       from SPONSORS sp
                            join PUBLISH pbl on sp.ID = pbl.SPR_ID 
                      where sp.ID = (select SPR_ID
                                       from PUBLISH
                                      where FINANS_AMOUNT = (select max(FINANS_AMOUNT)
                                                               from PUBLISH pb
                                                                    join SPONSORS spr on pb.SPR_ID = spr.ID
                                                              where spr.SPONSOR_NAME <> EXCLUDING_SPR));

        if v_cur%NOTFOUND then
            raise_application_error(-20001, 'При попытке нахождения самого щедрого спонсора возникла ошибка.');        
        end if;

        return(v_cur);
    exception when others then
        raise_application_error(-20001, 'Возникла следующая ошибка со следующим кодом-' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end FIND_GENEROUS_SPONSOR;
end PKG_CHANGE_DATA;