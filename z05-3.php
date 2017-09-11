<?php
    $breakfast = "gamburger";
    $breakfast2 = & $breakfast; 

    echo $breakfast2 . '<br>';
    $breakfast = "tea";
    echo $breakfast2;
?>