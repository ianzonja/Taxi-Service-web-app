<?php
include 'sesija.php';
$sesija = new Sesija();
$id = $sesija->provjeriSesiju();
include 'baza.class.php';
$baza = new Baza();
$baza ->spajanjeNaBazu();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if(!empty($_POST)){
    if(isset($_POST["btn-kupnja-kosarice"])){
        $upit = "Delete from Kosarica where ID_Korisnika=".$id;
        $baza->ostaliUpiti($upit);
        $ostatak=$_POST["ostatak"];
        $upit = "Update Korisnik set Broj_bodova=".$ostatak." where idKorisnik=".$id;
        $baza->ostaliUpiti($upit);
        $passed_array = unserialize($_POST['polje-kupljenih-kupona']);
        for($i=0; $i<count($passed_array); $i++){
            $date = date("Y-m-d H:i:s");
            $upit = "Insert into jeKupio (ID_kupnje,ID_korisnika,ID_vrednovanja,DatumKupnje) values(default," . $id . "," . $passed_array[$i] . ",'" . $date . "')";
            $baza->ostaliUpiti($upit);
        }
        $upit = "Insert into jeIzvrsio (ID_izvrseneRadnje, ID_korisnika, ID_radnje, Datum) values (default," . $id . ",7,'" . date("Y-m-d H:i:s") . "')";
        $baza->ostaliUpiti($upit);
    } else if(isset($_POST["uklanjanje"])){
        $idZaUkloniti = $_POST["uklanjanje"];
        $upit = "Delete from Kosarica where ID_stavke=".$idZaUkloniti;
        $baza->ostaliUpiti($upit);
    }
}
$upit = "Select * from Kosarica where ID_korisnika=".$id;
$rezultati = $baza ->selectUpit($upit);
$Kuponi = array();
$idStavke = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $idStavke[] = $rezultat["ID_stavke"];
    $Kuponi[] = $rezultat["ID_KuponaPoPodrucju"];
}
$idKuponi = array();
$idPodrucja = array();
$bodovi = array();
$idVrednovanja = array();
for($i=0; $i<count($Kuponi); $i++){
    $upit = "Select * from seVrednuje where ID_vrednovanja=".$Kuponi[$i];
    $rezultati = $baza ->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $idKuponi[] = $rezultat["ID_kupona"];
    $idpodrucja[] = $rezultat["ID_podrucja"];
    $bodovi[] = $rezultat["Broj_bodova"];
    $idVrednovanja[] = $rezultat["ID_vrednovanja"];
}
$imenaKupona = array();
$imenaPodrucja = array();
for($i = 0; $i<count($idKuponi); $i++){
    $upit = "Select * from Kupon where idKupon=".$idKuponi[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $imenaKupona[] = $rezultat["Ime_kupona"];
    $upit = "Select * from Podrucje where idPodrucje=".$idpodrucja[$i];
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $imenaPodrucja[] = $rezultat["Ime_podrucja"];
}
$ukupnoBodova = 0;
for($i=0; $i<count($bodovi); $i++){
    $ukupnoBodova = $ukupnoBodova + $bodovi[$i];
}
$bodoviKorisnika = 0;
$upit = "Select * from Korisnik where idKorisnik=".$id;
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$bodoviKorisnika = $rezultat["Broj_bodova"];
$razlika = $bodoviKorisnika - $ukupnoBodova;
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
            <div class="kosarica-naslov">
                <h1>Kosarica</h1>
                <h3>Kuponi u kosarici</h3>
            </div>
            <div class="kosarica-table">
                <table class="moderator-pregled-table">
                    <tr class="kuponi_tableRow">
                        <th class="kuponi_tableSection">
                            Sifra kupona
                        </th>
                        <th class="kuponi_tableSection">
                            Ime kupona
                        </th>
                        <th class="kuponi_tableSection">
                            Bodova potrebno
                        </th>
                        <th class="kuponi_tableSection">
                            Podrucje
                        </th>
                    </tr>
                </table>
                <form class="forma-kupi" method="post" action="">
                    <p>Potrebno bodova: <?php echo $ukupnoBodova ?></p>
                    <p>Vi imate: <?php echo $bodoviKorisnika ?></p>
                    <p>Preostaje Vam: <?php echo $razlika ?></p>
                    <input class="btn-kupi" id="btn-kupi-kosaricu" name="btn-kupnja-kosarice" value="Kupi" type="submit" <?php if($razlika<0 || $razlika == $bodoviKorisnika || $bodoviKorisnika == 0){echo "disabled";}?>/>
                    <input name="ostatak" type="hidden" <?php echo "value='".$razlika."'"?>/>
                    <input name="polje-kupljenih-kupona" type="hidden" <?php echo "value='".htmlentities(serialize($idVrednovanja))."'"?>/>
                </form>
                <form class="uklanjanje-stavke" name="ukloni-stavku" method="post" action="">
                    <?php 
                        if(count($idStavke) > 0){
                            echo "<select class='dropdown-uklanjanje' name='uklanjanje'>";
                            for($i=0;$i<count($idStavke); $i++){
                                echo "<option value='".$idStavke[$i]."'>".$imenaKupona[$i]."</option>";
                            }
                            echo "</select>";
                            echo "<input name='btn-uklanjanje' type='submit'/>";
                        }
                    ?>  
                    </select>
                </form>
            </div>
        </div>
        <script>
            var id = <?php echo $id ?>;
            $( document ).load(
                dohvatiKosaricu(id)
            );
        
           
            
            //$(".moderator-pregled-table .kuponi_sadrzaj").remove();
            
            function dohvatiKosaricu(id){
                $.ajax({
                    type: 'GET',
                    url: 'http://webdip.barka.foi.hr/2016_projekti/WebDiP2016x131/dohvatiKosaricu.php?id='+id,
                    dataType: 'json',
                    success: function(data){
                        //var odgovor = $.parseJSON(data);
                        
                        $.each(data, function(index, element){
                            var html = '<tr class="kuponi_tableRow kuponi_sadrzaj"><td class="uponi_tableSection">'+ element[0] +'</td>';
                            html += '<td class="uponi_tableSection">'+ element[1] +'</td>';
                            html += '<td class="uponi_tableSection">'+ element[2] +'</td>';
                            html += '<td class="uponi_tableSection">'+ element[3] +'</td>';
                            html += '</tr>';
                            
                            $('.moderator-pregled-table').append(html);
                        });
                    },
                    error: function(){
                        alert("Greska");
                    }
                });
            }
        </script>
    </body>
</html>