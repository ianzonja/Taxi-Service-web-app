$(document).on('submit', '#login-forma', function(e){
    var korIme = $('#login-user').val();
    var pass = $('#login-pass').val();
    var errorInformation = $("#error-information");
    if (korIme !== "" && pass !== "") {
        //var json = JSON.parse(korIme.value.toString());
        $.ajax({
            url: 'http://webdip.barka.foi.hr/2016_projekti/WebDiP2016x131/provjera_za_prijavu.php',
            type: 'POST',
            dataType: "html",
            data: {'name': korIme, 'pass': pass},
            success: function (data) {
                if (data.indexOf("false") !== -1) {
                    errorInformation.html("Korisnik ne postoji ili lozinka kriva!")
                } else {
                    errorInformation.html("Korisnik i lozinka tocni!");
                }
            },
            error: function (e) {
                console.log(e.message);
            }
        });
    } else {
        errorInformation.html("Korisnicko ime ili lozinka nisu uneseni!");
    }
});

    
