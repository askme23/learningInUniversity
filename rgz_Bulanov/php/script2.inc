<?php
    global $tableName;

    $sql = "select * from $tableName";
    $query = mysql_query($sql);
    $numFields = mysql_num_fields($query);
    $arrayOfField = [];

    echo "<form class=\"main-form\" action=\"$PHP_SELF\" method=\"GET\">";
    echo "<input type=\"radio\" name=\"field\" class=\"radio\" value=\"1\" checked>Вывести всю таблицу</input>";
    echo "<br>";

    for($i = 0; $i < $numFields; $i++) {
        $arrayOfRows[$i] = mysql_field_name($query, $i);
        echo "<input type=\"radio\" name=\"field\" class=\"radio\" value=\"" . mysql_field_name($query, $i) . "\">" . mysql_field_name($query, $i) . "</input>";
        echo "<br>"; 
    }

    echo "<input type=\"submit\" class=\"main-submit\" value=\"Вывести\">";
    echo "</form>"; 
?>