drop table LOG_SERVICE_TABLE;

create table LOG_SERVICE_TABLE(
    S_USER VARCHAR2(50),
    ID NUMBER NOT NULL,
    PID NUMBER,
    SERVICE_TYPE VARCHAR2(50)
);