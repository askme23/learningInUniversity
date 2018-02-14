create or replace package D_PKG_MANAGEMENT is 
    procedure init_tables;
    procedure delete_records;
end D_PKG_MANAGEMENT;
/
create sequence inc start with 1;
/
create or replace package body D_PKG_MANAGEMENT is 
    procedure init_tables is 
    begin
        -- add records to D_COMMUNICATION_SERVICES
        insert into D_COMMUNICATION_SERVICES
        values (1, 'Продажа спортивного снаряжения', 'Услуга включает продажу горнолыжного снаряжения, а также предоставление снаряжения в аренду.');
        insert into D_COMMUNICATION_SERVICES
        values (2, 'Создание сайтов и их продвижение', 'Создание сайтов различной сложности, а также их продвижение в интеренет( в том числе привлечение клиентов).');
        insert into D_COMMUNICATION_SERVICES
        values (3, 'Обучение различным видам спорта', null);
        insert into D_COMMUNICATION_SERVICES
        values (4, 'Мойка машин', null);
        insert into D_COMMUNICATION_SERVICES
        values (5, 'Грузоперевозки', 'Осуществление грузоперевозок крупногабаритных грузов');
        insert into D_COMMUNICATION_SERVICES
        values (6, 'Создание мобильных приложений', null);
        insert into D_COMMUNICATION_SERVICES
        values (7, 'Создание полномасштабной баннерной продукции', null);
        
        -- add records to D_PHONE_COMPANY
        insert into D_PHONE_COMPANY
        values (2, 'Web-master', '4015 Tremayne Turnpike', '661');
        insert into D_PHONE_COMPANY
        values (6, 'Start-android', '27909 Edwardo Garden', '314');
        insert into D_PHONE_COMPANY
        values (4, 'Автомойка-express', '78512 Kadin Summit', null);
        insert into D_PHONE_COMPANY
        values (5, 'Деловые линии', '960 Medhurst Squares', '217');
        insert into D_PHONE_COMPANY
        values (2, 'e2', '38069 Jamie Mountain', '99');
        insert into D_PHONE_COMPANY
        values (5, 'Pegas', '59883 Emilio Throughway', null);
        insert into D_PHONE_COMPANY
        values (6, 'e2', '38069 Jamie Mountain', '722');
        insert into D_PHONE_COMPANY
        values (1, 'Прокат Flat', '67957 Percival Glen', '202');
    end init_tables;

    procedure delete_records is 
    begin
        delete from D_COMMUNICATION_SERVICES;
        delete from D_PHONE_COMPANY;
        commit;

        dbms_output.put_line('Таблицы D_COMMUNICATION_SERVICES и D_PHONE_COMPANY очищены.');
    end delete_records;
end D_PKG_MANAGEMENT;