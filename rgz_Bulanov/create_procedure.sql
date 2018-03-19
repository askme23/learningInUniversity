create or replace procedure DEL_CASH_MACHINE (DEL_ID NUMBER) is
begin
    PKG_CHANGE_DATA.DEL_CASH_MACHINE(DEL_ID);
end;