<?php
    define("NUM_E", 2.71828);
    $num_e1 = NUM_E;

    echo 'Number e equal ' . NUM_E . '<br>';
    echo 'Type of $num_e1 = ' . gettype($num_e1) . '<br>';
    echo var_dump((string)$num_e1, (integer)$num_e1, (boolean)$num_e1);
    
?>