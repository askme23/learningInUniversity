create or replace procedure DEL_SERVICE (SERV_TYPE VARCHAR2) is
begin
    PKG_CHANGE_DATA.DEL_SERVICE(SERV_TYPE);
end;