<?php
    $user = "root"; 
    $pass = ""; 
    $tableName = "p4303";
    $db = "sample";

    $conn = mysql_connect("localhost", $user, $pass);
    if (!$conn) {
        die("Нет соединения с MySQL");
    } else {
        mysql_select_db($db, $conn) or die ("Нельзя открыть $db: ".mysql_error());

        $showTable = "SHOW TABLES FROM $db WHERE tables_in_$db = $tableName";
        $createTable = "CREATE TABLE p4303 (
                                                N INTEGER NOT NULL PRIMARY KEY,
                                                district VARCHAR(25),
                                                region VARCHAR(25),
                                                capital VARCHAR(25)
                                            )";

        if (!mysql_query($createTable, $conn)) {
            $drop_table = "DROP TABLE IF EXISTS $tableName";
            mysql_query($drop_table, $conn) or die ("В базе данных такой таблицы $tableName не было: " . mysql_error());
            mysql_query($createTable, $conn);
        } else {
            mysql_query($createTable, $conn);
        }

        $addDataToTable = "INSERT INTO p4303 (N, district, region, capital)
                           VALUES (1, 'Север', 'Новосибирскй', 'Новосибирск'),
                                  (2, 'Север', 'Красноярский', 'Красноярск'),
                                  (3, 'Север', 'Иркутский', 'Иркутск'),

                                  (4, 'Юг', 'Краснодарский', 'Краснодар'),
                                  (5, 'Юг', 'Волгоградский', 'Волгоград'),
                                  (6, 'Юг', 'Астраханский', 'Астрахань'),

                                  (7, 'Запад', 'Московский', 'Москва'),
                                  (8, 'Запад', 'Псковский', 'Псков'),
                                  (9, 'Запад', 'Ивановский', 'Иваново'),

                                  (10, 'Восток', 'Владивостокский', 'Владивосток'),
                                  (11, 'Восток', 'Мурманский', 'Мурманск'),
                                  (12, 'Восток', 'Хабаровский', 'Хабаровск')";
        mysql_query($addDataToTable, $conn);
    }
?>