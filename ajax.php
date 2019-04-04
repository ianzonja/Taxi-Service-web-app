<?php
include 'baza.class.php';
    if(!empty($_POST)){
        $korIme = $_POST["name"];
        $baza = new Baza();
        $upit = "Select * from Korisnik";
        $rezultati = $baza->selectUpit($upit);
        $_POST["name"] = true;
        while($rezultat = mysqli_fetch_array($rezultati)){
            $username = $rezultat['Username'];
            if($korIme == $username){
                $_POST["name"] = "false";
            }
        }
        echo $_POST["name"];
        
    } else {
        echo "Ne valjda";
    }
?>