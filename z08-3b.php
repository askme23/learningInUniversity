<?php
    $otv = array("6", "9", "4", "1", "3", "2", "5", "8", "7");
    $answer = $_GET['choice'];
    $name = $_GET['nameOfParticipant'];
    $countOfRightAnswers = 0;
    
    if(count($answer) == count($otv)) {
        for($i = 0; $i < count($answer); $i++) {
            if($anwer[$i] == $otv[$i]) {
                $countOfRightAnswers++;
            }
        }
    }

    echo "$name, вы ";
    switch ($countOfRightAnswers) {
        case 9:
            echo "великолепно знаете географию";
            break;
        case 8:
            echo "отлично знаете географию";
            break;
        case 7:
            echo "очень хорошо знаете географию"; 
            break;
        case 6:
            echo "хорошо знаете географию";
            break;
        case 5:
            echo "удовлетворительно знаете географию";
            break;
        case 4:
            echo "терпимо знаете географию";
            break;
        case 3:
            echo "плохо знаете географию";
            break;
        case 2:
            echo "очень плохо знаете географию";
            break;
        default:
            echo "вообще не знаете географию";
            break;
    }

    echo "<br>";
    echo "<a style=\"text-decorate: none; font-family: 'Roboto Mono', Arial, sans-serif;\"href=\"z08-3a.html\">Хочу еще</a>"
?>