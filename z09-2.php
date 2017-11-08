<html> 
    <head>
        <meta charset="UTF-8">
        <title> Листинг 11-2. Добавление в базу данных 
                информации, введенной пользователем
        </title> 
        <style>
            body {
                font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
                font-size: 15px;
                background-color: rgb(241, 241, 241);
            }
    
            form {
                background-color: #fff;
                box-shadow: 1px 1px 5px #333;
                padding: 10px;
                width: 550px;
            }

            form input {
                margin-bottom: 5px;
            }

            form p {
                font-size: 20px;
            }

        </style> 
    </head> 
    <body> 
        <form action="<?php $PHP_SELF ?>" method="post">
            <p>Записная книжка</p>
            
            <label>Введите фамилию и имя<span style="color: red;">*</span>:
                <input type="text" name="name" required></input>
            </label><br>
            
            <label>Введите город:
                <input type="text" name="city"></input>
            </label><br>

            <label>Введите адрес:
                <input type="text" name="address"></input>
            </label><br>
            
            <label >Введите дату рождения в формате YYYY-MM-DD:
                <input type="date" name="date"></input>
            </label><br>
            
            <label>Введите email<span style="color: red;">*</span>:
                <input type="email" name="mail" required></input>
            </label><br>
            
            <input type="submit" value="Записать"></input>
        </form>      
        
        <?php 
            function Add_to_database($arrayOfVar, &$dberror) {  
                $user = "root";  // здесь GG – номер группы
                $pass = ""; 
                $db = "sample"; 
                $table = "notebook_br35";
                $conn = mysql_connect("localhost", $user, $pass);
                
                $name = $arrayOfVar['name'];
                $city = $arrayOfVar['city'];
                $address = $arrayOfVar['address'];
                $birthday = $arrayOfVar['date'];
                $mail = $arrayOfVar['mail'];

                if (!$conn ) { 
                    $dberror = "Нет соединения с MySQL сервером";
                    return false; 
                }

                if (! mysql_select_db($db, $conn)) { 
                    $dberror = mysql_error();
                    return false;
                }

                $query = "INSERT INTO $table (name, city, address, birthday, mail)
                          VALUES('$name', '$city', '$address', '$birthday', '$mail')"; 
                
                if (!mysql_query($query, $conn)) { 
                    $dberror = mysql_error();
                    return false;
                }
                
                return true;
            }
 
            if (isset($_POST['name']) && isset($_POST['mail'])) {  
                $dberror = "";
                $ret = Add_to_database($_POST, $dberror); 

                if (!$ret) {
                    print "Ошибка: $dberror<br>";
                } else {
                    print "Запись добавлена";
                }
            } 
        ?> 
    </body> 
</html>
