<?php
    $site = $_GET['site'];

    if ($site != "") {
        header ("Location: https://www.$site");
        exit;
    } else { 
        header("Location: z08-5a.php");
    }
?>

