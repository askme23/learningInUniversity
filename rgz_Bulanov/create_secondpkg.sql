create or replace package PKG_CHANGE_DATA is 
    procedure ADD;
    procedure DEL;
    procedure DEL_CASH_MACHINE (DEL_ID NUMBER);
    procedure PRINT_CNT_MCASH (BNAME VARCHAR2);
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

    procedure DEL_CASH_MACHINE(DEL_ID NUMBER) is
    begin
        delete 
          from CASH_MACHINE cm
         where cm.ID = DEL_ID;
        commit;

    exception when OTHERS then
        raise_application_error(-20001, 'Возникла следующая ошибка -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end DEL_CASH_MACHINE;

    procedure PRINT_CNT_MCASH(BNAME VARCHAR2) is 
        cursor cnt_bank is
        select b.BANK_NAME,
               count(cm.SERIAL_KEY) cnt
          from BANKS b
               join CASH_MACHINE cm on b.ID = cm.PID
         where b.BANK_NAME != BNAME
       group by b.BANK_NAME;

       type arr_bank is table of cnt_bank%ROWTYPE index by VARCHAR2(50);
       bank_count arr_bank;
       c_city VARCHAR2(50);
    begin
        -- заносим данные в ассоциативный массив
        for v in cnt_bank loop
            bank_count(v.BANK_NAME).cnt := v.cnt;
        end loop;

        -- выводим ассоциативный массив
        c_city := bank_count.FIRST;
        
        loop
            dbms_output.put_line('Банк ' || c_city || ', ' ||  'количество банкоматов - ' || bank_count(c_city).cnt);
            exit when c_city = bank_count.LAST;
            c_city := bank_count.NEXT(c_city);
        end loop;        

    exception 
        when VALUE_ERROR then
            dbms_output.put_line('Неправильное преобразование типов.');
        when NO_DATA_FOUND then
            dbms_output.put_line('Отсутствуют данные в таблице BANK.');
        when OTHERS then
            raise_application_error(-20001, 'Возникла следующая ошибка -' || SQLCODE || ' Текст ошибки - ' || SQLERRM);
    end PRINT_CNT_MCASH;
end PKG_CHANGE_DATA;