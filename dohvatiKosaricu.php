<?php
if(!isset($_GET)){
    exit();
}

$id = $_GET["id"];

include 'baza.class.php';
$baza = new Baza();
$baza ->spajanjeNaBazu();
$upit = "Select * from Kosarica where ID_korisnika=".$id;
$rezultati = $baza ->selectUpit($upit);
$Kuponi = array();
while($rezultat = mysqli_fetch_array($rezultati)){
    $Kuponi[] = $rezultat["ID_KuponaPoPodrucju"];
}
$idKuponi = array();
$idPodrucja = array();
$bodovi = array();
for($i=0; $i<count($Kuponi); $i++){
    $upit = "Select * from seVrednuje where ID_vrednovanja=".$Kuponi[$i];
    $rezultati = $baza ->selectUpit($upit);
    $rezultat = mysqli_fetch_array($rezultati);
    $idKuponi[] = $rezultat["ID_kupona"];
    $idpodrucja[] = $rezultat["ID_podrucja"];
    $bodovi[] = $rezultat["Broj_bodova"];
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
$odgovor = array();
$i = 0;
foreach ($imenaPodrucja as $red) {
    $zapis = array();
    array_push($zapis, $idKuponi[$i]);
    array_push($zapis, $imenaKupona[$i]);
    array_push($zapis, $bodovi[$i]);
    array_push($zapis, $red);
    
    
    
    array_push($odgovor, $zapis);
    $i++;
}

echo json_encode($odgovor);

