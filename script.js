//Функция для осуществления всех проверок
let parseDataFromInput = function() {
    let alph = document.getElementsByClassName('input-alphabet')[0].value;
    const mult = document.getElementsByClassName('input-multiplicity')[0].value;
    const pick = document.getElementsByClassName('input-pickAp')[0].value;
    console.log(alph);
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

    if (!alph.length && !mult && !pick) {
        errors.message = "Заполните поля начальными данными";

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

    if (pick.length == 0) {
        errors.element = "Подцепочка";
        errors.message = "Поле " + errors.element + " не может быть пустым.";

        return errors;
    } else {
        pick.split('').forEach(item => {
            if (alph.indexOf(item) == -1) {
                errors.element = "Подцепочка";
                errors.message = "Подцепочка " + pick + " содержит символы, не входящие в состав алфавита";
                
                return errors;
            } 
        });
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
    if (obj.check == undefined) {
        let exp = "";
        if (+obj.mult == obj.pick.length) {
            exp = obj.pick;
        } else {
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
            for(let i = 0; i < lengthOfRest + 1; i++) {
                for (let j = 0; j < lengthOfRest + 1; j++) {
                    if (j == i) { 
                        exp += obj.pick;
                    } else {
                        exp += anySymbol;
                    }
                }

                if (i < lengthOfRest) {
                    exp += "+";
                }
            }
            exp += ")";

            //граничная часть выражения
            let boundariesOfExp = "(";
            for (let i = 0; i < +obj.mult; i++) {
                boundariesOfExp += anySymbol; 
            }
            boundariesOfExp += ")*"
            console.log(boundariesOfExp);
            exp = boundariesOfExp + exp + boundariesOfExp;
        }

        return exp;
    } else {
        alert(obj.message);
    }
};

window.onload = function() {
    const genBtn = document.getElementsByClassName('btn-gen')[0];
    const tskBtn = document.getElementsByClassName('choice-btn task')[0];
    const closeBtn = document.getElementsByClassName('close-win')[0];
    //console.log(genBtn);
    tskBtn.onclick = function() {
        document.getElementById('task-form').style.display = "";
        document.getElementById('main-form').style.display = "none";
    };

    closeBtn.onclick = function() {
        document.getElementById('task-form').style.display = "none";
        document.getElementById('main-form').style.display = "";
    };

    genBtn.onclick = function(e) {
        document.getElementById('area-exp').innerHTML = generationRegExp(); 
        //console.log(generationRegExp());
    };
    

};