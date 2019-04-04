<?php
include 'baza.class.php';
include 'sesija.php';
$sesija = new Sesija();
$baza = new Baza();
$idZaIzbornik = $sesija->dohvatiUlogu();
echo $idZaIzbornik;
$uloga = $sesija->dohvatiUlogu();
if(empty($_POST)){
        $baza->spajanjeNaBazu();
        $sqlUpit = "Select * from Podrucje";
        $rezultati = $baza->selectUpit($sqlUpit);
        $counter = 0;
        $imenaPodrucja = array();
        $idAdministratori = array();
        $usernameovi = array();
        $ulice = array();
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            $imenaPodrucja[] = $rezultat['Ime_podrucja'];
            $idAdministratori[] = $rezultat['idAdministratora'];
            $sqlUpit = "Select * from Korisnik where idKorisnik=" . $rezultat['idAdministratora'];
            $rezultatIzBaze = $baza->ostaliUpiti($sqlUpit);
            $korisnik = mysqli_fetch_array($rezultatIzBaze);
            $Username[] = $korisnik['Username'];
            $sqlUpit = "Select * from Ulica where idPodrucja=" . $rezultat['idPodrucje'];
            $rezultatiUlica = $baza->selectUpit($sqlUpit);
            $ulica = "";
            while ($rezultatUlica = mysqli_fetch_array($rezultatiUlica)) {
                $ulica = $ulica . "<br>" . $rezultatUlica['Ime_ulice'];
            }
            $ulice[] = $ulica;
            $counter++;
    }
}
$velicinaEkrana = 250 + $counter*50;
?>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="description" content="Taxi služba za Hrvatsku. Najbolji u državi.">
        <meta name="keywords" content="taxi,hrvatska,prijevoz,tour">
        <meta name="author" content="Ian Žonja">
        <meta name="copyright" content="FOI">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script>
            $(function () {
                $("#header").load("Header.html");
            });
        </script>
        <?php 
        if($uloga>0){
            echo "<script>";
            echo "$(function(){
            $('#izbornik').load('Izbornik-registrirani.html'); 
            });";
            echo "</script>";
        }else{
            echo "<script>";
            echo "$(function(){
            $('#izbornik').load('Izbornik-neregistrirani.html'); 
            });";
            echo "</script>";
        }
        ?>
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
        <script type="text/javascript" src="podrucjajs.js"></script>
    </head>    
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="<?php echo "height:".$velicinaEkrana."px" ?>">
            <form id="auto-form" onsubmit="return submitFunkcija()" method="post" action="">
            </form>
            <table id="table-popisProizvoda" border="1">
                <?php
                for ($i = 0; $i < $counter; $i++) {
                    echo "<tr class='table-row'>";
                    echo "<td id='table-podrucje'>" . $imenaPodrucja[$i] . "</td>";
                    echo "<td>" . $Username[$i] . "</td>";
                    echo "<td>" . $ulice[$i] . "</td>";
                    echo "</tr>";
                }
                ?>
            </table>
            <div id="ulica-block">

            </div>
        </div>
    </body>
</html>