<?php
    $user = "root"; 
    $pass = ""; 
    $db = "study";
    $structTable = $_GET['structure'];
    $contentTable = $_GET['content'];

    $conn = mysql_connect("localhost", $user, $pass);

    if (!$conn) {
        die("Нет соединения с MySQL");
    } 
    mysql_select_db($db, $conn) or die ("Нельзя открыть $db: ".mysql_error());
?>