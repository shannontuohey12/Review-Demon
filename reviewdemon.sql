-- MySQL dump 10.13  Distrib 9.4.0, for macos15 (arm64)
--
-- Host: localhost    Database: reviewdemon
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `albumName` varchar(100) DEFAULT NULL,
  `artistID` int DEFAULT NULL,
  `dateReleased` date DEFAULT NULL,
  `lengthMins` int DEFAULT NULL,
  `genre1` varchar(100) DEFAULT NULL,
  `genre2` varchar(100) DEFAULT NULL,
  `genre3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artistID` (`artistID`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artistID`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Abbey Road',1,'1969-09-26',47,'Rock','Psychedelic Rock','Progressive Rock'),(2,'Thriller',2,'1982-11-30',42,'Pop','Rock','R&B'),(3,'The Dark Side of the Moon',3,'1973-03-01',43,'Progressive Rock','Psychedelic Rock',NULL),(4,'Back in Black',4,'1980-07-25',42,'Hard Rock','Heavy Metal',NULL),(5,'Rumours',5,'1977-02-04',39,'Rock','Soft Rock','Pop Rock'),(6,'Led Zeppelin IV',6,'1971-11-08',42,'Hard Rock','Blues Rock','Folk Rock'),(7,'A Night at the Opera',7,'1975-11-21',43,'Rock','Progressive Rock','Pop Rock'),(8,'Nevermind',8,'1991-09-24',49,'Grunge','Alternative Rock',NULL),(9,'OK Computer',9,'1997-05-21',53,'Alternative Rock','Art Rock',NULL),(10,'1989',10,'2014-10-27',48,'Pop','Synth-pop','Dance-pop'),(11,'My Beautiful Dark Twisted Fantasy',11,'2010-11-22',68,'Hip Hop','Rap','R&B'),(12,'To Pimp a Butterfly',12,'2015-03-15',79,'Hip Hop','Jazz Rap','Funk'),(13,'Take Care',13,'2011-11-15',80,'Hip Hop','R&B',NULL),(14,'21',14,'2011-01-24',48,'Soul','Pop','Ballad'),(15,'A Rush of Blood to the Head',15,'2002-08-26',54,'Alternative Rock','Pop Rock',NULL),(16,'Happier Than Ever',16,'2021-07-30',56,'Pop','Indie Pop','Alternative'),(17,'The Marshall Mathers LP',17,'2000-05-23',72,'Hip Hop','Rap',NULL),(18,'Doo-Wops & Hooligans',18,'2010-10-04',42,'Pop','R&B',NULL),(19,'After Hours',19,'2020-03-20',56,'Synth-pop','R&B','Pop'),(20,'Divide',20,'2017-03-03',59,'Pop','Folk Pop','Soft Rock');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL,
  `artistName` varchar(100) DEFAULT NULL,
  `merchLink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'The Beatles','https://store.thebeatles.com'),(2,'Michael Jackson','https://shopmichaeljackson.com'),(3,'Pink Floyd','https://shop.pinkfloyd.com'),(4,'AC/DC','https://store.acdc.com'),(5,'Fleetwood Mac','https://fleetwoodmac.com/store'),(6,'Led Zeppelin','https://ledzeppelin.com/store'),(7,'Queen','https://queenonlinestore.com'),(8,'Nirvana','https://nirvana.com/store'),(9,'Radiohead','https://store.radiohead.com'),(10,'Taylor Swift','https://store.taylorswift.com'),(11,'Kanye West','https://shop.kanyewest.com'),(12,'Kendrick Lamar','https://shop.kendricklamar.com'),(13,'Drake','https://drakeofficial.com/store'),(14,'Adele','https://shop.adele.com'),(15,'Coldplay','https://store.coldplay.com'),(16,'Billie Eilish','https://store.billieeilish.com'),(17,'Eminem','https://eminem.store'),(18,'Bruno Mars','https://store.brunomars.com'),(19,'The Weeknd','https://shop.theweeknd.com'),(20,'Ed Sheeran','https://store.edsheeran.com');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(2048) DEFAULT NULL,
  `thread_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Totally agree!',1,NULL),(2,'Best pop album ever.',2,NULL),(3,'Still relevant today.',3,NULL),(4,'That riff is legendary.',4,NULL),(5,'No skips indeed!',5,NULL),(6,'Maybe a little overrated.',6,NULL),(7,'Forever a classic.',7,NULL),(8,'Defined my teenage years.',8,NULL),(9,'Creepy how accurate it is.',9,NULL),(10,'She’s a genius.',10,NULL),(11,'Kanye’s magnum opus.',11,NULL),(12,'TPAB is untouchable.',12,NULL),(13,'Drake at his peak.',13,NULL),(14,'Her voice is unmatched.',14,NULL),(15,'I agree completely.',15,NULL),(16,'So emotional.',16,NULL),(17,'Stan gave me chills.',17,NULL),(18,'Feel-good vibes.',18,NULL),(19,'Best song of the decade.',19,NULL),(20,'Pop perfection.',20,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `artistID` int DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `artistID` (`artistID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`artistID`) REFERENCES `Artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO `Events` VALUES (1,1,'2023-09-15','Madison Square Garden','New York','NY'),(2,2,'2023-10-01','Staples Center','Los Angeles','CA'),(3,3,'2023-11-20','Wembley Stadium','London','UK'),(4,4,'2023-12-05','Sydney Opera House','Sydney','AU'),(5,5,'2024-01-10','Red Rocks Amphitheatre','Morrison','CO'),(6,6,'2024-02-14','O2 Arena','London','UK'),(7,7,'2024-03-03','Tokyo Dome','Tokyo','JP'),(8,8,'2024-03-22','Lollapalooza Stage','Chicago','IL'),(9,9,'2024-04-15','Coachella Main Stage','Indio','CA'),(10,10,'2024-05-05','Glastonbury','Pilton','UK'),(11,11,'2024-06-11','Yankee Stadium','New York','NY'),(12,12,'2024-06-25','Hollywood Bowl','Los Angeles','CA'),(13,13,'2024-07-12','Scotiabank Arena','Toronto','ON'),(14,14,'2024-07-30','Royal Albert Hall','London','UK'),(15,15,'2024-08-20','Olympic Stadium','Berlin','DE'),(16,16,'2024-09-01','Rod Laver Arena','Melbourne','AU'),(17,17,'2024-09-18','Little Caesars Arena','Detroit','MI'),(18,18,'2024-10-07','Allegiant Stadium','Las Vegas','NV'),(19,19,'2024-10-25','Rogers Centre','Toronto','ON'),(20,20,'2024-11-15','Etihad Stadium','Manchester','UK');
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendships` (
  `friendship_id` int DEFAULT NULL,
  `user_id1` int DEFAULT NULL,
  `user_id2` int DEFAULT NULL,
  `date_friended` datetime DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  KEY `user_id1` (`user_id1`),
  KEY `user_id2` (`user_id2`),
  CONSTRAINT `friendships_ibfk_1` FOREIGN KEY (`user_id1`) REFERENCES `users` (`id`),
  CONSTRAINT `friendships_ibfk_2` FOREIGN KEY (`user_id2`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (1,1,2,'2022-01-10 14:32:00',0),(2,3,4,'2022-02-15 09:45:00',0),(3,5,6,'2022-03-01 19:10:00',1),(4,7,8,'2022-04-11 11:00:00',0),(5,9,10,'2022-04-20 20:25:00',0),(6,11,12,'2022-05-15 16:05:00',0),(7,13,14,'2022-06-01 18:22:00',1),(8,15,16,'2022-07-08 10:30:00',0),(9,17,18,'2022-08-13 21:45:00',0),(10,19,20,'2022-09-09 12:15:00',0),(11,2,3,'2022-10-01 09:20:00',0),(12,4,5,'2022-11-05 17:50:00',0),(13,6,7,'2022-12-19 15:30:00',0),(14,8,9,'2023-01-10 08:15:00',1),(15,10,11,'2023-02-14 13:40:00',0),(16,12,13,'2023-03-22 19:10:00',0),(17,14,15,'2023-04-05 11:55:00',0),(18,16,17,'2023-05-18 20:45:00',0),(19,18,19,'2023-06-07 22:00:00',1),(20,1,20,'2023-07-21 14:30:00',0);
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `albumID` int DEFAULT NULL,
  `songID` int DEFAULT NULL,
  `rating` enum('1','2','3','4','5','6','7','8','9','10') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `albumID` (`albumID`),
  KEY `songID` (`songID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`albumID`) REFERENCES `Albums` (`id`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`songID`) REFERENCES `Songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,1,1,1,'9'),(2,2,2,2,'10'),(3,3,3,3,'8'),(4,4,4,4,'7'),(5,5,5,5,'9'),(6,6,6,6,'10'),(7,7,7,7,'8'),(8,8,8,8,'7'),(9,9,9,9,'10'),(10,10,10,10,'9'),(11,11,11,11,'8'),(12,12,12,12,'9'),(13,13,13,13,'7'),(14,14,14,14,'10'),(15,15,15,15,'8'),(16,16,16,16,'9'),(17,17,17,17,'7'),(18,18,18,18,'8'),(19,19,19,19,'9'),(20,20,20,20,'10');
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `artist` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `album` int DEFAULT NULL,
  `albumid` int DEFAULT NULL,
  `length_secs` int DEFAULT NULL,
  `song_name` varchar(255) DEFAULT NULL,
  `artistid` int DEFAULT NULL,
  `genre1` varchar(255) DEFAULT NULL,
  `genre2` varchar(255) DEFAULT NULL,
  `genre3` varchar(255) DEFAULT NULL,
  `track_num` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` int NOT NULL,
  `albumID` int DEFAULT NULL,
  `lengthSecs` int DEFAULT NULL,
  `songName` varchar(100) DEFAULT NULL,
  `artistID` int DEFAULT NULL,
  `trackNum` int DEFAULT NULL,
  `genre1` varchar(100) DEFAULT NULL,
  `genre2` varchar(100) DEFAULT NULL,
  `genre3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `albumID` (`albumID`),
  KEY `artistID` (`artistID`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`albumID`) REFERENCES `albums` (`id`),
  CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`artistID`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,1,185,'Come Together',1,1,'Rock','Blues Rock',NULL),(2,2,358,'Thriller',2,4,'Pop','Funk','R&B'),(3,3,421,'Time',3,4,'Progressive Rock','Psychedelic Rock',NULL),(4,4,255,'Back in Black',4,6,'Hard Rock','Heavy Metal',NULL),(5,5,240,'Dreams',5,2,'Soft Rock','Pop Rock',NULL),(6,6,482,'Stairway to Heaven',6,4,'Hard Rock','Folk Rock',NULL),(7,7,355,'Bohemian Rhapsody',7,11,'Rock','Progressive Rock',NULL),(8,8,301,'Smells Like Teen Spirit',8,1,'Grunge','Alternative Rock',NULL),(9,9,319,'Paranoid Android',9,2,'Alternative Rock','Art Rock',NULL),(10,10,231,'Blank Space',10,2,'Pop','Synth-pop',NULL),(11,11,491,'Runaway',11,9,'Hip Hop','Rap','R&B'),(12,12,402,'Alright',12,7,'Hip Hop','Jazz Rap','Funk'),(13,13,262,'Take Care',13,8,'Hip Hop','R&B',NULL),(14,14,285,'Rolling in the Deep',14,1,'Soul','Pop','Ballad'),(15,15,295,'The Scientist',15,4,'Alternative Rock','Pop Rock',NULL),(16,16,298,'Happier Than Ever',16,16,'Pop','Indie Pop','Alternative'),(17,17,384,'Stan',17,3,'Hip Hop','Rap',NULL),(18,18,218,'Just the Way You Are',18,1,'Pop','R&B',NULL),(19,19,322,'Blinding Lights',19,9,'Synth-pop','Pop','R&B'),(20,20,261,'Shape of You',20,4,'Pop','Dancehall','R&B');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tags` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `albumID` int DEFAULT NULL,
  `songID` int DEFAULT NULL,
  `tagname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `albumID` (`albumID`),
  KEY `songID` (`songID`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`id`),
  CONSTRAINT `tags_ibfk_2` FOREIGN KEY (`albumID`) REFERENCES `Albums` (`id`),
  CONSTRAINT `tags_ibfk_3` FOREIGN KEY (`songID`) REFERENCES `Songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES (1,1,1,1,'classic'),(2,2,2,2,'pop hit'),(3,3,3,3,'psychedelic'),(4,4,4,4,'hard rock'),(5,5,5,5,'soft rock'),(6,6,6,6,'legendary'),(7,7,7,7,'anthem'),(8,8,8,8,'grunge'),(9,9,9,9,'experimental'),(10,10,10,10,'chart topper'),(11,11,11,11,'epic'),(12,12,12,12,'conscious rap'),(13,13,13,13,'drake vibes'),(14,14,14,14,'soulful'),(15,15,15,15,'melodic'),(16,16,16,16,'indie pop'),(17,17,17,17,'controversial'),(18,18,18,18,'feel good'),(19,19,19,19,'synthwave'),(20,20,20,20,'romantic');
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thread_text` varchar(2048) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `artist_id` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `artist_id` (`artist_id`),
  KEY `album_id` (`album_id`),
  KEY `song_id` (`song_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `threads_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `threads_ibfk_3` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`),
  CONSTRAINT `threads_ibfk_4` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  CONSTRAINT `threads_ibfk_5` FOREIGN KEY (`event_id`) REFERENCES `events` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
INSERT INTO `threads` VALUES (1,'Abbey Road is the best Beatles album!','2023-01-10',1,1,1,1,1),(2,'Thriller changed pop forever.','2023-02-14',2,2,2,2,2),(3,'Dark Side of the Moon blew my mind.','2023-03-01',3,3,3,3,3),(4,'Back in Black riffs are iconic.','2023-03-15',4,4,4,4,4),(5,'Rumours has no skips.','2023-04-02',5,5,5,5,5),(6,'Stairway to Heaven is overrated?','2023-04-20',6,6,6,6,6),(7,'Bohemian Rhapsody forever!','2023-05-10',7,7,7,7,7),(8,'Nevermind defined grunge.','2023-05-25',8,8,8,8,8),(9,'OK Computer predicted the future.','2023-06-12',9,9,9,9,9),(10,'Taylor reinvented pop with 1989.','2023-07-01',10,10,10,10,10),(11,'MBDTF is a masterpiece.','2023-07-20',11,11,11,11,11),(12,'TPAB is art.','2023-08-05',12,12,12,12,12),(13,'Take Care is Drake’s best.','2023-08-22',13,13,13,13,13),(14,'Adele makes me cry every time.','2023-09-01',14,14,14,14,14),(15,'Coldplay peaked with Rush of Blood.','2023-09-15',15,15,15,15,15),(16,'Billie’s new album is so deep.','2023-10-01',16,16,16,16,16),(17,'Eminem’s Stan is haunting.','2023-10-12',17,17,17,17,17),(18,'Bruno Mars has no bad songs.','2023-10-28',18,18,18,18,18),(19,'The Weeknd’s Blinding Lights is iconic.','2023-11-11',19,19,19,19,19),(20,'Ed Sheeran always delivers hits.','2023-11-25',20,20,20,20,20);
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `artist_id` int DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `membership` tinyint(1) DEFAULT NULL,
  `amountOfReviews` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'beatleFan99',1,5),(2,2,'mjMoonwalker',1,12),(3,3,'floydianSlip',0,3),(4,4,'rockerDude',1,7),(5,5,'rumoursLover',1,2),(6,6,'zeppelinFan',0,4),(7,7,'queenBee',1,9),(8,8,'nirvanaKid',0,6),(9,9,'radioheadGeek',1,8),(10,10,'swiftie123',1,15),(11,11,'yeezyForever',1,10),(12,12,'kendrickKing',1,6),(13,13,'ovoCrew',0,3),(14,14,'adeleSoul',1,5),(15,15,'coldplayer',0,7),(16,16,'billieFan',1,9),(17,17,'shadyStan',1,14),(18,18,'brunoMarsFan',0,2),(19,19,'xoCrew',1,11),(20,20,'edster',1,13);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11  0:39:35
