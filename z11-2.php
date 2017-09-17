<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>z11-2.php</title>
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
            $domen = "localhost";
            $user = "root"; 
            $pass = ""; 
            $db = "sample";
            $table = "notebook_br35";
            $file = "$table.txt";
            
            if (file_exists($file)) {
                $file_array = file($file);

                echo "<table cellpadding=\"10\" border=\"1\">";
                foreach($file_array as $value) {
                    echo "<tr>";
                        $value = rtrim($value, "\| \r\n");
                        $value = preg_replace('/\s\|/', '</td><td>', $value);
                        $value = preg_replace('/(\w+\s*\d*@\w+.\w+)/', "<a href=\"mailto:$1\">$1</a>", $value);
                        echo "<td> $value </td>";
                    echo "</tr>";    
                }
                echo "</table>";
            } else {
                echo "Файла $file не существует.";
            }
        ?>
    </body>
</html>