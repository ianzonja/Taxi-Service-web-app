<?php
include 'sesija.php';
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
$id = $sesija->provjeriSesiju();
if($uloga < 3){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
include 'baza.class.php';
$baza = new Baza();
$upit = "Select * from Korisnik where Vrsta_korisnika_idVrsta_korisnika != 3";
$rezultati = $baza->selectUpit($upit);
$usernameoviRacuna = array();
$sifreRacuna = array();
$mailovi = array();
$stanjaRacuna = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $usernameoviRacuna[] = $rezultat["Username"];
    $sifreRacuna[] = $rezultat["idKorisnik"];
    $mailovi[] = $rezultat["Email"];
}
if (!empty($_POST)) {
    if (isset($_POST["input-promote"])) {
        $idPromotanogKorisnika = $_POST["korisnici"];
        $upit = "Update Korisnik set Vrsta_korisnika_idVrsta_korisnika=2 where idKorisnik=" . $idPromotanogKorisnika;
        $baza->ostaliUpiti($upit);
    }else{
        for ($i = 0; $i < count($sifreRacuna); $i++) {
            if (isset($_POST["checkbox" . $sifreRacuna[$i]])) {
                if (isset($_POST["input-otkljucavanje"])) {
                    $upit = "Update Korisnik set KorisnikZakljucan=0 where idKorisnik=" . $sifreRacuna[$i];
                    $baza->ostaliUpiti($upit);
                } else if (isset($_POST["input-zakljucavanje"])) {
                    $upit = "Update Korisnik set KorisnikZakljucan=1 where idKorisnik=" . $sifreRacuna[$i];
                    $baza->ostaliUpiti($upit);
                }
            }
        }
    }
}
$upit = "Select * from Korisnik where Vrsta_korisnika_idVrsta_korisnika != 3";
$rezultati = $baza->selectUpit($upit);
while($rezultat = mysqli_fetch_array($rezultati)){
    $stanjaRacuna[] = $rezultat["KorisnikZakljucan"];
}
$velicinaEkrana = 500 + count($sifreRacuna)*40;

$upit = "Select * from Korisnik where Vrsta_korisnika_idVrsta_korisnika=1";
$rezultati = $baza->selectUpit($upit);
$korisniciPromote = array();
$sifreKorisnikaPromote = array();
while($rezultat= mysqli_fetch_array($rezultati)){
    $korisniciPromote[] = $rezultat["Username"];
    $sifreKorisnikaPromote[] = $rezultat["idKorisnik"];
}

if(isset($_POST) && !isset($_POST["lijevo"]) && !isset($_POST["desno"])){
    $brojacStranica=0;
}
$brojStranica = count($sifreRacuna)/10;
if (isset($_POST["lijevo"])) {
    $brojacStranica = $_POST["lijevo"];
    if ($brojacStranica != 0) {
        $brojacStranica = $brojacStranica - 1;
    }
} else if (isset($_POST["desno"])) {
    $brojacStranica = $_POST["desno"];
    if($brojacStranica <= $brojStranica){
        $brojacStranica = $brojacStranica + 1;
    }
}
echo $brojStranica;
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
        <script type="text/javascript" src="canvas.js"></script>
        <script type="text/javascript" src="canvasLijevo.js"></script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="height:<?php echo $velicinaEkrana ?>px">
            <div class="canvas-block">
                <form id="forma-lijevo" method="post" action="">
                    <canvas id="c-lijevo" width="150" height="30" style="transform: rotate(180deg);"></canvas>
                    <input name="lijevo" type="hidden" value="<?php echo $brojacStranica?>"/>
                </form>
                <form id="forma-desno" method="post" action="">
                    <canvas id="c-desno" width="150" height="30"></canvas>
                    <input name="desno" type="hidden" value="<?php echo $brojacStranica?>"/>
                </form>
            </div>
            <form class="evidencija-form" method="post" action="">
                <div class="table-block">
                    <table class="moderator-pregled-table">
                        <tr class="kuponi_tableRow">
                            <th class="kuponi_tableSection">
                                Šifra racuna
                            </th>
                            <th class="kuponi_tableSection">
                                Korisnicko ime
                            </th>
                            <th class="kuponi_tableSection">
                                Email
                            </th>
                            <th class="kuponi_tableSection">
                                Stanje racuna
                            </th>
                            <th class="kuponi_tableSection">
                                Odabir za akciju
                            </th>
                        </tr>
                        <?php
                        for ($j = $brojacStranica * 10; $j < $brojacStranica * 10 + 11; $j++) {
                            if (isset($sifreRacuna[$j])) {
                                echo "<tr class='kuponi_tableRow'>";
                                echo "<td class='uponi_tableSection'>";
                                echo $sifreRacuna[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $usernameoviRacuna[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $mailovi[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                if ($stanjaRacuna[$j] == 0) {
                                    echo "Racun otkljucan";
                                } else {
                                    echo "Racun zakljucan";
                                }
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo "<input class='input-checkbox-odabir' name='checkbox" . $sifreRacuna[$j] . "' type='checkbox'/>";
                                echo "</td>";
                                echo "</tr>";
                            }
                        }
                        ?>
                    </table>
                </div>
                <div class="inputi-block">
                    <input class="otkljucavanje-input" name="input-otkljucavanje" value="Otkljucavanje" type="submit"/>
                    <input class="zakljucavanje-input" name="input-zakljucavanje" value="Zakljucavanje" type="submit"/>
                </div>
            </form>
            <div class="promote-block">
                <form class="promote-form" method="post">
                    <h1>Promovirajte korisnika u moderatora</h1>
                    <select name="korisnici">
                        <?php for($i=0; $i<count($sifreKorisnikaPromote); $i++){
                            echo "<option value=".$sifreKorisnikaPromote[$i].">$korisniciPromote[$i]</option>";
                        }?>
                    </select>
                    <input class="btn-submit-promote" name="input-promote" type="submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
<script>
document.getElementById("c-lijevo").onclick = function() {SubmitFormuLijevo()};

function SubmitFormuLijevo() {
    document.getElementById("forma-lijevo").submit();
}
</script>
<script>
document.getElementById("c-desno").onclick = function() {SubmitFormuDesno()};

function SubmitFormuDesno() {
    document.getElementById("forma-desno").submit();
}
</script>
