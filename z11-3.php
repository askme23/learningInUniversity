<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title> Листинги 14-1, 14-2, 14-3</title>
    </head>
    <body>
        <?php
            $url = "http://www.ngs.ru";
            $www_url = ereg("^(http://www)\.([[:alnum:]]+)\.([[:alnum:]]+)", $url, $regs);
            if ($www_url) { // Если переменная $www_url содержит URL
                foreach ($regs as $val) {
                    print "<p>$val";
                } 
            }
        ?>

        <?php
            $url = "Мой сайт (http://aaa.narod.ru)"; 
            $url = ereg_replace("http://(([A-Za-z0-9.\-])*)", "<a href=\"\\0\">\\0</a>", $url); 
            print $url; 
            //Выводится строка: Мой сайт 
            //(<a href="http://aaa.narod.ru">http://aaa.narod.ru</a>)
        ?>

        <?php
            if (preg_match ("/\bweb\b/i", "World Wide Web")) {
                print "<p>Строка найдена.";
            } else {
                print "<p>Строка не найдена.";
            }
            
            if (preg_match ("/\bweb\b/i", "PHP is the website scripting language.")) {
                print "<p>Строка найдена.";
            } else {
                print "<p>Строка не найдена.";
            }
        ?>

    </body>
</html>
