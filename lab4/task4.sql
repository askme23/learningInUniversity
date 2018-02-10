drop table test_transaction;
create table test_transaction (
    n_id NUMBER,
    s_description VARCHAR2(30)
);

insert into test_transaction
values (1, 'First record');
insert into test_transaction
values (2, 'Second record');
commit;

delete test_transaction
where n_id = 2;
rollback;