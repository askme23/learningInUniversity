create or replace package PKG_CHANGE_DATA is 
    procedure ADD;
    procedure DEL;
    procedure INCREASE_COST (REST VARCHAR2);
    procedure CREATE_REC_REST (REST in VARCHAR2);
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
    procedure INCREASE_COST(REST VARCHAR2) is
    begin
        update TECH_EQUIP
           set N_COST = N_COST * 0.1 + N_COST
         where REST_ID = (select r.ID
                            from RESTAURANTS r
                           where r.REST_NAME = REST);
        commit;

    exception when others then
        -- при возникновении любой ошибки откатываем транзакцию
        rollback;
    end INCREASE_COST;
-------------------------------------------------------
    procedure CREATE_REC_REST(REST in VARCHAR2) is
        -- создание курсора
        cursor res is
        select r.REST_NAME,
               count(te.EQUIP_NAME) cnt,
               sum(te.N_COST) summ
          from RESTAURANTS r
               join TECH_EQUIP te on r.ID = TE.REST_ID
         where r.REST_NAME = REST
        group by r.REST_NAME;
    
        -- создание записи на основе курсора
        r_rest res%ROWTYPE;
        data_error exception;
        
        -- дополнительная процедура для вывода записи
        procedure print_rest (rest res%ROWTYPE) is
        begin
            dbms_output.put_line('Ресторна - ' || rest.REST_NAME || ' количество оборудования - ' || rest.cnt || ' общая стоимость - ' || rest.summ);
        end print_rest;
    begin
        open res;
            fetch res into r_rest;
            
            if res%NOTFOUND then
                raise data_error;
            end if;
        close res;
        
        print_rest(r_rest);
    exception when data_error then
        dbms_output.put_line('Для данного ресторана ничего не найден. Возможно вы неверное указали название.');
    end CREATE_REC_REST;
end PKG_CHANGE_DATA;