<?php
    global $tableName;

    $sql = "select * from $tableName";
    $query = mysql_query($sql);
    $numFields = mysql_num_fields($query);
    $arrayOfField = [];

    echo "<form class=\"main-form\" action=\"$PHP_SELF\" method=\"GET\">";
    echo "<select class=\"main-select\" name=\"field\" size=\"1\">";
    echo "<option selected>Вывести всю таблицу</option>";

    for($i = 0; $i < $numFields; $i++) {
        $arrayOfRows[$i] = mysql_field_name($query, $i);
        echo "<option value=\"" . mysql_field_name($query, $i) . "\">" . mysql_field_name($query, $i) . "</option>"; 
    }

    echo "</select>";
    echo "<br>";
    echo "<input type=\"submit\" class=\"main-submit\" value=\"Вывести\">";
    echo "</form>"; 
?>