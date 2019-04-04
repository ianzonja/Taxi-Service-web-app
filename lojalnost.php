<?php
include 'sesija.php';
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
include 'baza.class.php';
$baza = new Baza();
$datumiTrazenogObavljanja = array();
$brojeviTrazenihBodova = array();
$idTrazenihUsera = array();
$idTrazenihAkcija = array();
$imenaTrazenihUsera = array();
$imenaTrazenihAkcija = array();
$bodoviTrazenihAkcija = array();
if (!empty($_POST)) {
    if (isset($_POST["btn-lojalnost"])) {
        echo "uso 1";
        if (isset($_POST["korisnici"]) && $_POST["korisnici"] != "") {
            $idTrazenogKorisnika = $_POST["korisnici"];
        }
        if (isset($_POST["akcije"]) && $_POST["akcije"] != "") {
            $idTrazeneAkcije = $_POST["akcije"];
        }
        if (isset($_POST["vrijeme-od"]) && $_POST["vrijeme-od"] != "") {
            $vrijemeOD = $_POST["vrijeme-od"];
        }
        if (isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "") {
            $vrijemeDO = $_POST["vrijeme-do"];
        }
        if (isset($_POST["broj-bodova"]) && $_POST["broj-bodova"] != "") {
            $brojBodova = $_POST["broj-bodova"];
        }
        if ($_POST["korisnici"] != "" && $_POST["akcije"] != "") {
            echo "uso 2";
            if (isset($_POST["vrijeme-od"]) && isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "" && $_POST["vrijeme-do"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika . " and ID_Akcije=" . $idTrazeneAkcije . " and Datum_obavljanja >= '" . $vrijemeOD . "' and Datum_obavljanja <= '" . $vrijemeDO . "'";
            } else if (isset($_POST["vrijeme-od"]) && !isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika . " and ID_Akcije=" . $idTrazeneAkcije . " and Datum_obavljanja >= '" . $vrijemeOD . "'";
            } else if (!isset($_POST["vrijeme-od"]) && isset($_POST["vrijeme-do"]) && $_POST["vrijeme-do"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika . " and ID_Akcije=" . $idTrazeneAkcije . " and Datum_obavljanja <= '" . $vrijemeDO . "'";
            } else {
                $upit = "Select * from Akciju_izvrsio where ID_korisnika=" . $idTrazenogKorisnika . " and ID_Akcije=" . $idTrazeneAkcije;
            }
            $rezultati = $baza->selectUpit($upit);
            while ($rezultat = mysqli_fetch_array($rezultati)) {
                $idTrazenihUsera[] = $rezultat["ID_Korisnika"];
                $idTrazenihAkcija[] = $rezultat["ID_Akcije"];
                $datumiTrazenogObavljanja[] = $rezultat["Datum_obavljanja"];
            }
            for ($i = 0; $i < count($idTrazenihUsera); $i++) {
                $upit = "Select * from Korisnik where idKorisnik=" . $idTrazenihUsera[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $imenaTrazenihUsera[] = $rezultat["Username"];
                $upit = "Select * from Akcija where idAkcije=" . $idTrazenihAkcija[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $imenaTrazenihAkcija[] = $rezultat["ImeAkcije"];
            }
        }
        if ($_POST["korisnici"] != "" && $_POST["akcije"] == "") {
            echo "uso 2";
            if (isset($_POST["vrijeme-od"]) && isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "" && $_POST["vrijeme-do"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika . " and Datum_obavljanja >= '" . $vrijemeOD . "' and Datum_obavljanja <= '" . $vrijemeDO . "'";
                echo $upit;
            } else if (isset($_POST["vrijeme-od"]) && !isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika . " and Datum_obavljanja >= '" . $vrijemeOD . "'";
            } else if (!isset($_POST["vrijeme-od"]) && isset($_POST["vrijeme-do"]) && $_POST["vrijeme-do"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika . " and Datum_obavljanja <= '" . $vrijemeDO . "'";
            } else {
                $upit = "Select * from Akciju_izvrsio where ID_Korisnika=" . $idTrazenogKorisnika;
            }
            $rezultati = $baza->selectUpit($upit);
            while ($rezultat = mysqli_fetch_array($rezultati)) {
                $idTrazenihUsera[] = $rezultat["ID_Korisnika"];
                $idTrazenihAkcija[] = $rezultat["ID_Akcije"];
                $datumiTrazenogObavljanja[] = $rezultat["Datum_obavljanja"];
            }
            for ($i = 0; $i < count($idTrazenihUsera); $i++) {
                $upit = "Select * from Korisnik where idKorisnik=" . $idTrazenihUsera[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $imenaTrazenihUsera[] = $rezultat["Username"];
                $upit = "Select * from Akcija where idAkcije=" . $idTrazenihAkcija[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $imenaTrazenihAkcija[] = $rezultat["ImeAkcije"];
            }
        }
        if ($_POST["korisnici"] == "" && $_POST["akcije"] != "") {
            echo "uso 2";
            if (isset($_POST["vrijeme-od"]) && isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "" && $_POST["vrijeme-do"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Akcije=" . $idTrazeneAkcije . " and Datum_obavljanja >= '" . $vrijemeOD . "' and Datum_obavljanja <= '" . $vrijemeDO . "'";
            } else if (isset($_POST["vrijeme-od"]) && !isset($_POST["vrijeme-do"]) && $_POST["vrijeme-od"] != "") {
                $upit = "Select * from Akciju_izvrsio ID_Akcije=" . $idTrazeneAkcije . " and Datum_obavljanja >= '" . $vrijemeOD . "'";
            } else if (!isset($_POST["vrijeme-od"]) && isset($_POST["vrijeme-do"]) && $_POST["vrijeme-do"] != "") {
                $upit = "Select * from Akciju_izvrsio where ID_Akcije=" . $idTrazeneAkcije . " and Datum_obavljanja <= '" . $vrijemeDO . "'";
            } else {
                $upit = "Select * from Akciju_izvrsio where ID_Akcije=" . $idTrazeneAkcije;
            }
            $rezultati = $baza->selectUpit($upit);
            echo count($rezultati)."to je to";
            echo $upit;
            while ($rezultat = mysqli_fetch_array($rezultati)) {
                $idTrazenihUsera[] = $rezultat["ID_Korisnika"];
                $idTrazenihAkcija[] = $rezultat["ID_Akcije"];
                $datumiTrazenogObavljanja[] = $rezultat["Datum_obavljanja"];
            }
            for ($i = 0; $i < count($idTrazenihUsera); $i++) {
                $upit = "Select * from Korisnik where idKorisnik=" . $idTrazenihUsera[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $imenaTrazenihUsera[] = $rezultat["Username"];
                $upit = "Select * from Akcija where idAkcije=" . $idTrazenihAkcija[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                $imenaTrazenihAkcija[] = $rezultat["ImeAkcije"];
            }
        }
        for ($i = 0; $i < count($idTrazenihAkcija); $i++) {
            $upit = "Select * from Akcija where idAkcije=" . $idTrazenihAkcija[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            $bodoviTrazenihAkcija[] = $rezultat["Broj_bodova"];
        }
        $zapamtiIndexe = array();
        if(isset($_POST["broj-bodova"]) && $_POST["broj-bodova"]!=""){
            echo "uso 3";
            $brojBodova = $_POST["broj-bodova"];
            for($i=0; $i<count($idTrazenihUsera); $i++){
                $upit = "Select * from Akcija where idAkcije=".$idTrazenihAkcija[$i];
                $rezultati = $baza->selectUpit($upit);
                $rezultat = mysqli_fetch_array($rezultati);
                if($rezultat["Broj_bodova"] > $brojBodova){
                    $zapamtiIndexe[] = $i;
                }
            }
        }
    }
}
$upit = "Select * from Korisnik";
$rezultati = $baza->selectUpit($upit);
$idKorisnici = array();
$usernameovi = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $idKorisnici[] = $rezultat["idKorisnik"];
    $usernameovi[] = $rezultat["Username"];
}
$upit = "Select * from Akcija";
$rezultati = $baza->selectUpit($upit);
$imenaAkcija = array();
$sifreAkcija = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $imenaAkcija[] = $rezultat["ImeAkcije"];
    $sifreAkcija[] = $rezultat["idAkcije"];
}

$velicinaEkrana = 600;
if(isset($idTrazenihUsera) && count($idTrazenihUsera)>0){
    $velicinaEkrana = 250 + count($idTrazenihUsera)*25;
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
        <script type="text/javascript" src="lojalnostcanvas.js"></script>
        <script type="text/javascript" src="canvas.js"></script>
        <script type="text/javascript" src="canvasLijevo.js"></script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="height:<?php echo "$velicinaEkrana px"?>; width:850px">
            <div class="table-block">
                <form class="form-lojalnost" method="post">
                    <h1>Lojalnost korisnika</h1>
                    <table class="moderator-pregled-table">
                        <tr class="kuponi_tableRow">
                            <th class="kuponi_tableSection">
                                Korisnik
                            </th>
                            <th class="kuponi_tableSection">
                                Akcija
                            </th>
                            <th class="kuponi_tableSection">
                                Od
                            </th>
                            <th class="kuponi_tableSection">
                                Do
                            </th>
                            <th class="kuponi_tableSection">
                                Broj bodova
                            </th>
                        </tr>
                        <?php
                        echo "<tr class='kuponi_tableRow'>";
                        echo "<td class='uponi_tableSection'>";
                        echo "<select name=korisnici>";
                        echo "<option></option>";
                        for ($i = 0; $i < count($idKorisnici); $i++) {
                            echo "<option value='" . $idKorisnici[$i] . "'>$usernameovi[$i]</option>";
                        }
                        echo "</select>";
                        echo "</td>";
                        echo "<td class='uponi_tableSection'>";
                        echo "<select name='akcije'>";
                        echo "<option></option>";
                        for ($j = 0; $j < count($sifreAkcija); $j++) {
                            echo "<option value='" . $sifreAkcija[$j] . "'>$imenaAkcija[$j]</option>";
                        }
                        echo "</select>";
                        echo "</td>";
                        echo "<td class='uponi_tableSection'>";
                        echo "<input name='vrijeme-od' type='date'/>";
                        echo "</td>";
                        echo "<td class='uponi_tableSection'>";
                        echo "<input name='vrijeme-do' type='date'/>";
                        echo "</td>";
                        echo "<td class='uponi_tableSection'>";
                        echo "<input name='broj-bodova' type='text'/>";
                        echo "</td>";
                        echo "</tr>";
                        ?>
                        <tr class="kuponi_tableRow">
                            <th class="kuponi_tableSection">
                                Korisnik
                            </th>
                            <th class="kuponi_tableSection">
                                Akcija
                            </th>
                            <th class="kuponi_tableSection">
                                Datum izvrsavanja
                            </th>
                            <th class="kuponi_tableSection">
                                Bodovi
                            </th>
                        </tr>
                        <?php
                        $prodi = true;
                        for ($i = 0; $i < count($imenaTrazenihAkcija); $i++) {
                            if (isset($imenaTrazenihAkcija[$i])) {
                                for ($j = 0; $j < count($zapamtiIndexe); $j++) {
                                    $prodi = true;
                                    if ($zapamtiIndexe[$j] == $i) {
                                        $prodi = false;
                                    }
                                }
                                if ($prodi == true) {
                                    echo "<tr class='kuponi_tableRow'>";
                                    echo "<td class='uponi_tableSection'>";
                                    echo $imenaTrazenihUsera[$i];
                                    echo "</td>";
                                    echo "<td class='uponi_tableSection'>";
                                    echo $imenaTrazenihAkcija[$i];
                                    echo "</td>";
                                    echo "<td class='uponi_tableSection'>";
                                    echo $datumiTrazenogObavljanja[$i];
                                    echo "</td>";
                                    echo "<td class='uponi_tableSection'>";
                                    echo $bodoviTrazenihAkcija[$i];
                                    echo "</td>";
                                }
                            }
                        }
                        ?>
                    </table>
                    <input class="btn-submit-lojalnost" name="btn-lojalnost" type="submit"/>
                </form>
                <div align="center">
                    <h2>Graf akcija po korisniku</h2>
                    <canvas id="can" height="400" width="650">
                    </canvas>
                </div>
            </div>
        </div>
    </body>
</html>