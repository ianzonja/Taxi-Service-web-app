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
if(!empty($_POST)){
    if(isset($_POST["input-btn-sbmit"])){
        $upit = "Select * from Podrucje";
        $rezultati = $baza->selectUpit($upit);
        $novoIdPodrucja = array();
        while($rezultat = mysqli_fetch_array($rezultati)){
            $novoIdPodrucja[] = $rezultat["idPodrucje"];
        }
        for($i=0; $i<count($novoIdPodrucja); $i++){
            if(isset($_POST["input-checkbox".$i])){
                $boja = $_POST["input-boja".$i];
                $stil = $_POST["input-fontStyle".$i];
                $velicina = $_POST["input-fontVelicina".$i];
                $upit = "Update Podrucje set Boja='$boja', Font_style='$stil', velicinaFonta='$velicina' where idPodrucje=".$i;
                $baza->ostaliUpiti($upit);
            }
        }
    }
}
$upit = "Select * from Korisnik where idKorisnik=".$sesija->provjeriSesiju();
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$username = $rezultat["Username"];
$id = $sesija->provjeriSesiju();
$upit = "Select * from Podrucje where idAdministratora=".$id;
$rezultati = $baza->selectUpit($upit);
$idPodrucja = array();
$boje = array();
$fontStylovi = array();
$velicineFonta = array();
$imenaPodrucja = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $idPodrucja[] = $rezultat["idPodrucje"];
    $imenaPodrucja[] = $rezultat["Ime_podrucja"];
    $boje[] = $rezultat["Boja"];
    $fontStylovi[] = $rezultat["Font_style"];
    $velicineFonta[] = $rezultat["velicinaFonta"];
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
        <div class="content" style="height: 700px; width:700px">
            <h1>Dobrodošli, <?php echo $username ?>!</h1>
            <div class="text">
                <h5>Izgled stranice područja</h5>
                <form class="forma-izgled-stranice" method="post" aciton="">
                    <table class="moderator-pregled-table">
                        <tr class="kuponi_tableRow">
                            <th class="kuponi_tableSection">
                                Područje
                            </th>
                            <th class="kuponi_tableSection">
                                Boja
                            </th>
                            <th class="kuponi_tableSection">
                                Stil fonta
                            </th>
                            <th class="kuponi_tableSection">
                                Velicina fonta
                            </th>
                            <th class="kuponi_tableSection">
                                Odabir
                            </th>
                        </tr>
                        <?php
                        for ($i = 0; $i < count($idPodrucja); $i++) {
                            echo "<tr class='kuponi_tableRow'>";
                            echo "<td class='uponi_tableSection'>";
                            echo $imenaPodrucja[$i];
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-boja".$idPodrucja[$i]."' value='" . $boje[$i] . "' type='text'/>";
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-fontStyle".$idPodrucja[$i]."' value='" . $fontStylovi[$i] . "' type='text'/>";
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-fontVelicina".$idPodrucja[$i]."' value='" . $velicineFonta[$i] . "' type='text'/>";
                            echo "</td>";
                            echo "<td class='uponi_tableSection'>";
                            echo "<input name='input-checkbox".$idPodrucja[$i]."' value='" . $velicineFonta[$i] . "' type='checkbox'/>";
                            echo "</td>";
                            echo "</tr>";
                        }
                        ?>
                    </table>
                    <input name="input-btn-sbmit" value="Pošalji" type="submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
