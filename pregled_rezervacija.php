<?php
include 'baza.class.php';
$idRezervacije = array();
include 'sesija.php';
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 1 && $uloga == 4){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if (empty($_GET)) {
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

if (!empty($_POST)) {
    $idVozila = array();
    $idRezervacijeZaKojuTrebaDodatVozilo = 0;
    for ($i = 0; $i < count($idRezervacije); $i++) {
        if (isset($_POST["input-odradeno".$idRezervacije[$i]]) && !isset($_POST["btn-upisivanje-voznje"])) {
            $idRezervacijeZaKojuTrebaDodatVozilo = $_POST["input-odradeno".$idRezervacije[$i]];
            $baza = new Baza();
            $upit = "Select * from Vozilo";
            $rezultati = $baza->selectUpit($upit);
            while ($rezultat = mysqli_fetch_array($rezultati)) {
                $idVozila[] = $rezultat['ID_taxija'];
            }
            setcookie("Zapamcena_rezervacija", $idRezervacijeZaKojuTrebaDodatVozilo);
        } 
    }
    if (isset($_POST["btn-upisivanje-voznje"])) {
        for ($i = 0; $i < count($idRezervacije); $i++) {
            if ($_COOKIE["Zapamcena_rezervacija"] == $idRezervacije[$i]) {
                $upit = "Update Rezervacija set VoznjaOdradena=1 where idRezervacija=" . $idRezervacije[$i];
                $rezultati = $baza->ostaliUpiti($upit);
                $idVozila = $_POST["vozilo"];
                $datumIVrijeme = date("Y-m-d H:i:s");
                $upit = "Insert into Voznja values (default, $idVozila, $idRezervacije[$i], '$datumIVrijeme')";
                echo $upit;
                $rezultati = $baza->ostaliUpiti($upit);
                $upit = "Select * from JeRezervirao where ID_rezervacije=".$idRezervacije[$i];
                echo $upit;
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $IDkorisnikaIzBaze = $rezultat["ID_korisnika"];
                if(isset($IDkorisnikaIzBaze)){
                    $upit = "Insert into Akciju_izvrsio (ID_IzvrsavanjaAkcije,ID_Akcije,ID_Korisnika,Datum_obavljanja) values (default,4," . $IDkorisnikaIzBaze . ",'" . date("Y-m-d H:i:s") . "')";
                    $baza->ostaliUpiti($upit);
                    $upit = "Select * from Akcija where idAKcije=4";
                    $rezultati = $baza->selectUpit($upit);
                    $rezultat = mysqli_fetch_array($rezultati);
                    $bodovi = $rezultat["Broj_bodova"];
                    $upit = "Update Korisnik set Broj_bodova=Broj_bodova+" . $bodovi . " where idKorisnik=" . $IDkorisnikaIzBaze;
                    $baza->ostaliUpiti($upit);
                    $upit = "Insert into jeIzvrsio (ID_izvrseneRadnje, ID_korisnika, ID_radnje, Datum) values (default," . $IDkorisnikaIzBaze . ",4,'" . date("Y-m-d H:i:s") . "')";
                    $baza->ostaliUpiti($upit);
                }
            }
        }
        unset($_COOKIE["Zapamcena_rezervacija"]);

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
                    echo "<button id='button-input-rezervacije' name='input-odradeno".$idRezervacije[$i]."' value='".$idRezervacije[$i]."' type='submit'>Voznja odrađena</button>";
                    if(isset($idRezervacijeZaKojuTrebaDodatVozilo)){
                            if($idRezervacijeZaKojuTrebaDodatVozilo == $idRezervacije[$i]){
                                echo "<select name='vozilo'>";
                                for($k=0; $k<count($idVozila); $k++)
                                {
                                    echo "<option value='".$idVozila[$k]."'>Broj vozila: ".$idVozila[$k]."</option>";
                                }
                                echo "</select>";
                            }
                    }
                    echo "</div>";
                }
                if(count($ImenaPodrucja) == 0){
                    echo "<h1>Nažalost, nema novih stavki ili niste dodijeljeni niti jednom području.</h1>";
                }
                ?>
                <input id="btn-submit" name="btn-upisivanje-voznje" value="Upiši odrađenu vožnju" type="submit"/>
            </form>
        </div>
        
    </body>
</html>

