<?php
    $align = $_GET['align'];
    $valign = $_GET['valign'];
    $size = 100;

    echo "<table width=\"$size\" height=\"$size\" border=\"1\">\n";
    echo "<tr>\n";
    echo "\t<td valign=\"$valign\" align=\"$align\" >Текст</td>\n";
    echo "</tr>\n";
    echo "</table>";

    echo "<br>";
    echo "<a href=\"z08-1a.html\">Назад</a>";
?>