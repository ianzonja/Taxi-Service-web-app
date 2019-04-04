<?php
include 'baza.class.php';
include 'sesija.php';
$sesija = new Sesija();
if ($sesija->dohvatiUlogu() != 3) {
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
$uloga = $sesija->dohvatiUlogu();
if (!empty($_POST)) {
    if ($sesija->dohvatiUlogu() == 3) {
        $idAdmina = $sesija->provjeriSesiju();
        $imeKupona = $_POST["input-kupon-ime"];
        $pdfContent = $_FILES["input-kupon-pdf"]["name"];
        var_dump($_FILES["input-kupon-pdf"]["name"]);
        $pdfInfo = pathinfo($_FILES["input-kupon-pdf"]["name"]);
        $ext = $pdfInfo["extension"]; // get the extension of the file
        $newname = $imeKupona . "." . $ext;
        $pdfZaBazu = $newname;
        move_uploaded_file($_FILES["input-kupon-pdf"]["tmp_name"], $newname);
        $imgInfo = pathinfo($_FILES["input-kupon-slika"]["name"]);
        $ext = $imgInfo["extension"];
        $newname = $imeKupona . "." . $ext;
        $imageZaBazu = $newname;
        move_uploaded_file($_FILES["input-kupon-slika"]["tmp_name"], $newname);
        $baza = new Baza();
        $baza->spajanjeNaBazu();
        $upit = "Insert into Kupon values(default, '$imeKupona', $idAdmina, '$pdfZaBazu', '$imageZaBazu', 'null')";
        $baza->ostaliUpiti($upit);
        if (isset($_FILES["uploadvideo"]["name"])) {
            $name = $_FILES['uploadvideo']['name'];
            $videoContent = $_FILES["uploadvideo"]["name"];
            var_dump($_FILES["input-kupon-pdf"]["name"]);
            $videoInfo = pathinfo($_FILES["uploadvideo"]["name"]);
            if (isset($videoInfo["extension"])) {
                $ext = $videoInfo["extension"]; // get the extension of the file
                $newname = $imeKupona . "." . $ext;
                $videoZaBazu = $newname;
                $upit = "Update Kupon set Video_kupona='" . $newname . "' where Ime_kupona='" . $imeKupona . "'";
                $baza->ostaliUpiti($upit);
                move_uploaded_file($_FILES["uploadvideo"]["tmp_name"], $newname);
            }
        }
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
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top"></div>
        <div class="content" style="height: 700px">
            <div class="add-kupon-block">
                <h1>Dodavanje kupona</h1>
                <form name="dodavanje-kupona-form" method="post" enctype="multipart/form-data" action="">
                    <b>Unesite ime kupona</b><br>
                    <input name="input-kupon-ime" type="text"/><br>
                    <b>Dodajte pdf dokument od kupona</b>
                    <input name="input-kupon-pdf" type="file"/><br>
                    <b>Dodajte sliku kupona</b>
                    <input name="input-kupon-slika" type="file"/><br>
                    <b>Dodajte video (opcionalno)</b>
                    <input name="MAX_FILE_SIZE" value="100000000000000"  type="hidden"/>
                    <input name="uploadvideo" type="file"/>
                    <input name="input-kupon-submit" value="Kreiraj" type="submit"/>
                </form>
            </div>
        </div>
        
    </body>
</html>


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

