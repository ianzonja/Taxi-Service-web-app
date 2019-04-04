<?php
include 'baza.class.php';
include 'sesija.php';
$idRezervacije = array();
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 2 || $uloga == 3){
    $idUsera = $sesija->provjeriSesiju();
$idRezervacije = array();
$datumi = array();
$ulicePolaska = array();
$uliceDolaska = array();
$PovratneInformacije = array();
$idKorisnici = array();
$ispravneStavke = array();
$sredeniKorisnici = array();
$sredeneidRezervacije = array();
$idPodrucja = array();
$imenaPodrucja = array();
$sredeniDatumi = array();
$sredeneulicePolaska = array();
$sredeneuliceDolaska = array();
    $sredenePovratneInformacije = array();
    $sredenaPodrucja = array();
    $opetKorisnici = array();
    $opetidRezervacije = array();
    if ($sesija->dohvatiUlogu() == 2 || $sesija->dohvatiUlogu() == 3) {
        $baza = new Baza();
        $baza->spajanjeNaBazu();
        $upit = "Select * from JeRezervirao";
        $rezultati = $baza->selectUpit($upit);
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $idKorisnici[] = $rezultat["ID_korisnika"];
            $idRezervacije[] = $rezultat["ID_rezervacije"];
        }

        for ($i = 0; $i < count($idKorisnici); $i++) {
            $upit = "Select * from Rezervacija where idRezervacija=" . $idRezervacije[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            if ($rezultat["VoznjaOdradena"] == 1) {
                $idRezervacije[] = $rezultat["idRezervacija"];
                $datumi[] = $rezultat["Datum_voznje"];
                $ulicePolaska[] = $rezultat["Ulica_polaska"];
                $uliceDolaska[] = $rezultat["Ulica_odredista"];
                $PovratneInformacije[] = $rezultat["Povratna_informacija"];
                $idPodrucja[] = $rezultat["id_podrucje"];
                $ispravneStavke[] = true;
            } else {
                $ispravneStavke[] = false;
            }
        }

        for ($i = 0; $i < count($idKorisnici); $i++) {
            if ($ispravneStavke[$i] == true) {
                $sredeniKorisnici[] = $idKorisnici[$i];
                $sredeneidRezervacije[] = $idRezervacije[$i];
            }
        }
        $isponovaIspravne = array();
        for ($i = 0; $i < count($idPodrucja); $i++) {
            $upit = "Select * from Podrucje where idPodrucje=" . $idPodrucja[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            if ($rezultat["idAdministratora"] != $idUsera) {
                $isponovaIspravne[$i] = false;
            } else {
                $isponovaIspravne[$i] = true;
            }
        }
        for ($i = 0; $i < count($idPodrucja); $i++) {
            if ($isponovaIspravne[$i] == true) {
                $sredeniDatumi[] = $datumi[$i];
                $sredeneuliceDolaska[] = $uliceDolaska[$i];
                $sredeneulicePolaska[] = $ulicePolaska[$i];
                $sredenePovratneInformacije[] = $PovratneInformacije[$i];
                $opetKorisnici[] = $sredeniKorisnici[$i];
                $opetidRezervacije[] = $sredeneidRezervacije[$i];
                $sredenaPodrucja[] = $idPodrucja[$i];
            }
        }

        for ($i = 0; $i < count($sredenaPodrucja); $i++) {
            $upit = "Select * from Podrucje where idPodrucje=" . $sredenaPodrucja[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $imenaPodrucja[] = $rezultat["Ime_podrucja"];
        }
    }
}else{
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}

$velicinaEkrana = 200 + count($sredeniDatumi) * 200;
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
        <div class="content" style="<?php echo $velicinaEkrana ?>px">
            <form id="forma-pregled-rezervacija" method="post" action="">
                <?php
                for ($i = 0; $i < count($sredeneuliceDolaska); $i++) {
                    echo "<div class='rezervacija-block'>";
                    echo "<h1>Rezervacija broj " . $opetidRezervacije[$i] . " od korisnika: " . $opetKorisnici[$i] . "</h1><br>";
                    echo "<h5>Podrucje: ".$imenaPodrucja[$i]."</h5>";
                    echo "<b>Datum rezervacije: </b><i>" . $sredeniDatumi[$i] . "</i><br>";
                    echo "<b>Ulica polazista: </b><i>" . $sredeneulicePolaska[$i] . "</i><br>";
                    echo "<b>Ulica odredista: </b><i>" . $sredeneuliceDolaska[$i] . "</i><br>";
                    if($sredenePovratneInformacije[$i] == null){
                        echo "<b>Povratna informacija: </b><i> Nije unesena</i><br>";
                    }else{
                        echo "<b>Povratna informacija: </b><i>". $sredenePovratneInformacije[$i] . "</i><br>";
                    }
                    echo "</div>";
                }
                ?>
            </form>
        </div>
        
    </body>
</html>