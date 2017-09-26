window.onload = function() {
    /************************ парсинг введенных данных ***************************/
    const submit = document.getElementById('gen-btn'); //dom - Элемент кнопки - "Генерировать"
    let arrayOfTerm = []; // массив терминальных символов
    let arrayOfNotTerm = []; // массив нетерминальных символов

    let genSymbol = ''; // порождающий символ
    let arrayOfRange = []; //диапазон

    //при нажатии на кнопку "Генерировать" происходит считывание данных с формы
    submit.onclick = function() {
        document.querySelector('#main-form .print').style.display = "block";
        let range = document.getElementsByClassName('range');
        arrayOfRange = [];
        genSymbol = document.getElementsByClassName('generation-symbol')[0].value;
        arrayOfNotTerm = document.getElementsByClassName('not-term-symbol')[0].value.match(/[A-Z]/g);
        arrayOfTerm = document.getElementsByClassName('term-symbol')[0].value.match(/[\d[a-z]]/g);

        for(let i = 0; i < range.length; i++) {
           arrayOfRange.push(+range[i].value);
        }

        console.log(arrayOfTerm);
        console.log(arrayOfNotTerm);
        console.log(genSymbol);
        console.log(arrayOfRange);
    };

};