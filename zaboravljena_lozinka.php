<?php
include 'baza.class.php';
$baza = new Baza();
if (!empty($_POST)) {
    $baza->spajanjeNaBazu();
    if (isset($_POST['input-korisnickoIme'])) {
        $korIme = $_POST['input-korisnickoIme'];
        $sqlUpit = "Select * from Korisnik where Username='$korIme'";
        $rezultati = $baza->selectUpit($sqlUpit);
        $counter = 0;
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $counter++;
            $mailTrenutnogKorisnika = $rezultat['Email'];
            $velikaslova = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $malaslova = 'abcdefghijklmnopqrstuvwxyz';
            $brojevi = '1234567890';
            $pass = array();
            $alphaLength = strlen($velikaslova) - 1;
            for ($i = 0; $i < 2; $i++) {
                $n = rand(0, $alphaLength);
                $pass[] = $velikaslova[$n];
            }
            $alphaLength = strlen($malaslova) - 1;
            for ($i = 0; $i < 2; $i++) {
                $n = rand(0, $alphaLength);
                $pass[] = $malaslova[$n];
            }
            $alphaLength = strlen($brojevi) - 1;
            for ($i = 0; $i < 2; $i++) {
                $n = rand(0, $alphaLength);
                $pass[] = $brojevi[$n];
            }

            $sifra = implode("", $pass);

            $sqlUpit = "Update Korisnik set Password='$sifra' where Username='$korIme'";
            $baza->ostaliUpiti($sqlUpit);

            $to = $mailTrenutnogKorisnika;
            $subject = 'Nova lozinka';
            $message = 'Poštovani, ovo je nova lozinka za vaš racun. Cuvajte ju! Lozinka glasi: ' . $sifra;

            mail($to, $subject, $message);
        }
        if ($counter == 0) {
            echo "Unesite točan username kako bi vam poslali mail sa novom lozinkom";
        }
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script> 
        $(function(){
            $("#header").load("Header.html"); 
        });
        </script>
        <script> 
        $(function(){
            $("#izbornik").load("Izbornik-registrirani.html"); 
        });
        </script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div class="content" style="height: 700px">
            <form class="zab-loz-form" method="post" action="">
                <div class="zab-loz-block">
                    <p>Molimo, unesite svoj username</p>
                    <input class="input-unos-usernamea" name="input-korisnickoIme" type="text"/>
                </div>
                <input class="zab-loz-submit" name="input-zab-lot-sbubmit" type="submit"/>
            </form>
        </div>
        
    </body>
</html>     