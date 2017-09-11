<?php
    $get_lang = $_GET['lang'];
    
    if ($get_lang == 'fr') {
        echo "Language is " . "French";
    } elseif ($get_lang == 'ru') {
        echo "Language is " . "Russian";
    } elseif ($get_lang == 'en') {
        echo "Language is " . "English";
    } elseif ($get_lang == 'de') {
        echo "Language is " . "Deutsch";
    } else {
        echo "Laguage is undefined";
    }
?>
