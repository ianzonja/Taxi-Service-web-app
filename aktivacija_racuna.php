<?php
$korIme = $_GET['korIme'];
$korIme = trim($korIme, "'");
$vrstaAktivacije = $_GET['vrstaAktivacije'];
$naslov = "";
include 'baza.class.php';
include 'sesija.php';
if($vrstaAktivacije == "PrijavaDvaKoraka")
        $naslov = "Potvrda prijave";
    else {
       $naslov = "Aktivacija registriranog računa"; 
    }
if(!empty($_POST)){
    $kod = $_POST['aktivacija-input'];
    $baza = new Baza();
    $baza->spajanjeNaBazu();
    echo $vrstaAktivacije;
    $sqlUpit = "Select * from Korisnik where Username='$korIme'";
    $rezultati = $baza->selectUpit($sqlUpit);
    $rezultat = mysqli_fetch_array($rezultati);
    if (isset($rezultat)) {
        $idKorisnika = $rezultat['idKorisnik'];
        $sqlUpit = "Select * from AktivacijskiKod where ID_korisnika=$idKorisnika";
        $rezultati = $baza->selectUpit($sqlUpit);
        while ($rezultat = mysqli_fetch_array($rezultati)) {
            if (isset($rezultat)) {
                $kodIzBaze = $rezultat['Kod'];
                if ($kod == $kodIzBaze) {
                    echo "Racun aktiviran";
                    $sqlUpit = "Delete from AktivacijskiKod where ID_korisnika=$idKorisnika";
                    $baza->ostaliUpiti($sqlUpit);
                    $upit = "Select * from Akciju_izvrsio where ID_korisnika=" . $idKorisnika;
                    $rezultati = $baza->selectUpit($upit);
                    $unosAkcije = true;
                    while($rezultat = mysqli_fetch_array($rezultati)){
                        $idAkcije = $rezultat["ID_Akcije"];
                        if($idAkcije == 11){
                            $unosAkcije = false;
                        }
                    }
                    if($unosAkcije == true){
                        $upit = "Insert into Akciju_izvrsio(ID_IzvrsavanjaAkcije,ID_Akcije,ID_Korisnika,Datum_obavljanja) values (default,11,".$idKorisnika.",'".date("Y-m-d H:i:s")."')";
                        $baza->ostaliUpiti($upit);   
                        $upit = "Select * from Akcija where idAKcije=11";
                        $rezultati = $baza->selectUpit($upit);
                        $rezultat = mysqli_fetch_array($rezultati);
                        $bodovi = $rezultat["Broj_bodova"];
                        $upit = "Update Korisnik set Broj_bodova=Broj_bodova+".$bodovi." where idKorisnik=".$idKorisnika;
                        $baza->ostaliUpiti($upit);
                    }
                    if($_POST["aktivacija-submit"]=="'PrijavaDvaKoraka'"){
                        $sesija = new Sesija();
                        $upit = "select * from Korisnik where Username='$korIme'";
                        $rezultati = $baza->selectUpit($upit);
                        $rezultat = mysqli_fetch_array($rezultati);
                        $vrstaKorisnikaID = $rezultat["Vrsta_korisnika_idVrsta_korisnika"];
                        $idTrenutnogKorisnika = $rezultat["idKorisnik"];
                        $sesija->kSesija($vrstaKorisnikaID, $idTrenutnogKorisnika, $korIme);
                        setcookie("korisnicko_ime", $korIme);
                        var_dump($_SESSION);
                        $adresa = "Pocetna.php";
                        header("Location: $adresa");
                        exit();
                    }
                    $adresa = "index.php";
                    header("Location: $adresa");
                    exit();
                } else {
                    echo "Krivi kod unesen!";
                }
            }
        }
    }
}
?>
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
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div class="content" style="height: 700px">
            <h1 class="naslov"><?php echo $naslov; ?></h1>
            <div class="aktivacija-block">
                <i>Poštovani, <?php echo $korIme; ?></i><br>
                <b>Unesite aktivacijski kod koji Vam je poslat na mail!</b><br>
                <form class="forma-aktivacija" method="post" action="">
                    <input name="aktivacija-input" type="text"/>
                    <input name="aktivacija-submit" value="<?php echo $vrstaAktivacije ?>" type="submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
