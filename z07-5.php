<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №5</title>
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
        $cuse = array(
            'cnum' => 2001,
            'cname' => "Hoffman",
            'city' => "London",
            'snum' => 1001,
            'rating' => 100
        );

        foreach ($cuse as $key=>$val) {  
            echo "$key: $val<br>";
        }
        echo "<br>";

        asort($cuse);
        foreach ($cuse as $key=>$val) {  
            echo "$key: $val<br>";
        }
        echo"<br>";

        ksort($cuse);
        foreach ($cuse as $key=>$val) {  
            echo "$key: $val<br>";
        }
        echo "<br>";

        sort($cuse);
        foreach ($cuse as $key=>$val) {  
            echo "$key: $val<br>";
        }
    ?>
</body>
</html>