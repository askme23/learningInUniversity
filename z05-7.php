<html>
    <head>
        <meta charset="utf-8">
        <title>z05-7.php</title>
    </head>
    <body>
        <?php
            $lang = $_GET['lang'];

            if ($lang) {
                 echo $lang == 'ru' ? 'Привет' : 'Hello';
            }
        ?>
    </body>
</html>    
    