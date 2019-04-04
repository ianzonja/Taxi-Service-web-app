<?php
include 'baza.class.php';
include 'sesija.php';
$idRezervacije = array();
$sesija = new Sesija();
$baza = new Baza();
$baza->spajanjeNaBazu();
$uloga = $sesija->dohvatiUlogu();
$idTrenutnogKorisnika = $sesija->provjeriSesiju();
echo $idTrenutnogKorisnika;
$upit = "Select * from JeRezervirao where ID_korisnika=" . $idTrenutnogKorisnika;
$rezultati = $baza->selectUpit($upit);
while ($rezultat = mysqli_fetch_array($rezultati)) {
    $idRezervacije[] = $rezultat['ID_rezervacije'];
}
if($sesija ->dohvatiUlogu() == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
$idPodrucja = array();
$datumiRezerviranja = array();
$idUlicePolaska = array();
$UliceOdredista = array();
$UlicePolazista = array();
$ImenaPodrucja = array();
$voznjeOdradene = array();
$rezervacijeOdbijene = array();
$rezervacijePrihvacene = array();
for ($i = 0; $i < count($idRezervacije); $i++) {
    $upit = "Select * from Rezervacija where idRezervacija=" . $idRezervacije[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $idPodrucja[] = $rezultat['id_podrucje'];
    $datumiRezerviranja[] = $rezultat['Datum_voznje'];
    $idUlicePolaska[] = $rezultat['Ulica_polaska'];
    $UliceOdredista[] = $rezultat['Ulica_odredista'];
    $voznjeOdradene[] = $rezultat['VoznjaOdradena'];
    $rezervacijeOdbijene[] = $rezultat['RezervacijaOdbijena'];
    $rezervacijePrihvacene[] = $rezultat['Rezervacija_prihvacena'];
    $upit = "Select * from Ulica where idUlica=" . $idUlicePolaska[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $UlicePolazista[] = $rezultat['Ime_ulice'];
    $upit = "Select * from Podrucje where idPodrucje=" . $idPodrucja[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $ImenaPodrucja[] = $rezultat['Ime_podrucja'];
}

if(!empty($_POST)){
    for($i=0; $i<count($idRezervacije); $i++){
        if(isset($_POST["input-odradeno".$idRezervacije[$i]])){
            $upit = "Update Rezervacija set VoznjaOdradena=1 where idRezervacija=".$idRezervacije[$i];
            $rezultati = $baza->ostaliUpiti($upit);
        }
    }
    
    $baza = new Baza();
    $baza->spajanjeNaBazu();
    $upit = "Select * from Rezervacija where VoznjaOdradena=0 and RezervacijaOdbijena=0 and Rezervacija_prihvacena=1";
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
        <div id="moderatorIzbornik" style="vertical-align: top">  
        </div>
        <div class="content" style="height: 1500px">
            <form id="forma-pregled-rezervacija" method="post" action="">
                <?php
                if (isset($ImenaPodrucja)) {
                    $imavoznji = false;
                    for ($i = 0; $i < count($ImenaPodrucja); $i++) {
                        if ($voznjeOdradene[$i] == 0) {
                            $imavoznji = true;
                            echo "<div class='rezervacija-block'>";
                            echo "<h1>Rezervacija broj " . $idRezervacije[$i] . " za podrucje: " . $ImenaPodrucja[$i] . "</h1><br>";
                            echo "<div class='o-rezervaciji'>";
                            echo "<b>Datum rezervacije: </b><i>" . $datumiRezerviranja[$i] . "</i><br>";
                            echo "<b>Ulica polazista: </b><i>" . $UlicePolazista[$i] . "</i><br>";
                            echo "<b>Ulica odredista: </b><i>" . $UliceOdredista[$i] . "</i><br>";                           
                            echo "</div>";
                            echo "<div class='stanje-rezervacije'>";
                            if ($rezervacijeOdbijene[$i] == 1) {
                                echo "<b style='color:red'>Rezervacija odbijena</b>";
                            } elseif ($rezervacijePrihvacene[$i] == 1) {
                                echo "<b style='color:green'>Rezervacija prihvacena</b>";
                            } else {
                                echo "<b style='color:yellow'>Rezervacija jos nije obradena</b>";
                            }
                            echo "</div>";
                            echo "</div>";
                        }
                    }
                    if($imavoznji == false){
                        echo "<h1>Nažalost, nemate kreiranih rezervacija!</h1>";
                    }
                }
                ?>
            </form>
        </div>
        
    </body>
</html>
