<?php
    function vid_structure() {
        global $db, $conn, $structTable;
        $sql = "SHOW TABLES FROM $db";
        $tab_res = mysql_query($sql); 

        while ($tab_rows = mysql_fetch_row($tab_res)) {
            for($i = 0; $i < count($structTable); $i++) {

                if ($tab_rows[0] == $structTable[$i]) {
                    echo "<h4>Структура таблицы $structTable[$i]</h4>";
                    echo "<dl><dd>\n"; 

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
                    } 
                   
                    print "</dl>\n";
                } else {
                    continue;
                }
            }
            print "</dl>\n";
        }
        
    }

    function vid_content() {
        global $db, $conn, $contentTable;
        $sql = "SHOW TABLES FROM $db";
        $tab_res = mysql_query($sql); 
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

        while ($tab_rows = mysql_fetch_row($tab_res)) {
            for ($i = 0; $i < count($contentTable); $i++) {
                if ($tab_rows[0] == $contentTable[$i]) {
                    $query_res = mysql_query("SELECT * from $tab_rows[0]"); 
                    $num_rows = mysql_num_rows($query_res);
                    $num_fields = mysql_num_fields($query_res);

                    echo "<h4>Содержимое таблицы $contentTable[$i]</h4>";
                    echo "<p><table cellpadding=\"5\" border=1>\n"; 
                    echo "<tr>\n";
                    for ($x = 0; $x < $num_fields; $x++) {
                        $name = mysql_field_name($query_res, $x); 
                        echo "\t<th>$name<br>$rus_name[$name]</th>\n";
                    }

                    echo "</tr>\n";
                    while ($a_row = mysql_fetch_row($query_res)) {     
                        echo "<tr>\n";
                        foreach ($a_row as $field)  
                        echo "\t<td>$field</td>\n"; 
                        echo "</tr>\n";
                    }

                    echo "</table>\n";
                } else {
                    continue;
                }
            }
        }
    }

    if(count($structTable)) {
        vid_structure();
    }

    if(count($contentTable)) {
        vid_content();
    }

    echo "<a href=\"z10-1.html\">Возврат к выбору таблицы</a>";
