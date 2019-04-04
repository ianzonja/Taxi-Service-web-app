<?php
include 'sesija.php';
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
if($uloga != 3){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
include 'baza.class.php';
$baza = new Baza();
$upit = "Select * from Korisnik where idKorisnik=".$sesija->provjeriSesiju();
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$username = $rezultat["Username"];
$upit = "Select * from jeIzvrsio";
$rezultati = $baza->selectUpit($upit);
$idKorisnici = array();
$idRadnje = array();
$datumi = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $idKorisnici[] = $rezultat["ID_korisnika"];
    $idRadnje[] = $rezultat["ID_radnje"];
    $datumi[] = $rezultat["Datum"];
}
$imenaKorisnika = array();
for($i=0; $i<count($idKorisnici); $i++){
    $upit = "Select * from Korisnik where idKorisnik=".$idKorisnici[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $imenaKorisnika[] = $rezultat["Username"];
}

if(empty($_POST)){
    $brojacStranica=0;
}
$brojStranica = count($imenaKorisnika)/10;
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

$velicinaEkrana = 300 + 35*count($imenaKorisnika);
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
        <?php
        if ($uloga == 3) {
            echo "<script>";
            echo "$(function(){
            $('#moderatorIzbornik').load('administrator_izbornik.html'); 
            });";
            echo "</script>";
        } else if ($uloga == 2) {
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
        <div class="content" style="<?php echo "height:'$velicinaEkrana" ?>px">
            <h1>Dobrodošli, <?php echo $username ?>!</h1>
            <div class="text">
                <h1>Dnevnik</h1>
            </div>
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
            <div class="table-block">
                <table class="moderator-pregled-table">
                    <tr class="kuponi_tableRow">
                        <th class="kuponi_tableSection">
                            Username
                        </th>
                        <th class="kuponi_tableSection">
                            Radnja
                        </th>
                        <th class="kuponi_tableSection">
                            Datum
                        </th>
                    </tr>
                    <?php
                    for ($j = $brojacStranica * 10; $j < $brojacStranica * 10 + 11; $j++) {
                        if (isset($imenaKorisnika[$j])) {
                            echo "<tr class='kuponi_tableRow'>";
                            echo "<td class='uponi_tableSection'>";
                            echo $imenaKorisnika[$j];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            if ($idRadnje[$j] == 1) {
                                echo "Registracija računa";
                            } else if ($idRadnje[$j] == 2) {
                                echo "Prijava na sustav";
                            } else if ($idRadnje[$j] == 3) {
                                echo "Rezervacija prijevoza";
                            } else if ($idRadnje[$j] == 4) {
                                echo "Izvršen prijevoz";
                            } else if ($idRadnje[$j] == 6) {
                                echo "Kupon unesen u košaricu";
                            } else if ($idRadnje[$j] == 7) {
                                echo "Kupljena košarica";
                            }
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $datumi[$j];
                            echo "</td>";
                            echo "</tr>";
                        }
                    }
                    ?>
                </table>
            </div>
        </body>
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
        </html>


