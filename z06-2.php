<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №2</title>
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
        define("AMOUNT", 10);
        $red = 'red';
        $blue = 'blue';

        echo "<table cellpadding=\"5\"cellspacing=\"1\" border=\"1\">\n";
        for($i = 1; $i <= AMOUNT; $i++) {
            echo "<tr>\n";

            for($j = 1; $j <= AMOUNT; $j++) {
                if($i == 1 && $j == 1) {
                    echo "\t<td style=\"color:$red;\">+</td>\n";
                } else if($j == 1){
                    echo "\t<td style=\"color:$blue;\">" . $i . "</td>\n";
                } else if($i == 1) {
                    echo "\t<td style=\"color:$blue;\">" . $j . "</td>\n";
                } else {
                    echo "\t<td>" . ($i+$j) . "</td> \n";
                }
            }

            echo "</tr>\n";
        }

        echo '</table>';
        
    ?>
</body>
</html>