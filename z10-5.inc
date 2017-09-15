<?php
    function vid_structure() {
        global $db, $conn, $structTable;

        $tab_res = mysql_list_tables($db, $conn);
        echo "<h4>Структура таблицы $structTable</h4>";
        print "<dl><dd>\n"; 

        while ($tab_rows = mysql_fetch_row($tab_res)) { 

            if ($tab_rows[0] == $structTable) {
                print "<b>$tab_rows[0]</b>\n";

                $query_res = mysql_query("SELECT * from $tab_rows[0]"); 
                $num_fields = mysql_num_fields($query_res); 
                print "<dl><dd>\n";

                for ($x = 0; $x < $num_fields; $x++) {  
                    print "<i>";
                    print mysql_field_type($query_res, $x);
                    // тип поля
                    print "</i> <i>";
                    print mysql_field_len($query_res, $x);
                    // max-ая длина поля
                    print "</i> <b>";
                    print mysql_field_name($query_res, $x);
                    // имя поля
                    print "</b> <i>";
                    print mysql_field_flags($query_res, $x);
                    // флаги поля (not null и т.п.)
                    print "</i><br>\n";
                }  #2
                    
                print "</dl>\n";
            }
            
        } 

        print "</dl>\n";
    }

    function vid_content() {
        global $db, $conn, $contentTable;
        
        $result = mysql_query("SELECT * FROM $contentTable"); 
        $num_rows = mysql_num_rows($result);
        $num_fields = mysql_num_fields($result);

        $rus_name = array('cnum' => 'Номер покупателя', 
                          'cname' => 'Имя покупателя',
                          'city' => 'Город',
                          'rating' => 'Рейтинг покупателя',
                          'snum' => 'Номер продавца',
                          'sname' => 'Имя продавца',
                          'comm' => 'Коммисионные продавца',
                          'onum' => 'Номер заказа',
                          'amt' => 'Сумма заказа',
                          'odate' => 'Дата заказа',
                         );

        echo "<h4>Содержимое таблицы $contentTable</h4>";
        echo "<p><table cellpadding=\"5\" border=1>\n"; 
        echo "<tr>\n";
        for ($x = 0; $x < $num_fields; $x++) {
            $name = mysql_field_name($result, $x); 
            echo "\t<th>$name<br>$rus_name[$name]</th>\n";
        }

        echo "</tr>\n";
        while ($a_row = mysql_fetch_row($result)) {     
            echo "<tr>\n";
            foreach ($a_row as $field)  
            echo "\t<td>$field</td>\n"; 
            echo "</tr>\n";
        }

        echo "</table>\n";

    }

    if($structTable) {
        vid_structure();
    }

    if($contentTable) {
        vid_content();
    }

    echo "<a href=\"z10-1.html\">Возврат к выбору таблицы</a>";
?>