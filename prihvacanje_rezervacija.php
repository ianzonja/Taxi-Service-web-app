<?php
include 'baza.class.php';
include 'sesija.php';
$sesija = new Sesija();
$idRezervacije = array();
$baza = new Baza();
$baza->spajanjeNaBazu();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 1 && $uloga == 4){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if (empty($_GET)) {
    $upit = "Select * from Rezervacija where VoznjaOdradena=0 and RezervacijaOdbijena=0 and Rezervacija_prihvacena=0";
    $rezultati = $baza->selectUpit($upit);
    
    $idPodrucja = array();
    $datumiRezerviranja = array();
    $idUlicePolaska = array();
    $UliceOdredista = array();
    while ($rezultat = mysqli_fetch_array($rezultati)) {
        $idRezervacije[] = $rezultat['idRezervacija'];
        $idPodrucja[] = $rezultat['id_podrucje'];
        $datumiRezerviranja[] = $rezultat['Datum_voznje'];
        $idUlicePolaska[] = $rezultat['Ulica_polaska'];
        $UliceOdredista[] = $rezultat['Ulica_odredista'];
    }
    $UlicePolazista = array();
    for ($i = 0; $i < count($idUlicePolaska); $i++) {
        $upit = "Select * from Ulica where idUlica=" . $idUlicePolaska[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $UlicePolazista[] = $rezultat['Ime_ulice'];
    }
    $ImenaPodrucja = array();
    for ($i = 0; $i < count($idUlicePolaska); $i++) {
        $upit = "Select * from Podrucje where idPodrucje=" . $idPodrucja[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $ImenaPodrucja[] = $rezultat['Ime_podrucja'];
    }
}

if(!empty($_POST)) {
    if (isset($_POST['btn-prihvati'])) {
        for ($i = 0; $i < count($idRezervacije); $i++) {

            if (isset($_POST["input-prihvati-ili-odbij" . $idRezervacije[$i]])) {
                $upit = "Update Rezervacija set Rezervacija_prihvacena=1 where idRezervacija=" . $idRezervacije[$i];
                $rezultati = $baza->ostaliUpiti($upit);
                if (isset($rezultati)) {
                    $upit = "Select * from JeRezervirao where ID_rezervacije=" . $idRezervacije[$i];
                    $rezultati = $baza->selectUpit($upit);
                    $rezultat = mysqli_fetch_array($rezultati);
                    $idKorisnikaKojiJeRezervirao = $rezultat['ID_korisnika'];
                    $upit = "Select * from Korisnik where idKorisnik=" . $idKorisnikaKojiJeRezervirao;
                    echo $idKorisnikaKojiJeRezervirao;
                    if (isset($idKorisnikaKojiJeRezervirao)) {
                        $rezultati = $baza->selectUpit($upit);
                        $rezultat = mysqli_fetch_array($rezultati);
                        $mailKorisnika = $rezultat['Email'];
                        $subject = 'Aktivacija racuna';
                        $message = 'Poštovani, obavještavamo Vas da Vam je rezervacija prihvacena!';
                        mail($mailKorisnika, $subject, $message);
                    }
                }
            }
        }
    } else {
        for ($i = 0; $i < count($idRezervacije); $i++) {
            
            if (isset($_POST["input-prihvati-ili-odbij" . $idRezervacije[$i]])) {
                $upit = "Update Rezervacija set RezervacijaOdbijena=1 where idRezervacija=" . $idRezervacije[$i];
                $rezultati = $baza->ostaliUpiti($upit);
                $upit = "Select * from JeRezervirao where ID_rezervacije=" . $idRezervacije[$i];
                $rezultati = $baza->selectUpit($upit);
                if (isset($rezultati)) {
                    $rezultat = mysqli_fetch_array($rezultati);
                    $idKorisnikaKojiJeRezervirao = $rezultat['ID_korisnika'];
                    if (isset($idKorisnikaKojiJeRezervirao)) {
                        $upit = "Select * from Korisnik where idKorisnik=" . $idKorisnikaKojiJeRezervirao;
                        $rezultati = $baza->selectUpit($upit);
                        if (isset($rezultati)) {
                            $rezultat = mysqli_fetch_array($rezultati);
                            $mailKorisnika = $rezultat['Email'];
                            $subject = 'Aktivacija racuna';
                            $message = 'Poštovani, obavještavamo Vas da Vam je rezervacija odbijena!';
                            mail($mailKorisnika, $subject, $message);
                        }
                    }
                }
            }
        }
    }
    
    
    
    $upit = "Select * from Rezervacija where VoznjaOdradena=0 and RezervacijaOdbijena=0 and Rezervacija_prihvacena=0";
    $rezultati = $baza->selectUpit($upit);
    
    $idPodrucja = array();
    $datumiRezerviranja = array();
    $idUlicePolaska = array();
    $UliceOdredista = array();
    while ($rezultat = mysqli_fetch_array($rezultati)) {
        $idRezervacije[] = $rezultat['idRezervacija'];
        $idPodrucja[] = $rezultat['id_podrucje'];
        $datumiRezerviranja[] = $rezultat['Datum_voznje'];
        $idUlicePolaska[] = $rezultat['Ulica_polaska'];
        $UliceOdredista[] = $rezultat['Ulica_odredista'];
    }
    $UlicePolazista = array();
    for ($i = 0; $i < count($idUlicePolaska); $i++) {
        $upit = "Select * from Ulica where idUlica=" . $idUlicePolaska[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $UlicePolazista[] = $rezultat['Ime_ulice'];
    }
    $ImenaPodrucja = array();
    for ($i = 0; $i < count($idUlicePolaska); $i++) {
        $upit = "Select * from Podrucje where idPodrucje=" . $idPodrucja[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $ImenaPodrucja[] = $rezultat['Ime_podrucja'];
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
            $("#izbornik").load("Izbornik-registrirani.html"); 
        });
        </script>
        <?php if($uloga==3){
            echo "<script>";
            echo "$(function(){
            $('#moderatorIzbornik').load('administrator_izbornik.html'); 
            });";
            echo "</script>";
        }else if($uloga==2){
            echo "<script>";
            echo "$(function(){
            $('#moderatorIzbornik').load('moderator_izbornik.html'); 
            });";
            echo "</script>";
        }
        ?>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top"></div>
        <div class="content" style="height: 1500px">
            <form id="forma-pregled-rezervacija" method="post" action="">
                <?php
                for ($i = 0; $i < count($ImenaPodrucja); $i++) {
                    echo "<div class='rezervacija-block'>";
                    echo "<h1>Rezervacija broj " . $idRezervacije[$i] . " za podrucje: " . $ImenaPodrucja[$i] . "</h1><br>";
                    echo "<b>Datum rezervacije: </b><i>" . $datumiRezerviranja[$i] . "</i><br>";
                    echo "<b>Ulica polazista: </b><i>" . $UlicePolazista[$i] . "</i><br>";
                    echo "<b>Ulica odredista: </b><i>" . $UliceOdredista[$i] . "</i><br>";
                    echo "<input name='input-prihvati-ili-odbij".$idRezervacije[$i]."' value='".$idRezervacije[$i]."' type='checkbox'/>";
                    echo "</div>";
                }
                if(count($ImenaPodrucja) == 0){
                    echo "<p>Nema novih rezervacija!</p>";
                }
                ?>
                <input id="btn-submit" name="btn-prihvati" value="Prihvati" type="submit"/>
                <input id="btn-submit" name="btn-odbij" value="Odbij" type="submit"/>
            </form>
        </div>
        
    </body>
</html>