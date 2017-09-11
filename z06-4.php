<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №4</title>
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
        $size = 7;
        $arrayOfWeekDay = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'];
        function WeekDay($color, $day) {
            global $size;

            echo "<span style=\"color:#$color; font-size:" .  $size*10 . "\">$day</span><br>";
        }

        for($i = 0; $i < count($arrayOfWeekDay); $i++) {
            WeekDay("" . rand(0, 9) . rand(0, 9) . rand(0, 9) . rand(0, 9) . rand(0, 9) . rand(0, 9), $arrayOfWeekDay[$i]);
            $size--;
        }
    ?>
</body>
</html>