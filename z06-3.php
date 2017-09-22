<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Задание №3</title>
    <style>
        body {
            font-family: "Roboto Mono", Arial, Tahoma, sans-serif;
            font-size: 50px;
            background-color: rgb(241, 241, 241);
        }
    </style>
</head>
<body>
    <?php
        function Ru($color) {
            echo "<span style=\"color:$color\">Privet!</span>";
        }

        function En($color) {
            echo "<span style=\"color:$color\">Hello!</span>";
        }
        
        function Fr($color) {
            echo "<span style=\"color:$color\">Bonjour!</span>";
        }

        function De($color) {
            echo "<span style=\"color:$color\">Guten tag!</span>";
        }

        $get_lang = $_GET['lang'];
        $get_color = $_GET['color'];

        switch ($get_lang) {
            case 'Ru':
                Ru($get_color);
                break;
            case 'En':
                En($get_color);
                break;
            case 'Fr':
                Fr($get_color);
                break;
            case 'De':
                De($get_color);
                break;
        }
    ?>
</body>
</html>