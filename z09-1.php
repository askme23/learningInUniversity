<?php
    $mysql_user = 'root';
    $mysql_password = '';
    $conn = mysql_connect('localhost', $mysql_user, $mysql_password);
    $dbName = 'sample';
    $tableName = 'notebook_br35';

    if(!$conn) {
        die("Нет соединения с MySQL");
    } else {
        mysql_select_db($dbName, $conn) or die ("Нельзя открыть $dbName: ".mysql_error());
        $queryForDrop = "DROP TABLE IF EXISTS $tableName";
        $queryForCreate = 
            "CREATE TABLE $tableName (
                id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
                name VARCHAR(50),
                city VARCHAR(50),
                address VARCHAR(50),
                birthday DATE,
                mail VARCHAR(20)
            )";
    
        mysql_query($queryForDrop, $conn) or die ("В базе данных такой таблицы $tableName не было: " . mysql_error());
        mysql_query($queryForCreate, $conn) or die ("Нельзя создать таблицу $tableName: " .mysql_error());

        
    }
?>