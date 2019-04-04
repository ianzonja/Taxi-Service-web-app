<?php
?>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
            $("#izbornik").load("Izbornik-neregistrirani.html"); 
        });
        </script>
    </head>
    <body>
        <div id="header"></div>
        <div id="izbornik"></div>
        <div id="moderatorIzbornik" style="vertical-align: top">
        </div>
        <div class="content" style="height: 7000px">
            <div class="naziv">
                <h2>Sveučilište u Zagrebu</h2>
                <h2>Fakultet Organizacija i Infromatike</h2>
                <h1>Projekt iz kolegija Web dizajn i programiranje</h1>
                <h2>Taxi prijevoz</h2>
            </div>
            <div class="o-autoru">
                <h4>Autor: Ian Žonja</h4>
                <h4>41905/13-R</h4>
            </div>
            <div class="opis-projektnog-zadatka">
                <h4>1. Opis projektnog zadatka</h4>
                <p>Taxi prijevoz je tema projekta koji riješava sve bitnije zahtjeve kompanije koja se bavi taxi prijevozom. Projekt se sastoji od 4 različite uloge: neregistrirani korisnik, registrirani korisnik, moderator i administrator. Također, osim uloga koje specifikacija zahtjeva, zahtjevi specifikacije uključuju još nekoliko važnih funkcionalnih podvrsta: login, registraciju, rad sustava te posebne osobine. Razlike među ulogama su te da svaka uloga ima hijerrahijski određena prava. Neregistrirani korisnik ima najmanje prava, dok administrator ima gotovo sva prava kod korištenja aplikacije. Kada se korisnik prijavi u sustav, dobija pregled aktivnosti koje on može obavljati na aplikaciji. Svi prijavljeni korisnici imaju navigaciju za registriranog korisnika te su to minimalni zahtjevi za registriranog korisnika. Nadalje, administrator te moderator imaju svoje posebne izbornike sa lijeve strane koji im omogučavaju izvršavanje skripti za koje samo oni imaju prava. Sama svrha cijelog projekta je ta da korisnik lakše rezervira taxi prijevoz te da odgovorne uloge vode računa o normalnom tijeku svih akcija koje se dešavaju na aplikaciji.</p>
            </div>
            <div class="opis-projektnog-rješenja">
                <h4>2. Opis projetnog rješenja</h4>
                <h5>2.1. Neregistrirani korisnik</h5>
                <p>Neregistrani korisnik je uloga koja ima najmanje realiziranih mogučnosti. Ova uloga je uloga koja je na snazi prije prijave u sustav. Neregistrirani korisnik (osim registracije i prijave) može pregledati područja koja su definirana te prelaskom miša preko imena jednog od područja, dobije ispis zadnjih prijevoza za to područje.</p>
                <h5>2.2. Registrirani korisnik</h5>
                <p>Registrirani korisnik je uloga koja ima prava oizvršavanja operacija koje su namijenjene krajnjem korisniku. Nakon što se uspješno prijavi u sustav, prikaže mu se navigacija sa gumbovima koji mu omogučavaju daljnje rukovanje aplikacijom. Gumbovi koju mu se prikažu su: "Područja", "Rezervacije", "Bodovi", "Kuponi", "Košarica" te "Odjava". Dodatno, kada pređe mišem preko gumba "Rezervacije", stvore mu se još dva gumba "Kreirane rezervacije" te "Odrađene vožnje". Gumb "Područja" vodi na skriptu s područjima koja je već opisana kod neregistriranog korisnika. Gumb "Rezervacije" vodi korisnika na formu za rezervaciju prijevoza. U toj formi mu se prvo prikažu sva područja koja su definirana u aplikaciji te kada odabere jedan od željenih područja te klikne gumb "Potvrda područja", tada mu se pojave ulice koje su definirane kao polazne točke za to područje te odabir datuma rezervacije kao i unos ulice za odredište. Ako je ispravno unio podatke i kliknuo na gumb "Rezervacija", prijevoz će biti rezerviran.</p>
                <p>Kao što smo već napomenuli, prelaskom preko miša na gumb "Rezervacije" pojaviti će se 2 dodatna gumba "Kreirane rezervacije" i "Odrađene vožnje". Klikom na "Kreirane rezervacije" pojavljuje se forma sa rezervacijama tog korisnika. Svaka rezervacija prikazuje stavke rezervacije te informaciju o tome je li je rezervacija prihvačena ili odbijena od strane moderatora. Nadalje, klikom na gumb "Odrađene vožnje" otvara se forma sa vožnjama koje su već odrađene te u ovoj formi registrirani korisnik može napisati povratnu informaciju za vožnju (ukoliko to nije već učinio).</p>
                <p>Klikom na gumb "Bodovi" otvara se forma koja služi kao evidencija bodova za korisnika. U ovoj formi se prikazuje broj bodova koje korisnik ima te su u dvije tablice raspoređene informacije o zarađenim bodovima, dok u drugoj tablici imamo informacije o potrošenim bodovima te kako su potrošeni.</p>
                <p>Gumb "Kuponi" vodi na formu čija je uloga prikaz svih kupona za određeno područje. Korisnik prvo klikne za koje područje želi pretraživati kupone te kada klikne na gumb "1.Potvrda područja" pojavi mu se forma sa svim kuponima koji su definirani za to područje, u obliku galerije slika. Nadalje, klikom na sliku kupona, otvara se nova stranica sa opisom tog kupona koji je odabran. Također, ako korisnik želi kupon ubaciti u košaricu, vrši to klikom na gumb "Ubaci u košaricu".</p>
                <p>Klik na gumb "Košarica" ga vodi na formu koja prikazuje stanje košarice. Korisnik je mogao s vremenom ubacivati kupone u košaricu te mu se ovdje prikažu sve stavke košarice, kao i njegovi bodovi te razlika bodova u slučaju kupnje. Ako korisnik ima manje bodova nego li je vrijednost košarice, aplikaciju mu onemogučava klik na gumb "Kupi". Također, ako želi maknuti neke stavke iz košarice, to izvršava klikom na ime kupona u comboboxu te klikom na gumb "Pošalji".</p>
                <p>Klik na gumb "Odjava označava zatvaranje sesije te slanje korisnika na skriptu za prijavu</p>
                <h5>2.3. Moderator</h5>
                <p>Moderator je uloga koja biva definirana od strane administratora. Moderatoru su važna područja kojima je dodijeljen od strane administratora. Kada je dodijeljen nekom području, ima nekoliko posebnih akcija koje on može obavljati. Ukoliko mu nije dodijeljeno nijedno područje, tada on i nema neka posebna prava za razliku od običnog registriranog korisnika. Moderator ima poseban izbornik s lijeve strane ekrana koji uključuje posebne mogučnosti moderatora. U tom izborniku imamo gumbove "Kreiranje ulica", "Prihvat rezervacija", "Evidencija rezervacija" te "Evidencija kupona". Klikom na gumb "Kreiranje ulica" otvara se forma sa područjima koja su mu dodijeljena kao moderatoru. Klikom na odabrano područje te unosom imena ulice prije klika na gumb "Pošalji" vrši operaciju kreiranja ulice kao polazišne točke za odabrano područje.</p>
                <p>Klikom na "Prihvat rezervacija" otvara se skripta sa svim novim rezervacijama koje su kreirane za područje kojima je on dodijeljen. Ovdje odabirom rezervacije te klikom na gumb "Prihvati" ili "Odbij" moderator odlučuje hoće li prihvatiti odnosno odbiti rezervaciju.</p>
                <p>Ukoliko klikne na "Evidencija rezervacija", otvara se forma sa svim rezervacijama koje su prihvačene. Ukoliko je neka od vožnja već izvršena, tada moderator u ovoj formi može označiti rezervaciju kao obavljenu.</p>
                <p>Moderator također ima i ovlaštenje evidencije kupona pa tako klikom na "Evidencija kupona" se otvara forma u kojoj može vidjeti dvije liste: -listu obrađenih i listu neobrađenih kupona. Lista obrađenih kupona predstavlja sve kupone koje je moderator definirao za to područje, dodijelio im bodove itd. S druge strane, lista neobrađenihk upona su svi oni kuponi koje moderator nije obradio te ih tu može obraditi.</p>
                <h5>2.4. Administrator</h5>
                <p>Administrator je po hijerarhiji najjača uloga u aplikaciji. On može obavljati (odnosno pregledati) sve funkcionalnosti koje mogu i drugi korisnici te on još ima dodatne 4 funkcionalnosti. Prva važna funkcionalnost administrator je kreiranje područja, pa tako klikom na gumb "Područja" u izborniku za administratora otvara se forma u kojoj on unosi ime novog područja te mu dodjeljuje jednog od dostupnih moderatora. Nadalje, klikom na gumb "Kuponi" otvara se forma na kojoj može kreirati novi kupon. Klikom na gumb "Evidencija lojalnosti" otvara se forma u kojoj može filtrirati podatke po korisniku, akciji, datumu i bodovima. Na taj način vidi tko je i kada izvršio neku akciju.</p>
                <p>Klikom na gumb "Korisnički računi" otvara se forma u kojoj administrator vidi sve korisničke račune te može odabrati koji će od njih otključati, odnosno zaključati. Također, na ovoj formi može i promovirati korisnika u moderatora.</p>              
            </div>
            <div class="shema-baze-podataka">
                <h4>3. Shema Baze podataka</h4>
                <p>Baza podataka je kreirana u phpMyAdmin sustavu, odnosno baza je MySql baza podataka. U bazi su za potrebe projekta definirane 22 tablice od kojih su 7 asocijacijskih tablica. Entiteti koje sam definirao su redom: Akcija, Dnevnik, Korisnik, Kosarica, Kupon, Lojalnost, Podrucje, Rezervacija, Ulica, Vozilo, Voznja, Vrsta_korisnika.</p>
                <img src="slike/era.PNG" alt="era" width="600px">
            </div>
            <div class="navigacijski">
                <h4>4. Navigacijski dijagram</h4>
                <img src="slike/diagram.png" alt="navigacijski" style="width: 600px">
            </div>
            <div class="opis-koristenih-alata">
                <h4>4. Opis korištenih alata</h4>
                <p>Za potrebe projekta koristio sam jezike html 5, css 3, javascript, jquery te PHP. Nisam koristio vanjske biblioteke osim za funkctionalnost captcha te api društvene mreže.</p>
            </div>
            <div class="opis-zavrsenosti">
                <h4>5. Opis završenosti projekta</h4>
                <p>Okvirno bih rekao da je postotak završenosti projekta 70%. Ima puno funkcionalnosti koje nisu implementirane, ali još više onih implementiranih. Implementirane funkcionalnosti su: Provjera korisničkog imena preko AJAX-a, CAPTCHA, Validacija klijent, Validacija server, E-mail aktivacija, Pamčenje prijavljenog korisnika u kolačić, Prijava u dva koraka, Uspješna odjava sa sustava, Zaključavanje korisničkog računa, Zaboravljena lozinka, Uloga neregistrani korisnik, Skupljanje bodova, Galerija slika, Košarica, Ostala funkcionalnost moderatora, Otključavanje te bblokiranje krisničkog računa, Kreiranje i dodjela moderatora, Kreiranje kupona, Statistika lojalnosti, SEO linkovi te API socijalne mreže. Neimplementirane funkcionalnosti su: .htaccess ispis korisnika, prijava putem HTTPS-a, POmak vremena, Dnevnik, Prilagođavanje mediju, Kolačić za uvjete korištenja, Sortiranje kolona, Izgled stranice, Konfiguracija sustva, Pregled i pretraživanje dnevnika, Dodavanje, pregled i izmejna podataka u tablicama, Smarty, AngularJS, Canvas, Generiranje PDF-a te Zaštita XSS i SQL ubacivanje.</p> 
            </div>
            <div class="opis-skripti">
                <h4>6. Opis skripti</h4>
                <b>6.1. index.php</b>
                <p>Index.php je skripta za prijavu kod koje se korisnici prijavljuju u sustav. Pomoću ove skripte korisnik se može prijaviti, može si blokirati račun ukoliko bude 3 neuspješne prijave, opcionalno se može prijaviti preko 2 koraka te odabrati funkcionalnost "Zaboravljena lozinka".</p>
                <b>6.2. aktivacija_racuna.php</b>
                <p>Aktivacija računa služi kod otključavanja računa te prijave dva koraka. I kod jedne i kod druge prijave se korisniku na mail šalje kod sa kojim će izvršiti do kraja traženu funkcionalnost.</p>
                <b>6.3. zaboravljena_lozinka.php</b>
                <p>Pomoću skripte zaboravljena_lozinka.php korisnik može dobiti novu lozinku tako što unese svoj username i na mail mu se pošalje nova lozinka.</p>
                <b>6.4. Registracija.php</b>
                <p>U skripti Registracija.php korisnik može registrirati račun. Prvo obavezno mora potvrditi Camptchu koja se nalazi na stranici te zatim unijeti potrebne podatke. Ako niju unio neki podatak krivo, račun će biti registriran.</p>
                <b>6.5. podrucja.php</b>
                <p>Skripta s podrucjima koja je dostupna i registriranim i neregistriranim korisnicima. Skripta prikazuje sva područja i ulice koje postoje te hoverom miša preko nekog od područja, sustav ispisuje zadnje vožnje u tom području.</p>
                <b>6.6. dokumentacija.php</b>
                <p>Skripta koja je trenutno na snazi. U njoj se nalazi dokumentacija projekta.</p>
                <b>6.7. rezervacija.php</b>
                <p>Skripta s kojom se može rezervirati prijevoz. Prvo korisnik odabere jedan od područja te zatim podatke o rezervaciji za to područje. Klikom na gumb rezervacija se kreira.</p>
                <b>6.8. korisnik_rezervacije.php</b>
                <p>U ovoj skripti korisnik može vidjeti sve svoje rezervacije te saznati je li je ona prihvačena, odbijena ili neobrađena.</p>
                <b>6.9. korisnik_odradene_voznje.php</b>
                <p>Skripta sa odrađenim vožnjama koja korisniku omogučava pregled odrađenih vožnji te unos povratne informacije.</p>
                <b>6.10. korisnik_bodovi.php</b>
                <p>Skripta koja korisniku omogučava pregled njegovih bodova te mu prikazuje na koji način je zaradio bodove te kako je neke bodove potrošio, odnosno koje je kupone kupio.</p>
                <b>6.11. pregled_kupona.php</b>
                <p>U ovoj skripti korisnik prvo odabire područje za koje želi pregledavati kupone. Kada je odabrao područje, izlistaju mu se svi kuponi koji vrijede u datom trenutku. Klikom na jedan od kupona otvara se nova skripta sa točno tim kuponom.</p>
                <b>6.12. kupon.php</b>
                <p>Ova skripta biva pokrenuta nakon klika na jedan od kupona u galeriji kupona. U ovoj skripti korisnik može pregledati informacije o kuponu te ga ubaciti u košaricu.</p>
                <b>6.13. kosarica.php</b>
                <p>U ovoj skripti korisnik ima pregled stanja trentne košarice te ako ima dovoljno bodova može ju kupiti. Također ako odustane od kupnje nekog od kupona, može ga izbaciti iz košarice.</p>
                <b>6.14. kreiranje_podrucja.php</b>
                <p>Skripta dostupna samo administratoru. U njoj administrator može kreirati novo područje te mu dodijeliti jednog od administratora.</p>
                <b>6.15. dodavanje_kupona.php</b>
                <p>U ovoj skripti administrator može kreirati novi kupon. Obavezno mu mora dodati ime, pdf te sliku, a opcionalno i video.</p>
                <b>6.16. kreiranje_ulica.php</b>
                <p>U ovoj skripti moderator može kreirati polaznu ulicu za područje koje mu je dodijeljeno.</p>
                <b>6.17. lojalnost.php</b>
                <p>Skripta koja administratoru prikazuje lojalnost korisnika. Može filtrirati podatke po korisniku, akciju, datumu akcije od - do te broju bodova. Također mu se ispisuje statistika i u canvas grafikonu.</p>
                <b>6.18. prihvacanje_rezervacija.php</b>
                <p>Skripta kod koje moderator može pregledati nove rezervacije koje su korisnici kreirali te ih prihvatiti ili odbiti.</p>
                <b>6.19. pregled_rezervacija</b>
                <p>U ovoj skripti moderator može označiti rezervaciju kao odrađenu. To znaći da je vožnja, odnosno usluga odrađena. Tada se korisniku omogučava pisanje povratne informacije</p>
                <b>6.20. moderator_pregled_kupona</b>
                <p>Sa ovom skriptom moderator može pregledati sve postojeće kupone te obraditi one koje želi tako što im definira bodove, datume od kada i do kada vrijede te područje za koje vrijedi taj kupon. Također može pretražiti kupone i vidjeti postoje li.</p>
                <b>6.21. odradene_voznje.php</b>
                <p>Moderator može pregledati sve odrađene vožnje za njegovo područje te pročitati povratne informacije korisnika.</p>
                <b>6.22. moderator_izgled_stranice.php</b>
                <p>U ovoj skripti moderator može odrediti kako će izgledati stranica sa kuponima za njegovo područje. Osobine izgleda su: Boja, Stil fonta te veličina fonta.</p>
                <b>6.23 evidencija_korisnickih_racuna.php</b>
                <p>U ovoj skripti administrator može pregledati sve korisničke račune te odabirom bilo kojeg može blokirati ili otključati račun. Također u ovoj skripti može i unaprijediti korisnika u moderatora.</p>
                <b>6.24 dnevnik.php</b>
                <p>U ovoj skripti administrator može vidjeti listu akcija koje su korisnici odradili. (Registracija, prijava....) sve što se dešava na aplikaciji. </p>
            </div>
        </div>
    </body>
</html>

