-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2017 at 04:04 PM
-- Server version: 5.5.55
-- PHP Version: 5.4.45-0+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `WebDiP2016x131`
--
CREATE DATABASE `WebDiP2016x131` DEFAULT CHARACTER SET latin2 COLLATE latin2_croatian_ci;
USE `WebDiP2016x131`;

-- --------------------------------------------------------

--
-- Table structure for table `Akcija`
--

CREATE TABLE IF NOT EXISTS `Akcija` (
  `idAkcije` int(11) NOT NULL,
  `ImeAkcije` varchar(45) DEFAULT NULL,
  `Broj_bodova` int(11) DEFAULT NULL,
  `Akciju_kreirao` int(11) NOT NULL,
  PRIMARY KEY (`idAkcije`),
  KEY `idAdmina_idx` (`Akciju_kreirao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Akcija`
--

INSERT INTO `Akcija` (`idAkcije`, `ImeAkcije`, `Broj_bodova`, `Akciju_kreirao`) VALUES
(1, 'Uspješna registracija', 5, 3),
(2, 'Uspješna prva prijava', 5, 6),
(3, 'Izvršena prva rezervacija', 20, 6),
(4, 'Izvršen prijevoz', 5, 1),
(5, 'Pređenih 5 kilometara', 5, 7),
(6, 'Izvršen prvi prijevoz', 15, 6),
(7, 'Pređenih 100 kilometara', 150, 5),
(8, 'Uspješno poslan feedback', 10, 5),
(9, 'Uspješno verificiran račun', 10, 1),
(10, 'Pređenih 50 kilometara', 50, 10),
(11, 'Izvrsena prijava 2 koraka', 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Akciju_izvrsio`
--

CREATE TABLE IF NOT EXISTS `Akciju_izvrsio` (
  `ID_IzvrsavanjaAkcije` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Akcije` int(11) NOT NULL,
  `ID_Korisnika` int(11) NOT NULL,
  `Datum_obavljanja` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_IzvrsavanjaAkcije`),
  KEY `idAkcije_idx` (`ID_Akcije`),
  KEY `idKorisnika_idx` (`ID_Korisnika`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `Akciju_izvrsio`
--

INSERT INTO `Akciju_izvrsio` (`ID_IzvrsavanjaAkcije`, `ID_Akcije`, `ID_Korisnika`, `Datum_obavljanja`) VALUES
(36, 4, 1, '2017-06-18 23:15:45'),
(37, 4, 1, '2017-06-18 23:18:13'),
(38, 4, 1, '2017-06-18 23:18:32'),
(39, 4, 1, '2017-06-18 23:19:57'),
(40, 4, 1, '2017-06-18 23:20:10'),
(41, 4, 1, '2017-06-18 23:20:30'),
(42, 1, 64, '2017-06-19 15:10:43'),
(43, 11, 64, '2017-06-19 15:13:21'),
(44, 2, 64, '2017-06-19 15:13:57'),
(45, 1, 65, '2017-06-19 17:39:58'),
(46, 1, 66, '2017-06-19 17:41:39'),
(47, 4, 2, '2017-06-20 16:48:02'),
(48, 1, 67, '2017-06-20 22:22:42'),
(49, 11, 67, '2017-06-20 22:24:54'),
(50, 2, 67, '2017-06-20 22:26:10'),
(51, 3, 67, '2017-06-20 22:29:59'),
(52, 3, 64, '2017-06-20 23:17:27'),
(53, 2, 2, '2017-06-20 23:24:57'),
(54, 3, 2, '2017-06-20 23:25:16'),
(55, 2, 1, '2017-06-20 23:26:57'),
(56, 4, 2, '2017-06-20 23:27:38'),
(57, 4, 2, '2017-06-20 23:27:44'),
(58, 4, 2, '2017-06-20 23:27:48'),
(59, 1, 68, '2017-06-21 00:04:05'),
(60, 2, 3, '2017-06-21 00:05:55'),
(61, 1, 8, '2017-06-21 08:34:25'),
(62, 1, 70, '2017-06-21 08:37:42'),
(63, 11, 70, '2017-06-21 08:41:17'),
(64, 2, 70, '2017-06-21 08:41:27'),
(65, 3, 70, '2017-06-21 08:55:45'),
(66, 4, 70, '2017-06-21 08:57:13'),
(67, 1, 71, '2017-06-26 14:50:14'),
(68, 3, 3, '2017-06-26 14:53:18'),
(69, 11, 68, '2017-06-26 14:57:28'),
(70, 2, 68, '2017-06-26 14:57:35'),
(71, 4, 67, '2017-06-26 14:58:52'),
(74, 4, 1, '2017-06-13 11:00:00'),
(75, 4, 1, '2017-06-13 11:00:00'),
(76, 4, 1, '2018-06-14 00:00:00'),
(77, 4, 1, '2017-06-17 00:00:00'),
(78, 4, 1, '2017-07-17 00:00:00'),
(79, 2, 5, '2017-07-04 11:43:06'),
(80, 3, 5, '2017-07-04 11:43:34'),
(81, 4, 5, '2017-07-04 11:45:58'),
(82, 11, 5, '2017-07-04 12:05:11'),
(83, 11, 3, '2017-07-04 12:29:37'),
(84, 4, 5, '2017-07-04 15:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `AktivacijskiKod`
--

CREATE TABLE IF NOT EXISTS `AktivacijskiKod` (
  `ID_koda` int(11) NOT NULL AUTO_INCREMENT,
  `Kod` varchar(8) NOT NULL,
  `ID_korisnika` int(11) NOT NULL,
  PRIMARY KEY (`ID_koda`),
  KEY `ID_korisnika` (`ID_korisnika`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `AktivacijskiKod`
--

INSERT INTO `AktivacijskiKod` (`ID_koda`, `Kod`, `ID_korisnika`) VALUES
(68, '485719', 8),
(71, '852139', 71);

-- --------------------------------------------------------

--
-- Table structure for table `Dnevnik`
--

CREATE TABLE IF NOT EXISTS `Dnevnik` (
  `idDnevnika` int(11) NOT NULL AUTO_INCREMENT,
  `ID_radnje` int(255) NOT NULL,
  PRIMARY KEY (`idDnevnika`),
  KEY `ID_radnje` (`ID_radnje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `JeRezervirao`
--

CREATE TABLE IF NOT EXISTS `JeRezervirao` (
  `ID_Rezerviranja` int(11) NOT NULL AUTO_INCREMENT,
  `ID_korisnika` int(11) NOT NULL,
  `ID_rezervacije` int(11) NOT NULL,
  PRIMARY KEY (`ID_Rezerviranja`),
  UNIQUE KEY `ID_rezervacije` (`ID_rezervacije`),
  KEY `ID_korisnika` (`ID_korisnika`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `JeRezervirao`
--

INSERT INTO `JeRezervirao` (`ID_Rezerviranja`, `ID_korisnika`, `ID_rezervacije`) VALUES
(31, 1, 57),
(32, 1, 58),
(33, 67, 59),
(34, 64, 60),
(35, 2, 61),
(36, 2, 62),
(37, 2, 63),
(38, 70, 64),
(39, 3, 65),
(40, 5, 66),
(41, 5, 67);

-- --------------------------------------------------------

--
-- Table structure for table `Korisnik`
--

CREATE TABLE IF NOT EXISTS `Korisnik` (
  `idKorisnik` int(11) NOT NULL AUTO_INCREMENT,
  `BrojTelefona` varchar(10) NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Ime` varchar(45) DEFAULT NULL,
  `Prezime` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `KorisnikZakljucan` tinyint(1) NOT NULL,
  `DatumRodjenja` date NOT NULL,
  `Broj_bodova` int(11) DEFAULT '0',
  `Vrsta_korisnika_idVrsta_korisnika` int(11) NOT NULL,
  PRIMARY KEY (`idKorisnik`),
  UNIQUE KEY `idKorisnik` (`idKorisnik`),
  KEY `fk_Korisnik_Vrsta_korisnika_idx` (`Vrsta_korisnika_idVrsta_korisnika`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `Korisnik`
--

INSERT INTO `Korisnik` (`idKorisnik`, `BrojTelefona`, `Username`, `Password`, `Ime`, `Prezime`, `Email`, `KorisnikZakljucan`, `DatumRodjenja`, `Broj_bodova`, `Vrsta_korisnika_idVrsta_korisnika`) VALUES
(1, '', 'Peric123', 'Pero1123', 'Pero', 'Peric', 'VSzj54', 0, '0000-00-00', 30, 2),
(2, '', 'Matic123', 'LDtd15', 'Marko', 'Matic', 'qweqwe', 0, '0000-00-00', 57, 1),
(3, '', 'Franjo123', 'Franjic123', 'Franjo', 'Franjic', 'franjofranjic@gmail.com', 0, '0000-00-00', 65, 3),
(4, '', 'IlllanoisFriend', 'qwert123', 'Mislav', 'Bašić', 'mislavbasic@gmail.com', 0, '0000-00-00', 7, 3),
(5, '', 'AppUser', 'PJcm11', 'Katarina', 'Varjacic', 'ianzonja@hotmail.com', 0, '2007-07-12', 78, 1),
(6, '', 'matijica12', 'asdqwwe', 'Matija', 'Jović', 'matijajovic@hotmail.com', 0, '0000-00-00', 22, 3),
(7, '', 'kris', 'kris123', 'kristiana', 'vitez', 'krisvit@foi.hr', 0, '0000-00-00', 1, 3),
(8, '', 'Karlo23', 'pas12345', 'Karlo', 'Peric', 'karloper@foi.hr', 1, '0000-00-00', 50, 1),
(9, '', 'kile12', 'sifra123', 'Kiki', 'Matic', 'kikimat@yahoo.com', 0, '0000-00-00', 5, 2),
(10, '', 'VojkoV', 'dječaci123', 'Vojko', 'Vručina', 'vojkoV@gmail.com', 1, '0000-00-00', 10, 2),
(18, '1234567', 'Matija123', 'MAtija12', 'Maric', 'Matija', 'mail@mail.com', 1, '2000-10-10', 0, 1),
(55, '1234567', 'Opet12', 'OPet12', 'Opet', 'Josjednom', 'opet@gmail.com', 1, '2000-10-10', 0, 1),
(56, '1234567', 'Nestonovo12', 'NEsto12', 'Nestonovo', 'Novo', 'neki@nesto.com', 1, '2000-10-10', 0, 1),
(57, '1234567', 'Qweas12', 'QWeas12', 'Qwease', 'Sasweq', 'qerasd@gmail.com', 0, '2000-10-10', 0, 1),
(58, '1234567', 'Zadnje12', 'ZAdnje12', 'Zadnje', 'Zadnjica', 'zadnja@zadnje.com', 0, '2000-10-10', 0, 2),
(59, '0957423290', 'Stjepo12', 'STjepo123', 'Stjepan', 'Hradovi', 'fgfdggd', 1, '0000-00-00', 0, 1),
(60, '0977066002', 'Stipe12', 'STipe12', 'Stipe', 'Bilobara', 'ianzonja@hotmail.com', 1, '0000-00-00', 0, 2),
(64, '0917301385', 'Novikor12', 'NOvi123', 'Novi', 'Korisnik', 'ianzonja@hotmail.com', 0, '0000-00-00', 48, 2),
(65, '0917401385', 'Mario12', 'MArio12', 'Mario', 'Jerak', 'mario@mario.com', 0, '0000-00-00', 5, 1),
(66, '0917301385', 'Ivan123', 'IVan12', 'Ivano', 'Ivkovic', 'ivan@mail.com', 0, '0000-00-00', 5, 1),
(67, '0917301385', 'Marino12', 'KKat46', 'Marino', 'Ivandic', 'ianzonja@hotmail.com', 0, '0000-00-00', 65, 1),
(68, '0917301387', 'Korisnik12', 'KOrisnik12', 'Korisnik', 'Korisnikic', 'ianzonja@hotmail.com', 0, '0000-00-00', 40, 2),
(69, '0917301385', 'Karlo23', 'KArlo23', 'Karlo', 'Karlic', 'ianzonja@hotmaiil.com', 1, '0000-00-00', 0, 1),
(70, '0917301385', 'Matija1234', 'HEua26', 'Matija', 'Maric', 'teciwisu@ipdeer.com', 0, '0000-00-00', 50, 1),
(71, '1231231', 'Presjednik12', 'PRedsjednik12', 'Predsjednik', 'Peric', 'ianzonja@hotmail.hr', 0, '0000-00-00', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Kosarica`
--

CREATE TABLE IF NOT EXISTS `Kosarica` (
  `ID_stavke` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Korisnika` int(11) NOT NULL,
  `ID_KuponaPoPodrucju` int(11) NOT NULL,
  PRIMARY KEY (`ID_stavke`),
  KEY `ID_Korisnika` (`ID_Korisnika`),
  KEY `ID_KuponaPoPodrucju` (`ID_KuponaPoPodrucju`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Kosarica`
--

INSERT INTO `Kosarica` (`ID_stavke`, `ID_Korisnika`, `ID_KuponaPoPodrucju`) VALUES
(1, 3, 1),
(2, 1, 48);

-- --------------------------------------------------------

--
-- Table structure for table `Kupon`
--

CREATE TABLE IF NOT EXISTS `Kupon` (
  `idKupon` int(11) NOT NULL AUTO_INCREMENT,
  `Ime_kupona` varchar(45) DEFAULT NULL,
  `Kupon_izradio` int(11) NOT NULL,
  `Pdf_dokument` varchar(255) NOT NULL,
  `Slika_kupona` varchar(255) NOT NULL,
  `Video_kupona` text,
  PRIMARY KEY (`idKupon`),
  KEY `idAdministratora_idx` (`Kupon_izradio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `Kupon`
--

INSERT INTO `Kupon` (`idKupon`, `Ime_kupona`, `Kupon_izradio`, `Pdf_dokument`, `Slika_kupona`, `Video_kupona`) VALUES
(11, 'Kupon za starce', 3, 'Kupon za starce.pdf', 'Kupon za starce.png', NULL),
(12, 'Kuopn za mlade', 3, 'Kuopn za mlade.pdf', 'Kuopn za mlade.png', NULL),
(13, 'Kupon za studente', 3, 'Kupon za studente.pdf', 'Kupon za studente.png', NULL),
(14, 'Kupon za mame', 3, 'Kupon za mame.pdf', 'Kupon za mame.png', NULL),
(15, 'Kupon za Dagija', 3, 'Kupon za Dagija.pdf', 'Kupon za Dagija.png', NULL),
(16, 'Novi kupon', 3, 'Novi kupon.pdf', 'Novi kupon.png', NULL),
(17, 'Kupon za visokoobrazovane', 3, 'Kupon za visokoobrazovane.pdf', 'Kupon za visokoobrazovane.png', NULL),
(18, 'Kupon za djecu', 3, 'Kupon za djecu.pdf', 'Kupon za djecu.png', NULL),
(19, 'Kupon 1', 3, 'Kupon 1.pdf', 'Kupon 1.png', NULL),
(20, 'Kupon 2', 3, 'Kupon 2.pdf', 'Kupon 2.png', NULL),
(21, 'Kupon radi li', 3, 'Kupon radi li.pdf', 'Kupon radi li.PNG', 'null'),
(22, 'fddfgdf', 3, 'fddfgdf.pdf', 'fddfgdf.PNG', 'null'),
(23, 'fghgfh', 3, 'fghgfh.pdf', 'fghgfh.PNG', 'fghgfh.mp4'),
(24, 'Najzadnji kupon', 3, 'Najzadnji kupon.pdf', 'Najzadnji kupon.PNG', 'Najzadnji kupon.mp4'),
(25, 'Kupon za strance', 3, 'Kupon za strance.pdf', 'Kupon za strance.png', 'Kupon za strance.'),
(26, 'Kupon s videom sad', 3, 'Kupon s videom sad.pdf', 'Kupon s videom sad.png', 'Kupon s videom sad.mp4'),
(27, 'Poslijednji kupon', 3, 'Poslijednji kupon.pdf', 'Poslijednji kupon.PNG', 'Poslijednji kupon.'),
(28, 'JOs jedan', 3, 'JOs jedan.pdf', 'JOs jedan.PNG', 'JOs jedan.'),
(29, 'I najzadnji', 3, 'I najzadnji.pdf', 'I najzadnji.PNG', 'null'),
(30, 'Vidi se', 3, 'Vidi se.pdf', 'Vidi se.PNG', 'Vidi se.mp4'),
(31, 'Ne vidi se', 3, 'Ne vidi se.pdf', 'Ne vidi se.PNG', 'Ne vidi se.mp4'),
(32, 'Vidi se no video', 3, 'Vidi se no video.pdf', 'Vidi se no video.PNG', 'null'),
(33, 'Kupon12', 3, 'Kupon12.pdf', 'Kupon12.png', 'Kupon12.mp4'),
(34, 'Kupon13', 3, 'Kupon13.pdf', 'Kupon13.PNG', 'Kupon13.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `Lojalnost`
--

CREATE TABLE IF NOT EXISTS `Lojalnost` (
  `idLojalnost` int(11) NOT NULL,
  `idKorisnik` int(11) NOT NULL,
  `idKupon` int(11) NOT NULL,
  `Bodova_potrošeno` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLojalnost`),
  KEY `idKorisnika_idx` (`idKorisnik`),
  KEY `idKupona_idx` (`idKupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Podrucje`
--

CREATE TABLE IF NOT EXISTS `Podrucje` (
  `idPodrucje` int(11) NOT NULL AUTO_INCREMENT,
  `Ime_podrucja` varchar(45) DEFAULT NULL,
  `idAdministratora` int(11) NOT NULL,
  `Boja` text,
  `Font_style` text,
  `velicinaFonta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPodrucje`),
  KEY `_idx` (`idAdministratora`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `Podrucje`
--

INSERT INTO `Podrucje` (`idPodrucje`, `Ime_podrucja`, `idAdministratora`, `Boja`, `Font_style`, `velicinaFonta`) VALUES
(1, 'Zadar', 1, 'Red', 'italic', 33),
(2, 'Split', 1, '#B6D3CE', 'normal', 22),
(3, 'Bibinje', 64, '#B6D3CE', 'normal', 22),
(4, 'Hvar', 1, '#B6D3CE', 'normal', 22),
(5, 'Pazin', 7, '#B6D3CE', 'normal', 22),
(6, 'Omiš', 64, '#B6D3CE', 'normal', 22),
(7, 'Zagreb', 1, '#B6D3CE', 'normal', 22),
(8, 'Nin', 1, '#B6D3CE', 'normal', 22),
(9, 'Kožino', 64, '#B6D3CE', 'normal', 22),
(10, 'Petrčane', 64, '#B6D3CE', 'normal', 22),
(11, 'Varazdin', 10, '#B6D3CE', 'normal', 22),
(12, 'Umag', 10, '#B6D3CE', 'normal', 22),
(13, 'Imotski', 1, '#B6D3CE', 'normal', 22),
(14, 'Cres', 9, '#B6D3CE', 'normal', 22),
(15, 'ÄŒakovec', 1, '#B6D3CE', 'normal', 22),
(16, 'Lipik', 10, '#B6D3CE', 'normal', 22),
(17, 'Budva', 9, '#B6D3CE', 'normal', 22);

-- --------------------------------------------------------

--
-- Table structure for table `Radnja`
--

CREATE TABLE IF NOT EXISTS `Radnja` (
  `ID_radnje` int(11) NOT NULL AUTO_INCREMENT,
  `Radnja` text COLLATE latin2_croatian_ci NOT NULL,
  PRIMARY KEY (`ID_radnje`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Radnja`
--

INSERT INTO `Radnja` (`ID_radnje`, `Radnja`) VALUES
(1, 'Registracija'),
(2, 'Prijava'),
(3, 'Rezervacija'),
(4, 'Prijevoz'),
(6, 'Kupljen kupon'),
(7, 'Kupljena košarica');

-- --------------------------------------------------------

--
-- Table structure for table `RadnjeZaDnevnik`
--

CREATE TABLE IF NOT EXISTS `RadnjeZaDnevnik` (
  `ID_Radnje` int(11) NOT NULL AUTO_INCREMENT,
  `ID_korisnika` int(11) NOT NULL,
  `Opis_radnje` varchar(255) NOT NULL,
  `Datum_radnje` date NOT NULL,
  PRIMARY KEY (`ID_Radnje`),
  KEY `ID_korisnika` (`ID_korisnika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Rezervacija`
--

CREATE TABLE IF NOT EXISTS `Rezervacija` (
  `idRezervacija` int(11) NOT NULL AUTO_INCREMENT,
  `id_podrucje` int(11) NOT NULL,
  `Datum_voznje` date DEFAULT NULL,
  `Ulica_polaska` int(11) NOT NULL,
  `Ulica_odredista` varchar(20) NOT NULL,
  `Povratna_informacija` varchar(255) DEFAULT NULL,
  `VoznjaOdradena` tinyint(1) NOT NULL DEFAULT '0',
  `RezervacijaOdbijena` tinyint(1) NOT NULL DEFAULT '0',
  `Rezervacija_prihvacena` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRezervacija`),
  KEY `idPodrucja_idx` (`id_podrucje`),
  KEY `UlicaPolaska_idx` (`Ulica_polaska`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `Rezervacija`
--

INSERT INTO `Rezervacija` (`idRezervacija`, `id_podrucje`, `Datum_voznje`, `Ulica_polaska`, `Ulica_odredista`, `Povratna_informacija`, `VoznjaOdradena`, `RezervacijaOdbijena`, `Rezervacija_prihvacena`) VALUES
(15, 4, '2017-06-23', 7, 'Koranska', NULL, 0, 1, 0),
(16, 7, '2017-06-30', 14, 'Zagrebacka 33', NULL, 1, 0, 1),
(17, 4, '2017-06-30', 7, 'qqqq', NULL, 0, 1, 0),
(18, 5, '2017-06-13', 1, 'Pazinska', NULL, 1, 0, 1),
(19, 5, '2017-06-30', 1, 'Pokusaj', NULL, 0, 1, 0),
(20, 1, '2017-06-28', 4, 'Zadarska', NULL, 0, 1, 0),
(21, 1, '2017-06-28', 4, 'Zadarska', NULL, 0, 1, 0),
(22, 5, '2017-06-28', 1, 'Sinjska', NULL, 0, 1, 0),
(23, 5, '2017-06-27', 1, 'Krcka', NULL, 0, 1, 0),
(24, 5, '2017-06-29', 1, 'Ponovna ulica', NULL, 0, 1, 0),
(25, 5, '2017-06-26', 1, 'Finishna ulica', NULL, 0, 1, 0),
(26, 3, '2017-07-01', 5, 'Selska', NULL, 0, 1, 0),
(27, 4, '2017-06-22', 7, 'sadsadad', NULL, 0, 1, 0),
(28, 1, '2017-07-02', 9, 'Srpska ulica', NULL, 0, 1, 0),
(29, 1, '2017-07-21', 12, 'Rezervirana ulica', NULL, 0, 1, 0),
(30, 3, '2017-07-03', 5, 'Bibinjska ulica', 'Dobra voÅ¾nja', 1, 0, 1),
(31, 1, '2017-06-30', 4, 'Rezervacijska ulica', NULL, 0, 1, 0),
(32, 1, '2017-06-30', 4, 'Hrvoja Cosica', NULL, 0, 1, 0),
(33, 1, '2017-06-27', 9, 'Ulica Petra Zoranica', NULL, 0, 1, 0),
(34, 1, '2017-06-15', 9, 'Put Knina', NULL, 1, 0, 0),
(35, 4, '2017-06-15', 7, 'Zadarska', NULL, 1, 0, 0),
(36, 3, '2017-06-28', 5, 'Petra Zoranica', NULL, 1, 0, 1),
(37, 1, '2017-06-29', 12, 'J. Merlica', NULL, 0, 1, 0),
(38, 4, '2017-06-30', 11, 'Zagrebacka', NULL, 1, 0, 1),
(39, 1, '2017-06-23', 4, 'Kumova', NULL, 1, 0, 1),
(40, 4, '2017-06-24', 11, 'Praska', NULL, 0, 1, 0),
(41, 7, '2017-06-05', 14, 'Kanadska Ulica', NULL, 0, 1, 0),
(42, 4, '2017-06-30', 11, 'Benkovacka', NULL, 0, 1, 0),
(43, 1, '2017-06-30', 4, 'Put Nina', NULL, 1, 0, 1),
(44, 4, '2017-06-29', 11, 'Splitska', NULL, 1, 0, 1),
(45, 9, '2017-06-30', 3, 'Julija Merlica', NULL, 0, 1, 0),
(46, 3, '2017-06-30', 5, 'Praska', NULL, 0, 1, 0),
(47, 1, '2017-06-29', 12, 'Bavarska', NULL, 0, 1, 0),
(48, 1, '2017-06-30', 12, 'wqqwq', NULL, 1, 0, 1),
(49, 3, '2017-06-30', 5, 'qqwqwwqwq', NULL, 1, 0, 1),
(50, 5, '2017-06-22', 1, 'errwrwr', NULL, 1, 0, 1),
(51, 9, '2017-06-29', 3, 'tertert', NULL, 1, 0, 1),
(52, 3, '2017-06-30', 5, 'ertertert', NULL, 1, 0, 1),
(53, 9, '2017-06-30', 3, 'dsfsdfsdf', NULL, 1, 0, 1),
(54, 7, '2017-06-30', 14, 'gfhfgh', NULL, 1, 0, 1),
(55, 1, '2017-06-29', 9, 'ghgfhfgh', NULL, 1, 0, 1),
(56, 1, '2017-06-30', 4, 'dsfsdf', NULL, 1, 0, 1),
(57, 3, '2017-06-28', 5, 'dfgdfgd', NULL, 1, 0, 1),
(58, 7, '2017-06-29', 14, 'fdsfsdfd', NULL, 1, 0, 1),
(59, 7, '2017-06-29', 14, 'Trg bana Jelacica', NULL, 1, 0, 1),
(60, 9, '2017-06-30', 3, 'Pokusajna ulica', NULL, 0, 0, 1),
(61, 1, '2017-06-30', 4, 'Zagreacka ulica', NULL, 1, 0, 1),
(62, 1, '2017-06-23', 12, 'Varazdinska ulica', NULL, 1, 0, 1),
(63, 1, '2017-06-30', 12, 'Put Nina', NULL, 1, 0, 1),
(64, 15, '2017-06-29', 16, 'Trg Bana Jelacica', 'Dobra voznja', 1, 0, 1),
(65, 1, '2017-06-25', 4, 'Petrcanska ulica', NULL, 0, 0, 1),
(66, 8, '2017-07-22', 19, 'Ninska ulica', 'Super voÅ¾nja!', 1, 0, 1),
(67, 1, '2017-07-09', 18, 'Put Murata', 'Ugoddna voznja', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `StanjeRezervacije`
--

CREATE TABLE IF NOT EXISTS `StanjeRezervacije` (
  `idStanje_rezervacije` int(11) NOT NULL,
  `naziv_stanja_rezervacije` varchar(45) DEFAULT NULL,
  `Administrator_obradio` int(11) NOT NULL,
  `Datum_obrade` datetime DEFAULT NULL,
  PRIMARY KEY (`idStanje_rezervacije`),
  KEY `idAdministratora_idx` (`Administrator_obradio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StanjeRezervacije`
--

INSERT INTO `StanjeRezervacije` (`idStanje_rezervacije`, `naziv_stanja_rezervacije`, `Administrator_obradio`, `Datum_obrade`) VALUES
(1, 'Rezervacija odbijena', 2, '2017-03-17 17:35:51'),
(2, 'Rezervacija prihvacena', 6, '2017-03-11 17:34:17'),
(3, 'Prijevoz odrađen', 2, '2017-03-02 00:00:00'),
(4, 'Prijevoz odbijen', 3, '2017-03-29 19:34:17'),
(5, 'prijevoz prihvačen', 1, '2017-03-04 00:00:00'),
(6, 'Prijevoz odrađen', 6, '2017-03-14 09:27:29'),
(7, 'Rezervacija odbijena', 8, '2017-03-17 00:00:00'),
(8, 'Rezervacija prihvacena', 4, '2017-03-02 13:29:33'),
(9, 'Rezervacija odbijena', 4, '2017-03-26 10:41:33'),
(10, 'Rezervacija prihvacena', 4, '2017-03-10 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Ulica`
--

CREATE TABLE IF NOT EXISTS `Ulica` (
  `idUlica` int(11) NOT NULL AUTO_INCREMENT,
  `Ime_ulice` varchar(45) DEFAULT NULL,
  `idPodrucja` int(11) NOT NULL,
  PRIMARY KEY (`idUlica`),
  KEY `idPodrucja_idx` (`idPodrucja`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `Ulica`
--

INSERT INTO `Ulica` (`idUlica`, `Ime_ulice`, `idPodrucja`) VALUES
(1, 'Zagrebacka ulica', 5),
(2, 'Splitska ulica', 6),
(3, 'Zadarska ulica', 9),
(4, 'Varaždinska ulica', 1),
(5, 'Ulica bana josipa jelacica', 3),
(6, 'Put Nina', 8),
(7, 'Kninska', 4),
(8, 'Maksimirska', 6),
(9, 'Put crvenih kuća', 1),
(10, 'Ulica Stjepana Radića', 8),
(11, 'Benkovacka ulica', 4),
(12, 'Brodska Ulica', 1),
(13, 'Ivanickgradska', 8),
(14, 'Dubrovacka', 7),
(15, '', 1),
(16, 'Varazdinska', 15),
(17, 'Jurisicka', 4),
(18, 'Luke Basica', 1),
(19, 'Ulica donjeg Zemulika', 8);

-- --------------------------------------------------------

--
-- Table structure for table `Vozi`
--

CREATE TABLE IF NOT EXISTS `Vozi` (
  `ID_vozi` int(11) NOT NULL AUTO_INCREMENT,
  `ID_vozilo` int(11) NOT NULL,
  `ID_vozaca` int(11) NOT NULL,
  PRIMARY KEY (`ID_vozi`),
  KEY `ID_vozilo` (`ID_vozilo`,`ID_vozaca`),
  KEY `ID_vozaca` (`ID_vozaca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Vozilo`
--

CREATE TABLE IF NOT EXISTS `Vozilo` (
  `ID_taxija` int(11) NOT NULL AUTO_INCREMENT,
  `Model_auta` varchar(20) NOT NULL,
  `Registarske_oznake` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_taxija`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Vozilo`
--

INSERT INTO `Vozilo` (`ID_taxija`, `Model_auta`, `Registarske_oznake`) VALUES
(1, 'Volvo', 'ZG-335-'),
(2, 'Opel', 'VZ-123-ET'),
(3, 'Mercedes', 'ZD_321-TR');

-- --------------------------------------------------------

--
-- Table structure for table `Voznja`
--

CREATE TABLE IF NOT EXISTS `Voznja` (
  `ID_voznje` int(11) NOT NULL AUTO_INCREMENT,
  `ID_vozila` int(11) NOT NULL,
  `ID_rezervacije` int(11) NOT NULL,
  `vrijeme` datetime NOT NULL,
  PRIMARY KEY (`ID_voznje`),
  KEY `ID_vozila` (`ID_vozila`,`ID_rezervacije`),
  KEY `ID_rezervacije` (`ID_rezervacije`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `Voznja`
--

INSERT INTO `Voznja` (`ID_voznje`, `ID_vozila`, `ID_rezervacije`, `vrijeme`) VALUES
(30, 1, 61, '2017-06-20 23:27:38'),
(31, 2, 62, '2017-06-20 23:27:44'),
(32, 3, 63, '2017-06-20 23:27:48'),
(33, 2, 64, '2017-06-21 08:57:13'),
(34, 2, 59, '2017-06-26 14:58:52'),
(35, 2, 66, '2017-07-04 11:45:58'),
(36, 3, 67, '2017-07-04 15:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `Vrsta_korisnika`
--

CREATE TABLE IF NOT EXISTS `Vrsta_korisnika` (
  `idVrsta_korisnika` int(11) NOT NULL,
  `Naziv_vrste_korisnika` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVrsta_korisnika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vrsta_korisnika`
--

INSERT INTO `Vrsta_korisnika` (`idVrsta_korisnika`, `Naziv_vrste_korisnika`) VALUES
(1, 'Korisnik'),
(2, 'Moderator'),
(3, 'Administrator'),
(4, 'Taksist');

-- --------------------------------------------------------

--
-- Table structure for table `jeIzvrsio`
--

CREATE TABLE IF NOT EXISTS `jeIzvrsio` (
  `ID_izvrseneRadnje` int(11) NOT NULL AUTO_INCREMENT,
  `ID_korisnika` int(11) NOT NULL,
  `ID_radnje` int(11) NOT NULL,
  `Datum` datetime NOT NULL,
  PRIMARY KEY (`ID_izvrseneRadnje`),
  KEY `ID_korisnika` (`ID_korisnika`,`ID_radnje`),
  KEY `ID_radnje` (`ID_radnje`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin2 COLLATE=latin2_croatian_ci AUTO_INCREMENT=94 ;

--
-- Dumping data for table `jeIzvrsio`
--

INSERT INTO `jeIzvrsio` (`ID_izvrseneRadnje`, `ID_korisnika`, `ID_radnje`, `Datum`) VALUES
(1, 71, 1, '2017-06-26 14:50:14'),
(2, 3, 2, '2017-06-26 14:51:40'),
(3, 3, 3, '2017-06-26 14:53:18'),
(4, 1, 2, '2017-06-26 14:56:06'),
(5, 68, 2, '2017-06-26 14:57:35'),
(6, 1, 2, '2017-06-26 14:57:57'),
(7, 67, 4, '2017-06-26 14:58:52'),
(8, 1, 6, '2017-06-26 15:07:08'),
(9, 1, 7, '2017-06-26 15:09:36'),
(10, 3, 2, '2017-06-26 15:28:02'),
(11, 1, 2, '2017-06-26 15:31:07'),
(12, 3, 2, '2017-06-26 15:32:01'),
(13, 1, 2, '2017-06-26 15:34:01'),
(14, 3, 2, '2017-06-26 15:36:09'),
(15, 1, 2, '2017-06-26 15:51:04'),
(16, 3, 2, '2017-06-26 15:51:16'),
(17, 1, 2, '2017-06-26 16:28:14'),
(18, 3, 2, '2017-06-26 16:37:31'),
(19, 1, 2, '2017-06-26 16:39:03'),
(20, 3, 2, '2017-06-26 17:25:35'),
(21, 3, 2, '2017-06-26 17:51:58'),
(22, 3, 2, '2017-06-26 20:35:08'),
(23, 1, 2, '2017-06-26 21:09:18'),
(24, 3, 2, '2017-06-26 21:16:21'),
(25, 1, 2, '2017-06-26 21:17:18'),
(26, 3, 2, '2017-06-29 13:38:11'),
(27, 3, 2, '2017-06-29 20:44:19'),
(28, 3, 6, '2017-06-29 20:56:15'),
(29, 3, 2, '2017-07-03 16:39:46'),
(30, 1, 2, '2017-07-03 17:27:46'),
(31, 1, 2, '2017-07-03 17:40:08'),
(32, 3, 2, '2017-07-03 18:51:59'),
(33, 3, 2, '2017-07-04 10:56:06'),
(34, 1, 2, '2017-07-04 10:58:57'),
(35, 3, 2, '2017-07-04 11:12:15'),
(36, 1, 2, '2017-07-04 11:12:56'),
(37, 3, 2, '2017-07-04 11:14:57'),
(38, 1, 2, '2017-07-04 11:17:58'),
(39, 1, 2, '2017-07-04 11:29:45'),
(40, 3, 2, '2017-07-04 11:30:11'),
(41, 1, 2, '2017-07-04 11:31:12'),
(42, 1, 6, '2017-07-04 11:32:34'),
(43, 3, 2, '2017-07-04 11:32:53'),
(44, 1, 2, '2017-07-04 11:37:08'),
(45, 5, 2, '2017-07-04 11:43:06'),
(46, 5, 3, '2017-07-04 11:43:34'),
(47, 1, 2, '2017-07-04 11:43:44'),
(48, 5, 2, '2017-07-04 11:44:08'),
(49, 1, 2, '2017-07-04 11:45:48'),
(50, 5, 4, '2017-07-04 11:45:58'),
(51, 5, 2, '2017-07-04 11:46:04'),
(52, 1, 2, '2017-07-04 11:46:18'),
(53, 5, 2, '2017-07-04 11:50:50'),
(54, 3, 2, '2017-07-04 11:56:20'),
(55, 5, 2, '2017-07-04 11:58:16'),
(56, 5, 2, '2017-07-04 11:59:28'),
(57, 3, 2, '2017-07-04 12:04:26'),
(58, 5, 2, '2017-07-04 12:04:50'),
(59, 5, 2, '2017-07-04 12:05:27'),
(60, 5, 2, '2017-07-04 12:09:41'),
(61, 5, 2, '2017-07-04 12:09:52'),
(62, 5, 2, '2017-07-04 12:12:13'),
(63, 5, 2, '2017-07-04 12:12:22'),
(64, 5, 2, '2017-07-04 12:13:31'),
(65, 5, 2, '2017-07-04 12:15:29'),
(66, 5, 2, '2017-07-04 12:16:54'),
(67, 5, 2, '2017-07-04 12:20:34'),
(68, 5, 2, '2017-07-04 12:22:44'),
(69, 5, 2, '2017-07-04 12:25:00'),
(70, 5, 2, '2017-07-04 12:28:20'),
(71, 3, 2, '2017-07-04 12:29:46'),
(72, 3, 2, '2017-07-04 13:03:13'),
(73, 1, 2, '2017-07-04 13:17:58'),
(74, 3, 2, '2017-07-04 13:19:51'),
(75, 3, 2, '2017-07-04 13:22:40'),
(76, 5, 2, '2017-07-04 13:22:54'),
(77, 1, 2, '2017-07-04 13:23:17'),
(78, 3, 2, '2017-07-04 13:24:42'),
(79, 3, 2, '2017-07-04 15:05:41'),
(80, 3, 2, '2017-07-04 15:07:55'),
(81, 1, 2, '2017-07-04 15:09:41'),
(82, 5, 2, '2017-07-04 15:12:40'),
(83, 5, 2, '2017-07-04 15:13:33'),
(84, 5, 3, '2017-07-04 15:15:34'),
(85, 1, 2, '2017-07-04 15:15:44'),
(86, 5, 4, '2017-07-04 15:16:04'),
(87, 5, 2, '2017-07-04 15:16:15'),
(88, 1, 2, '2017-07-04 15:16:37'),
(89, 1, 2, '2017-07-04 15:17:41'),
(90, 3, 2, '2017-07-04 15:20:19'),
(91, 3, 2, '2017-07-04 15:31:18'),
(92, 3, 2, '2017-07-04 15:41:47'),
(93, 3, 2, '2017-07-04 15:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `jeKreirao`
--

CREATE TABLE IF NOT EXISTS `jeKreirao` (
  `ID_KreiranjaPodrucja` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Korisnika` int(11) NOT NULL,
  `ID_Podrucja` int(11) NOT NULL,
  PRIMARY KEY (`ID_KreiranjaPodrucja`),
  KEY `ID_Korisnika` (`ID_Korisnika`,`ID_Podrucja`),
  KEY `ID_Podrucja` (`ID_Podrucja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jeKupio`
--

CREATE TABLE IF NOT EXISTS `jeKupio` (
  `ID_kupnje` int(11) NOT NULL AUTO_INCREMENT,
  `ID_korisnika` int(11) NOT NULL,
  `ID_vrednovanja` int(11) NOT NULL,
  `DatumKupnje` datetime NOT NULL,
  PRIMARY KEY (`ID_kupnje`),
  KEY `ID_korisnika` (`ID_korisnika`,`ID_vrednovanja`),
  KEY `ID_vrednovanja` (`ID_vrednovanja`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jeKupio`
--

INSERT INTO `jeKupio` (`ID_kupnje`, `ID_korisnika`, `ID_vrednovanja`, `DatumKupnje`) VALUES
(3, 64, 32, '2017-06-20 23:15:33'),
(4, 70, 33, '2017-06-21 09:01:07'),
(5, 1, 1, '2017-06-26 15:09:36'),
(6, 1, 35, '2017-06-26 15:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `seVrednuje`
--

CREATE TABLE IF NOT EXISTS `seVrednuje` (
  `ID_vrednovanja` int(11) NOT NULL AUTO_INCREMENT,
  `ID_kupona` int(11) NOT NULL,
  `ID_podrucja` int(11) NOT NULL,
  `Broj_bodova` int(11) NOT NULL,
  `vrijediOd` date NOT NULL,
  `vrijediDo` date NOT NULL,
  PRIMARY KEY (`ID_vrednovanja`),
  KEY `ID_kupona` (`ID_kupona`,`ID_podrucja`),
  KEY `ID_podrucja` (`ID_podrucja`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `seVrednuje`
--

INSERT INTO `seVrednuje` (`ID_vrednovanja`, `ID_kupona`, `ID_podrucja`, `Broj_bodova`, `vrijediOd`, `vrijediDo`) VALUES
(1, 11, 1, 33, '2017-03-10', '2017-07-14'),
(18, 12, 4, 12, '2017-06-06', '2017-06-22'),
(19, 15, 1, 10, '2017-06-07', '2017-06-29'),
(20, 15, 8, 20, '2017-06-05', '2017-07-25'),
(21, 11, 13, 55, '2017-06-01', '2017-06-29'),
(22, 13, 13, 20, '2017-06-01', '2017-06-23'),
(23, 13, 13, 20, '2017-06-12', '2017-06-29'),
(24, 16, 13, 44, '2017-06-02', '2017-06-29'),
(25, 15, 13, 15, '2017-06-26', '2017-06-30'),
(26, 13, 2, 35, '2017-06-30', '2017-06-11'),
(27, 18, 13, 10, '2017-06-14', '2017-06-29'),
(28, 11, 9, 25, '2017-06-06', '2017-06-29'),
(29, 12, 10, 33, '2017-06-02', '2017-06-30'),
(30, 13, 3, 55, '2017-06-19', '2017-06-24'),
(31, 14, 9, 22, '2017-06-05', '2017-06-29'),
(32, 15, 9, 12, '2017-06-19', '2017-06-25'),
(33, 19, 15, 15, '2017-06-20', '2017-06-20'),
(34, 20, 15, 25, '2017-06-21', '2017-06-21'),
(35, 14, 1, 50, '2017-06-01', '2017-06-30'),
(36, 23, 1, 20, '2017-06-01', '2017-06-30'),
(37, 21, 15, 30, '2017-06-01', '2017-06-30'),
(38, 24, 13, 33, '2017-06-01', '2017-06-30'),
(39, 25, 1, 40, '2017-07-01', '2017-07-30'),
(40, 22, 1, 90, '2017-06-01', '2017-07-31'),
(41, 17, 15, 100, '2017-07-01', '2017-07-30'),
(42, 26, 13, 35, '2017-07-01', '2017-07-10'),
(43, 27, 8, 35, '2017-07-01', '2017-07-05'),
(44, 28, 8, 20, '2017-07-12', '2017-07-31'),
(45, 29, 8, 30, '2017-07-01', '2017-07-31'),
(46, 30, 2, 30, '2017-07-01', '2017-07-19'),
(47, 31, 2, 30, '2017-07-13', '2017-07-27'),
(48, 32, 2, 30, '2017-07-01', '2017-07-19'),
(49, 33, 8, 30, '2017-07-03', '2017-07-03'),
(50, 34, 8, 35, '2017-07-04', '2017-07-05');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Akcija`
--
ALTER TABLE `Akcija`
  ADD CONSTRAINT `idAdmina` FOREIGN KEY (`Akciju_kreirao`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Akciju_izvrsio`
--
ALTER TABLE `Akciju_izvrsio`
  ADD CONSTRAINT `idAkcije` FOREIGN KEY (`ID_Akcije`) REFERENCES `Akcija` (`idAkcije`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idKorisnikaAkcije` FOREIGN KEY (`ID_Korisnika`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `AktivacijskiKod`
--
ALTER TABLE `AktivacijskiKod`
  ADD CONSTRAINT `AktivacijskiKod_ibfk_1` FOREIGN KEY (`ID_korisnika`) REFERENCES `Korisnik` (`idKorisnik`);

--
-- Constraints for table `Dnevnik`
--
ALTER TABLE `Dnevnik`
  ADD CONSTRAINT `Dnevnik_ibfk_1` FOREIGN KEY (`ID_radnje`) REFERENCES `RadnjeZaDnevnik` (`ID_Radnje`);

--
-- Constraints for table `JeRezervirao`
--
ALTER TABLE `JeRezervirao`
  ADD CONSTRAINT `JeRezervirao_ibfk_1` FOREIGN KEY (`ID_korisnika`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `JeRezervirao_ibfk_2` FOREIGN KEY (`ID_rezervacije`) REFERENCES `Rezervacija` (`idRezervacija`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD CONSTRAINT `fk_Korisnik_Vrsta_korisnika` FOREIGN KEY (`Vrsta_korisnika_idVrsta_korisnika`) REFERENCES `Vrsta_korisnika` (`idVrsta_korisnika`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Kosarica`
--
ALTER TABLE `Kosarica`
  ADD CONSTRAINT `Kosarica_ibfk_1` FOREIGN KEY (`ID_Korisnika`) REFERENCES `Korisnik` (`idKorisnik`),
  ADD CONSTRAINT `Kosarica_ibfk_2` FOREIGN KEY (`ID_KuponaPoPodrucju`) REFERENCES `seVrednuje` (`ID_vrednovanja`);

--
-- Constraints for table `Kupon`
--
ALTER TABLE `Kupon`
  ADD CONSTRAINT `Kupon_izradio` FOREIGN KEY (`Kupon_izradio`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Lojalnost`
--
ALTER TABLE `Lojalnost`
  ADD CONSTRAINT `idKorisnikaLojalnost` FOREIGN KEY (`idKorisnik`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idKuponaLojalnost` FOREIGN KEY (`idKupon`) REFERENCES `Kupon` (`idKupon`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Podrucje`
--
ALTER TABLE `Podrucje`
  ADD CONSTRAINT `idAdminaPodrucje` FOREIGN KEY (`idAdministratora`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RadnjeZaDnevnik`
--
ALTER TABLE `RadnjeZaDnevnik`
  ADD CONSTRAINT `RadnjeZaDnevnik_ibfk_1` FOREIGN KEY (`ID_korisnika`) REFERENCES `Korisnik` (`idKorisnik`);

--
-- Constraints for table `Rezervacija`
--
ALTER TABLE `Rezervacija`
  ADD CONSTRAINT `Rezervacija_ibfk_1` FOREIGN KEY (`id_podrucje`) REFERENCES `Podrucje` (`idPodrucje`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Rezervacija_ibfk_2` FOREIGN KEY (`Ulica_polaska`) REFERENCES `Ulica` (`idUlica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `StanjeRezervacije`
--
ALTER TABLE `StanjeRezervacije`
  ADD CONSTRAINT `idAdminStanjeRezervacije` FOREIGN KEY (`Administrator_obradio`) REFERENCES `Korisnik` (`idKorisnik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Ulica`
--
ALTER TABLE `Ulica`
  ADD CONSTRAINT `idPodrucjaUlica` FOREIGN KEY (`idPodrucja`) REFERENCES `Podrucje` (`idPodrucje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Vozi`
--
ALTER TABLE `Vozi`
  ADD CONSTRAINT `Vozi_ibfk_1` FOREIGN KEY (`ID_vozilo`) REFERENCES `Vozilo` (`ID_taxija`),
  ADD CONSTRAINT `Vozi_ibfk_2` FOREIGN KEY (`ID_vozaca`) REFERENCES `Korisnik` (`idKorisnik`);

--
-- Constraints for table `Voznja`
--
ALTER TABLE `Voznja`
  ADD CONSTRAINT `Voznja_ibfk_1` FOREIGN KEY (`ID_vozila`) REFERENCES `Vozilo` (`ID_taxija`),
  ADD CONSTRAINT `Voznja_ibfk_2` FOREIGN KEY (`ID_rezervacije`) REFERENCES `Rezervacija` (`idRezervacija`);

--
-- Constraints for table `jeIzvrsio`
--
ALTER TABLE `jeIzvrsio`
  ADD CONSTRAINT `jeIzvrsio_ibfk_1` FOREIGN KEY (`ID_korisnika`) REFERENCES `Korisnik` (`idKorisnik`),
  ADD CONSTRAINT `jeIzvrsio_ibfk_2` FOREIGN KEY (`ID_radnje`) REFERENCES `Radnja` (`ID_radnje`);

--
-- Constraints for table `jeKreirao`
--
ALTER TABLE `jeKreirao`
  ADD CONSTRAINT `jeKreirao_ibfk_1` FOREIGN KEY (`ID_Korisnika`) REFERENCES `Korisnik` (`idKorisnik`),
  ADD CONSTRAINT `jeKreirao_ibfk_2` FOREIGN KEY (`ID_Podrucja`) REFERENCES `Podrucje` (`idPodrucje`);

--
-- Constraints for table `jeKupio`
--
ALTER TABLE `jeKupio`
  ADD CONSTRAINT `jeKupio_ibfk_1` FOREIGN KEY (`ID_korisnika`) REFERENCES `Korisnik` (`idKorisnik`),
  ADD CONSTRAINT `jeKupio_ibfk_2` FOREIGN KEY (`ID_vrednovanja`) REFERENCES `seVrednuje` (`ID_vrednovanja`);

--
-- Constraints for table `seVrednuje`
--
ALTER TABLE `seVrednuje`
  ADD CONSTRAINT `seVrednuje_ibfk_1` FOREIGN KEY (`ID_kupona`) REFERENCES `Kupon` (`idKupon`),
  ADD CONSTRAINT `seVrednuje_ibfk_2` FOREIGN KEY (`ID_podrucja`) REFERENCES `Podrucje` (`idPodrucje`);
--
-- Database: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `CHARACTER_SETS`
--

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2),
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3),
('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1),
('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('utf8mb4', 'utf8mb4_general_ci', 'UTF-8 Unicode', 4),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('utf16', 'utf16_general_ci', 'UTF-16 Unicode', 4),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('utf32', 'utf32_general_ci', 'UTF-32 Unicode', 4),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1),
('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2),
('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATIONS`
--

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1),
('big5_bin', 'big5', 84, '', 'Yes', 1),
('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1),
('dec8_bin', 'dec8', 69, '', 'Yes', 1),
('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1),
('cp850_bin', 'cp850', 80, '', 'Yes', 1),
('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1),
('hp8_bin', 'hp8', 72, '', 'Yes', 1),
('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1),
('koi8r_bin', 'koi8r', 74, '', 'Yes', 1),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4),
('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1),
('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1),
('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1),
('latin2_bin', 'latin2', 77, '', 'Yes', 1),
('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1),
('swe7_bin', 'swe7', 82, '', 'Yes', 1),
('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1),
('ascii_bin', 'ascii', 65, '', 'Yes', 1),
('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1),
('ujis_bin', 'ujis', 91, '', 'Yes', 1),
('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1),
('sjis_bin', 'sjis', 88, '', 'Yes', 1),
('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1),
('hebrew_bin', 'hebrew', 71, '', 'Yes', 1),
('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4),
('tis620_bin', 'tis620', 89, '', 'Yes', 1),
('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1),
('euckr_bin', 'euckr', 85, '', 'Yes', 1),
('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1),
('koi8u_bin', 'koi8u', 75, '', 'Yes', 1),
('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1),
('gb2312_bin', 'gb2312', 86, '', 'Yes', 1),
('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1),
('greek_bin', 'greek', 70, '', 'Yes', 1),
('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1),
('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2),
('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1),
('cp1250_bin', 'cp1250', 66, '', 'Yes', 1),
('cp1250_polish_ci', 'cp1250', 99, '', 'Yes', 1),
('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1),
('gbk_bin', 'gbk', 87, '', 'Yes', 1),
('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1),
('latin5_bin', 'latin5', 78, '', 'Yes', 1),
('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1),
('armscii8_bin', 'armscii8', 64, '', 'Yes', 1),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('utf8_sinhala_ci', 'utf8', 211, '', 'Yes', 8),
('utf8_general_mysql500_ci', 'utf8', 223, '', 'Yes', 1),
('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1),
('ucs2_bin', 'ucs2', 90, '', 'Yes', 1),
('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8),
('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8),
('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8),
('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8),
('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8),
('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8),
('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8),
('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8),
('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8),
('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8),
('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8),
('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8),
('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8),
('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8),
('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8),
('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8),
('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8),
('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8),
('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8),
('ucs2_sinhala_ci', 'ucs2', 147, '', 'Yes', 8),
('ucs2_general_mysql500_ci', 'ucs2', 159, '', 'Yes', 1),
('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1),
('cp866_bin', 'cp866', 68, '', 'Yes', 1),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1),
('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1),
('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1),
('macce_bin', 'macce', 43, '', 'Yes', 1),
('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1),
('macroman_bin', 'macroman', 53, '', 'Yes', 1),
('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1),
('cp852_bin', 'cp852', 81, '', 'Yes', 1),
('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1),
('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1),
('latin7_general_cs', 'latin7', 42, '', 'Yes', 1),
('latin7_bin', 'latin7', 79, '', 'Yes', 1),
('utf8mb4_general_ci', 'utf8mb4', 45, 'Yes', 'Yes', 1),
('utf8mb4_bin', 'utf8mb4', 46, '', 'Yes', 1),
('utf8mb4_unicode_ci', 'utf8mb4', 224, '', 'Yes', 8),
('utf8mb4_icelandic_ci', 'utf8mb4', 225, '', 'Yes', 8),
('utf8mb4_latvian_ci', 'utf8mb4', 226, '', 'Yes', 8),
('utf8mb4_romanian_ci', 'utf8mb4', 227, '', 'Yes', 8),
('utf8mb4_slovenian_ci', 'utf8mb4', 228, '', 'Yes', 8),
('utf8mb4_polish_ci', 'utf8mb4', 229, '', 'Yes', 8),
('utf8mb4_estonian_ci', 'utf8mb4', 230, '', 'Yes', 8),
('utf8mb4_spanish_ci', 'utf8mb4', 231, '', 'Yes', 8),
('utf8mb4_swedish_ci', 'utf8mb4', 232, '', 'Yes', 8),
('utf8mb4_turkish_ci', 'utf8mb4', 233, '', 'Yes', 8),
('utf8mb4_czech_ci', 'utf8mb4', 234, '', 'Yes', 8),
('utf8mb4_danish_ci', 'utf8mb4', 235, '', 'Yes', 8),
('utf8mb4_lithuanian_ci', 'utf8mb4', 236, '', 'Yes', 8),
('utf8mb4_slovak_ci', 'utf8mb4', 237, '', 'Yes', 8),
('utf8mb4_spanish2_ci', 'utf8mb4', 238, '', 'Yes', 8),
('utf8mb4_roman_ci', 'utf8mb4', 239, '', 'Yes', 8),
('utf8mb4_persian_ci', 'utf8mb4', 240, '', 'Yes', 8),
('utf8mb4_esperanto_ci', 'utf8mb4', 241, '', 'Yes', 8),
('utf8mb4_hungarian_ci', 'utf8mb4', 242, '', 'Yes', 8),
('utf8mb4_sinhala_ci', 'utf8mb4', 243, '', 'Yes', 8),
('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1),
('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1),
('cp1251_bin', 'cp1251', 50, '', 'Yes', 1),
('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1),
('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1),
('utf16_general_ci', 'utf16', 54, 'Yes', 'Yes', 1),
('utf16_bin', 'utf16', 55, '', 'Yes', 1),
('utf16_unicode_ci', 'utf16', 101, '', 'Yes', 8),
('utf16_icelandic_ci', 'utf16', 102, '', 'Yes', 8),
('utf16_latvian_ci', 'utf16', 103, '', 'Yes', 8),
('utf16_romanian_ci', 'utf16', 104, '', 'Yes', 8),
('utf16_slovenian_ci', 'utf16', 105, '', 'Yes', 8),
('utf16_polish_ci', 'utf16', 106, '', 'Yes', 8),
('utf16_estonian_ci', 'utf16', 107, '', 'Yes', 8),
('utf16_spanish_ci', 'utf16', 108, '', 'Yes', 8),
('utf16_swedish_ci', 'utf16', 109, '', 'Yes', 8),
('utf16_turkish_ci', 'utf16', 110, '', 'Yes', 8),
('utf16_czech_ci', 'utf16', 111, '', 'Yes', 8),
('utf16_danish_ci', 'utf16', 112, '', 'Yes', 8),
('utf16_lithuanian_ci', 'utf16', 113, '', 'Yes', 8),
('utf16_slovak_ci', 'utf16', 114, '', 'Yes', 8),
('utf16_spanish2_ci', 'utf16', 115, '', 'Yes', 8),
('utf16_roman_ci', 'utf16', 116, '', 'Yes', 8),
('utf16_persian_ci', 'utf16', 117, '', 'Yes', 8),
('utf16_esperanto_ci', 'utf16', 118, '', 'Yes', 8),
('utf16_hungarian_ci', 'utf16', 119, '', 'Yes', 8),
('utf16_sinhala_ci', 'utf16', 120, '', 'Yes', 8),
('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1),
('cp1256_bin', 'cp1256', 67, '', 'Yes', 1),
('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1),
('cp1257_bin', 'cp1257', 58, '', 'Yes', 1),
('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1),
('utf32_general_ci', 'utf32', 60, 'Yes', 'Yes', 1),
('utf32_bin', 'utf32', 61, '', 'Yes', 1),
('utf32_unicode_ci', 'utf32', 160, '', 'Yes', 8),
('utf32_icelandic_ci', 'utf32', 161, '', 'Yes', 8),
('utf32_latvian_ci', 'utf32', 162, '', 'Yes', 8),
('utf32_romanian_ci', 'utf32', 163, '', 'Yes', 8),
('utf32_slovenian_ci', 'utf32', 164, '', 'Yes', 8),
('utf32_polish_ci', 'utf32', 165, '', 'Yes', 8),
('utf32_estonian_ci', 'utf32', 166, '', 'Yes', 8),
('utf32_spanish_ci', 'utf32', 167, '', 'Yes', 8),
('utf32_swedish_ci', 'utf32', 168, '', 'Yes', 8),
('utf32_turkish_ci', 'utf32', 169, '', 'Yes', 8),
('utf32_czech_ci', 'utf32', 170, '', 'Yes', 8),
('utf32_danish_ci', 'utf32', 171, '', 'Yes', 8),
('utf32_lithuanian_ci', 'utf32', 172, '', 'Yes', 8),
('utf32_slovak_ci', 'utf32', 173, '', 'Yes', 8),
('utf32_spanish2_ci', 'utf32', 174, '', 'Yes', 8),
('utf32_roman_ci', 'utf32', 175, '', 'Yes', 8),
('utf32_persian_ci', 'utf32', 176, '', 'Yes', 8),
('utf32_esperanto_ci', 'utf32', 177, '', 'Yes', 8),
('utf32_hungarian_ci', 'utf32', 178, '', 'Yes', 8),
('utf32_sinhala_ci', 'utf32', 179, '', 'Yes', 8),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1),
('geostd8_bin', 'geostd8', 93, '', 'Yes', 1),
('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1),
('cp932_bin', 'cp932', 96, '', 'Yes', 1),
('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1),
('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('big5_chinese_ci', 'big5'),
('big5_bin', 'big5'),
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_czech_cs', 'latin2'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('ujis_japanese_ci', 'ujis'),
('ujis_bin', 'ujis'),
('sjis_japanese_ci', 'sjis'),
('sjis_bin', 'sjis'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('tis620_thai_ci', 'tis620'),
('tis620_bin', 'tis620'),
('euckr_korean_ci', 'euckr'),
('euckr_bin', 'euckr'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('gb2312_chinese_ci', 'gb2312'),
('gb2312_bin', 'gb2312'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_czech_cs', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('cp1250_polish_ci', 'cp1250'),
('gbk_chinese_ci', 'gbk'),
('gbk_bin', 'gbk'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('utf8_sinhala_ci', 'utf8'),
('utf8_general_mysql500_ci', 'utf8'),
('ucs2_general_ci', 'ucs2'),
('ucs2_bin', 'ucs2'),
('ucs2_unicode_ci', 'ucs2'),
('ucs2_icelandic_ci', 'ucs2'),
('ucs2_latvian_ci', 'ucs2'),
('ucs2_romanian_ci', 'ucs2'),
('ucs2_slovenian_ci', 'ucs2'),
('ucs2_polish_ci', 'ucs2'),
('ucs2_estonian_ci', 'ucs2'),
('ucs2_spanish_ci', 'ucs2'),
('ucs2_swedish_ci', 'ucs2'),
('ucs2_turkish_ci', 'ucs2'),
('ucs2_czech_ci', 'ucs2'),
('ucs2_danish_ci', 'ucs2'),
('ucs2_lithuanian_ci', 'ucs2'),
('ucs2_slovak_ci', 'ucs2'),
('ucs2_spanish2_ci', 'ucs2'),
('ucs2_roman_ci', 'ucs2'),
('ucs2_persian_ci', 'ucs2'),
('ucs2_esperanto_ci', 'ucs2'),
('ucs2_hungarian_ci', 'ucs2'),
('ucs2_sinhala_ci', 'ucs2'),
('ucs2_general_mysql500_ci', 'ucs2'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('utf8mb4_general_ci', 'utf8mb4'),
('utf8mb4_bin', 'utf8mb4'),
('utf8mb4_unicode_ci', 'utf8mb4'),
('utf8mb4_icelandic_ci', 'utf8mb4'),
('utf8mb4_latvian_ci', 'utf8mb4'),
('utf8mb4_romanian_ci', 'utf8mb4'),
('utf8mb4_slovenian_ci', 'utf8mb4'),
('utf8mb4_polish_ci', 'utf8mb4'),
('utf8mb4_estonian_ci', 'utf8mb4'),
('utf8mb4_spanish_ci', 'utf8mb4'),
('utf8mb4_swedish_ci', 'utf8mb4'),
('utf8mb4_turkish_ci', 'utf8mb4'),
('utf8mb4_czech_ci', 'utf8mb4'),
('utf8mb4_danish_ci', 'utf8mb4'),
('utf8mb4_lithuanian_ci', 'utf8mb4'),
('utf8mb4_slovak_ci', 'utf8mb4'),
('utf8mb4_spanish2_ci', 'utf8mb4'),
('utf8mb4_roman_ci', 'utf8mb4'),
('utf8mb4_persian_ci', 'utf8mb4'),
('utf8mb4_esperanto_ci', 'utf8mb4'),
('utf8mb4_hungarian_ci', 'utf8mb4'),
('utf8mb4_sinhala_ci', 'utf8mb4'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('utf16_general_ci', 'utf16'),
('utf16_bin', 'utf16'),
('utf16_unicode_ci', 'utf16'),
('utf16_icelandic_ci', 'utf16'),
('utf16_latvian_ci', 'utf16'),
('utf16_romanian_ci', 'utf16'),
('utf16_slovenian_ci', 'utf16'),
('utf16_polish_ci', 'utf16'),
('utf16_estonian_ci', 'utf16'),
('utf16_spanish_ci', 'utf16'),
('utf16_swedish_ci', 'utf16'),
('utf16_turkish_ci', 'utf16'),
('utf16_czech_ci', 'utf16'),
('utf16_danish_ci', 'utf16'),
('utf16_lithuanian_ci', 'utf16'),
('utf16_slovak_ci', 'utf16'),
('utf16_spanish2_ci', 'utf16'),
('utf16_roman_ci', 'utf16'),
('utf16_persian_ci', 'utf16'),
('utf16_esperanto_ci', 'utf16'),
('utf16_hungarian_ci', 'utf16'),
('utf16_sinhala_ci', 'utf16'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('utf32_general_ci', 'utf32'),
('utf32_bin', 'utf32'),
('utf32_unicode_ci', 'utf32'),
('utf32_icelandic_ci', 'utf32'),
('utf32_latvian_ci', 'utf32'),
('utf32_romanian_ci', 'utf32'),
('utf32_slovenian_ci', 'utf32'),
('utf32_polish_ci', 'utf32'),
('utf32_estonian_ci', 'utf32'),
('utf32_spanish_ci', 'utf32'),
('utf32_swedish_ci', 'utf32'),
('utf32_turkish_ci', 'utf32'),
('utf32_czech_ci', 'utf32'),
('utf32_danish_ci', 'utf32'),
('utf32_lithuanian_ci', 'utf32'),
('utf32_slovak_ci', 'utf32'),
('utf32_spanish2_ci', 'utf32'),
('utf32_roman_ci', 'utf32'),
('utf32_persian_ci', 'utf32'),
('utf32_esperanto_ci', 'utf32'),
('utf32_hungarian_ci', 'utf32'),
('utf32_sinhala_ci', 'utf32'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8'),
('cp932_japanese_ci', 'cp932'),
('cp932_bin', 'cp932'),
('eucjpms_japanese_ci', 'eucjpms'),
('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMNS`
--

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
('def', 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(27)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'ENGINE', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'SUPPORT', 2, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'COMMENT', 3, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'TRANSACTIONS', 4, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'XA', 5, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ENGINES', 'SAVEPOINTS', 6, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_CATALOG', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'DEFINER', 4, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'TIME_ZONE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_BODY', 6, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_DEFINITION', 7, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_TYPE', 8, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EXECUTE_AT', 9, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'INTERVAL_VALUE', 10, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'INTERVAL_FIELD', 11, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'SQL_MODE', 12, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'STARTS', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ENDS', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'STATUS', 15, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ON_COMPLETION', 16, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'CREATED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'LAST_ALTERED', 18, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'LAST_EXECUTED', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'EVENT_COMMENT', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'ORIGINATOR', 21, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'CHARACTER_SET_CLIENT', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'COLLATION_CONNECTION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'EVENTS', 'DATABASE_COLLATION', 24, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_NAME', 2, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FILE_TYPE', 3, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLESPACE_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_CATALOG', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_SCHEMA', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_NAME', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LOGFILE_GROUP_NAME', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LOGFILE_GROUP_NUMBER', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'ENGINE', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FULLTEXT_KEYS', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DELETED_ROWS', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'UPDATE_COUNT', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'FREE_EXTENTS', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TOTAL_EXTENTS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'EXTENT_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'INITIAL_SIZE', 17, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'MAXIMUM_SIZE', 18, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'AUTOEXTEND_SIZE', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CREATION_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LAST_UPDATE_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'LAST_ACCESS_TIME', 22, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'RECOVER_TIME', 23, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TRANSACTION_COUNTER', 24, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'VERSION', 25, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'ROW_FORMAT', 26, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'TABLE_ROWS', 27, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'AVG_ROW_LENGTH', 28, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DATA_LENGTH', 29, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'MAX_DATA_LENGTH', 30, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'INDEX_LENGTH', 31, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'DATA_FREE', 32, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CREATE_TIME', 33, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'UPDATE_TIME', 34, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CHECK_TIME', 35, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'CHECKSUM', 36, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'STATUS', 37, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'FILES', 'EXTRA', 38, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'SPECIFIC_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'ORDINAL_POSITION', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'PARAMETER_MODE', 5, NULL, 'YES', 'varchar', 5, 15, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(5)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'PARAMETER_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'DATA_TYPE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_MAXIMUM_LENGTH', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_OCTET_LENGTH', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'NUMERIC_PRECISION', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'NUMERIC_SCALE', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'CHARACTER_SET_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'COLLATION_NAME', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'DTD_IDENTIFIER', 14, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARAMETERS', 'ROUTINE_TYPE', 15, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_NAME', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_ORDINAL_POSITION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_ORDINAL_POSITION', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_METHOD', 8, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_METHOD', 9, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_EXPRESSION', 10, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'SUBPARTITION_EXPRESSION', 11, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_DESCRIPTION', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLE_ROWS', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'AVG_ROW_LENGTH', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'DATA_LENGTH', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'MAX_DATA_LENGTH', 16, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'INDEX_LENGTH', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'DATA_FREE', 18, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CREATE_TIME', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'UPDATE_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CHECK_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'CHECKSUM', 22, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'PARTITION_COMMENT', 23, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'NODEGROUP', 24, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
('def', 'information_schema', 'PARTITIONS', 'TABLESPACE_NAME', 25, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_VERSION', 2, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_STATUS', 3, '', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_TYPE', 4, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_TYPE_VERSION', 5, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY_VERSION', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_AUTHOR', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_DESCRIPTION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'PLUGIN_LICENSE', 10, NULL, 'YES', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
('def', 'information_schema', 'PLUGINS', 'LOAD_OPTION', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'USER', 2, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'HOST', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'DB', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'COMMAND', 5, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'TIME', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(7)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'STATE', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'PROCESSLIST', 'INFO', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
('def', 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_CATALOG', 4, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'MATCH_OPTION', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UPDATE_RULE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'DELETE_RULE', 9, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'TABLE_NAME', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'REFERENCED_TABLE_NAME', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DATA_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_MAXIMUM_LENGTH', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_OCTET_LENGTH', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'NUMERIC_PRECISION', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'NUMERIC_SCALE', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(21)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_SET_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'COLLATION_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 13, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 14, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 15, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 16, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 17, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 18, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 19, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_PATH', 21, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 22, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CREATED', 23, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'LAST_ALTERED', 24, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'SQL_MODE', 25, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 26, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DEFINER', 27, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'CHARACTER_SET_CLIENT', 28, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'COLLATION_CONNECTION', 29, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'ROUTINES', 'DATABASE_COLLATION', 30, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'STATISTICS', 'INDEX_COMMENT', 16, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
('def', 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 2048, 6144, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(2048)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'ENGINE', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_TYPE', 3, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'LOGFILE_GROUP_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'EXTENT_SIZE', 5, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'AUTOEXTEND_SIZE', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'MAXIMUM_SIZE', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'TABLESPACES', 'NODEGROUP_ID', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
('def', 'information_schema', 'TABLESPACES', 'TABLESPACE_COMMENT', 9, NULL, 'YES', 'varchar', 2048, 6144, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(2048)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'DEFINER', 19, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'CHARACTER_SET_CLIENT', 20, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'COLLATION_CONNECTION', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'TRIGGERS', 'DATABASE_COLLATION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, '', 'NO', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'CHARACTER_SET_CLIENT', 9, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'VIEWS', 'COLLATION_CONNECTION', 10, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'POOL_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'BLOCK_ID', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'SPACE', 3, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'PAGE_NUMBER', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'PAGE_TYPE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'FLUSH_TYPE', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'FIX_COUNT', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'IS_HASHED', 8, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'NEWEST_MODIFICATION', 9, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'OLDEST_MODIFICATION', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'ACCESS_TIME', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'TABLE_NAME', 12, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'INDEX_NAME', 13, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'NUMBER_RECORDS', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'DATA_SIZE', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'COMPRESSED_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'PAGE_STATE', 17, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'IO_FIX', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'IS_OLD', 19, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'FREE_PAGE_CLOCK', 20, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_id', 1, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_state', 2, '', 'NO', 'varchar', 13, 39, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(13)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_started', 3, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_requested_lock_id', 4, NULL, 'YES', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_wait_started', 5, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_weight', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_mysql_thread_id', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_query', 8, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_operation_state', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_tables_in_use', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_tables_locked', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_lock_structs', 12, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_lock_memory_bytes', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_rows_locked', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_rows_modified', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_concurrency_tickets', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_isolation_level', 17, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_unique_checks', 18, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_foreign_key_checks', 19, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_last_foreign_key_error', 20, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_adaptive_hash_latched', 21, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_TRX', 'trx_adaptive_hash_timeout', 22, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'POOL_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'POOL_SIZE', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'FREE_BUFFERS', 3, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'DATABASE_PAGES', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'OLD_DATABASE_PAGES', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'MODIFIED_DATABASE_PAGES', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_DECOMPRESS', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_READS', 8, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_FLUSH_LRU', 9, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PENDING_FLUSH_LIST', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_MADE_YOUNG', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_NOT_MADE_YOUNG', 12, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_MADE_YOUNG_RATE', 13, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_MADE_NOT_YOUNG_RATE', 14, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_READ', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_CREATED', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_WRITTEN', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_READ_RATE', 18, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_CREATE_RATE', 19, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'PAGES_WRITTEN_RATE', 20, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_GET', 21, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'HIT_RATE', 22, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'YOUNG_MAKE_PER_THOUSAND_GETS', 23, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NOT_YOUNG_MAKE_PER_THOUSAND_GETS', 24, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_PAGES_READ_AHEAD', 25, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'NUMBER_READ_AHEAD_EVICTED', 26, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'READ_AHEAD_RATE', 27, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'READ_AHEAD_EVICTED_RATE', 28, '0', 'NO', 'double', NULL, NULL, 12, NULL, NULL, NULL, 'double', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'LRU_IO_TOTAL', 29, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'LRU_IO_CURRENT', 30, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'UNCOMPRESS_TOTAL', 31, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'UNCOMPRESS_CURRENT', 32, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'requesting_trx_id', 1, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'requested_lock_id', 2, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'blocking_trx_id', 3, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'blocking_lock_id', 4, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'buffer_pool_instance', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'pages_used', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'pages_free', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'relocation_ops', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'relocation_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_ops', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_ops_ok', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'compress_time', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'uncompress_ops', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP', 'uncompress_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_id', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_trx_id', 2, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_mode', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_type', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_table', 5, '', 'NO', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_index', 6, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_space', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_page', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_rec', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'lock_data', 10, NULL, 'YES', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'buffer_pool_instance', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'pages_used', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'pages_free', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'relocation_ops', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'relocation_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'page_size', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(5)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_ops', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_ops_ok', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'compress_time', 4, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'uncompress_ops', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'uncompress_time', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'POOL_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'LRU_POSITION', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'SPACE', 3, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'PAGE_NUMBER', 4, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'PAGE_TYPE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'FLUSH_TYPE', 6, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'FIX_COUNT', 7, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'IS_HASHED', 8, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'NEWEST_MODIFICATION', 9, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'OLDEST_MODIFICATION', 10, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'ACCESS_TIME', 11, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'TABLE_NAME', 12, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'INDEX_NAME', 13, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'NUMBER_RECORDS', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'DATA_SIZE', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'COMPRESSED_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'COMPRESSED', 17, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'IO_FIX', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'IS_OLD', 19, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'FREE_PAGE_CLOCK', 20, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
('def', 'WebDiP2016x131', 'Akcija', 'idAkcije', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akcija', 'ImeAkcije', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akcija', 'Broj_bodova', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akcija', 'Akciju_kreirao', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 'ID_IzvrsavanjaAkcije', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 'ID_Akcije', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 'ID_Korisnika', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 'Datum_obavljanja', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'AktivacijskiKod', 'ID_koda', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'AktivacijskiKod', 'Kod', 2, NULL, 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'AktivacijskiKod', 'ID_korisnika', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Dnevnik', 'idDnevnika', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Dnevnik', 'ID_radnje', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(255)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 'ID_Rezerviranja', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 'ID_korisnika', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 'ID_rezervacije', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'UNI', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'idKorisnik', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'BrojTelefona', 2, NULL, 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Username', 3, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Password', 4, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Ime', 5, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Prezime', 6, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Email', 7, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'KorisnikZakljucan', 8, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'DatumRodjenja', 9, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Broj_bodova', 10, '0', 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'Vrsta_korisnika_idVrsta_korisnika', 11, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kosarica', 'ID_stavke', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kosarica', 'ID_Korisnika', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kosarica', 'ID_KuponaPoPodrucju', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kupon', 'idKupon', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kupon', 'Ime_kupona', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kupon', 'Kupon_izradio', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kupon', 'Pdf_dokument', 4, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kupon', 'Slika_kupona', 5, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Kupon', 'Video_kupona', 6, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 'idLojalnost', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 'idKorisnik', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 'idKupon', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 'Bodova_potrošeno', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'idPodrucje', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'Ime_podrucja', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'idAdministratora', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'Boja', 4, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'Font_style', 5, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'velicinaFonta', 6, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Radnja', 'ID_radnje', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Radnja', 'Radnja', 2, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin2', 'latin2_croatian_ci', 'text', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'ID_Radnje', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'ID_korisnika', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'Opis_radnje', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'Datum_radnje', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'idRezervacija', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'id_podrucje', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'Datum_voznje', 3, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'Ulica_polaska', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'Ulica_odredista', 5, NULL, 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'Povratna_informacija', 6, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'VoznjaOdradena', 7, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'RezervacijaOdbijena', 8, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'Rezervacija_prihvacena', 9, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 'idStanje_rezervacije', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 'naziv_stanja_rezervacije', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 'Administrator_obradio', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 'Datum_obrade', 4, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Ulica', 'idUlica', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Ulica', 'Ime_ulice', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Ulica', 'idPodrucja', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vozi', 'ID_vozi', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vozi', 'ID_vozilo', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vozi', 'ID_vozaca', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vozilo', 'ID_taxija', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vozilo', 'Model_auta', 2, NULL, 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vozilo', 'Registarske_oznake', 3, NULL, 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Voznja', 'ID_voznje', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Voznja', 'ID_vozila', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Voznja', 'ID_rezervacije', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Voznja', 'vrijeme', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vrsta_korisnika', 'idVrsta_korisnika', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'Vrsta_korisnika', 'Naziv_vrste_korisnika', 2, NULL, 'YES', 'varchar', 45, 135, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 'ID_izvrseneRadnje', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 'ID_korisnika', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 'ID_radnje', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 'Datum', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 'ID_KreiranjaPodrucja', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 'ID_Korisnika', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 'ID_Podrucja', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKupio', 'ID_kupnje', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKupio', 'ID_korisnika', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKupio', 'ID_vrednovanja', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'jeKupio', 'DatumKupnje', 4, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'ID_vrednovanja', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'ID_kupona', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'ID_podrucja', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'Broj_bodova', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'vrijediOd', 5, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'vrijediDo', 6, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', '');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMN_PRIVILEGES`
--

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ENGINES`
--

CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ENGINES`
--

INSERT INTO `ENGINES` (`ENGINE`, `SUPPORT`, `COMMENT`, `TRANSACTIONS`, `XA`, `SAVEPOINTS`) VALUES
('MRG_MYISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO'),
('CSV', 'YES', 'CSV storage engine', 'NO', 'NO', 'NO'),
('MyISAM', 'YES', 'MyISAM storage engine', 'NO', 'NO', 'NO'),
('BLACKHOLE', 'YES', '/dev/null storage engine (anything you write to it disappears)', 'NO', 'NO', 'NO'),
('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO'),
('FEDERATED', 'NO', 'Federated MySQL storage engine', NULL, NULL, NULL),
('ARCHIVE', 'YES', 'Archive storage engine', 'NO', 'NO', 'NO'),
('InnoDB', 'DEFAULT', 'Supports transactions, row-level locking, and foreign keys', 'YES', 'YES', 'YES'),
('PERFORMANCE_SCHEMA', 'YES', 'Performance Schema', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `EVENTS`
--

CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FILES`
--

CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_STATUS`
--

CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_STATUS`
--

INSERT INTO `GLOBAL_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '28'),
('ABORTED_CONNECTS', '5206'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BINLOG_STMT_CACHE_DISK_USE', '0'),
('BINLOG_STMT_CACHE_USE', '0'),
('BYTES_RECEIVED', '40547435'),
('BYTES_SENT', '106090891'),
('COM_ADMIN_COMMANDS', '10585'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '125'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '8731'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '26'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '946'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '20'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '7'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '3460'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESIGNAL', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '136112'),
('COM_SET_OPTION', '34747'),
('COM_SIGNAL', '0'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '83'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '2151'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '377'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '2814'),
('COM_SHOW_FUNCTION_STATUS', '5'),
('COM_SHOW_GRANTS', '127'),
('COM_SHOW_KEYS', '2337'),
('COM_SHOW_MASTER_STATUS', '157'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '3431'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '5'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_RELAYLOG_EVENTS', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '157'),
('COM_SHOW_STATUS', '126571'),
('COM_SHOW_STORAGE_ENGINES', '62'),
('COM_SHOW_TABLE_STATUS', '3682'),
('COM_SHOW_TABLES', '1152'),
('COM_SHOW_TRIGGERS', '414'),
('COM_SHOW_VARIABLES', '638'),
('COM_SHOW_WARNINGS', '101'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '2'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '970'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '193561'),
('CREATED_TMP_DISK_TABLES', '7338'),
('CREATED_TMP_FILES', '47'),
('CREATED_TMP_TABLES', '143838'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '11395'),
('HANDLER_DELETE', '611'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '6820'),
('HANDLER_READ_KEY', '42667'),
('HANDLER_READ_LAST', '23'),
('HANDLER_READ_NEXT', '113780'),
('HANDLER_READ_PREV', '4676'),
('HANDLER_READ_RND', '726'),
('HANDLER_READ_RND_NEXT', '583082'),
('HANDLER_ROLLBACK', '439'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '3271'),
('HANDLER_WRITE', '318693'),
('INNODB_BUFFER_POOL_PAGES_DATA', '8162'),
('INNODB_BUFFER_POOL_BYTES_DATA', '133726208'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '0'),
('INNODB_BUFFER_POOL_BYTES_DIRTY', '0'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '13962'),
('INNODB_BUFFER_POOL_PAGES_FREE', '1'),
('INNODB_BUFFER_POOL_PAGES_MISC', '29'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '8192'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD_EVICTED', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '935707'),
('INNODB_BUFFER_POOL_READS', '8476'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '48599'),
('INNODB_DATA_FSYNCS', '13443'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '141053952'),
('INNODB_DATA_READS', '8511'),
('INNODB_DATA_WRITES', '24717'),
('INNODB_DATA_WRITTEN', '463773696'),
('INNODB_DBLWR_PAGES_WRITTEN', '13962'),
('INNODB_DBLWR_WRITES', '2727'),
('INNODB_HAVE_ATOMIC_BUILTINS', 'ON'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '4632'),
('INNODB_LOG_WRITES', '5487'),
('INNODB_OS_LOG_FSYNCS', '7996'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '4985344'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '25'),
('INNODB_PAGES_READ', '8475'),
('INNODB_PAGES_WRITTEN', '13962'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '0'),
('INNODB_ROW_LOCK_TIME_AVG', '0'),
('INNODB_ROW_LOCK_TIME_MAX', '0'),
('INNODB_ROW_LOCK_WAITS', '0'),
('INNODB_ROWS_DELETED', '579'),
('INNODB_ROWS_INSERTED', '5190'),
('INNODB_ROWS_READ', '242207'),
('INNODB_ROWS_UPDATED', '1170'),
('INNODB_TRUNCATED_STATUS_WRITES', '0'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '13367'),
('KEY_BLOCKS_USED', '31'),
('KEY_READ_REQUESTS', '10012'),
('KEY_READS', '31'),
('KEY_WRITE_REQUESTS', '239'),
('KEY_WRITES', '16'),
('LAST_QUERY_COST', '0.000000'),
('MAX_USED_CONNECTIONS', '6'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '73'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '400'),
('OPEN_TABLES', '399'),
('OPENED_FILES', '43157'),
('OPENED_TABLE_DEFINITIONS', '13166'),
('OPENED_TABLES', '3868'),
('PERFORMANCE_SCHEMA_COND_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_COND_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_LOCKER_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_INSTANCES_LOST', '0'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '217'),
('QCACHE_FREE_MEMORY', '13693464'),
('QCACHE_HITS', '59416'),
('QCACHE_INSERTS', '7691'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '128209'),
('QCACHE_QUERIES_IN_CACHE', '2252'),
('QCACHE_TOTAL_BLOCKS', '5000'),
('QUERIES', '588092'),
('QUESTIONS', '577506'),
('RPL_STATUS', 'AUTH_MASTER'),
('SELECT_FULL_JOIN', '305'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '7'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '147421'),
('SLAVE_HEARTBEAT_PERIOD', '0.000'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RECEIVED_HEARTBEATS', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '2'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '1'),
('SORT_ROWS', '4064'),
('SORT_SCAN', '394'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '16850'),
('TABLE_LOCKS_WAITED', '0'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '6'),
('THREADS_CONNECTED', '2'),
('THREADS_CREATED', '8'),
('THREADS_RUNNING', '1'),
('UPTIME', '635256'),
('UPTIME_SINCE_FLUSH_STATUS', '635256');

-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_VARIABLES`
--

CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_VARIABLES`
--

INSERT INTO `GLOBAL_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('INNODB_BUFFER_POOL_SIZE', '134217728'),
('HAVE_CRYPT', 'YES'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_LONG_SIZE', '10000'),
('INNODB_VERSION', '5.5.55'),
('QUERY_PREALLOC_SIZE', '8192'),
('DELAYED_QUEUE_SIZE', '1000'),
('PERFORMANCE_SCHEMA_MAX_COND_INSTANCES', '1000'),
('SSL_CIPHER', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SECURE_FILE_PRIV', '/var/lib/mysql-files/'),
('TIMED_MUTEXES', 'OFF'),
('DELAYED_INSERT_TIMEOUT', '300'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_INSTANCES', '1000000'),
('LC_TIME_NAMES', 'en_US'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_INSTANCES', '1000000'),
('TIME_FORMAT', '%H:%i:%s'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_CLASSES', '30'),
('BASEDIR', '/usr'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_CLASSES', '200'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('BACK_LOG', '50'),
('SLOW_LAUNCH_TIME', '2'),
('EVENT_SCHEDULER', 'OFF'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('PERFORMANCE_SCHEMA_MAX_THREAD_CLASSES', '50'),
('RELAY_LOG_INDEX', ''),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('PERFORMANCE_SCHEMA', 'OFF'),
('QUERY_CACHE_SIZE', '16777216'),
('BINLOG_FORMAT', 'STATEMENT'),
('WAIT_TIMEOUT', '28800'),
('LONG_QUERY_TIME', '10.000000'),
('PERFORMANCE_SCHEMA_MAX_TABLE_HANDLES', '100000'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('LOWER_CASE_TABLE_NAMES', '0'),
('BINLOG_CACHE_SIZE', '32768'),
('REPORT_HOST', ''),
('CHARACTER_SET_RESULTS', 'latin1'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('CHARACTER_SET_CONNECTION', 'latin1'),
('INNODB_ROLLBACK_SEGMENTS', '128'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LARGE_FILES_SUPPORT', 'ON'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('SQL_SAFE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('NET_BUFFER_LENGTH', '16384'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('SKIP_SHOW_DATABASE', 'OFF'),
('FT_MAX_WORD_LEN', '84'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('MAX_SP_RECURSION_DEPTH', '0'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('SYNC_RELAY_LOG', '0'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('HAVE_QUERY_CACHE', 'YES'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('DELAY_KEY_WRITE', 'ON'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('MYISAM_RECOVER_OPTIONS', 'BACKUP'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('PROTOCOL_VERSION', '10'),
('DELAYED_INSERT_LIMIT', '100'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('COMPLETION_TYPE', 'NO_CHAIN'),
('REPORT_PASSWORD', ''),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('VERSION_COMMENT', '(Debian)'),
('SQL_BIG_SELECTS', 'ON'),
('AUTO_INCREMENT_OFFSET', '1'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('JOIN_BUFFER_SIZE', '131072'),
('THREAD_CACHE_SIZE', '8'),
('CONNECT_TIMEOUT', '10'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('INIT_FILE', ''),
('DEFAULT_WEEK_FORMAT', '0'),
('LARGE_PAGES', 'OFF'),
('LOG_OUTPUT', 'FILE'),
('LARGE_PAGE_SIZE', '0'),
('INNODB_IO_CAPACITY', '200'),
('INIT_SLAVE', ''),
('INNODB_USE_NATIVE_AIO', 'ON'),
('MAX_BINLOG_SIZE', '104857600'),
('HAVE_SYMLINK', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TIME_ZONE', 'SYSTEM'),
('MAX_CONNECTIONS', '151'),
('INNODB_TABLE_LOCKS', 'ON'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('READ_BUFFER_SIZE', '131072'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('SQL_AUTO_IS_NULL', 'OFF'),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('SORT_BUFFER_SIZE', '2097152'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('SYNC_RELAY_LOG_INFO', '0'),
('LOCK_WAIT_TIMEOUT', '31536000'),
('INNODB_REPLICATION_DELAY', '0'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('NET_RETRY_COUNT', '10'),
('INNODB_STATS_ON_METADATA', 'ON'),
('LOG_WARNINGS', '1'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('FLUSH', 'OFF'),
('PROFILING_HISTORY_SIZE', '15'),
('MAX_LONG_DATA_SIZE', '16777216'),
('INNODB_CHANGE_BUFFERING', 'all'),
('CHARACTER_SET_SERVER', 'latin1'),
('READ_RND_BUFFER_SIZE', '262144'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('INNODB_FILE_FORMAT', 'Antelope'),
('FLUSH_TIME', '0'),
('BIG_TABLES', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin1'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('DATE_FORMAT', '%Y-%m-%d'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('READ_ONLY', 'OFF'),
('BINLOG_STMT_CACHE_SIZE', '32768'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('PERFORMANCE_SCHEMA_MAX_FILE_CLASSES', '50'),
('INNODB_PURGE_THREADS', '0'),
('MAX_SORT_LENGTH', '1024'),
('PROFILING', 'OFF'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_SIZE', '10'),
('INNODB_STRICT_MODE', 'OFF'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('OLD_PASSWORDS', 'OFF'),
('GENERAL_LOG_FILE', '/var/lib/mysql/barka.log'),
('NET_WRITE_TIMEOUT', '60'),
('PERFORMANCE_SCHEMA_MAX_COND_CLASSES', '80'),
('QUERY_CACHE_TYPE', 'ON'),
('AUTO_INCREMENT_INCREMENT', '1'),
('METADATA_LOCKS_CACHE_SIZE', '1024'),
('TMPDIR', '/tmp'),
('QUERY_CACHE_LIMIT', '1048576'),
('EXPIRE_LOGS_DAYS', '10'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('HAVE_PARTITIONING', 'YES'),
('LOG_ERROR', ''),
('FOREIGN_KEY_CHECKS', 'ON'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('THREAD_STACK', '196608'),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('NEW', 'OFF'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('SKIP_NAME_RESOLVE', 'OFF'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('INNODB_PURGE_BATCH_SIZE', '20'),
('MAX_ALLOWED_PACKET', '16777216'),
('VERSION', '5.5.55-0+deb7u1'),
('CONCURRENT_INSERT', 'AUTO'),
('INNODB_SUPPORT_XA', 'ON'),
('TABLE_DEFINITION_CACHE', '400'),
('INNODB_SYNC_SPIN_LOOPS', '30'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('COLLATION_CONNECTION', 'latin1_swedish_ci'),
('MYISAM_REPAIR_THREADS', '1'),
('INNODB_ADAPTIVE_FLUSHING', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('SYSTEM_TIME_ZONE', 'CEST'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('DIV_PRECISION_INCREMENT', '4'),
('SYNC_FRM', 'ON'),
('STORED_PROGRAM_CACHE', '256'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_DATA_HOME_DIR', ''),
('PERFORMANCE_SCHEMA_MAX_THREAD_INSTANCES', '1000'),
('INNODB_READ_IO_THREADS', '4'),
('MULTI_RANGE_COUNT', '256'),
('INNODB_WRITE_IO_THREADS', '4'),
('SERVER_ID', '0'),
('INNODB_BUFFER_POOL_INSTANCES', '1'),
('SKIP_NETWORKING', 'OFF'),
('INNODB_FORCE_RECOVERY', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('INIT_CONNECT', ''),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('AUTOCOMMIT', 'ON'),
('SYNC_BINLOG', '0'),
('SSL_CAPATH', ''),
('INNODB_PRINT_ALL_DEADLOCKS', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_OPEN_FILES', '300'),
('GENERAL_LOG', 'OFF'),
('INNODB_FILE_FORMAT_CHECK', 'ON'),
('INNODB_READ_AHEAD_THRESHOLD', '56'),
('HOSTNAME', 'barka'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('OLD', 'OFF'),
('KEY_BUFFER_SIZE', '16777216'),
('REPORT_PORT', '3306'),
('HAVE_NDBCLUSTER', 'NO'),
('SQL_LOG_BIN', 'ON'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('INNODB_STATS_METHOD', 'nulls_equal'),
('LOG_BIN', 'OFF'),
('INNODB_FAST_SHUTDOWN', '1'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SSL_CA', ''),
('MAX_USER_CONNECTIONS', '0'),
('INNODB_THREAD_CONCURRENCY', '0'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('SLAVE_NET_TIMEOUT', '3600'),
('TABLE_OPEN_CACHE', '400'),
('INNODB_STATS_SAMPLE_PAGES', '8'),
('SQL_BIG_TABLES', 'OFF'),
('LOCAL_INFILE', 'ON'),
('SQL_BUFFER_RESULT', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('HAVE_PROFILING', 'YES'),
('LC_MESSAGES_DIR', '/usr/share/mysql/'),
('OLD_ALTER_TABLE', 'OFF'),
('HAVE_INNODB', 'YES'),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('SQL_MODE', ''),
('PERFORMANCE_SCHEMA_MAX_FILE_HANDLES', '32768'),
('RELAY_LOG_RECOVERY', 'OFF'),
('REPORT_USER', ''),
('MAX_DELAYED_THREADS', '20'),
('HAVE_GEOMETRY', 'YES'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('LC_MESSAGES', 'en_US'),
('MAX_RELAY_LOG_SIZE', '0'),
('LOG', 'OFF'),
('INNODB_RANDOM_READ_AHEAD', 'OFF'),
('OPEN_FILES_LIMIT', '1024'),
('HAVE_CSV', 'YES'),
('DATADIR', '/var/lib/mysql/'),
('PORT', '3306'),
('FT_MIN_WORD_LEN', '4'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('VERSION_COMPILE_OS', 'debian-linux-gnu'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('INNODB_FORCE_LOAD_CORRUPTED', 'OFF'),
('SQL_WARNINGS', 'OFF'),
('HAVE_OPENSSL', 'DISABLED'),
('RELAY_LOG', ''),
('MAX_BINLOG_STMT_CACHE_SIZE', '18446744073709547520'),
('PLUGIN_DIR', '/usr/lib/mysql/plugin/'),
('PERFORMANCE_SCHEMA_MAX_FILE_INSTANCES', '10000'),
('LOG_SLOW_QUERIES', 'OFF'),
('INNODB_SPIN_WAIT_DELAY', '6'),
('MAX_TMP_TABLES', '32'),
('INNODB_FILE_FORMAT_MAX', 'Antelope'),
('SQL_LOG_OFF', 'OFF'),
('DEFAULT_STORAGE_ENGINE', 'InnoDB'),
('SLOW_QUERY_LOG_FILE', '/var/lib/mysql/barka-slow.log'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('SQL_SLAVE_SKIP_COUNTER', '0'),
('INNODB_OLD_BLOCKS_TIME', '0'),
('SECURE_AUTH', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('NET_READ_TIMEOUT', '30'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,engine_condition_pushdown=on'),
('MAX_CONNECT_ERRORS', '10'),
('LOCKED_IN_MEMORY', 'OFF'),
('INNODB_FLUSH_METHOD', ''),
('INNODB_LARGE_PREFIX', 'OFF'),
('INNODB_CHECKSUMS', 'ON'),
('STORAGE_ENGINE', 'InnoDB'),
('SSL_KEY', ''),
('HAVE_SSL', 'DISABLED'),
('MYISAM_USE_MMAP', 'OFF'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('LOG_SLAVE_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('SYNC_MASTER_INFO', '0'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SSL_CERT', ''),
('INNODB_LOG_BUFFER_SIZE', '8388608'),
('SOCKET', '/var/run/mysqld/mysqld.sock'),
('CHARACTER_SET_CLIENT', 'latin1'),
('INNODB_MAX_PURGE_LAG', '0'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('SLAVE_LOAD_TMPDIR', '/tmp'),
('SLAVE_TYPE_CONVERSIONS', ''),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '8388608'),
('SQL_NOTES', 'ON'),
('INNODB_USE_SYS_MALLOC', 'ON'),
('LICENSE', 'GPL'),
('INNODB_MAX_DIRTY_PAGES_PCT', '75'),
('PERFORMANCE_SCHEMA_MAX_TABLE_INSTANCES', '50000'),
('THREAD_CONCURRENCY', '10'),
('UNIQUE_CHECKS', 'ON'),
('INNODB_OLD_BLOCKS_PCT', '37'),
('HAVE_COMPRESS', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `KEY_COLUMN_USAGE`
--

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Akcija', 'idAkcije', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idAdmina', 'def', 'WebDiP2016x131', 'Akcija', 'Akciju_kreirao', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Akciju_izvrsio', 'ID_IzvrsavanjaAkcije', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idAkcije', 'def', 'WebDiP2016x131', 'Akciju_izvrsio', 'ID_Akcije', 1, 1, 'WebDiP2016x131', 'Akcija', 'idAkcije'),
('def', 'WebDiP2016x131', 'idKorisnikaAkcije', 'def', 'WebDiP2016x131', 'Akciju_izvrsio', 'ID_Korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'AktivacijskiKod', 'ID_koda', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'AktivacijskiKod_ibfk_1', 'def', 'WebDiP2016x131', 'AktivacijskiKod', 'ID_korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Dnevnik', 'idDnevnika', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'Dnevnik_ibfk_1', 'def', 'WebDiP2016x131', 'Dnevnik', 'ID_radnje', 1, 1, 'WebDiP2016x131', 'RadnjeZaDnevnik', 'ID_Radnje'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'JeRezervirao', 'ID_Rezerviranja', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'ID_rezervacije', 'def', 'WebDiP2016x131', 'JeRezervirao', 'ID_rezervacije', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'JeRezervirao_ibfk_1', 'def', 'WebDiP2016x131', 'JeRezervirao', 'ID_korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'JeRezervirao_ibfk_2', 'def', 'WebDiP2016x131', 'JeRezervirao', 'ID_rezervacije', 1, 1, 'WebDiP2016x131', 'Rezervacija', 'idRezervacija'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Korisnik', 'idKorisnik', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idKorisnik', 'def', 'WebDiP2016x131', 'Korisnik', 'idKorisnik', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'fk_Korisnik_Vrsta_korisnika', 'def', 'WebDiP2016x131', 'Korisnik', 'Vrsta_korisnika_idVrsta_korisnika', 1, 1, 'WebDiP2016x131', 'Vrsta_korisnika', 'idVrsta_korisnika'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Kosarica', 'ID_stavke', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'Kosarica_ibfk_1', 'def', 'WebDiP2016x131', 'Kosarica', 'ID_Korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'Kosarica_ibfk_2', 'def', 'WebDiP2016x131', 'Kosarica', 'ID_KuponaPoPodrucju', 1, 1, 'WebDiP2016x131', 'seVrednuje', 'ID_vrednovanja'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Kupon', 'idKupon', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'Kupon_izradio', 'def', 'WebDiP2016x131', 'Kupon', 'Kupon_izradio', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Lojalnost', 'idLojalnost', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idKorisnikaLojalnost', 'def', 'WebDiP2016x131', 'Lojalnost', 'idKorisnik', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'idKuponaLojalnost', 'def', 'WebDiP2016x131', 'Lojalnost', 'idKupon', 1, 1, 'WebDiP2016x131', 'Kupon', 'idKupon'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Podrucje', 'idPodrucje', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idAdminaPodrucje', 'def', 'WebDiP2016x131', 'Podrucje', 'idAdministratora', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Radnja', 'ID_radnje', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'ID_Radnje', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik_ibfk_1', 'def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'ID_korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Rezervacija', 'idRezervacija', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'Rezervacija_ibfk_1', 'def', 'WebDiP2016x131', 'Rezervacija', 'id_podrucje', 1, 1, 'WebDiP2016x131', 'Podrucje', 'idPodrucje'),
('def', 'WebDiP2016x131', 'Rezervacija_ibfk_2', 'def', 'WebDiP2016x131', 'Rezervacija', 'Ulica_polaska', 1, 1, 'WebDiP2016x131', 'Ulica', 'idUlica'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'StanjeRezervacije', 'idStanje_rezervacije', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idAdminStanjeRezervacije', 'def', 'WebDiP2016x131', 'StanjeRezervacije', 'Administrator_obradio', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Ulica', 'idUlica', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'idPodrucjaUlica', 'def', 'WebDiP2016x131', 'Ulica', 'idPodrucja', 1, 1, 'WebDiP2016x131', 'Podrucje', 'idPodrucje'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Vozi', 'ID_vozi', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'Vozi_ibfk_1', 'def', 'WebDiP2016x131', 'Vozi', 'ID_vozilo', 1, 1, 'WebDiP2016x131', 'Vozilo', 'ID_taxija'),
('def', 'WebDiP2016x131', 'Vozi_ibfk_2', 'def', 'WebDiP2016x131', 'Vozi', 'ID_vozaca', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Vozilo', 'ID_taxija', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Voznja', 'ID_voznje', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'Voznja_ibfk_1', 'def', 'WebDiP2016x131', 'Voznja', 'ID_vozila', 1, 1, 'WebDiP2016x131', 'Vozilo', 'ID_taxija'),
('def', 'WebDiP2016x131', 'Voznja_ibfk_2', 'def', 'WebDiP2016x131', 'Voznja', 'ID_rezervacije', 1, 1, 'WebDiP2016x131', 'Rezervacija', 'idRezervacija'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'Vrsta_korisnika', 'idVrsta_korisnika', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'jeIzvrsio', 'ID_izvrseneRadnje', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'jeIzvrsio_ibfk_1', 'def', 'WebDiP2016x131', 'jeIzvrsio', 'ID_korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'jeIzvrsio_ibfk_2', 'def', 'WebDiP2016x131', 'jeIzvrsio', 'ID_radnje', 1, 1, 'WebDiP2016x131', 'Radnja', 'ID_radnje'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'jeKreirao', 'ID_KreiranjaPodrucja', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'jeKreirao_ibfk_1', 'def', 'WebDiP2016x131', 'jeKreirao', 'ID_Korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'jeKreirao_ibfk_2', 'def', 'WebDiP2016x131', 'jeKreirao', 'ID_Podrucja', 1, 1, 'WebDiP2016x131', 'Podrucje', 'idPodrucje'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'jeKupio', 'ID_kupnje', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'jeKupio_ibfk_1', 'def', 'WebDiP2016x131', 'jeKupio', 'ID_korisnika', 1, 1, 'WebDiP2016x131', 'Korisnik', 'idKorisnik'),
('def', 'WebDiP2016x131', 'jeKupio_ibfk_2', 'def', 'WebDiP2016x131', 'jeKupio', 'ID_vrednovanja', 1, 1, 'WebDiP2016x131', 'seVrednuje', 'ID_vrednovanja'),
('def', 'WebDiP2016x131', 'PRIMARY', 'def', 'WebDiP2016x131', 'seVrednuje', 'ID_vrednovanja', 1, NULL, NULL, NULL, NULL),
('def', 'WebDiP2016x131', 'seVrednuje_ibfk_1', 'def', 'WebDiP2016x131', 'seVrednuje', 'ID_kupona', 1, 1, 'WebDiP2016x131', 'Kupon', 'idKupon'),
('def', 'WebDiP2016x131', 'seVrednuje_ibfk_2', 'def', 'WebDiP2016x131', 'seVrednuje', 'ID_podrucja', 1, 1, 'WebDiP2016x131', 'Podrucje', 'idPodrucje');

-- --------------------------------------------------------

--
-- Table structure for table `PARAMETERS`
--

CREATE TEMPORARY TABLE `PARAMETERS` (
  `SPECIFIC_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `SPECIFIC_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` int(21) NOT NULL DEFAULT '0',
  `PARAMETER_MODE` varchar(5) DEFAULT NULL,
  `PARAMETER_NAME` varchar(64) DEFAULT NULL,
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext NOT NULL,
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PARTITIONS`
--

CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(18) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PARTITIONS`
--

INSERT INTO `PARTITIONS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `PARTITION_NAME`, `SUBPARTITION_NAME`, `PARTITION_ORDINAL_POSITION`, `SUBPARTITION_ORDINAL_POSITION`, `PARTITION_METHOD`, `SUBPARTITION_METHOD`, `PARTITION_EXPRESSION`, `SUBPARTITION_EXPRESSION`, `PARTITION_DESCRIPTION`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `CHECKSUM`, `PARTITION_COMMENT`, `NODEGROUP`, `TABLESPACE_NAME`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 384, 0, 16434816, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLLATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 231, 0, 16704765, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 195, 0, 16357770, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLUMNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'COLUMN_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2565, 0, 16757145, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'ENGINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 490, 0, 16574250, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'EVENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'FILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2677, 0, 16758020, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'GLOBAL_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'GLOBAL_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'KEY_COLUMN_USAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4637, 0, 16762755, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PARAMETERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PARTITIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PLUGINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PROCESSLIST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'PROFILING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 308, 0, 16562084, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4814, 0, 16767162, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'ROUTINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SCHEMATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3464, 0, 16738048, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2179, 0, 16736899, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SESSION_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'SESSION_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5753, 0, 16752736, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9450, 0, 16764300, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLESPACES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6951, 0, 16772763, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLE_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2504, 0, 16721712, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TABLE_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2372, 0, 16748692, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'TRIGGERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'USER_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1986, 0, 16726092, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'VIEWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6852, 0, 16766844, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_TRX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4534, 0, 16766732, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 257, 0, 16332350, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_LOCK_WAITS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 599, 0, 16749238, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMPMEM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, 0, 15204352, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, 0, 13107200, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_LOCKS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 31244, 0, 16746784, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, 0, 15204352, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_CMP_RESET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, 0, 13107200, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6669, 0, 16765866, 0, 0, '2017-07-04 14:04:25', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Akcija', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1489, 16384, NULL, 16384, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, 348, 16384, NULL, 32768, 8388608, '2017-06-11 14:26:54', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'AktivacijskiKod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 16384, 8388608, '2017-05-08 14:31:14', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Dnevnik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 8388608, '2017-06-20 15:56:42', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'JeRezervirao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1489, 16384, NULL, 32768, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Korisnik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 655, 16384, NULL, 32768, 8388608, '2017-06-11 16:09:33', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Kosarica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 8192, 16384, NULL, 32768, 8388608, '2017-06-18 14:49:58', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Kupon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 682, 16384, NULL, 16384, 8388608, '2017-06-26 13:43:03', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Lojalnost', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Podrucje', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 963, 16384, NULL, 16384, 8388608, '2017-06-26 18:58:48', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Radnja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2730, 16384, NULL, 0, 8388608, '2017-06-26 12:39:17', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 16384, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Rezervacija', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 53, 309, 16384, NULL, 32768, 8388608, '2017-05-10 13:50:03', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'StanjeRezervacije', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1638, 16384, NULL, 16384, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Ulica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 862, 16384, NULL, 16384, 8388608, '2017-05-08 09:21:47', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Vozi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Vozilo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5461, 16384, NULL, 0, 8388608, '2017-05-08 18:22:17', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Voznja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2340, 16384, NULL, 32768, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'Vrsta_korisnika', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4096, 16384, NULL, 0, 8388608, '2017-05-08 05:50:36', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'jeIzvrsio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 176, 16384, NULL, 32768, 8388608, '2017-06-26 12:44:06', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'jeKreirao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 16384, NULL, 32768, 8388608, '2017-06-26 12:43:19', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'jeKupio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4096, 16384, NULL, 32768, 8388608, '2017-06-18 15:35:49', NULL, NULL, NULL, '', '', NULL),
('def', 'WebDiP2016x131', 'seVrednuje', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 481, 16384, NULL, 32768, 8388608, '2017-06-11 17:16:43', NULL, NULL, NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PLUGINS`
--

CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL,
  `LOAD_OPTION` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PLUGINS`
--

INSERT INTO `PLUGINS` (`PLUGIN_NAME`, `PLUGIN_VERSION`, `PLUGIN_STATUS`, `PLUGIN_TYPE`, `PLUGIN_TYPE_VERSION`, `PLUGIN_LIBRARY`, `PLUGIN_LIBRARY_VERSION`, `PLUGIN_AUTHOR`, `PLUGIN_DESCRIPTION`, `PLUGIN_LICENSE`, `LOAD_OPTION`) VALUES
('binlog', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'MySQL AB', 'This is a pseudo storage engine to represent the binlog in a transaction', 'GPL', 'FORCE'),
('mysql_native_password', '1.0', 'ACTIVE', 'AUTHENTICATION', '1.0', NULL, NULL, 'R.J.Silk, Sergei Golubchik', 'Native MySQL authentication', 'GPL', 'FORCE'),
('mysql_old_password', '1.0', 'ACTIVE', 'AUTHENTICATION', '1.0', NULL, NULL, 'R.J.Silk, Sergei Golubchik', 'Old MySQL-4.0 authentication', 'GPL', 'FORCE'),
('MRG_MYISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'MySQL AB', 'Collection of identical MyISAM tables', 'GPL', 'FORCE'),
('MyISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'MySQL AB', 'MyISAM storage engine', 'GPL', 'FORCE'),
('CSV', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'Brian Aker, MySQL AB', 'CSV storage engine', 'GPL', 'FORCE'),
('MEMORY', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'MySQL AB', 'Hash based, stored in memory, useful for temporary tables', 'GPL', 'FORCE'),
('FEDERATED', '1.0', 'DISABLED', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'Patrick Galbraith and Brian Aker, MySQL AB', 'Federated MySQL storage engine', 'GPL', 'OFF'),
('BLACKHOLE', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'MySQL AB', '/dev/null storage engine (anything you write to it disappears)', 'GPL', 'ON'),
('InnoDB', '5.5', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'Oracle Corporation', 'Supports transactions, row-level locking, and foreign keys', 'GPL', 'ON'),
('INNODB_TRX', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'InnoDB transactions', 'GPL', 'ON'),
('INNODB_LOCKS', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'InnoDB conflicting locks', 'GPL', 'ON'),
('INNODB_LOCK_WAITS', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'InnoDB which lock is blocking which', 'GPL', 'ON'),
('INNODB_CMP', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compression', 'GPL', 'ON'),
('INNODB_CMP_RESET', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compression; reset cumulated counts', 'GPL', 'ON'),
('INNODB_CMPMEM', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compressed buffer pool', 'GPL', 'ON'),
('INNODB_CMPMEM_RESET', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'Statistics for the InnoDB compressed buffer pool; reset cumulated counts', 'GPL', 'ON'),
('INNODB_BUFFER_PAGE', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'InnoDB Buffer Page Information', 'GPL', 'ON'),
('INNODB_BUFFER_PAGE_LRU', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'InnoDB Buffer Page in LRU', 'GPL', 'ON'),
('INNODB_BUFFER_POOL_STATS', '5.5', 'ACTIVE', 'INFORMATION SCHEMA', '50555.0', NULL, NULL, 'Oracle Corporation', 'InnoDB Buffer Pool Statistics Information ', 'GPL', 'ON'),
('ARCHIVE', '3.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'Brian Aker, MySQL AB', 'Archive storage engine', 'GPL', 'ON'),
('PERFORMANCE_SCHEMA', '0.1', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'Marc Alff, Oracle', 'Performance Schema', 'GPL', 'FORCE'),
('partition', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50555.0', NULL, NULL, 'Mikael Ronstrom, MySQL AB', 'Partition Storage Engine Helper', 'GPL', 'ON');

-- --------------------------------------------------------

--
-- Table structure for table `PROCESSLIST`
--

CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROCESSLIST`
--

INSERT INTO `PROCESSLIST` (`ID`, `USER`, `HOST`, `DB`, `COMMAND`, `TIME`, `STATE`, `INFO`) VALUES
(193560, 'WebDiP2016x131', 'localhost', 'WebDiP2016x131', 'Query', 0, 'executing', 'SELECT * FROM `information_schema`.`PROCESSLIST`');

-- --------------------------------------------------------

--
-- Table structure for table `PROFILING`
--

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `REFERENTIAL_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `REFERENTIAL_CONSTRAINTS`
--

INSERT INTO `REFERENTIAL_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `UNIQUE_CONSTRAINT_CATALOG`, `UNIQUE_CONSTRAINT_SCHEMA`, `UNIQUE_CONSTRAINT_NAME`, `MATCH_OPTION`, `UPDATE_RULE`, `DELETE_RULE`, `TABLE_NAME`, `REFERENCED_TABLE_NAME`) VALUES
('def', 'WebDiP2016x131', 'idAdmina', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Akcija', 'Korisnik'),
('def', 'WebDiP2016x131', 'idAkcije', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Akciju_izvrsio', 'Akcija'),
('def', 'WebDiP2016x131', 'idKorisnikaAkcije', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Akciju_izvrsio', 'Korisnik'),
('def', 'WebDiP2016x131', 'AktivacijskiKod_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'AktivacijskiKod', 'Korisnik'),
('def', 'WebDiP2016x131', 'Dnevnik_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Dnevnik', 'RadnjeZaDnevnik'),
('def', 'WebDiP2016x131', 'JeRezervirao_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'JeRezervirao', 'Korisnik'),
('def', 'WebDiP2016x131', 'JeRezervirao_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'JeRezervirao', 'Rezervacija'),
('def', 'WebDiP2016x131', 'fk_Korisnik_Vrsta_korisnika', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Korisnik', 'Vrsta_korisnika'),
('def', 'WebDiP2016x131', 'Kosarica_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Kosarica', 'Korisnik'),
('def', 'WebDiP2016x131', 'Kosarica_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Kosarica', 'seVrednuje'),
('def', 'WebDiP2016x131', 'Kupon_izradio', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Kupon', 'Korisnik'),
('def', 'WebDiP2016x131', 'idKorisnikaLojalnost', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Lojalnost', 'Korisnik'),
('def', 'WebDiP2016x131', 'idKuponaLojalnost', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Lojalnost', 'Kupon'),
('def', 'WebDiP2016x131', 'idAdminaPodrucje', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Podrucje', 'Korisnik'),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'RadnjeZaDnevnik', 'Korisnik'),
('def', 'WebDiP2016x131', 'Rezervacija_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'Rezervacija', 'Podrucje'),
('def', 'WebDiP2016x131', 'Rezervacija_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'CASCADE', 'CASCADE', 'Rezervacija', 'Ulica'),
('def', 'WebDiP2016x131', 'idAdminStanjeRezervacije', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'StanjeRezervacije', 'Korisnik'),
('def', 'WebDiP2016x131', 'idPodrucjaUlica', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'NO ACTION', 'NO ACTION', 'Ulica', 'Podrucje'),
('def', 'WebDiP2016x131', 'Vozi_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Vozi', 'Vozilo'),
('def', 'WebDiP2016x131', 'Vozi_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Vozi', 'Korisnik'),
('def', 'WebDiP2016x131', 'Voznja_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Voznja', 'Vozilo'),
('def', 'WebDiP2016x131', 'Voznja_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'Voznja', 'Rezervacija'),
('def', 'WebDiP2016x131', 'jeIzvrsio_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'jeIzvrsio', 'Korisnik'),
('def', 'WebDiP2016x131', 'jeIzvrsio_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'jeIzvrsio', 'Radnja'),
('def', 'WebDiP2016x131', 'jeKreirao_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'jeKreirao', 'Korisnik'),
('def', 'WebDiP2016x131', 'jeKreirao_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'jeKreirao', 'Podrucje'),
('def', 'WebDiP2016x131', 'jeKupio_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'jeKupio', 'Korisnik'),
('def', 'WebDiP2016x131', 'jeKupio_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'jeKupio', 'seVrednuje'),
('def', 'WebDiP2016x131', 'seVrednuje_ibfk_1', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'seVrednuje', 'Kupon'),
('def', 'WebDiP2016x131', 'seVrednuje_ibfk_2', 'def', 'WebDiP2016x131', 'PRIMARY', 'NONE', 'RESTRICT', 'RESTRICT', 'seVrednuje', 'Podrucje');

-- --------------------------------------------------------

--
-- Table structure for table `ROUTINES`
--

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` longtext NOT NULL,
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMATA`
--

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) NOT NULL DEFAULT '',
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
('def', 'information_schema', 'utf8', 'utf8_general_ci', NULL),
('def', 'WebDiP2016x131', 'latin2', 'latin2_croatian_ci', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMA_PRIVILEGES`
--

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'SELECT', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'INSERT', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'UPDATE', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'DELETE', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'CREATE', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'DROP', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'REFERENCES', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'INDEX', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'ALTER', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'CREATE TEMPORARY TABLES', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'LOCK TABLES', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'EXECUTE', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'CREATE VIEW', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'SHOW VIEW', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'CREATE ROUTINE', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'ALTER ROUTINE', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'EVENT', 'NO'),
('''WebDiP2016x131''@''localhost''', 'def', 'WebDiP2016x131', 'TRIGGER', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_STATUS`
--

CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_STATUS`
--

INSERT INTO `SESSION_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '28'),
('ABORTED_CONNECTS', '5206'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BINLOG_STMT_CACHE_DISK_USE', '0'),
('BINLOG_STMT_CACHE_USE', '0'),
('BYTES_RECEIVED', '15123'),
('BYTES_SENT', '374415'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '0'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '2'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '0'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '0'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '0'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESIGNAL', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '46'),
('COM_SET_OPTION', '48'),
('COM_SIGNAL', '0'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '0'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '44'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '1'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '0'),
('COM_SHOW_FUNCTION_STATUS', '2'),
('COM_SHOW_GRANTS', '0'),
('COM_SHOW_KEYS', '0'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '1'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '2'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_RELAYLOG_EVENTS', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '0'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '0'),
('COM_SHOW_TABLE_STATUS', '87'),
('COM_SHOW_TABLES', '2'),
('COM_SHOW_TRIGGERS', '43'),
('COM_SHOW_VARIABLES', '1'),
('COM_SHOW_WARNINGS', '0'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '0'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '193561'),
('CREATED_TMP_DISK_TABLES', '120'),
('CREATED_TMP_FILES', '47'),
('CREATED_TMP_TABLES', '404'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '23'),
('HANDLER_DELETE', '0'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '29'),
('HANDLER_READ_KEY', '23'),
('HANDLER_READ_LAST', '0'),
('HANDLER_READ_NEXT', '30'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '2573'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '0'),
('HANDLER_WRITE', '2190'),
('INNODB_BUFFER_POOL_PAGES_DATA', '8162'),
('INNODB_BUFFER_POOL_BYTES_DATA', '133726208'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '0'),
('INNODB_BUFFER_POOL_BYTES_DIRTY', '0'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '13962'),
('INNODB_BUFFER_POOL_PAGES_FREE', '1'),
('INNODB_BUFFER_POOL_PAGES_MISC', '29'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '8192'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD', '0'),
('INNODB_BUFFER_POOL_READ_AHEAD_EVICTED', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '936862'),
('INNODB_BUFFER_POOL_READS', '8476'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '48599'),
('INNODB_DATA_FSYNCS', '13443'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '141053952'),
('INNODB_DATA_READS', '8511'),
('INNODB_DATA_WRITES', '24717'),
('INNODB_DATA_WRITTEN', '463773696'),
('INNODB_DBLWR_PAGES_WRITTEN', '13962'),
('INNODB_DBLWR_WRITES', '2727'),
('INNODB_HAVE_ATOMIC_BUILTINS', 'ON'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '4632'),
('INNODB_LOG_WRITES', '5487'),
('INNODB_OS_LOG_FSYNCS', '7996'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '4985344'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '25'),
('INNODB_PAGES_READ', '8475'),
('INNODB_PAGES_WRITTEN', '13962'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '0'),
('INNODB_ROW_LOCK_TIME_AVG', '0'),
('INNODB_ROW_LOCK_TIME_MAX', '0'),
('INNODB_ROW_LOCK_WAITS', '0'),
('INNODB_ROWS_DELETED', '579'),
('INNODB_ROWS_INSERTED', '5190'),
('INNODB_ROWS_READ', '242207'),
('INNODB_ROWS_UPDATED', '1170'),
('INNODB_TRUNCATED_STATUS_WRITES', '0'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '13367'),
('KEY_BLOCKS_USED', '31'),
('KEY_READ_REQUESTS', '10020'),
('KEY_READS', '31'),
('KEY_WRITE_REQUESTS', '239'),
('KEY_WRITES', '16'),
('LAST_QUERY_COST', '10.499000'),
('MAX_USED_CONNECTIONS', '6'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '73'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '400'),
('OPEN_TABLES', '399'),
('OPENED_FILES', '43413'),
('OPENED_TABLE_DEFINITIONS', '0'),
('OPENED_TABLES', '0'),
('PERFORMANCE_SCHEMA_COND_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_COND_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_FILE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_LOCKER_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_MUTEX_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_RWLOCK_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_HANDLES_LOST', '0'),
('PERFORMANCE_SCHEMA_TABLE_INSTANCES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_CLASSES_LOST', '0'),
('PERFORMANCE_SCHEMA_THREAD_INSTANCES_LOST', '0'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '217'),
('QCACHE_FREE_MEMORY', '13693464'),
('QCACHE_HITS', '59416'),
('QCACHE_INSERTS', '7691'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '128221'),
('QCACHE_QUERIES_IN_CACHE', '2252'),
('QCACHE_TOTAL_BLOCKS', '5000'),
('QUERIES', '588164'),
('QUESTIONS', '279'),
('RPL_STATUS', 'AUTH_MASTER'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '184'),
('SLAVE_HEARTBEAT_PERIOD', '0.000'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RECEIVED_HEARTBEATS', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '0'),
('SORT_SCAN', '0'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '16852'),
('TABLE_LOCKS_WAITED', '0'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '6'),
('THREADS_CONNECTED', '2'),
('THREADS_CREATED', '8'),
('THREADS_RUNNING', '1'),
('UPTIME', '635257'),
('UPTIME_SINCE_FLUSH_STATUS', '635257');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_VARIABLES`
--

CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_VARIABLES`
--

INSERT INTO `SESSION_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('INNODB_BUFFER_POOL_SIZE', '134217728'),
('HAVE_CRYPT', 'YES'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_LONG_SIZE', '10000'),
('INNODB_VERSION', '5.5.55'),
('QUERY_PREALLOC_SIZE', '8192'),
('DELAYED_QUEUE_SIZE', '1000'),
('PERFORMANCE_SCHEMA_MAX_COND_INSTANCES', '1000'),
('SSL_CIPHER', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SECURE_FILE_PRIV', '/var/lib/mysql-files/'),
('TIMED_MUTEXES', 'OFF'),
('DELAYED_INSERT_TIMEOUT', '300'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_INSTANCES', '1000000'),
('LC_TIME_NAMES', 'en_US'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_INSTANCES', '1000000'),
('TIME_FORMAT', '%H:%i:%s'),
('PERFORMANCE_SCHEMA_MAX_RWLOCK_CLASSES', '30'),
('BASEDIR', '/usr'),
('PERFORMANCE_SCHEMA_MAX_MUTEX_CLASSES', '200'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('BACK_LOG', '50'),
('SLOW_LAUNCH_TIME', '2'),
('EVENT_SCHEDULER', 'OFF'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('PERFORMANCE_SCHEMA_MAX_THREAD_CLASSES', '50'),
('RELAY_LOG_INDEX', ''),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('PERFORMANCE_SCHEMA', 'OFF'),
('QUERY_CACHE_SIZE', '16777216'),
('BINLOG_FORMAT', 'STATEMENT'),
('WAIT_TIMEOUT', '28800'),
('LONG_QUERY_TIME', '10.000000'),
('PERFORMANCE_SCHEMA_MAX_TABLE_HANDLES', '100000'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('LOWER_CASE_TABLE_NAMES', '0'),
('BINLOG_CACHE_SIZE', '32768'),
('REPORT_HOST', ''),
('CHARACTER_SET_RESULTS', 'utf8'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('CHARACTER_SET_CONNECTION', 'utf8'),
('INNODB_ROLLBACK_SEGMENTS', '128'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LARGE_FILES_SUPPORT', 'ON'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('SQL_SAFE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('NET_BUFFER_LENGTH', '16384'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('SKIP_SHOW_DATABASE', 'OFF'),
('FT_MAX_WORD_LEN', '84'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('MAX_SP_RECURSION_DEPTH', '0'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('SYNC_RELAY_LOG', '0'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('HAVE_QUERY_CACHE', 'YES'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('DELAY_KEY_WRITE', 'ON'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('MYISAM_RECOVER_OPTIONS', 'BACKUP'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('PROTOCOL_VERSION', '10'),
('DELAYED_INSERT_LIMIT', '100'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('COMPLETION_TYPE', 'NO_CHAIN'),
('REPORT_PASSWORD', ''),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('MAX_INSERT_DELAYED_THREADS', '20'),
('VERSION_COMMENT', '(Debian)'),
('SQL_BIG_SELECTS', 'ON'),
('AUTO_INCREMENT_OFFSET', '1'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('JOIN_BUFFER_SIZE', '131072'),
('THREAD_CACHE_SIZE', '8'),
('CONNECT_TIMEOUT', '10'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('INIT_FILE', ''),
('DEFAULT_WEEK_FORMAT', '0'),
('LARGE_PAGES', 'OFF'),
('LOG_OUTPUT', 'FILE'),
('LARGE_PAGE_SIZE', '0'),
('INNODB_IO_CAPACITY', '200'),
('INIT_SLAVE', ''),
('INNODB_USE_NATIVE_AIO', 'ON'),
('MAX_BINLOG_SIZE', '104857600'),
('HAVE_SYMLINK', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TIME_ZONE', '+00:00'),
('MAX_CONNECTIONS', '151'),
('INNODB_TABLE_LOCKS', 'ON'),
('PROXY_USER', ''),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('READ_BUFFER_SIZE', '131072'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('PSEUDO_THREAD_ID', '193560'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('SQL_AUTO_IS_NULL', 'OFF'),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('SORT_BUFFER_SIZE', '2097152'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('SYNC_RELAY_LOG_INFO', '0'),
('LOCK_WAIT_TIMEOUT', '31536000'),
('INNODB_REPLICATION_DELAY', '0'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('NET_RETRY_COUNT', '10'),
('INNODB_STATS_ON_METADATA', 'ON'),
('LOG_WARNINGS', '1'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('FLUSH', 'OFF'),
('PROFILING_HISTORY_SIZE', '15'),
('MAX_LONG_DATA_SIZE', '16777216'),
('INNODB_CHANGE_BUFFERING', 'all'),
('CHARACTER_SET_SERVER', 'latin1'),
('READ_RND_BUFFER_SIZE', '262144'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('INNODB_FILE_FORMAT', 'Antelope'),
('FLUSH_TIME', '0'),
('BIG_TABLES', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin2'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('DATE_FORMAT', '%Y-%m-%d'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('READ_ONLY', 'OFF'),
('BINLOG_STMT_CACHE_SIZE', '32768'),
('RAND_SEED1', '0'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('PERFORMANCE_SCHEMA_MAX_FILE_CLASSES', '50'),
('INNODB_PURGE_THREADS', '0'),
('MAX_SORT_LENGTH', '1024'),
('PROFILING', 'OFF'),
('PERFORMANCE_SCHEMA_EVENTS_WAITS_HISTORY_SIZE', '10'),
('INNODB_STRICT_MODE', 'OFF'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('OLD_PASSWORDS', 'OFF'),
('GENERAL_LOG_FILE', '/var/lib/mysql/barka.log'),
('NET_WRITE_TIMEOUT', '60'),
('PERFORMANCE_SCHEMA_MAX_COND_CLASSES', '80'),
('QUERY_CACHE_TYPE', 'ON'),
('AUTO_INCREMENT_INCREMENT', '1'),
('METADATA_LOCKS_CACHE_SIZE', '1024'),
('TMPDIR', '/tmp'),
('QUERY_CACHE_LIMIT', '1048576'),
('EXPIRE_LOGS_DAYS', '10'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('HAVE_PARTITIONING', 'YES'),
('LOG_ERROR', ''),
('FOREIGN_KEY_CHECKS', 'ON'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('THREAD_STACK', '196608'),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('NEW', 'OFF'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('SKIP_NAME_RESOLVE', 'OFF'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('INNODB_PURGE_BATCH_SIZE', '20'),
('MAX_ALLOWED_PACKET', '16777216'),
('VERSION', '5.5.55-0+deb7u1'),
('CONCURRENT_INSERT', 'AUTO'),
('INNODB_SUPPORT_XA', 'ON'),
('TABLE_DEFINITION_CACHE', '400'),
('INNODB_SYNC_SPIN_LOOPS', '30'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('COLLATION_CONNECTION', 'utf8_general_ci'),
('MYISAM_REPAIR_THREADS', '1'),
('INNODB_ADAPTIVE_FLUSHING', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('SYSTEM_TIME_ZONE', 'CEST'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('DIV_PRECISION_INCREMENT', '4'),
('SYNC_FRM', 'ON'),
('STORED_PROGRAM_CACHE', '256'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_DATA_HOME_DIR', ''),
('PERFORMANCE_SCHEMA_MAX_THREAD_INSTANCES', '1000'),
('INNODB_READ_IO_THREADS', '4'),
('MULTI_RANGE_COUNT', '256'),
('INNODB_WRITE_IO_THREADS', '4'),
('SERVER_ID', '0'),
('INNODB_BUFFER_POOL_INSTANCES', '1'),
('SKIP_NETWORKING', 'OFF'),
('INNODB_FORCE_RECOVERY', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('INIT_CONNECT', ''),
('ERROR_COUNT', '0'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('AUTOCOMMIT', 'ON'),
('SYNC_BINLOG', '0'),
('SSL_CAPATH', ''),
('INNODB_PRINT_ALL_DEADLOCKS', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_OPEN_FILES', '300'),
('GENERAL_LOG', 'OFF'),
('INNODB_FILE_FORMAT_CHECK', 'ON'),
('LAST_INSERT_ID', '0'),
('INNODB_READ_AHEAD_THRESHOLD', '56'),
('HOSTNAME', 'barka'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('OLD', 'OFF'),
('KEY_BUFFER_SIZE', '16777216'),
('REPORT_PORT', '3306'),
('HAVE_NDBCLUSTER', 'NO'),
('SQL_LOG_BIN', 'ON'),
('PSEUDO_SLAVE_MODE', 'OFF'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('INNODB_STATS_METHOD', 'nulls_equal'),
('LOG_BIN', 'OFF'),
('INNODB_FAST_SHUTDOWN', '1'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SSL_CA', ''),
('MAX_USER_CONNECTIONS', '0'),
('INNODB_THREAD_CONCURRENCY', '0'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('SLAVE_NET_TIMEOUT', '3600'),
('TABLE_OPEN_CACHE', '400'),
('INNODB_STATS_SAMPLE_PAGES', '8'),
('SQL_BIG_TABLES', 'OFF'),
('LOCAL_INFILE', 'ON'),
('SQL_BUFFER_RESULT', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('HAVE_PROFILING', 'YES'),
('LC_MESSAGES_DIR', '/usr/share/mysql/'),
('OLD_ALTER_TABLE', 'OFF'),
('HAVE_INNODB', 'YES'),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('SQL_MODE', ''),
('PERFORMANCE_SCHEMA_MAX_FILE_HANDLES', '32768'),
('TIMESTAMP', '1499177065'),
('RELAY_LOG_RECOVERY', 'OFF'),
('REPORT_USER', ''),
('MAX_DELAYED_THREADS', '20'),
('HAVE_GEOMETRY', 'YES'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('LC_MESSAGES', 'en_US'),
('MAX_RELAY_LOG_SIZE', '0'),
('LOG', 'OFF'),
('INNODB_RANDOM_READ_AHEAD', 'OFF'),
('OPEN_FILES_LIMIT', '1024'),
('HAVE_CSV', 'YES'),
('DATADIR', '/var/lib/mysql/'),
('PORT', '3306'),
('FT_MIN_WORD_LEN', '4'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('VERSION_COMPILE_OS', 'debian-linux-gnu'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('INNODB_FORCE_LOAD_CORRUPTED', 'OFF'),
('SQL_WARNINGS', 'OFF'),
('HAVE_OPENSSL', 'DISABLED'),
('RELAY_LOG', ''),
('MAX_BINLOG_STMT_CACHE_SIZE', '18446744073709547520'),
('PLUGIN_DIR', '/usr/lib/mysql/plugin/'),
('PERFORMANCE_SCHEMA_MAX_FILE_INSTANCES', '10000'),
('LOG_SLOW_QUERIES', 'OFF'),
('INNODB_SPIN_WAIT_DELAY', '6'),
('MAX_TMP_TABLES', '32'),
('INNODB_FILE_FORMAT_MAX', 'Antelope'),
('SQL_LOG_OFF', 'OFF'),
('DEFAULT_STORAGE_ENGINE', 'InnoDB'),
('SLOW_QUERY_LOG_FILE', '/var/lib/mysql/barka-slow.log'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('SQL_SLAVE_SKIP_COUNTER', '0'),
('INNODB_OLD_BLOCKS_TIME', '0'),
('SECURE_AUTH', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('NET_READ_TIMEOUT', '30'),
('WARNING_COUNT', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,engine_condition_pushdown=on'),
('MAX_CONNECT_ERRORS', '10'),
('LOCKED_IN_MEMORY', 'OFF'),
('INNODB_FLUSH_METHOD', ''),
('EXTERNAL_USER', ''),
('INNODB_LARGE_PREFIX', 'OFF'),
('INNODB_CHECKSUMS', 'ON'),
('STORAGE_ENGINE', 'InnoDB'),
('SSL_KEY', ''),
('HAVE_SSL', 'DISABLED'),
('MYISAM_USE_MMAP', 'OFF'),
('RAND_SEED2', '0'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('INSERT_ID', '0'),
('LOG_SLAVE_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('SYNC_MASTER_INFO', '0'),
('COLLATION_DATABASE', 'latin2_croatian_ci'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SSL_CERT', ''),
('INNODB_LOG_BUFFER_SIZE', '8388608'),
('SOCKET', '/var/run/mysqld/mysqld.sock'),
('CHARACTER_SET_CLIENT', 'utf8'),
('IDENTITY', '0'),
('INNODB_MAX_PURGE_LAG', '0'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('SLAVE_LOAD_TMPDIR', '/tmp'),
('SLAVE_TYPE_CONVERSIONS', ''),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '8388608'),
('SQL_NOTES', 'ON'),
('INNODB_USE_SYS_MALLOC', 'ON'),
('LICENSE', 'GPL'),
('INNODB_MAX_DIRTY_PAGES_PCT', '75'),
('PERFORMANCE_SCHEMA_MAX_TABLE_INSTANCES', '50000'),
('THREAD_CONCURRENCY', '10'),
('UNIQUE_CHECKS', 'ON'),
('INNODB_OLD_BLOCKS_PCT', '37'),
('HAVE_COMPRESS', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `STATISTICS`
--

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL,
  `INDEX_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`, `INDEX_COMMENT`) VALUES
('def', 'WebDiP2016x131', 'Akcija', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idAkcije', 'A', 11, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Akcija', 1, 'WebDiP2016x131', 'idAdmina_idx', 1, 'Akciju_kreirao', 'A', 11, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_IzvrsavanjaAkcije', 'A', 47, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 1, 'WebDiP2016x131', 'idAkcije_idx', 1, 'ID_Akcije', 'A', 11, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 1, 'WebDiP2016x131', 'idKorisnika_idx', 1, 'ID_Korisnika', 'A', 47, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'AktivacijskiKod', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_koda', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'AktivacijskiKod', 1, 'WebDiP2016x131', 'ID_korisnika', 1, 'ID_korisnika', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Dnevnik', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idDnevnika', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Dnevnik', 1, 'WebDiP2016x131', 'ID_radnje', 1, 'ID_radnje', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_Rezerviranja', 'A', 11, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 0, 'WebDiP2016x131', 'ID_rezervacije', 1, 'ID_rezervacije', 'A', 11, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 1, 'WebDiP2016x131', 'ID_korisnika', 1, 'ID_korisnika', 'A', 11, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Korisnik', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idKorisnik', 'A', 25, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Korisnik', 0, 'WebDiP2016x131', 'idKorisnik', 1, 'idKorisnik', 'A', 25, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Korisnik', 1, 'WebDiP2016x131', 'fk_Korisnik_Vrsta_korisnika_idx', 1, 'Vrsta_korisnika_idVrsta_korisnika', 'A', 6, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Kosarica', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_stavke', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Kosarica', 1, 'WebDiP2016x131', 'ID_Korisnika', 1, 'ID_Korisnika', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Kosarica', 1, 'WebDiP2016x131', 'ID_KuponaPoPodrucju', 1, 'ID_KuponaPoPodrucju', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Kupon', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idKupon', 'A', 24, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Kupon', 1, 'WebDiP2016x131', 'idAdministratora_idx', 1, 'Kupon_izradio', 'A', 2, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idLojalnost', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 1, 'WebDiP2016x131', 'idKorisnika_idx', 1, 'idKorisnik', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 1, 'WebDiP2016x131', 'idKupona_idx', 1, 'idKupon', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Podrucje', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idPodrucje', 'A', 17, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Podrucje', 1, 'WebDiP2016x131', '_idx', 1, 'idAdministratora', 'A', 17, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Radnja', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_radnje', 'A', 6, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_Radnje', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 1, 'WebDiP2016x131', 'ID_korisnika', 1, 'ID_korisnika', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idRezervacija', 'A', 53, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 1, 'WebDiP2016x131', 'idPodrucja_idx', 1, 'id_podrucje', 'A', 17, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 1, 'WebDiP2016x131', 'UlicaPolaska_idx', 1, 'Ulica_polaska', 'A', 26, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idStanje_rezervacije', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 1, 'WebDiP2016x131', 'idAdministratora_idx', 1, 'Administrator_obradio', 'A', 10, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Ulica', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idUlica', 'A', 19, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Ulica', 1, 'WebDiP2016x131', 'idPodrucja_idx', 1, 'idPodrucja', 'A', 19, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Vozi', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_vozi', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Vozi', 1, 'WebDiP2016x131', 'ID_vozilo', 1, 'ID_vozilo', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Vozi', 1, 'WebDiP2016x131', 'ID_vozilo', 2, 'ID_vozaca', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Vozi', 1, 'WebDiP2016x131', 'ID_vozaca', 1, 'ID_vozaca', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Vozilo', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_taxija', 'A', 3, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Voznja', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_voznje', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Voznja', 1, 'WebDiP2016x131', 'ID_vozila', 1, 'ID_vozila', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Voznja', 1, 'WebDiP2016x131', 'ID_vozila', 2, 'ID_rezervacije', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Voznja', 1, 'WebDiP2016x131', 'ID_rezervacije', 1, 'ID_rezervacije', 'A', 7, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'Vrsta_korisnika', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'idVrsta_korisnika', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_izvrseneRadnje', 'A', 93, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 1, 'WebDiP2016x131', 'ID_korisnika', 1, 'ID_korisnika', 'A', 13, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 1, 'WebDiP2016x131', 'ID_korisnika', 2, 'ID_radnje', 'A', 31, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 1, 'WebDiP2016x131', 'ID_radnje', 1, 'ID_radnje', 'A', 13, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_KreiranjaPodrucja', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 1, 'WebDiP2016x131', 'ID_Korisnika', 1, 'ID_Korisnika', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 1, 'WebDiP2016x131', 'ID_Korisnika', 2, 'ID_Podrucja', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 1, 'WebDiP2016x131', 'ID_Podrucja', 1, 'ID_Podrucja', 'A', 0, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKupio', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_kupnje', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKupio', 1, 'WebDiP2016x131', 'ID_korisnika', 1, 'ID_korisnika', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKupio', 1, 'WebDiP2016x131', 'ID_korisnika', 2, 'ID_vrednovanja', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'jeKupio', 1, 'WebDiP2016x131', 'ID_vrednovanja', 1, 'ID_vrednovanja', 'A', 4, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 0, 'WebDiP2016x131', 'PRIMARY', 1, 'ID_vrednovanja', 'A', 34, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 1, 'WebDiP2016x131', 'ID_kupona', 1, 'ID_kupona', 'A', 34, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 1, 'WebDiP2016x131', 'ID_kupona', 2, 'ID_podrucja', 'A', 34, NULL, NULL, '', 'BTREE', '', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 1, 'WebDiP2016x131', 'ID_podrucja', 1, 'ID_podrucja', 'A', 34, NULL, NULL, '', 'BTREE', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLES`
--

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
('def', 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 384, 0, 16434816, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43690', ''),
('def', 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 231, 0, 16704765, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=72628', ''),
('def', 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 195, 0, 16357770, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=86037', ''),
('def', 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=2802', ''),
('def', 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
('def', 'information_schema', 'ENGINES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 490, 0, 16574250, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=34239', ''),
('def', 'information_schema', 'EVENTS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=618', ''),
('def', 'information_schema', 'FILES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2677, 0, 16758020, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6267', ''),
('def', 'information_schema', 'GLOBAL_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'GLOBAL_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
('def', 'information_schema', 'PARAMETERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=6050', ''),
('def', 'information_schema', 'PARTITIONS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=5579', ''),
('def', 'information_schema', 'PLUGINS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=11328', ''),
('def', 'information_schema', 'PROCESSLIST', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=23899', ''),
('def', 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 308, 0, 16562084, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=54471', ''),
('def', 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4814, 0, 16767162, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3485', ''),
('def', 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=583', ''),
('def', 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3464, 0, 16738048, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4843', ''),
('def', 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2179, 0, 16736899, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
('def', 'information_schema', 'SESSION_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'SESSION_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
('def', 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 5753, 0, 16752736, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2916', ''),
('def', 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 9450, 0, 16764300, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=1775', ''),
('def', 'information_schema', 'TABLESPACES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6951, 0, 16772763, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2413', ''),
('def', 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2504, 0, 16721712, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
('def', 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
('def', 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=569', ''),
('def', 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 1986, 0, 16726092, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
('def', 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2017-07-04 14:04:25', '2017-07-04 14:04:25', NULL, 'utf8_general_ci', NULL, 'max_rows=6935', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6852, 0, 16766844, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2448', ''),
('def', 'information_schema', 'INNODB_TRX', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4534, 0, 16766732, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3700', ''),
('def', 'information_schema', 'INNODB_BUFFER_POOL_STATS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 257, 0, 16332350, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=65280', ''),
('def', 'information_schema', 'INNODB_LOCK_WAITS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 599, 0, 16749238, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=28008', ''),
('def', 'information_schema', 'INNODB_CMPMEM', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 29, 0, 15204352, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=578524', ''),
('def', 'information_schema', 'INNODB_CMP', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 25, 0, 13107200, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=671088', ''),
('def', 'information_schema', 'INNODB_LOCKS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 31244, 0, 16746784, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=536', ''),
('def', 'information_schema', 'INNODB_CMPMEM_RESET', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 29, 0, 15204352, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=578524', ''),
('def', 'information_schema', 'INNODB_CMP_RESET', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 25, 0, 13107200, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=671088', ''),
('def', 'information_schema', 'INNODB_BUFFER_PAGE_LRU', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 6669, 0, 16765866, 0, 0, NULL, '2017-07-04 14:04:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2515', ''),
('def', 'WebDiP2016x131', 'Akcija', 'BASE TABLE', 'InnoDB', 10, 'Compact', 11, 1489, 16384, 0, 16384, 8388608, NULL, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Akciju_izvrsio', 'BASE TABLE', 'InnoDB', 10, 'Compact', 47, 348, 16384, 0, 32768, 8388608, 85, '2017-06-11 14:26:54', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'AktivacijskiKod', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 16384, 8388608, 85, '2017-05-08 14:31:14', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Dnevnik', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 8388608, 1, '2017-06-20 15:56:42', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'JeRezervirao', 'BASE TABLE', 'InnoDB', 10, 'Compact', 11, 1489, 16384, 0, 32768, 8388608, 42, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Korisnik', 'BASE TABLE', 'InnoDB', 10, 'Compact', 25, 655, 16384, 0, 32768, 8388608, 72, '2017-06-11 16:09:33', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Kosarica', 'BASE TABLE', 'InnoDB', 10, 'Compact', 2, 8192, 16384, 0, 32768, 8388608, 3, '2017-06-18 14:49:58', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Kupon', 'BASE TABLE', 'InnoDB', 10, 'Compact', 24, 682, 16384, 0, 16384, 8388608, 35, '2017-06-26 13:43:03', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Lojalnost', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 8388608, NULL, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Podrucje', 'BASE TABLE', 'InnoDB', 10, 'Compact', 17, 963, 16384, 0, 16384, 8388608, 18, '2017-06-26 18:58:48', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Radnja', 'BASE TABLE', 'InnoDB', 10, 'Compact', 6, 2730, 16384, 0, 0, 8388608, 8, '2017-06-26 12:39:17', NULL, NULL, 'latin2_croatian_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 8388608, 1, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Rezervacija', 'BASE TABLE', 'InnoDB', 10, 'Compact', 53, 309, 16384, 0, 32768, 8388608, 68, '2017-05-10 13:50:03', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'StanjeRezervacije', 'BASE TABLE', 'InnoDB', 10, 'Compact', 10, 1638, 16384, 0, 16384, 8388608, NULL, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Ulica', 'BASE TABLE', 'InnoDB', 10, 'Compact', 19, 862, 16384, 0, 16384, 8388608, 20, '2017-05-08 09:21:47', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Vozi', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 8388608, 1, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Vozilo', 'BASE TABLE', 'InnoDB', 10, 'Compact', 3, 5461, 16384, 0, 0, 8388608, 4, '2017-05-08 18:22:17', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Voznja', 'BASE TABLE', 'InnoDB', 10, 'Compact', 7, 2340, 16384, 0, 32768, 8388608, 37, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'Vrsta_korisnika', 'BASE TABLE', 'InnoDB', 10, 'Compact', 4, 4096, 16384, 0, 0, 8388608, NULL, '2017-05-08 05:50:36', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'jeIzvrsio', 'BASE TABLE', 'InnoDB', 10, 'Compact', 93, 176, 16384, 0, 32768, 8388608, 94, '2017-06-26 12:44:06', NULL, NULL, 'latin2_croatian_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'jeKreirao', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 8388608, 1, '2017-06-26 12:43:19', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'jeKupio', 'BASE TABLE', 'InnoDB', 10, 'Compact', 4, 4096, 16384, 0, 32768, 8388608, 7, '2017-06-18 15:35:49', NULL, NULL, 'utf8_general_ci', NULL, '', ''),
('def', 'WebDiP2016x131', 'seVrednuje', 'BASE TABLE', 'InnoDB', 10, 'Compact', 34, 481, 16384, 0, 32768, 8388608, 51, '2017-06-11 17:16:43', NULL, NULL, 'utf8_general_ci', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLESPACES`
--

CREATE TEMPORARY TABLE `TABLESPACES` (
  `TABLESPACE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `TABLESPACE_TYPE` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `EXTENT_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `NODEGROUP_ID` bigint(21) unsigned DEFAULT NULL,
  `TABLESPACE_COMMENT` varchar(2048) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Akcija', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idAdmina', 'WebDiP2016x131', 'Akcija', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Akciju_izvrsio', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idAkcije', 'WebDiP2016x131', 'Akciju_izvrsio', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'idKorisnikaAkcije', 'WebDiP2016x131', 'Akciju_izvrsio', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'AktivacijskiKod', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'AktivacijskiKod_ibfk_1', 'WebDiP2016x131', 'AktivacijskiKod', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Dnevnik', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'Dnevnik_ibfk_1', 'WebDiP2016x131', 'Dnevnik', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'JeRezervirao', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'ID_rezervacije', 'WebDiP2016x131', 'JeRezervirao', 'UNIQUE'),
('def', 'WebDiP2016x131', 'JeRezervirao_ibfk_1', 'WebDiP2016x131', 'JeRezervirao', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'JeRezervirao_ibfk_2', 'WebDiP2016x131', 'JeRezervirao', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Korisnik', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idKorisnik', 'WebDiP2016x131', 'Korisnik', 'UNIQUE'),
('def', 'WebDiP2016x131', 'fk_Korisnik_Vrsta_korisnika', 'WebDiP2016x131', 'Korisnik', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Kosarica', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'Kosarica_ibfk_1', 'WebDiP2016x131', 'Kosarica', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'Kosarica_ibfk_2', 'WebDiP2016x131', 'Kosarica', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Kupon', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'Kupon_izradio', 'WebDiP2016x131', 'Kupon', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Lojalnost', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idKorisnikaLojalnost', 'WebDiP2016x131', 'Lojalnost', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'idKuponaLojalnost', 'WebDiP2016x131', 'Lojalnost', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Podrucje', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idAdminaPodrucje', 'WebDiP2016x131', 'Podrucje', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Radnja', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'RadnjeZaDnevnik_ibfk_1', 'WebDiP2016x131', 'RadnjeZaDnevnik', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Rezervacija', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'Rezervacija_ibfk_1', 'WebDiP2016x131', 'Rezervacija', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'Rezervacija_ibfk_2', 'WebDiP2016x131', 'Rezervacija', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'StanjeRezervacije', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idAdminStanjeRezervacije', 'WebDiP2016x131', 'StanjeRezervacije', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Ulica', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'idPodrucjaUlica', 'WebDiP2016x131', 'Ulica', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Vozi', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'Vozi_ibfk_1', 'WebDiP2016x131', 'Vozi', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'Vozi_ibfk_2', 'WebDiP2016x131', 'Vozi', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Vozilo', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Voznja', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'Voznja_ibfk_1', 'WebDiP2016x131', 'Voznja', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'Voznja_ibfk_2', 'WebDiP2016x131', 'Voznja', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'Vrsta_korisnika', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'jeIzvrsio', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'jeIzvrsio_ibfk_1', 'WebDiP2016x131', 'jeIzvrsio', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'jeIzvrsio_ibfk_2', 'WebDiP2016x131', 'jeIzvrsio', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'jeKreirao', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'jeKreirao_ibfk_1', 'WebDiP2016x131', 'jeKreirao', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'jeKreirao_ibfk_2', 'WebDiP2016x131', 'jeKreirao', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'jeKupio', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'jeKupio_ibfk_1', 'WebDiP2016x131', 'jeKupio', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'jeKupio_ibfk_2', 'WebDiP2016x131', 'jeKupio', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'PRIMARY', 'WebDiP2016x131', 'seVrednuje', 'PRIMARY KEY'),
('def', 'WebDiP2016x131', 'seVrednuje_ibfk_1', 'WebDiP2016x131', 'seVrednuje', 'FOREIGN KEY'),
('def', 'WebDiP2016x131', 'seVrednuje_ibfk_2', 'WebDiP2016x131', 'seVrednuje', 'FOREIGN KEY');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_PRIVILEGES`
--

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TRIGGERS`
--

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `USER_PRIVILEGES`
--

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''WebDiP2016x131''@''localhost''', 'def', 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `VIEWS`
--

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_BUFFER_PAGE`
--

CREATE TEMPORARY TABLE `INNODB_BUFFER_PAGE` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `BLOCK_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `SPACE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FIX_COUNT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `IS_HASHED` varchar(3) DEFAULT NULL,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(1024) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_STATE` varchar(64) DEFAULT NULL,
  `IO_FIX` varchar(64) DEFAULT NULL,
  `IS_OLD` varchar(3) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_TRX`
--

CREATE TEMPORARY TABLE `INNODB_TRX` (
  `trx_id` varchar(18) NOT NULL DEFAULT '',
  `trx_state` varchar(13) NOT NULL DEFAULT '',
  `trx_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trx_requested_lock_id` varchar(81) DEFAULT NULL,
  `trx_wait_started` datetime DEFAULT NULL,
  `trx_weight` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_query` varchar(1024) DEFAULT NULL,
  `trx_operation_state` varchar(64) DEFAULT NULL,
  `trx_tables_in_use` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_tables_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_structs` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_modified` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_isolation_level` varchar(16) NOT NULL DEFAULT '',
  `trx_unique_checks` int(1) NOT NULL DEFAULT '0',
  `trx_foreign_key_checks` int(1) NOT NULL DEFAULT '0',
  `trx_last_foreign_key_error` varchar(256) DEFAULT NULL,
  `trx_adaptive_hash_latched` int(1) NOT NULL DEFAULT '0',
  `trx_adaptive_hash_timeout` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_BUFFER_POOL_STATS`
--

CREATE TEMPORARY TABLE `INNODB_BUFFER_POOL_STATS` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `POOL_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FREE_BUFFERS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLD_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MODIFIED_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_DECOMPRESS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_READS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_FLUSH_LRU` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_FLUSH_LIST` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_NOT_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_MADE_YOUNG_RATE` double NOT NULL DEFAULT '0',
  `PAGES_MADE_NOT_YOUNG_RATE` double NOT NULL DEFAULT '0',
  `NUMBER_PAGES_READ` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_CREATED` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_WRITTEN` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_READ_RATE` double NOT NULL DEFAULT '0',
  `PAGES_CREATE_RATE` double NOT NULL DEFAULT '0',
  `PAGES_WRITTEN_RATE` double NOT NULL DEFAULT '0',
  `NUMBER_PAGES_GET` bigint(21) unsigned NOT NULL DEFAULT '0',
  `HIT_RATE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NOT_YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_READ_AHEAD` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_READ_AHEAD_EVICTED` bigint(21) unsigned NOT NULL DEFAULT '0',
  `READ_AHEAD_RATE` double NOT NULL DEFAULT '0',
  `READ_AHEAD_EVICTED_RATE` double NOT NULL DEFAULT '0',
  `LRU_IO_TOTAL` bigint(21) unsigned NOT NULL DEFAULT '0',
  `LRU_IO_CURRENT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `UNCOMPRESS_TOTAL` bigint(21) unsigned NOT NULL DEFAULT '0',
  `UNCOMPRESS_CURRENT` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_LOCK_WAITS`
--

CREATE TEMPORARY TABLE `INNODB_LOCK_WAITS` (
  `requesting_trx_id` varchar(18) NOT NULL DEFAULT '',
  `requested_lock_id` varchar(81) NOT NULL DEFAULT '',
  `blocking_trx_id` varchar(18) NOT NULL DEFAULT '',
  `blocking_lock_id` varchar(81) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_CMPMEM`
--

CREATE TEMPORARY TABLE `INNODB_CMPMEM` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_CMP`
--

CREATE TEMPORARY TABLE `INNODB_CMP` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_LOCKS`
--

CREATE TEMPORARY TABLE `INNODB_LOCKS` (
  `lock_id` varchar(81) NOT NULL DEFAULT '',
  `lock_trx_id` varchar(18) NOT NULL DEFAULT '',
  `lock_mode` varchar(32) NOT NULL DEFAULT '',
  `lock_type` varchar(32) NOT NULL DEFAULT '',
  `lock_table` varchar(1024) NOT NULL DEFAULT '',
  `lock_index` varchar(1024) DEFAULT NULL,
  `lock_space` bigint(21) unsigned DEFAULT NULL,
  `lock_page` bigint(21) unsigned DEFAULT NULL,
  `lock_rec` bigint(21) unsigned DEFAULT NULL,
  `lock_data` varchar(8192) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_CMPMEM_RESET`
--

CREATE TEMPORARY TABLE `INNODB_CMPMEM_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_CMP_RESET`
--

CREATE TEMPORARY TABLE `INNODB_CMP_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

-- --------------------------------------------------------

--
-- Table structure for table `INNODB_BUFFER_PAGE_LRU`
--

CREATE TEMPORARY TABLE `INNODB_BUFFER_PAGE_LRU` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `LRU_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `SPACE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FIX_COUNT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `IS_HASHED` varchar(3) DEFAULT NULL,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(1024) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED` varchar(3) DEFAULT NULL,
  `IO_FIX` varchar(64) DEFAULT NULL,
  `IS_OLD` varchar(3) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
-- in use (#1227 - Access denied; you need (at least one of) the PROCESS privilege(s) for this operation)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
