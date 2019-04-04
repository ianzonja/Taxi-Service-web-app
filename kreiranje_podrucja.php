<?php
include 'baza.class.php';
$baza = new Baza();
$brojac = 0;
include 'sesija.php';
$sesija = new Sesija();
$uloga = $sesija->dohvatiUlogu();
if ($sesija->dohvatiUlogu() != 3) {
    $adresa = "nedozvoljen_pristup.php";
    header("location: $adresa");
    exit();
}
if(empty($_POST)){
    $baza->spajanjeNaBazu();
    $upit = "Select * from Korisnik where Vrsta_korisnika_idVrsta_korisnika=2";
    $rezultati = $baza->selectUpit($upit);
    $idModeratori = array();
    $usernameoviModeratora = array();
    while($rezultat = mysqli_fetch_array($rezultati)){
        $idModeratori[] = $rezultat['idKorisnik'];
        $usernameoviModeratora[] = $rezultat['Username'];
        $brojac++;
    }
}

if(!empty($_POST)){
    $idDodijeljenogModeratora = $_POST['radio-input-moderatori'];
    $imePodrucja = $_POST['ime_podrucja'];
    $upit = "Insert into Podrucje values(default, '$imePodrucja', $idDodijeljenogModeratora, '#B6D3CE', 'normal', '22')";
    $baza->ostaliUpiti($upit);
    
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
        <div class="srednji-dio">
            <div id="moderatorIzbornik" style="vertical-align: top"></div>
            <div class="content" style="height: 700px">
                
                <div id='ulica-block'>
                    <title>Kreiranje ulica</title>
                </div>
                <div id="tekst">
                    Poštovani, administratoru!<br>
                    Nalazite se na formi za kreiranje područja. Za kreiranje ulica unesite podatke i kliknite gumb kreiraj.
                </div>
                <form class="forma-kreiranje-podrucja" method="post" action="">
                    <b>Upišite ime područja</b><br>
                    <input name="ime_podrucja" type="text"/><br>
                    <b>Dodijelite podrucju moderatora</b><br>
                    <?php for($i=0; $i<$brojac; $i++){
                        echo "<input name='radio-input-moderatori' value='$idModeratori[$i]' type='radio'>".$usernameoviModeratora[$i]."<br>";
                    }?>
                    <input class="button-submit-podrucje" type="submit"/>
                </form>
            </div>
        </div>
    </body>
</html>