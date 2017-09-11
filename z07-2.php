<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №1</title>
    <style>
        body {
            font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
            font-size: 12px;
            background-color: rgb(241, 241, 241);
        }
    </style>
</head>
<body>
    <?php
        define('AMOUNT', 30);
        $treug = [];
        $kvd = [];

        for($i = 1; $i <= AMOUNT; $i++) {
               array_push($treug, $i * ($i + 1) / 2);
               array_push($kvd, $i * $i); 
        }

        echo "<table cellpadding=\"3\"cellspacing=\"2\" border=\"1\">\n";
        for($i = 1; $i <= AMOUNT; $i++) {
            echo "<tr>\n";

            for($j = 1; $j <= AMOUNT; $j++) {
                $flag = 0;
                
                foreach($treug as $val) {
                    if ($val == $i * $j) {
                        $flag = 1;
                    }
                }

                foreach($kvd as $val) {
                    if ($val == $i * $j && $flag == 0) {
                        $flag = 2;
                    } else if($val == $i * $j && $flag == 1) {
                        $flag = 3;
                    }
                }

                switch ($flag) {
                    case 1:
                        echo "\t<td style=\"background-color: green;\">" . ($i * $j) . "</td> \n";
                        break;
                    case 2:
                        echo "\t<td style=\"background-color: blue;\">" . ($i * $j) . "</td> \n";
                        break;
                    case 3:
                        echo "\t<td style=\"background-color: red;\">" . ($i * $j) . "</td> \n";
                        break; 
                    default: 
                        echo "\t<td>" . ($i * $j) . "</td> \n";
                        break;
                }
                
            }

            echo "</tr>\n";
        }
        echo '</table>';

        for($i = 0; $i < count($treug); $i++) {
            echo "$treug[$i] ";
        }
        
    ?>
</body>
</html>