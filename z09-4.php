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
            
            input[type="submit"] {
                font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
                font-size: 13px;
                background-color: rgb(241, 241, 241);
                margin-top: 10px;
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

            echo "<form action=\"$PHP_SELF\" method=\"POST\">";
            echo "<p><table cellpadding=\"5\" border=1>\n"; 
            echo "<tr>\n";
            
            for ($x=0; $x < $num_fields; $x++) {
                $name = mysql_field_name($result, $x); 
                print "\t<th>$name</th>\n";
                
            }

            print"\t<th>Исправить</th>\n";
            print "</tr>\n";

            while ($a_row = mysql_fetch_row($result)) {     
                print "<tr>\n";
                foreach ($a_row as $field) {
                    print "\t<td>$field</td>\n"; 
                } 
                    
                print "\t<td align='center'><input type=\"radio\" name=\"id\" value=\"$a_row[0]\"></input></td>\n"; 
                print "</tr>\n";
            }

            print "</table>\n"; 
            print "<input type=\"submit\" value=\"Выбрать\"></input>";
            echo "</form>"; 

            //дальше идет блок изменения данных
            if ($_POST['id']) {
                $id = $_POST['id'];
                echo "<form action=\"$PHP_SELF\" method=\"POST\">\n";
                $getFieldForId = mysql_query("SELECT name, city, address, birthday, mail FROM $table WHERE id = $id");

                echo "<select name='field_name'>\n";
                while($a_row = mysql_fetch_row($getFieldForId)) {
                    for($ii = 0; $ii < count($a_row); $ii++) {
                        $name = mysql_field_name($getFieldForId, $ii);
                        echo "\t<option value=\"$name\">$a_row[$ii]</option>\n";
                    }
                    // foreach ($a_row as $field) {
                                                
                    // } 
                }

                echo "</select>\n";
                echo "введите новое значение <input type='text' name='field_value'></input>\n";
                echo "<br>";
                echo "<input type=\"submit\" value=\"Заменить\"></input>";
                echo "<input type=\"text\" name=\"id1\" value=\"$id\" style=\"display: none;\"></input>";
                echo "</form>\n";
            }

            if ($_POST['id1'] && $_POST['field_name']) {
                $fieldName = $_POST['field_name'];
                $fieldValue = $_POST['field_value'];
                $idOfRecord = $_POST['id1'];

                $update = "UPDATE $table SET $fieldName = '$fieldValue' WHERE id = $idOfRecord";
                if (!mysql_query($update, $conn)) { 
                    $dberror = mysql_error();
                    return false;
                }

                echo "<a style=\"text-decoration: none;\" href=\"z09-3.php\">Показать содержимое таблицы</a>";
            }

            mysql_close($conn);
        ?> 
    </body> 
</html> 
