var counter = 0;
$(document).ready(function() {
    var podrucje = $("#table-podrucje")
    var ulicaInformation = $("#ulica-block");
    if (podrucje.hover(function () {
        var podatakPodrucja = podrucje.text();
        $.ajax({
            url: 'http://webdip.barka.foi.hr/2016_projekti/WebDiP2016x131/ajaxPozivZaPodrucja.php',
            type: 'POST',
            dataType: "html",
            data: {'name': podatakPodrucja},
            success: function (data) {
                var polje=[];
                var text = "";
                var nesto = data.split("#");
                for($i=0; $i<nesto.length;$i++){
                    var redak = nesto[$i].split(";");
                    if(redak.length > 1){
                        text = text + "<b>Taxi broj " + redak[0] + "odradio je vožnju od ulica: "+ redak[1] + ", do ulice: " + redak[3] + " u vrijeme: " + redak[2] + "</b><br>"
                        ulicaInformation.html(text);
                    }
                }
            },
            error: function (e) {
                console.log(e.message);
            }
        });
    }, function(){
        ulicaInformation.html("");
    }));
});

function submitFunkcija(){
    if(counter == 1){
        return false;
    }
    counter++;
    return true;
}
