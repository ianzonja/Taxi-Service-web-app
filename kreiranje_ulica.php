<?php
include 'baza.class.php';
include 'sesija.php';
$baza = new Baza();
$korisnickoIme = null;
$brojac = 0;
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
$korisnickoIme = $sesija->dohvatiKorIme();
$idModeratora = $sesija->provjeriSesiju();
echo $uloga;
echo $korisnickoIme;
if($uloga == 1 && $uloga == 4){
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if(empty($_POST)){
    $baza->spajanjeNaBazu();
    $upit = "Select * from Podrucje where idAdministratora=".$idModeratora;
    $rezultati = $baza->selectUpit($upit);
    $idpodrucja = array();
    $imenaPodrucja = array();
    while($rezultat = mysqli_fetch_array($rezultati)){
        $idpodrucja[] = $rezultat['idPodrucje'];
        $imenaPodrucja[] = $rezultat['Ime_podrucja'];
        $brojac++;
    }
}

if(!empty($_POST)){
    $id = $_POST['radio-input'];
    $imeUlice = $_POST['ime_ulice'];
    $upit = "Insert into Ulica values(default, '$imeUlice', $id)";
    $baza->ostaliUpiti($upit);
    $upit = "Select * from Podrucje where idAdministratora=".$idModeratora;
    $rezultati = $baza->selectUpit($upit);
    $idpodrucja = array();
    $imenaPodrucja = array();
    while($rezultat = mysqli_fetch_array($rezultati)){
        $idpodrucja[] = $rezultat['idPodrucje'];
        $imenaPodrucja[] = $rezultat['Ime_podrucja'];
        $brojac++;
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> 
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
        <script>
            $(function () {
                $("#header").load("Header.html");
            });
        </script>
        <script>
            $(function () {
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
        <div class="srednji-dio">
            <div id="moderatorIzbornik" style="vertical-align: top"></div>
            <div class="content" style="height: 700px">
                
                <div id='ulica-block'>
                    <title>Kreiranje ulica</title>
                </div>
                <div id="tekst">
                    Poštovani, <?php echo $korisnickoIme;?><br>
                    Nalazite se na formi za kreiranje ulica. Za kreiranje ulica unesite podatke i kliknite gumb greiraj.
                </div>
                <form class="forma-kreiranje-ulica" method="post" action="">
                    <b>Upišite ime ulice</b><br>
                    <input name="ime_ulice" type="text"/><br>
                    <b>Imate pristup samo područjima sa kojima imate ovlaštenja!</b><br>
                    <?php for($i=0; $i<$brojac; $i++){
                        echo "<input name='radio-input' value='$idpodrucja[$i]' type='radio'>" . $imenaPodrucja[$i] . "<br>";
                    }
                    if($brojac == 0){
                        echo "<p>Nazalost nemate nijedno podrucje dodijeljeno!</p>";
                    }
                    ?>
                    <input class="button-submit-ulicu" type="submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
