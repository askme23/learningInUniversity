<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> 
            Листинг 10-9. Посылка заголовка с помощью
            функции header() 
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
                width: 300px;
            }
        
        </style> 
    </head> 
    <body>
        <form action="z08-5b.php" method="GET">
            <select name="site">
                <option value="" selected>Поисковые системы</option>
                
                <?php
                    $list_sites = array('yandex.ru', 'google.com', 'rabmler.ru', 'yahoo.com', 'bing.com', 'mail.ru');
                    $i = 0;

                    while($i < count($list_sites)) {
                        echo "\t<option value=\"$list_sites[$i]\">$list_sites[$i]</option>\n";
                        $i++;
                    }
                ?>
            </select>
            <input type="submit" value="Перейти">
        </form>
    </body>
</html>