create or replace package PKG_CHANGE_DATA is 
    procedure ADD ();
    procedure DEL ();
    procedure DEL_CASH_MACHINE (ID NUMBER);
    procedure PRINT_CNT_MCASH (BANK_NAME VARCHAR2);
end PKG_CHANGE_TABLES;

/

create or replace package body PKG_CHANGE_DATA is
begin
    procedure ADD is
    begin
        PKG_CHANGE_TABLES.ADD();
    end;

    procedure DEL is
    begin
        PKG_CHANGE_TABLES.DEL();
    end;

    procedure DEL_CASH_MACHINE(ID NUMBER) is
    begin
        delete 
          from CASH_MACHINE cm
         where cm.ID = ID;
        commit;
    
    exception when others then
        rollback;
    end;

    procedure PRINT_CNT_MCASHE(BANK_NAME VARCHAR2) is 
        cursor cnt_bank is
        select b.BANK_NAME,
               count(cm.*) cnt
          from BANK b
               join CASH_MACHINE ch on b.ID = ch.PID
         where b.BANK_NAME != BANK_NAME
       group by b.BANK_NAME;

       type arr_bank is table of NUMBER index by VARCHAR2(50);
       bank_count arr_bank;
       c_city VARCHAR2(50);
    begin
        -- заносим данные в ассоци
        for v in cnt_bank loop
            bank_count(v.BANK_NAME) := v.cnt;
        end loop;

        -- выводим ассоциативный массив
        c_city := bank_count.FIRST();

        loop;
            dbms_output.put_line('Город ' || c_city || ', ' ||  'количество банкоматов - ' || bank_count(c_city));
            exit when c_city = bank_count.LAST();
            c_city := bank_count.NEXT(c_city);
        end loop;        
        
    exception when NO_DATA_FOUND then
        dbms_output.put_line('Отсутствуют данные в таблице BANK.');
    end;
end;