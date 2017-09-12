<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>08-2</title>
    <style>
        body {
            font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
            font-size: 14px;
            background-color: rgb(241, 241, 241);
        }

        p {
            display: inline-block;
            margin-right: 20px;
        }

        form {
            background-color: #fff;
            box-shadow: 1px 1px 5px #333;
            padding: 10px;
            width: 300px;
        }

        form input[type="submit"] {
            background-color: #fff;
            padding: 3px;
            margin-top: 15px;
        }

        table {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <?php
        $align = $_GET['align'];
        $valign = $_GET['valign'];
        $size = 100;

        echo "<table width=\"$size\" height=\"$size\" border=\"1\">\n";
        echo "<tr>\n";
        echo "\t<td valign=\"$valign\" align=\"$align\" >Текст</td>\n";
        echo "</tr>\n";
        echo "</table>";
    ?>

    <form action="z08-2.php" method="GET">
        <p>Выберите горизонтальное расположение</p>
        <div>
            <input type="checkbox" name="align" value="left" checked>Слева</input><br>             
            <input type="checkbox" name="align" value="center">По центру</input><br>            
            <input type="checkbox" name="align" value="right">Справа</input>    
        </div>
        
        <p>Выберите горизонтальное расположение</p>
        <div>
            <input type="radio" name="valign" value="top" checked>Сверху</input><br>              
            <input type="radio" name="valign" value="middle">Посередине</input><br>              
            <input type="radio" name="valign" value="bottom">Внизу</input>
        </div>

        <input type="submit" value="Выполнить"></input>
    </form>
</body>
</html>