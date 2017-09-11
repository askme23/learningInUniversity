<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №1</title>
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
        $color = 'cyan';
        $i = $j = 1;

        echo "<table cellpadding=\"5\"cellspacing=\"3\" border=\"1\">\n";
        while ($i <= AMOUNT) {
            echo "<tr>\n";

            $j = 1;
            while ($j <= AMOUNT) {
                if($i == $j) {
                    echo "\t<td style=\"background-color:$color;\">" . $i*$j . "</td>\n";
                } else {
                    echo "\t<td>" . $i*$j . "</td> \n";
                }

                $j++;
            }

            echo "</tr>\n";
            $i++;
        }

        echo '</table>';
        
    ?>
</body>
</html>