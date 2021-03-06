﻿var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition
//var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList
var SpeechRecognitionEvent = SpeechRecognitionEvent || webkitSpeechRecognitionEvent

//var comandos = ['próximo', 'anterior', 'repetir'];
//var grammar = '#JSGF V1.0; grammar comandos; public <comando> = ' + comandos.join(' | ') + ' ;'

var recognition = new SpeechRecognition();
//var speechRecognitionList = new SpeechGrammarList();

//speechRecognitionList.addFromString(grammar, 1);

//recognition.grammars = speechRecognitionList;
recognition.continuous = true;
recognition.lang = 'pt-PT';
recognition.interimResults = false;
recognition.maxAlternatives = 1;

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function reconhecimento() {
    await sleep(5000);
    recognition.start();
}

reconhecimento();

recognition.onresult = function (event) {
    var last = event.results.length - 1;
    var comando = event.results[last][0].transcript;
    if (comando === 'próximo') {
        document.getElementById("prox").click();
    }
    else {
        if (comando === 'anterior')
            document.getElementById("ant").click();
        else {
            if (comando === 'repetir')
                document.getElementById("repete").click();
            else {
                document.getElementById("erro").innerHTML = comando;
            }
        }
    }
}

recognition.onspeechend = function () {
    recognition.stop();
}