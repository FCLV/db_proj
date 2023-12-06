-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: railway
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cavern`
--

DROP TABLE IF EXISTS `cavern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cavern` (
  `Cavern Relic Sets` text,
  `CR_ID` int NOT NULL,
  `effect` text,
  `num` text,
  PRIMARY KEY (`CR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cavern`
--

LOCK TABLES `cavern` WRITE;
/*!40000 ALTER TABLE `cavern` DISABLE KEYS */;
INSERT INTO `cavern` VALUES ('Passerby of Wandering Cloud',101,'Outgoing Healing','10%'),('Musketeer of Wild Wheat',102,'ATK','12%'),('Knight of Purity Palace',103,'DEF','15%'),('Hunter of Glacial Forest',104,'Ice DMG','10%'),('Champion of Streetwise Boxing',105,'Break Effect','10%'),('Guard of Wuthering Snow',106,'DMG','minus 8%'),('Firesmith of Lava-Forging',107,'Fire DMG','10%'),('Genius of Brilliant Stars',108,'Quantum DMG','10%'),('Band of Sizzing Thunder',109,'Lightning DMG','10%'),('Eagle of Twilight Line',110,'Wind DMG','10%'),('Thief of Shooting Meteor',111,'Break Effect','16%'),('Wastelander of Banditry Desert',112,'Imaginary DMG','10%'),('Longevous Disciple',113,'Max HP','12%'),('Messenger Traversing Hackerspace',114,'SPD','6%'),('The Ashblazing Grand Duke',115,'follow-up attack DMG','20%'),('Prisoner in Deep Confinement',116,'ATK','12%');
/*!40000 ALTER TABLE `cavern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `Name` text,
  `Ch_ID` int NOT NULL,
  `Combat Type` text,
  `Path` text,
  `Atk_base` double DEFAULT NULL,
  `Def_base` double DEFAULT NULL,
  `HP_base` double DEFAULT NULL,
  `Spd_base` int DEFAULT NULL,
  `Htd_base` int DEFAULT NULL,
  `Nrg_max` int DEFAULT NULL,
  `Star_Num` int DEFAULT NULL,
  `Atk_base_80` double DEFAULT NULL,
  `Def_base_80` double DEFAULT NULL,
  `HP_base_80` double DEFAULT NULL,
  `Weight_Atk` int DEFAULT NULL,
  `Weight_Def` int DEFAULT NULL,
  `Weight_HP` int DEFAULT NULL,
  `Weight_Sum` int DEFAULT NULL,
  `Weight_Sum_addSpd` int DEFAULT NULL,
  `planet` text,
  `limited` int DEFAULT NULL,
  `version` text,
  `LC_RecoMain` int NOT NULL,
  `LC_RecoSub` int NOT NULL,
  `CR_ID` int NOT NULL,
  `Ornament_Reco` int NOT NULL,
  PRIMARY KEY (`Ch_ID`),
  KEY `fk1_idx` (`LC_RecoMain`),
  KEY `fk2_idx` (`LC_RecoSub`),
  KEY `fk3_idx` (`Ornament_Reco`),
  KEY `fk4_idx` (`CR_ID`),
  CONSTRAINT `fk1` FOREIGN KEY (`LC_RecoMain`) REFERENCES `lightcone` (`Lc_ID`),
  CONSTRAINT `fk2` FOREIGN KEY (`LC_RecoSub`) REFERENCES `lightcone` (`Lc_ID`),
  CONSTRAINT `fk3` FOREIGN KEY (`Ornament_Reco`) REFERENCES `planar` (`PO_ID`),
  CONSTRAINT `fk4` FOREIGN KEY (`CR_ID`) REFERENCES `cavern` (`CR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES ('March 7th',1001,'Ice','Preservation',69.6,78,144,101,150,120,4,511.56,573.3,1058.4,29,26,30,85,186,'The Astral Express',0,NULL,24002,24002,103,304),('Dan Heng',1002,'Wind','Hunt',74.4,54,120,110,75,100,4,546.84,396.9,882,31,18,25,74,184,'The Astral Express',0,NULL,23001,23012,110,306),('Himeko',1003,'Fire','The Erudition',102.96,59.4,142.56,96,75,120,5,756.756,436.59,1047.816,39,18,27,84,180,'The Astral Express',0,NULL,23010,23000,115,306),('Welt',1004,'Imaginary','Nihility',84.48,69.3,153.12,102,100,120,5,620.928,509.355,1125.432,32,21,29,82,184,'The Astral Express',0,NULL,23004,21001,112,303),('Kafka',1005,'Lightning','Nihility',92.4,66,147.84,100,100,120,5,679.14,485.1,1086.624,35,20,28,83,183,'Stellaron Hunters',1,'1.2',23006,21001,116,311),('Silver Wolf',1006,'Quantum','Nihility',87.12,62.7,142.56,107,100,110,5,640.332,460.845,1047.816,33,19,27,79,186,'Stellaron Hunters',1,'1.1',23007,23004,108,306),('Arlan',1008,'Lightning','Destruction',81.6,45,163.2,102,125,110,4,599.76,330.75,1199.52,34,15,34,83,185,'Herta Space Station',0,NULL,23002,24000,109,301),('Asta',1009,'Fire','Harmony',69.6,63,139.2,106,100,120,4,511.56,463.05,1023.12,29,21,29,79,185,'Herta Space Station',0,NULL,21004,23003,114,308),('Herta',1013,'Ice','The Erudition',79.2,54,129.6,100,75,110,4,582.12,396.9,952.56,33,18,27,78,178,'Herta Space Station',0,NULL,23010,23000,104,306),('Bronya',1101,'Wind','Harmony',79.2,72.6,168.96,99,100,120,5,582.12,533.61,1241.856,30,22,32,84,183,'Jarilo-VI',0,NULL,23003,21025,110,302),('Seele',1102,'Quantum','Hunt',87.12,49.5,126.72,115,75,120,5,640.332,363.825,931.392,33,15,24,72,187,'Jarilo-VI',1,'1',23001,23012,108,311),('Serval',1103,'Lightning','The Erudition',88.8,51,124.8,104,75,100,4,652.68,374.85,917.28,37,17,26,80,184,'Jarilo-VI',0,NULL,23012,23000,109,306),('Gepard',1104,'Ice','Preservation',73.92,89.1,190.08,92,150,100,5,543.312,654.885,1397.088,28,27,36,91,183,'Jarilo-VI',0,NULL,23005,24002,103,304),('Natasha',1105,'Physical','Abundance',64.8,69,158.4,98,100,90,4,476.28,507.15,1164.24,27,23,33,83,181,'Jarilo-VI',0,NULL,23013,21021,101,302),('Pela',1106,'Ice','Nihility',74.4,63,134.4,105,100,110,4,546.84,463.05,987.84,31,21,28,80,185,'Herta Space Station',0,NULL,23004,21035,104,303),('Clara',1107,'Physical','Destruction',100.32,66,168.96,90,125,110,5,737.352,485.1,1241.856,38,20,32,90,180,'Jarilo-VI',0,NULL,23002,24000,105,306),('Sampo',1108,'Wind','Nihility',84,54,139.2,102,100,120,4,617.4,396.9,1023.12,35,18,29,82,184,'Jarilo-VI',0,NULL,23004,21008,110,303),('Hook',1109,'Fire','Destruction',84,48,182.4,94,125,120,4,617.4,352.8,1340.64,35,16,38,89,183,'Jarilo-VI',0,NULL,24000,24000,107,306),('Lynx',1110,'Quantum','Abundance',67.2,75,144,100,100,100,4,493.92,551.25,1058.4,28,25,30,83,183,'Jarilo-VI',0,NULL,23013,21014,101,302),('Luka',1111,'Physical','Destruction',79.2,66,124.8,103,100,130,4,582.12,485.1,917.28,33,22,26,81,184,'Jarilo-VI',0,NULL,23006,23007,105,301),('Topaz & Numby',1112,'Fire','Hunt',84.48,56.1,126.72,110,75,130,5,620.928,412.335,931.392,32,17,24,73,183,'Cosmic',1,'1.4',23016,21010,115,311),('Qingque',1201,'Quantum','The Erudition',88.8,60,139.2,98,75,140,4,652.68,441,1023.12,37,20,29,86,184,'Xianzhou',0,NULL,23010,21034,108,301),('Tingyun',1202,'Lightning','Harmony',72,54,115.2,112,100,130,4,529.2,396.9,846.72,30,18,24,72,184,'Xianzhou',0,NULL,23003,21032,114,310),('Luocha',1203,'Imaginary','Abundance',102.96,49.5,174.24,101,100,100,5,756.756,363.825,1280.664,39,15,33,87,188,'Xianzhou',1,'1.1',23008,21014,101,302),('Jing Yuan',1204,'Lightning','The Erudition',95.04,66,158.4,99,75,130,5,698.544,485.1,1164.24,36,20,30,86,185,'Xianzhou',1,'1',23010,21034,115,306),('Blade',1205,'Wind','Destruction',73.92,66,184.8,97,125,130,5,543.312,485.1,1358.28,28,20,35,83,180,'Stellaron Hunters',1,'1.2',23009,21012,113,309),('Sushang',1206,'Physical','Hunt',76.8,57,124.8,107,75,120,4,564.48,418.95,917.28,32,19,26,77,184,'Xianzhou',0,NULL,23001,24001,105,305),('Yukong',1207,'Imaginary','Harmony',81.6,51,124.8,107,100,130,4,599.76,374.85,917.28,34,17,26,77,184,'Xianzhou',0,NULL,23003,21025,106,308),('Fu Xuan',1208,'Quantum','Preservation',63.36,82.5,200.64,100,150,135,5,465.696,606.375,1474.704,24,25,38,87,187,'Xianzhou',1,'1.3',23011,24002,113,310),('Yanqing',1209,'Ice','Hunt',92.4,56.1,121.44,109,75,140,5,679.14,412.335,892.584,35,17,23,75,184,'Xianzhou',0,NULL,23012,23012,104,306),('Guinaifen',1210,'Fire','Nihility',79.2,60,120,106,100,120,4,582.12,441,882,33,20,25,78,184,'Xianzhou',0,NULL,23004,23007,107,302),('Bailu',1211,'Lightning','Abundance',76.56,66,179.52,98,100,100,5,562.716,485.1,1319.472,29,20,34,83,181,'Xianzhou',0,NULL,23013,21000,101,302),('Jingliu',1212,'Ice','Destruction',92.4,66,195.36,96,125,140,5,679.14,485.1,1435.896,35,20,37,92,188,'Xianzhou',1,'1.4',23014,24000,108,309),('Dan Heng·Imbibitor Lunae',1213,'Imaginary','Destruction',95.04,49.5,168.96,102,125,140,5,698.544,363.825,1241.856,36,15,32,83,185,'Xianzhou',1,'1.3',23015,24000,102,309),('Huohuo',1217,'Wind','Abundance',81.84,69.3,184.8,98,100,140,5,601.524,509.355,1358.28,31,21,35,87,185,'Xianzhou',1,'1.5',23017,23013,101,302),('Trailblazer·Destruction',8001,'Physical','Destruction',84.48,62.7,163.68,100,125,120,5,620.928,460.845,1203.048,32,19,31,82,182,'The Astral Express',0,NULL,23002,24000,105,301),('Trailblazer·Preservation',8003,'Fire','Preservation',81.84,82.5,168.96,95,150,120,5,601.524,606.375,1241.856,31,25,32,88,183,'The Astral Express',0,NULL,23005,24002,103,304);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lightcone`
--

DROP TABLE IF EXISTS `lightcone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lightcone` (
  `Name` text,
  `Lc_ID` int NOT NULL,
  `HP_base` double DEFAULT NULL,
  `Atk_base` double DEFAULT NULL,
  `Def_base` int DEFAULT NULL,
  `HP_base_80` double DEFAULT NULL,
  `Atk_base_80` double DEFAULT NULL,
  `Def_base_80` double DEFAULT NULL,
  `Weight_HP` int DEFAULT NULL,
  `Weight_Atk` int DEFAULT NULL,
  `Weight_Def` int DEFAULT NULL,
  `Weight_Sum` int DEFAULT NULL,
  `Star_Num` int DEFAULT NULL,
  `Path` text,
  `Ch_ID` bigint DEFAULT NULL,
  `limited` int DEFAULT NULL,
  `version` text,
  PRIMARY KEY (`Lc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lightcone`
--

LOCK TABLES `lightcone` WRITE;
/*!40000 ALTER TABLE `lightcone` DISABLE KEYS */;
INSERT INTO `lightcone` VALUES ('Arrows',20000,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Hunt',NULL,0,NULL),('Cornucopia',20001,43.2,12,12,952.56,264.6,264.6,9,5,4,18,3,'Abundance',NULL,0,NULL),('Collapsing Sky',20002,38.4,16.8,9,846.72,370.44,198.45,8,7,3,18,3,'Destruction',NULL,0,NULL),('Amber',20003,38.4,12,15,846.72,264.6,330.75,8,5,5,18,3,'Preservation',NULL,0,NULL),('Void',20004,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Nihility',NULL,0,NULL),('Chorus',20005,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Harmony',NULL,0,NULL),('Data Bank',20006,33.6,16.8,12,740.88,370.44,264.6,7,7,4,18,3,'The Erudition',NULL,0,NULL),('Darting Arrow',20007,33.6,16.8,12,740.88,370.44,264.6,7,7,4,18,3,'Hunt',NULL,0,NULL),('Fine Fruit',20008,43.2,14.4,9,952.56,317.52,198.45,9,6,3,18,3,'Abundance',NULL,0,NULL),('Shattered Home',20009,38.4,16.8,9,846.72,370.44,198.45,8,7,3,18,3,'Destruction',NULL,0,NULL),('Defense',20010,43.2,12,12,952.56,264.6,264.6,9,5,4,18,3,'Preservation',NULL,0,NULL),('Loop',20011,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Nihility',NULL,0,NULL),('Meshing Cogs',20012,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Harmony',NULL,0,NULL),('Passkey',20013,33.6,16.8,12,740.88,370.44,264.6,7,7,4,18,3,'The Erudition',NULL,0,NULL),('Adverarial',20014,33.6,16.8,12,740.88,370.44,264.6,7,7,4,18,3,'Hunt',NULL,0,NULL),('Multiplication',20015,43.2,14.4,9,952.56,317.52,198.45,9,6,3,18,3,'Abundance',NULL,0,NULL),('Mutual Demise',20016,38.4,16.8,9,846.72,370.44,198.45,8,7,3,18,3,'Destruction',NULL,0,NULL),('Pioneering',20017,43.2,12,12,952.56,264.6,264.6,9,5,4,18,3,'Preservation',NULL,0,NULL),('Hidden Shadow',20018,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Nihility',NULL,0,NULL),('Mediation',20019,38.4,14.4,12,846.72,317.52,264.6,8,6,4,18,3,'Harmony',NULL,0,NULL),('Sagacity',20020,33.6,16.8,12,740.88,370.44,264.6,7,7,4,18,3,'The Erudition',NULL,0,NULL),('Post-Op Coversation',21000,48,19.2,15,1058.4,423.36,330.75,10,8,5,23,4,'Abundance',1105,0,NULL),('Good Night and Sleep Well',21001,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Nihility',1106,0,NULL),('Day One of My New Life',21002,43.2,16.8,21,952.56,370.44,463.05,9,7,7,23,4,'Preservation',1001,0,NULL),('Only Silence Remains',21003,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Hunt',1002,0,NULL),('Memories of the Past',21004,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Harmony',1101,0,NULL),('The Moles Welcome You',21005,48,21.6,12,1058.4,476.28,264.6,10,9,4,23,4,'Destruction',1109,0,NULL),('The Birth of Self',21006,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'The Erudition',1013,0,NULL),('Shared Feeling',21007,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Abundance',1107,0,NULL),('Eyes of the Prey',21008,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Nihility',1108,0,NULL),('Landau’s Choice',21009,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Preservation',1104,0,NULL),('Swordplay',21010,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Hunt',1206,0,NULL),('Planetary Rendezvous',21011,48,19.2,15,1058.4,423.36,330.75,10,8,5,23,4,'Harmony',1009,0,NULL),('A secret Vow',21012,48,21.6,12,1058.4,476.28,264.6,10,9,4,23,4,'Destruction',1008,0,NULL),('Make the World Clamor',21013,38.4,21.6,18,846.72,476.28,396.9,8,9,6,23,4,'The Erudition',1103,0,NULL),('Perfect Timing',21014,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Abundance',1204,1,NULL),('Resolution Shines As Pearls of Sweat',21015,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Nihility',1111,0,NULL),('Trend of the Universal Market',21016,48,16.8,18,1058.4,370.44,396.9,10,7,6,23,4,'Preservation',1112,0,NULL),('Subscribe for More!',21017,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Hunt',1210,0,NULL),('Dance! Dance! Dance!',21018,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Harmony',1109,0,NULL),('Under the Blue Sky',21019,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Destruction',1205,0,NULL),('Quid Pro Quo',21021,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Abundance',1211,0,NULL),('Fermata',21022,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Nihility',1005,1,NULL),('We Are Wildfire',21023,33.6,21.6,21,740.88,476.28,463.05,7,9,7,23,4,'Preservation',1102,1,NULL),('River Flows in Spring',21024,38.4,21.6,18,846.72,476.28,396.9,8,9,6,23,4,'Hunt',1209,0,NULL),('Past and Future',21025,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Harmony',1207,0,NULL),('Woof! Walk Time!',21026,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Destruction',NULL,0,NULL),('The Seriousness of Breakfast',21027,38.4,21.6,18,846.72,476.28,396.9,8,9,6,23,4,'The Erudition',NULL,0,NULL),('Warmth Shortens Cold Nights',21028,48,16.8,18,1058.4,370.44,396.9,10,7,6,23,4,'Abundance',1106,0,NULL),('We Will Meet Again',21029,38.4,24,15,846.72,529.2,330.75,8,10,5,23,4,'Nihility',1006,1,NULL),('This Is Me!',21030,38.4,16.8,24,846.72,370.44,529.2,8,7,8,23,4,'Preservation',1001,0,NULL),('Return to Darkness',21031,38.4,24,15,846.72,529.2,330.75,8,10,5,23,4,'Hunt',1205,0,NULL),('Carve the Moon, Weave the Clouds',21032,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Harmony',1206,0,NULL),('Nowhere to Run',21033,43.2,24,12,952.56,529.2,264.6,9,10,4,23,4,'Destruction',1205,1,NULL),('Today Is Another Peaceful Day',21034,38.4,24,15,846.72,529.2,330.75,8,10,5,23,4,'The Erudition',1201,0,NULL),('Before the Tutorial Mission Starts',21035,43.2,21.6,15,952.56,476.28,330.75,9,9,5,23,4,'Nihility',1006,1,NULL),('Hey, Over Here',21036,43.2,19.2,18,952.56,423.36,396.9,9,8,6,23,4,'Abundance',1210,0,NULL),('Night on the Milky Way',23000,52.8,26.4,18,1164.24,582.12,396.9,11,11,6,28,5,'The Erudition',1003,0,NULL),('In the Night',23001,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'Hunt',1102,1,'1'),('Something Irreplaceable',23002,52.8,26.4,18,1164.24,582.12,396.9,11,11,6,28,5,'Destruction',1107,0,NULL),('But the Battle Isn’t Over',23003,52.8,24,21,1164.24,529.2,463.05,11,10,7,28,5,'Harmony',1101,0,NULL),('In the Name of the World',23004,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'Nihility',1004,0,NULL),('Moment of Victory',23005,48,21.6,27,1058.4,476.28,595.35,10,9,9,28,5,'Preservation',1104,0,NULL),('Patience Is All You Need',23006,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'Nihility',1005,1,'1.2'),('Incessant Rain',23007,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'Nihility',1006,1,'1.1'),('Echoes of the Coffin',23008,52.8,26.4,18,1164.24,582.12,396.9,11,11,6,28,5,'Abundance',1203,1,'1.1'),('The Unreachable Side',23009,57.6,26.4,15,1270.08,582.12,330.75,12,11,5,28,5,'Destruction',1205,1,'1.2'),('Before Dawn',23010,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'The Erudition',1204,1,'1'),('She Already Shut Her Eyes',23011,57.6,19.2,24,1270.08,423.36,529.2,12,8,8,28,5,'Preservation',1208,1,'1.3'),('Sleep Like the Dead',23012,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'Hunt',1209,0,NULL),('Time Waits for No One',23013,57.6,21.6,21,1270.08,476.28,463.05,12,9,7,28,5,'Abundance',1211,0,NULL),('I Shall Be My Own Sword',23014,52.8,26.4,18,1164.24,582.12,396.9,11,11,6,28,5,'Destruction',1212,1,'1.4'),('Brighter Than the Sun',23015,48,28.8,18,1058.4,635.04,396.9,10,12,6,28,5,'Destruction',1213,1,'1.3'),('Worrisome, Blissful',23016,48,26.4,21,1058.4,582.12,463.05,10,11,7,28,5,'Hunt',1112,1,'1.4'),('Night of Fright',23017,52.8,21.6,24,1164.24,476.28,529.2,11,9,8,28,5,'Abundance',1217,1,'1.5'),('On the Fall of an Aeon',24000,48,24,18,1058.4,529.2,396.9,10,10,6,26,5,'Destruction',NULL,0,NULL),('Cruising the Stellar Sea',24001,43.2,24,21,952.56,529.2,463.05,9,10,7,26,5,'Hunt',NULL,0,NULL),('Texture of Memories',24002,48,19.2,24,1058.4,423.36,529.2,10,8,8,26,5,'Preservation',NULL,0,NULL),('Solitary Healing',24003,48,24,18,1058.4,529.2,396.9,10,10,6,26,5,'Nihility',NULL,0,NULL);
/*!40000 ALTER TABLE `lightcone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lightcone_skill`
--

DROP TABLE IF EXISTS `lightcone_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lightcone_skill` (
  `Lc_ID` int NOT NULL,
  `name` text,
  `effect_id` int NOT NULL,
  `skill_name` text,
  `effect` text,
  `linear` text,
  `Lv1` double DEFAULT NULL,
  `Lv2` double DEFAULT NULL,
  `Lv3` double DEFAULT NULL,
  `Lv4` double DEFAULT NULL,
  `Lv5` double DEFAULT NULL,
  `Path` text,
  `Star_Num` double DEFAULT NULL,
  PRIMARY KEY (`Lc_ID`,`effect_id`),
  CONSTRAINT `fk5` FOREIGN KEY (`Lc_ID`) REFERENCES `lightcone` (`Lc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lightcone_skill`
--

LOCK TABLES `lightcone_skill` WRITE;
/*!40000 ALTER TABLE `lightcone_skill` DISABLE KEYS */;
INSERT INTO `lightcone_skill` VALUES (20000,'Arrows',1,'Crisis','Critical Rate Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Hunt',3),(20000,'Arrows',2,'Crisis','Duration in Rounds','Non-growth',3,3,3,3,3,'Hunt',3),(20001,'Cornucopia',1,'Prosperity','Skill and Ultimate Healing Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Abundance',3),(20002,'Collapsing Sky',1,'Havoc','Basic Attack and Skill Damage Increase','Normal 2',0.2,0.25,0.3,0.35,0.4,'Destruction',3),(20003,'Amber',1,'Stasis','Defense Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Preservation',3),(20003,'Amber',2,'Stasis','Percentage Health Trigger','Non-growth',0.5,0.5,0.5,0.5,0.5,'Preservation',3),(20003,'Amber',3,'Stasis','Extra Defense Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Preservation',3),(20004,'Void',1,'Fallen','Effect Hit Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Nihility',3),(20004,'Void',2,'Fallen','Duration in Rounds','Non-growth',3,3,3,3,3,'Nihility',3),(20005,'Chorus',1,'Concerted','Attack Bonus','Diminishing 1',0.08,0.09,0.1,0.11,0.12,'Harmony',3),(20006,'Data Bank',1,'Learned','Ultimate Damage Increase','Normal 2',0.28,0.35,0.42,0.49,0.56,'The Erudition',3),(20007,'Darting Arrow',1,'War Cry','Attack Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Hunt',3),(20007,'Darting Arrow',2,'War Cry','Duration in Rounds','Non-growth',3,3,3,3,3,'Hunt',3),(20008,'Fine Fruit',1,'Savor','Base Energy Recovery','Normal 2',6,7.5,9,10.5,12,'Abundance',3),(20009,'Shattered Home',1,'Eradication','Percentage Health Trigger','Non-growth',0.5,0.5,0.5,0.5,0.5,'Destruction',3),(20009,'Shattered Home',2,'Eradication','Damage Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Destruction',3),(20010,'Defense',1,'Revitalization','Health Recovery Amount','Normal 1',0.18,0.21,0.24,0.27,0.3,'Preservation',3),(20011,'Loop',1,'Pursuit','Damage Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Nihility',3),(20012,'Meshing Cogs',1,'Fleet Triumph','Extra Base Energy Recovery','Normal 2',4,5,6,7,8,'Harmony',3),(20013,'Passkey',1,'Epiphany','Base Energy Recovery','Diminishing 1',8,9,10,11,12,'The Erudition',3),(20014,'Adversarial',1,'Alliance','Speed Bonus','Special 1',0.1,0.12,0.14,0.16,0.18,'Hunt',3),(20014,'Adversarial',2,'Alliance','Duration in Rounds','Non-growth',2,2,2,2,2,'Hunt',3),(20015,'Multiplication',1,'Denizens of Abundance','Action Advance','Normal 1',0.12,0.14,0.16,0.18,0.2,'Abundance',3),(20016,'Mutual Demise',1,'Legion','Percentage Health Trigger','Non-growth',0.8,0.8,0.8,0.8,0.8,'Destruction',3),(20016,'Mutual Demise',2,'Legion','Critical Rate Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Destruction',3),(20017,'Pioneering',1,'IPC','Health Recovery Amount','Normal 1',0.12,0.14,0.16,0.18,0.2,'Preservation',3),(20019,'Mediation',1,'Family','Speed Bonus','Normal 1',12,14,16,18,20,'Harmony',3),(20019,'Mediation',2,'Family','Duration in Rounds','Non-growth',1,1,1,1,1,'Harmony',3),(20020,'Sagacity',1,'Genius','Attack Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'The Erudition',3),(20020,'Sagacity',2,'Genius','Duration in Rounds','Non-growth',2,2,2,2,2,'The Erudition',3),(21000,'Post-Op Conversation',1,'Mutual Healing','Energy Recovery Efficiency Bonus','Normal 2',0.08,0.1,0.12,0.14,0.16,'Abundance',4),(21000,'Post-Op Conversation',2,'Mutual Healing','Ultimate Healing Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Abundance',4),(21001,'Good Night and Sleep Well',1,'Toiler','Damage Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Nihility',4),(21001,'Good Night and Sleep Well',2,'Toiler','Maximum Stack Count','Non-growth',3,3,3,3,3,'Nihility',4),(21002,'Day One of My New Life',1,'At This Very Moment','Defense Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Preservation',4),(21002,'Day One of My New Life',2,'At This Very Moment','All Attribute Resistance Bonus','Diminishing 1',0.08,0.09,0.1,0.11,0.12,'Preservation',4),(21003,'Only Silence Remains',1,'Record','Attack Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Hunt',4),(21003,'Only Silence Remains',2,'Record','Critical Rate Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Hunt',4),(21004,'Memories of the Past',1,'Old Photo','Break Bonus','Normal 2',0.28,0.35,0.42,0.49,0.56,'Harmony',4),(21004,'Memories of the Past',2,'Old Photo','Extra Base Energy Recovery','Normal 2',4,5,6,7,8,'Harmony',4),(21005,'The Moles Welcome You',1,'Fantastic Adventure','Attack Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Destruction',4),(21006,'The Birth of Self',1,'The Maiden in the Painting','Damage Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'The Erudition',4),(21006,'The Birth of Self',2,'The Maiden in the Painting','Percentage Health Trigger','Non-growth',0.5,0.5,0.5,0.5,0.5,'The Erudition',4),(21006,'The Birth of Self',3,'The Maiden in the Painting','Extra Damage Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'The Erudition',4),(21007,'Shared Feeling',1,'Cure and Repair','Healing Bonus','Normal 2',0.1,0.125,0.15,0.175,0.2,'Abundance',4),(21007,'Shared Feeling',2,'Cure and Repair','Base Energy Recovery','Normal 2',2,2.5,3,3.5,4,'Abundance',4),(21008,'Eyes of the Prey',1,'Self-Confidence','Effect Hit Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Nihility',4),(21008,'Eyes of the Prey',2,'Self-Confidence','Damage over Time Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Nihility',4),(21009,'Landau\'s Choice',1,'Time Fleets Away','Aggro Bonus','Non-growth',2,2,2,2,2,'Preservation',4),(21009,'Landau\'s Choice',2,'Time Fleets Away','Damage Reduction','Diminishing 1',0.16,0.18,0.2,0.22,0.24,'Preservation',4),(21010,'Swordplay',1,'Answers of Their Own','Damage Bonus per Stack','Normal 2',0.08,0.1,0.12,0.14,0.16,'Hunt',4),(21010,'Swordplay',2,'Answers of Their Own','Maximum Stack Count','Non-growth',5,5,5,5,5,'Hunt',4),(21011,'Planetary Rendezvous',1,'Departure','Damage Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Harmony',4),(21012,'A Secret Vow',1,'Spare No Effort','Damage Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Destruction',4),(21012,'A Secret Vow',2,'Spare No Effort','Extra Damage Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Destruction',4),(21013,'Make the World Clamor',1,'The Power of Sound','Base Energy Recovery','Special 2',20,23,26,29,32,'The Erudition',4),(21013,'Make the World Clamor',2,'The Power of Sound','Ultimate Damage Increase','Normal 2',0.32,0.4,0.48,0.56,0.64,'The Erudition',4),(21014,'Perfect Timing',1,'Refraction of Sightline','Effect Resistance Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Abundance',4),(21014,'Perfect Timing',2,'Refraction of Sightline','Bonus Healing Based on Effect Resistance','Diminishing 4',0.33,0.36,0.39,0.42,0.45,'Abundance',4),(21014,'Perfect Timing',3,'Refraction of Sightline','Maximum Healing Bonus','Special 1',0.15,0.18,0.21,0.24,0.27,'Abundance',4),(21015,'Resolution Shines As Pearls of Sweat',1,'Glance Back','Base Probability','Normal 1',0.6,0.7,0.8,0.9,1,'Nihility',4),(21015,'Resolution Shines As Pearls of Sweat',2,'Glance Back','Defense Reduction','Diminishing 2',0.12,0.13,0.14,0.15,0.16,'Nihility',4),(21015,'Resolution Shines As Pearls of Sweat',3,'Glance Back','Duration in Rounds','Non-growth',1,1,1,1,1,'Nihility',4),(21016,'Trend of the Universal Market',1,'A New Round of Shuffling','Defense Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Preservation',4),(21016,'Trend of the Universal Market',2,'A New Round of Shuffling','Base Probability','Diminishing 3',1,1.5,1.1,1.15,1.2,'Preservation',4),(21016,'Trend of the Universal Market',3,'A New Round of Shuffling','Damage over Time Multiplier','Normal 2',0.4,0.5,0.6,0.7,0.8,'Preservation',4),(21016,'Trend of the Universal Market',4,'A New Round of Shuffling','Duration in Rounds','Non-growth',2,2,2,2,2,'Preservation',4),(21017,'Subscribe for More!',1,'Like Before You Leave!','Damage Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Hunt',4),(21017,'Subscribe for More!',2,'Like Before You Leave!','Extra Damage Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Hunt',4),(21018,'Dance! Dance! Dance!',1,'Cannot Stop It!','Action Advance','Diminishing 1',0.16,0.18,0.2,0.22,0.24,'Harmony',4),(21019,'Under the Blue Sky',1,'Rye Under the Sun','Attack Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Destruction',4),(21019,'Under the Blue Sky',2,'Rye Under the Sun','Critical Rate Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Destruction',4),(21019,'Under the Blue Sky',3,'Rye Under the Sun','Duration in Rounds','Non-growth',3,3,3,3,3,'Destruction',4),(21021,'Quid Pro Quo',1,'Enjoy With Rapture','Percentage Energy Trigger','Non-growth',0.5,0.5,0.5,0.5,0.5,'Abundance',4),(21021,'Quid Pro Quo',2,'Enjoy With Rapture','Base Energy Recovery','Normal 2',8,10,12,14,16,'Abundance',4),(21022,'Fermata',1,'Semibreve Rest','Break Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Nihility',4),(21022,'Fermata',2,'Semibreve Rest','Damage Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Nihility',4),(21023,'We Are Wildfire',1,'Teary-Eyed','Damage Reduction','Normal 2',0.08,0.1,0.12,0.14,0.16,'Preservation',4),(21023,'We Are Wildfire',2,'Teary-Eyed','Duration in Rounds','Non-growth',5,5,5,5,5,'Preservation',4),(21023,'We Are Wildfire',3,'Teary-Eyed','Health Recovery Amount','Normal 1',0.3,0.35,0.4,0.45,0.5,'Preservation',4),(21024,'River Flows in Spring',1,'Stave Off the Lingering Cold','Speed Bonus','Normal 2',0.08,0.1,0.12,0.14,0.16,'Hunt',4),(21024,'River Flows in Spring',2,'Stave Off the Lingering Cold','Damage Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Hunt',4),(21025,'Past and Future',1,'Kites From the Past','Damage Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Harmony',4),(21025,'Past and Future',2,'Kites From the Past','Duration in Rounds','Non-growth',1,1,1,1,1,'Harmony',4),(21026,'Woof! Walk Time!',1,'Run!','Attack Bonus','Normal 2',0.1,0.125,0.15,0.175,0.2,'Destruction',4),(21026,'Woof! Walk Time!',2,'Run!','Damage Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Destruction',4),(21027,'The Seriousness of Breakfast',1,'Get Ready','Damage Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'The Erudition',4),(21027,'The Seriousness of Breakfast',2,'Get Ready','Attack Bonus','Normal 2',0.04,0.05,0.06,0.07,0.08,'The Erudition',4),(21027,'The Seriousness of Breakfast',3,'Get Ready','Maximum Stack Count','Non-growth',3,3,3,3,3,'The Erudition',4),(21028,'Warmth Shortens Cold Nights',1,'Tiny Light','Health Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Abundance',4),(21028,'Warmth Shortens Cold Nights',2,'Tiny Light','Health Recovery Amount','Normal 2',0.02,0.025,0.03,0.035,0.04,'Abundance',4),(21029,'We Will Meet Again',1,'A Discourse in Arms','Additional Damage Multiplier','Normal 2',0.48,0.6,0.72,0.84,0.96,'Nihility',4),(21030,'This Is Me!',1,'New Chapter','Defense Bonus','Normal 2',0.16,0.2,0.24,0.28,0.32,'Preservation',4),(21030,'This Is Me!',2,'New Chapter','Ultimate Extra Defense Multiplier','Normal 2',0.6,0.75,0.9,1.05,1.2,'Preservation',4),(21031,'Return to Darkness',1,'Raging Waves','Critical Rate Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Hunt',4),(21031,'Return to Darkness',2,'Raging Waves','Fixed Probability of Buff Removal','Normal 2',0.16,0.2,0.24,0.28,0.32,'Hunt',4),(21032,'Carve the Moon, Weave the Clouds',1,'Secret','Attack Bonus','Normal 2',0.1,0.125,0.15,0.175,0.2,'Harmony',4),(21032,'Carve the Moon, Weave the Clouds',2,'Secret','Critical Damage Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Harmony',4),(21032,'Carve the Moon, Weave the Clouds',3,'Secret','Energy Recovery Efficiency Bonus','Normal 2',0.06,0.075,0.09,0.105,0.12,'Harmony',4),(21033,'Nowhere to Run',1,'Desperate Times','Attack Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Destruction',4),(21033,'Nowhere to Run',2,'Desperate Times','Health Recovery Amount','Normal 2',0.12,0.15,0.18,0.21,0.24,'Destruction',4),(21034,'Today Is Another Peaceful Day',1,'A Storm Is Coming','Energy Damage Bonus','Normal 2',0,0.0025,0.003,0.0035,0.004,'The Erudition',4),(21034,'Today Is Another Peaceful Day',2,'A Storm Is Coming','Maximum Energy Contribution','Non-growth',160,160,160,160,160,'The Erudition',4),(21035,'Before the Tutorial Mission Starts',1,'Quick on the Draw','Effect Hit Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Nihility',4),(21035,'Before the Tutorial Mission Starts',2,'Quick on the Draw','Base Energy Recovery','Normal 2',4,5,6,7,8,'Nihility',4),(21036,'Hey, Over Here',1,'I\'m Not Afraid!','Health Bonus','Diminishing 1',0.08,0.09,0.1,0.11,0.12,'Abundance',4),(21036,'Hey, Over Here',2,'I\'m Not Afraid!','Healing Bonus on Skill Activation','Special 4',0.16,0.19,0.22,0.25,0.28,'Abundance',4),(21036,'Hey, Over Here',3,'I\'m Not Afraid!','Duration in Rounds','Non-growth',2,2,2,2,2,'Abundance',4),(23000,'Night on the Milky Way',1,'Meteor Swarm','Attack Bonus','Normal 1',0.09,0.105,0.12,0.135,0.15,'The Erudition',5),(23000,'Night on the Milky Way',2,'Meteor Swarm','Damage Bonus','Normal 1',0.3,0.35,0.4,0.45,0.5,'The Erudition',5),(23001,'In the Night',1,'Flowers and Butterflies','Critical Rate Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Hunt',5),(23001,'In the Night',2,'Flowers and Butterflies','Additional Speed per Stack','Non-growth',10,10,10,10,10,'Hunt',5),(23001,'In the Night',3,'Flowers and Butterflies','Basic Attack and Skill Damage Increase','Normal 1',0.06,0.07,0.08,0.09,0.1,'Hunt',5),(23001,'In the Night',4,'Flowers and Butterflies','Ultimate Critical Damage Bonus','Normal 1',0.12,0.14,0.16,0.18,0.2,'Hunt',5),(23001,'In the Night',5,'Flowers and Butterflies','Maximum Stack Count','Non-growth',6,6,6,6,6,'Hunt',5),(23002,'Something Irreplaceable',1,'Kinship','Attack Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Destruction',5),(23002,'Something Irreplaceable',2,'Kinship','Health Recovery Amount','Diminishing 1',0.08,0.09,0.1,0.11,0.12,'Destruction',5),(23002,'Something Irreplaceable',3,'Kinship','Damage Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Destruction',5),(23003,'But the Battle Isn\'t Over',1,'Heir','Energy Recovery Efficiency','Special 1',0.1,0.12,0.14,0.16,0.18,'Harmony',5),(23003,'But the Battle Isn\'t Over',2,'Heir','Damage Bonus','Normal 1',0.3,0.35,0.4,0.45,0.5,'Harmony',5),(23003,'But the Battle Isn\'t Over',3,'Heir','Duration in Rounds','Non-growth',1,1,1,1,1,'Harmony',5),(23004,'In the Name of the World',1,'Inheritor','Damage Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Nihility',5),(23004,'In the Name of the World',2,'Inheritor','Effect Hit Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Nihility',5),(23004,'In the Name of the World',3,'Inheritor','Attack Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Nihility',5),(23005,'Moment of Victory',1,'Verdict','Defense Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Preservation',5),(23005,'Moment of Victory',2,'Verdict','Effect Hit Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Preservation',5),(23005,'Moment of Victory',3,'Verdict','Extra Defense Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Preservation',5),(23005,'Moment of Victory',4,'Verdict','Aggro Bonus','Non-growth',2,2,2,2,2,'Preservation',5),(23006,'Patience Is All You Need',1,'Spider Web','Damage Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Nihility',5),(23006,'Patience Is All You Need',2,'Spider Web','Speed Bonus','Normal 1',0.05,0.056,0.064,0.072,0.08,'Nihility',5),(23006,'Patience Is All You Need',3,'Spider Web','Maximum Stack Count','Non-growth',3,3,3,3,3,'Nihility',5),(23006,'Patience Is All You Need',4,'Spider Web','Base Probability','Non-growth',1,1,1,1,1,'Nihility',5),(23006,'Patience Is All You Need',5,'Spider Web','Damage over Time Multiplier','Normal 1',0.48,0.56,0.64,0.72,0.8,'Nihility',5),(23006,'Patience Is All You Need',6,'Spider Web','Duration in Rounds','Non-growth',1,1,1,1,1,'Nihility',5),(23007,'Incessant Rain',1,'Mirage of Reality','Effect Hit Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Nihility',5),(23007,'Incessant Rain',2,'Mirage of Reality','Negative Effect Detection Count','Non-growth',3,3,3,3,3,'Nihility',5),(23007,'Incessant Rain',3,'Mirage of Reality','Critical Rate Bonus','Normal 1',0.12,0.14,0.16,0.18,0.2,'Nihility',5),(23007,'Incessant Rain',4,'Mirage of Reality','Base Probability','Non-growth',1,1,1,1,1,'Nihility',5),(23007,'Incessant Rain',5,'Mirage of Reality','Vulnerability','Normal 1',0.12,0.14,0.16,0.18,0.2,'Nihility',5),(23008,'Echoes of the Coffin',1,'Thorns','Attack Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Abundance',5),(23008,'Echoes of the Coffin',2,'Thorns','Base Energy Recovery','Normal 1',3,3.5,4,4.5,5,'Abundance',5),(23008,'Echoes of the Coffin',3,'Thorns','Energy Recovery Count','Non-growth',3,3,3,3,3,'Abundance',5),(23008,'Echoes of the Coffin',4,'Thorns','Speed Bonus','Normal 1',12,14,16,18,20,'Abundance',5),(23009,'The Unreachable Side',1,'Unfulfilled Yearning','Critical Rate Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Destruction',5),(23009,'The Unreachable Side',2,'Unfulfilled Yearning','Health Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Destruction',5),(23009,'The Unreachable Side',3,'Unfulfilled Yearning','Damage Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Destruction',5),(23010,'Before Dawn',1,'Long Night','Critical Damage Bonus','Normal 1',0.36,0.42,0.48,0.54,0.6,'The Erudition',5),(23010,'Before Dawn',2,'Long Night','Skill and Ultimate Damage Increase','Normal 1',0.18,0.21,0.24,0.27,0.3,'The Erudition',5),(23010,'Before Dawn',3,'Long Night','Additional Attack Damage Increase','Normal 1',0.48,0.56,0.64,0.72,0.8,'The Erudition',5),(23011,'She Already Shut Her Eyes',1,'Visioscape','Health Bonus','Normal 1',0.24,0.28,0.32,0.36,0.4,'Preservation',5),(23011,'She Already Shut Her Eyes',2,'Visioscape','Energy Recovery Efficiency','Normal 1',0.12,0.14,0.16,0.18,0.2,'Preservation',5),(23011,'She Already Shut Her Eyes',3,'Visioscape','All Damage Increase','Normal 1',0.09,0.105,0.12,0.135,0.15,'Preservation',5),(23011,'She Already Shut Her Eyes',4,'Visioscape','Duration in Rounds','Non-growth',2,2,2,2,2,'Preservation',5),(23011,'She Already Shut Her Eyes',5,'Visioscape','Health Regeneration Amount','Diminishing 5',0.8,0.85,0.9,0.95,1,'Preservation',5),(23012,'Sleep Like the Dead',1,'Sweet Dreams','Critical Damage Bonus','Normal 1',0.3,0.35,0.4,0.45,0.5,'Hunt',5),(23012,'Sleep Like the Dead',2,'Sweet Dreams','Non-Critical Hit Critical Rate Bonus','Normal 1',0.36,0.42,0.48,0.54,0.6,'Hunt',5),(23012,'Sleep Like the Dead',3,'Sweet Dreams','Duration in Rounds','Non-growth',1,1,1,1,1,'Hunt',5),(23012,'Sleep Like the Dead',4,'Sweet Dreams','Minimum Trigger Interval','Non-growth',3,3,3,3,3,'Hunt',5),(23013,'Time Waits for No One',1,'Morn, Noon, Dusk, and Night','Health Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Abundance',5),(23013,'Time Waits for No One',2,'Morn, Noon, Dusk, and Night','Healing Bonus','Normal 1',0.12,0.14,0.16,0.18,0.2,'Abundance',5),(23013,'Time Waits for No One',3,'Morn, Noon, Dusk, and Night','Recorded Healing Percentage','Normal 1',0.36,0.42,0.48,0.54,0.6,'Abundance',5),(23014,'I Shall Be My Own Sword',1,'With This Evening Jade','Critical Damage Bonus','Special 2',0.2,0.23,0.26,0.29,0.32,'Destruction',5),(23014,'I Shall Be My Own Sword',2,'With This Evening Jade','Single Layer Damage Bonus','Adjusted',0.14,0.16,0.19,0.21,0.24,'Destruction',5),(23014,'I Shall Be My Own Sword',3,'With This Evening Jade','Maximum Stack Count','Non-growth',3,3,3,3,3,'Destruction',5),(23014,'I Shall Be My Own Sword',4,'With This Evening Jade','Defense Ignore at Full Stack','Normal 1',0.12,0.14,0.16,0.18,0.2,'Destruction',5),(23015,'Brighter Than the Sun',1,'Defiant Till Death','Critical Rate Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Destruction',5),(23015,'Brighter Than the Sun',2,'Defiant Till Death','Duration in Rounds','Non-growth',2,2,2,2,2,'Destruction',5),(23015,'Brighter Than the Sun',3,'Defiant Till Death','Attack Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Destruction',5),(23015,'Brighter Than the Sun',4,'Defiant Till Death','Energy Recovery Efficiency Bonus','Normal 1',0.06,0.07,0.08,0.09,0.1,'Destruction',5),(23015,'Brighter Than the Sun',5,'Defiant Till Death','Maximum Stack Count','Non-growth',2,2,2,2,2,'Destruction',5),(23016,'Worrisome, Blissful',1,'One At A Time','Critical Rate Bonus','Normal 1',0.18,0.21,0.24,0.27,0.3,'Hunt',5),(23016,'Worrisome, Blissful',2,'One At A Time','Additional Attack Damage Increase','Normal 1',0.3,0.35,0.4,0.45,0.5,'Hunt',5),(23016,'Worrisome, Blissful',3,'One At A Time','Maximum Stack Count','Non-growth',2,2,2,2,2,'Hunt',5),(23016,'Worrisome, Blissful',4,'One At A Time','Critical Damage Bonus','Normal 1',0.12,0.14,0.16,0.18,0.2,'Hunt',5),(23017,'Night of Fright',1,'Deep, Deep Breaths','Energy Recovery Efficiency','Normal 1',0.12,0.14,0.16,0.18,0.2,'Abundance',5),(23017,'Night of Fright',2,'Deep, Deep Breaths','Health Recovery Amount','Diminishing 6',0.1,0.11,0.12,0.13,0.14,'Abundance',5),(23017,'Night of Fright',3,'Deep, Deep Breaths','Attack Bonus','Special 3',0.02,0.027,0.031,0.035,0.04,'Abundance',5),(23017,'Night of Fright',4,'Deep, Deep Breaths','Maximum Stack Count','Non-growth',5,5,5,5,5,'Abundance',5),(23017,'Night of Fright',5,'Deep, Deep Breaths','Duration in Rounds','Non-growth',2,2,2,2,2,'Abundance',5),(24000,'On the Fall of an Aeon',1,'Moth To Flames','Attack Bonus','Normal 2',0.08,0.1,0.12,0.14,0.16,'Destruction',4.6),(24000,'On the Fall of an Aeon',2,'Moth To Flames','Maximum Stack Count','Non-growth',4,4,4,4,4,'Destruction',4.6),(24000,'On the Fall of an Aeon',3,'Moth To Flames','Damage Bonus','Normal 2',0.12,0.15,0.18,0.21,0.24,'Destruction',4.6),(24000,'On the Fall of an Aeon',4,'Moth To Flames','Duration in Rounds','Non-growth',2,2,2,2,2,'Destruction',4.6),(24001,'Cruising the Stellar Sea',1,'Chase','Critical Rate Bonus','Normal 2',0.08,0.1,0.12,0.14,0.16,'Hunt',4.6),(24001,'Cruising the Stellar Sea',2,'Chase','Percentage Health Trigger','Non-growth',0.5,0.5,0.5,0.5,0.5,'Hunt',4.6),(24001,'Cruising the Stellar Sea',3,'Chase','Extra Critical Rate Bonus','Normal 2',0.08,0.1,0.12,0.14,0.16,'Hunt',4.6),(24001,'Cruising the Stellar Sea',4,'Chase','Attack Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Hunt',4.6),(24001,'Cruising the Stellar Sea',5,'Chase','Duration in Rounds','Non-growth',2,2,2,2,2,'Hunt',4.6),(24002,'Texture of Memories',1,'Treasure','Effect Resistance Bonus','Normal 2',0.08,0.1,0.12,0.14,0.16,'Preservation',4.6),(24002,'Texture of Memories',2,'Treasure','Shield Multiplier','Normal 2',0.16,0.2,0.24,0.28,0.32,'Preservation',4.6),(24002,'Texture of Memories',3,'Treasure','Duration in Rounds','Non-growth',2,2,2,2,2,'Preservation',4.6),(24002,'Texture of Memories',4,'Treasure','Minimum Trigger Interval','Non-growth',3,3,3,3,3,'Preservation',4.6),(24002,'Texture of Memories',5,'Treasure','Damage Reduction','Normal 2',0.12,0.15,0.18,0.21,0.24,'Preservation',4.6),(24003,'Solitary Healing',1,'Chaos Elixir','Break Bonus','Normal 2',0.2,0.25,0.3,0.35,0.4,'Nihility',4.6),(24003,'Solitary Healing',2,'Chaos Elixir','Damage over Time Bonus','Normal 2',0.24,0.3,0.36,0.42,0.48,'Nihility',4.6),(24003,'Solitary Healing',3,'Chaos Elixir','Duration in Rounds','Non-growth',2,2,2,2,2,'Nihility',4.6),(24003,'Solitary Healing',4,'Chaos Elixir','Base Energy Recovery','Diminishing 1',4,4.5,5,5.5,6,'Nihility',4.6);
/*!40000 ALTER TABLE `lightcone_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planar`
--

DROP TABLE IF EXISTS `planar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planar` (
  `Planar Ornaments` text,
  `PO_ID` int NOT NULL,
  `effect_1` text,
  `num_1` text,
  `effect_2` text,
  `num_2` text,
  PRIMARY KEY (`PO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planar`
--

LOCK TABLES `planar` WRITE;
/*!40000 ALTER TABLE `planar` DISABLE KEYS */;
INSERT INTO `planar` VALUES ('Space Sealing Station',301,'ATK','12%','ATK','12%'),('Fleet of the Ageless',302,'Max HP','12%','all allies\' ATK','8%'),('Pan-Cosmic Commercial Enterprise',303,'Effect Hit Rate','10%','Effect Hit Rate','25%'),('Belobog of the Architects',304,'DEF','15%','DEF','15%'),('Celestial Differentiator',305,'CRIT DMG','16%','CRIT Rate','60%'),('Inert Salsotto',306,'CRIT Rate','8%','Ultimate and follow-up attack DMG','15%'),('Taila: Kingdom of Banditry',307,'Break Effect','16%','Break Effect','20%'),('Sprightly Vomwacq',308,'Energy Regeneration Rate','5%','Action Advanced Forward','40%'),('Rutilant Arena',309,'CRIT Rate','8%','Basic ATK and Skill DMG','20%'),('Broken Keel',310,'Effect RES','10%','all allies\' CRIT DMG','10%'),('Firmament Frontline Glamoth',311,'ATK','12%','ATK','12%'),('Penacony, Land of the Dreams',312,'Energy Regeneration Rate','5%','ATK','10%');
/*!40000 ALTER TABLE `planar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_coef`
--

DROP TABLE IF EXISTS `skill_coef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_coef` (
  `Level` int NOT NULL,
  `Breakthrough` int NOT NULL,
  `Coefficient_Chara` double DEFAULT NULL,
  `Coefficient_LightCone` double DEFAULT NULL,
  PRIMARY KEY (`Level`,`Breakthrough`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_coef`
--

LOCK TABLES `skill_coef` WRITE;
/*!40000 ALTER TABLE `skill_coef` DISABLE KEYS */;
INSERT INTO `skill_coef` VALUES (1,0,1,1),(2,0,1.05,1.15),(3,0,1.1,1.3),(4,0,1.15,1.45),(5,0,1.2,1.6),(6,0,1.25,1.75),(7,0,1.3,1.9),(8,0,1.35,2.05),(9,0,1.4,2.2),(10,0,1.45,2.35),(11,0,1.5,2.5),(12,0,1.55,2.65),(13,0,1.6,2.8),(14,0,1.65,2.95),(15,0,1.7,3.1),(16,0,1.75,3.25),(17,0,1.8,3.4),(18,0,1.85,3.55),(19,0,1.9,3.7),(20,0,1.95,3.85),(20,1,2.35,5.05),(21,0,2.4,5.2),(22,0,2.45,5.35),(23,0,2.5,5.5),(24,0,2.55,5.65),(25,0,2.6,5.8),(26,0,2.65,5.95),(27,0,2.7,6.1),(28,0,2.75,6.25),(29,0,2.8,6.4),(30,0,2.85,6.55),(30,1,3.25,8.15),(31,0,3.3,8.3),(32,0,3.35,8.45),(33,0,3.4,8.6),(34,0,3.45,8.75),(35,0,3.5,8.9),(36,0,3.55,9.05),(37,0,3.6,9.2),(38,0,3.65,9.35),(39,0,3.7,9.5),(40,0,3.75,9.65),(40,1,4.15,11.25),(41,0,4.2,11.4),(42,0,4.25,11.55),(43,0,4.3,11.7),(44,0,4.35,11.85),(45,0,4.4,12),(46,0,4.45,12.15),(47,0,4.5,12.3),(48,0,4.55,12.45),(49,0,4.6,12.6),(50,0,4.65,12.75),(50,1,5.05,14.35),(51,0,5.1,14.5),(52,0,5.15,14.65),(53,0,5.2,14.8),(54,0,5.25,14.95),(55,0,5.3,15.1),(56,0,5.35,15.25),(57,0,5.4,15.4),(58,0,5.45,15.55),(59,0,5.5,15.7),(60,0,5.55,15.85),(60,1,5.95,17.45),(61,0,6,17.6),(62,0,6.05,17.75),(63,0,6.1,17.9),(64,0,6.15,18.05),(65,0,6.2,18.2),(66,0,6.25,18.35),(67,0,6.3,18.5),(68,0,6.35,18.65),(69,0,6.4,18.8),(70,0,6.45,18.95),(70,1,6.85,20.55),(71,0,6.9,20.7),(72,0,6.95,20.85),(73,0,7,21),(74,0,7.05,21.15),(75,0,7.1,21.3),(76,0,7.15,21.45),(77,0,7.2,21.6),(78,0,7.25,21.75),(79,0,7.3,21.9),(80,0,7.35,22.05);
/*!40000 ALTER TABLE `skill_coef` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 21:47:46
