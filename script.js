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


    return objWithStartData;
};


let generationRegExp = function() {
    if (obj = parseDataFromInput()) {
        let exp = "";
        if (+obj.mult == obj.pick.length) {
            exp = obj.pick;
        } else {
            const lengthOfRest = obj.mult - obj.pick.length;
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
            
            //граничная части выражения
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
        alert('Неверные входные данные');
    }
};

window.onload = function() {
    const genBtn = document.getElementsByClassName('btn-gen')[0];
    //console.log(genBtn);

    genBtn.onclick = function(e) {
        document.getElementById('area-exp').innerHTML = generationRegExp(); 
        //console.log(generationRegExp());
    };
    

};