//Функция для осуществления всех проверок
let parseDataFromInput = function() {
    let alph = document.getElementsByClassName('input-alphabet')[0].value;
    const mult = document.getElementsByClassName('input-multiplicity')[0].value;
    const pick = document.getElementsByClassName('input-pickAp')[0].value;
    //console.log(alph);
    alph = alph.replace(/[,\.\|\\\s\-]/g, '').split('');

    const objWithStartData = {
        "alph": alph,
        "mult": mult,
        "pick": pick
    };
    const errors = {
        "element": "",
        "check": false,
        "message": ""
    };

    let items = pick.split('');
    for (let i = 0; i < items.length; i++) {
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


let generationRegExp = function() {
    let obj = parseDataFromInput();
    console.log(obj);
    if (obj.check == undefined) {
        let exp = "";
        let lengthOfRest = obj.mult - obj.pick.length;
        if (lengthOfRest < 0) {
            lengthOfRest *= -1;
        }
        let arrayOfAnySymbol = [];
        let anySymbol = "("

        //любой символ из алфавита
        for (let i = 0; i < obj.alph.length; i++) {
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
            for(let i = 0; i < obj.mult; i++) {
                let check = true;
                for (let j = 0; j < obj.mult; j++) { 
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
        let boundariesOfExp = "(";
        for (let i = 0; i < +obj.mult; i++) {
            boundariesOfExp += anySymbol; 
        }
        boundariesOfExp += ")*";
        console.log(boundariesOfExp);
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
let generationChains = function(reg, range) {
    var res = [];
    var cur = [];

    cur.push("");
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
            //console.log(rep)

            
            var inc = generationChains(next.substring(1, next.length - 1), range);
            var newcur = [];
            if (rep) {
                var newinc = [];
                newinc.push("");
                var add = true;

                while (add) {
                    add = false;
                    for (var j = 0; j < inc.length; ++j) {
                        for (var k = 0; k < newinc.length; ++k) {
                            var newstr = newinc[k] + inc[j];

                            if (newstr.length <= range && newinc.indexOf(newstr) == -1) {
                                newinc.push(newstr);
                                add = true;
                            }
                        }
                    }
                }
                inc = newinc;

            }

            for (var j = 0; j < inc.length; ++j) {
                for (var k = 0; k < cur.length; ++k) {
                    var newstr = cur[k] + inc[j];
                    if (newstr.length <= range) {
                        newcur.push(newstr);
                    }
                }
            }

            cur = newcur;
        } else if (reg[i] == '+') {
            cur.forEach((item) => {
                res.push(item);
            });
            //console.log(res);
            cur = [];
            cur.push("");
        } else {
            for (var j = 0; j < cur.length; ++j)
                cur[j] += reg[i];
        }
    }
    cur.forEach((item) => {
        res.push(item);
    });
    cur = [];

    return res;
};

window.onload = function() {
    const genBtnReg = document.getElementsByClassName('btn-gen reg')[0];
    const genBtnChains = document.getElementsByClassName('btn-gen chains')[0];
    const tskBtn = document.getElementsByClassName('choice-btn task')[0];
    const closeBtn = document.getElementsByClassName('close-win')[0];
    //const multInp = document.getElementsByClassName('input-multiplicity')[0];
    //console.log(genBtn);
    tskBtn.onclick = function() {
        document.getElementById('task-form').style.display = "";
        document.getElementById('main-form').style.display = "none";
    };

    closeBtn.onclick = function() {
        document.getElementById('task-form').style.display = "none";
        document.getElementById('main-form').style.display = "";
    };

    genBtnReg.onclick = function(event) {
        //console.log(generationRegExp());
        if (generationRegExp()) {
            document.getElementById('area-exp').innerHTML = generationRegExp(); 
        } else {
            document.getElementById('area-exp').innerHTML = ""; 
        }
        // console.log(document.getElementById('area-exp'));
    };

    genBtnChains.onclick = function() {
        const areaExp = document.getElementById('area-exp');
        const areaConv = document.getElementById('area-conv');
        const range = [+document.getElementsByClassName('range')[0].value, +document.getElementsByClassName('range')[1].value];
        let obj = parseDataFromInput();

        console.log(areaExp.innerHTML + ' - ' + range[1]);
        //вывод цепочек в указанном диапазоне и указанных условиях вывода, а также проверка на валидность данных
        if (obj.check == undefined) {
            if (areaExp.value.length != 0) {
                const chains = generationChains(areaExp.value, range[1]).sort((a, b) => {
                    return a.length - b.length;
                });

                console.log(chains);
                for(let i = 0; i < chains.length; i++) {
                    if (chains[i].length >= range[0] && 
                        chains[i].length <= range[1] && 
                        chains[i].length % obj.mult == 0 && 
                        chains[i].indexOf(obj.pick) != -1) {
                        areaConv.value += chains[i] + '\n';
                    }
                }
            }
        } else {
            alert(obj.message);
        }
    };
};