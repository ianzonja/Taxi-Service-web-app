<?php
include 'baza.class.php';
$greska = false;
$captchaTocna = false;
if (!empty($_POST)) {
    if (!isset($_POST["input-name-ime"])) {
        require_once('recaptcha-php-1.11/recaptchalib.php');
        $privatekey = "6Lf1QiYUAAAAAGtxRtcu6-dqHGeE8gid6LzF2nwn";
        $resp = recaptcha_check_answer($privatekey, $_SERVER["REMOTE_ADDR"], $_POST["recaptcha_challenge_field"], $_POST["recaptcha_response_field"]);

        if (!$resp->is_valid) {
            // What happens when the CAPTCHA was entered incorrectly
            die("The reCAPTCHA wasn't entered correctly. Go back and try it again." .
                    "(reCAPTCHA said: " . $resp->error . ")");
        } else {
            $captchaTocna = true;
        }
    } else {
        $baza = new Baza();
        $baza->spajanjeNaBazu();
        $ime = $_POST["input-name-ime"];
        $prezime = $_POST["input-name-prezime"];
        $korIme = $_POST["input-name-korIme"];
        $lozinka = $_POST["input-name-lozinka"];
        $potvrda = $_POST["input-name-potvrda"];
        $mail = $_POST["input-name-mail"];
        $datum = $_POST["input-name-datum"];
        $telefon = $_POST["input-name-telefon"];
        $regex = "/[(){}'!#“\/]/";
        if (preg_match($regex, $ime) || preg_match($regex, $prezime) || preg_match($regex, $korIme) || preg_match($regex, $lozinka) || preg_match($regex, $potvrda) || preg_match($regex, $mail) || preg_match($regex, $datum) || preg_match($regex, $telefon)) {
            echo"Pogrešan unos, unijeli ste neke od nedopuštenih znakova.<br>";
            $greska = true;
        }

        $regex = "/^(?=.*?[A-Z]{2})(?=.*?[a-z]{2})(?=.*?[0-9]).{5,15}/";
        if (!preg_match($regex, $lozinka)) {
            echo "Pogrešan unos. Lozinka mora imati 2 veliak slova, 2 mala te 2 broja. Duljina mora biti od 5 do 15<br>";
            $greska = true;
        }
        if ($lozinka != $potvrda) {
            echo "Lozinka i potvrda lozinke se ne poklapaju<br>";
            $greska = true;
        }
        $regex = "/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/";
        if (!preg_match($regex, $mail)) {
            echo "Format maila nije validan<br>";
            $greska = true;
        }
        if ($greska == false) {
            $korisnikID = 1;
            $sqlUpit = "Insert into Korisnik values(default,'$telefon', '$korIme', '$lozinka', '$ime', '$prezime', '$mail', default, '$datum', default, $korisnikID)";
            $rezultat = $baza->ostaliUpiti($sqlUpit);
            $randomKod = rand(100000, 999999);
            if (isset($rezultat)) {
                $sqlUpit = "Select * from Korisnik where Username='$korIme'";
                $rezultati = $baza->selectUpit($sqlUpit);
                $rezultat = mysqli_fetch_array($rezultati);
                $idTrenutnogKorisnika = $rezultat['idKorisnik'];
                $mail = $rezultat['Email'];
                $sqlUpit = "Insert into AktivacijskiKod values(default, '$randomKod', $idTrenutnogKorisnika)";
                $baza->ostaliUpiti($sqlUpit);
                $to = $mail;
                $subject = 'Aktivacija racuna';
                $message = 'Poštovani, ovo je Vaš aktivacijski kod. Cuvajte ga!' . $randomKod;
                mail($to, $subject, $message);
                echo "Pri slijedećoj prijavi aktivirajte račun sa aktivacijskim kodom.";
                $upit = "Insert into Akciju_izvrsio(ID_IzvrsavanjaAkcije,ID_Akcije,ID_Korisnika,Datum_obavljanja) values (default,1," . $idTrenutnogKorisnika . ",'" . date("Y-m-d H:i:s") . "')";
                $baza->ostaliUpiti($upit);
                $upit = "Select * from Akcija where idAkcije=1";
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $bodovi = $rezultat["Broj_bodova"];
                $upit = "Update Korisnik set Broj_bodova=Broj_bodova+" . $bodovi . " where idKorisnik=" . $idTrenutnogKorisnika;
                $baza->ostaliUpiti($upit);
                $upit = "Insert into jeIzvrsio (ID_izvrseneRadnje, ID_korisnika, ID_radnje, Datum) values (default,".$idTrenutnogKorisnika.",1,'".date("Y-m-d H:i:s")."')";
                $baza->ostaliUpiti($upit);
            }
        } else {
            
        }
    }
}
?>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
            $("#izbornik").load("Izbornik-neregistrirani.html"); 
        });
        </script>
        <script type="text/javascript" src="taxi_jquery.js"></script>
        <script type="text/javascript" src="javascript.js"></script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="content-box-registration">
            <form class="captcha-form" style="margin-top:100px;" method="post" action="">
                <?php
                require_once('recaptcha-php-1.11/recaptchalib.php');
                $publickey = "6Lf1QiYUAAAAAGIMSbD76DAhcm3WE_pFWqeo35cg"; // you got this from the signup page
                echo recaptcha_get_html($publickey);
                ?>
                <p class="captcha-info"><?php 
                if($captchaTocna == true){
                    echo "Captcha tocna! Nastavite s registracijom. ";
                }else{
                    echo "Prvo tocno unesite captchu da bi nastavili s registracijom";
                   }
                    ?></p>
                <input value="Captcha submit" type="submit" <?php if($captchaTocna == true){
                    echo "disabled";
                }?>/>
            </form>
            <div class='error-block'>
                <b id="php-provjera"><?php if($greska==true){
                    echo "serverska validacija nije prosla!";
                }?></b>
                <b id='error-information'></b>
            </div>
            <form class="registration-form" onsubmit="return(ProvjeriPrvaSlovaUImenuIPrezimenu() & ProvjeriDuljinuKorisnickogImena() & ProvjeriStrukturuLozinke() & ProvjeriJednakostLozinki() & ProvjeriVrijeme()) === 1" method="post" action="">
                <div id="registration-block">
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Ime</p>
                        <input id="input-ime" name="input-name-ime" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Prezime</p>
                        <input id="input-prezime" name="input-name-prezime" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Korisnicko ime</p>
                        <input id="input-korIme" name="input-name-korIme" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Lozinka</p>
                        <input id="input-lozinka" name="input-name-lozinka" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Potvrda lozinke</p>
                        <input id="input-potvrda" name="input-name-potvrda" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">E-mail</p>
                        <input id="input-mail" name="input-name-mail" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Datum rođenja</p>
                        <input id="input-datum-rodenja" name="input-name-datum" type="text"/>
                    </div>
                    <div class="registration-mini-block">
                        <p style="font-size:13px;">Broj telefona</p>
                        <input id="input-telefon" name="input-name-telefon" type="text"/>
                    </div>
                    <div class="submit-mini-block">
                        <input id="input-registracija-submit" name="input-name-registracija" type="submit" <?php if($captchaTocna == false){
                    echo "disabled";
                }?>/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
