<?php
class Sesija {
    const SESSION_NAME = "idSesija";
    const TIP = "TIP";
    const ID = "ID";
    const KORIME = "KORIME";
    //Finkcija za kreiranje sesije
    function kSesija ($tip, $id, $korIme){
        session_name(self::SESSION_NAME);
        if(session_id() == ""){
            session_start();
        }
        $_SESSION[self::TIP] = $tip;
        $_SESSION[self::ID] = $id;
        $_SESSION[self::KORIME] = $korIme;
    }
    //Funkcija za provjeru sesije (da li je korisnik prijavljen)
    function provjeriSesiju (){
            session_name(self::SESSION_NAME);
            if(session_id() == ""){
                session_start();
            }
            if (isset($_SESSION[self::ID])){
                $id = $_SESSION[self::ID];
            } else {
                return null;
            }
            return $id;
        }
    function dohvatiUlogu(){
        session_name(self::SESSION_NAME);
        if(session_id() == ""){
            session_start();
        }
        if(isset($_SESSION[self::TIP])){
            $tip = $_SESSION[self::TIP];
        } else {
            return 0;
        }
        return $tip;
    }
    
    function dohvatiKorIme(){
        session_name(self::SESSION_NAME);
        if(session_id() == ""){
            session_start();
        }
        if(isset($_SESSION[self::KORIME])){
            $korIme = $_SESSION[self::KORIME];
        } else {
            return 0;
        }
        return $korIme;
    }
 
    //Funkcija za brisanje sesije
    function bSesija (){
        session_name(self::SESSION_NAME);
        if(session_id() == ""){
            session_start();
        }
        session_destroy();
    }
    //Funkcija za kreiranje kola�i�a
    function kKolac ($korIme){
         
    }
    //Funkcija za brisanje kola�i�a
    function bKolac ($korIme){
        setcookie("korisnik", "", time()-1800);
    }
}
?>