<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №1</title>
    <style>
        body {
            font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
            font-size: 14px;
            background-color: rgb(241, 241, 241);
        }

        table {
            float: left;
            margin-right: 50px;
        }

        
    </style>
</head>
<body>
    <?php
        define('AMOUNT', 30);
        $color = array('whie', 'aqua', 'blue', 'yellow', 'purple', 'red', 'lime');

        
        for($k = 4; $k <= 7; $k++) {
            echo "<table  cellpadding=\"5\" border=\"1\">\n";
            echo "<caption>k = $k</caption>\n";

            for($i = 1; $i <= AMOUNT; $i++) {
                echo "<tr>\n";
    
                for($j = 1; $j <= AMOUNT; $j++) {
                    switch ($i * $j % $k) {
                        case 0:
                            echo "\t<td>" . '' . "</td> \n"; 
                            break;
                        case 1:
                            echo "\t<td style=\"background-color: aqua;\">" . '' . "</td> \n"; 
                            break;
                        case 2:
                            echo "\t<td style=\"background-color: blue;\">" . '' . "</td> \n"; 
                            break;
                        case 3:
                            echo "\t<td style=\"background-color: yellow;\">" . '' . "</td> \n"; 
                            break;
                        case 4:
                            echo "\t<td style=\"background-color: purple;\">" . '' . "</td> \n"; 
                            break;
                        case 5:
                            echo "\t<td style=\"background-color: red;\">" . '' . "</td> \n"; 
                            break;
                        case 6:
                            echo "\t<td style=\"background-color: lime;\">" . '' . "</td> \n"; 
                            break;
                    }
                    
                }
    
                echo "</tr>\n";
            }
            echo '</table>';
        }  
    ?>
</body>
</html>