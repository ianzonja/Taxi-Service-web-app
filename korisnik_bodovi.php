<?php
include 'sesija.php';
include 'baza.class.php';
$sesija = new Sesija();
$id = $sesija->provjeriSesiju();
echo $id;
if($sesija->dohvatiUlogu() == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
$uloga = $sesija->dohvatiUlogu();
$baza = new Baza();
$baza->spajanjeNaBazu();
$upit = "Select * from Korisnik where idKorisnik=".$id;
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$bodovi = $rezultat["Broj_bodova"];
$upit = "Select * from Akciju_izvrsio where ID_korisnika=".$id;
$rezultati = $baza->selectUpit($upit);
$poljeIdAkcije = array();
$datumiObavljanjaAkcije = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $poljeIdAkcije[] = $rezultat["ID_Akcije"];
    $datumiObavljanjaAkcije[] = $rezultat["Datum_obavljanja"];
}
$imenaAkcija = array();
$bodoviAkcija = array();
for($i=0;$i<count($poljeIdAkcije); $i++){
    $upit = "Select * from Akcija where idAkcije=".$poljeIdAkcije[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $imenaAkcija[] = $rezultat["ImeAkcije"];
    $bodoviAkcija[] = $rezultat["Broj_bodova"];
}

$upit = "Select * from jeKupio where ID_korisnika=".$id;
$rezultati = $baza->selectUpit($upit);
$kupnje = array();
$vrednjovanjaKupnje = array();
$datumiKupnje = array();
while($rezultat= mysqli_fetch_array($rezultati)){
    $kupnje[] = $rezultat["ID_kupnje"];
    $vrednjovanjaKupnje[] = $rezultat["ID_vrednovanja"];
    $datumiKupnje[] = $rezultat["DatumKupnje"];
}
$idKupljeniKuponi = array();
$potroseniBodovi = array();
for($i=0; $i<count($kupnje); $i++){
    $upit = "Select * from seVrednuje where ID_vrednovanja=".$vrednjovanjaKupnje[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $idKupljeniKuponi[] = $rezultat["ID_kupona"];
    $potroseniBodovi[] = $rezultat["Broj_bodova"];
}

$brojRedovaTablice = count($poljeIdAkcije) + count($kupnje);
$velicinaEkrana = 500 + $brojRedovaTablice*40;
echo $velicinaEkrana;

if(empty($_POST)){
    $brojacStranica=0;
    $brojacStranica2=0;
}
$brojStranica = count($imenaAkcija)/10;
echo $brojStranica;
if (isset($_POST["lijevo"])) {
    $brojacStranica2=0;
    $brojacStranica = $_POST["lijevo"];
    if ($brojacStranica != 0) {
        $brojacStranica = $brojacStranica - 1;
    }
} else if (isset($_POST["desno"])) {
    $brojacStranica2=0;
    $brojacStranica = $_POST["desno"];
    if($brojacStranica <= $brojStranica){
        $brojacStranica = $brojacStranica + 1;
        echo "sad je brojac".$brojacStranica;
    }
}
$brojStranica2 = count($idKupljeniKuponi)/10;
if (isset($_POST["lijevo2"])) {
    $brojacStranica=0;
    $brojacStranica2 = $_POST["lijevo2"];
    if ($brojacStranica2 != 0) {
        $brojacStranica2 = $brojacStranica2 - 1;
    }
} else if (isset($_POST["desno2"])) {
    $brojacStranica=0;
    $brojacStranica2 = $_POST["desno2"];
    if($brojacStranica2 <= $brojStranica2){
        $brojacStranica2 = $brojacStranica2 + 1;
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
        <script type="text/javascript" src="canvas2.js"></script>
        <script type="text/javascript" src="canvasLijevo2.js"></script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" <?php echo "style='height:".$velicinaEkrana."px'"?>>
            <div class="bodovi-block">
                <h1>Broj bodova</h1>
                <h3><?php echo $bodovi?></h3>
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
            <div class="zaradeni-bodovi-block">
                <h3>Zaradeni bodovi</h3>
                <table class="moderator-pregled-table">
                    <tr class="kuponi_tableRow">
                        <th class="kuponi_tableSection">
                            Akcija
                        </th>
                        <th class="kuponi_tableSection">
                            Bodovi
                        </th>
                        <th class="kuponi_tableSection">
                            Datum obavljanja akcije
                        </th>
                    </tr>
                    <?php
                    for ($i = $brojacStranica * 10; $i < $brojacStranica * 10 + 11; $i++) {
                        if (isset($imenaAkcija[$i])) {
                            echo "<tr class='kuponi_tableRow'>";
                            echo "<td class='uponi_tableSection'>";
                            echo $imenaAkcija[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $bodoviAkcija[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $datumiObavljanjaAkcije[$i];
                            echo "</td class='uponi_tableSection'>";
                            echo "</tr>";
                        }
                    }
                    ?>
                </table>
            </div>
            <div class="potroseni-bodovi-block">
                <h3>Potroseni bodovi</h3>
                <div class="canvas-block">
                    <form id="forma-lijevo2" method="post" action="">
                        <canvas id="c-lijevo2" width="150" height="30" style="transform: rotate(180deg);"></canvas>
                        <input name="lijevo2" type="hidden" value="<?php echo $brojacStranica2 ?>"/>
                    </form>
                    <form id="forma-desno2" method="post" action="">
                        <canvas id="c-desno2" width="150" height="30"></canvas>
                        <input name="desno2" type="hidden" value="<?php echo $brojacStranica2 ?>"/>
                    </form>
                </div>
                <table class="moderator-pregled-table">
                    <tr class="kuponi_tableRow">
                        <th class="kuponi_tableSection">
                            Kupon
                        </th>
                        <th class="kuponi_tableSection">
                            Bodovi
                        </th>
                        <th class="kuponi_tableSection">
                            Datum kupnje kupona
                        </th>
                    </tr>
                    <?php
                    for ($i = $brojacStranica2 * 10; $i < $brojacStranica2 * 10 + 11; $i++) {
                        if (isset($idKupljeniKuponi[$i])) {
                            echo "<tr class='kuponi_tableRow'>";
                            echo "<td class='uponi_tableSection'>";
                            echo $idKupljeniKuponi[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $potroseniBodovi[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo $datumiKupnje[$i];
                            echo "</td class='uponi_tableSection'>";
                            echo "</tr>";
                        }
                    }
                    ?>
                </table>
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
    <script>
document.getElementById("c-lijevo2").onclick = function() {SubmitFormuLijevo2()};

function SubmitFormuLijevo2() {
    document.getElementById("forma-lijevo2").submit();
}
    </script>
    <script>
    document.getElementById("c-desno2").onclick = function() {SubmitFormuDesno2()};

    function SubmitFormuDesno2() {
        document.getElementById("forma-desno2").submit();
    }
    </script>
</html>


