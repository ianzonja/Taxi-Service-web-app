$(document).ready(function(){
    var korIme = $("#input-korIme");
    var errorInformation = $("#error-information");
    korIme.focusout(function(){
        if (korIme.value !== "") {
        //var json = JSON.parse(korIme.value.toString());
            $.ajax({
                url: 'http://webdip.barka.foi.hr/2016_projekti/WebDiP2016x131/ajax.php',
                type: 'POST',
                dataType: "html",
                data: {'name':korIme.value},
                success: function(data){
                    if(data == "false"){
                        errorInformation.html("Već postoji username u bazi")
                    }
                    else{
                        errorInformation.html("Username dobar, korisnik ne postoji.");
                    }
            },
            error: function(e){
                console.log(e.message);
            }
        });
    }
});
});