<html> 
    <head>
        <title> Листинги 8-5 ~ 8-9</title> 
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
            #**********8-5************
            // $num_of_calls = 0;
            // function Listitem($txt) {
            //     global $num_of_calls;
              
            //     $num_of_calls++;
            //     print "<b>$num_of_calls: $txt</b>"; 
            // }
            
            // Listitem("Видеокамеры"); 
            // print("<p>Sony, Panasonic"); 
            
            // Listitem("Фотоаппараты"); 
            // print("<p>Canon, Casio"); 

            #**********8-6************
            function Listitem($txt) {
                static $num_of_calls = 0;  
                $num_of_calls++;
                print "<b>$num_of_calls . $txt</b>";
            }

            Listitem("Видеокамеры ");
            print("<p>Sony, Panasonic</p>");
            Listitem("Фотоаппараты");
            print("<p>Canon, Casio</p>");

            #**********8-7************
            function FontSize($txt, $size=4) {
                print "<font size=\"$size\">$txt</font>";
            }

            FontSize("<p>Крупный шрифт", 5); 
            FontSize("<p>Нормальный шрифт, первая строка"); 
            FontSize("<p>Нормальный шрифт, вторая строка"); 
       
            #**********8-8************
            function AddFive($num) {
                $num +=5; 
            }
            
            $var = 10; 
            AddFive(&$var); 
            print $var; // выводится 15
                         // без & выведется 10
         
            #**********8-9************
            function AddFive(&$num) {
                $num += 5; 
            }
            
            $var = 10; 
            AddFive($var); 
            print $var; 
         
        ?> 
    </body> 
</html>
