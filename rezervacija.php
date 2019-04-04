<?php
include 'baza.class.php';
$baza = new Baza();
$brojac = 0;
$brojacUlica = 0;
$vidljivost = false;
$idPodrucjaZaRezervaciju = 0;
$ImePodrucja = null;
$baza->spajanjeNaBazu();
include 'sesija.php';
$sesija = new Sesija();
$idTrenutnogKorisnika = $sesija->provjeriSesiju();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if(!empty($_POST)){
    $vidljivost = true;
    if(isset($_POST['radio-input-podrucje'])){
        $idPodrucjaZaRezervaciju = $_POST['radio-input-podrucje'];
        $sqlUpit = "Select * from Ulica where idPodrucja=$idPodrucjaZaRezervaciju";
        $rezultati = $baza->selectUpit($sqlUpit);
        $idUlice = array();
        $imenaUlica = array();
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $idUlice[] = $rezultat['idUlica'];
            $imenaUlica[] = $rezultat['Ime_ulice'];
            $brojacUlica++;
        }
        
        $upit = "Select * from Podrucje where idPodrucje=$idPodrucjaZaRezervaciju";
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $ImePodrucja = $rezultat['Ime_podrucja'];
        
    }else{
        $polaznaUlica = $_POST['radio-input-ulica'];
        $datumVoznje = $_POST['input-datum'];
        $praviDatum = date("Y-m-d", strtotime($datumVoznje));
        $odredisnaUlica = $_POST['odredisna-ulica'];
        $idPodrucjaZaKreiranjeRezervacije = $_POST['idPodrucjaRezervacije'];
        $upit = "Insert into Rezervacija values (default,$idPodrucjaZaKreiranjeRezervacije,'$praviDatum',$polaznaUlica,'$odredisnaUlica',default,default,default,default)";
        $baza->ostaliUpiti($upit);
        sleep(2);
        $upit = "Select * from Rezervacija where id_podrucje=".$idPodrucjaZaKreiranjeRezervacije." and Datum_voznje='$praviDatum' and Ulica_polaska=".$polaznaUlica." and Ulica_odredista='$odredisnaUlica' and VoznjaOdradena=0 and RezervacijaOdbijena=0 and Rezervacija_prihvacena=0";
        echo $upit;
        $rezultati = $baza->selectUpit($upit);
        while($rezultat = mysqli_fetch_array($rezultati)){
            $idKreiraneRezervacie = $rezultat["idRezervacija"];
            $upit = "Insert into JeRezervirao (ID_Rezerviranja, ID_korisnika, ID_rezervacije) values (default,".$idTrenutnogKorisnika.",".$idKreiraneRezervacie.")";
            $baza->ostaliUpiti($upit);
            $upit = "Insert into jeIzvrsio (ID_izvrseneRadnje, ID_korisnika, ID_radnje, Datum) values (default,".$idTrenutnogKorisnika.",3,'".date("Y-m-d H:i:s")."')";
            $baza->ostaliUpiti($upit);
        }
        $upit = "Select * from Akciju_izvrsio where ID_Korisnika=".$idTrenutnogKorisnika;
        $rezultati = $baza->selectUpit($upit);
        $unosAkcije = true;
        while($rezultat = mysqli_fetch_array($rezultati)){
            $idTrenutneAkcije = $rezultat["ID_Akcije"];
            if($idTrenutneAkcije == 3){
                $unosAkcije = false;
            }
        }
        if($unosAkcije == true){
            $datum = date("Y-m-d H:i:s");
            $upit = "Insert into Akciju_izvrsio (ID_IzvrsavanjaAkcije,ID_Akcije,ID_Korisnika,Datum_obavljanja) values (default,3,".$idTrenutnogKorisnika.",'".$datum."')";
            $baza->ostaliUpiti($upit);
            sleep(1);
            $upit = "Select * from Akciju_izvrsio where Datum_obavljanja='".$datum."'";
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $IDakcije = $rezultat["ID_Akcije"];
            $upit = "Select * from Akcija where idAkcije=".$IDakcije;
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $bodovi = $rezultat["Broj_bodova"];
            $upit = "Update Korisnik set Broj_bodova=Broj_bodova+".$bodovi." where idKorisnik=".$idTrenutnogKorisnika;
            $baza->ostaliUpiti($upit);
        }
    }
}
$upit = "Select * from Podrucje";
$rezultati = $baza->selectUpit($upit);
$idPodrucja = array();
$imenaPodrucja = array();
while ($rezultat = mysqli_fetch_array($rezultati)) {
    $idPodrucja[] = $rezultat['idPodrucje'];
    $imenaPodrucja[] = $rezultat['Ime_podrucja'];
    $brojac++;
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
        <div class="content" style="height: 700px">
            <div id='ulica-block'>
                <title>Kreiranje ulica</title>
            </div>
            <div id="tekst">
                Poštovani,<br>
                Nalazite se na formi za rezervaciju prijevoza. Molimo, unesite podatke u formu.
            </div>
            <form class="forma-prijava-podrucja" method="post" action="">
                <b>Odaberite podrucje</b><br>
                <?php
                for ($i = 0; $i < $brojac; $i++) {
                    echo "<input name='radio-input-podrucje' value='$idPodrucja[$i]' type='radio'>" . $imenaPodrucja[$i] . "<br>";
                }
                ?>
                <input name="preuzmi_podatke_za_podrucje" value="1. Potvrda podrucja" type="submit"/>
            </form>
            <form class="form-rezervacija" method="post" action="" <?php
            if (!isset($_POST["preuzmi_podatke_za_podrucje"])) {
                echo "style='visibility:hidden'";
            }?>>
            <?php
                if ($vidljivost == true) {
                    echo "<b>Odabrali ste Podrucje: " . $ImePodrucja . "<br>";
                    for ($i = 0; $i < $brojacUlica; $i++) {
                        echo "<input name='radio-input-ulica' value='$idUlice[$i]' type='radio'>" . $imenaUlica[$i] . "<br>";
                    }
                    if ($brojacUlica == 0) {
                        echo "<p>Nazalost jos nema polazisnih ulica za ovo podrucje.</p>";
                    } else {
                        echo "<input name='idPodrucjaRezervacije' value='$idPodrucjaZaRezervaciju' type='hidden'/>";
                        echo "<input name='input-datum' type='date'/><br>";
                        echo "<b>Unesite odredisnu adresu</b><br>";
                        echo "<input name='odredisna-ulica' type='text'/>";
                        echo "<input class='button-submit-podrucje' value='Rezervacija' type='submit'/>";
                    }
                }
            ?>
            </form>
        </div>
        
    </body>
</html>

