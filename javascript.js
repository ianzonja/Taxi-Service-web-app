/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var inputNaziv = null;
var inputPrezime = null;
var inputKorIme = null;
var inputLozinka = null;
var inputPotvrda = null;
var vrijemeNaPocetku = null;
var submitButton = null;
var korIme = null;
var errorInformation = null;

$(document).ready(function(){
    inputNaziv = document.getElementById("input-ime");
    inputPrezime = document.getElementById("input-prezime");
    inputKorIme = document.getElementById("input-korIme");
    inputPotvrda = document.getElementById("input-potvrda");
    inputLozinka = document.getElementById("input-lozinka");
    //inputNaziv.addEventListener("keyup", ProvjeriPrvaSlovaUImenuIPrezimenu);
    vrijemeNaPocetku = new Date();
    submitButton = document.getElementById("input-registracija-submit");
    korIme = document.getElementById("input-korIme");
    errorInformation = document.getElementById("error-information");
});


function ProvjeriPrvaSlovaUImenuIPrezimenu(){
    if((inputNaziv.value.toString().charAt(0) != inputNaziv.value.toString().charAt(0).toUpperCase()) || (inputPrezime.value.toString().charAt(0) != inputPrezime.value.toString().charAt(0).toUpperCase())){
        event.preventDefault();
        return false;
    }
    return true;
}

function ProvjeriDuljinuKorisnickogImena(){
    if(inputKorIme.value.length < 5){
        event.preventDefault();
        return false;
    }
    return true;
}

function ProvjeriStrukturuLozinke(){
    var regex = /^(?=.*?[A-Z]{2})(?=.*?[a-z]{2})(?=.*?[0-9]).{5,15}/g;
    if(!regex.test(inputLozinka.value)){
        event.preventDefault();
        return false;
    }
    return true;    
}

function ProvjeriJednakostLozinki(){
    if(inputLozinka.value.toString() != inputPotvrda.value.toString()){
        event.preventDefault();
        return false;
    }
    return true;
}

function ProvjeriVrijeme(){
    var novoVrijeme = new Date();
    var razlika = (novoVrijeme.getTime() - vrijemeNaPocetku.getTime())/1000;
    if(razlika > 300){
        event.preventDefault();
        return false;
    }
    return true;
}



