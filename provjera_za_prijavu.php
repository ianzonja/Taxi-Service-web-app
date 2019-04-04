<?php

include 'baza.class.php';
$korIme = $_POST["name"];
$pass = $_POST["pass"];
$baza = new Baza();
$_POST["name"] = "false";
$upit = "Select * from Korisnik";
$rezultati = $baza->selectUpit($upit);
while ($rezultat = mysqli_fetch_array($rezultati)) {
    $username = $rezultat['Username'];
    $password = $rezultat['Password'];
    if ($pass === $password && $username === $korIme) {
        $_POST["name"] = "true";
    }
}
echo $_POST["name"];
?>
