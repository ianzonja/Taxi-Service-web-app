<?php
$imeKupona = $_GET["kupon"];
$imePodrucja = $_GET["podrucje"];
if($imeKupona == ""){
    $imeKupona = $_POST["input-slika-kupon"];
    $imePodrucja = $_POST["input-podrucje-kupon"];
}

$novoImeKupona = substr($imeKupona, 1, -1);
$novoImePodrucja = substr($imePodrucja, 1, -1);

echo $novoImeKupona;
echo $novoImePodrucja;
include 'baza.class.php';

include 'sesija.php';
$sesija = new Sesija();
$id = $sesija->provjeriSesiju();
$uloga = $sesija->dohvatiUlogu();
if($uloga < 1){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
$baza = new Baza();
$baza->spajanjeNaBazu();
if(!empty($_POST)){
    if(isset($_POST["id-kupona"])){
        $idKuponaZaKosaricu = $_POST["id-kupona"];
        $upit = "Insert into Kosarica (ID_stavke, ID_Korisnika, ID_KuponaPoPodrucju) values (default," . $id . "," . $idKuponaZaKosaricu . ")";
        $baza->ostaliUpiti($upit);
        $upit = "Insert into jeIzvrsio (ID_izvrseneRadnje, ID_korisnika, ID_radnje, Datum) values (default," . $id . ",6,'" . date("Y-m-d H:i:s") . "')";
        $baza->ostaliUpiti($upit);
    }
}
$upit = "Select * from Podrucje where idPodrucje=".$imePodrucja;
echo $upit;
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$idPodrucja = $rezultat['idPodrucje'];
$boja = $rezultat["Boja"];
$stilFOnta = $rezultat["Font_style"];
$velicinaFonta = $rezultat["velicinaFonta"];
$upit = "Select * from Kupon where Ime_kupona='$novoImeKupona'";
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$pdfDokument = $rezultat['Pdf_dokument'];
if(isset($rezultat['Video_kupona'])){
    $video = $rezultat['Video_kupona'];
}
echo $video;
$slika = $rezultat['Slika_kupona'];
$idKupona = $rezultat['idKupon'];
$upit = "Select * from seVrednuje where ID_kupona=".$idKupona." and ID_podrucja=".$idPodrucja;
$rezultati = $baza->selectUpit($upit);
$rezultat = mysqli_fetch_array($rezultati);
$idVrednovanjaKupona = $rezultat['ID_vrednovanja'];
$brojBodova = $rezultat['Broj_bodova'];
$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
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
        <meta name="description" content="Taxi služba za Hrvasku. Najbolji u držatsku. Najbolji u državi.">
        <meta name="keywords" content="taxi,hrvatska,prijevoz,tour">
        <meta name="author" content="Ian Žonja">
        <meta name="copyright" content="FOI">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div class="content" style="height: 1400px; background-color:<?php echo $boja ?>">
            <div class="kupon-block">
                <?php
                if (isset($imeKupona))
                    echo "<h1>$imeKupona</h1>";
                if (isset($brojBodova)) {
                    echo "<p class='broj-bodova-info' style='font-style:".$stilFOnta.";font-size:".$velicinaFonta."px;'>Broj bodova za podrucje $novoImePodrucja: " . $brojBodova . "</p>";
                    echo "<form class='forma-kupi-kupon' method='post' action=''>";
                    echo "<input class='btn-kupi' name='ubaci_u_kosaricu' value='Ubaci u kosaricu' style='width:150px' type='submit'/>";
                    echo "<input name='id-kupona' type='hidden' value='" . $idVrednovanjaKupona . "'/>";
                    echo "</form>";
                }
                if (isset($slika))
                    echo "<img src='$slika' width='500'/>";
                if (isset($pdfDokument))
                    echo "<embed src='$pdfDokument' width = '500' height='300'/>";
                if(isset($video)){
                    if($video == 'null'){
                        echo "<br>Nema videa";
                    }else{
                        echo "<embed src='$video' type='video/mp4'/>";
                    }
                }
                ?>
            </div>
        </div>
    </body>
</html>

