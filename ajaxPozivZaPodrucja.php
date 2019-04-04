<?php
include 'baza.class.php';
    if(isset($_POST)){
        $baza = new Baza();
        $baza->spajanjeNaBazu();
        $podrucje = $_POST["name"];
        $upit = "Select * from Podrucje where Ime_podrucja='$podrucje'";
        $rezultati = $baza->selectUpit($upit);
        $rezultat = mysqli_fetch_array($rezultati);
        $idPodrucja = $rezultat['idPodrucje'];
        $upit = "Select * from Rezervacija where id_podrucje=".$idPodrucja;
        $rezultati = $baza->selectUpit($upit);
        $idUlicePolaska = array();
        $idRezervacije = array();
        while($rezultat = mysqli_fetch_array($rezultati)){
            $idUlicePolaska[] = $rezultat['Ulica_polaska'];
            $idRezervacije[] = $rezultat['idRezervacija'];
            
        }
        $idvozilaOdVoznji = array();
        $idRezervacijeOdVoznji = array();
        $vremenaVoznji = array();
        for($i=0; $i<count($idRezervacije); $i++){
            $upit = "Select * from Voznja where ID_rezervacije=".$idRezervacije[$i];
            $rezultati = $baza->selectUpit($upit);
            $rezultat = mysqli_fetch_array($rezultati);
            if(isset($rezultat)){
                $idvozilaOdVoznji[] = $rezultat['ID_vozila'];
                $idRezervacijeOdVoznji[]= $rezultat['ID_rezervacije'];
                $vremenaVoznji[] = $rezultat['vrijeme'];
            }
        }
        
       $povratniString = "";
       $ImenaUlica = array();
       $idUlice = array();
       $uliceOdredista = array();
       for($i=0; $i<count($idvozilaOdVoznji); $i++){
            $sqlUpit = "Select * from Rezervacija where idRezervacija=".$idRezervacijeOdVoznji[$i];
            $rezultati = $baza->selectUpit($sqlUpit);
            $rezultat = mysqli_fetch_array($rezultati);
            $idUlice[] = $rezultat['Ulica_polaska'];
            $uliceOdredista[] = $rezultat['Ulica_odredista'];
        }
        
        for($i=0; $i<count($idvozilaOdVoznji); $i++){
            $sqlUpit = "Select * from Ulica where idUlica=".$idUlice[$i];
            $rezultati = $baza->selectUpit($sqlUpit);
            $rezultat = mysqli_fetch_array($rezultati);
            $ImenaUlica[] = $rezultat['Ime_ulice'];
        }
        
        for($i=0; $i<count($idvozilaOdVoznji); $i++){
            $povratniString =  $povratniString."#".$idvozilaOdVoznji[$i].";".$ImenaUlica[$i].";".$vremenaVoznji[$i].";".$uliceOdredista[$i].";";
            
        }
        $_POST["name"] = $povratniString;
        echo $_POST["name"];
    }
?>