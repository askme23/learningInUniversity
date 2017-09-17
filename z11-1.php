<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>z11-1.php</title>
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
                echo "Файл $file существует.";
            } else {
                $openFile = fopen($file, 'w+');
                $conn = mysql_connect($domen, $user, $pass);

                if (!$conn) {
                    die("Нет соединения с MySQL");
                } else {
                    mysql_select_db($db, $conn) or die ("Нельзя открыть $db: ".mysql_error());
                    
                    $result = mysql_query("SELECT * FROM $table"); 
                    $num_rows = mysql_num_rows($result);
                    $num_fields = mysql_num_fields($result);

                    while ($a_row = mysql_fetch_row($result)) {     
                        foreach ($a_row as $field) {
                            ereg_replace("(d\d\d\d)-(\d\d)-(\d\d)","$3-$2-$1", $field);
                            fwrite($openFile, "$field | "); 
                        }

                        fwrite($openFile, "\r\n");
                    }
                    fclose($openFile);

                    $openFileForRead = fopen($file, 'r');
                    while (($buffer = fgets($openFileForRead, 4096)) !== false) {
                        echo "<p> $buffer </p>";
                    }
                    
                }
            }
        ?>
    </body>
</html>
