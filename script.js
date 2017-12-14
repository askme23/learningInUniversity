//Функция для осуществления всех проверок на этапе построения регулярного выражения
var parseDataFromInput = function() {
    var alph = document.getElementsByClassName('input-alphabet')[0].value;
    var mult = document.getElementsByClassName('input-multiplicity')[0].value;
    var pick = document.getElementsByClassName('input-pickAp')[0].value;
    //console.log(alph);
    alph = alph.replace(/[,\.\|\\\s\-]/g, '').split('');

    var objWithStartData = {
        "alph": alph,
        "mult": mult,
        "pick": pick
    };
    var errors = {
        "element": "",
        "check": false,
        "message": ""
    };

    for(var k = 0; k < alph.length; k++) {
        if (alph[k] == '+' || alph[k] == '*' || alph[k] == '(' || alph[k] == ')') {
            errors.message = "В алфавите не могут быть управляющие символы.";

            return errors;
        }
    }

    var items = pick.split('');
    for (var i = 0; i < items.length; i++) {
        if (alph.indexOf(items[i]) == -1) {
            errors.message = "Подцепочка '" + pick + "' содержит символы, не входящие в состав алфавита";
          
            return errors;
        } 
    }

    if (!alph.length && !mult && !pick) {
        errors.message = "Заполните поля начальными данными";

        return errors;
    }

    if (isNaN(+mult)) {
        errors.element = "Кратность";
        errors.message = "В поле " + errors.element + " введенные не числовые значения.";

        return errors;
    }

    if (mult == "") {
        errors.element = "Кратность";
        errors.message = "Поле " + errors.element + " заполнено некорректными данными.";
        
        return errors;
    } else if (mult < 0) {
        errors.element = "Кратность";
        errors.message = "Поле " + errors.element + " не может быть пустым.";

        return errors;
    }

    if (!alph.length) {
        errors.element = "Алфавит";
        errors.message = "Алфавит не может быть пустым";

        return errors;
    }

    return objWithStartData;
};


//функция генерации регулярного выражения
var generationRegExp = function() {
    var obj = parseDataFromInput();
    if (obj.check == undefined) {
        var exp = "";
        var lengthOfRest = obj.mult - obj.pick.length;
        if (lengthOfRest < 0) {
            lengthOfRest *= -1;
        }
        var arrayOfAnySymbol = [];
        var anySymbol = "("

        //любой символ из алфавита
        for (var i = 0; i < obj.alph.length; i++) {
            if (i) {
                anySymbol += "+" + obj.alph[i];    
            } else {
                anySymbol += obj.alph[i];
            }
        }
        anySymbol += ")";

        exp += "(";
        //главная часть выражения, где перебираются все варианты
        if (obj.pick.length != 0) {
            for(var i = 0; i < obj.mult; i++) {
                var check = true;
                for (var j = 0; j < obj.mult; j++) { 
                    if (j == i && check) { 
                        exp += obj.pick;
                        j += obj.pick.length;

                        if (j > obj.mult) {
                            j -= obj.mult;
                            check = false;  
                        }
                        j--;
                    } else {
                        exp += anySymbol;
                    }
                }

                if (i < obj.mult - 1) {
                    exp += "+";
                }
            }
            exp += ")";
        } 

        //граничная часть выражения
        var boundariesOfExp = "(";
        for (var i = 0; i < +obj.mult; i++) {
            boundariesOfExp += anySymbol; 
        }
        boundariesOfExp += ")*";
        //console.log(boundariesOfExp);
        if (obj.pick.length == 0) {
            exp = boundariesOfExp;
        } else {
            exp = boundariesOfExp + exp + boundariesOfExp;
        }

        return exp;
    } else {
        alert(obj.message);
    }
};

//функция для генерации цепочек
var generationChains = function(reg, range) {
    var result = [];
    var current = [];

    current.push("");
    for (var i = 0; i < reg.length; ++i) {
        if (reg[i] == '(') {
            var d = 0;//счетчик
            var next = "";

            while (i < reg.length) {
                next += reg[i];
                if (reg[i] == '(') {
                    ++d;
                } else if (reg[i] == ')') {
                    --d;
                }

                if (d == 0) {
                    break;
                }

                ++i;
            }

            var rep = false;
            if (i + 1 < reg.length && reg[i+1] == '*') {
                ++i;
                rep = true;
            }
            
            //вход в рекурсию
            var include = generationChains(next.substring(1, next.length - 1), range);
            var recurrent = [];
            if (rep) {
                var recInclude = [];
                recInclude.push("");
                var add = true;

                while (add) {
                    add = false;
                    for (var j = 0; j < include.length; ++j) {
                        for (var k = 0; k < recInclude.length; ++k) {
                            var newStr = recInclude[k] + include[j];

                            if (newStr.length <= range && recInclude.indexOf(newStr) == -1) {
                                recInclude.push(newStr);
                                add = true;
                            }
                        }
                    }
                }
                include = recInclude;

            }

            for (var j = 0; j < include.length; ++j) {
                for (var k = 0; k < current.length; ++k) {
                    var newStr = current[k] + include[j];
                    if (newStr.length <= range) {
                        recurrent.push(newStr);
                    }
                }
            }

            current = recurrent;
        } else if (reg[i] == '+') {
            current.forEach((item) => {
                result.push(item);
            });
            //console.log(result);
            current = [];
            current.push("");
        } else {
            for (var j = 0; j < current.length; ++j)
                current[j] += reg[i];
        }
    }
    current.forEach((item) => {
        result.push(item);
    });
    current = [];

    return result;
};

//проверка регулярного выражения на правильность (критерий достаточно не строгие, т.к регулярное выражение может быть любым)
var checkRegForCorrect = function(reg, alph, pick) {
    var nesting = 0; //вложенность
    var symbols = reg.split('');
    var error = {
        message: "",
        status: false
    };

    for (var i = 0; i < reg.length; i++) {
        if (reg[i] != '+' && reg[i] != '*' && reg[i] != '(' && reg[i] != ')' && symbols.indexOf(reg[i]) == -1) {
            error.message = 'Регулярное выражение содержит недопустимые символы.';
            error.status = true;
            
            return error;
        }

        if (nesting > 3) {
            error.message = "Слишком большая вложенность.";
            error.status = true;

            return error;   
        } else {
            if (reg[i] == '(') {
                nesting++;
            } else if (reg[i] == ')') {
                nesting--;
            }    

            if ((i == 0 || i == reg.length) && reg[i] == '+') {
                error.message = 'Символ исключения не может находиться в начале или в конце регулярного выражения.';
                error.status = true;
                return error;
            }

            if ((reg[i] == '+') && (reg[i + 1] == '+' || reg[i + 1] == '*') || 
                // (reg[i] == '+' || reg[i] == '*') && (reg[i - 1] == '+' || reg[i - 1] == '*') ||
                 reg[i] == '+' && (reg[i - 1] == '(' || reg[i + 1] == ')')) {
                error.message = "Данная последовательность операторов недопустима в регулярном выражении.";
                error.status = true;
                return error;
            }
        }    
    }

    if (nesting != 0) {
        // console.log('егор - пидор');
        error.message = "Некорректное регулярное выражение";
        error.status = true;

        return error;
    }

    return error;
};

//очистка полей
var clearFields = function() {
    document.getElementsByClassName('input-alphabet')[0].value = "";
    document.getElementsByClassName('input-multiplicity')[0].value = "";
    document.getElementsByClassName('input-pickAp')[0].value = "";
    document.getElementById('area-exp').value = "";
    document.getElementById('area-conv').value = "";
    document.getElementsByClassName('range')[0].value = ""; 
    document.getElementsByClassName('range')[1].value = "";
};

//удаление ссылок на скачивание файлов, в которые были записаны РВ и(или) цепочки
var hideDownloadLink = function(element) {
    element.target.parentNode.style.display = "none";
    element.target.parentNode.innerHTML = "";
}

//функция после загрузки всей страницы в браузере
window.onload = function() {
    var genBtnReg = document.getElementsByClassName('btn-gen reg')[0];
    var genBtnChains = document.getElementsByClassName('btn-gen chains')[0];

    var tskBtn = document.getElementsByClassName('choice-btn task')[0];
    var atrBtn = document.getElementsByClassName('choice-btn author')[0];
    var tmeBtn = document.getElementsByClassName('choice-btn theme')[0];
    var refBtn = document.getElementsByClassName('choice-btn reference')[0];
    var closeBtn = document.getElementsByClassName('close-win');

    var checkFile = document.getElementsByClassName('chbx-file')[0];
    var changedFile = document.getElementById('file');

    //навешивание событий
    tskBtn.onclick = function() {
        document.getElementById('task-form').style.display = "";
        document.getElementById('main-form').style.display = "none";
        document.getElementById('author-form').style.display = "none";
        document.getElementById('theme-form').style.display = "none";
        document.getElementById('ref-form').style.display = "none";
    };

    atrBtn.onclick = function() {
        document.getElementById('author-form').style.display = "";
        document.getElementById('theme-form').style.display = "none";
        document.getElementById('ref-form').style.display = "none";
    };

    tmeBtn.onclick = function() {
        document.getElementById('theme-form').style.display = "";
        document.getElementById('author-form').style.display = "none";
        document.getElementById('ref-form').style.display = "none";
    };

    refBtn.onclick = function() {
        document.getElementById('ref-form').style.display = "";
        document.getElementById('author-form').style.display = "none";
        document.getElementById('theme-form').style.display = "none";
    };

    checkFile.onclick = function(event) {
        if (event.target.checked) {
            document.getElementById('file').style.display = "";
        } else {
            document.getElementById('file').style.display = "none";
        }

    };

    //выгрузка данных из файла и помещения их в поля Алфавит, кратносить и фикс.подцепочка
    changedFile.onchange = function(event) {
        var file = event.target.files[0];
        
        if (file.type == 'text/plain') {
            var reader = new FileReader();
            reader.readAsText(file);

            //дейсвтия после загрузки файла
            reader.onload = function() {
                var dataAfterParsing = reader.result.split('\n');
                for(var i = 0; i < dataAfterParsing.length; i++) {
                    dataAfterParsing[i] = dataAfterParsing[i].replace(' ', '').split('-');
                    dataAfterParsing[i][1] = dataAfterParsing[i][1].replace(/\|*\s*/g, '');
                }

                document.getElementsByClassName('input-alphabet')[0].value = dataAfterParsing[0][1];
                document.getElementsByClassName('input-multiplicity')[0].value = dataAfterParsing[1][1];
                document.getElementsByClassName('input-pickAp')[0].value = dataAfterParsing[2][1];

                console.log(dataAfterParsing);
            };
        }
    };

    //обработчик закрытия формы 
    for(var i = 0; i < closeBtn.length; i++) {
        closeBtn[i].onclick = function(event) {
            var target = event.target;
            //document.getElementById('task-form').style.display = "none";
            if (target.parentNode.id == "task-form") {
                clearFields();
            }
            target.parentNode.style.display = "none";
            document.getElementById('main-form').style.display = "";
        };    
    }
    
    //генерация регулярного выражения при нажатии на кнопку
    genBtnReg.onclick = function(event) {
        //console.log(generationRegExp());
        var writeToFile = document.getElementsByClassName('download-file')[0];

        if (generationRegExp()) {
            var tempResult = generationRegExp();

            document.getElementById('area-exp').value = tempResult;
            
            //запись в файл
            if (document.getElementsByClassName('task-chkb')[1].checked) {
                writeToFile.style.display = "";

                if (writeToFile.innerHTML == '') {
                    writeToFile.innerHTML +=  
                    '<a href="data:text/plain;charset=utf-8,%EF%BB%BF' + 
                    encodeURIComponent(tempResult) + 
                    '" download="regExp.txt" onclick="hideDownloadLink(event);" style="text-decoration: none; color: #333;">Скачать результаты</a>';
                }
            }
        } else {
            document.getElementById('area-exp').value = ""; 
        }
        // console.log(document.getElementById('area-exp'));
    };

    //генерация цепочек
    genBtnChains.onclick = function() {
        var areaExp = document.getElementById('area-exp');
        var areaConv = document.getElementById('area-conv');
        var range = [+document.getElementsByClassName('range')[0].value, +document.getElementsByClassName('range')[1].value];
        var checkDataFromFields = parseDataFromInput();
        areaConv.value = "";
        
        //если поле с регулярным выражением не пустое
        if (areaExp.value.length != 0) {
            //проверка рег.выражения
            var checkReg = checkRegForCorrect(areaExp.value, checkDataFromFields.alph, checkDataFromFields.pick);
            // console.log(checkReg);

            //если ошибки не возратилось
            if (!checkReg.status) {
                if (range[0] < range[1] && range[0] >= 0 && range[1] > 0) {
                    var chains = generationChains(areaExp.value, range[1]).sort((a, b) => {
                        return a.length - b.length;
                    });

                    //условия вывода цепочек
                    var finChains = [];
                    var writeToFileChains = document.getElementsByClassName('download-file')[1];
                    var tempChains = "";

                    //вывод цепочек в текстовую область(нижнюю)
                    for(var i = 0; i < chains.length; i++) {
                        if (chains[i].length >= range[0] && chains[i].length <= range[1]) {
                            if (finChains.indexOf(chains[i]) == -1) {
                                finChains.push(chains[i]);
                                areaConv.value += chains[i] + '\n';
                                tempChains += chains[i] + '\r\n';
                            }
                        }
                    }

                    console.log(tempChains);
                    //если был отмечен чекбокс записи в файл, то записываем
                    if (document.getElementsByClassName('task-chkb')[2].checked) {

                        writeToFileChains.style.display = "";
                        if (writeToFileChains.innerHTML == '') {
                            writeToFileChains.innerHTML +=  
                            '<a href="data:text/plain;charset=utf-8,%EF%BB%BF' + 
                            encodeURIComponent(tempChains) + 
                            '" download="chains.txt" onclick="hideDownloadLink(event);" style="text-decoration: none; color: #333;">Скачать результаты</a>';
                        }
                    }
                } else {
                    alert("Некорректный диапазон длин цепочек.")
                }
            } else {
                alert(checkReg.message);
            }
        } else {
            //alert(checkDataFromFields.message);
            alert("Невозможно построить цепочки по данному регулярному выражению.");
        }
    };
};