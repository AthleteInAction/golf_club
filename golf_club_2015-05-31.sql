# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.19)
# Database: golf_club
# Generation Time: 2015-06-01 06:26:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `access` mediumint(9) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password_digest`, `access`, `created_at`, `updated_at`)
VALUES
	(1,'Will Robinson','will@wambl.com','$2a$10$GAJ4GAIfLpfQNzqw6tYpMeH0XDJAasz316FXNLZOAH/JacRGvqQVe',1,NULL,'2015-05-29 13:33:33'),
	(2,'Derek William','Cras.pellentesque@pharetra.edu','CSP54LSB7JM',0,NULL,NULL),
	(3,'Lunea Decker','eu.elit.Nulla@dictumcursus.net','BJH07SZV2TS',1,NULL,NULL),
	(4,'Lani Wheeler','Curabitur@arcuimperdiet.edu','UZM12CFX4VZ',1,NULL,NULL),
	(5,'Elizabeth Booth','mus@hendreritidante.co.uk','BOB05CDX7GZ',1,NULL,NULL),
	(6,'Leigh Oliver','sed@ametnullaDonec.co.uk','OJP25SKA9SY',0,NULL,NULL),
	(7,'Ezra Frye','Aenean@semconsequatnec.ca','MCK95OHT4GN',1,NULL,NULL),
	(8,'Jamal Sherman','lobortis.ultrices@interdumfeugiatSed.com','VYO17YIC4CY',1,NULL,NULL),
	(9,'Kirsten Richard','sapien.Cras@sodaleseliterat.org','MPB83OHI9ZI',1,NULL,NULL),
	(10,'Donovan Charles','a@arcuimperdietullamcorper.ca','FHP34ART7KE',0,NULL,NULL),
	(11,'Dahlia Meyers','libero.Morbi.accumsan@loremacrisus.org','BNM48PVF4SS',0,NULL,NULL),
	(12,'Camilla Walton','eleifend.Cras@bibendumDonecfelis.edu','EDV19ODY8PO',0,NULL,NULL),
	(13,'Drew Spencer','risus@ametultricies.org','PYR76KON7EN',1,NULL,NULL),
	(14,'Meredith Woodard','neque@euneque.edu','YLN47UPN5LK',1,NULL,NULL),
	(15,'Maggy Goodwin','auctor@disparturient.ca','OCL26OGS1IN',0,NULL,NULL),
	(16,'Caesar Cleveland','auctor@eratin.com','HWE13ESW3JM',1,NULL,NULL),
	(17,'Rigel Farrell','egestas@iaculislacus.co.uk','GQV44CVM8VW',0,NULL,NULL),
	(18,'Lois Franklin','Sed.nunc@luctus.net','DOC50XXD7KF',1,NULL,NULL),
	(19,'Lareina Baker','vitae.diam@mollis.ca','VRE03YHK9XO',0,NULL,NULL),
	(20,'Sopoline Stafford','bibendum@pedeSuspendissedui.org','FSH84VAF9LH',0,NULL,NULL),
	(21,'Ila Mclaughlin','velit@faucibusleo.ca','UXF13GDY7FJ',0,NULL,NULL),
	(22,'Oren Norton','sed@Phasellus.edu','NNZ93UTY3QS',0,NULL,NULL),
	(23,'Donna Chang','Curabitur.sed.tortor@atortorNunc.com','HAD82RVS4ZV',0,NULL,NULL),
	(24,'Ocean Barron','nunc.est.mollis@rutrumFuscedolor.edu','FCO99IAR8VO',1,NULL,NULL),
	(25,'Shelley Roberts','Quisque.porttitor@amet.ca','AIC31ALR8JY',0,NULL,NULL),
	(26,'Remedios Moran','augue@in.edu','RIV37UKK3DK',0,NULL,NULL),
	(27,'Jane Booth','Phasellus.nulla@lacusMauris.net','GGU58DLD1BO',1,NULL,NULL),
	(28,'Hyacinth Moses','Proin@duiCumsociis.net','ODM68MHS8KC',1,NULL,NULL),
	(29,'Kameko Battle','convallis@dui.edu','FCZ82UUE5MQ',0,NULL,NULL),
	(30,'Noel Leon','rutrum.Fusce.dolor@ornaretortorat.co.uk','CNB95RTP3OJ',0,NULL,NULL),
	(31,'Amir Olson','mauris.rhoncus.id@nasceturridiculus.co.uk','APG18JYK6JH',0,NULL,NULL),
	(32,'Yeo Mathews','tincidunt.nibh.Phasellus@orciPhasellusdapibus.co.uk','XMB00AOR5VS',1,NULL,NULL),
	(33,'Bevis Atkinson','arcu.Vivamus.sit@enim.org','QPR90VNI2OS',1,NULL,NULL),
	(34,'Magee Maynard','quis.lectus.Nullam@aliquamiaculislacus.ca','VEI27OKA6MF',1,NULL,NULL),
	(35,'Mira Carrillo','bibendum.sed@tacitisociosqu.ca','MRU63NZR6SZ',0,NULL,NULL),
	(36,'Lana Adams','augue@dui.com','FZW63REU3TF',1,NULL,NULL),
	(37,'Dante Terry','gravida@Pellentesquehabitant.ca','GOA78WGP0TX',0,NULL,NULL),
	(38,'Jaime Cherry','justo.Proin@iaculisaliquet.edu','SSH02JCL2WS',1,NULL,NULL),
	(39,'Camden Boone','montes@telluseuaugue.net','SSS83CGS0GU',1,NULL,NULL),
	(40,'Cherokee Camacho','laoreet.lectus@velnislQuisque.com','GSN58KKX8RY',0,NULL,NULL),
	(41,'Baker Kline','Donec.vitae@ornaretortorat.ca','FXX66NAS0TH',0,NULL,NULL),
	(42,'Sophia Wilder','risus@euismodindolor.net','FQD73NDZ5BB',0,NULL,NULL),
	(43,'Fleur Ewing','dolor.Nulla.semper@pellentesque.co.uk','CAT10TSE8DU',1,NULL,NULL),
	(44,'Willow Riddle','mauris@semPellentesqueut.co.uk','PYI56LTP7XI',0,NULL,NULL),
	(45,'Paula Mckee','amet.ante.Vivamus@ultriciesdignissimlacus.ca','NQL40FQK8YR',1,NULL,NULL),
	(46,'Catherine Petersen','metus@Donecnibh.net','WWZ81TWN3VL',0,NULL,NULL),
	(47,'Alan Chan','id@sapienCrasdolor.com','KPY57IKG1YZ',0,NULL,NULL),
	(48,'Arden Lopez','Aenean.massa@parturientmontes.edu','ICZ89VEX9UQ',0,NULL,NULL),
	(49,'Dakota Bird','Sed.pharetra.felis@pharetranibh.net','IOY65GEO6VR',1,NULL,NULL),
	(50,'Cleo Salazar','at.nisi.Cum@nisi.com','XTW85PQY9WI',0,NULL,NULL),
	(51,'Dana Pittman','Morbi.sit.amet@tellusNunc.net','HRF78BIB3VO',1,NULL,NULL),
	(52,'Oprah Byrd','felis@Nulla.edu','TET24POJ1PM',1,NULL,NULL),
	(53,'Elijah Barlow','mus@dapibusrutrumjusto.co.uk','CUW72STH3RS',0,NULL,NULL),
	(54,'Ivana Chaney','augue.ac@semutdolor.com','DGH07APZ5QY',1,NULL,NULL),
	(55,'Nolan Gibbs','Nullam.suscipit.est@risus.edu','SDL47PIH5VO',0,NULL,NULL),
	(56,'Dillon Cleveland','quis.massa.Mauris@sed.co.uk','ASJ11UIG8TT',1,NULL,NULL),
	(57,'Ebony Hayes','pretium.et.rutrum@adipiscingelitCurabitur.ca','OUR69HRO4DP',1,NULL,NULL),
	(58,'Gareth Trevino','tempus@ligulaAeneangravida.edu','XXB50FWP0UD',1,NULL,NULL),
	(59,'Julian Ochoa','nunc.interdum.feugiat@scelerisquescelerisque.com','INI81KKQ5LO',1,NULL,NULL),
	(60,'Donna Livingston','aliquet.molestie.tellus@luctus.net','EWC02HMD1OK',0,NULL,NULL),
	(61,'Francesca Justice','nibh@semut.com','BQB43KWX5MW',1,NULL,NULL),
	(62,'Patricia Mercado','auctor@et.com','MJV96KHY3PL',0,NULL,NULL),
	(63,'Destiny Barnett','sed.dolor.Fusce@nec.ca','UBF77CNA7VN',1,NULL,NULL),
	(64,'Amal Boone','turpis.In@mollisPhaselluslibero.org','YKS00LWU3EO',0,NULL,NULL),
	(65,'Reed Mejia','augue.eu.tellus@accumsanconvallisante.co.uk','EWZ62JRI4QF',0,NULL,NULL),
	(66,'Jasper Solis','porta@semperpretiumneque.org','BCR97PGM8XM',0,NULL,NULL),
	(67,'Emi Cervantes','at@vestibulumneceuismod.org','DVL74JIX3DS',1,NULL,NULL),
	(68,'Katell Boyer','arcu@nibhdolornonummy.edu','RPV16UQE8ZC',0,NULL,NULL),
	(69,'Lee Patel','Aliquam.nec@nisl.net','DTY03LXU8YA',0,NULL,NULL),
	(70,'Callie Delgado','varius.et.euismod@musDonecdignissim.co.uk','VJK50WLO5LO',0,NULL,NULL),
	(71,'Donovan Browning','ornare.placerat@lobortisquam.ca','AID73HNQ9OC',0,NULL,NULL),
	(72,'Jordan Reyes','et.nunc.Quisque@lobortis.edu','SXY50HIJ9ZL',0,NULL,NULL),
	(73,'Paki May','turpis@non.co.uk','MXP61UHD7CU',0,NULL,NULL),
	(74,'Inga Patrick','imperdiet@risus.net','GXL81HWZ2CF',1,NULL,NULL),
	(75,'Dahlia Mooney','dictum.Phasellus.in@bibendumfermentummetus.co.uk','ZNB19ARM4SY',0,NULL,NULL),
	(76,'Sylvia Rodriquez','Nunc@lacusQuisque.co.uk','WQD78DLC9JI',1,NULL,NULL),
	(77,'Bertha Schwartz','hendrerit@Nulla.org','YWH13HMZ1UD',1,NULL,NULL),
	(78,'Benjamin Hobbs','aliquet.nec@ullamcorpernislarcu.com','ROA79CZV4DD',0,NULL,NULL),
	(79,'Kaitlin Mendoza','sollicitudin@semperauctor.org','OQE75UKS1VX',1,NULL,NULL),
	(80,'Diana Weeks','odio.Etiam@antedictum.ca','DUA53FQL7PM',1,NULL,NULL),
	(81,'Trevor Lott','eu.nulla.at@Cum.co.uk','YCX27NUY6HF',0,NULL,NULL),
	(82,'Simone Simmons','eu.tellus@nuncinterdum.ca','RIT06OHH7BL',1,NULL,NULL),
	(83,'Solomon Davenport','sagittis.augue.eu@Integer.com','DRT39ROK1VP',1,NULL,NULL),
	(84,'Zorita Fry','vestibulum@mattisCras.net','RMX56YBI2MJ',1,NULL,NULL),
	(85,'Nash Sykes','aliquet@ametnullaDonec.co.uk','POJ65ELA0KG',0,NULL,NULL),
	(86,'Timon Rosario','eget.laoreet.posuere@Duis.com','DGH69TKX1NA',0,NULL,NULL),
	(87,'Noel Daugherty','amet.nulla@pedenonummy.com','OJJ66URU8KX',1,NULL,NULL),
	(88,'Micah Castillo','ornare.sagittis.felis@Suspendisseeleifend.net','BRP15TKC7LT',1,NULL,NULL),
	(89,'Dillon Ruiz','felis.eget.varius@Phasellusdapibus.net','JOA00RTG2UO',1,NULL,NULL),
	(90,'Hadley Berry','id@ipsum.ca','YVX26EJD8DS',0,NULL,NULL),
	(91,'Ivory Moreno','orci.Ut@rutrumnonhendrerit.ca','JFH15ZNO6KH',0,NULL,NULL),
	(92,'Wesley Sampson','et.magna.Praesent@arcuVestibulumut.co.uk','WSI19YIF1BT',1,NULL,NULL),
	(93,'Sydnee Kim','laoreet@vitaealiquet.org','QAH08CZB1YW',1,NULL,NULL),
	(94,'Austin Hoover','vitae.nibh.Donec@atpretium.co.uk','TIW84ZAM2DE',0,NULL,NULL),
	(95,'Adrian Barrett','aliquam.arcu.Aliquam@rutrum.co.uk','QMS10WJT7EI',0,NULL,NULL),
	(96,'Sasha Wiggins','molestie.Sed.id@magnaaneque.edu','VRE17PSP7OJ',0,NULL,NULL),
	(97,'Lane Owens','pulvinar.arcu.et@sapien.co.uk','QII97HMX3KQ',0,NULL,NULL),
	(98,'Kareem Johnston','sit.amet.diam@massaSuspendisse.org','FFO07NZQ8KV',1,NULL,NULL),
	(99,'Lewis Huber','Nunc.mauris.sapien@vestibulumneceuismod.org','KDO32MDE0JR',1,NULL,NULL),
	(100,'Derek Welch','in.magna@Aliquamornare.edu','OHG13FUQ4DP',0,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
