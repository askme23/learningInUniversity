<?php
    $user = "root"; 
    $pass = ""; 
    $tableName = "p4307";
    $db = "sample";

    $conn = mysql_connect("localhost", $user, $pass);
    if (!$conn) {
        die("Нет соединения с MySQL");
    } else {
        mysql_select_db($db, $conn) or die ("Нельзя открыть $db: ".mysql_error());

        $showTable = "SHOW TABLES FROM $db WHERE tables_in_$db = $tableName";
        $createTable = "CREATE TABLE $tableName ( 
                            N INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
                            COMMAND  VARCHAR(40),
                            COMMAND_TYPE VARCHAR(15)
                        )";

        if (!mysql_query($createTable, $conn)) {
            $drop_table = "DROP TABLE $tableName";
            mysql_query($drop_table, $conn) or die ("В базе данных такой таблицы $tableName не было: " . mysql_error());
            mysql_query($createTable, $conn);
        } else {
            mysql_query($createTable, $conn);
        }

        $addDataToTable = "INSERT INTO p4307 (COMMAND, COMMAND_TYPE)
                           VALUES ('ALTER SESSION', 'Управление'),
                                  ('ALTER SESSION', 'Управление'),
                                  ('COMMIT', 'Управление'),
                                  ('ROLLBACK', 'Управление'),
                                  ('DELETE', 'DML'),
                                  ('INSERT', 'DML'),
                                  ('SELECT', 'DML'),
                                  ('UPDATE', 'DML'),
                                  ('ALTER ROLE', 'DDL'),
                                  ('ALTER VIEW', 'DDL'),
                                  ('CREATE ROLE', 'DDL'),
                                  ('CREATE TABLE', 'DDL'),
                                  ('DROP', 'DDL'),
                                  ('GRANT', 'DDL'),
                                  ('REVOK', 'DDL'),
                                  ('TRUNCATE', 'DDL')";
        mysql_query($addDataToTable, $conn);
    }
?>