-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: student_portal
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `club_join_quit_attempts`
--

DROP TABLE IF EXISTS `club_join_quit_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_join_quit_attempts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attempt_count` int NOT NULL,
  `banned_until` datetime(6) DEFAULT NULL,
  `club_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_join_quit_attempts`
--

LOCK TABLES `club_join_quit_attempts` WRITE;
/*!40000 ALTER TABLE `club_join_quit_attempts` DISABLE KEYS */;
INSERT INTO `club_join_quit_attempts` VALUES (1,0,'2025-03-09 23:56:44.219769','Badminton','thomas'),(2,1,NULL,'Football','thomas'),(3,1,NULL,'Badminton','mary'),(4,1,NULL,'Chess','mary');
/*!40000 ALTER TABLE `club_join_quit_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `club_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `club_image` varchar(255) DEFAULT NULL,
  `members_count` decimal(38,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Swimming','Joyous Club','http://localhost:8080/images/swim.jpg',1.00),(2,'Badminton','Joyous Club','http://localhost:8080/images/badmintonclub.jpg',0.00),(3,'Basketball','Joyous Club','http://localhost:8080/images/basketballclub.jpg',0.00),(4,'Chess','Joyous Club','http://localhost:8080/images/chessclub.jpg',2.00),(5,'Football','Joyous Club','http://localhost:8080/images/sports_club.jpg',0.00),(7,'Art Club','Joyous Club','http://localhost:8080/images/art_clubs.jpg',NULL),(8,'Music ','Joyous Club','http://localhost:8080/images/music_clubs.jpg',NULL);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_history`
--

DROP TABLE IF EXISTS `exchange_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchange_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exchange_date` datetime(6) DEFAULT NULL,
  `quantity_exchanged` int NOT NULL,
  `total_roses_spent` int NOT NULL,
  `marketplace_item_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhpwik1twnfa0ln4vg361r2fb3` (`marketplace_item_id`),
  KEY `FKrt3uw1kf5kv7ij4ffdr57hct3` (`student_id`),
  CONSTRAINT `FKhpwik1twnfa0ln4vg361r2fb3` FOREIGN KEY (`marketplace_item_id`) REFERENCES `marketplace_items` (`id`),
  CONSTRAINT `FKrt3uw1kf5kv7ij4ffdr57hct3` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_history`
--

LOCK TABLES `exchange_history` WRITE;
/*!40000 ALTER TABLE `exchange_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `exchange_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idea_roses`
--

DROP TABLE IF EXISTS `idea_roses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idea_roses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rose_count` int NOT NULL,
  `idea_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1qpxldtwo8h3a0peoj4jgfwkv` (`idea_id`,`student_id`),
  KEY `FKd27t5ldwy0w356mjjcxtcro65` (`student_id`),
  CONSTRAINT `FKd27t5ldwy0w356mjjcxtcro65` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKju70y11pdpkdp72t8mvd7jp6e` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idea_roses`
--

LOCK TABLES `idea_roses` WRITE;
/*!40000 ALTER TABLE `idea_roses` DISABLE KEYS */;
/*!40000 ALTER TABLE `idea_roses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idea_sdgs`
--

DROP TABLE IF EXISTS `idea_sdgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idea_sdgs` (
  `idea_id` int NOT NULL,
  `sdgs` int DEFAULT NULL,
  KEY `FKbd0dco5xcc67ufyi4agb4ctvi` (`idea_id`),
  CONSTRAINT `FKbd0dco5xcc67ufyi4agb4ctvi` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idea_sdgs`
--

LOCK TABLES `idea_sdgs` WRITE;
/*!40000 ALTER TABLE `idea_sdgs` DISABLE KEYS */;
INSERT INTO `idea_sdgs` VALUES (4,1),(8,4),(8,14);
/*!40000 ALTER TABLE `idea_sdgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas`
--

DROP TABLE IF EXISTS `ideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ideas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text NOT NULL,
  `rose_count` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8jw59obt87i97m816fc61pp28` (`student_id`),
  CONSTRAINT `FK8jw59obt87i97m816fc61pp28` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas`
--

LOCK TABLES `ideas` WRITE;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` VALUES (4,'2025-03-16 04:35:56.967000','Camp',7,'Camp',1),(8,'2025-03-16 05:03:15.975000','afaf',0,'a',2);
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `is_found` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `image` longblob,
  PRIMARY KEY (`id`),
  KEY `FKm5y8d9qs60qd9s7oscfcjtav2` (`student_id`),
  CONSTRAINT `FKm5y8d9qs60qd9s7oscfcjtav2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_items`
--

DROP TABLE IF EXISTS `marketplace_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `image` longblob,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_items`
--

LOCK TABLES `marketplace_items` WRITE;
/*!40000 ALTER TABLE `marketplace_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKokandii2nhxkm67thn9r002ft` (`post_id`,`student_id`),
  KEY `FK5a1yd0knpdg3v3hg7hi92usw4` (`student_id`),
  CONSTRAINT `FK5a1yd0knpdg3v3hg7hi92usw4` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKa5wxsgl4doibhbed9gm7ikie2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (18,2,1),(6,3,5),(10,4,5),(15,6,1),(7,6,5),(8,7,5),(13,8,5),(17,21,1);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_at` datetime(6) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `like_count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbbxebkadriygi0p21w5mmf7cw` (`student_id`),
  CONSTRAINT `FKbbxebkadriygi0p21w5mmf7cw` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'Snoop Dogg','2025-01-18 21:44:55.751054','Music',1,1),(3,'Football (or soccer as the game is called in some parts of the world) has a long history. Football in its current form arose in England in the middle of the 19th century. But alternative versions of the game existed much earlier and are a part of the football history.','2025-01-18 21:44:55.970265','Football',2,1),(4,'Football (or soccer as the game is called in some parts of the world) has a long history. Football in its current form arose in England in the middle of the 19th century. But alternative versions of the game existed much earlier and are a part of the football history.','2025-01-18 21:44:55.970265','Football',2,1),(5,'Discover 9 powerful open-source projects to enhance your workflow, whether you\'re a beginner or experienced developer. These tools span cloud management, feature flagging, user feedback, URL shortening, project management, data collaboration, LLM workflow building, privacy-focused AI, and documentation site generation','2024-12-09 20:45:00.000000','Poems',2,0),(6,'Java continues to be a key technology for building powerful applications in today','2025-02-24 15:08:23.116000','New Post',1,2),(7,'To access and use all Apple Card features and products available only to Apple Card users, you must add Apple Card to Wallet on an iPhone or iPad that supports and has the latest version of iOS or iPadOS.','2025-02-24 15:10:12.161000','New Post',1,1),(8,'Once upon a midnight dreary, While I pondered, weak and weary, Over many a quaint and curious Volume of forgotten lore? While I nodded, nearly napping, Suddenly there came a tapping, As of some one gently rapping, Rapping at my chamber door. \"\'T is some visitor,\" I muttered, \"Tapping at my chamber door Only this and nothing more.\"','2025-02-24 15:11:46.546000','New Post',1,1),(21,'Sata Anndagi\n','2025-03-09 09:40:22.918000','New Post',1,1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_club`
--

DROP TABLE IF EXISTS `student_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_club` (
  `id` int NOT NULL AUTO_INCREMENT,
  `join_date` date DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbhbd06145fr1hr8f63ne9tw09` (`club_id`),
  KEY `FKoq0n865xwmk37e9n9kx8dp0a` (`student_id`),
  CONSTRAINT `FKbhbd06145fr1hr8f63ne9tw09` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`),
  CONSTRAINT `FKoq0n865xwmk37e9n9kx8dp0a` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_club`
--

LOCK TABLES `student_club` WRITE;
/*!40000 ALTER TABLE `student_club` DISABLE KEYS */;
INSERT INTO `student_club` VALUES (1,'2025-03-05',4,5),(3,'2025-03-05',4,1),(4,'2025-03-05',1,1);
/*!40000 ALTER TABLE `student_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `rose_count` int NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `student_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKakwqgcdnid3qo41cqpdu4ke01` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Ayumu Kasuga','$2a$10$nh6kNUfnCobURHgE3kS36Ouok4Mg7D2bQzUrvAEkKsFIwONjCJMaW','duke1.jpg',56,'Second Semester','TNT-0001','Osaka','Third Year'),(2,'Shima Rin','$2a$10$S4oJ3D88l5ifKi/dup/WiuMAErRPCdVIuBLS.QDMB66I7pfs3rp7q','duke2.jpg',1,'Second Semester','TNT-0002','Rin','Third Year'),(5,'Sakata Gintoki','$2a$10$ddAC/9NJn5QtvI8Y8PszOOa8SIlU1drlsMIGdtjX1YIOlObXZNh6a','duke3.jpg',41,'Second Semester','TNT-1560','Gin-san','Third Year');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_roles`
--

DROP TABLE IF EXISTS `students_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_roles` (
  `student_id` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`roles_id`),
  KEY `FKjxf8ep21nr1xtbqa68m966mqn` (`roles_id`),
  CONSTRAINT `FK9hf98nso2rn01nym128wjt1ak` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `FKjxf8ep21nr1xtbqa68m966mqn` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_roles`
--

LOCK TABLES `students_roles` WRITE;
/*!40000 ALTER TABLE `students_roles` DISABLE KEYS */;
INSERT INTO `students_roles` VALUES (2,1),(5,1),(1,2);
/*!40000 ALTER TABLE `students_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-16 13:47:05
