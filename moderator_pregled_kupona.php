<?php
include 'baza.class.php';
include 'sesija.php';
$sesija = new Sesija();
$idModeratora = $sesija->provjeriSesiju();
echo $idModeratora;
$baza = new Baza();
$odgovor = "";
$uloga = $sesija->dohvatiUlogu();
if($uloga == 1 && $uloga == 4){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if (!empty($_POST)) {
    if (isset($_POST["btn-sbmit"])) {
        $upit = "Select * from Kupon";
        $rezultati = $baza->selectUpit($upit);
        $idKuponiIzBaze = array();
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $idKuponiIzBaze[] = $rezultat["idKupon"];
        }
        for ($i = 0; $i < count($idKuponiIzBaze); $i++) {
            if (isset($_POST["input-bodovi" . $idKuponiIzBaze[$i]]) && isset($_POST["select-podrucja" . $idKuponiIzBaze[$i]])) {
                $inputBod = $_POST["input-bodovi" . $idKuponiIzBaze[$i]];
                $inputPodrucje = $_POST["select-podrucja" . $idKuponiIzBaze[$i]];
                $odKadVrijedi = $_POST["input-datum-od" . $idKuponiIzBaze[$i]];
                $doKadVrijedi = $_POST["input-datum-do" . $idKuponiIzBaze[$i]];
                if ($inputPodrucje != "" && $odKadVrijedi != "" && $doKadVrijedi != "") {
                    $datumOd = date("Y-m-d", strtotime($odKadVrijedi));
                    $datumDo = date("Y-m-d", strtotime($doKadVrijedi));
                    $upit = "Insert into seVrednuje (ID_vrednovanja, ID_kupona, ID_podrucja, Broj_bodova, vrijediOd, vrijediDo) values (default, " . $idKuponiIzBaze[$i] . "," . $inputPodrucje . ",$inputBod,'$datumOd','$datumDo')";
                    echo $upit;
                    $baza->ostaliUpiti($upit);
                }
            }
        }
    } else {
        if (isset($_POST["button-pretraga-submit"])) {
            $sifra = $_POST["input-text-sifra"];
            if ($sifra != "") {
                $upit = "Select * from Kupon where idKupon=" . $sifra;
                $rezultati = $baza->selectUpit($upit);
                $odgovor = "Kupon ne postoji ili ste unijeli pogrešan kod";
                if (count($rezultati) > 0) {
                    $rezultat = mysqli_fetch_array($rezultati);
                    if (isset($rezultat))
                        $odgovor = "Kupon postoji.";
                }
            }
        }
    }
}
$sifraKupona = array();
$imeKupona = array();
$autorKupona = array();
$bodovi = array();
$idPodrucja = array();
$imenaPodrucja = array();
$upit = "Select * from Podrucje where idAdministratora=".$idModeratora;
echo $upit;
$rezultati = $baza->selectUpit($upit);
while($rezultat = mysqli_fetch_array($rezultati)){
    $idPodrucja[] = $rezultat["idPodrucje"];
    $imenaPodrucja[] = $rezultat["Ime_podrucja"];
}
$idBodovanihKupona = array();
$idPodrucjaBodovanih = array();
$vrijedeOd = array();
$vrijedeDo = array();
for($i=0; $i<count($idPodrucja); $i++){
    $upit = "Select * from seVrednuje where ID_podrucja=" . $idPodrucja[$i];
    $rezultati = $baza->selectUpit($upit);
    if (isset($rezultati)) {
        while($rezultat = mysqli_fetch_array($rezultati)){
            $idBodovanihKupona[] = $rezultat["ID_kupona"];
            $bodovi[] = $rezultat["Broj_bodova"];
            $idPodrucjaBodovanih[] = $rezultat["ID_podrucja"];
            $vrijedeOd[] = $rezultat["vrijediOd"];
            $vrijedeDo[] = $rezultat["vrijediDo"];
        }
    }
}
$imenaBodovanihKupona = array();
$autoriBodovanihKupona = array();
for($i=0; $i<count($idBodovanihKupona); $i++){
    echo $idBodovanihKupona[$i];
}
for ($i = 0; $i < count($idBodovanihKupona); $i++) {
    $upit = "Select * from Kupon where idKupon=".$idBodovanihKupona[$i];
    echo $upit;
    $rezultati = $baza->selectUpit($upit);
    if (isset($rezultati)) {
        $rezultat = mysqli_fetch_array($rezultati);
        $imenaBodovanihKupona[] = $rezultat["Ime_kupona"];
        $autoriBodovanihKupona[] = $rezultat["Kupon_izradio"];
    }
}
$imenaPodrucjaBodovanih = array();
for($i=0; $i<count($idPodrucjaBodovanih); $i++){
    $upit = "Select * from Podrucje where idPodrucje=".$idPodrucjaBodovanih[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $imenaPodrucjaBodovanih[] = $rezultat["Ime_podrucja"];
}

$upit = "Select * from Kupon where idKupon !=";
for ($i = 0; $i < count($idBodovanihKupona); $i++) {
    if ($i == count($idBodovanihKupona) - 1) {
        $upit = $upit . $idBodovanihKupona[$i];
    } else {
        $upit = $upit . $idBodovanihKupona[$i] . " and idKupon !=";
    }
}
if (count($idBodovanihKupona) > 0) {
    $rezultati = $baza->selectUpit($upit);
    if (isset($rezultati)) {
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $sifraKupona[] = $rezultat["idKupon"];
            $imeKupona[] = $rezultat["Ime_kupona"];
            $autorKupona[] = $rezultat["Kupon_izradio"];
        }
    }
}else{
    $upit = "Select * from Kupon";
    $rezultati = $baza->selectUpit($upit);
    while($rezultat = mysqli_fetch_array($rezultati)){
        $sifraKupona[] = $rezultat["idKupon"];
        $imeKupona[] = $rezultat["Ime_kupona"];
        $autorKupona[] = $rezultat["Kupon_izradio"];
    }
}
$velicina = 650 + count($idBodovanihKupona)*35 + count($sifraKupona)*35;

if(empty($_POST)){
    $brojacStranica=0;
}
if(isset($_POST["btn-sbmit"])){
    $brojacStranica = 0;
    echo "tu sam jbt";
}
$brojStranica = count($sifraKupona)/10;
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
        <div id="moderatorIzbornik" style="vertical-align: top"></div>
        <div class="content" style="height:<?php echo $velicina."px"?>; width:900px; transform:translateX(20%)">
            <div class="pregled-block">
                <div class="obradeni-kuponi">
                    <div class="obradeni-kuponi-block">
                        <h1>Lista obradenih kupona</h1>
                    </div>
                    <div class="canvas-block">
                        <form id="forma-lijevo" method="post" action="">
                            <canvas id="c-lijevo" width="150" height="30" style="transform: rotate(180deg);"></canvas>
                            <input name="lijevo" type="hidden" value="<?php echo $brojacStranica ?>"/>
                        </form>
                        <form id="forma-desno" method="post" action="">
                            <canvas id="c-desno" width="150" height="30"></canvas>
                            <input name="desno" type="hidden" value="<?php echo $brojacStranica ?>"/>
                        </form>
                    </div>
                    <table class="moderator-pregled-table">
                        <tr class="kuponi_tableRow">
                            <th class="kuponi_tableSection">
                                Šifra kupona
                            </th>
                            <th class="kuponi_tableSection">
                                Ime kupona
                            </th>
                            <th class="kuponi_tableSection">
                                Autor kupona
                            </th>
                            <th class="kuponi_tableSection">
                                Bodovi
                            </th>
                            <th class="kuponi_tableSection">
                                Podrucje
                            </th>
                            <th class="kuponi_tableSection">
                            Vrijedi od
                        </th>
                        <th class="kuponi_tableSection">
                            Vrijedi do
                        </th>
                        </tr>
                        <?php
                        for ($j = $brojacStranica * 10; $j < $brojacStranica * 10 + 11; $j++) {
                            if (isset($idBodovanihKupona[$j])) {
                                echo "<tr class='kuponi_tableRow'>";
                                echo "<td class='uponi_tableSection'>";
                                echo $idBodovanihKupona[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $imenaBodovanihKupona[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $autoriBodovanihKupona[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $bodovi[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $imenaPodrucjaBodovanih[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $vrijedeOd[$j];
                                echo "</td>";
                                echo "<td class='uponi_tableSection'>";
                                echo $vrijedeDo[$j];
                                echo "</td>";
                                echo "</tr>";
                            }
                        }
                        ?>
                    </table>
                </div>
            </div>
            <div class="neobradeni-kuponi">
                <div class="neobradeni-kuponi-naslov">
                    <h1>Lista neobradnih kupona</h1>
                </div>
                <form class="forma-pregleda-kupona" method="post" action="">
                <table class="moderator-pregled-table">
                    <tr class="kuponi_tableRow">
                        <th class="kuponi_tableSection">
                            Šifra kupona
                        </th>
                        <th class="kuponi_tableSection">
                            Ime kupona
                        </th>
                        <th class="kuponi_tableSection">
                            Autor kupona
                        </th>
                        <th class="kuponi_tableSection">
                            Bodovi
                        </th>
                        <th class="kuponi_tableSection">
                            Podrucje
                        </th>
                        <th class="kuponi_tableSection">
                            Vrijedi od
                        </th>
                        <th class="kuponi_tableSection">
                            Vrijedi do
                        </th>
                    </tr>
                    <?php
                    for($i = 0; $i<count($sifraKupona); $i++){
                        if(isset($sifraKupona[$i])){
                            echo "<tr class='kuponi_tableRow'>";
                            echo "<td class='uponi_tableSection'>";
                            echo $sifraKupona[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $imeKupona[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $autorKupona[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-bodovi".$sifraKupona[$i]."' type='text'/>";
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<select name='select-podrucja".$sifraKupona[$i]."'>";
                            for($j=0; $j<count($idPodrucja); $j++){
                                echo "<option value=".$idPodrucja[$j].">".$imenaPodrucja[$j]."</option>";
                            }
                            echo "</select>";
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-datum-od".$sifraKupona[$i]."' type='date'/>";
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-datum-do".$sifraKupona[$i]."' type='date'/>";
                            echo "</td>";
                            echo "</tr>";
                        }
                    }
                    ?>
                </table>
                <input name="btn-sbmit" type="submit"/>
                </form>
            </div>
            <div class="pretraga-kupona">
                <form class="pretraga-form" method="post" action="">
                    <h1>Pretraga kupona</h1>
                    <p>Unesite šifru kupona</p>
                    <input name="input-text-sifra" type="text"/>
                    <input name="button-pretraga-submit" type="submit"/>
                    <b><?php echo $odgovor?></b>
                </form>
                
            </div>
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