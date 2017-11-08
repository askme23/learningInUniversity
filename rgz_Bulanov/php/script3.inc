<?php
    global $tableName;
    
    $field = $_GET['field'];

    echo "<div class=\"background-block\">";
    if ($field && $field != '1') {
        $sql = "select $field from $tableName";
        $tab_res = mysql_query($sql);
        echo "<h4>Поле $field таблицы $tableName</h4>";    
        echo "<table cellpadding=\"5\" border=1>\n";
        echo "<tr>\n";
        echo "\t<th>$field</th>\n";
        echo "</tr>\n"; 

        while ($tab_field = mysql_fetch_row($tab_res)) {    
            echo "<tr>\n";
                echo "\t<td>" . $tab_field[0] . "</td>\n"; 
            echo "</tr>\n";
        }

        echo "</table>\n";  
    } else if ($field == '1'){
        $result = mysql_query("SELECT * FROM $tableName"); 
        $num_rows = mysql_num_rows($result);
        $num_fields = mysql_num_fields($result);

        echo "<h4>Таблица $tableName</h4>";    
        echo "<table cellpadding=\"5\" border=1>\n"; 

        echo "<tr>\n";
        for ($x = 0; $x < $num_fields; $x++) {
            $name = mysql_field_name($result, $x); 
            print "\t<th>$name</th>\n";
        }

        print "</tr>\n";
        while ($a_row = mysql_fetch_row($result)) {     
            print "<tr>\n";
            foreach ($a_row as $field)  
            print "\t<td>$field</td>\n"; 
            print "</tr>\n";
        }

        print "</table>\n"; 
    }
    echo "</div>";
?>