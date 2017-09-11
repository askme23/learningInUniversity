<?php
    $get_lang = $_GET['lang'];

    switch ($get_lang) {
        case 'ru': 
            echo "Language is " . "Russian";
            break;
        case 'en':
            echo "Language is " . "English";
            break;
        case 'fr':
            echo "Language is " . "French";
            break;
        case 'de':
            echo "Language is " . "Deutsch";
            break;
    }
?>