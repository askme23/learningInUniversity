create or replace package PKG_CHANGE_DATA is
    cursor cur;
    
    procedure ADD;
    procedure DEL;
    procedure CHANGE_PUBLISH_NAME (RECORD_ID NUMBER, NEW_PUBLISH_NAME VARCHAR2);
    function FIND_GENEROUS_SPONSOR (EXCLUDING_SPR VARCHAR2) RETURN cur%rowtype;
    procedure PRINT_GENEROUS_SPONSOR (SPR in cur%rowtype) ;
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
    end CHANGE_PUBLISH_NAME;
----------------------------------------------------------------------------
    procedure PRINT_GENEROUS_SPONSOR(SPR in cur%rowtype) is
    begin
        dbms_output.put_line('Самый щедрый спонсор - ' || SPR.SPONSOR_NAME);
    end PRINT_GENEROUS_SPONSOR;
-------------------------------------------------------
    procedure FIND_GENEROUS_SPONSOR(EXCLUDING_SPR in VARCHAR2) 
    is
        -- создание курсора
        cursor cur is 
        select sp.*,
           pbl.PUBLISH_NAME,
           pbl.FINANS_AMOUNT
          from SPONSORS sp
               join PUBLISH pbl on sp.ID = pbl.SPR_ID 
         where sp.ID = (select SPR_ID
                          from PUBLISH
                         where FINANS_AMOUNT = (select max(FINANS_AMOUNT)
                                                  from PUBLISH))
           and sp.SPONSOR_NAME <> EXCLUDING_SPR;
    
        -- создание записи на основе курсора
        r_spr cur%ROWTYPE;
    begin
        open cur;
            fetch cur into r_spr;
            if cur%ROWCOUNT = 1 and r_spr is not null then
                dbms_output.put_line('Самый щедрый спонсор найден.');
            else 
                raise_application_error(00666, 'При попытке нахождения самого щедрого спонсора возникла ошибка.');
            end if;
        close cur;
        
        return(r_spr);
    end FIND_GENEROUS_SPONSOR;
end PKG_CHANGE_DATA;