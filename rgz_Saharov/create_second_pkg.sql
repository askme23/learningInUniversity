create or replace package PKG_CHANGE_DATA is
    procedure ADD;
    procedure DEL;
    procedure CREATE_NEW_EXPOSITION (NEW_EXPOSITION_NAME VARCHAR2);
    
    function RETURN_EXPOSITION (POS VARCHAR2) RETURN TRADE_EXPOSITIONS.TRADE_EXPOSITIONS_NAME%type;
    procedure PRINT_EXPOSITION (EXP TRADE_EXPOSITIONS.TRADE_EXPOSITIONS_NAME%type);
end PKG_CHANGE_DATA;
/
create or replace package body PKG_CHANGE_DATA is
    procedure ADD 
    is
    begin
        PKG_CHANGE_TABLES.ADD();
    end ADD;
    
    procedure DEL is
    begin
        PKG_CHANGE_TABLES.DEL();
    end DEL;
-----------------------------------------------------
    procedure CREATE_NEW_EXPOSITION (NEW_EXPOSITION_NAME VARCHAR2) 
    is
        n_min TRADE_HOUSES.ID%type;
        n_max TRADE_HOUSES.ID%type;
    begin
        select min(id),
               max(id)
          into n_min,
               n_max
          from TRADE_HOUSES;
          
        insert into TRADE_EXPOSITIONS (ID, HOUSE_ID, TRADE_EXPOSITIONS_NAME, D_DATE)
        values (GEN_ID_EXP.NEXTVAL, trunc(dbms_random.value(n_min, n_max)), NEW_EXPOSITION_NAME || '', to_date(sysdate + dbms_random.value(1, 120)) || '' );
        commit;

    exception when others then
        -- при возникновении любой ошибки откатываем транзакцию
        rollback;
        raise_application_error(-20001, 'Возникла следующая ошибка со следующим кодом -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end CREATE_NEW_EXPOSITION;
----------------------------------------------------------------------------
    procedure PRINT_EXPOSITION (EXP TRADE_EXPOSITIONS.TRADE_EXPOSITIONS_NAME%type) 
    is
    begin
        dbms_output.put_line('Название выставки - ' || EXP);
    end PRINT_EXPOSITION;
-------------------------------------------------------
    function RETURN_EXPOSITION (POS in VARCHAR2) 
        -- возвращаем ссылку на курсор
        return TRADE_EXPOSITIONS.TRADE_EXPOSITIONS_NAME%type
    is
        -- подается строка исключительна на английском языке. То есть либо first, либо last. Регистр неважен
        S_QUERY VARCHAR2(400);
        EXP TRADE_EXPOSITIONS.TRADE_EXPOSITIONS_NAME%type;
        query_error exception;
    begin
        S_QUERY := 'select *
                      from (select TRADE_EXPOSITIONS_NAME
                              from TRADE_EXPOSITIONS ';
                           
        if upper(POS) = 'FIRST' then
            S_QUERY := S_QUERY || 'order by TRADE_EXPOSITIONS_NAME)
                                   where rownum = 1';
        elsif upper(POS) = 'LAST' then
            S_QUERY := S_QUERY || 'order by TRADE_EXPOSITIONS_NAME desc)
                                   where rownum = 1';
        else
            raise query_error;
        end if;
        dbms_output.put_line(S_QUERY);
        
        execute immediate S_QUERY into EXP;
        return(EXP);      
    exception when query_error then
        dbms_output.put_line('Неправильно введен признак, попробуйте снова.');
    end RETURN_EXPOSITION;
end PKG_CHANGE_DATA;