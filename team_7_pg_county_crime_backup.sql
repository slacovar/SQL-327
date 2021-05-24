CREATE DATABASE  IF NOT EXISTS `pg_county_crime` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pg_county_crime`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: pg_county_crime
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `crime_list_timeframe`
--

DROP TABLE IF EXISTS `crime_list_timeframe`;
/*!50001 DROP VIEW IF EXISTS `crime_list_timeframe`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `crime_list_timeframe` AS SELECT 
 1 AS `crime_datetime`,
 1 AS `address`,
 1 AS `city`,
 1 AS `zipcode`,
 1 AS `district_name`,
 1 AS `crime_type_name`,
 1 AS `disposition`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `crime_roles`
--

DROP TABLE IF EXISTS `crime_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crime_roles` (
  `crime_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `crime_role_name` varchar(30) NOT NULL,
  `crime_role_description` varchar(75) NOT NULL,
  PRIMARY KEY (`crime_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_roles`
--

LOCK TABLES `crime_roles` WRITE;
/*!40000 ALTER TABLE `crime_roles` DISABLE KEYS */;
INSERT INTO `crime_roles` VALUES (1,'Victim','A person harmed, injured, or killed as a result of a incident'),(2,'Criminal','A person who has committed a crime'),(3,'Witness','A person who sees an event take place');
/*!40000 ALTER TABLE `crime_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime_types`
--

DROP TABLE IF EXISTS `crime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crime_types` (
  `crime_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `crime_type_name` varchar(20) NOT NULL,
  `crime_type_description` varchar(75) NOT NULL,
  PRIMARY KEY (`crime_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_types`
--

LOCK TABLES `crime_types` WRITE;
/*!40000 ALTER TABLE `crime_types` DISABLE KEYS */;
INSERT INTO `crime_types` VALUES (1,'Assault','Unlawful physical attack or threat of attack'),(2,'Battery','Intentional offensive or harmful touching of another person without consent'),(3,'Kidnapping','Taking of a person against his or her will'),(4,'Homicide','Killing of one human being by another'),(5,'Rape','Unwanted sexual intercourse accomplished by force or threat of force'),(6,'Larceny','Taking of someone’s property without consent, intent to permanently deprive'),(7,'Robbery','When someone takes something from you with violence or threats (public)'),(8,'Property Crime','Crimes committed on residential or commercial property'),(9,'Arson','Deliberately sets fire to someone\'s property to damage or injure people'),(10,'Break and Enter','Unlawful entry to commit felony or theft'),(11,'Drugs or Liquor','Production, distribution,use of certain controlled substances'),(12,'Hate Crime','Incident or crime against someone based on a part of their identity'),(13,'Sexual Assault','Carnal knowledge of an individual forcibly and against her or his will'),(14,'Child Abuse','Can include neglect as well as physical, emotional and sexual abuse'),(15,'Domestic Abuse','Negative behaviours over another within families or relationships'),(16,'Sexual Offense','Offenses against chastity, common decency, morals, and the like'),(17,'Theft','Taking/attempting to take anythinng of value from a person');
/*!40000 ALTER TABLE `crime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crimes`
--

DROP TABLE IF EXISTS `crimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crimes` (
  `crime_id` int(11) NOT NULL AUTO_INCREMENT,
  `crime_type_id` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  `disposition` varchar(75) NOT NULL,
  `crime_datetime` datetime NOT NULL,
  `district_id` int(11) NOT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `zipcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`crime_id`),
  KEY `fk_crimes_crime_types1_idx` (`crime_type_id`),
  KEY `fk_crimes_officers1_idx` (`officer_id`),
  KEY `fk_crimes_districts1_idx` (`district_id`),
  CONSTRAINT `fk_crimes_crime_types1` FOREIGN KEY (`crime_type_id`) REFERENCES `crime_types` (`crime_type_id`),
  CONSTRAINT `fk_crimes_districts1` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `fk_crimes_officers1` FOREIGN KEY (`officer_id`) REFERENCES `officers` (`officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crimes`
--

LOCK TABLES `crimes` WRITE;
/*!40000 ALTER TABLE `crimes` DISABLE KEYS */;
INSERT INTO `crimes` VALUES (1,1,1,'OPEN','2019-04-01 00:00:00',5,'8600 Block FULTON AVE','Glenarden',20706),(2,1,2,'CLOSED','2019-04-01 01:00:00',9,'2300 Block VIRGINIA AVE','Fort Washington',20744),(3,8,3,'CLOSED','2019-04-01 01:00:00',6,'12100 Block CENTRAL AVE WB','Mitchellville',20721),(4,10,4,'PENDING','2019-04-01 01:00:00',6,'12100 Block CENTRAL AVE','Mitchellville',20721),(5,10,5,'PENDING','2019-04-01 14:00:00',4,'1900 Block WETHERBOURNE CT','Bowie',20721),(6,1,6,'OPEN','2019-04-01 15:00:00',5,'6500 Block LANDOVER RD EB','Cheverly',20785),(7,11,7,'CLOSED','2019-04-01 22:00:00',5,'7500 Block LANDOVER RD EB','Hyattsville',20785),(8,1,8,'OPEN','2019-04-02 11:00:00',5,'7800 Block MICHELE DRIVE','Hyattsville',20785),(9,11,9,'CLOSED','2019-04-02 14:00:00',6,'100 Block CINDY LN','Capitol Heights',20743),(10,17,10,'CLOSED','2019-04-02 16:00:00',6,'10500 Block CAMPUS WAY','Upper Marlboro',20774),(11,11,11,'CLOSED','2019-04-02 23:00:00',5,'200 Block E MARLBORO AVE','Greater Landover',20785),(12,11,12,'CLOSED','2019-04-03 01:00:00',5,'KILMER ST & LANDOVER RD EB','Cheverly',20785),(13,1,13,'OPEN','2019-04-03 13:00:00',5,'2500 Block KENMOOR DR','Hyattsville',20785),(14,17,14,'CLOSED','2019-04-03 16:00:00',4,'9600 Block BYWARD BLVD','Bowie',20721),(15,17,15,'OPEN','2019-04-03 18:00:00',5,'1600 Block BRIGHTSEAT RD NB','Hyattsville',20785),(16,17,16,'CLOSED','2019-04-03 19:00:00',4,'11800 Block SHADYSTONE TER','Bowie',20721),(17,11,17,'OPEN','2019-04-03 20:00:00',5,'7600 Block BURNSIDE RD','Hyattsville',20785),(18,11,18,'CLOSED','2019-04-03 21:00:00',5,'7500 Block LANDOVER RD EB','Hyattsville',20785),(19,8,19,'CLOSED','2019-04-03 22:00:00',6,'9600 Block LOTTSFORD CT','Upper Marlboro',20774),(20,1,20,'CLOSED','2019-04-03 23:00:00',5,'7700 Block OXMAN RD','Hyattsville',20785),(21,8,21,'OPEN','2019-04-04 00:00:00',5,'100 Block BRIGHTSEAT RD SB','Hyattsville',20785),(22,17,22,'OPEN','2019-04-04 00:00:00',5,'100 Block BRIGHTSEAT RD SB','Hyattsville',20785),(23,10,23,'CLOSED','2019-04-04 05:00:00',5,'8500 Block FIELDSTONE WAY','Hyattsville',20785),(24,8,24,'PENDING','2019-04-04 05:00:00',5,'8500 Block FIELDSTONE WAY','Hyattsville',20785),(25,17,23,'CLOSED','2019-04-04 06:00:00',5,'7200 Block E KILMER ST','Hyattsville',20785),(26,1,22,'CLOSED','2019-04-04 07:00:00',6,'10200 Block PRINCE PL','Largo',20774),(27,1,20,'PENDING','2019-04-04 11:00:00',5,'6500 Block LANDOVER RD WB','Cheverly',20785),(28,11,18,'CLOSED','2019-04-04 11:00:00',5,'6500 Block LANDOVER RD WV','Cheverly',20785),(29,17,15,'OPEN','2019-04-04 14:00:00',6,'10600 Block CAMPUS WAY S','Upper Marlboro',20774),(30,17,13,'CLOSED','2019-04-04 20:00:00',6,'1 Block CABLE HOLLOW WAY','Largo',20774),(31,17,10,'PENDING','2019-04-04 21:00:00',6,'800 Block LARGO CENTER DR','Upper Marlboro',20774),(32,1,1,'CLOSED','2019-04-04 21:00:00',6,'800 Block LARGO CENTER DR','Upper Marlboro',20774),(33,17,2,'CLOSED','2019-04-05 00:00:00',6,'10400 Block CAMPUS WAY','Upper Marlboro',20774),(34,11,5,'CLOSED','2019-04-05 05:00:00',7,'ADDISON RD & BALTIC ST','Seat Pleasant',20743),(35,8,8,'OPEN','2019-04-05 08:00:00',5,'400 Block TAYSIDE WAY','Hyattsville',20785),(36,10,10,'OPEN','2019-04-05 08:00:00',5,'400 Block TAYSIDE WAY','Hyattsville',20785),(37,17,11,'CLOSED','2019-04-05 11:00:00',5,'700 Block STRETFORD WAY','Hyattsville',20785),(38,8,14,'PENDING','2019-04-05 11:00:00',5,'7600 Block LANDOVER RD WB','Hyattsville',20785),(39,8,12,'PENDING','2019-04-05 19:00:00',5,'7000 Block 71ST CT','Hyattsville',20785),(40,11,3,'CLOSED','2019-04-05 21:00:00',5,'1900 Block BELLE HAVEN DR NB','Hyattsville',20785);
/*!40000 ALTER TABLE `crimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `district_crime_count`
--

DROP TABLE IF EXISTS `district_crime_count`;
/*!50001 DROP VIEW IF EXISTS `district_crime_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `district_crime_count` AS SELECT 
 1 AS `district_name`,
 1 AS `crime_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(20) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'District_1'),(2,'District_2'),(3,'District_3'),(4,'District_4'),(5,'District_5'),(6,'District_6'),(7,'District_7'),(8,'District_8'),(9,'District_9');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `involvement`
--

DROP TABLE IF EXISTS `involvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `involvement` (
  `involvement_id` int(11) NOT NULL AUTO_INCREMENT,
  `crime_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `crime_role_id` int(11) NOT NULL,
  PRIMARY KEY (`involvement_id`),
  KEY `fk_involvement_crimes1_idx` (`crime_id`),
  KEY `fk_involvement_people1_idx` (`person_id`),
  KEY `fk_involvement_crime roles1_idx` (`crime_role_id`),
  CONSTRAINT `fk_involvement_crime roles1` FOREIGN KEY (`crime_role_id`) REFERENCES `crime_roles` (`crime_role_id`),
  CONSTRAINT `fk_involvement_crimes1` FOREIGN KEY (`crime_id`) REFERENCES `crimes` (`crime_id`),
  CONSTRAINT `fk_involvement_people1` FOREIGN KEY (`person_id`) REFERENCES `people` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `involvement`
--

LOCK TABLES `involvement` WRITE;
/*!40000 ALTER TABLE `involvement` DISABLE KEYS */;
INSERT INTO `involvement` VALUES (1,1,1,1),(2,2,2,2),(3,2,3,3),(4,3,1,1),(5,3,4,3),(6,4,5,1),(7,4,6,2),(8,5,7,1),(9,5,6,2),(10,6,5,1),(11,7,8,2),(12,7,4,3),(13,8,9,1),(14,9,8,2),(15,9,10,3),(16,9,3,3),(17,10,6,2),(18,10,11,2),(19,11,11,2),(20,11,4,3),(21,12,12,2),(22,12,6,2),(23,12,10,3),(24,13,13,1),(25,14,1,1),(26,14,2,2),(27,15,14,1),(28,16,15,3),(29,16,16,2),(30,17,3,3),(31,18,6,2),(32,18,10,3),(33,19,17,2),(34,19,18,2),(35,20,19,1),(36,20,18,2),(37,20,17,2),(38,21,19,1),(39,22,20,1),(40,23,22,2),(41,23,21,1),(42,24,21,1),(43,24,23,3),(44,25,21,1),(45,25,24,2),(46,26,25,1),(47,26,26,2),(48,27,25,1),(49,27,26,2),(50,28,27,2),(51,28,28,2),(52,29,13,1),(53,30,29,1),(54,30,30,2),(55,31,30,2),(56,31,31,3),(57,32,30,2),(58,32,31,3),(59,33,32,1),(60,33,33,2),(61,34,27,2),(62,35,34,1),(63,36,35,1),(64,37,36,1),(65,37,30,2),(66,38,37,3),(67,38,38,2),(68,39,39,1),(69,39,40,2),(70,40,28,2);
/*!40000 ALTER TABLE `involvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `officer_info`
--

DROP TABLE IF EXISTS `officer_info`;
/*!50001 DROP VIEW IF EXISTS `officer_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `officer_info` AS SELECT 
 1 AS `rank_name`,
 1 AS `name`,
 1 AS `age`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `officers` (
  `officer_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `race_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`officer_id`),
  KEY `fk_officers_races1_idx` (`race_id`),
  KEY `fk_officers_ranks1_idx` (`rank_id`),
  CONSTRAINT `fk_officers_races1` FOREIGN KEY (`race_id`) REFERENCES `races` (`race_id`),
  CONSTRAINT `fk_officers_ranks1` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
INSERT INTO `officers` VALUES (1,1,'Fabiola','Pellot',2,59,203,300),(2,2,'Jerald','Satter',1,26,164,180),(3,3,'Betsy','Gilpin',3,21,184,236),(4,4,'Shleby','Carleton',2,27,152,268),(5,5,'Donald','Abell',4,71,164,188),(6,6,'Iona','Loftin',1,70,169,181),(7,7,'Mira','Clerk',1,24,144,267),(8,8,'Luna','Hoeppner',5,19,189,248),(9,2,'Domenica','Arms',3,20,168,245),(10,4,'Elvis','Thongs',6,75,198,233),(11,6,'Presely','Nelson',2,48,204,236),(12,8,'Atira','White',3,43,147,178),(13,7,'Olamide','Yellow',6,33,180,169),(14,5,'Musu','Blu',2,20,182,236),(15,3,'Mobolaji','Hannah',1,59,219,278),(16,1,'Paige','Montana',5,41,159,279),(17,4,'Derick','Cyrus',4,25,220,136),(18,4,'Sammy','Miley',2,75,172,182),(19,2,'Sammi','Liam',1,22,174,163),(20,1,'Travis','Hemsworth',6,26,154,221),(21,6,'Kiehwan','Taylor',2,35,151,221),(22,7,'Tammi','Swift',2,45,209,160),(23,4,'Tammie','Miguel',5,48,172,168),(24,6,'Lewis','Pimentel',4,49,178,138);
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `people` (
  `person_id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `race_id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `fk_people_races1_idx` (`race_id`),
  CONSTRAINT `fk_people_races1` FOREIGN KEY (`race_id`) REFERENCES `races` (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Earleen','Strohl',1,45,'Female',189,239),(2,'Jonah','Tharp',2,48,'Male',173,180),(3,'Maris','Kinnard',3,75,'Male',155,228),(4,'Nicholas','Ohlinger',4,45,'Male',139,272),(5,'Kimber','Colosimo',5,71,'Female',183,291),(6,'Tomika','Losoya',6,51,'Female',131,275),(7,'Hyon','Mitchum',6,33,'Male',203,193),(8,'Jalessa','Holdman',5,21,'Female',164,142),(9,'Carola','Fluharty',4,64,'Female',184,238),(10,'Loriann','Damian',3,45,'Female',152,159),(11,'Regan','Chenier',2,63,'Male',164,299),(12,'Nettie','Casiano',1,25,'Male',169,283),(13,'Jennefer','Riggle',3,75,'Female',144,186),(14,'Marhta','Behrends',5,38,'Female',189,279),(15,'Willia','Togerson',4,35,'Female',168,191),(16,'Indrira','Whiteley',2,44,'Male',198,266),(17,'China','Perrett',6,19,'Female',204,284),(18,'Thi','Doles',5,22,'Male',147,283),(19,'Kristin','Rippel',1,40,'Female',180,256),(20,'Emilia','Fredericks',3,52,'Female',182,162),(21,'Silvia','Fonseca',6,50,'Male',219,200),(22,'Catherine','Redondo',2,65,'Female',159,133),(23,'Arlie','Heidel',1,31,'Female',220,281),(24,'Sigrid','Tarra',1,21,'Male',172,189),(25,'Josephine','Lathan',2,36,'Female',174,130),(26,'Petronila','Gagner',2,77,'Female',154,140),(27,'Nathanial','Kluesner',3,39,'Male',151,145),(28,'Phillip','Barba',3,52,'Male',209,200),(29,'Eloise','Poore',4,28,'Male',172,240),(30,'Santa','Gansa',4,44,'Male',178,250),(31,'Julieann','Bernier',5,73,'Female',146,180),(32,'Jamie','Rochon',5,66,'Female',179,160),(33,'Wendy','Hoban',6,62,'Female',220,145),(34,'Rufina','Lockett',6,40,'Female',170,204),(35,'Elena','Badger',4,61,'Female',171,194),(36,'Chu','Thurgood',5,53,'Male',154,192),(37,'Cherish','Acy',6,60,'Female',153,267),(38,'Dionna','Chadd',3,24,'Female',190,285),(39,'Reynalda','Gettings',4,32,'Female',191,160),(40,'Otilia','Obregon',5,47,'Female',152,139);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `people_below_avg_age`
--

DROP TABLE IF EXISTS `people_below_avg_age`;
/*!50001 DROP VIEW IF EXISTS `people_below_avg_age`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `people_below_avg_age` AS SELECT 
 1 AS `name`,
 1 AS `race_name`,
 1 AS `gender`,
 1 AS `age`,
 1 AS `height`,
 1 AS `weight`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `races` (
  `race_id` int(11) NOT NULL AUTO_INCREMENT,
  `race_name` varchar(20) NOT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'Caucasion'),(2,'African American'),(3,'Asian'),(4,'Pacific Islander'),(5,'Native American'),(6,'Mixed Race');
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ranks` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(20) NOT NULL,
  `rank_description` varchar(60) NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'Police Technician','Follow-up investigations, enforce parking and citations'),(2,'Police Officer','Call response, patrol areas, warrants, arrest suspects'),(3,'Police Corporal','Supervisor and watch commanders in small agencies'),(4,'Police Sergeant','Supervise and train, develop new policy'),(5,'Police Lieutenant','Provide plan of action for all below and detectives'),(6,'Police Captain','Train, monitor programs and budgets, enforce policies'),(7,'Deputy Police Chief','Administration of a bureau or division of police and staff'),(8,'Chief of Police','Oversee all operations of the department');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `victim_of_crimes`
--

DROP TABLE IF EXISTS `victim_of_crimes`;
/*!50001 DROP VIEW IF EXISTS `victim_of_crimes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `victim_of_crimes` AS SELECT 
 1 AS `name`,
 1 AS `crime_role_name`,
 1 AS `crime_type_name`,
 1 AS `crime_datetime`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `crime_list_timeframe`
--

/*!50001 DROP VIEW IF EXISTS `crime_list_timeframe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `crime_list_timeframe` AS select `crimes`.`crime_datetime` AS `crime_datetime`,`crimes`.`address` AS `address`,`crimes`.`city` AS `city`,`crimes`.`zipcode` AS `zipcode`,`districts`.`district_name` AS `district_name`,`crime_types`.`crime_type_name` AS `crime_type_name`,`crimes`.`disposition` AS `disposition` from ((`crimes` join `crime_types` on((`crimes`.`crime_type_id` = `crime_types`.`crime_type_id`))) join `districts` on((`crimes`.`district_id` = `districts`.`district_id`))) where ((`crimes`.`crime_datetime` > '2019-04-01 00:00:00') and (`crimes`.`crime_datetime` < '2019-04-03 00:00:00')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `district_crime_count`
--

/*!50001 DROP VIEW IF EXISTS `district_crime_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `district_crime_count` AS select `districts`.`district_name` AS `district_name`,count(`crimes`.`crime_id`) AS `crime_count` from (`crimes` join `districts` on((`crimes`.`district_id` = `districts`.`district_id`))) group by `districts`.`district_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `officer_info`
--

/*!50001 DROP VIEW IF EXISTS `officer_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `officer_info` AS select `ranks`.`rank_name` AS `rank_name`,concat(`officers`.`first_name`,' ',`officers`.`last_name`) AS `name`,`officers`.`age` AS `age` from (`officers` join `ranks` on((`ranks`.`rank_id` = `officers`.`rank_id`))) order by `officers`.`rank_id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `people_below_avg_age`
--

/*!50001 DROP VIEW IF EXISTS `people_below_avg_age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `people_below_avg_age` AS select concat(`people`.`last_name`,', ',`people`.`first_name`) AS `name`,`races`.`race_name` AS `race_name`,`people`.`gender` AS `gender`,`people`.`age` AS `age`,`people`.`height` AS `height`,`people`.`weight` AS `weight` from (`people` join `races` on((`races`.`race_id` = `people`.`race_id`))) where (`people`.`age` < (select avg(`people`.`age`) from `people`)) order by `people`.`age` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `victim_of_crimes`
--

/*!50001 DROP VIEW IF EXISTS `victim_of_crimes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `victim_of_crimes` AS select concat(`people`.`first_name`,' ',`people`.`last_name`) AS `name`,`crime_roles`.`crime_role_name` AS `crime_role_name`,`crime_types`.`crime_type_name` AS `crime_type_name`,`crimes`.`crime_datetime` AS `crime_datetime` from ((((`people` join `involvement` on((`people`.`person_id` = `involvement`.`person_id`))) join `crime_roles` on((`involvement`.`crime_role_id` = `crime_roles`.`crime_role_id`))) join `crimes` on((`involvement`.`crime_id` = `crimes`.`crime_id`))) join `crime_types` on((`crimes`.`crime_type_id` = `crime_types`.`crime_type_id`))) where (`crime_roles`.`crime_role_name` = 'Victim') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
