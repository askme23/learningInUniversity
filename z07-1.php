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
        $treug = [];
        $kvd = [];
       
        echo "Task 1 : ";
        function printArray($array) {
            foreach($array as $val) {
                echo "<span>$val</span> "; 
            } 
            echo "<br>";
        }

        for($i = 0; $i < 10; $i++) {
               $n = $i + 1;
            $treug[$i] = $n * ($n + 1) / 2;
        }

        for($i = 0; $i < count($treug); $i++) {
            echo "$treug[$i]<pre style=\"display: inline-block;\">  </pre>";
        }
        echo "<br>";

        for($i = 1; $i <= 10; $i++) {
             array_push($kvd, $i * $i);        
        }
        echo "Task 2 : ";
        printArray($kvd);

        echo "Task 3 : ";
        $rez = array_merge($treug, $kvd);
        printArray($rez);

        echo "Task 4 : ";
        sort($rez);
        printArray($rez);

        echo "Task 5 : ";
        array_shift($rez);
        printArray($rez);

        echo "Task 6 : ";
        $rez1 = array_unique($rez);
        printArray($rez1);
    ?>
</body>
</html>