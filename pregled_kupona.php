<?php
include 'baza.class.php';
$baza = new Baza();
$slikeKupona = array();
$imenaKupona = array();
$baza->spajanjeNaBazu();
$brojac = 0;
include 'sesija.php';
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
if($uloga == 0){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if(empty($_POST)){
    var_dump($_POST);
    $baza->spajanjeNaBazu();
    $upit = "Select * from Podrucje";
    $rezultati = $baza->selectUpit($upit);
    $idPodrucja = array();
    $imenaPodrucja = array();
    while($rezultat = mysqli_fetch_array($rezultati)){
        $idPodrucja[] = $rezultat['idPodrucje'];
        $imenaPodrucja[] = $rezultat['Ime_podrucja'];
        $brojac++;
    }
    
}

if(!empty($_POST)) {
    if (isset($_POST["input-podrucje-kupon"])) {
        $podrucje = $_POST["input-podrucje-kupon"];
        echo $_POST["input-podrucje-kupon"];
        $slika = $_POST["input-slika-kupon"];
        echo $podrucje;
        echo $slika;
        $adresa = "kupon.php?podrucje='$podrucje'&kupon='$slika'";
        header("Location: $adresa");
        exit();
    }
    $idPodrucjaZaKupon = $_POST["radio-input-podrucje"];
    $upit = "Select * from Podrucje where idPodrucje=".$idPodrucjaZaKupon;
    $rezultati = $baza->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $imeOdabranogPodrucja = $rezultat['Ime_podrucja'];
    $upit = "Select * from seVrednuje where ID_podrucja=".$idPodrucjaZaKupon." and vrijediOd <= '". date("Y-m-d"). "' and vrijediDo >= '". date("Y-m-d"). "'";
    echo $upit;
    $baza->selectUpit($upit);
    $rezultati = $baza->selectUpit($upit);
    $idKuponi = array();
    $bodovi = array();
    $vrijedeOd = array();
    $vrijedeDo = array();
    while($rezultat = mysqli_fetch_array($rezultati)){
        $idKuponi[] = $rezultat['ID_kupona'];
        $bodovi[] = $rezultat['Broj_bodova'];
    }
    for($i=0; $i<count($idKuponi); $i++){
        $upit = "Select * from Kupon where idKupon=".$idKuponi[$i];
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $slikeKupona[] = $rezultat['Slika_kupona'];
        $imenaKupona[] = $rezultat['Ime_kupona'];
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
        <script type="text/javascript" src="kuponi.js"></script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="height: 700px">
            <form class="forma-prijava-podrucja" method="post" action="">
                <?php
                if (count($slikeKupona) == 0) {
                    echo "<b>Odaberite podrucje</b><br>";
                    for ($i = 0; $i < $brojac; $i++) {
                        echo "<input name='radio-input-podrucje' value='$idPodrucja[$i]' type='radio'>" . $imenaPodrucja[$i] . "<br>";
                    }
                    echo "<input name='preuzmi_podatke_za_podrucje' value='1. Potvrda podrucja' type='submit'/>";
                }
                ?>            
            </form>
            <div class="kupon-block-slika">
                <?php
                echo "<form id='forma-pregleda-kupona' name='forma-pregled-kupona' method='post' action=''/>";
                if(isset($imeOdabranogPodrucja))
                    echo "<h1>Odabrano područje: <i id='imePodrucja'>$imeOdabranogPodrucja</i></h1>";
                    if(isset($_POST["radio-input-podrucje"])){
                        echo "<h3>Sifra odabranog podrucja: <i id='sifraPodrucja'>".$_POST["radio-input-podrucje"]."</i></h1>";
                    }
                for($i=0; $i<count($slikeKupona); $i++){
                    echo "<div class='kupon-block-slika'>";
                    echo "<img id='kupon-slika' class='slika-kupon' style='width:100px;height:100px' alt='".$imenaKupona[$i]."' src='".$slikeKupona[$i]."'/>";
                    echo "</div>";
                }
                echo "<input id='nevidljivi-input-slika' name='input-slika-kupon' style='visibility:hidden' value='' type='text'/>";
                echo "<input id='nevidljivi-input-podrucja' name='input-podrucje-kupon' style='visibility:hidden' value='' type='text'/>";
                echo "</form>";
                ?>
            </div>
        </div>
        
    </body>
</html>
