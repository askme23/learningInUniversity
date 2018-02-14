CREATE OR REPLACE FUNCTION show_bool
(
    p_Bool IN BOOLEAN DEFAULT NULL
) RETURN VARCHAR2 IS
    str VARCHAR2(10);
BEGIN
    IF (p_Bool is null) THEN
        str := 'NULL';
    ELSIF (p_Bool) THEN
        str := 'TRUE';
    ELSE
        str := 'FALSE';
    END IF;
    
    RETURN(str);
EXCEPTION when others then
    str := 'FALSE';
    return(str);
END;
/

BEGIN
    DBMS_OUTPUT.put_line(show_bool());
    DBMS_OUTPUT.put_line(show_bool(false));
END;