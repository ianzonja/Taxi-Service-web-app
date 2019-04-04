<?php
include 'sesija.php';
$sesija = new Sesija();
$sifreAkcija = array();
$ImenaAkcija = array();
$Bodovi = array();
$Autori = array();
$uloga = $sesija->dohvatiUlogu();
if($uloga != 3){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
include 'baza.class.php';
$baza = new Baza();
if(!empty($_POST)){
    if(isset($_POST["btn-submit-izmjena"])){
        $upit = "Select * from Akcija";
        $rezultati = $baza->selectUpit($upit);
        while($rezultat = mysqli_fetch_array($rezultati)){
            $sifreAkcija[] = $rezultat["idAkcije"];
        }
        for($i=0; $i<count($sifreAkcija); $i++){
            if(isset($_POST["checkbox".$sifreAkcija[$i]])){
                $ImeAkcije = $_POST["input-ime-akcije"];
                $bodoviakcije = $_POST["input-bodovi"];
                $id = $sesija->provjeriSesiju();
                $upit = "Update Akcija set ImeAkcije='".$ImeAkcije."', Broj_bodova=".$bodoviakcije." where idAkcije=".$sifreAkcija[$i];
                $baza->ostaliUpiti($upit);
            }
        }
    }
}
$upit = "Select * from Korisnik where idKorisnik=".$sesija->provjeriSesiju();
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$username = $rezultat["Username"];
$upit = "Select * from Akcija";
$rezultati = $baza->selectUpit($upit);
while($rezultat = mysqli_fetch_array($rezultati)){
    $sifreAkcija[] = $rezultat["idAkcije"];
    $ImenaAkcija[] = $rezultat["ImeAkcije"];
    $Bodovi[] = $rezultat["Broj_bodova"];
    $Autori[] = $rezultat["Akciju_kreirao"];
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
        }
        ?>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="height: 700px">
            <form class="forma-izmjena-akcije" method="post" action="">
                <table class="moderator-pregled-table">
                    <tr class="kuponi_tableRow">
                        <th class="kuponi_tableSection">
                            Sifra akcije
                        </th>
                        <th class="kuponi_tableSection">
                            Ime akcije
                        </th>
                        <th class="kuponi_tableSection">
                            Broj bodova
                        </th>
                        <th class="kuponi_tableSection">
                            Autor akcije
                        </th>
                        <th class="kuponi_tableSection">
                            Izmjena
                        </th>
                    </tr>
                    <?php
                    for ($i = 0; $i < count($sifreAkcija); $i++) {
                        echo "<tr class='kuponi_tableRow'>";
                        echo "<th class='kuponi_tableSection'>";
                        echo $sifreAkcija[$i];
                        echo '</th>';
                        echo "<th class='kuponi_tableSection'>";
                        echo "<input name='input-ime-akcije' type='text' value='$ImenaAkcija[$i]'/>";
                        echo '</th>';
                        echo "<th class='kuponi_tableSection'>";
                        echo "<input name='input-bodovi' type='text' value='$Bodovi[$i]'/>";
                        echo '</th>';
                        echo "<th class='kuponi_tableSection'>";
                        echo $Autori[$i];
                        echo '</th>';
                        echo "<th class='kuponi_tableSection'>";
                        echo "<input name='checkbox" . $sifreAkcija[$i] . "' type='checkbox'/>";
                        echo "</th>";
                    }
                    ?>
                </table>
                <input name="btn-submit-izmjena" value="Izmjeni" type="submit"/>
            </form>
            <div class="dodavanje">
                <h5>Dodavanje akcije</h5>
                <p>Ime akcije</p><br>
                <input name="ime-akcije-input" type="text"/><br>
                <p>Broj bodova</p>
                <input name="broj-bodova-input"/><br>
                <input name="batn-submit-dodaj" value="Dodaj" type="submit"/>
            </div>
        </div>
    </body>
</html>
