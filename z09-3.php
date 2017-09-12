<html> 
    <head>
        <meta charset="UTF8">
        <title> 
            Листинг 11-3. Вывод всех записей таблицы 
        </title> 

        <style>
            body {
                font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
                font-size: 15px;
                background-color: rgb(241, 241, 241);
            }
            
        </style>
    </head> 
    <body>
        <?php
            $user = "root"; // здесь GG – номер группы
            $pass = ""; 
            $db = "sample";
            $table = "notebook_br35";
            $conn = mysql_connect("localhost", $user, $pass);

            if (!$conn) {
                die("Нет соединения с MySQL");
            } 
            mysql_select_db($db, $conn) or die ("Нельзя открыть $db: ".mysql_error());
            
            $result = mysql_query("SELECT * FROM $table"); 
            $num_rows = mysql_num_rows($result);
            $num_fields = mysql_num_fields($result);

            echo "<P>В таблице $table содержится $num_rows строк"; 
            echo "<p><table cellpadding=\"5\" border=1>\n"; 

            echo "<tr>\n";
            for ($x=0; $x < $num_fields; $x++) {
                $name = mysql_field_name($result, $x); 
                print "\t<th>$name</th>\n";
                // печатаем имя $x-того столбца
            }

            print "</tr>\n";
            while ($a_row = mysql_fetch_row($result)) {     
                print "<tr>\n";
                foreach ($a_row as $field)  
                print "\t<td>$field</td>\n"; 
                print "</tr>\n";
            }

            print "</table>\n"; 
            mysql_close($conn); 
        ?> 
    </body> 
</html> 
