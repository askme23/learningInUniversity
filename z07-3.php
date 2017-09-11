<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №3</title>
    <style>
        body {
            font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
            font-size: 12px;
            background-color: rgb(241, 241, 241);
        }

        table td {
            width: 14px;
            height: 15px;
        }
    </style>
</head>
<body>
    <?php
        define('AMOUNT', 30);

        echo "<table cellpadding=\"3\" border=\"1\">\n";
        for($i = 1; $i <= AMOUNT; $i++) {
            echo "<tr>\n";

            for($j = 1; $j <= AMOUNT; $j++) {
                switch ($i * $j % 7) {
                    case 0:
                        echo "\t<td>" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                    case 1:
                        echo "\t<td style=\"background-color: aqua;\">" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                    case 2:
                        echo "\t<td style=\"background-color: blue;\">" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                    case 3:
                        echo "\t<td style=\"background-color: yellow;\">" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                    case 4:
                        echo "\t<td style=\"background-color: purple;\">" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                    case 5:
                        echo "\t<td style=\"background-color: red;\">" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                    case 6:
                        echo "\t<td style=\"background-color: lime;\">" . '&nbsp;&nbsp;' . "</td> \n"; 
                        break;
                }
                
            }

            echo "</tr>\n";
        }
        echo '</table>';  
    ?>
</body>
</html>