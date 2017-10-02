<?php
    global $tableName;
    
    $field = $_GET['field'];
    $sql = "select $field from $tableName";
    $tab_res = mysql_query($sql);

    if ($field) {
        echo "<h4>Поле $field таблицы $tableName</h4>";    
        echo "<p><table cellpadding=\"5\" border=1>\n";
        echo "<tr>\n";
        echo "\t<th>$field</th>\n";
        echo "</tr>\n"; 

        while ($tab_field = mysql_fetch_row($tab_res)) {    
            echo "<tr>\n";
                echo "\t<td>" . $tab_field[0] . "</td>\n"; 
            echo "</tr>\n";
        }

        echo "</table>\n";  
    }
?>