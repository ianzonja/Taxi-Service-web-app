<?php
class Baza {
    const server = "localhost";
    const baza = "WebDiP2016x131";
    const korisnik = "WebDiP2016x131";
    const lozinka = "admin_C7U9";
    const lastId = "";
     
    function spajanjeNaBazu() {
        $mysqli = new mysqli(self::server, self::korisnik, self::lozinka, self::baza);
         
        if ($mysqli->connect_errno){
            echo "Neuspješno spajanje na bazu: {$mysqli->connect_errno}, {$mysqli->connect_error}"; 
        }
        return $mysqli;
    }
     
    function prekidVeze() {
        $veza = self::spajanjeNaBazu();
        if(mysqli_close($veza)){
        } else {
            echo "Veza s bazom neuspješno prekinuta iz nepoznatog razloga";
        }
    }
     
    function selectUpit($upit){
        $veza = self::spajanjeNaBazu();
        $rezultat = $veza->query($upit) or trigger_error("Greška kod upita: {$upit} - Greška: ".$veza->error.''.E_USER_ERROR);
         
        if(!$rezultat){
            $rezultat = null;
        }
        return $rezultat;
    }
    function ostaliUpiti($upit){
        $veza = self::spajanjeNaBazu();
        if($rezultat = $veza->query($upit)){
            self::prekidVeze();
        } else {
            echo $upit;
            echo "ne moze";
            exit();
        }
        return $rezultat;
    }
 
}
?>


