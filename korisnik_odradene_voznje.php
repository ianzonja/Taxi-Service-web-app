<?php
include 'baza.class.php';
include 'sesija.php';
$idRezervacije = array();
$sesija = new Sesija();
$baza = new Baza();
$uloga = $sesija->dohvatiUlogu();
if ($sesija->dohvatiUlogu() >0 && $sesija->dohvatiUlogu()<4) {
        $baza->spajanjeNaBazu();
        $idTrenutnogKorisnika = $sesija->provjeriSesiju();
        echo $idTrenutnogKorisnika;
        $upit = "Select * from JeRezervirao where ID_korisnika=" . $idTrenutnogKorisnika;
        $rezultati = $baza->selectUpit($upit);
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $idRezervacije[] = $rezultat['ID_rezervacije'];
        }
        $idPodrucja = array();
        $datumiRezerviranja = array();
        $idUlicePolaska = array();
        $UliceOdredista = array();
        $UlicePolazista = array();
        $ImenaPodrucja = array();
        $voznjeOdradene = array();
        $povratneInformacije = array();
        for ($i = 0; $i < count($idRezervacije); $i++) {
            $upit = "Select * from Rezervacija where idRezervacija=" . $idRezervacije[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $idPodrucja[] = $rezultat['id_podrucje'];
            $datumiRezerviranja[] = $rezultat['Datum_voznje'];
            $idUlicePolaska[] = $rezultat['Ulica_polaska'];
            $UliceOdredista[] = $rezultat['Ulica_odredista'];
            $voznjeOdradene[] = $rezultat['VoznjaOdradena'];
            $povratneInformacije[] = $rezultat['Povratna_informacija'];
            $upit = "Select * from Ulica where idUlica=" . $idUlicePolaska[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $UlicePolazista[] = $rezultat['Ime_ulice'];
            $upit = "Select * from Podrucje where idPodrucje=" . $idPodrucja[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $ImenaPodrucja[] = $rezultat['Ime_podrucja'];
        }
}
if($sesija->dohvatiUlogu() == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}

if(!empty($_POST)){
    for($i=0; $i<count($idRezervacije); $i++){
        if(isset($_POST["input-povratna-informacija".$idRezervacije[$i]])){
            $povratna = $_POST["input-povratna-informacija".$idRezervacije[$i]];
            $upit = "Update Rezervacija set Povratna_informacija='$povratna' where idRezervacija=".$idRezervacije[$i];
            $baza->ostaliUpiti($upit);
        }
    }
    $idRezervacije = array();
    $idTrenutnogKorisnika = $sesija->provjeriSesiju();
    $upit = "Select * from JeRezervirao where ID_korisnika=" . $idTrenutnogKorisnika;
    $rezultati = $baza->selectUpit($upit);
    while ($rezultat = mysqli_fetch_array($rezultati)) {
        $idRezervacije[] = $rezultat['ID_rezervacije'];
    }
    $idPodrucja = array();
    $datumiRezerviranja = array();
    $idUlicePolaska = array();
    $UliceOdredista = array();
    $UlicePolazista = array();
    $ImenaPodrucja = array();
    $voznjeOdradene = array();
    $povratneInformacije = array();
    for ($i = 0; $i < count($idRezervacije); $i++) {
        $upit = "Select * from Rezervacija where idRezervacija=" . $idRezervacije[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $idPodrucja[] = $rezultat['id_podrucje'];
        $datumiRezerviranja[] = $rezultat['Datum_voznje'];
        $idUlicePolaska[] = $rezultat['Ulica_polaska'];
        $UliceOdredista[] = $rezultat['Ulica_odredista'];
        $voznjeOdradene[] = $rezultat['VoznjaOdradena'];
        $povratneInformacije[] = $rezultat['Povratna_informacija'];
        $upit = "Select * from Ulica where idUlica=" . $idUlicePolaska[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $UlicePolazista[] = $rezultat['Ime_ulice'];
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
        <div class="srednji-dio">
            <div id="moderatorIzbornik" style="vertical-align: top">
            </div>
            <div class="content" style="height: 1500px">
                <form id="forma-pregled-rezervacija" method="post" action="">
                    <?php
                    $voznjeNeodradene = true;
                    for ($i = 0; $i < count($ImenaPodrucja); $i++) {
                        if ($voznjeOdradene[$i] == 1) {
                            $voznjeNeodradene = false;
                            echo "<div class='rezervacija-block'>";
                            echo "<h1>Rezervacija broj " . $idRezervacije[$i] . " za podrucje: " . $ImenaPodrucja[$i] . "</h1><br>";
                            echo "<div class='o-rezervaciji'>";
                            echo "<b>Datum rezervacije: </b><i>" . $datumiRezerviranja[$i] . "</i><br>";
                            echo "<b>Ulica polazista: </b><i>" . $UlicePolazista[$i] . "</i><br>";
                            echo "<b>Ulica odredista: </b><i>" . $UliceOdredista[$i] . "</i><br>";
                            echo "</div>";
                            echo "<div class='povratna informacija'>";
                            echo "<b>Povratna informacija: </b>";
                            if ($povratneInformacije[$i] == "") {
                                echo "<input name='input-povratna-informacija" . $idRezervacije[$i] . "' type='text'/>";
                            } else {
                                echo "<i>" . $povratneInformacije[$i] . "</i>";
                            }

                            echo "</div>";
                            echo "</div>";
                        }
                    }
                    if(count($ImenaPodrucja) == 0 || $voznjeNeodradene == true){
                        echo "<h1>Nažalost, nemate još nijedan izvršen prijevoz</h1>";
                    }
                    ?>
                    <input id="btn-submit-povratna" value="Pošalji povratnu informaciju" type="submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
