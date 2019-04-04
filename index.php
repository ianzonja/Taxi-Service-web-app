<?php
include 'baza.class.php';
include 'sesija.php';
$prihvatiUvjete = false;
if(isset($_POST["uvjeti-koristenja-input"]) && !isset($_COOKIE["uvjeti_koristenje"])){
    setcookie("uvjeti_koristenje","Uvjeti koristenja lorem ispum",60*60*24*3, "/");
}
if(!isset($_COOKIE['uvjeti_koristenje'])){
    //$prihvatiUvjete = true;
}
setcookie("cookieZaUnose", 0);
$baza = new Baza();
if(isset($_COOKIE['korisnicko_ime'])){
    unset($_COOKIE['korisnicko_ime']);
}
if(isset($_SESSION['KORIME'])){
    unset($_SESSION);
}
$sesija = new Sesija();
$sesija->bSesija();
if (!empty($_POST) && $prihvatiUvjete == false) {
    $baza->spajanjeNaBazu();
    if (isset($_POST['zabor-lozin'])) {
    }else {
            if (isset($_POST['prijava'])) {
                $korIme = $_POST['user-login'];
                $lozinka = $_POST['pass-login'];
                $sqlUpit = "Select * from Korisnik where Username='$korIme'";
                $rezultati = $baza->ostaliUpiti($sqlUpit);
                $rezultat = mysqli_fetch_array($rezultati);
                $idTrenutnogKorisnika = $rezultat['idKorisnik'];
                $mail = $rezultat['Email'];
                $lozinkaTrenutnogKorisnika = $rezultat['Password'];
                if($lozinka == $lozinkaTrenutnogKorisnika){
                    $sqlUpit = "Select * from Korisnik where Username='$korIme'";
                    $rezultati = $baza->ostaliUpiti($sqlUpit);
                    $rezultat = mysqli_fetch_array($rezultati);
                    $korisnikZakljucan = $rezultat['KorisnikZakljucan'];
                    $vrstaKorisnikaID = $rezultat['Vrsta_korisnika_idVrsta_korisnika'];
                    if($korisnikZakljucan == 0){
                        $sqlUpit = "Select * from AktivacijskiKod where ID_korisnika=$idTrenutnogKorisnika";
                        $rezultati = $baza->ostaliUpiti($sqlUpit);
                        $rezultat = mysqli_fetch_array($rezultati);
                        $randomKod = $rezultat["Kod"];
                        if(isset($rezultat) && !isset($_POST["dvakoraka-login"])){
                            $adresa = "aktivacija_racuna.php?korIme='$korIme'&vrstaAktivacije='AktivacijaRegistranogRacuna'";
                            header("Location: $adresa");
                            exit();
                        }
                        echo "Prijava uspjesna";
                        $upit = "Insert into jeIzvrsio (ID_izvrseneRadnje, ID_korisnika, ID_radnje, Datum) values (default,".$idTrenutnogKorisnika.",2,'".date("Y-m-d H:i:s")."')";
                        $baza->ostaliUpiti($upit);
                        $upit = "Select * from Akciju_izvrsio where ID_korisnika=".$idTrenutnogKorisnika;
                        $rezultati = $baza->selectUpit($upit);
                        $unesiSpecificnuAkciju = true;
                        while($rezultat = mysqli_fetch_array($rezultati)){
                           $idIzvrseneAkcije = $rezultat["ID_Akcije"];
                           if($idIzvrseneAkcije == 2){
                               $unesiSpecificnuAkciju = false;
                           }
                        }
                        if($unesiSpecificnuAkciju == true){
                            $upit = "Insert into Akciju_izvrsio (ID_IzvrsavanjaAkcije, ID_akcije, ID_Korisnika, Datum_obavljanja) values (default,2,".$idTrenutnogKorisnika.",'".date("Y-m-d H:i:s")."')";
                            $baza->ostaliUpiti($upit);
                            $upit = "Select * from Akcija where idAkcije=2";
                            $rezultati=$baza->selectUpit($upit);
                            $rezultat = mysqli_fetch_array($rezultati);
                            $bodovi = $rezultat["Broj_bodova"];
                            $upit = "Update Korisnik set Broj_bodova=Broj_bodova+".$bodovi." where idKorisnik=".$idTrenutnogKorisnika;
                            $baza->ostaliUpiti($upit);
                        }
                        $sesija->kSesija($vrstaKorisnikaID, $idTrenutnogKorisnika, $korIme);
                        setcookie("korisnicko_ime", $korIme);
                        if(isset($_POST["dvakoraka-login"])){
                            $randomKod = rand(100000, 999999);
                            $sqlUpit = "Insert into AktivacijskiKod (ID_koda, Kod, ID_korisnika) values (default, $randomKod, $idTrenutnogKorisnika)";
                            $baza->ostaliUpiti($sqlUpit);
                            sleep(1);
                            $sqlUpit = "Select * from AktivacijskiKod where ID_korisnika='$idTrenutnogKorisnika'";
                            $rezultati = $baza->selectUpit($sqlUpit);
                            if(sizeof($rezultati) > 0){
                                $to = $mail;
                                $subject = 'Aktivacija racuna';
                                $message = 'Poštovani, ovo je Vaš aktivacijski kod. Cuvajte ga!' . $randomKod;
                                mail($to, $subject, $message);
                                $adresa = "aktivacija_racuna.php?korIme='$korIme'&vrstaAktivacije='PrijavaDvaKoraka'";
                                header("Location: $adresa");
                                exit();
                            }
                            else{
                                echo "Nema koda u bazi, pokusajte ponovo";
                            }
                        }
                        
                        $adresa = "Pocetna.php";
                        var_dump($_SESSION);
                        header("location: $adresa");
                        exit();
                    }
                    else{
                        echo "Korisnik je zaključan";
                    }
                }
                else{
                    echo "Prijava neuspjesna, password pogresan";
                    setcookie("cookieZaUnose", $_COOKIE["cookieZaUnose"] + 1);
                    if ($_COOKIE["cookieZaUnose"] == 2) {
                        echo "Krivi unos 3 puta, korisnik je zakljucan";
                        $upit = "Update Korisnik set KorisnikZakljucan=1 where Username='$korIme'";
                        $baza->ostaliUpiti($upit);
                        echo "Korisnik zakljucan zbog 3 neuspjesne prijave";
                    }
                }
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
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script> 
        $(function(){
            $("#izbornik").load("Izbornik-neregistrirani.html"); 
        });
        </script>
        <script type="text/javascript" src="loginjs.js"></script>
    </head>
    <body>
        <div id="izbornik"></div>
        <div id="content-box-login" style="margin-top:150px">
            <div id="error-information"></div>
            <form onsubmit="return ProvjeriDopustenjeSubmita()" class="login-form" id="login-forma" method="post" action="" <?php if($prihvatiUvjete==true){
                echo "style='visibility:hidden'";
            }?>>
                <div id="login-box">
                    <div class="login-mini-block">
                        <p>Username</p>
                        <input class="input-username" id="login-user" name="user-login" type="text"/>
                    </div>
                    <div class="login-mini-block">
                        <p>Password</p>
                        <input class="input-password" id="login-pass" name="pass-login" type="text"/>
                    </div>
                    <div class="prijava-dva-koraka">
                        <p class="prijavadvakoraka">Prijava 2 koraka</p>
                        <input class="input-prijavadvakoraka" name="dvakoraka-login" type="radio">
                    </div>
                </div>
                <input class="prijava" name="prijava" style="margin-left:60%" value="Prijava" type="submit"/>
            </form>
            <form class='zab-loz' method="post" action="zaboravljena_lozinka.php" <?php if($prihvatiUvjete==true){
                echo "style='visibility:hidden'";
            }?>>
                <input class="zab-loz" name="zabor-lozin" style="margin-left:60%" value="Zaboravio sam lozinku" type="submit"/>
            </form>
            <form class="forma-uvjeti" method="post" action="" <?php if($prihvatiUvjete==false){
                echo "style='visibility:hidden'";
            }?>>
                <p class="uvjeti-koristenja">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                <input class="input-uvjeti-koristenja" name="uvjeti-koristenja-input" type="submit"/>
            </form>
        </div>
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/hr_HR/sdk.js#xfbml=1&version=v2.9&appId=239496469887299";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        </script>
        <div class="fb-share-button" data-href="http://webdip.barka.foi.hr/2016_projekti/WebDiP2016x131/index.php" data-layout="button_count" data-size="small" data-mobile-iframe="true">
            <a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwebdip.barka.foi.hr%2F2016_projekti%2FWebDiP2016x131%2Findex.php&amp;src=sdkpreparse">Podijeli</a>
        </div>
    </body>
</html>
