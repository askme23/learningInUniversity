window.onload = function() {
    /************************ парсинг введенных данных ***************************/
    const submit = document.getElementById('gen-btn'); //dom - Элемент кнопки - "Генерировать"
    let arrayOfTerm = []; // массив терминальных символов
    let arrayOfNotTerm = []; // массив нетерминальных символов

    const genSymbol = ''; // порождающий символ
    let arrayOfRange = []; //диапазон

    submit.onclick = function() {
        arrayOfRange = [];
        let range = document.getElementsByClassName('range');
        getSymbol = document.getElementsByClassName('generetion-symbol')[0];
        arrayOfNotTerm = document.getElementsByClassName('not-term-symbol')[0].value.match(/[A-Z]/g);
        arrayOfTerm = document.getElementsByClassName('term-symbol')[0].value.match(/[\d[a-z]]/g);

        for(let i = 0; i < range.length; i++) {
           arrayOfRange.push(+range[i].value);
        }

        console.log(arrayOfTerm);
        console.log(arrayOfNotTerm);
        console.log(getSymbol);
        console.log(arrayOfRange);
    };

};