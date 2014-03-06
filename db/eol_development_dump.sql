-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eol_development
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent_roles`
--

DROP TABLE IF EXISTS `agent_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Identifies how agent is linked to data_object';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_roles`
--

LOCK TABLES `agent_roles` WRITE;
/*!40000 ALTER TABLE `agent_roles` DISABLE KEYS */;
INSERT INTO `agent_roles` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18);
/*!40000 ALTER TABLE `agent_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` text NOT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homepage` text NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `yahoo_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `full_name` (`full_name`(200))
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='Agents are content partners and used for object attribution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'IUCN',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:04','2014-02-20 08:44:04'),(2,'Catalogue of Life',NULL,NULL,NULL,'http://www.catalogueoflife.org/','',219000,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:04','2014-02-20 08:44:04'),(3,'National Center for Biotechnology Information',NULL,NULL,NULL,'http://www.ncbi.nlm.nih.gov/','',921800,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:05','2014-02-20 08:44:05'),(4,'Biology of Aging',NULL,NULL,NULL,'','',318700,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:05','2014-02-20 08:44:05'),(5,'Fiona Parisian',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:06','2014-02-20 08:44:06'),(6,'Spencer Bergstrom',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:08','2014-02-20 08:44:08'),(7,'GBIF',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:08','2014-02-20 08:44:08'),(8,'Camren Rhys',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:11','2014-02-20 08:44:11'),(9,'Ahmad Murphy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:21','2014-02-20 08:44:21'),(10,'Global Biodiversity Information Facility (GBIF)',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:31','2014-02-20 08:44:31'),(11,'Roxane Connelly',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:31','2014-02-20 08:44:31'),(12,'Mariana Runolfsson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:33','2014-02-20 08:44:33'),(13,'Joshuah Ernser',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:33','2014-02-20 08:44:33'),(14,'Antonia Nolan',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:40','2014-02-20 08:44:40'),(15,'Eugene Mosciski',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:40','2014-02-20 08:44:40'),(16,'Kaitlin Larkin',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:44','2014-02-20 08:44:44'),(17,'Otho Willms',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:44','2014-02-20 08:44:44'),(18,'Camila Deckow',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:49','2014-02-20 08:44:49'),(19,'Colt Stracke',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:49','2014-02-20 08:44:49'),(20,'Mathew Deckow',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:53','2014-02-20 08:44:53'),(21,'Electa Na',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:53','2014-02-20 08:44:53'),(22,'Damaris Torphy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:57','2014-02-20 08:44:57'),(23,'Aidan Mills',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:44:57','2014-02-20 08:44:57'),(24,'Dora Pollich',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:02','2014-02-20 08:45:02'),(25,'Emmanuelle Beatty',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:03','2014-02-20 08:45:03'),(26,'Sam Hettinger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:03','2014-02-20 08:45:03'),(27,'Betty Okuneva',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:04','2014-02-20 08:45:04'),(28,'Reuben Olson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:05','2014-02-20 08:45:05'),(29,'Ashley West',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:05','2014-02-20 08:45:05'),(30,'Vicente Schowalter',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:05','2014-02-20 08:45:05'),(31,'Heber Hill',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:06','2014-02-20 08:45:06'),(32,'Maybell Schneider',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:06','2014-02-20 08:45:06'),(33,'Okey McCullough',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:11','2014-02-20 08:45:11'),(34,'Leonardo Schamberger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:11','2014-02-20 08:45:11'),(35,'Gerhard Bode',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:13','2014-02-20 08:45:13'),(36,'Cicero Stehr',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:13','2014-02-20 08:45:13'),(37,'Maritza Kuhic',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:15','2014-02-20 08:45:15'),(38,'Alvah Wisozk',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:16','2014-02-20 08:45:16'),(39,'Wyatt Hansen',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:16','2014-02-20 08:45:16'),(40,'Ming Spencer',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:16','2014-02-20 08:45:16'),(41,'Ralph Wiggum',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:20','2014-02-20 08:45:20'),(42,'Shane Eichmann',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:20','2014-02-20 08:45:20'),(43,'George Rolfson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:20','2014-02-20 08:45:20'),(44,'Chanel Keller',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:21','2014-02-20 08:45:21'),(45,'Rosalia Toy',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:21','2014-02-20 08:45:21'),(46,'Admin User',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:21','2014-02-20 08:45:21'),(47,'Christie Ankunding',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:23','2014-02-20 08:45:23'),(48,'Madelynn Beatty',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:23','2014-02-20 08:45:23'),(49,'Jeramie Botsford',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:27','2014-02-20 08:45:27'),(50,'test curator',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:27','2014-02-20 08:45:27'),(51,'Lavada Mann',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:28','2014-02-20 08:45:28'),(52,'Kailey Ankunding',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:28','2014-02-20 08:45:28'),(53,'Herbert Senger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:29','2014-02-20 08:45:29'),(54,'Rolfe Luettgen',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:29','2014-02-20 08:45:29'),(55,'Kali Lubowitz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:34','2014-02-20 08:45:34'),(56,'Jacky Welch',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:34','2014-02-20 08:45:34'),(57,'Marilie Harvey',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:38','2014-02-20 08:45:38'),(58,'Jon Schultz',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:38','2014-02-20 08:45:39'),(59,'Rachel Keebler',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:43','2014-02-20 08:45:43'),(60,'Scot Hudson',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:43','2014-02-20 08:45:43'),(61,'Rhea Leffler',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:47','2014-02-20 08:45:47'),(62,'Greta Gleason',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:48','2014-02-20 08:45:48'),(63,'Dameon Schmidt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:51','2014-02-20 08:45:51'),(64,'Rasheed Skiles',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:51','2014-02-20 08:45:51'),(65,'Bertrand Gleason',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:55','2014-02-20 08:45:55'),(66,'Seao Cummerata',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:55','2014-02-20 08:45:55'),(67,'Janif Stamm',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:59','2014-02-20 08:45:59'),(68,'Helmes Beier',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:45:59','2014-02-20 08:45:59'),(69,'Fionb Dickens',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:04','2014-02-20 08:46:04'),(70,'Spences Kulas',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:04','2014-02-20 08:46:04'),(71,'Camreo Franecki',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:08','2014-02-20 08:46:08'),(72,'Ahmae Kuhic',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:08','2014-02-20 08:46:08'),(73,'Roxanf Padberg',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:13','2014-02-20 08:46:13'),(74,'Marianb Haley',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:13','2014-02-20 08:46:13'),(75,'Joshuai Gorczany',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:16','2014-02-20 08:46:16'),(76,'Antonib Hoeger',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:16','2014-02-20 08:46:16'),(77,'Eugenf Cronio',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:20','2014-02-20 08:46:20'),(78,'Kaitlio Reinges',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:20','2014-02-20 08:46:20'),(79,'Othp Jacobt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:24','2014-02-20 08:46:24'),(80,'Camilb Cronb',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:24','2014-02-20 08:46:24'),(81,'Colu Parisiao',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:36','2014-02-20 08:46:36'),(82,'Mathex Bergstron',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:55','2014-02-20 08:46:55'),(83,'Electb Rhyt',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-15 08:46:55','2014-02-20 08:46:55'),(84,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-20 13:31:28','0000-00-00 00:00:00'),(85,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-23 07:12:16','0000-00-00 00:00:00'),(86,'user100',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-23 08:17:23','0000-00-00 00:00:00'),(87,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-23 08:33:58','0000-00-00 00:00:00'),(88,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-23 13:03:10','0000-00-00 00:00:00'),(89,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-24 07:10:54','0000-00-00 00:00:00'),(90,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-24 10:41:20','0000-00-00 00:00:00'),(91,'user2',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-24 12:33:42','0000-00-00 00:00:00'),(92,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-25 09:47:52','0000-00-00 00:00:00'),(93,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-25 10:02:30','0000-00-00 00:00:00'),(94,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-25 10:12:41','0000-00-00 00:00:00'),(95,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-27 13:55:22','0000-00-00 00:00:00'),(96,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-02-27 13:59:56','0000-00-00 00:00:00'),(97,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 07:41:41','0000-00-00 00:00:00'),(98,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 08:13:13','0000-00-00 00:00:00'),(99,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 09:20:14','0000-00-00 00:00:00'),(100,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 09:48:48','0000-00-00 00:00:00'),(101,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 11:43:56','0000-00-00 00:00:00'),(102,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 12:01:53','0000-00-00 00:00:00'),(103,'user1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-02 12:12:50','0000-00-00 00:00:00'),(104,'user100',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-03 09:02:53','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_data_objects`
--

DROP TABLE IF EXISTS `agents_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_data_objects` (
  `data_object_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with data objects in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_data_objects`
--

LOCK TABLES `agents_data_objects` WRITE;
/*!40000 ALTER TABLE `agents_data_objects` DISABLE KEYS */;
INSERT INTO `agents_data_objects` VALUES (2,2,1,0),(3,2,1,0),(4,2,1,0),(5,2,1,0),(6,2,1,0),(7,2,1,0),(8,2,1,0),(9,2,1,0),(10,2,1,0),(11,2,1,0),(12,2,1,0),(13,2,1,0),(14,2,1,0),(15,2,1,0),(16,2,1,0),(17,2,1,0),(18,2,1,0),(19,2,1,0),(20,2,1,0),(21,2,1,0),(22,2,1,0),(23,2,1,0),(24,2,1,0),(25,2,1,0),(26,2,1,0),(27,2,1,0),(28,2,1,0),(29,2,1,0),(30,2,1,0),(31,2,1,0),(32,2,1,0),(33,2,1,0),(34,2,1,0),(35,2,1,0),(36,2,1,0),(37,2,1,0),(38,2,1,0),(39,2,1,0),(40,2,1,0),(41,2,1,0),(42,2,1,0),(43,2,1,0),(44,2,1,0),(45,2,1,0),(46,2,1,0),(47,2,1,0),(48,2,1,0),(49,2,1,0),(50,2,1,0),(51,2,1,0),(52,2,1,0),(53,2,1,0),(54,2,1,0),(55,2,1,0),(56,2,1,0),(57,2,1,0),(58,2,1,0),(59,2,1,0),(60,2,1,0),(61,2,1,0),(62,2,1,0),(63,2,1,0),(64,2,1,0),(65,2,1,0),(66,2,1,0),(67,2,1,0),(68,2,1,0),(69,2,1,0),(70,2,1,0),(71,2,1,0),(72,2,1,0),(73,2,1,0),(74,2,1,0),(75,2,1,0),(76,2,1,0),(77,2,1,0),(78,2,1,0),(79,2,1,0),(80,2,1,0),(81,2,1,0),(82,2,1,0),(83,2,1,0),(84,2,1,0),(85,2,1,0),(86,2,1,0),(87,2,1,0),(88,2,1,0),(89,2,1,0),(92,10,1,0),(93,10,1,0),(94,10,1,0),(95,10,1,0),(96,10,1,0),(97,10,1,0),(98,10,1,0),(99,10,1,0),(100,10,1,0),(101,2,1,0),(102,2,1,0),(103,2,1,0),(104,2,1,0),(105,2,1,0),(106,2,1,0),(107,2,1,0),(108,2,1,0),(109,2,1,0),(110,2,1,0),(111,2,1,0),(112,2,1,0),(113,2,1,0),(114,2,1,0),(115,2,1,0),(116,2,1,0),(117,2,1,0),(118,2,1,0),(119,2,1,0),(120,2,1,0),(121,2,1,0),(122,2,1,0),(123,2,1,0),(124,2,1,0),(125,2,1,0),(126,2,1,0),(127,2,1,0),(128,2,1,0),(129,2,1,0),(130,2,1,0),(131,2,1,0),(132,2,1,0),(133,2,1,0),(134,2,1,0),(135,2,1,0),(136,2,1,0),(137,2,1,0),(138,2,1,0),(139,2,1,0),(140,2,1,0),(141,2,1,0),(142,2,1,0),(143,2,1,0),(144,2,1,0),(145,2,1,0),(146,2,1,0),(147,2,1,0),(148,2,1,0),(149,2,1,0),(150,2,1,0),(151,2,1,0),(152,2,1,0),(153,2,1,0),(154,2,1,0),(155,2,1,0),(156,2,1,0),(157,2,1,0),(158,2,1,0),(159,2,1,0),(160,2,1,0),(161,2,1,0),(162,2,1,0),(163,2,1,0),(164,2,1,0),(165,2,1,0),(166,2,1,0),(167,2,1,0),(168,2,1,0),(169,2,1,0),(170,2,1,0),(171,2,1,0),(172,2,1,0),(173,2,1,0),(174,2,1,0),(175,2,1,0),(176,2,1,0),(177,2,1,0),(178,2,1,0),(179,2,1,0),(180,2,1,0),(181,2,1,0),(182,2,1,0),(183,2,1,0),(184,2,1,0),(185,2,1,0),(186,2,1,0),(187,2,1,0),(188,2,1,0),(189,2,1,0),(190,2,1,0),(191,2,1,0),(192,2,1,0),(193,2,1,0),(194,2,1,0),(195,2,1,0),(196,2,1,0),(197,2,1,0),(198,2,1,0),(199,2,1,0),(200,2,1,0),(201,2,1,0),(202,2,1,0),(203,2,1,0),(204,2,1,0),(205,2,1,0),(206,2,1,0),(207,2,1,0),(208,2,1,0),(209,2,1,0),(210,2,1,0),(211,2,1,0),(212,2,1,0),(213,2,1,0),(214,2,1,0),(215,2,1,0),(216,2,1,0),(217,2,1,0),(218,2,1,0),(219,2,1,0),(220,2,1,0),(221,2,1,0),(222,2,1,0),(223,2,1,0),(224,2,1,0),(225,2,1,0),(226,2,1,0),(227,2,1,0),(228,2,1,0),(229,2,1,0),(230,2,1,0),(231,2,1,0),(232,2,1,0),(233,2,1,0),(234,2,1,0),(235,2,1,0);
/*!40000 ALTER TABLE `agents_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_hierarchy_entries`
--

DROP TABLE IF EXISTS `agents_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_hierarchy_entries` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with hierarchy entries in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_hierarchy_entries`
--

LOCK TABLES `agents_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `agents_hierarchy_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `agents_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_synonyms`
--

DROP TABLE IF EXISTS `agents_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents_synonyms` (
  `synonym_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `view_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`synonym_id`,`agent_id`,`agent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agents are associated with synonyms in various roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_synonyms`
--

LOCK TABLES `agents_synonyms` WRITE;
/*!40000 ALTER TABLE `agents_synonyms` DISABLE KEYS */;
INSERT INTO `agents_synonyms` VALUES (1,1,4,1),(2,2,4,1),(3,1,4,1),(4,2,4,1),(5,1,4,1),(6,2,4,1),(7,1,4,1),(8,2,4,1),(9,1,4,1),(10,2,4,1),(11,1,4,1),(12,2,4,1),(13,1,4,1),(14,2,4,1),(15,2,4,1),(16,2,4,1),(17,2,4,1),(18,2,4,1),(19,2,4,1),(20,1,4,1),(21,2,4,1),(22,1,4,1),(23,1,4,1),(24,2,4,1),(25,2,4,1),(26,1,4,1),(27,1,4,1),(28,2,4,1),(29,2,4,1),(30,2,4,1),(31,1,4,1),(32,2,4,1),(33,1,4,1),(34,2,4,1),(35,1,4,1),(36,2,4,1),(37,1,4,1),(38,2,4,1),(39,1,4,1),(40,2,4,1),(41,1,4,1),(42,2,4,1),(43,1,4,1),(44,2,4,1),(45,1,4,1),(46,2,4,1),(47,1,4,1),(48,2,4,1),(49,1,4,1),(50,1,4,1),(51,2,4,1),(52,2,4,1),(53,2,4,1),(54,2,4,1),(55,2,4,1),(56,2,4,1),(57,2,4,1),(58,2,4,1),(59,2,4,1),(60,2,4,1),(61,1,4,1),(62,2,4,1),(63,1,4,1),(64,2,4,1),(65,1,4,1),(66,2,4,1),(67,1,4,1),(68,2,4,1),(69,1,4,1);
/*!40000 ALTER TABLE `agents_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Controlled list for determining the "expertise" of a data object';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
INSERT INTO `audiences` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences_data_objects`
--

DROP TABLE IF EXISTS `audiences_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences_data_objects` (
  `data_object_id` int(10) unsigned NOT NULL,
  `audience_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`audience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A data object can have zero to many target audiences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences_data_objects`
--

LOCK TABLES `audiences_data_objects` WRITE;
/*!40000 ALTER TABLE `audiences_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiences_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canonical_forms`
--

DROP TABLE IF EXISTS `canonical_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canonical_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(300) NOT NULL COMMENT 'a canonical form of a scientific name is the name parts without authorship, rank information, or anthing except the latinized name parts. These are for the most part algorithmically generated',
  `name_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `string` (`string`(255)),
  KEY `index_canonical_forms_on_name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='Every name string has one canonical form - a simplified version of the string';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canonical_forms`
--

LOCK TABLES `canonical_forms` WRITE;
/*!40000 ALTER TABLE `canonical_forms` DISABLE KEYS */;
INSERT INTO `canonical_forms` VALUES (1,'Estasperioreseli etquidemis',NULL),(2,'Animalia',NULL),(3,'Animals',NULL),(4,'Autrecusandaees repudiandaeica',NULL),(5,'ravenous clover',NULL),(6,'Nihileri voluptasus',NULL),(7,'red suntus',NULL),(8,'Dignissimosii inutes',NULL),(9,'darning needle',NULL),(10,'Fugais utharumatus',NULL),(11,'tiger',NULL),(12,'Minuseli ullamens',NULL),(13,'Tiger moth',NULL),(14,'Dignissimosatus nobisosyne',NULL),(15,'Tiger lilly',NULL),(16,'Tiger water lilly',NULL),(17,'lilly of the tiger',NULL),(18,'Tiger flower',NULL),(19,'Tiger-stripe lilly',NULL),(20,'Tiger-eye lilly',NULL),(21,'Expeditaalia evenietelia',NULL),(22,'Earumeles beataeata',NULL),(23,'Culpaensis sapienteesi',NULL),(24,'frizzlebek',NULL),(25,'Utomnisesi sequialis',NULL),(26,'purple dust crab',NULL),(27,'Autaliquideri minimais',NULL),(28,'Autema officiaalius',NULL),(29,'Etconsequaturelia autenimalia',NULL),(30,'wumpus',NULL),(31,'wompus',NULL),(32,'wampus',NULL),(33,'Eukaryota',NULL),(34,'eukaryotes',NULL),(35,'Metazoa',NULL),(36,'opisthokonts',NULL),(37,'Quoautesi natuseri',NULL),(38,'cloud swallow',NULL),(39,'Voluptatumeri esseensis',NULL),(40,'spiny possom',NULL),(41,'Ameti maioresis',NULL),(42,'common desert mouse',NULL),(43,'Ipsamalius distinctioerox',NULL),(44,'fisher',NULL),(45,'Maximees veritatisatus',NULL),(46,'chartruse turtle',NULL),(47,'Molestiaeus rationealia',NULL),(48,'horny toad',NULL),(49,'Fugitens dolorealius',NULL),(50,'scarlet vermillion',NULL),(51,'Quisquamator sequieles',NULL),(52,'Mozart\'s nemesis',NULL),(53,'Bacteria',NULL),(54,'bugs',NULL),(55,'grime',NULL),(56,'critters',NULL),(57,'bakteria',NULL),(58,'die buggen',NULL),(59,'das greim',NULL),(60,'baseteir',NULL),(61,'le grimme',NULL),(62,'ler petit bugge',NULL),(63,'Essees eaqueata',NULL),(64,'quick brown fox',NULL),(65,'Animiens atdoloribuseron',NULL),(66,'painted horse',NULL),(67,'Adaliasii iurea',NULL),(68,'thirsty aphid',NULL),(69,'Nonnumquamerus numquamerus',NULL),(70,'bloody eel',NULL);
/*!40000 ALTER TABLE `canonical_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeable_object_types`
--

DROP TABLE IF EXISTS `changeable_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeable_object_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ch_object_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeable_object_types`
--

LOCK TABLES `changeable_object_types` WRITE;
/*!40000 ALTER TABLE `changeable_object_types` DISABLE KEYS */;
INSERT INTO `changeable_object_types` VALUES (1,'comment','2014-02-20 10:44:11','2014-02-20 10:44:11'),(2,'data_object','2014-02-20 10:44:11','2014-02-20 10:44:11'),(3,'synonym','2014-02-20 10:44:11','2014-02-20 10:44:11'),(4,'taxon_concept_name','2014-02-20 10:44:11','2014-02-20 10:44:11'),(5,'tag','2014-02-20 10:44:11','2014-02-20 10:44:11'),(6,'users_data_object','2014-02-20 10:44:11','2014-02-20 10:44:11'),(7,'hierarchy_entry','2014-02-20 10:44:11','2014-02-20 10:44:11'),(8,'curated_data_objects_hierarchy_entry','2014-02-20 10:44:11','2014-02-20 10:44:11'),(9,'data_objects_hierarchy_entry','2014-02-20 10:44:11','2014-02-20 10:44:11'),(10,'users_submitted_text','2014-02-20 10:44:11','2014-02-20 10:44:11'),(11,'curated_taxon_concept_preferred_entry','2014-02-20 10:44:11','2014-02-20 10:44:11'),(12,'taxon_concept','2014-02-20 10:44:11','2014-02-20 10:44:11'),(13,'classification_curation','2014-02-20 10:44:11','2014-02-20 10:44:11'),(14,'data_point_uri','2014-02-20 10:44:11','2014-02-20 10:44:11'),(15,'user_added_data','2014-02-20 10:44:11','2014-02-20 10:44:11');
/*!40000 ALTER TABLE `changeable_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_curations`
--

DROP TABLE IF EXISTS `classification_curations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_curations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exemplar_id` int(11) DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `forced` tinyint(1) DEFAULT NULL,
  `error` varchar(256) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_curations`
--

LOCK TABLES `classification_curations` WRITE;
/*!40000 ALTER TABLE `classification_curations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_curations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items`
--

DROP TABLE IF EXISTS `collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `collected_item_type` varchar(32) DEFAULT NULL,
  `collected_item_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `annotation` text,
  `added_by_user_id` int(11) unsigned DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id_object_type_object_id` (`collection_id`,`collected_item_type`,`collected_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items`
--

LOCK TABLES `collection_items` WRITE;
/*!40000 ALTER TABLE `collection_items` DISABLE KEYS */;
INSERT INTO `collection_items` VALUES (1,'Test Data Object','DataObject',236,5709,'2014-02-20 10:46:36','2014-02-20 10:46:36',NULL,NULL,NULL),(3,NULL,'Collection',5709,5722,'2014-02-26 09:47:43','2014-02-26 09:47:43',NULL,NULL,NULL),(4,NULL,'Collection',5709,5724,'2014-02-26 09:47:43','2014-02-26 09:47:43',NULL,NULL,NULL);
/*!40000 ALTER TABLE `collection_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items_collection_jobs`
--

DROP TABLE IF EXISTS `collection_items_collection_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items_collection_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_item_id` int(11) NOT NULL,
  `collection_job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `join_index` (`collection_item_id`,`collection_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items_collection_jobs`
--

LOCK TABLES `collection_items_collection_jobs` WRITE;
/*!40000 ALTER TABLE `collection_items_collection_jobs` DISABLE KEYS */;
INSERT INTO `collection_items_collection_jobs` VALUES (1,3,2);
/*!40000 ALTER TABLE `collection_items_collection_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_items_refs`
--

DROP TABLE IF EXISTS `collection_items_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_items_refs` (
  `collection_item_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_items_refs`
--

LOCK TABLES `collection_items_refs` WRITE;
/*!40000 ALTER TABLE `collection_items_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_items_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_jobs`
--

DROP TABLE IF EXISTS `collection_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(8) NOT NULL,
  `user_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `item_count` int(11) DEFAULT NULL,
  `all_items` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `finished_at` datetime DEFAULT NULL,
  `overwrite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_jobs`
--

LOCK TABLES `collection_jobs` WRITE;
/*!40000 ALTER TABLE `collection_jobs` DISABLE KEYS */;
INSERT INTO `collection_jobs` VALUES (1,'remove',83,5723,NULL,1,'2014-02-25 13:46:54','2014-02-25 13:46:54',NULL,0),(2,'copy',83,5722,NULL,0,'2014-02-26 12:15:58','2014-02-26 12:15:58',NULL,0);
/*!40000 ALTER TABLE `collection_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_jobs_collections`
--

DROP TABLE IF EXISTS `collection_jobs_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_jobs_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) DEFAULT NULL,
  `collection_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_jobs_collections_index` (`collection_id`,`collection_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_jobs_collections`
--

LOCK TABLES `collection_jobs_collections` WRITE;
/*!40000 ALTER TABLE `collection_jobs_collections` DISABLE KEYS */;
INSERT INTO `collection_jobs_collections` VALUES (1,5724,2);
/*!40000 ALTER TABLE `collection_jobs_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types`
--

DROP TABLE IF EXISTS `collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `lft` smallint(5) unsigned DEFAULT NULL,
  `rgt` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft` (`lft`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types`
--

LOCK TABLES `collection_types` WRITE;
/*!40000 ALTER TABLE `collection_types` DISABLE KEYS */;
INSERT INTO `collection_types` VALUES (1,0,0,1),(2,0,2,3),(3,0,4,9),(4,3,5,6),(5,3,7,8),(6,0,10,17),(7,6,11,12),(8,6,13,14),(9,6,15,16),(10,0,18,19),(11,0,20,21);
/*!40000 ALTER TABLE `collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types_collections`
--

DROP TABLE IF EXISTS `collection_types_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types_collections` (
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `collection_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`collection_type_id`,`collection_id`),
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types_collections`
--

LOCK TABLES `collection_types_collections` WRITE;
/*!40000 ALTER TABLE `collection_types_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_types_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_types_hierarchies`
--

DROP TABLE IF EXISTS `collection_types_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_types_hierarchies` (
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `hierarchy_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`collection_type_id`,`hierarchy_id`),
  KEY `collection_id` (`hierarchy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_types_hierarchies`
--

LOCK TABLES `collection_types_hierarchies` WRITE;
/*!40000 ALTER TABLE `collection_types_hierarchies` DISABLE KEYS */;
INSERT INTO `collection_types_hierarchies` VALUES (1,1),(2,1),(4,14),(9,14),(11,14),(7,15),(10,15);
/*!40000 ALTER TABLE `collection_types_hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `special_collection_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `description` text,
  `sort_style_id` int(11) DEFAULT NULL,
  `relevance` tinyint(4) DEFAULT '1',
  `view_style_id` int(11) DEFAULT NULL,
  `show_references` tinyint(1) DEFAULT '1',
  `collection_items_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5735 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'Iucn Reinger\'s Watch List',2,1,'2014-02-20 10:44:04','2014-02-20 10:44:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(2,'Janie Jacobs\'s Watch List',2,1,'2014-02-20 10:44:04','2014-02-20 10:44:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(3,'Helmer Crona\'s Watch List',2,1,'2014-02-20 10:44:05','2014-02-20 10:44:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(4,'Ahmad Murphy\'s Watch List',2,1,'2014-02-20 10:44:21','2014-02-20 10:44:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5,'Roxane Connelly\'s Watch List',2,1,'2014-02-20 10:44:31','2014-02-20 10:44:31',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(6,'Mariana Runolfsson\'s Watch List',2,1,'2014-02-20 10:44:33','2014-02-20 10:44:33',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(7,'Joshuah Ernser\'s Watch List',2,1,'2014-02-20 10:44:33','2014-02-20 10:44:33',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(8,'Antonia Nolan\'s Watch List',2,1,'2014-02-20 10:44:40','2014-02-20 10:44:40',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(9,'Eugene Mosciski\'s Watch List',2,1,'2014-02-20 10:44:40','2014-02-20 10:44:40',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(10,'Kaitlin Larkin\'s Watch List',2,1,'2014-02-20 10:44:44','2014-02-20 10:44:44',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(11,'Otho Willms\'s Watch List',2,1,'2014-02-20 10:44:45','2014-02-20 10:44:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(12,'Camila Deckow\'s Watch List',2,1,'2014-02-20 10:44:49','2014-02-20 10:44:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(13,'Colt Stracke\'s Watch List',2,1,'2014-02-20 10:44:49','2014-02-20 10:44:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(14,'Mathew Deckow\'s Watch List',2,1,'2014-02-20 10:44:53','2014-02-20 10:44:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(15,'Electa Na\'s Watch List',2,1,'2014-02-20 10:44:53','2014-02-20 10:44:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(16,'Damaris Torphy\'s Watch List',2,1,'2014-02-20 10:44:57','2014-02-20 10:44:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(17,'Aidan Mills\'s Watch List',2,1,'2014-02-20 10:44:57','2014-02-20 10:44:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(18,'Dora Pollich\'s Watch List',2,1,'2014-02-20 10:45:02','2014-02-20 10:45:02',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(19,'Emmanuelle Beatty\'s Watch List',2,1,'2014-02-20 10:45:03','2014-02-20 10:45:03',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(20,'Sam Hettinger\'s Watch List',2,1,'2014-02-20 10:45:04','2014-02-20 10:45:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(21,'Betty Okuneva\'s Watch List',2,1,'2014-02-20 10:45:04','2014-02-20 10:45:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(22,'Reuben Olson\'s Watch List',2,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(23,'Ashley West\'s Watch List',2,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(24,'Vicente Schowalter\'s Watch List',2,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(25,'Heber Hill\'s Watch List',2,1,'2014-02-20 10:45:06','2014-02-20 10:45:06',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(26,'Maybell Schneider\'s Watch List',2,1,'2014-02-20 10:45:06','2014-02-20 10:45:06',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(27,'Okey Mc Cullough\'s Watch List',2,1,'2014-02-20 10:45:11','2014-02-20 10:45:11',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(28,'Leonardo Schamberger\'s Watch List',2,1,'2014-02-20 10:45:11','2014-02-20 10:45:11',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(29,'Gerhard Bode\'s Watch List',2,1,'2014-02-20 10:45:13','2014-02-20 10:45:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(30,'Cicero Stehr\'s Watch List',2,1,'2014-02-20 10:45:13','2014-02-20 10:45:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(31,'Maritza Kuhic\'s Watch List',2,1,'2014-02-20 10:45:15','2014-02-20 10:45:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(32,'Wyatt Hansen\'s Watch List',2,1,'2014-02-20 10:45:16','2014-02-20 10:45:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(33,'Ming Spencer\'s Watch List',2,1,'2014-02-20 10:45:16','2014-02-20 10:45:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(34,'Ralph Wiggum\'s Watch List',2,1,'2014-02-20 10:45:20','2014-02-20 10:45:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(35,'Benton Corwin\'s Watch List',2,1,'2014-02-20 10:45:20','2014-02-20 10:45:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(36,'Rosalia Toy\'s Watch List',2,1,'2014-02-20 10:45:21','2014-02-20 10:45:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(37,'Admin User\'s Watch List',2,1,'2014-02-20 10:45:21','2014-02-20 10:45:21',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(38,'Christie Ankunding\'s Watch List',2,1,'2014-02-20 10:45:23','2014-02-20 10:45:23',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(39,'Madelynn Beatty\'s Watch List',2,1,'2014-02-20 10:45:23','2014-02-20 10:45:23',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(40,'Jeramie Botsford\'s Watch List',2,1,'2014-02-20 10:45:27','2014-02-20 10:45:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(41,'Test Curator\'s Watch List',2,1,'2014-02-20 10:45:27','2014-02-20 10:45:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(42,'Duane Leuschke\'s Watch List',2,1,'2014-02-20 10:45:29','2014-02-20 10:45:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(43,'Herbert Senger\'s Watch List',2,1,'2014-02-20 10:45:29','2014-02-20 10:45:29',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(44,'Rolfe Luettgen\'s Watch List',2,1,'2014-02-20 10:45:30','2014-02-20 10:45:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(45,'Kali Lubowitz\'s Watch List',2,1,'2014-02-20 10:45:34','2014-02-20 10:45:34',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(46,'Jacky Welch\'s Watch List',2,1,'2014-02-20 10:45:34','2014-02-20 10:45:34',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(47,'Marilie Harvey\'s Watch List',2,1,'2014-02-20 10:45:38','2014-02-20 10:45:38',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(48,'Jon Schultz\'s Watch List',2,1,'2014-02-20 10:45:39','2014-02-20 10:45:39',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(49,'Rachel Keebler\'s Watch List',2,1,'2014-02-20 10:45:43','2014-02-20 10:45:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(50,'Scot Hudson\'s Watch List',2,1,'2014-02-20 10:45:43','2014-02-20 10:45:43',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(51,'Rhea Leffler\'s Watch List',2,1,'2014-02-20 10:45:47','2014-02-20 10:45:47',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(52,'Greta Gleason\'s Watch List',2,1,'2014-02-20 10:45:48','2014-02-20 10:45:48',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(53,'Dameon Schmidt\'s Watch List',2,1,'2014-02-20 10:45:51','2014-02-20 10:45:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(54,'Rasheed Skiles\'s Watch List',2,1,'2014-02-20 10:45:51','2014-02-20 10:45:51',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(55,'Bertrand Gleason\'s Watch List',2,1,'2014-02-20 10:45:55','2014-02-20 10:45:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(56,'Seao Cummerata\'s Watch List',2,1,'2014-02-20 10:45:55','2014-02-20 10:45:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(57,'Janif Stamm\'s Watch List',2,1,'2014-02-20 10:45:59','2014-02-20 10:45:59',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(58,'Helmes Beier\'s Watch List',2,1,'2014-02-20 10:45:59','2014-02-20 10:45:59',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(59,'Fionb Dickens\'s Watch List',2,1,'2014-02-20 10:46:04','2014-02-20 10:46:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(60,'Spences Kulas\'s Watch List',2,1,'2014-02-20 10:46:04','2014-02-20 10:46:04',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(61,'Camreo Franecki\'s Watch List',2,1,'2014-02-20 10:46:08','2014-02-20 10:46:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(62,'Ahmae Kuhic\'s Watch List',2,1,'2014-02-20 10:46:08','2014-02-20 10:46:08',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(63,'Roxanf Padberg\'s Watch List',2,1,'2014-02-20 10:46:13','2014-02-20 10:46:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(64,'Marianb Haley\'s Watch List',2,1,'2014-02-20 10:46:13','2014-02-20 10:46:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(65,'Joshuai Gorczany\'s Watch List',2,1,'2014-02-20 10:46:16','2014-02-20 10:46:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(66,'Antonib Hoeger\'s Watch List',2,1,'2014-02-20 10:46:16','2014-02-20 10:46:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(67,'Eugenf Cronio\'s Watch List',2,1,'2014-02-20 10:46:20','2014-02-20 10:46:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(68,'Kaitlio Reinges\'s Watch List',2,1,'2014-02-20 10:46:20','2014-02-20 10:46:20',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(69,'Othp Jacobt\'s Watch List',2,1,'2014-02-20 10:46:24','2014-02-20 10:46:24',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(70,'Camilb Cronb\'s Watch List',2,1,'2014-02-20 10:46:24','2014-02-20 10:46:24',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5709,'Cape Cod',NULL,1,'2014-02-20 10:46:35','2014-02-20 10:46:36',NULL,NULL,NULL,0,NULL,9,1,NULL,1,1),(5710,'Colu Parisiao\'s Watch List',2,1,'2014-02-20 10:46:36','2014-02-20 10:46:36',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5711,'Mathex Bergstron\'s Watch List',2,1,'2014-02-20 10:46:55','2014-02-27 12:14:30',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5712,'Electb Rhyt\'s Watch List',2,1,'2014-02-20 10:46:55','2014-02-20 10:46:55',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5713,'User1\'s Watch List',2,1,'2014-02-20 13:31:28','2014-02-20 13:31:28',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5714,'User1\'s Watch List',2,1,'2014-02-23 07:12:16','2014-02-23 07:12:16',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5715,'User100\'s Watch List',2,1,'2014-02-23 08:17:23','2014-02-23 08:17:23',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5716,'Walaa Elsayed\'s Watch List',2,1,'2014-02-23 08:33:59','2014-02-23 09:01:13',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5717,'Walaa Elsayed\'s Watch List',2,1,'2014-02-23 13:03:10','2014-02-23 13:07:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5718,'Walaa Elsayed\'s Watch List',2,1,'2014-02-24 07:10:54','2014-02-24 07:16:12',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5719,'Walaa Elsayed\'s Watch List',2,1,'2014-02-24 10:41:20','2014-02-25 07:42:45',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5720,'User1\'s Watch List',2,1,'2014-02-24 12:33:43','2014-02-25 09:47:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5721,'User1\'s Watch List',2,1,'2014-02-25 10:02:31','2014-02-25 10:02:31',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5722,'Walaa Elsayed\'s Watch List',2,1,'2014-02-25 10:12:41','2014-02-27 11:25:27',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,1),(5723,'new col',NULL,0,'2014-02-25 13:15:35','2014-02-25 13:47:12',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,1),(5724,'col',NULL,1,'2014-02-26 12:15:58','2014-02-26 12:15:58',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5725,'User1\'s Watch List',2,1,'2014-02-27 13:55:23','2014-02-27 13:55:23',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5726,'User1\'s Watch List',2,1,'2014-02-27 13:59:57','2014-02-27 13:59:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5727,'User1\'s Watch List',2,1,'2014-03-02 07:41:42','2014-03-02 07:41:42',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5728,'User1\'s Watch List',2,1,'2014-03-02 08:13:14','2014-03-02 08:13:14',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5729,'User1\'s Watch List',2,1,'2014-03-02 09:20:15','2014-03-02 09:20:15',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5730,'User1\'s Watch List',2,1,'2014-03-02 09:48:49','2014-03-02 09:48:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5731,'User1\'s Watch List',2,1,'2014-03-02 11:43:57','2014-03-02 11:43:57',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5732,'User1\'s Watch List',2,1,'2014-03-02 12:01:53','2014-03-02 12:01:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5733,'Walaa Elsayed\'s Watch List',2,1,'2014-03-02 12:12:51','2014-03-02 12:19:49',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0),(5734,'User100\'s Watch List',2,1,'2014-03-03 09:02:53','2014-03-03 09:02:53',NULL,NULL,NULL,0,NULL,NULL,1,NULL,1,0);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_communities`
--

DROP TABLE IF EXISTS `collections_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_communities` (
  `collection_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_communities`
--

LOCK TABLES `collections_communities` WRITE;
/*!40000 ALTER TABLE `collections_communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_users`
--

DROP TABLE IF EXISTS `collections_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_users` (
  `collection_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_users`
--

LOCK TABLES `collections_users` WRITE;
/*!40000 ALTER TABLE `collections_users` DISABLE KEYS */;
INSERT INTO `collections_users` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(5710,71),(5709,71),(5711,72),(5712,73),(5713,74),(5714,75),(5715,76),(5716,77),(5717,78),(5718,79),(5719,80),(5720,81),(5721,82),(5722,83),(5723,83),(5724,83),(5725,84),(5726,85),(5727,86),(5728,87),(5729,88),(5730,89),(5731,90),(5732,91),(5733,92),(5734,93);
/*!40000 ALTER TABLE `collections_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `visible_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `from_curator` tinyint(1) NOT NULL,
  `hidden` tinyint(4) DEFAULT '0',
  `reply_to_type` varchar(32) DEFAULT NULL,
  `reply_to_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_comments_on_parent_id` (`parent_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,6,7,'TaxonConcept','This is a witty comment on the Animalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:35','2014-02-20 10:44:35','2014-02-20 11:46:33',0,0,NULL,NULL,0),(2,7,7,'TaxonConcept','This is a witty comment on the Animalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:35','2014-02-20 10:44:35','2014-02-20 10:46:33',0,0,NULL,NULL,0),(3,7,2,'DataObject','Dolore consequatur vel sint rerum. Sit ab rerum velit. Aut ut delectus quia qui.','2014-02-20 10:44:36','2014-02-20 10:44:36','2014-02-20 09:46:33',0,0,NULL,NULL,0),(4,7,3,'DataObject','Veniam eum minima voluptates incidunt modi dolor consequatur. Qui tenetur officiis reiciendis minus facilis magnam. Quibusdam impedit qui repellat enim. Mollitia esse ducimus sequi.','2014-02-20 10:44:36','2014-02-20 10:44:36','2014-02-20 08:46:33',0,0,NULL,NULL,0),(5,7,7,'DataObject','Quisquam ut et illum sint rerum repudiandae. Saepe nulla quo vero repudiandae atque placeat dolores. Repellendus doloribus recusandae pariatur perspiciatis est aperiam et. Eum exercitationem neque sunt et dolores voluptatem.','2014-02-20 10:44:37','2014-02-20 10:44:37','2014-02-20 07:46:33',0,0,NULL,NULL,0),(6,7,8,'DataObject','Beatae explicabo magni veniam alias. Esse natus dolorum cupiditate sed. Est officia sit nobis illum qui officiis. Sit ut aut fuga.','2014-02-20 10:44:38','2014-02-20 10:44:38','2014-02-20 06:46:33',0,0,NULL,NULL,0),(7,7,9,'DataObject','Beatae laudantium asperiores. Facere quos iusto. Deserunt libero ipsum praesentium.','2014-02-20 10:44:38','2014-02-20 10:44:38','2014-02-20 05:46:33',0,0,NULL,NULL,0),(8,7,10,'DataObject','Est quis facilis minus optio. Qui qui in. Odio rerum ut atque dolores dignissimos sapiente quaerat.','2014-02-20 10:44:38','2014-02-20 10:44:38','2014-02-20 04:46:33',0,0,NULL,NULL,0),(9,7,8,'TaxonConcept','This is a witty comment on the Autrecusandaees repudiandaeica taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:40','2014-02-20 10:44:40','2014-02-20 03:46:33',0,0,NULL,NULL,0),(10,4,8,'TaxonConcept','This is a witty comment on the Autrecusandaees repudiandaeica taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:40','2014-02-20 10:44:40','2014-02-20 02:46:33',0,0,NULL,NULL,0),(11,9,11,'DataObject','Excepturi aut voluptatem. Expedita voluptas eius sequi. Sunt repellendus aperiam.','2014-02-20 10:44:41','2014-02-20 10:44:41','2014-02-20 01:46:33',0,0,NULL,NULL,0),(12,9,12,'DataObject','Illum voluptatem nesciunt sit sit dolorem. Aspernatur accusamus sed vel. Sed qui sapiente aut. Autem officia commodi quisquam qui. Incidunt nam similique repudiandae accusantium quia asperiores.','2014-02-20 10:44:41','2014-02-20 10:44:41','2014-02-20 00:46:33',0,0,NULL,NULL,0),(13,9,16,'DataObject','Inventore dolorum odit veritatis numquam. Nisi voluptas consectetur. Ratione assumenda vero explicabo ut. Quis non a.','2014-02-20 10:44:42','2014-02-20 10:44:42','2014-02-19 23:46:33',0,0,NULL,NULL,0),(14,9,17,'DataObject','Et in officiis vitae excepturi atque aut maiores. Et est rerum doloremque expedita. Beatae deleniti voluptatem. Et libero ipsum recusandae nobis omnis tenetur. Ea fugiat rerum qui voluptatem enim quam.','2014-02-20 10:44:42','2014-02-20 10:44:42','2014-02-19 22:46:33',0,0,NULL,NULL,0),(15,9,18,'DataObject','Perferendis eveniet nemo officia voluptas ipsam. Voluptates ex labore adipisci ut. Ut vel consequatur consequatur dolores dolorem commodi.','2014-02-20 10:44:43','2014-02-20 10:44:43','2014-02-19 21:46:33',0,0,NULL,NULL,0),(16,9,19,'DataObject','Voluptatum officia debitis qui id ab occaecati. Sed debitis earum. Velit autem dicta iste. Dolor qui similique.','2014-02-20 10:44:43','2014-02-20 10:44:43','2014-02-19 20:46:33',0,0,NULL,NULL,0),(17,8,9,'TaxonConcept','This is a witty comment on the Nihileri voluptasus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:45','2014-02-20 10:44:45','2014-02-19 19:46:33',0,0,NULL,NULL,0),(18,9,9,'TaxonConcept','This is a witty comment on the Nihileri voluptasus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:45','2014-02-20 10:44:45','2014-02-19 18:46:33',0,0,NULL,NULL,0),(19,11,20,'DataObject','Aut debitis impedit ullam dignissimos repellat est optio. Eum est nostrum molestias qui. Expedita rerum voluptas illum sapiente aut omnis.','2014-02-20 10:44:45','2014-02-20 10:44:45','2014-02-19 17:46:33',0,0,NULL,NULL,0),(20,11,21,'DataObject','Et eaque accusamus facere dolorem sint id odio. Et sequi et quis. Laboriosam quis expedita sit voluptatibus. Hic eos quisquam perferendis. Commodi voluptatem voluptates laudantium aliquid doloremque veniam.','2014-02-20 10:44:45','2014-02-20 10:44:45','2014-02-19 16:46:33',0,0,NULL,NULL,0),(21,11,25,'DataObject','Porro id esse quisquam voluptatem. Deleniti eum nulla. Minima nulla quasi voluptas repellendus commodi excepturi aliquid.','2014-02-20 10:44:46','2014-02-20 10:44:46','2014-02-19 15:46:33',0,0,NULL,NULL,0),(22,11,26,'DataObject','Optio officia laborum alias doloribus aliquid. Architecto et aut eos doloribus officia ut. Est at tempore a. Quod corporis nulla magnam doloribus saepe.','2014-02-20 10:44:47','2014-02-20 10:44:47','2014-02-19 14:46:33',0,0,NULL,NULL,0),(23,11,27,'DataObject','Est animi nesciunt. Aut quia quo voluptate. Voluptas dolore est dolor. Qui magnam nemo in ratione. Commodi perspiciatis dignissimos ut error facilis sequi dolorum.','2014-02-20 10:44:47','2014-02-20 10:44:47','2014-02-19 13:46:33',0,0,NULL,NULL,0),(24,11,28,'DataObject','Quisquam perferendis eum. Voluptates perspiciatis velit beatae. Architecto suscipit dolores illum mollitia magnam qui tempore. Vel quaerat suscipit sit.','2014-02-20 10:44:48','2014-02-20 10:44:48','2014-02-19 12:46:33',0,0,NULL,NULL,0),(25,7,10,'TaxonConcept','This is a witty comment on the Dignissimosii inutes taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:49','2014-02-20 10:44:49','2014-02-19 11:46:33',0,0,NULL,NULL,0),(26,5,10,'TaxonConcept','This is a witty comment on the Dignissimosii inutes taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:49','2014-02-20 10:44:49','2014-02-19 10:46:33',0,0,NULL,NULL,0),(27,13,29,'DataObject','Eligendi delectus aliquid quidem sit. Iusto alias ea sequi ut. Ex voluptatem quisquam repellat non temporibus. Molestiae aut dolores dicta reiciendis consequatur omnis incidunt. Odit sequi repellendus quas excepturi molestias.','2014-02-20 10:44:49','2014-02-20 10:44:49','2014-02-19 09:46:33',0,0,NULL,NULL,0),(28,13,30,'DataObject','Vitae exercitationem consequatur blanditiis repellat. Non error et placeat sed mollitia. Recusandae reprehenderit dolores. Delectus perspiciatis ratione totam dolores corrupti ducimus possimus. Quae recusandae voluptatibus nostrum excepturi eos voluptates necessitatibus.','2014-02-20 10:44:50','2014-02-20 10:44:50','2014-02-19 08:46:33',0,0,NULL,NULL,0),(29,13,34,'DataObject','Quia praesentium tempora. Enim odit similique repellendus corporis consectetur aut. Qui nisi nihil amet neque beatae et.','2014-02-20 10:44:51','2014-02-20 10:44:51','2014-02-19 07:46:33',0,0,NULL,NULL,0),(30,13,35,'DataObject','Quam vel itaque quia aut eos libero fuga. Eos provident quia occaecati. Commodi optio nemo est et quidem et magnam. Ut omnis natus earum libero deleniti quia a. Sed quia est ipsa.','2014-02-20 10:44:51','2014-02-20 10:44:51','2014-02-19 06:46:33',0,0,NULL,NULL,0),(31,13,36,'DataObject','Nulla magnam et nemo qui ipsam. Et voluptas dolorum. Officiis nesciunt soluta. Doloribus fugiat maxime dolor ab eligendi.','2014-02-20 10:44:51','2014-02-20 10:44:51','2014-02-19 05:46:33',0,0,NULL,NULL,0),(32,13,37,'DataObject','Dicta ipsum quis reiciendis. Sint soluta qui quidem non qui. Tempora a eius quis occaecati neque. Veniam nisi voluptas qui aut. Ut id voluptatem quia totam.','2014-02-20 10:44:52','2014-02-20 10:44:52','2014-02-19 04:46:33',0,0,NULL,NULL,0),(33,14,11,'TaxonConcept','This is a witty comment on the Fugais utharumatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:53','2014-02-20 10:44:53','2014-02-19 03:46:33',0,0,NULL,NULL,0),(34,15,11,'TaxonConcept','This is a witty comment on the Fugais utharumatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:53','2014-02-20 10:44:53','2014-02-19 02:46:33',0,0,NULL,NULL,0),(35,15,38,'DataObject','Maiores eligendi quos labore. Ipsam dolor ab laborum asperiores. Accusantium ut quo veritatis.','2014-02-20 10:44:54','2014-02-20 10:44:54','2014-02-19 01:46:33',0,0,NULL,NULL,0),(36,15,39,'DataObject','Ipsam minus molestiae qui velit amet facilis dolorem. Consequuntur deleniti provident consectetur ut temporibus quam. Enim dolores deleniti inventore iure porro delectus qui. Praesentium non voluptatem qui. Mollitia nobis non et nulla dolores.','2014-02-20 10:44:54','2014-02-20 10:44:54','2014-02-19 00:46:33',0,0,NULL,NULL,0),(37,15,43,'DataObject','Odit pariatur esse iure doloribus rerum ea excepturi. Nobis repudiandae dignissimos dolores possimus molestiae quia. Sint qui tenetur magnam aut accusantium. Deserunt qui sed aut voluptas doloremque libero autem.','2014-02-20 10:44:55','2014-02-20 10:44:55','2014-02-18 23:46:33',0,0,NULL,NULL,0),(38,15,44,'DataObject','Cumque est qui perferendis saepe dolores repudiandae. Dolorem recusandae eligendi qui. Sint laudantium eveniet. Nulla dolore amet quo. Veritatis corrupti exercitationem.','2014-02-20 10:44:56','2014-02-20 10:44:56','2014-02-18 22:46:33',0,0,NULL,NULL,0),(39,15,45,'DataObject','Ut iusto consectetur. Esse minus exercitationem. Tempora omnis reprehenderit aut.','2014-02-20 10:44:56','2014-02-20 10:44:56','2014-02-18 21:46:33',0,0,NULL,NULL,0),(40,15,46,'DataObject','Delectus autem est molestiae aliquid harum. Quam vel iure. Numquam illum adipisci. Dolor rem voluptatem. Numquam repellat fugiat ipsum est est.','2014-02-20 10:44:56','2014-02-20 10:44:56','2014-02-18 20:46:33',0,0,NULL,NULL,0),(41,5,12,'TaxonConcept','This is a witty comment on the Minuseli ullamens taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 19:46:33',0,0,NULL,NULL,0),(42,11,12,'TaxonConcept','This is a witty comment on the Minuseli ullamens taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 18:46:33',0,0,NULL,NULL,0),(43,17,47,'DataObject','First comment','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 17:46:33',0,0,NULL,NULL,0),(44,17,47,'DataObject','Provident aut illum sit. Ut asperiores et. Voluptatem at eum. Unde ipsum quia et veniam blanditiis consectetur.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 16:46:33',0,0,NULL,NULL,0),(45,17,47,'DataObject','Id itaque incidunt harum sequi consequatur. Consequatur perspiciatis alias molestiae est et. Suscipit omnis dolorum voluptatum est modi qui ut. Officia dolorem impedit. Dignissimos corrupti molestiae.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 15:46:33',0,0,NULL,NULL,0),(46,17,47,'DataObject','Fugiat est et consequatur cum sunt. Itaque aut quasi perferendis quae ratione nemo. Nulla maxime natus placeat.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 14:46:33',0,0,NULL,NULL,0),(47,17,47,'DataObject','Exercitationem accusantium eveniet voluptas repellendus. Perspiciatis labore est. Est dolores quo ut provident. Non nam aperiam et. Maxime modi quaerat.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 13:46:33',0,0,NULL,NULL,0),(48,17,47,'DataObject','Blanditiis reiciendis cum quaerat illum rerum rem. Quo fugit aut. Eum sint quia voluptas maxime repudiandae quaerat. Minus eveniet nulla doloremque.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 12:46:33',0,0,NULL,NULL,0),(49,17,47,'DataObject','Iure dolores perspiciatis laborum placeat quis error. Amet qui ratione tempore ut maxime. Dolores repellendus maxime id sapiente.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 11:46:33',0,0,NULL,NULL,0),(50,17,47,'DataObject','Est quaerat sit sed incidunt dicta. Excepturi neque quisquam voluptatem est eligendi id eius. Ducimus dolorem aperiam.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 10:46:33',0,0,NULL,NULL,0),(51,17,47,'DataObject','Voluptatibus ut ducimus accusamus et animi. Facilis provident dolor voluptatem. Aut voluptas non corporis voluptatem asperiores molestiae. Autem aut atque tenetur totam et aliquam quia.','2014-02-20 10:44:58','2014-02-20 10:44:58','2014-02-18 09:46:33',0,0,NULL,NULL,0),(52,17,47,'DataObject','Reiciendis officiis sit nihil molestiae eveniet. Beatae placeat iste sed iusto expedita aperiam dicta. Quia reprehenderit excepturi officiis quas praesentium esse quia. Cum ea iusto corrupti laborum veritatis eveniet. Voluptatem dolor illum asperiores suscipit alias rerum.','2014-02-20 10:44:59','2014-02-20 10:44:59','2014-02-18 08:46:33',0,0,NULL,NULL,0),(53,17,47,'DataObject','Debitis voluptatem provident dolor aut facere eligendi. Non et hic omnis facere. Consectetur facere dolor enim aliquam et. Libero qui in incidunt expedita delectus accusantium. Ratione porro quae.','2014-02-20 10:44:59','2014-02-20 10:44:59','2014-02-18 07:46:33',0,0,NULL,NULL,0),(54,17,47,'DataObject','Rerum similique voluptatem dolor porro. Omnis praesentium nobis asperiores laborum qui. Rerum officia ipsum.','2014-02-20 10:44:59','2014-02-20 10:44:59','2014-02-18 06:46:33',0,0,NULL,NULL,0),(55,17,48,'DataObject','Aliquam exercitationem earum est quis. Delectus sit ullam quis. Incidunt sed nulla.','2014-02-20 10:44:59','2014-02-20 10:44:59','2014-02-18 05:46:33',0,0,NULL,NULL,0),(56,17,49,'DataObject','Aut dolor et. Qui impedit est et voluptatem. Omnis a nulla.','2014-02-20 10:44:59','2014-02-20 10:44:59','2014-02-18 04:46:33',0,0,NULL,NULL,0),(57,17,50,'DataObject','Aspernatur officiis et dolores dolor. Dolorem incidunt reprehenderit velit. Iste excepturi vel doloremque et non aut libero. Nemo et doloribus quibusdam vel consequatur.','2014-02-20 10:44:59','2014-02-20 10:44:59','2014-02-18 03:46:33',0,0,NULL,NULL,0),(58,17,51,'DataObject','Hic nemo qui doloribus. Fuga ut autem eum eos. Voluptatem temporibus sunt vitae molestias nisi incidunt.','2014-02-20 10:45:00','2014-02-20 10:45:00','2014-02-18 02:46:33',0,0,NULL,NULL,0),(59,17,52,'DataObject','Quidem aut sed. Omnis sed quia architecto nam ipsam perspiciatis. Enim ea animi ut voluptatem.','2014-02-20 10:45:00','2014-02-20 10:45:00','2014-02-18 01:46:33',0,0,NULL,NULL,0),(60,17,53,'DataObject','Voluptatem aliquid voluptatum sit omnis ut excepturi ut. Iste ut beatae vitae quis voluptas et. Possimus cupiditate quia. Iusto dolorem adipisci incidunt quibusdam occaecati. Quam quas fugiat nemo cumque quos dolorem error.','2014-02-20 10:45:00','2014-02-20 10:45:00','2014-02-18 00:46:33',0,0,NULL,NULL,0),(61,17,54,'DataObject','Perferendis rem rerum eaque voluptates aut impedit neque. Maiores quia explicabo velit quia. Doloremque perferendis voluptatum quisquam sunt error.','2014-02-20 10:45:00','2014-02-20 10:45:00','2014-02-17 23:46:33',0,0,NULL,NULL,0),(62,17,55,'DataObject','Placeat odio amet eius. Dignissimos omnis ducimus voluptas asperiores in rerum mollitia. Ea repellat quia vel dolor aliquid.','2014-02-20 10:45:00','2014-02-20 10:45:00','2014-02-17 22:46:33',0,0,NULL,NULL,0),(63,17,59,'DataObject','Reprehenderit blanditiis veritatis aut ipsum. Animi consequatur totam amet ut. Aut reiciendis dolor quo ipsum qui culpa atque.','2014-02-20 10:45:01','2014-02-20 10:45:01','2014-02-17 21:46:33',0,0,NULL,NULL,0),(64,17,60,'DataObject','Blanditiis temporibus iure accusamus qui quis. Enim quidem accusantium et delectus et voluptatem ipsam. Quo quis laborum minus nobis. Provident et omnis eum.','2014-02-20 10:45:01','2014-02-20 10:45:01','2014-02-17 20:46:33',0,0,NULL,NULL,0),(65,17,61,'DataObject','Ipsum labore quidem accusamus. Doloribus ut rerum rerum sint. Atque explicabo dolores qui voluptas omnis. Voluptatum rerum rerum.','2014-02-20 10:45:02','2014-02-20 10:45:02','2014-02-17 19:46:33',0,0,NULL,NULL,0),(66,17,62,'DataObject','Totam et tenetur quia. Est sed nostrum rerum quia. Minus natus et. Ullam nostrum ut error. Sequi iste eius unde perferendis odit.','2014-02-20 10:45:02','2014-02-20 10:45:02','2014-02-17 18:46:33',0,0,NULL,NULL,0),(67,18,47,'DataObject','Second comment','2014-02-20 10:45:02','2014-02-20 10:45:02','2014-02-17 17:46:33',0,0,NULL,NULL,0),(68,18,47,'DataObject','Third comment','2014-02-20 10:45:02','2014-02-20 10:45:02','2014-02-17 16:46:33',0,0,NULL,NULL,0),(69,18,47,'DataObject','Forth comment','2014-02-20 10:45:02','2014-02-20 10:45:02','2014-02-17 15:46:33',0,0,NULL,NULL,0),(70,18,47,'DataObject','Fifth comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 14:46:33',0,0,NULL,NULL,0),(71,18,47,'DataObject','Sixth comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 13:46:33',0,0,NULL,NULL,0),(72,18,47,'DataObject','Seventh comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 12:46:33',0,0,NULL,NULL,0),(73,18,47,'DataObject','Eighth comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 11:46:33',0,0,NULL,NULL,0),(74,18,47,'DataObject','Nineth comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 10:46:33',0,0,NULL,NULL,0),(75,18,47,'DataObject','Tenth comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 09:46:33',0,0,NULL,NULL,0),(76,18,47,'DataObject','Eleventh comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 08:46:33',0,0,NULL,NULL,0),(77,18,47,'DataObject','Twelveth comment','2014-02-20 10:45:03','2014-02-20 10:45:03','2014-02-17 07:46:33',0,0,NULL,NULL,0),(78,26,66,'DataObject','Maxime quod adipisci consequatur. Sit maiores pariatur aut. Itaque velit omnis eum ut blanditiis.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 06:46:33',0,0,NULL,NULL,0),(79,26,66,'DataObject','Omnis qui quae reprehenderit placeat itaque ab. Vel necessitatibus hic esse ex et. Aut quam molestiae nihil laboriosam. Temporibus optio ex aperiam eum autem.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 05:46:33',0,0,NULL,NULL,0),(80,26,66,'DataObject','Cum voluptatem laboriosam magni aut impedit deserunt asperiores. Porro veniam voluptatem ratione. Non totam eos quis. Harum asperiores voluptatem autem enim velit et. Odio praesentium neque.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 04:46:33',0,0,NULL,NULL,0),(81,26,66,'DataObject','Vel laudantium illum sit. Eaque est corporis quia aut quidem at recusandae. Voluptatem ipsa repudiandae quia qui. Molestiae aut ipsum vitae. Saepe rerum vitae odit.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 03:46:33',0,0,NULL,NULL,0),(82,26,66,'DataObject','Magni ipsam qui omnis. Sint ex laudantium neque quibusdam nulla ut labore. Fugiat nisi ea. Qui qui rerum debitis. Dolorum in maiores sit reiciendis qui.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 02:46:33',0,0,NULL,NULL,0),(83,26,66,'DataObject','Distinctio quis beatae. Molestiae aspernatur dolorum. Et aut reiciendis ea laborum dolores occaecati velit. Quasi sit voluptas voluptatem ratione ipsam debitis facilis. Tempore facilis ea assumenda quo unde delectus praesentium.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 01:46:33',0,0,NULL,NULL,0),(84,26,66,'DataObject','Non ratione quisquam facere adipisci. Sint est qui assumenda id asperiores. Corrupti nam qui deleniti velit laudantium error itaque. Deleniti et ab rem culpa et pariatur.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-17 00:46:33',0,0,NULL,NULL,0),(85,26,66,'DataObject','Nulla sed ut. Quas reprehenderit molestiae veritatis deserunt temporibus nihil molestiae. Cumque dolores saepe nesciunt.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-16 23:46:33',0,0,NULL,NULL,0),(86,26,66,'DataObject','Consequatur omnis quibusdam optio. Fugit excepturi qui qui veritatis et facere incidunt. Sed nesciunt doloremque amet ipsam autem. Deleniti voluptas consequuntur.','2014-02-20 10:45:06','2014-02-20 10:45:06','2014-02-16 22:46:33',0,0,NULL,NULL,0),(87,26,66,'DataObject','Rem pariatur voluptatem fugit. Officiis est quaerat. Sit asperiores est error neque ipsa ipsam. Tenetur earum molestiae et doloremque dignissimos voluptatum. Suscipit ut et minus sint facere optio et.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 21:46:33',0,0,NULL,NULL,0),(88,26,66,'DataObject','Officiis laudantium nihil autem. Et ipsum dolorem esse. Et incidunt ad non ducimus temporibus quasi harum. Velit sed illum nihil in unde voluptatibus dicta.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 20:46:33',0,0,NULL,NULL,0),(89,26,66,'DataObject','Totam voluptatem incidunt. Vero corporis aperiam possimus sit amet placeat labore. Tempore velit quibusdam blanditiis enim et vero. Sit consequatur omnis corporis qui. Atque optio quae vitae et suscipit occaecati.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 19:46:33',0,0,NULL,NULL,0),(90,26,67,'DataObject','Atque repellat odio autem eum aliquam sunt nihil. Perspiciatis ipsam non aliquid quas. Ut officiis dolorum quidem et dolores. Tempore quas blanditiis voluptas officiis quam quisquam. Sed incidunt atque fuga consequatur.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 18:46:33',0,0,NULL,NULL,0),(91,26,68,'DataObject','Eveniet deleniti nam. Perspiciatis qui non qui. Quo autem rem consequuntur impedit autem vitae vel.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 17:46:33',0,0,NULL,NULL,0),(92,26,69,'DataObject','Omnis aliquam impedit odit alias quo non. Odit ut in dolor. Optio est molestiae quas rerum facere sequi. Similique libero quasi molestiae. Est ut et odio nisi repellendus.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 16:46:33',0,0,NULL,NULL,0),(93,26,70,'DataObject','Ut veritatis quasi aut quo. Vitae qui natus libero quaerat dicta quisquam doloribus. Et ad totam ipsa ut quo ut. Blanditiis excepturi autem sit aliquid. Deserunt quo numquam hic amet aut.','2014-02-20 10:45:07','2014-02-20 10:45:07','2014-02-16 15:46:33',0,0,NULL,NULL,0),(94,26,71,'DataObject','Consequuntur iusto est deleniti minus sed ea. Autem reprehenderit maxime quis. Deserunt autem quia et sint pariatur sit.','2014-02-20 10:45:08','2014-02-20 10:45:08','2014-02-16 14:46:33',0,0,NULL,NULL,0),(95,26,72,'DataObject','Dolorem occaecati ut eum necessitatibus. Repellat voluptatum voluptatem quasi. Dolor quisquam iste.','2014-02-20 10:45:08','2014-02-20 10:45:08','2014-02-16 13:46:33',0,0,NULL,NULL,0),(96,26,73,'DataObject','Id fuga totam quisquam deserunt corporis qui sed. Iusto consequuntur fugit quia optio sed. Porro incidunt officia tempore doloribus nobis aut.','2014-02-20 10:45:08','2014-02-20 10:45:08','2014-02-16 12:46:33',0,0,NULL,NULL,0),(97,26,74,'DataObject','Dolorem in voluptatem modi a. Voluptas beatae sed ipsam earum et ratione doloribus. Fuga ut facilis.','2014-02-20 10:45:08','2014-02-20 10:45:08','2014-02-16 11:46:33',0,0,NULL,NULL,0),(98,26,78,'DataObject','Aut fugit exercitationem nihil et est doloremque. Numquam est beatae ut. Voluptas cumque sapiente ut laborum hic totam. Et explicabo ea.','2014-02-20 10:45:09','2014-02-20 10:45:09','2014-02-16 10:46:33',0,0,NULL,NULL,0),(99,26,79,'DataObject','Sit libero non quidem ut. Esse omnis voluptas. In nemo quia cupiditate sint amet.','2014-02-20 10:45:09','2014-02-20 10:45:09','2014-02-16 09:46:33',0,0,NULL,NULL,0),(100,26,80,'DataObject','Omnis officiis est praesentium. Totam occaecati voluptatum exercitationem. Ut atque sunt aut qui laboriosam error non. Ratione non quia ea. Porro inventore tempora praesentium eum assumenda ipsam.','2014-02-20 10:45:09','2014-02-20 10:45:09','2014-02-16 08:46:33',0,0,NULL,NULL,0),(101,26,81,'DataObject','Qui est sed aut vitae consequatur quia est. Quis voluptatem et sed. Dolore enim mollitia molestiae et expedita. Vel ducimus consequatur eum consequatur iusto quos nam. Similique omnis voluptas.','2014-02-20 10:45:10','2014-02-20 10:45:10','2014-02-16 07:46:33',0,0,NULL,NULL,0),(102,28,82,'DataObject','Magni et omnis voluptatem at quaerat. Ipsa sunt deserunt aut. Corrupti qui sequi ipsa voluptatem hic sit et.','2014-02-20 10:45:11','2014-02-20 10:45:11','2014-02-16 06:46:33',0,0,NULL,NULL,0),(103,28,88,'DataObject','Quis ex alias officia quia est ullam. Neque qui ullam iure odit voluptate architecto. Veritatis enim et voluptates.','2014-02-20 10:45:13','2014-02-20 10:45:13','2014-02-16 05:46:33',0,0,NULL,NULL,0),(104,28,89,'DataObject','Veritatis vitae nobis voluptatum fugiat dignissimos consequatur. Nulla omnis harum facere nisi architecto quia enim. Fuga inventore quia et. Ad nemo dolores labore tenetur voluptatem blanditiis nihil.','2014-02-20 10:45:13','2014-02-20 10:45:13','2014-02-16 04:46:33',0,0,NULL,NULL,0),(105,1,88,'DataObject','this is a comment applied to the old overview','2014-02-20 10:45:14','2014-02-20 10:45:14','2014-02-16 03:46:33',0,0,NULL,NULL,0),(106,1,88,'DataObject','this is an invisible comment applied to the old overview',NULL,'2014-02-20 10:45:14','2014-02-16 02:46:33',0,0,NULL,NULL,0),(107,1,82,'DataObject','this is a comment applied to the old image','2014-02-20 10:45:14','2014-02-20 10:45:14','2014-02-16 01:46:33',0,0,NULL,NULL,0),(108,1,82,'DataObject','this is an invisible comment applied to the old image',NULL,'2014-02-20 10:45:14','2014-02-16 00:46:33',0,0,NULL,NULL,0),(109,1,90,'DataObject','brand new comment on the re-harvested overview','2014-02-20 10:45:15','2014-02-20 10:45:15','2014-02-15 23:46:33',0,0,NULL,NULL,0),(110,1,90,'DataObject','and an invisible comment on the re-harvested overview',NULL,'2014-02-20 10:45:15','2014-02-15 22:46:33',0,0,NULL,NULL,0),(111,1,91,'DataObject','lovely comment added after re-harvesting to the image','2014-02-20 10:45:15','2014-02-20 10:45:15','2014-02-15 21:46:33',0,0,NULL,NULL,0),(112,1,91,'DataObject','even wittier invisible comments on image after the harvest was redone.',NULL,'2014-02-20 10:45:15','2014-02-15 20:46:33',0,0,NULL,NULL,0),(113,18,18,'TaxonConcept','This is a witty comment on the Autaliquideri minimais taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:16','2014-02-20 10:45:16','2014-02-15 19:46:33',0,0,NULL,NULL,0),(114,33,92,'DataObject','Reprehenderit reiciendis et veritatis. Quia et quidem quo. Quod molestiae aspernatur est ab dicta qui dolor. Temporibus ut amet doloribus voluptatem rerum earum eveniet. Commodi veritatis cumque magnam enim.','2014-02-20 10:45:17','2014-02-20 10:45:17','2014-02-15 18:46:33',0,0,NULL,NULL,0),(115,33,93,'DataObject','Ad reiciendis repellat. Molestias dicta sit voluptatem. Tenetur et non quibusdam quod et sint. Et consequuntur numquam natus dolore omnis quia. Numquam nemo labore.','2014-02-20 10:45:17','2014-02-20 10:45:17','2014-02-15 17:46:33',0,0,NULL,NULL,0),(116,33,97,'DataObject','Consequatur libero id dignissimos impedit. Ut et voluptas qui rerum consectetur. Qui animi ducimus nam.','2014-02-20 10:45:17','2014-02-20 10:45:17','2014-02-15 16:46:33',0,0,NULL,NULL,0),(117,33,98,'DataObject','Aliquam nulla quidem porro. Delectus error qui cum laudantium. Optio molestias commodi non voluptas.','2014-02-20 10:45:18','2014-02-20 10:45:18','2014-02-15 15:46:33',0,0,NULL,NULL,0),(118,33,99,'DataObject','Voluptatem inventore minima et asperiores. Aliquid sint explicabo quis cum. Possimus ipsam delectus.','2014-02-20 10:45:18','2014-02-20 10:45:18','2014-02-15 14:46:33',0,0,NULL,NULL,0),(119,31,99,'DataObject','First comment','2014-02-20 10:45:18','2014-02-20 10:45:18','2014-02-15 13:46:33',0,0,NULL,NULL,0),(120,31,99,'DataObject','Second comment','2014-02-20 10:45:18','2014-02-20 10:45:18','2014-02-15 12:46:33',0,0,NULL,NULL,0),(121,31,99,'DataObject','Third comment','2014-02-20 10:45:18','2014-02-20 10:45:18','2014-02-15 11:46:33',0,0,NULL,NULL,0),(122,31,99,'DataObject','Forth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 10:46:33',0,0,NULL,NULL,0),(123,31,99,'DataObject','Fifth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 09:46:33',0,0,NULL,NULL,0),(124,31,99,'DataObject','Sixth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 08:46:33',0,0,NULL,NULL,0),(125,31,99,'DataObject','Seventh comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 07:46:33',0,0,NULL,NULL,0),(126,31,99,'DataObject','Eighth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 06:46:33',0,0,NULL,NULL,0),(127,31,99,'DataObject','Ninth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 05:46:33',0,0,NULL,NULL,0),(128,31,99,'DataObject','Tenth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 04:46:33',0,0,NULL,NULL,0),(129,31,99,'DataObject','Eleventh comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 03:46:33',0,0,NULL,NULL,0),(130,31,99,'DataObject','Twelfth comment','2014-02-20 10:45:19','2014-02-20 10:45:19','2014-02-15 02:46:33',0,0,NULL,NULL,0),(131,35,100,'DataObject','Sed incidunt quisquam. Dolores non perspiciatis aliquid maxime dignissimos. Culpa quia ut animi quia exercitationem earum blanditiis. Fugit omnis rerum dolores et. Deserunt dolores consectetur reiciendis eius.','2014-02-20 10:45:21','2014-02-20 10:45:21','2014-02-15 01:46:33',0,0,NULL,NULL,0),(132,11,20,'TaxonConcept','This is a witty comment on the Etconsequaturelia autenimalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:23','2014-02-20 10:45:23','2014-02-15 00:46:33',0,0,NULL,NULL,0),(133,12,20,'TaxonConcept','This is a witty comment on the Etconsequaturelia autenimalia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:23','2014-02-20 10:45:23','2014-02-14 23:46:33',0,0,NULL,NULL,0),(134,39,101,'DataObject','Aut quo voluptas. Similique officiis quas. Vero ipsa recusandae nihil distinctio explicabo. Laborum est distinctio sequi sed accusantium corporis.','2014-02-20 10:45:23','2014-02-20 10:45:23','2014-02-14 22:46:33',0,0,NULL,NULL,0),(135,39,102,'DataObject','Deserunt mollitia quam reprehenderit. Ullam odio pariatur. Quaerat rerum consequuntur laudantium molestiae ea numquam modi. Alias rerum nostrum. Error perspiciatis deserunt voluptatem ratione eum.','2014-02-20 10:45:24','2014-02-20 10:45:24','2014-02-14 21:46:33',0,0,NULL,NULL,0),(136,39,106,'DataObject','Cupiditate culpa qui. A nisi porro. Velit et est. Non quia provident.','2014-02-20 10:45:25','2014-02-20 10:45:25','2014-02-14 20:46:33',0,0,NULL,NULL,0),(137,39,107,'DataObject','Provident enim reiciendis cumque saepe. Cum aut mollitia harum. Occaecati molestiae veniam quisquam. Hic corporis at quis architecto sunt dolores non.','2014-02-20 10:45:25','2014-02-20 10:45:25','2014-02-14 19:46:33',0,0,NULL,NULL,0),(138,39,108,'DataObject','Itaque cumque aspernatur qui ipsam ad. Est exercitationem perspiciatis ipsa fugit velit. Sunt ad consequatur ea eaque et sint.','2014-02-20 10:45:26','2014-02-20 10:45:26','2014-02-14 18:46:33',0,0,NULL,NULL,0),(139,39,109,'DataObject','Rerum omnis quae. Magni quaerat error. Delectus sint eveniet consequatur ut quia.','2014-02-20 10:45:26','2014-02-20 10:45:26','2014-02-14 17:46:33',0,0,NULL,NULL,0),(140,19,21,'TaxonConcept','This is a witty comment on the Eukaryota taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:30','2014-02-20 10:45:30','2014-02-14 16:46:33',0,0,NULL,NULL,0),(141,21,21,'TaxonConcept','This is a witty comment on the Eukaryota taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:30','2014-02-20 10:45:30','2014-02-14 15:46:33',0,0,NULL,NULL,0),(142,44,110,'DataObject','Quis voluptatem aut rerum fugit ullam nostrum quisquam. Unde eum fugit doloremque voluptatum. Ipsa assumenda tenetur. Pariatur a et molestiae sit sequi.','2014-02-20 10:45:30','2014-02-20 10:45:30','2014-02-14 14:46:33',0,0,NULL,NULL,0),(143,44,111,'DataObject','Delectus voluptas voluptatem nulla. Non consectetur molestias sint et ut. Et quas numquam eius ad vitae unde.','2014-02-20 10:45:30','2014-02-20 10:45:30','2014-02-14 13:46:33',0,0,NULL,NULL,0),(144,44,115,'DataObject','Numquam sit necessitatibus corporis id. Et fugiat et est fugit optio. Autem inventore cum qui corporis. Et repellendus nisi similique iusto.','2014-02-20 10:45:31','2014-02-20 10:45:31','2014-02-14 12:46:33',0,0,NULL,NULL,0),(145,44,116,'DataObject','Saepe beatae nihil vitae libero. In non nesciunt officiis sequi molestias. Neque perferendis et accusamus autem laudantium. Explicabo nulla ipsam.','2014-02-20 10:45:32','2014-02-20 10:45:32','2014-02-14 11:46:33',0,0,NULL,NULL,0),(146,44,117,'DataObject','Qui non et facilis maxime maiores. Accusamus autem ut sunt minima ad. Dolore voluptates iste mollitia vel. Quas tenetur odio sunt. Et optio voluptate reiciendis officia.','2014-02-20 10:45:32','2014-02-20 10:45:32','2014-02-14 10:46:33',0,0,NULL,NULL,0),(147,44,118,'DataObject','Et consequatur velit non dolores et. Error aut aperiam. Consectetur hic error.','2014-02-20 10:45:33','2014-02-20 10:45:33','2014-02-14 09:46:33',0,0,NULL,NULL,0),(148,28,22,'TaxonConcept','This is a witty comment on the Quoautesi natuseri taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:34','2014-02-20 10:45:34','2014-02-14 08:46:33',0,0,NULL,NULL,0),(149,16,22,'TaxonConcept','This is a witty comment on the Quoautesi natuseri taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:34','2014-02-20 10:45:34','2014-02-14 07:46:33',0,0,NULL,NULL,0),(150,46,119,'DataObject','Porro temporibus reprehenderit non ut provident odit. Saepe iusto labore eum dignissimos sed voluptatem. Provident voluptates quia autem dolore recusandae illo rerum. Ea eum doloremque. Magni sequi omnis non accusamus ut.','2014-02-20 10:45:35','2014-02-20 10:45:35','2014-02-14 06:46:33',0,0,NULL,NULL,0),(151,46,120,'DataObject','Non impedit quia adipisci occaecati consequatur architecto ipsum. Necessitatibus quas aperiam tempora. Sed unde molestiae recusandae rerum.','2014-02-20 10:45:35','2014-02-20 10:45:35','2014-02-14 05:46:33',0,0,NULL,NULL,0),(152,46,124,'DataObject','Non assumenda nihil. Quibusdam doloribus vitae non voluptatum et. Nesciunt quibusdam recusandae consequatur. Qui sit delectus unde aut sed placeat.','2014-02-20 10:45:36','2014-02-20 10:45:36','2014-02-14 04:46:33',0,0,NULL,NULL,0),(153,46,125,'DataObject','Facere delectus asperiores molestias nobis reiciendis. Error quibusdam ea consequatur nihil et omnis nemo. Culpa voluptas nihil quibusdam laborum laboriosam voluptatum. Rerum reiciendis facere aut similique. Quos suscipit necessitatibus assumenda blanditiis sapiente.','2014-02-20 10:45:37','2014-02-20 10:45:37','2014-02-14 03:46:33',0,0,NULL,NULL,0),(154,46,126,'DataObject','Deserunt mollitia molestiae. Et magni eum hic ratione totam. Saepe dolore eos aliquid qui ipsam. Modi ratione atque molestias.','2014-02-20 10:45:37','2014-02-20 10:45:37','2014-02-14 02:46:33',0,0,NULL,NULL,0),(155,46,127,'DataObject','Dignissimos eaque doloremque voluptas non. Culpa deserunt perspiciatis quisquam debitis aut. Aut minima perferendis corrupti.','2014-02-20 10:45:37','2014-02-20 10:45:37','2014-02-14 01:46:33',0,0,NULL,NULL,0),(156,19,23,'TaxonConcept','This is a witty comment on the Voluptatumeri esseensis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:39','2014-02-20 10:45:39','2014-02-14 00:46:33',0,0,NULL,NULL,0),(157,27,23,'TaxonConcept','This is a witty comment on the Voluptatumeri esseensis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:39','2014-02-20 10:45:39','2014-02-13 23:46:33',0,0,NULL,NULL,0),(158,48,128,'DataObject','Beatae optio rerum in libero dolores qui. Quidem ea aliquid velit aut quam quo ut. Asperiores facere eius eos.','2014-02-20 10:45:39','2014-02-20 10:45:39','2014-02-13 22:46:33',0,0,NULL,NULL,0),(159,48,129,'DataObject','Quos sit harum in aliquam est quia nihil. Eius dolore reprehenderit ex laboriosam quia. Ad molestiae sint eaque quisquam quod.','2014-02-20 10:45:39','2014-02-20 10:45:39','2014-02-13 21:46:33',0,0,NULL,NULL,0),(160,48,133,'DataObject','Eum quia sunt. Nostrum eveniet dolores ullam modi. Sapiente sed quos et eum.','2014-02-20 10:45:41','2014-02-20 10:45:41','2014-02-13 20:46:33',0,0,NULL,NULL,0),(161,48,134,'DataObject','Neque occaecati in harum sapiente illo perferendis. Provident corporis pariatur sit quod sed. Animi quae neque eius. Quia id voluptatum qui. Facilis quae similique sunt blanditiis in.','2014-02-20 10:45:41','2014-02-20 10:45:41','2014-02-13 19:46:33',0,0,NULL,NULL,0),(162,48,135,'DataObject','Delectus error fugiat quos aut et. Non et odit enim unde ullam magnam. Occaecati repudiandae sed maiores corrupti labore doloribus ut.','2014-02-20 10:45:41','2014-02-20 10:45:41','2014-02-13 18:46:33',0,0,NULL,NULL,0),(163,48,136,'DataObject','Fugiat rem tempora omnis hic fuga. Aspernatur sed reiciendis. Saepe magni voluptatibus eaque molestiae et eius.','2014-02-20 10:45:42','2014-02-20 10:45:42','2014-02-13 17:46:33',0,0,NULL,NULL,0),(164,30,24,'TaxonConcept','This is a witty comment on the Ameti maioresis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:43','2014-02-20 10:45:43','2014-02-13 16:46:33',0,0,NULL,NULL,0),(165,35,24,'TaxonConcept','This is a witty comment on the Ameti maioresis taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:43','2014-02-20 10:45:43','2014-02-13 15:46:33',0,0,NULL,NULL,0),(166,50,137,'DataObject','Optio assumenda sed enim alias. Dolorum aut culpa et sunt. Sit aperiam tempore quasi. Vitae et quisquam itaque.','2014-02-20 10:45:44','2014-02-20 10:45:44','2014-02-13 14:46:33',0,0,NULL,NULL,0),(167,50,138,'DataObject','Inventore sint neque voluptates amet repellendus ad sunt. Autem est at alias atque voluptas. Veritatis rerum velit qui.','2014-02-20 10:45:44','2014-02-20 10:45:44','2014-02-13 13:46:33',0,0,NULL,NULL,0),(168,50,142,'DataObject','Enim expedita ipsa est quia labore. Ad et fugit hic magni quisquam ea. Dolores illo amet fuga aspernatur suscipit molestiae. Tempora illum est earum. Suscipit architecto quis.','2014-02-20 10:45:45','2014-02-20 10:45:45','2014-02-13 12:46:33',0,0,NULL,NULL,0),(169,50,143,'DataObject','Rem possimus voluptas quo eum aut quam voluptatum. Sit cum veritatis explicabo. Eligendi ut repudiandae. Cumque vero architecto animi sed aliquid non. Earum ea architecto inventore veniam.','2014-02-20 10:45:45','2014-02-20 10:45:45','2014-02-13 11:46:33',0,0,NULL,NULL,0),(170,50,144,'DataObject','Temporibus non inventore est a quos cumque aut. Et esse aspernatur doloremque nihil soluta asperiores temporibus. Eos quia temporibus sint nam minus velit.','2014-02-20 10:45:46','2014-02-20 10:45:46','2014-02-13 10:46:33',0,0,NULL,NULL,0),(171,50,145,'DataObject','Ut hic eaque ipsum adipisci iure occaecati. Quis commodi ut est ut ullam sed. Ut porro est et dicta.','2014-02-20 10:45:46','2014-02-20 10:45:46','2014-02-13 09:46:33',0,0,NULL,NULL,0),(172,12,25,'TaxonConcept','This is a witty comment on the Ipsamalius distinctioerox taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:48','2014-02-20 10:45:48','2014-02-13 08:46:33',0,0,NULL,NULL,0),(173,39,25,'TaxonConcept','This is a witty comment on the Ipsamalius distinctioerox taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:48','2014-02-20 10:45:48','2014-02-13 07:46:33',0,0,NULL,NULL,0),(174,52,146,'DataObject','Consequuntur et ratione dolores. Molestiae nostrum quam ea. Deleniti non iusto id. Enim reprehenderit voluptates.','2014-02-20 10:45:48','2014-02-20 10:45:48','2014-02-13 06:46:33',0,0,NULL,NULL,0),(175,52,147,'DataObject','Et nemo molestiae non aut. Sint quae ea autem dignissimos libero sit. Ut magni velit ipsa optio.','2014-02-20 10:45:48','2014-02-20 10:45:48','2014-02-13 05:46:33',0,0,NULL,NULL,0),(176,52,151,'DataObject','Dolores dignissimos consequatur dolor minima nobis recusandae ipsam. Illum maiores dignissimos maxime quos animi ducimus. Et non dolorem modi. Quasi aut et eum ducimus sunt incidunt quaerat.','2014-02-20 10:45:49','2014-02-20 10:45:49','2014-02-13 04:46:33',0,0,NULL,NULL,0),(177,52,152,'DataObject','Iure aperiam quae deleniti quasi. Voluptatem magni dignissimos quia quis repudiandae inventore. Quia et culpa et tempore non quia accusantium.','2014-02-20 10:45:49','2014-02-20 10:45:49','2014-02-13 03:46:33',0,0,NULL,NULL,0),(178,52,153,'DataObject','Ut sint beatae voluptatem. Et ut ut quisquam reprehenderit non aut. Dolores vero dolorum accusantium molestiae voluptatibus dicta.','2014-02-20 10:45:50','2014-02-20 10:45:50','2014-02-13 02:46:33',0,0,NULL,NULL,0),(179,52,154,'DataObject','Est placeat officia et autem modi labore alias. Iste voluptate corporis eius doloribus. Illo nesciunt est. Libero rerum facere nihil itaque.','2014-02-20 10:45:50','2014-02-20 10:45:50','2014-02-13 01:46:33',0,0,NULL,NULL,0),(180,44,26,'TaxonConcept','This is a witty comment on the Maximees veritatisatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:51','2014-02-20 10:45:51','2014-02-13 00:46:33',0,0,NULL,NULL,0),(181,9,26,'TaxonConcept','This is a witty comment on the Maximees veritatisatus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:51','2014-02-20 10:45:51','2014-02-12 23:46:33',0,0,NULL,NULL,0),(182,54,155,'DataObject','Dolorem et excepturi. Aut voluptas ut consequuntur ex quod et. Numquam eligendi nesciunt.','2014-02-20 10:45:52','2014-02-20 10:45:52','2014-02-12 22:46:33',0,0,NULL,NULL,0),(183,54,156,'DataObject','Autem totam minima eum itaque dolorem et quis. Ea dolorem illum voluptate. Voluptas nam reiciendis est similique. Soluta nostrum eveniet.','2014-02-20 10:45:52','2014-02-20 10:45:52','2014-02-12 21:46:33',0,0,NULL,NULL,0),(184,54,160,'DataObject','Vero exercitationem maiores molestias. Placeat dicta veritatis. Rerum dolores iusto est.','2014-02-20 10:45:53','2014-02-20 10:45:53','2014-02-12 20:46:33',0,0,NULL,NULL,0),(185,54,161,'DataObject','Inventore vitae quibusdam ratione libero consequatur. Numquam quae quisquam est nulla. Et ut et excepturi illum quia atque. Dolores et numquam modi natus quia nostrum.','2014-02-20 10:45:54','2014-02-20 10:45:54','2014-02-12 19:46:33',0,0,NULL,NULL,0),(186,54,162,'DataObject','Exercitationem commodi perferendis doloribus sit sit aperiam atque. Occaecati est ut architecto nobis voluptas quia. Molestiae sequi nisi sit exercitationem praesentium ipsam.','2014-02-20 10:45:54','2014-02-20 10:45:54','2014-02-12 18:46:33',0,0,NULL,NULL,0),(187,54,163,'DataObject','Voluptas neque dolorum aspernatur dolor dicta. At placeat numquam. Repellendus nemo est delectus omnis.','2014-02-20 10:45:55','2014-02-20 10:45:55','2014-02-12 17:46:33',0,0,NULL,NULL,0),(188,22,27,'TaxonConcept','This is a witty comment on the Molestiaeus rationealia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:56','2014-02-20 10:45:56','2014-02-12 16:46:33',0,0,NULL,NULL,0),(189,5,27,'TaxonConcept','This is a witty comment on the Molestiaeus rationealia taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:56','2014-02-20 10:45:56','2014-02-12 15:46:33',0,0,NULL,NULL,0),(190,56,164,'DataObject','Fuga qui et sed. Nam voluptatem veniam ea. Vitae ad autem.','2014-02-20 10:45:56','2014-02-20 10:45:56','2014-02-12 14:46:33',0,0,NULL,NULL,0),(191,56,165,'DataObject','Dolor vero laudantium deserunt numquam. Autem porro vero fugiat esse. Quia eum qui sint enim itaque ut.','2014-02-20 10:45:56','2014-02-20 10:45:56','2014-02-12 13:46:33',0,0,NULL,NULL,0),(192,56,169,'DataObject','Magnam est qui aut corporis accusantium earum incidunt. A illo porro maiores neque odio. Fugiat nostrum consequatur praesentium iste deserunt expedita cupiditate. Harum aut nam hic fugiat. Sequi facere quo autem unde.','2014-02-20 10:45:57','2014-02-20 10:45:57','2014-02-12 12:46:33',0,0,NULL,NULL,0),(193,56,170,'DataObject','Eum ex commodi eaque esse debitis et quia. Facilis corrupti magnam harum et deserunt aut. Explicabo sit facere ipsam qui omnis quidem voluptas. Consequatur eos aut.','2014-02-20 10:45:57','2014-02-20 10:45:57','2014-02-12 11:46:33',0,0,NULL,NULL,0),(194,56,171,'DataObject','Ipsam eum at quia tenetur quisquam. Modi est ut eos. Vel aut quia saepe velit voluptate aut. Autem impedit aperiam placeat. Ut voluptatum culpa excepturi iste nisi voluptas.','2014-02-20 10:45:58','2014-02-20 10:45:58','2014-02-12 10:46:33',0,0,NULL,NULL,0),(195,56,172,'DataObject','Vel ipsum consectetur excepturi. Velit numquam blanditiis asperiores ullam atque. Dolorum modi voluptatum magni sapiente voluptates.','2014-02-20 10:45:58','2014-02-20 10:45:58','2014-02-12 09:46:33',0,0,NULL,NULL,0),(196,47,28,'TaxonConcept','This is a witty comment on the Fugitens dolorealius taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:59','2014-02-20 10:45:59','2014-02-12 08:46:33',0,0,NULL,NULL,0),(197,12,28,'TaxonConcept','This is a witty comment on the Fugitens dolorealius taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:45:59','2014-02-20 10:45:59','2014-02-12 07:46:33',0,0,NULL,NULL,0),(198,58,173,'DataObject','Qui earum quo qui. Quas iste facilis. Esse aliquam ut ut dolorem inventore.','2014-02-20 10:45:59','2014-02-20 10:45:59','2014-02-12 06:46:33',0,0,NULL,NULL,0),(199,58,174,'DataObject','Ullam ut similique nobis et eveniet. Corporis illo unde consequatur ad voluptate. Aliquam quidem deleniti. Molestias voluptas sit labore sint delectus minus. Aut exercitationem omnis et illum culpa dicta.','2014-02-20 10:46:00','2014-02-20 10:46:00','2014-02-12 05:46:33',0,0,NULL,NULL,0),(200,58,178,'DataObject','Et rem ab molestiae non necessitatibus aut accusamus. Aut a perspiciatis ut rerum. Perspiciatis quae id sunt qui reiciendis aliquam nam.','2014-02-20 10:46:01','2014-02-20 10:46:01','2014-02-12 04:46:33',0,0,NULL,NULL,0),(201,58,179,'DataObject','Error rerum tenetur rem officia inventore. Aut similique vel voluptate. Adipisci quod quis esse aut voluptatem.','2014-02-20 10:46:02','2014-02-20 10:46:02','2014-02-12 03:46:33',0,0,NULL,NULL,0),(202,58,180,'DataObject','Distinctio sapiente voluptas iste ducimus. Maiores nemo tenetur aut praesentium reprehenderit rem quidem. Vel dolorem esse. Dolor libero in facilis. Eos recusandae cum delectus ipsum dignissimos.','2014-02-20 10:46:02','2014-02-20 10:46:02','2014-02-12 02:46:33',0,0,NULL,NULL,0),(203,58,181,'DataObject','Quae magnam atque tenetur cumque. Dolore ipsam labore ipsum aut odit et. Illum maxime consectetur sed et.','2014-02-20 10:46:03','2014-02-20 10:46:03','2014-02-12 01:46:33',0,0,NULL,NULL,0),(204,48,29,'TaxonConcept','This is a witty comment on the Quisquamator sequieles taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:04','2014-02-20 10:46:04','2014-02-12 00:46:33',0,0,NULL,NULL,0),(205,17,29,'TaxonConcept','This is a witty comment on the Quisquamator sequieles taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:04','2014-02-20 10:46:04','2014-02-11 23:46:33',0,0,NULL,NULL,0),(206,60,182,'DataObject','Ea fugiat voluptatem explicabo laborum accusamus dolores. Ipsum a culpa. Corrupti soluta enim.','2014-02-20 10:46:04','2014-02-20 10:46:04','2014-02-11 22:46:33',0,0,NULL,NULL,0),(207,60,183,'DataObject','Quaerat voluptas esse dolorem adipisci. Corrupti voluptate et quo consectetur ut minima adipisci. Sed et nisi at ipsa. Illo earum occaecati quisquam sit aut consequatur.','2014-02-20 10:46:05','2014-02-20 10:46:05','2014-02-11 21:46:33',0,0,NULL,NULL,0),(208,60,187,'DataObject','Sit qui ea non. Aut velit dolor. Optio velit velit consequuntur quaerat sunt. Dicta quasi odio quia in facere aliquid qui.','2014-02-20 10:46:06','2014-02-20 10:46:06','2014-02-11 20:46:33',0,0,NULL,NULL,0),(209,60,188,'DataObject','Quae maxime assumenda vel odio rerum ut. Sint ut fugit consequuntur sunt consequatur aut eos. Quo autem eos asperiores quasi fuga.','2014-02-20 10:46:06','2014-02-20 10:46:06','2014-02-11 19:46:33',0,0,NULL,NULL,0),(210,60,189,'DataObject','Similique est fugit veniam. Ut modi vel sapiente aut architecto. Non cumque unde et voluptate ipsam autem blanditiis. Qui ipsam ab quis est quis sint ut.','2014-02-20 10:46:07','2014-02-20 10:46:07','2014-02-11 18:46:33',0,0,NULL,NULL,0),(211,60,190,'DataObject','Error rerum quis ipsum placeat omnis neque. Incidunt nihil numquam officiis perspiciatis. Aut sint consectetur aut vel reiciendis. Dolorem amet aspernatur.','2014-02-20 10:46:07','2014-02-20 10:46:07','2014-02-11 17:46:33',0,0,NULL,NULL,0),(212,49,30,'TaxonConcept','This is a witty comment on the Bacteria taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:08','2014-02-20 10:46:08','2014-02-11 16:46:33',0,0,NULL,NULL,0),(213,13,30,'TaxonConcept','This is a witty comment on the Bacteria taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:08','2014-02-20 10:46:08','2014-02-11 15:46:33',0,0,NULL,NULL,0),(214,62,191,'DataObject','Deserunt aut unde dolor est et. Vel veniam error a. Qui ea consectetur. Excepturi quis consequatur quia itaque deserunt explicabo quia.','2014-02-20 10:46:08','2014-02-20 10:46:08','2014-02-11 14:46:33',0,0,NULL,NULL,0),(215,62,192,'DataObject','Voluptate optio dolor facilis doloribus voluptatibus ut. Laudantium molestias corrupti sint eveniet quae. Nostrum et asperiores perspiciatis.','2014-02-20 10:46:09','2014-02-20 10:46:09','2014-02-11 13:46:33',0,0,NULL,NULL,0),(216,62,196,'DataObject','Et atque corporis velit. Unde reprehenderit impedit quia. Dolores in praesentium. Neque distinctio maiores consequatur.','2014-02-20 10:46:10','2014-02-20 10:46:10','2014-02-11 12:46:33',0,0,NULL,NULL,0),(217,62,197,'DataObject','Eveniet voluptatem hic illo. Atque et laboriosam aut vitae molestiae. Soluta velit architecto ut et hic. Nobis odio et.','2014-02-20 10:46:10','2014-02-20 10:46:10','2014-02-11 11:46:33',0,0,NULL,NULL,0),(218,62,198,'DataObject','Aut facilis perspiciatis qui. Quia natus expedita provident. Facere quam voluptas nemo architecto doloribus quia quia.','2014-02-20 10:46:11','2014-02-20 10:46:11','2014-02-11 10:46:33',0,0,NULL,NULL,0),(219,62,199,'DataObject','Aut laborum ut voluptas sit sequi aperiam in. Autem et beatae voluptatem. Sequi alias fuga rerum iure nesciunt sunt. Facere ipsum rem vero.','2014-02-20 10:46:11','2014-02-20 10:46:11','2014-02-11 09:46:33',0,0,NULL,NULL,0),(220,38,31,'TaxonConcept','This is a witty comment on the Essees eaqueata taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:13','2014-02-20 10:46:13','2014-02-11 08:46:33',0,0,NULL,NULL,0),(221,37,31,'TaxonConcept','This is a witty comment on the Essees eaqueata taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:13','2014-02-20 10:46:13','2014-02-11 07:46:33',0,0,NULL,NULL,0),(222,64,200,'DataObject','Ipsa rerum sapiente repudiandae nemo. Illo sunt architecto aliquam. Eos placeat iusto corrupti sit excepturi a.','2014-02-20 10:46:14','2014-02-20 10:46:14','2014-02-11 06:46:33',0,0,NULL,NULL,0),(223,64,201,'DataObject','Exercitationem harum voluptas quos neque. Commodi maiores iure mollitia facilis quam. Impedit non dolorem a voluptatem veniam. Sapiente et libero possimus ut odit. Quasi sunt excepturi ab.','2014-02-20 10:46:14','2014-02-20 10:46:14','2014-02-11 05:46:33',0,0,NULL,NULL,0),(224,64,205,'DataObject','Ut pariatur magni eius officiis sit voluptatem accusantium. Accusantium ipsam aut. Qui laboriosam explicabo aliquam.','2014-02-20 10:46:15','2014-02-20 10:46:15','2014-02-11 04:46:33',0,0,NULL,NULL,0),(225,64,206,'DataObject','Deserunt enim quae. Dolorum commodi porro. Unde iure rerum. Iste et similique. Aliquid sit soluta aut architecto.','2014-02-20 10:46:15','2014-02-20 10:46:15','2014-02-11 03:46:33',0,0,NULL,NULL,0),(226,64,207,'DataObject','Quia voluptatibus animi ut aut asperiores. Ut natus amet sed consequuntur quaerat numquam. Eveniet tempore est labore voluptatem aut. Commodi consequatur a et dolorem. Sit atque non hic.','2014-02-20 10:46:15','2014-02-20 10:46:15','2014-02-11 02:46:33',0,0,NULL,NULL,0),(227,64,208,'DataObject','Nulla illum odio neque non odit. Autem voluptates est unde ut tempore. Magnam qui nostrum rerum sapiente officiis. Asperiores quas aspernatur.','2014-02-20 10:46:16','2014-02-20 10:46:16','2014-02-11 01:46:33',0,0,NULL,NULL,0),(228,39,32,'TaxonConcept','This is a witty comment on the Animiens atdoloribuseron taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:17','2014-02-20 10:46:17','2014-02-11 00:46:33',0,0,NULL,NULL,0),(229,52,32,'TaxonConcept','This is a witty comment on the Animiens atdoloribuseron taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:17','2014-02-20 10:46:17','2014-02-10 23:46:33',0,0,NULL,NULL,0),(230,66,209,'DataObject','Sunt nam et quas iure. Delectus qui rerum velit fuga quo similique illum. Eum aut itaque vero qui omnis.','2014-02-20 10:46:17','2014-02-20 10:46:17','2014-02-10 22:46:33',0,0,NULL,NULL,0),(231,66,210,'DataObject','Facere aspernatur autem voluptas laborum. Quaerat quam aspernatur error harum ab recusandae sequi. Minima placeat tenetur sed. Quasi maxime odio consequatur assumenda nobis qui suscipit.','2014-02-20 10:46:17','2014-02-20 10:46:17','2014-02-10 21:46:33',0,0,NULL,NULL,0),(232,66,214,'DataObject','Minima voluptates veniam cumque assumenda vel. Et necessitatibus veniam repudiandae recusandae. Nemo sunt beatae minima in aperiam iste provident.','2014-02-20 10:46:18','2014-02-20 10:46:18','2014-02-10 20:46:33',0,0,NULL,NULL,0),(233,66,215,'DataObject','Sed itaque quae sint expedita id. Sit sunt pariatur ut non qui sint. Dolorum temporibus quia molestias ut molestiae dolore tenetur. Quas quis mollitia ut et enim.','2014-02-20 10:46:19','2014-02-20 10:46:19','2014-02-10 19:46:33',0,0,NULL,NULL,0),(234,66,216,'DataObject','Inventore dolorem ratione et expedita. Neque soluta quas. Omnis repudiandae aut. Expedita libero voluptate voluptas qui voluptatem.','2014-02-20 10:46:19','2014-02-20 10:46:19','2014-02-10 18:46:33',0,0,NULL,NULL,0),(235,66,217,'DataObject','Velit facere qui ut dolores itaque doloribus. Porro in modi et. Temporibus unde asperiores. Possimus quia provident quia vel sapiente eos. Molestiae molestiae maiores atque error.','2014-02-20 10:46:19','2014-02-20 10:46:19','2014-02-10 17:46:33',0,0,NULL,NULL,0),(236,8,33,'TaxonConcept','This is a witty comment on the Adaliasii iurea taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:21','2014-02-20 10:46:21','2014-02-10 16:46:33',0,0,NULL,NULL,0),(237,6,33,'TaxonConcept','This is a witty comment on the Adaliasii iurea taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:21','2014-02-20 10:46:21','2014-02-10 15:46:33',0,0,NULL,NULL,0),(238,68,218,'DataObject','Esse voluptatem sint perferendis quibusdam itaque laboriosam. Alias quia omnis officiis nemo. Fugiat fuga deserunt recusandae natus porro aut perspiciatis. Error sit sed occaecati. Maxime quam in itaque corporis quae nobis.','2014-02-20 10:46:21','2014-02-20 10:46:21','2014-02-10 14:46:33',0,0,NULL,NULL,0),(239,68,219,'DataObject','Dolor minus ratione. Ex error libero deserunt aperiam dolorem. Neque voluptatibus ad amet rem sed. Odit et est.','2014-02-20 10:46:21','2014-02-20 10:46:21','2014-02-10 13:46:33',0,0,NULL,NULL,0),(240,68,223,'DataObject','Rem consequuntur et ipsam. Autem et soluta. Accusamus blanditiis voluptas incidunt dolores. Quod ipsum libero rerum totam non. Consequatur ea autem minus eos.','2014-02-20 10:46:22','2014-02-20 10:46:22','2014-02-10 12:46:33',0,0,NULL,NULL,0),(241,68,224,'DataObject','Recusandae nihil maiores quia omnis. Aut animi dolorum aut voluptates libero. Molestiae commodi consequatur beatae.','2014-02-20 10:46:23','2014-02-20 10:46:23','2014-02-10 11:46:33',0,0,NULL,NULL,0),(242,68,225,'DataObject','Corrupti minus delectus repellendus laborum aut et. Quidem autem sint atque. Cumque iure nam deserunt corrupti accusantium.','2014-02-20 10:46:23','2014-02-20 10:46:23','2014-02-10 10:46:33',0,0,NULL,NULL,0),(243,68,226,'DataObject','Dolores quos dolorum repellat. A reiciendis ab magnam sequi inventore dolorum. Incidunt voluptas quo. Et veritatis eos natus excepturi eum. Fuga totam sit exercitationem debitis non.','2014-02-20 10:46:24','2014-02-20 10:46:24','2014-02-10 09:46:33',0,0,NULL,NULL,0),(244,60,34,'TaxonConcept','This is a witty comment on the Nonnumquamerus numquamerus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:25','2014-02-20 10:46:25','2014-02-10 08:46:33',0,0,NULL,NULL,0),(245,56,34,'TaxonConcept','This is a witty comment on the Nonnumquamerus numquamerus taxon concept. Any resemblance to comments real or imagined is coincidental.','2014-02-20 10:46:25','2014-02-20 10:46:25','2014-02-10 07:46:33',0,0,NULL,NULL,0),(246,70,227,'DataObject','Maiores cupiditate est molestiae rerum error. Qui quae voluptatem aut similique qui quidem quam. Et maiores ut earum omnis laboriosam amet.','2014-02-20 10:46:25','2014-02-20 10:46:25','2014-02-10 06:46:33',0,0,NULL,NULL,0),(247,70,228,'DataObject','Voluptas sunt nesciunt accusantium dolor eum. Et accusantium occaecati veritatis totam est. Ullam corporis saepe sed et debitis vel beatae. Dolores impedit voluptatem qui vitae.','2014-02-20 10:46:25','2014-02-20 10:46:25','2014-02-10 05:46:33',0,0,NULL,NULL,0),(248,70,232,'DataObject','Esse quisquam qui et. Cupiditate neque quis sapiente. Tempora dolores voluptatibus dicta. Possimus commodi sint placeat. Adipisci iste accusamus cum deserunt nemo.','2014-02-20 10:46:26','2014-02-20 10:46:26','2014-02-10 04:46:33',0,0,NULL,NULL,0),(249,70,233,'DataObject','Unde vel impedit blanditiis quisquam consectetur. Velit reprehenderit sit. Temporibus alias dolorem consequatur eligendi deleniti.','2014-02-20 10:46:27','2014-02-20 10:46:27','2014-02-10 03:46:33',0,0,NULL,NULL,0),(250,70,234,'DataObject','Dicta nulla et aut ducimus illo dolores. Numquam non ut fugiat excepturi repellat ut et. Asperiores et magni non cum et. Dolorem voluptatem temporibus perferendis neque.','2014-02-20 10:46:27','2014-02-20 10:46:27','2014-02-10 02:46:33',0,0,NULL,NULL,0),(251,70,235,'DataObject','Veniam nisi enim amet nihil illo est. Voluptas quo eligendi fugit. Nulla quo incidunt sunt inventore laudantium. Cumque eum perferendis.','2014-02-20 10:46:27','2014-02-20 10:46:27','2014-02-10 01:46:33',0,0,NULL,NULL,0),(252,92,92,'User','good','2014-03-02 12:40:06','2014-03-02 12:40:06','2014-03-02 12:40:06',0,0,'',NULL,0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `published` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'EOL Curators','This is a special community intended for EOL curators to discuss matters related to curation on the Encylopedia of Life.','2014-02-20 10:44:02','2014-02-20 10:44:02',NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_roles`
--

DROP TABLE IF EXISTS `contact_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_roles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='For content partner agent_contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_roles`
--

LOCK TABLES `contact_roles` WRITE;
/*!40000 ALTER TABLE `contact_roles` DISABLE KEYS */;
INSERT INTO `contact_roles` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `contact_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_subjects`
--

DROP TABLE IF EXISTS `contact_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_subjects`
--

LOCK TABLES `contact_subjects` WRITE;
/*!40000 ALTER TABLE `contact_subjects` DISABLE KEYS */;
INSERT INTO `contact_subjects` VALUES (1,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(2,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(3,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(4,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(5,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(6,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(7,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(8,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(9,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(10,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(11,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01'),(12,'junk@example.com',1,'2014-02-18 10:44:01','2014-02-20 10:44:01');
/*!40000 ALTER TABLE `contact_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comments` text,
  `ip_address` varchar(255) DEFAULT NULL,
  `referred_page` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `taxon_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_page_archives`
--

DROP TABLE IF EXISTS `content_page_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_page_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_page_id` int(11) DEFAULT NULL,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `content_section_id` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `original_creation_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `last_update_user_id` int(11) NOT NULL DEFAULT '2',
  `parent_content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_page_archives`
--

LOCK TABLES `content_page_archives` WRITE;
/*!40000 ALTER TABLE `content_page_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_page_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_pages`
--

DROP TABLE IF EXISTS `content_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `open_in_new_window` tinyint(1) DEFAULT '0',
  `last_update_user_id` int(11) NOT NULL DEFAULT '2',
  `parent_content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_pages`
--

LOCK TABLES `content_pages` WRITE;
/*!40000 ALTER TABLE `content_pages` DISABLE KEYS */;
INSERT INTO `content_pages` VALUES (1,'Home',1,1,0,1,NULL),(2,'Who We Are',2,1,0,1,NULL),(3,'Working Groups',1,1,0,1,2),(4,'Working Group A',1,1,0,1,3),(5,'Working Group B',2,1,0,1,3),(6,'Working Group C',3,1,0,1,3),(7,'Working Group D',4,1,0,1,3),(8,'Working Group E',5,1,0,1,3),(9,'Contact Us',3,1,0,1,NULL),(10,'Screencasts',4,1,0,1,NULL),(11,'Press Releases',5,1,0,1,NULL),(12,'terms_of_use',6,1,0,1,NULL),(13,'curator_central',7,1,0,1,NULL);
/*!40000 ALTER TABLE `content_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_agreements`
--

DROP TABLE IF EXISTS `content_partner_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `template` text NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '1',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `mou_url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `signed_on_date` datetime DEFAULT NULL,
  `signed_by` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_agreements`
--

LOCK TABLES `content_partner_agreements` WRITE;
/*!40000 ALTER TABLE `content_partner_agreements` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_partner_agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_contacts`
--

DROP TABLE IF EXISTS `content_partner_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `contact_role_id` tinyint(3) unsigned NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `title` varchar(20) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `homepage` varchar(255) CHARACTER SET ascii NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(30) CHARACTER SET ascii NOT NULL,
  `address` text NOT NULL,
  `email_reports_frequency_hours` int(11) DEFAULT '24',
  `last_report_email` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='For content partners, specifying people to contact (each one has an agent_contact_role)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_contacts`
--

LOCK TABLES `content_partner_contacts` WRITE;
/*!40000 ALTER TABLE `content_partner_contacts` DISABLE KEYS */;
INSERT INTO `content_partner_contacts` VALUES (1,1,1,'unique13string unique14string','Call me SIR','unique13string','unique14string','http://whatever.org','unique13string.unique14string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-02-20 10:44:04','2014-02-20 10:44:04'),(2,2,1,'unique15string unique16string','Call me SIR','unique15string','unique16string','http://whatever.org','unique15string.unique16string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-02-20 10:44:05','2014-02-20 10:44:05'),(3,4,1,'unique21string unique22string','Call me SIR','unique21string','unique22string','http://whatever.org','unique21string.unique22string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-02-20 10:44:32','2014-02-20 10:44:32'),(4,5,1,'unique23string unique24string','Call me SIR','unique23string','unique24string','http://whatever.org','unique23string.unique24string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-02-20 10:45:20','2014-02-20 10:45:20'),(5,6,1,'unique25string unique26string','Call me SIR','unique25string','unique26string','http://whatever.org','unique25string.unique26string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-02-20 10:45:20','2014-02-20 10:45:20'),(6,7,1,'unique27string unique28string','Call me SIR','unique27string','unique28string','http://whatever.org','unique27string.unique28string@example.com','555-222-1111','1234 Doesntmatter St',24,NULL,'2014-02-20 10:45:29','2014-02-20 10:45:29');
/*!40000 ALTER TABLE `content_partner_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_statuses`
--

DROP TABLE IF EXISTS `content_partner_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_statuses` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_statuses`
--

LOCK TABLES `content_partner_statuses` WRITE;
/*!40000 ALTER TABLE `content_partner_statuses` DISABLE KEYS */;
INSERT INTO `content_partner_statuses` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `content_partner_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partners`
--

DROP TABLE IF EXISTS `content_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_status_id` tinyint(4) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `full_name` text,
  `display_name` varchar(255) DEFAULT NULL,
  `acronym` varchar(20) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `description_of_data` text,
  `description` text NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `admin_notes` text,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partners`
--

LOCK TABLES `content_partners` WRITE;
/*!40000 ALTER TABLE `content_partners` DISABLE KEYS */;
INSERT INTO `content_partners` VALUES (1,1,1,'IUCN',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-02-15 08:44:04','2014-02-20 08:44:04',1,NULL,NULL,NULL,NULL,0),(2,1,2,'Catalogue of Life',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-02-15 08:44:04','2014-02-20 08:44:04',1,NULL,NULL,NULL,NULL,0),(3,1,3,'Biology of Aging',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-02-15 08:44:05','2014-02-20 08:44:05',1,NULL,NULL,NULL,NULL,0),(4,1,5,'Global Biodiversity Information Facility (GBIF)',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-02-15 08:44:31','2014-02-20 08:44:31',1,NULL,NULL,NULL,NULL,0),(5,1,34,'Partner name',NULL,NULL,NULL,'Civil Protection!','description of the partner','','2014-02-15 08:45:20','2014-02-20 08:45:20',1,NULL,NULL,NULL,NULL,0),(6,1,35,'Test ContenPartner',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-02-15 08:45:20','2014-02-20 08:45:20',1,NULL,NULL,NULL,NULL,0),(7,1,42,'NCBI',NULL,NULL,NULL,'Civil Protection!','Our Testing Content Partner','','2014-02-15 08:45:29','2014-02-20 08:45:29',1,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `content_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_table_items`
--

DROP TABLE IF EXISTS `content_table_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_table_items` (
  `content_table_id` int(11) NOT NULL,
  `toc_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_table_items`
--

LOCK TABLES `content_table_items` WRITE;
/*!40000 ALTER TABLE `content_table_items` DISABLE KEYS */;
INSERT INTO `content_table_items` VALUES (1,2,NULL,NULL),(1,19,NULL,NULL),(1,20,NULL,NULL),(1,4,NULL,NULL),(1,34,NULL,NULL),(1,22,NULL,NULL),(1,16,NULL,NULL),(1,8,NULL,NULL),(1,29,NULL,NULL),(1,25,NULL,NULL),(1,31,NULL,NULL),(1,10,NULL,NULL),(1,30,NULL,NULL),(1,33,NULL,NULL),(1,11,NULL,NULL),(1,36,NULL,NULL),(1,6,NULL,NULL),(1,1,NULL,NULL),(1,15,NULL,NULL),(1,28,NULL,NULL),(1,32,NULL,NULL),(1,35,NULL,NULL),(1,9,NULL,NULL),(2,2,NULL,NULL),(2,19,NULL,NULL),(2,20,NULL,NULL),(2,4,NULL,NULL),(2,34,NULL,NULL),(2,22,NULL,NULL),(2,16,NULL,NULL),(2,8,NULL,NULL),(2,29,NULL,NULL),(2,25,NULL,NULL),(2,31,NULL,NULL),(2,10,NULL,NULL),(2,30,NULL,NULL),(2,33,NULL,NULL),(2,11,NULL,NULL),(2,36,NULL,NULL),(2,6,NULL,NULL),(2,1,NULL,NULL),(2,15,NULL,NULL),(2,28,NULL,NULL),(2,32,NULL,NULL),(2,35,NULL,NULL),(2,9,NULL,NULL);
/*!40000 ALTER TABLE `content_table_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tables`
--

DROP TABLE IF EXISTS `content_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tables`
--

LOCK TABLES `content_tables` WRITE;
/*!40000 ALTER TABLE `content_tables` DISABLE KEYS */;
INSERT INTO `content_tables` VALUES (2,'2014-02-20 10:46:28','2014-02-20 10:46:28');
/*!40000 ALTER TABLE `content_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_uploads`
--

DROP TABLE IF EXISTS `content_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `link_name` varchar(70) DEFAULT NULL,
  `attachment_cache_url` bigint(20) DEFAULT NULL,
  `attachment_extension` varchar(10) DEFAULT NULL,
  `attachment_content_type` varchar(255) DEFAULT NULL,
  `attachment_file_name` varchar(255) DEFAULT NULL,
  `attachment_file_size` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_uploads`
--

LOCK TABLES `content_uploads` WRITE;
/*!40000 ALTER TABLE `content_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_data_objects_hierarchy_entries`
--

DROP TABLE IF EXISTS `curated_data_objects_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_data_objects_hierarchy_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `data_object_guid` varchar(32) NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_object_id` (`data_object_id`),
  KEY `data_object_id_hierarchy_entry_id` (`data_object_id`,`hierarchy_entry_id`),
  KEY `index_curated_data_objects_hierarchy_entries_on_data_object_guid` (`data_object_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_data_objects_hierarchy_entries`
--

LOCK TABLES `curated_data_objects_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `curated_data_objects_hierarchy_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_data_objects_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_hierarchy_entry_relationships`
--

DROP TABLE IF EXISTS `curated_hierarchy_entry_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_hierarchy_entry_relationships` (
  `hierarchy_entry_id_1` int(10) unsigned NOT NULL,
  `hierarchy_entry_id_2` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `equivalent` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id_1`,`hierarchy_entry_id_2`),
  KEY `hierarchy_entry_id_2` (`hierarchy_entry_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_hierarchy_entry_relationships`
--

LOCK TABLES `curated_hierarchy_entry_relationships` WRITE;
/*!40000 ALTER TABLE `curated_hierarchy_entry_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_hierarchy_entry_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_structured_data`
--

DROP TABLE IF EXISTS `curated_structured_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_structured_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `predicate` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_structured_data`
--

LOCK TABLES `curated_structured_data` WRITE;
/*!40000 ALTER TABLE `curated_structured_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_structured_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curated_taxon_concept_preferred_entries`
--

DROP TABLE IF EXISTS `curated_taxon_concept_preferred_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curated_taxon_concept_preferred_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curated_taxon_concept_preferred_entries`
--

LOCK TABLES `curated_taxon_concept_preferred_entries` WRITE;
/*!40000 ALTER TABLE `curated_taxon_concept_preferred_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `curated_taxon_concept_preferred_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator_activity_logs_untrust_reasons`
--

DROP TABLE IF EXISTS `curator_activity_logs_untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curator_activity_logs_untrust_reasons` (
  `curator_activity_log_id` int(11) NOT NULL,
  `untrust_reason_id` int(11) NOT NULL,
  PRIMARY KEY (`curator_activity_log_id`,`untrust_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator_activity_logs_untrust_reasons`
--

LOCK TABLES `curator_activity_logs_untrust_reasons` WRITE;
/*!40000 ALTER TABLE `curator_activity_logs_untrust_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `curator_activity_logs_untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curator_levels`
--

DROP TABLE IF EXISTS `curator_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curator_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `rating_weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curator_levels`
--

LOCK TABLES `curator_levels` WRITE;
/*!40000 ALTER TABLE `curator_levels` DISABLE KEYS */;
INSERT INTO `curator_levels` VALUES (1,'Master Curator',1),(2,'Full Curator',1),(3,'Assistant Curator',1);
/*!40000 ALTER TABLE `curator_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_data_object_tags`
--

DROP TABLE IF EXISTS `data_object_data_object_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_data_object_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) NOT NULL,
  `data_object_tag_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_object_guid` varchar(32) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_data_object_data_object_tags_1` (`data_object_guid`,`data_object_tag_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_data_object_tags`
--

LOCK TABLES `data_object_data_object_tags` WRITE;
/*!40000 ALTER TABLE `data_object_data_object_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_data_object_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tags`
--

DROP TABLE IF EXISTS `data_object_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `total_usage_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tags`
--

LOCK TABLES `data_object_tags` WRITE;
/*!40000 ALTER TABLE `data_object_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_translations`
--

DROP TABLE IF EXISTS `data_object_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `original_data_object_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_object_id` (`data_object_id`),
  KEY `original_data_object_id` (`original_data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_translations`
--

LOCK TABLES `data_object_translations` WRITE;
/*!40000 ALTER TABLE `data_object_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects`
--

DROP TABLE IF EXISTS `data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'this guid is generated by EOL. A 32 character hexadecimal',
  `identifier` varchar(255) DEFAULT NULL,
  `provider_mangaed_id` varchar(255) DEFAULT NULL,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `data_subtype_id` smallint(5) unsigned DEFAULT NULL,
  `mime_type_id` smallint(5) unsigned NOT NULL,
  `object_title` varchar(255) NOT NULL COMMENT 'a string title for the object. Generally not used for images',
  `language_id` smallint(5) unsigned NOT NULL,
  `metadata_language_id` smallint(5) unsigned DEFAULT NULL,
  `license_id` tinyint(3) unsigned NOT NULL,
  `rights_statement` varchar(300) NOT NULL COMMENT 'a brief statement of the copyright protection for this object',
  `rights_holder` text NOT NULL COMMENT 'a string stating the owner of copyright for this object',
  `bibliographic_citation` text NOT NULL,
  `source_url` text COMMENT 'a url where users are to be redirected to learn more about this data object',
  `description` mediumtext NOT NULL,
  `description_linked` mediumtext,
  `object_url` text COMMENT 'recommended; the url which resolves to this data object. Generally used only for images, video, and other multimedia',
  `object_cache_url` bigint(20) unsigned DEFAULT NULL COMMENT 'an integer representation of the EOL local cache of the object. For example, a value may be 200902090812345 - that will be split by middleware into the parts 2009/02/09/08/12345 which represents the storage directory structure. The directory structure represents year/month/day/hour/unique_id',
  `thumbnail_url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'not required; the url which resolves to a thumbnail representation of this object. Generally used only for images, video, and other multimedia',
  `thumbnail_cache_url` bigint(20) unsigned DEFAULT NULL COMMENT 'an integer representation of the EOL local cache of the thumbnail',
  `location` varchar(255) NOT NULL,
  `latitude` double NOT NULL COMMENT 'the latitude at which the object was first collected/captured. We have no standard way of represdenting this. Usually measured in decimal values, but could also be degrees',
  `longitude` double NOT NULL COMMENT 'the longitude at which the object was first collected/captured',
  `altitude` double NOT NULL COMMENT 'the altitude at which the object was first collected/captured',
  `object_created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was originally created. Information contained within the resource',
  `object_modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was last modified. Information contained within the resource',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when the object was added to the EOL index',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date when the object was last modified within the EOL index. This should pretty much always equal the created_at date, therefore is likely not necessary',
  `available_at` timestamp NULL DEFAULT NULL,
  `data_rating` float NOT NULL DEFAULT '2.5',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; set to 1 if the object is currently published',
  `curated` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; set to 1 if the object has ever been curated',
  `derived_from` text,
  `spatial_location` text,
  PRIMARY KEY (`id`),
  KEY `data_type_id` (`data_type_id`),
  KEY `index_data_objects_on_guid` (`guid`),
  KEY `index_data_objects_on_published` (`published`),
  KEY `created_at` (`created_at`),
  KEY `identifier` (`identifier`),
  KEY `object_url` (`object_url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects`
--

LOCK TABLES `data_objects` WRITE;
/*!40000 ALTER TABLE `data_objects` DISABLE KEYS */;
INSERT INTO `data_objects` VALUES (1,'7d243167ea8947a2832423b4617460af','',NULL,2,NULL,1,'',1,NULL,3,'Test rights statement','Test rights holder','','','Test Data Object',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:21','2014-02-18 08:44:21','2014-02-15 08:44:21','2014-02-20 09:46:33',NULL,2.5,1,0,NULL,NULL),(2,'70cae97875eb4af9bf9d2b1cb6bd27d4','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Laborum corporis corrupti sed.',NULL,'',201111170140453,'',NULL,'',0,0,0,'2014-02-15 08:44:35','2014-02-18 08:44:35','2014-02-15 08:44:35','2014-02-20 08:46:33',NULL,2.5,1,0,NULL,NULL),(3,'2a230dfa163847ff9684c1cd9ba10283','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Asperiores vitae officiis dolores.',NULL,'',201111021131069,'',NULL,'',0,0,0,'2014-02-15 08:44:36','2014-02-18 08:44:36','2014-02-15 08:44:36','2014-02-20 07:46:33',NULL,2.5,1,0,NULL,NULL),(4,'0f35c1477b4d4e88817bbafaecae3198','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Velit voluptas tenetur culpa.',NULL,'',200811131321659,'',NULL,'',0,0,0,'2014-02-15 08:44:36','2014-02-18 08:44:36','2014-02-15 08:44:36','2014-02-20 06:46:33',NULL,2.5,1,0,NULL,NULL),(5,'f6d0aec962984a58adb41739b507bc46','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Doloribus voluptatibus asperiores velit voluptatem quidem et sit deserunt.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:44:36','2014-02-18 08:44:36','2014-02-15 08:44:36','2014-02-20 05:46:33',NULL,2.5,1,0,NULL,NULL),(6,'ae025839f5cf405d9431aa8a1786b724','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Est eum unde aut.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2014-02-15 08:44:36','2014-02-18 08:44:36','2014-02-15 08:44:36','2014-02-20 04:46:33',NULL,2.5,1,0,NULL,NULL),(7,'a52bd32512754ea4b767f2e39934d4b3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Animalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:37','2014-02-18 08:44:37','2014-02-15 08:44:37','2014-02-20 03:46:33',NULL,2.5,1,0,NULL,NULL),(8,'c775006c5fef464dac035c8a015f9751','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Animalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:37','2014-02-18 08:44:37','2014-02-15 08:44:37','2014-02-20 02:46:33',NULL,2.5,1,0,NULL,NULL),(9,'97525c4e9e3e4c31aa2537b90f416c0d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Est fugit fuga officiis. Quis sunt dolorem cupiditate veritatis. Suscipit sunt hic.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:38','2014-02-18 08:44:38','2014-02-15 08:44:38','2014-02-20 01:46:33',NULL,2.5,1,0,NULL,NULL),(10,'04f4cb6053824c5dbbb0409c124ba8a1','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Architecto animi ducimus qui dolores aliquam dolorem. Consectetur culpa consequuntur iusto omnis assumenda dolore doloribus. Minima nobis ex officia dicta dolor iusto dolor.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:38','2014-02-18 08:44:38','2014-02-15 08:44:38','2014-02-20 00:46:33',NULL,2.5,1,0,NULL,NULL),(11,'186c1ec000674e94a37a077e0ce895bd','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Aliquam et similique esse.',NULL,'',201111021106221,'',NULL,'',0,0,0,'2014-02-15 08:44:40','2014-02-18 08:44:40','2014-02-15 08:44:40','2014-02-19 23:46:33',NULL,2.5,1,0,NULL,NULL),(12,'e1797e7470e342d5ace43d8cd2af389c','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Nihil consequatur quam architecto reprehenderit ea aperiam culpa ea.',NULL,'',201205220000616,'',NULL,'',0,0,0,'2014-02-15 08:44:41','2014-02-18 08:44:41','2014-02-15 08:44:41','2014-02-19 22:46:33',NULL,2.5,1,0,NULL,NULL),(13,'51b45105b61b43c3b5f117ce991c7a58','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Libero dolores voluptatem temporibus consequuntur vero voluptate nostrum.',NULL,'',200811131394659,'',NULL,'',0,0,0,'2014-02-15 08:44:41','2014-02-18 08:44:41','2014-02-15 08:44:41','2014-02-19 21:46:33',NULL,2.5,1,0,NULL,NULL),(14,'cf52e8cbd08c4c8c9042e9c878dad6a9','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Molestiae sit esse cumque commodi ipsum et omnis.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:44:41','2014-02-18 08:44:41','2014-02-15 08:44:41','2014-02-19 20:46:33',NULL,2.5,1,0,NULL,NULL),(15,'9728e6aef46d426ab9f2256ac1509a33','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Molestiae temporibus et molestias.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2014-02-15 08:44:42','2014-02-18 08:44:42','2014-02-15 08:44:42','2014-02-19 19:46:33',NULL,2.5,1,0,NULL,NULL),(16,'30829cbeea7d46d181acab5b9a2b0140','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Autrecusandaees repudiandaeica</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:42','2014-02-18 08:44:42','2014-02-15 08:44:42','2014-02-19 18:46:33',NULL,2.5,1,0,NULL,NULL),(17,'153682d77a2947a6a2e20ac3b8070159','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Autrecusandaees repudiandaeica</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:42','2014-02-18 08:44:42','2014-02-15 08:44:42','2014-02-19 17:46:33',NULL,2.5,1,0,NULL,NULL),(18,'d2e9e82782324ea799a7411668fa8738','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Minima amet sunt rerum aperiam sit. Maxime et et et corporis voluptas aut. Esse iste aut eum voluptate necessitatibus quos voluptatem. Nulla sit voluptatem aut id beatae itaque. Deserunt maiores aut veniam dolore aspernatur qui repudiandae.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:43','2014-02-18 08:44:43','2014-02-15 08:44:43','2014-02-19 16:46:33',NULL,2.5,1,0,NULL,NULL),(19,'3a020281ad904ee2a9e3234bb2916e2b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quia nemo illum ipsum omnis deleniti quod. Ea inventore numquam facere quae sed. Quos natus quisquam illum et.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:43','2014-02-18 08:44:43','2014-02-15 08:44:43','2014-02-19 15:46:33',NULL,2.5,1,0,NULL,NULL),(20,'c07afa2c487a40eca7dc04faf3edaee5','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Et ipsam et et dolorem illum molestiae repellendus quas.',NULL,'',201301212386289,'',NULL,'',0,0,0,'2014-02-15 08:44:45','2014-02-18 08:44:45','2014-02-15 08:44:45','2014-02-19 14:46:33',NULL,2.5,1,0,NULL,NULL),(21,'b80b7cdc91374d968380020009c8cd18','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Maiores laudantium sequi eveniet quia et voluptatem repellat.',NULL,'',201201030187595,'',NULL,'',0,0,0,'2014-02-15 08:44:45','2014-02-18 08:44:45','2014-02-15 08:44:45','2014-02-19 13:46:33',NULL,2.5,1,0,NULL,NULL),(22,'eb05c06c147e4e69afce9ce3f55f38fb','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Est praesentium eveniet at.',NULL,'',200811131367814,'',NULL,'',0,0,0,'2014-02-15 08:44:46','2014-02-18 08:44:46','2014-02-15 08:44:46','2014-02-19 12:46:33',NULL,2.5,1,0,NULL,NULL),(23,'608765e9d5f34617b051b93ffcf34156','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Non sequi et aut explicabo architecto quod.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:44:46','2014-02-18 08:44:46','2014-02-15 08:44:46','2014-02-19 11:46:33',NULL,2.5,1,0,NULL,NULL),(24,'eb2e57b1fdda4a14bc5881eb7dc5594f','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Expedita commodi nihil vel.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2014-02-15 08:44:46','2014-02-18 08:44:46','2014-02-15 08:44:46','2014-02-19 10:46:33',NULL,2.5,1,0,NULL,NULL),(25,'6806c1efaef840e3949feed2092fc43d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Nihileri voluptasus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:46','2014-02-18 08:44:46','2014-02-15 08:44:46','2014-02-19 09:46:33',NULL,2.5,1,0,NULL,NULL),(26,'56fae902fa914bc498e6306bd0019639','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Nihileri voluptasus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:47','2014-02-18 08:44:47','2014-02-15 08:44:47','2014-02-19 08:46:33',NULL,2.5,1,0,NULL,NULL),(27,'bde33d04f9134c5d8cb9311833f7400f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Et alias repellat et omnis. Atque impedit magni ea praesentium dolor. Ducimus at repudiandae. Nemo odit aut dolor nihil. Aut quia vel repellat vero beatae.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:47','2014-02-18 08:44:47','2014-02-15 08:44:47','2014-02-19 07:46:33',NULL,2.5,1,0,NULL,NULL),(28,'98770dbed19144acae789558abfde29f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Excepturi mollitia sed autem esse qui perferendis sed. Eos facere quod similique dolor consequatur dolorum. Iste dolorem doloribus sint nesciunt. Consequatur in laboriosam earum non et dicta iusto. Esse temporibus ullam sapiente qui.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:47','2014-02-18 08:44:47','2014-02-15 08:44:47','2014-02-19 06:46:33',NULL,2.5,1,0,NULL,NULL),(29,'5d26f1bbacdb40ada0208c555e2a8a8e','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Reprehenderit laudantium illo rerum.',NULL,'',201111012278143,'',NULL,'',0,0,0,'2014-02-15 08:44:49','2014-02-18 08:44:49','2014-02-15 08:44:49','2014-02-19 05:46:33',NULL,2.5,1,0,NULL,NULL),(30,'b99b8c8073814eb3b100683a8a8c28a7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Saepe deserunt ipsam inventore eius.',NULL,'',201111020864905,'',NULL,'',0,0,0,'2014-02-15 08:44:49','2014-02-18 08:44:49','2014-02-15 08:44:49','2014-02-19 04:46:33',NULL,2.5,1,0,NULL,NULL),(31,'6ed2da5fdf154255a3f0959708bbaa79','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Iusto consequatur dicta rem.',NULL,'',200811131351121,'',NULL,'',0,0,0,'2014-02-15 08:44:50','2014-02-18 08:44:50','2014-02-15 08:44:50','2014-02-19 03:46:33',NULL,2.5,1,0,NULL,NULL),(32,'95e9c3f6dd9f40919ce6c6d043c34ddc','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Et et neque voluptas autem.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:44:50','2014-02-18 08:44:50','2014-02-15 08:44:50','2014-02-19 02:46:33',NULL,2.5,1,0,NULL,NULL),(33,'679b781ea95c4822a71b29d9dfac620d','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Minima voluptates qui fugit officiis tempora dolor adipisci.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2014-02-15 08:44:50','2014-02-18 08:44:50','2014-02-15 08:44:50','2014-02-19 01:46:33',NULL,2.5,1,0,NULL,NULL),(34,'cb9b552a0ae04af39d4fe390b6ef5cc9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Dignissimosii inutes</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:50','2014-02-18 08:44:50','2014-02-15 08:44:50','2014-02-19 00:46:33',NULL,2.5,1,0,NULL,NULL),(35,'ff047b9feec04bfd840fe18e566174a9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Dignissimosii inutes</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:51','2014-02-18 08:44:51','2014-02-15 08:44:51','2014-02-18 23:46:33',NULL,2.5,1,0,NULL,NULL),(36,'56be5778538545e9affed3cd5792801f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ut qui natus esse laboriosam. Voluptatibus reprehenderit et laudantium aliquam. Numquam itaque explicabo enim ratione non. Optio fuga quis deleniti dignissimos esse. Saepe non et inventore.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:51','2014-02-18 08:44:51','2014-02-15 08:44:51','2014-02-18 22:46:33',NULL,2.5,1,0,NULL,NULL),(37,'442a65fc977e4c6ab64b41abaa637fef','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Omnis voluptatem facere. Tempore est quisquam facere eos natus. Enim recusandae est adipisci delectus. Ut voluptatem tempore iure.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:52','2014-02-18 08:44:52','2014-02-15 08:44:52','2014-02-18 21:46:33',NULL,2.5,1,0,NULL,NULL),(38,'1ba30a073c19447c889cdb38fef6dccb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Odit iste qui veniam velit.',NULL,'',201204040068862,'',NULL,'',0,0,0,'2014-02-15 08:44:54','2014-02-18 08:44:54','2014-02-15 08:44:54','2014-02-18 20:46:33',NULL,2.5,1,0,NULL,NULL),(39,'9bfae5d7b2e4497e854f1c1546c93b87','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Modi non quo et eum veritatis ut.',NULL,'',201208120076649,'',NULL,'',0,0,0,'2014-02-15 08:44:54','2014-02-18 08:44:54','2014-02-15 08:44:54','2014-02-18 19:46:33',NULL,2.5,1,0,NULL,NULL),(40,'e1841c36b2884261b17b0c60e468956c','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Optio ipsa natus esse.',NULL,'',200811131388288,'',NULL,'',0,0,0,'2014-02-15 08:44:54','2014-02-18 08:44:54','2014-02-15 08:44:54','2014-02-18 18:46:33',NULL,2.5,1,0,NULL,NULL),(41,'bd03c864371443f696ab93825c2fe2f0','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Quidem et provident et quo iste reiciendis nihil quia.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:44:55','2014-02-18 08:44:55','2014-02-15 08:44:55','2014-02-18 17:46:33',NULL,2.5,1,0,NULL,NULL),(42,'5318369580264c25808cb6d2538ab982','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Excepturi hic et non recusandae placeat dicta.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2014-02-15 08:44:55','2014-02-18 08:44:55','2014-02-15 08:44:55','2014-02-18 16:46:33',NULL,2.5,1,0,NULL,NULL),(43,'97d163f7e36c4a768d4fcadc5028d77f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Fugais utharumatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:55','2014-02-18 08:44:55','2014-02-15 08:44:55','2014-02-18 15:46:33',NULL,2.5,1,0,NULL,NULL),(44,'1394eb1334734669903027cb971c1e41','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Fugais utharumatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:55','2014-02-18 08:44:55','2014-02-15 08:44:55','2014-02-18 14:46:33',NULL,2.5,1,0,NULL,NULL),(45,'a731b553bbf545feb1bb8a23cb957745','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Veniam dolorem voluptas suscipit accusantium quo. Odit iusto ratione atque commodi tenetur odio ut. Et recusandae sed quae aliquam sed quas.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:56','2014-02-18 08:44:56','2014-02-15 08:44:56','2014-02-18 13:46:33',NULL,2.5,1,0,NULL,NULL),(46,'fa9d180305cf44f9b34bb85f6c0bcf2e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quo nihil dolor eos veniam nisi. Atque nemo et dicta. Id soluta ex.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:44:56','2014-02-18 08:44:56','2014-02-15 08:44:56','2014-02-18 12:46:33',NULL,2.5,1,0,NULL,NULL),(47,'7aa28df354ee4979ba8247536bed3d15','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Amet nostrum voluptas neque cum quis.',NULL,'',201202050005388,'',NULL,'',0,0,0,'2014-02-15 08:44:58','2014-02-18 08:44:58','2014-02-15 08:44:58','2014-02-18 11:46:33',NULL,2.5,1,0,NULL,NULL),(48,'55244e0a3e9947f2a9af81da8d8c3a6f','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','inappropriate',NULL,'',201111011778717,'',NULL,'',0,0,0,'2014-02-15 08:44:59','2014-02-18 08:44:59','2014-02-15 08:44:59','2014-02-18 10:46:33',NULL,2.5,1,0,NULL,NULL),(49,'8696e5c1c8c34b718ab614a883deb386','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','untrusted',NULL,'',201203220059150,'',NULL,'',0,0,0,'2014-02-15 08:44:59','2014-02-18 08:44:59','2014-02-15 08:44:59','2014-02-18 09:46:33',NULL,2.5,1,0,NULL,NULL),(50,'d79b6fcc9c2b4b1181276cc3156f2572','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','unknown',NULL,'',201212102306393,'',NULL,'',0,0,0,'2014-02-15 08:44:59','2014-02-18 08:44:59','2014-02-15 08:44:59','2014-02-18 08:46:33',NULL,2.5,1,0,NULL,NULL),(51,'8e97b9ecf93642269ebae271cb398835','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible',NULL,'',201111021567463,'',NULL,'',0,0,0,'2014-02-15 08:44:59','2014-02-18 08:44:59','2014-02-15 08:44:59','2014-02-18 07:46:33',NULL,2.5,1,0,NULL,NULL),(52,'f55e389da33f477d92874993973894a7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview',NULL,'',201111020587617,'',NULL,'',0,0,0,'2014-02-15 08:45:00','2014-02-18 08:45:00','2014-02-15 08:45:00','2014-02-18 06:46:33',NULL,2.5,1,0,NULL,NULL),(53,'392fb0e11b3641318e5e35d4107aafb1','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, unknown',NULL,'',201205210185638,'',NULL,'',0,0,0,'2014-02-15 08:45:00','2014-02-18 08:45:00','2014-02-15 08:45:00','2014-02-18 05:46:33',NULL,2.5,1,0,NULL,NULL),(54,'83273108c94f4dfc96d45f1520a51716','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, untrusted',NULL,'',201111011190361,'',NULL,'',0,0,0,'2014-02-15 08:45:00','2014-02-18 08:45:00','2014-02-15 08:45:00','2014-02-18 04:46:33',NULL,2.5,1,0,NULL,NULL),(55,'e181a607783a42fc962d5e7f40da9b90','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview, unknown',NULL,'',201111011511951,'',NULL,'',0,0,0,'2014-02-15 08:45:00','2014-02-18 08:45:00','2014-02-15 08:45:00','2014-02-18 03:46:33',NULL,2.5,1,0,NULL,NULL),(56,'0ce86a52230a46a48a6fd403f70e7bb7','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Deleniti iure error quo vel id enim rerum.',NULL,'',200811131382797,'',NULL,'',0,0,0,'2014-02-15 08:45:01','2014-02-18 08:45:01','2014-02-15 08:45:01','2014-02-18 02:46:33',NULL,2.5,1,0,NULL,NULL),(57,'798a83322caa41b8977b811651bfd558','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','In sit aut inventore autem vel.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:01','2014-02-18 08:45:01','2014-02-15 08:45:01','2014-02-18 01:46:33',NULL,2.5,1,0,NULL,NULL),(58,'d351aa366dc44944a831120b462c61d1','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Dolor dolor enim et quam.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2014-02-15 08:45:01','2014-02-18 08:45:01','2014-02-15 08:45:01','2014-02-18 00:46:33',NULL,2.5,1,0,NULL,NULL),(59,'45ec1b0b993a43b0b9e0e5d51bde6d0f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Minuseli ullamens</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:01','2014-02-18 08:45:01','2014-02-15 08:45:01','2014-02-17 23:46:33',NULL,2.5,1,0,NULL,NULL),(60,'fe603eb2fd5c4542a0fc57865399ba80','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Minuseli ullamens</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:01','2014-02-18 08:45:01','2014-02-15 08:45:01','2014-02-17 22:46:33',NULL,2.5,1,0,NULL,NULL),(61,'dbcc376b51e641da98bea6b78c345689','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Aut facere id at. Consequuntur nemo cum voluptas et nulla qui. Nesciunt aut sed quos ut magnam. In quisquam ut porro. Veritatis ut nostrum commodi.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:01','2014-02-18 08:45:01','2014-02-15 08:45:01','2014-02-17 21:46:33',NULL,2.5,1,0,NULL,NULL),(62,'d33ca16812f54265a2c6d437aac8e17b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Rem maiores eveniet et illo quia sed voluptas. Laboriosam rerum ut. Fugiat voluptatem dolor. Et dignissimos odit nisi.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:02','2014-02-18 08:45:02','2014-02-15 08:45:02','2014-02-17 20:46:33',NULL,2.5,1,0,NULL,NULL),(63,'21a786f69e214f4aa0177f76e9b3b2c8','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Perspiciatis autem qui officiis non.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2014-02-15 08:45:04','2014-02-18 08:45:04','2014-02-15 08:45:04','2014-02-17 19:46:33',NULL,2.5,1,0,NULL,NULL),(64,'8a15d60a856143d7923bad0d63a2b9a0','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Dolorem veniam itaque dolor necessitatibus est qui officia odio.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2014-02-15 08:45:05','2014-02-18 08:45:05','2014-02-15 08:45:05','2014-02-17 18:46:33',NULL,2.5,1,0,NULL,NULL),(65,'87dbeeb31e174dc0987539bfe13eace7','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Dicta rerum blanditiis consequatur perferendis temporibus vel distinctio.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2014-02-15 08:45:05','2014-02-18 08:45:05','2014-02-15 08:45:05','2014-02-17 17:46:33',NULL,2.5,1,0,NULL,NULL),(66,'be5badad9d314a26ac8d2571164718dd','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Facilis id nihil voluptates dolor quis magnam neque.',NULL,'',201208172341618,'',NULL,'',0,0,0,'2014-02-15 08:45:06','2014-02-18 08:45:06','2014-02-15 08:45:06','2014-02-17 16:46:33',NULL,2.5,1,0,NULL,NULL),(67,'3c00eed134e64d91bc15a3c25797fba8','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','inappropriate',NULL,'',201111021299859,'',NULL,'',0,0,0,'2014-02-15 08:45:07','2014-02-18 08:45:07','2014-02-15 08:45:07','2014-02-17 15:46:33',NULL,2.5,1,0,NULL,NULL),(68,'2e51e7236c3144828e591f45b18abecf','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','untrusted',NULL,'',201205150031711,'',NULL,'',0,0,0,'2014-02-15 08:45:07','2014-02-18 08:45:07','2014-02-15 08:45:07','2014-02-17 14:46:33',NULL,2.5,1,0,NULL,NULL),(69,'1302957c047641cf8f77a877ad6d3154','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','unknown',NULL,'',201112230179863,'',NULL,'',0,0,0,'2014-02-15 08:45:07','2014-02-18 08:45:07','2014-02-15 08:45:07','2014-02-17 13:46:33',NULL,2.5,1,0,NULL,NULL),(70,'054f004aef864334b1d7e8c5df88c3eb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible',NULL,'',201111012244809,'',NULL,'',0,0,0,'2014-02-15 08:45:07','2014-02-18 08:45:07','2014-02-15 08:45:07','2014-02-17 12:46:33',NULL,2.5,1,0,NULL,NULL),(71,'fe0f910605d343129583e76149dfcf86','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview',NULL,'',201111011330372,'',NULL,'',0,0,0,'2014-02-15 08:45:07','2014-02-18 08:45:07','2014-02-15 08:45:07','2014-02-17 11:46:33',NULL,2.5,1,0,NULL,NULL),(72,'57b85148af8f4f8cac1cf9ab64bdb2c3','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, unknown',NULL,'',201212282365864,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 10:46:33',NULL,2.5,1,0,NULL,NULL),(73,'639c73003acc4d7d9ca32807523acae7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','invisible, untrusted',NULL,'',201111030123051,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 09:46:33',NULL,2.5,1,0,NULL,NULL),(74,'fe33412675e34f2e87b8176e674eeb56','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','preview, unknown',NULL,'',201111020413030,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 08:46:33',NULL,2.5,1,0,NULL,NULL),(75,'7a9ada347e0c4e1ca95f00e925cb3118','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','A qui modi maiores est in omnis doloremque.',NULL,'',200811131390600,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 07:46:33',NULL,2.5,1,0,NULL,NULL),(76,'f3af2de10e5c4806bc77ffc506b2b143','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sapiente impedit vitae odit molestiae ut.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 06:46:33',NULL,2.5,1,0,NULL,NULL),(77,'5085d54a76c04aa1a05469e4921fcfa6','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Veritatis magnam ipsam odio tempore quod.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 05:46:33',NULL,2.5,1,0,NULL,NULL),(78,'6952253d18dd45fd9420502fe8f0c02b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Culpaensis sapienteesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:08','2014-02-18 08:45:08','2014-02-15 08:45:08','2014-02-17 04:46:33',NULL,2.5,1,0,NULL,NULL),(79,'13f98ea73e094c32b5c48318446814cd','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Culpaensis sapienteesi</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:09','2014-02-18 08:45:09','2014-02-15 08:45:09','2014-02-17 03:46:33',NULL,2.5,1,0,NULL,NULL),(80,'688f376ef0f143af8f8b45eb173cb2b9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quas dolor numquam et suscipit voluptatem. Et ut omnis totam nobis mollitia provident cupiditate. Incidunt facere cumque voluptate odit eos placeat doloremque. Velit aut aspernatur deleniti sint. Illo quisquam minima et voluptatum tempore.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:09','2014-02-18 08:45:09','2014-02-15 08:45:09','2014-02-17 02:46:33',NULL,2.5,1,0,NULL,NULL),(81,'75f097148417419591fca90a48305437','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Qui libero assumenda numquam possimus totam velit vero. Pariatur perspiciatis maiores consequatur nemo nesciunt cumque doloribus. Quam ea eum est expedita nihil qui. Maiores asperiores necessitatibus quia aspernatur. Molestias voluptas inventore sed.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:10','2014-02-18 08:45:10','2014-02-15 08:45:10','2014-02-17 01:46:33',NULL,2.5,1,0,NULL,NULL),(82,'9e21e537e9cd4c509c5a26b869110712','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','1st image description for re-harvest',NULL,'',201205300022426,'',NULL,'',0,0,0,'2014-02-15 08:45:11','2014-02-18 08:45:11','2014-02-15 08:45:11','2014-02-17 00:46:33',NULL,1,0,0,NULL,NULL),(83,'1c21e54530d348a881c868f5b0dfe81e','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Architecto sapiente aut quis soluta voluptas consectetur non quod.',NULL,'',200811131333916,'',NULL,'',0,0,0,'2014-02-15 08:45:12','2014-02-18 08:45:12','2014-02-15 08:45:12','2014-02-16 23:46:33',NULL,2.5,1,0,NULL,NULL),(84,'cf8b2586227e4685b8ec0a251182826b','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ipsa officiis quae et tenetur quis esse necessitatibus sed.',NULL,'',200811131393000,'',NULL,'',0,0,0,'2014-02-15 08:45:12','2014-02-18 08:45:12','2014-02-15 08:45:12','2014-02-16 22:46:33',NULL,2.5,1,0,NULL,NULL),(85,'734bc028ab084e32bc017bcac521e3af','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Unde temporibus esse cupiditate beatae voluptatem dolores ipsum.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:12','2014-02-18 08:45:12','2014-02-15 08:45:12','2014-02-16 21:46:33',NULL,2.5,1,0,NULL,NULL),(86,'2ab9e442c8bf4a7196a20fe5cace7326','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Maiores et quo id nemo error sit adipisci occaecati.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:12','2014-02-18 08:45:12','2014-02-15 08:45:12','2014-02-16 20:46:33',NULL,2.5,1,0,NULL,NULL),(87,'cd5f28684c924f4586fac79133537dce','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Atque eum nihil veniam distinctio libero.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2014-02-15 08:45:12','2014-02-18 08:45:12','2014-02-15 08:45:12','2014-02-16 19:46:33',NULL,2.5,1,0,NULL,NULL),(88,'79c006ab83374417b67af7fb03a003c8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','overview text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:13','2014-02-18 08:45:13','2014-02-15 08:45:13','2014-02-16 18:46:33',NULL,1,0,0,NULL,NULL),(89,'ebd2e84ac76148a1b1dccd98e56e9eb6','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','description text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:13','2014-02-18 08:45:13','2014-02-15 08:45:13','2014-02-16 17:46:33',NULL,2.5,1,0,NULL,NULL),(90,'79c006ab83374417b67af7fb03a003c8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','overview text for re-harvest',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:13','2014-02-18 08:45:13','2014-02-20 08:45:15','2014-02-16 16:46:33',NULL,1,1,0,NULL,NULL),(91,'9e21e537e9cd4c509c5a26b869110712','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','1st image description for re-harvest',NULL,'',201205300022426,'',NULL,'',0,0,0,'2014-02-15 08:45:11','2014-02-18 08:45:11','2014-02-20 08:45:15','2014-02-16 15:46:33',NULL,1,1,0,NULL,NULL),(92,'186e472c17aa4947840ea037c10cef22','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Minima aut repudiandae earum voluptas et harum omnis error.',NULL,'',201204050041265,'',NULL,'',0,0,0,'2014-02-15 08:45:16','2014-02-18 08:45:16','2014-02-15 08:45:16','2014-02-16 14:46:33',NULL,2.5,1,0,NULL,NULL),(93,'ae4ee9cd2b3146e28c1271220d45f128','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Enim quia provident vel.',NULL,'',201210012385079,'',NULL,'',0,0,0,'2014-02-15 08:45:17','2014-02-18 08:45:17','2014-02-15 08:45:17','2014-02-16 13:46:33',NULL,2.5,1,0,NULL,NULL),(94,'727c27ed10894df19625b2aee1a95978','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Molestiae quasi velit maxime sit modi voluptatibus illo.',NULL,'',200811131347554,'',NULL,'',0,0,0,'2014-02-15 08:45:17','2014-02-18 08:45:17','2014-02-15 08:45:17','2014-02-16 12:46:33',NULL,2.5,1,0,NULL,NULL),(95,'1d11e8248808416cb15b468426d9bb7d','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Aut labore amet temporibus magni numquam ut veniam.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:17','2014-02-18 08:45:17','2014-02-15 08:45:17','2014-02-16 11:46:33',NULL,2.5,1,0,NULL,NULL),(96,'bd1d1919868f4556af4a92b1a7b79165','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Beatae veritatis fugiat id quia dicta facilis explicabo omnis.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2014-02-15 08:45:17','2014-02-18 08:45:17','2014-02-15 08:45:17','2014-02-16 10:46:33',NULL,2.5,1,0,NULL,NULL),(97,'12cfb23216644c6991584a834745b3b7','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Qui vel nihil. Ad molestias veniam aut eius. Quasi est vel doloribus odit. Sed asperiores officia aut aut cum. Ratione aperiam sint quis.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:17','2014-02-18 08:45:17','2014-02-15 08:45:17','2014-02-16 09:46:33',NULL,2.5,1,0,NULL,NULL),(98,'c253bb39e3ea45f58b50e214715b9c53','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Cupiditate dolorem qui quia aut. Minima est et nam sunt facere reiciendis inventore. Fugit modi officia fugiat. Non nulla et beatae facere illum voluptatum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:18','2014-02-18 08:45:18','2014-02-15 08:45:18','2014-02-16 08:46:33',NULL,2.5,1,0,NULL,NULL),(99,'5c01ffd28fe64ba189eac5c5cd5e7ad1','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Voluptate expedita vitae qui. Sit animi eos odit est est ad et. Quaerat officia eaque et omnis voluptas non.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:18','2014-02-18 08:45:18','2014-02-15 08:45:18','2014-02-16 07:46:33',NULL,2.5,1,0,NULL,NULL),(100,'46bd9e268c2049e5b293a03f53c82fad','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','This should only be seen by ContentPartner Our Testing Content Partner',NULL,'',201205150083147,'',NULL,'',0,0,0,'2014-02-15 08:45:20','2014-02-18 08:45:20','2014-02-15 08:45:20','2014-02-16 06:46:33',NULL,2.5,1,0,NULL,NULL),(101,'24bd2e1d271a4fe691db587122f29406','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Repellat non rerum ut nobis consequuntur sit.',NULL,'',201211260100253,'',NULL,'',0,0,0,'2014-02-15 08:45:23','2014-02-18 08:45:23','2014-02-15 08:45:23','2014-02-16 05:46:33',NULL,2.5,1,0,NULL,NULL),(102,'7ee1d888658b4ec8b6f683311922d41f','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Illum dolor quidem ratione id nesciunt dolorum laborum non.',NULL,'',201112100017714,'',NULL,'',0,0,0,'2014-02-15 08:45:24','2014-02-18 08:45:24','2014-02-15 08:45:24','2014-02-16 04:46:33',NULL,2.5,1,0,NULL,NULL),(103,'d682d0c07e514cc9acbab24ed547355b','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui est unde atque non.',NULL,'',200811131354820,'',NULL,'',0,0,0,'2014-02-15 08:45:24','2014-02-18 08:45:24','2014-02-15 08:45:24','2014-02-16 03:46:33',NULL,2.5,1,0,NULL,NULL),(104,'84c2b5644000445c91b4aedb6b8c2166','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Tenetur ducimus dolorem excepturi minima corrupti numquam nostrum voluptate.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:24','2014-02-18 08:45:24','2014-02-15 08:45:24','2014-02-16 02:46:33',NULL,2.5,1,0,NULL,NULL),(105,'092eb216229f4eb888e696a30932e982','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Et totam sint quisquam ea.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2014-02-15 08:45:25','2014-02-18 08:45:25','2014-02-15 08:45:25','2014-02-16 01:46:33',NULL,2.5,1,0,NULL,NULL),(106,'8ebb8cd218034f3aac22a06a80c1cde9','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Etconsequaturelia autenimalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:25','2014-02-18 08:45:25','2014-02-15 08:45:25','2014-02-16 00:46:33',NULL,2.5,1,0,NULL,NULL),(107,'9bf88c9ba126421891905b8ab8ce21dd','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Etconsequaturelia autenimalia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:25','2014-02-18 08:45:25','2014-02-15 08:45:25','2014-02-15 23:46:33',NULL,2.5,1,0,NULL,NULL),(108,'d360958627a445bf84fe84cf578e2ac2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Et corrupti id aut repellendus officia libero aut. Totam vel mollitia inventore repudiandae. Alias modi cumque repellat qui et recusandae eaque.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:26','2014-02-18 08:45:26','2014-02-15 08:45:26','2014-02-15 22:46:33',NULL,2.5,1,0,NULL,NULL),(109,'373437f6e3084ce394631514d9f74f10','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Recusandae quas libero. Mollitia quaerat sequi sint. Sunt doloremque sequi commodi veniam illum. Error est consequatur corporis aut. Velit eum iusto molestiae vero doloremque omnis beatae.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:26','2014-02-18 08:45:26','2014-02-15 08:45:26','2014-02-15 21:46:33',NULL,2.5,1,0,NULL,NULL),(110,'3527b2770a684fa9986f07f9ec8edfa2','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Et facere unde qui doloribus similique voluptatem.',NULL,'',201209082397624,'',NULL,'',0,0,0,'2014-02-15 08:45:30','2014-02-18 08:45:30','2014-02-15 08:45:30','2014-02-15 20:46:33',NULL,2.5,1,0,NULL,NULL),(111,'875fc1a3d2804421a887f3308403b66a','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Sunt provident tempora omnis est ut asperiores.',NULL,'',201111020312732,'',NULL,'',0,0,0,'2014-02-15 08:45:30','2014-02-18 08:45:30','2014-02-15 08:45:30','2014-02-15 19:46:33',NULL,2.5,1,0,NULL,NULL),(112,'00b5e992f8764d2193f00579ac112a51','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Cumque in voluptas non explicabo.',NULL,'',200811131391764,'',NULL,'',0,0,0,'2014-02-15 08:45:31','2014-02-18 08:45:31','2014-02-15 08:45:31','2014-02-15 18:46:33',NULL,2.5,1,0,NULL,NULL),(113,'bc3480963bf944adb4e150e0396f84c4','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui est quisquam veritatis ea quasi voluptate in.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:31','2014-02-18 08:45:31','2014-02-15 08:45:31','2014-02-15 17:46:33',NULL,2.5,1,0,NULL,NULL),(114,'3266a06cdae64ff49b09cf07f16d8eb0','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Aut vel consequatur officia aliquam voluptatum et eveniet.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2014-02-15 08:45:31','2014-02-18 08:45:31','2014-02-15 08:45:31','2014-02-15 16:46:33',NULL,2.5,1,0,NULL,NULL),(115,'90598e93c3054f0e8d223d6c0198c7ba','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Eukaryota</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:31','2014-02-18 08:45:31','2014-02-15 08:45:31','2014-02-15 15:46:33',NULL,2.5,1,0,NULL,NULL),(116,'9487d450490d4abc8b6b0f3d0bbbd79c','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Eukaryota</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:32','2014-02-18 08:45:32','2014-02-15 08:45:32','2014-02-15 14:46:33',NULL,2.5,1,0,NULL,NULL),(117,'84aeaa3ce6e042eebc416d3d663bb25d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Eum qui ratione. Perspiciatis non id illum harum tempora est ullam. Quis molestiae non autem aut et. Tenetur recusandae inventore cum eos. Sapiente quibusdam occaecati iste velit asperiores.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:32','2014-02-18 08:45:32','2014-02-15 08:45:32','2014-02-15 13:46:33',NULL,2.5,1,0,NULL,NULL),(118,'e43ecdcae1a545a9ac3dee70ae200d16','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Dicta voluptatibus velit quod. Voluptatum velit assumenda occaecati praesentium. Occaecati laudantium eaque molestias aspernatur. Dolorum repudiandae vero eaque vel dolores.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:33','2014-02-18 08:45:33','2014-02-15 08:45:33','2014-02-15 12:46:33',NULL,2.5,1,0,NULL,NULL),(119,'953a542afa834ac3ab2a6b216e35ce6b','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Maiores magnam voluptatem odit praesentium facilis.',NULL,'',201201250367476,'',NULL,'',0,0,0,'2014-02-15 08:45:35','2014-02-18 08:45:35','2014-02-15 08:45:35','2014-02-15 11:46:33',NULL,2.5,1,0,NULL,NULL),(120,'484163b2c96c4e50ae019644f061f42c','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Corrupti nihil ipsam at.',NULL,'',201202010281247,'',NULL,'',0,0,0,'2014-02-15 08:45:35','2014-02-18 08:45:35','2014-02-15 08:45:35','2014-02-15 10:46:33',NULL,2.5,1,0,NULL,NULL),(121,'f817b0502f754b4081df82894a5286b1','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Consequatur commodi atque ratione eligendi voluptatem corporis et qui.',NULL,'',200811131316882,'',NULL,'',0,0,0,'2014-02-15 08:45:35','2014-02-18 08:45:35','2014-02-15 08:45:35','2014-02-15 09:46:33',NULL,2.5,1,0,NULL,NULL),(122,'34bcd6a7204847e490bb3359494cef76','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Et et accusantium vero ea.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:35','2014-02-18 08:45:35','2014-02-15 08:45:35','2014-02-15 08:46:33',NULL,2.5,1,0,NULL,NULL),(123,'1c61d6ea78704b3f9ad21d3dce0d52fd','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Eum nulla id provident maxime.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2014-02-15 08:45:36','2014-02-18 08:45:36','2014-02-15 08:45:36','2014-02-15 07:46:33',NULL,2.5,1,0,NULL,NULL),(124,'24319996232d467196cf4023e4a2d677','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Quoautesi natuseri</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:36','2014-02-18 08:45:36','2014-02-15 08:45:36','2014-02-15 06:46:33',NULL,2.5,1,0,NULL,NULL),(125,'f3420610d3f94ee9b7c02c0b56efa01c','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Quoautesi natuseri</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:36','2014-02-18 08:45:36','2014-02-15 08:45:36','2014-02-15 05:46:33',NULL,2.5,1,0,NULL,NULL),(126,'c1d29b01faac491c8072277bda9e4270','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Optio voluptas eveniet laudantium quo ea et ducimus. Id ut labore necessitatibus officiis fugit odio. Dolorum molestias et et accusantium.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:37','2014-02-18 08:45:37','2014-02-15 08:45:37','2014-02-15 04:46:33',NULL,2.5,1,0,NULL,NULL),(127,'6a5623cbb1a84393b95bc82f6ecb915e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Sed dolores eos distinctio consequatur et. Veniam est dolor dicta ut quod temporibus sit. Harum rerum ipsam voluptatem vero aut veritatis numquam. Quae aut eum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:37','2014-02-18 08:45:37','2014-02-15 08:45:37','2014-02-15 03:46:33',NULL,2.5,1,0,NULL,NULL),(128,'7c5a4c4893814f32ad829cc6632adbd8','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Placeat et ad nam omnis accusantium sit et ducimus.',NULL,'',201202230021720,'',NULL,'',0,0,0,'2014-02-15 08:45:39','2014-02-18 08:45:39','2014-02-15 08:45:39','2014-02-15 02:46:33',NULL,2.5,1,0,NULL,NULL),(129,'988aa5f1509d43318e0d13c37230ed71','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Illo inventore earum minima.',NULL,'',201301230017775,'',NULL,'',0,0,0,'2014-02-15 08:45:39','2014-02-18 08:45:39','2014-02-15 08:45:39','2014-02-15 01:46:33',NULL,2.5,1,0,NULL,NULL),(130,'b40f3091d37b4609a6c6918e2801bd0b','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Laborum ratione in dolorum a assumenda animi.',NULL,'',200811131328300,'',NULL,'',0,0,0,'2014-02-15 08:45:40','2014-02-18 08:45:40','2014-02-15 08:45:40','2014-02-15 00:46:33',NULL,2.5,1,0,NULL,NULL),(131,'20821f20389547d6aeb63c35c75cf9d3','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Dolore id in sunt.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:40','2014-02-18 08:45:40','2014-02-15 08:45:40','2014-02-14 23:46:33',NULL,2.5,1,0,NULL,NULL),(132,'ff0776f1ceb9428b8ed20a867c4a0b7e','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Et placeat rerum culpa cupiditate alias id perferendis inventore.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2014-02-15 08:45:40','2014-02-18 08:45:40','2014-02-15 08:45:40','2014-02-14 22:46:33',NULL,2.5,1,0,NULL,NULL),(133,'b554bf72b8ee44bdad8b71116338d76f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Voluptatumeri esseensis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:40','2014-02-18 08:45:40','2014-02-15 08:45:40','2014-02-14 21:46:33',NULL,2.5,1,0,NULL,NULL),(134,'605d277d535d47b6a702983d4170dd62','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Voluptatumeri esseensis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:41','2014-02-18 08:45:41','2014-02-15 08:45:41','2014-02-14 20:46:33',NULL,2.5,1,0,NULL,NULL),(135,'b0024bd9a75741adaa21c1594b091c8e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Cumque et dicta fugiat possimus voluptatem. Vel qui in aut. Nobis asperiores quidem qui consequatur sunt. Nesciunt enim blanditiis dicta. Voluptate earum expedita dolorem sed temporibus.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:41','2014-02-18 08:45:41','2014-02-15 08:45:41','2014-02-14 19:46:33',NULL,2.5,1,0,NULL,NULL),(136,'d99ee385c14e4a0b9a2faed243e24504','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Consequatur natus quia voluptate qui. Rerum molestiae voluptatibus eum. Debitis eum voluptatem facilis. Est doloremque quibusdam est aut earum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:42','2014-02-18 08:45:42','2014-02-15 08:45:42','2014-02-14 18:46:33',NULL,2.5,1,0,NULL,NULL),(137,'eb3dbc1a586249e6892519bf946dc4fb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Sequi iure tenetur non unde sed suscipit deserunt cum.',NULL,'',201111011191042,'',NULL,'',0,0,0,'2014-02-15 08:45:43','2014-02-18 08:45:43','2014-02-15 08:45:43','2014-02-14 17:46:33',NULL,2.5,1,0,NULL,NULL),(138,'6e0703bedc2441eea07f63ff39288b60','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Repudiandae nobis aut dolor.',NULL,'',201203290041772,'',NULL,'',0,0,0,'2014-02-15 08:45:44','2014-02-18 08:45:44','2014-02-15 08:45:44','2014-02-14 16:46:33',NULL,2.5,1,0,NULL,NULL),(139,'29291c03092b4b438b39104a15afa29d','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Consequatur enim alias deserunt temporibus aut quo.',NULL,'',200811131392039,'',NULL,'',0,0,0,'2014-02-15 08:45:44','2014-02-18 08:45:44','2014-02-15 08:45:44','2014-02-14 15:46:33',NULL,2.5,1,0,NULL,NULL),(140,'852d34b9605c4be3a880371c2a3375e9','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sed ipsam minima odit et perferendis repellendus.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:44','2014-02-18 08:45:44','2014-02-15 08:45:44','2014-02-14 14:46:33',NULL,2.5,1,0,NULL,NULL),(141,'b408ec8e97bd4eb5b5757454f956157e','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Iste omnis voluptate aliquam aut qui.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2014-02-15 08:45:45','2014-02-18 08:45:45','2014-02-15 08:45:45','2014-02-14 13:46:33',NULL,2.5,1,0,NULL,NULL),(142,'3d397dcfae6e4bb29d695f2e7fa9844e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Ameti maioresis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:45','2014-02-18 08:45:45','2014-02-15 08:45:45','2014-02-14 12:46:33',NULL,2.5,1,0,NULL,NULL),(143,'0520823e2df3483394bc0df57c5fae03','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Ameti maioresis</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:45','2014-02-18 08:45:45','2014-02-15 08:45:45','2014-02-14 11:46:33',NULL,2.5,1,0,NULL,NULL),(144,'3a47fa3a23c84d28af54e082cdc5f8aa','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Vitae porro nam. Tempora quas natus sed. Quae occaecati rerum rem vero eveniet accusamus adipisci. Quia officiis mollitia neque aut sapiente possimus error.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:46','2014-02-18 08:45:46','2014-02-15 08:45:46','2014-02-14 10:46:33',NULL,2.5,1,0,NULL,NULL),(145,'4fef1cbdc8e64dd984de86159a61a67b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Vero sint molestiae nostrum numquam dolor est laboriosam. Pariatur voluptas dignissimos ullam nostrum rerum. Saepe aut excepturi unde nostrum assumenda.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:46','2014-02-18 08:45:46','2014-02-15 08:45:46','2014-02-14 09:46:33',NULL,2.5,1,0,NULL,NULL),(146,'fdf3438e6a444543900406a67775e0b7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Vitae illo minima vero.',NULL,'',201202010290745,'',NULL,'',0,0,0,'2014-02-15 08:45:48','2014-02-18 08:45:48','2014-02-15 08:45:48','2014-02-14 08:46:33',NULL,2.5,1,0,NULL,NULL),(147,'19a70029c315440ea313306b744211e0','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Esse pariatur odio et corrupti sed architecto facere.',NULL,'',201201041249064,'',NULL,'',0,0,0,'2014-02-15 08:45:48','2014-02-18 08:45:48','2014-02-15 08:45:48','2014-02-14 07:46:33',NULL,2.5,1,0,NULL,NULL),(148,'a919741fc48e4a38a0eecc1889cbf0ab','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Tenetur quis tempora quia ut architecto ut laborum.',NULL,'',200811131350808,'',NULL,'',0,0,0,'2014-02-15 08:45:49','2014-02-18 08:45:49','2014-02-15 08:45:49','2014-02-14 06:46:33',NULL,2.5,1,0,NULL,NULL),(149,'1012cf2ef59f4877a31a62ac9b8daa0f','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sint non voluptates pariatur.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:49','2014-02-18 08:45:49','2014-02-15 08:45:49','2014-02-14 05:46:33',NULL,2.5,1,0,NULL,NULL),(150,'31e640c2ff824fcbb3d0156299162439','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Rem sint occaecati cum rerum maiores.',NULL,'',201105040573195,'',NULL,'',0,0,0,'2014-02-15 08:45:49','2014-02-18 08:45:49','2014-02-15 08:45:49','2014-02-14 04:46:33',NULL,2.5,1,0,NULL,NULL),(151,'4593afdd199a41b79766140c7fe939c8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Ipsamalius distinctioerox</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:49','2014-02-18 08:45:49','2014-02-15 08:45:49','2014-02-14 03:46:33',NULL,2.5,1,0,NULL,NULL),(152,'1b98348c7ca64bf3b50f9b6216f31a90','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Ipsamalius distinctioerox</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:49','2014-02-18 08:45:49','2014-02-15 08:45:49','2014-02-14 02:46:33',NULL,2.5,1,0,NULL,NULL),(153,'6183503e311d4e26a9f23e7d5f244eb6','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Maxime voluptas ducimus dolorem eius voluptatibus porro blanditiis. A iusto saepe. Non dolore corporis libero assumenda accusantium. Delectus minus explicabo quia dolore exercitationem enim.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:50','2014-02-18 08:45:50','2014-02-15 08:45:50','2014-02-14 01:46:33',NULL,2.5,1,0,NULL,NULL),(154,'a13f0713f1c240e8aef7b5aa9b7ff1f7','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Possimus ipsum eius ut commodi nobis. Placeat occaecati sit. Ut vero et aut aut sunt non. Enim suscipit tempora est maiores.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:50','2014-02-18 08:45:50','2014-02-15 08:45:50','2014-02-14 00:46:33',NULL,2.5,1,0,NULL,NULL),(155,'17751ca611be46cbb5ff78fc4b0ec1f5','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Autem provident quam consequatur.',NULL,'',201208062341539,'',NULL,'',0,0,0,'2014-02-15 08:45:52','2014-02-18 08:45:52','2014-02-15 08:45:52','2014-02-13 23:46:33',NULL,2.5,1,0,NULL,NULL),(156,'3c662c069ec94a88bf10e409795e85f3','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Iure reprehenderit at ut modi.',NULL,'',201207020117313,'',NULL,'',0,0,0,'2014-02-15 08:45:52','2014-02-18 08:45:52','2014-02-15 08:45:52','2014-02-13 22:46:33',NULL,2.5,1,0,NULL,NULL),(157,'a6ca3fa979bb4e00acc89f2bbf650893','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Mollitia quia sit impedit dolorum.',NULL,'',200811131333809,'',NULL,'',0,0,0,'2014-02-15 08:45:52','2014-02-18 08:45:52','2014-02-15 08:45:52','2014-02-13 21:46:33',NULL,2.5,1,0,NULL,NULL),(158,'e9e5a2324ce041c78af7a78fa56132db','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ab consequatur eum voluptas ut.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:52','2014-02-18 08:45:52','2014-02-15 08:45:52','2014-02-13 20:46:33',NULL,2.5,1,0,NULL,NULL),(159,'f55af8e527f94547ad06046679a25c5d','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Totam est incidunt eum doloribus molestiae expedita necessitatibus.',NULL,'',201105040594149,'',NULL,'',0,0,0,'2014-02-15 08:45:53','2014-02-18 08:45:53','2014-02-15 08:45:53','2014-02-13 19:46:33',NULL,2.5,1,0,NULL,NULL),(160,'045c265260bc4fbeb49073028ba79a1e','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Maximees veritatisatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:53','2014-02-18 08:45:53','2014-02-15 08:45:53','2014-02-13 18:46:33',NULL,2.5,1,0,NULL,NULL),(161,'251fc39b93824d9d8e7e36997cb5d9ce','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Maximees veritatisatus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:53','2014-02-18 08:45:53','2014-02-15 08:45:53','2014-02-13 17:46:33',NULL,2.5,1,0,NULL,NULL),(162,'2c837936c8524034a28654d1866bd1ac','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Perferendis maxime et quidem quibusdam. Molestiae rem odio blanditiis atque voluptatem quia et. Quia vero neque numquam. Labore perferendis optio enim.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:54','2014-02-18 08:45:54','2014-02-15 08:45:54','2014-02-13 16:46:33',NULL,2.5,1,0,NULL,NULL),(163,'614c1d80420c43e98dc5c126249ab533','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Pariatur quod consequatur rem officia beatae corporis qui. Minima similique autem in animi. Odit deserunt consequatur perspiciatis consequatur quidem quisquam. Sed neque harum sit aut sunt odit. Modi aspernatur neque.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:54','2014-02-18 08:45:54','2014-02-15 08:45:54','2014-02-13 15:46:33',NULL,2.5,1,0,NULL,NULL),(164,'ccbd2428f2b84263abdccf5d8e5f4323','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Nesciunt perferendis harum necessitatibus.',NULL,'',201206100250227,'',NULL,'',0,0,0,'2014-02-15 08:45:56','2014-02-18 08:45:56','2014-02-15 08:45:56','2014-02-13 14:46:33',NULL,2.5,1,0,NULL,NULL),(165,'e1d2bf4987624075ac561e67eaba9920','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Quidem aut fugiat sed.',NULL,'',201111012019618,'',NULL,'',0,0,0,'2014-02-15 08:45:56','2014-02-18 08:45:56','2014-02-15 08:45:56','2014-02-13 13:46:33',NULL,2.5,1,0,NULL,NULL),(166,'e69799a9b9d841799fe049457788441d','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Qui beatae quis itaque sit qui corporis quos maxime.',NULL,'',200811131349975,'',NULL,'',0,0,0,'2014-02-15 08:45:57','2014-02-18 08:45:57','2014-02-15 08:45:57','2014-02-13 12:46:33',NULL,2.5,1,0,NULL,NULL),(167,'9554e590c5304209806d4d8a47825718','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sint est velit quia quo.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:45:57','2014-02-18 08:45:57','2014-02-15 08:45:57','2014-02-13 11:46:33',NULL,2.5,1,0,NULL,NULL),(168,'20690b7302054df8ad1e8b8f10543f8b','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Accusantium doloremque dolor quod qui sapiente sit blanditiis rerum.',NULL,'',201105040549843,'',NULL,'',0,0,0,'2014-02-15 08:45:57','2014-02-18 08:45:57','2014-02-15 08:45:57','2014-02-13 10:46:33',NULL,2.5,1,0,NULL,NULL),(169,'8ed34c202c5b4cffa23db5bc31d880cc','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Molestiaeus rationealia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:57','2014-02-18 08:45:57','2014-02-15 08:45:57','2014-02-13 09:46:33',NULL,2.5,1,0,NULL,NULL),(170,'afdeba15a79b487aac663fcfde202dbe','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Molestiaeus rationealia</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:57','2014-02-18 08:45:57','2014-02-15 08:45:57','2014-02-13 08:46:33',NULL,2.5,1,0,NULL,NULL),(171,'cf97c5154b694f5ebdd06879231a679f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Nesciunt in harum minus. Officia asperiores rerum culpa doloremque. Velit illo eos facilis possimus fugiat eveniet. Consequatur alias vero eum. At et rerum tenetur et.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:58','2014-02-18 08:45:58','2014-02-15 08:45:58','2014-02-13 07:46:33',NULL,2.5,1,0,NULL,NULL),(172,'8962a6def42144e08c63d262d24e0e04','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Distinctio eius illo quo accusamus. Odio qui inventore accusamus est distinctio id doloribus. Aliquid aut incidunt et iusto tempore esse.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:45:58','2014-02-18 08:45:58','2014-02-15 08:45:58','2014-02-13 06:46:33',NULL,2.5,1,0,NULL,NULL),(173,'560545febf06470c8ec05e2fa4fd5f5e','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Maiores dolore eum veritatis voluptatibus cum reiciendis.',NULL,'',201111021549802,'',NULL,'',0,0,0,'2014-02-15 08:45:59','2014-02-18 08:45:59','2014-02-15 08:45:59','2014-02-13 05:46:33',NULL,2.5,1,0,NULL,NULL),(174,'f2c1399d48e84c74a8aebc78183c13fb','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Nihil tenetur animi vel consequatur quisquam quo.',NULL,'',201212282365133,'',NULL,'',0,0,0,'2014-02-15 08:46:00','2014-02-18 08:46:00','2014-02-15 08:46:00','2014-02-13 04:46:33',NULL,2.5,1,0,NULL,NULL),(175,'708651405d864ffcb52dbcd82a46f81f','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Est minima deserunt cum tempore recusandae molestias iste eum.',NULL,'',200811131317614,'',NULL,'',0,0,0,'2014-02-15 08:46:00','2014-02-18 08:46:00','2014-02-15 08:46:00','2014-02-13 03:46:33',NULL,2.5,1,0,NULL,NULL),(176,'015fe6f45d6d4dbf95abbf2ee6689b33','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Maiores nihil praesentium ullam incidunt quo voluptate nulla.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:00','2014-02-18 08:46:00','2014-02-15 08:46:00','2014-02-13 02:46:33',NULL,2.5,1,0,NULL,NULL),(177,'c7837eeb422941fe9ebcb00337ef7930','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Et et a aliquam.',NULL,'',201105040554365,'',NULL,'',0,0,0,'2014-02-15 08:46:00','2014-02-18 08:46:00','2014-02-15 08:46:00','2014-02-13 01:46:33',NULL,2.5,1,0,NULL,NULL),(178,'255baf48816f4ebd9006f47012ed7dc3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Fugitens dolorealius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:01','2014-02-18 08:46:01','2014-02-15 08:46:01','2014-02-13 00:46:33',NULL,2.5,1,0,NULL,NULL),(179,'ff20aa5d31484bad8d3f07102f6d517d','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Fugitens dolorealius</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:01','2014-02-18 08:46:01','2014-02-15 08:46:01','2014-02-12 23:46:33',NULL,2.5,1,0,NULL,NULL),(180,'6c62d90d8dac4613b59fac405730c1d8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Esse est asperiores qui sint libero eligendi suscipit. Neque repudiandae totam velit et voluptatem. Quod laborum sit qui et in voluptatem optio. Ut non soluta doloribus. Aut non aut porro amet.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:02','2014-02-18 08:46:02','2014-02-15 08:46:02','2014-02-12 22:46:33',NULL,2.5,1,0,NULL,NULL),(181,'ded64c0b7e1f4ee995422923aeeb0b95','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ea incidunt perspiciatis tempora temporibus quos. Officiis sint aut assumenda qui qui. Architecto eum occaecati debitis.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:03','2014-02-18 08:46:03','2014-02-15 08:46:03','2014-02-12 21:46:33',NULL,2.5,1,0,NULL,NULL),(182,'04282176ee1b4953af1fd80da3d8142f','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Eaque quis eligendi quia possimus iure.',NULL,'',201203270178402,'',NULL,'',0,0,0,'2014-02-15 08:46:04','2014-02-18 08:46:04','2014-02-15 08:46:04','2014-02-12 20:46:33',NULL,2.5,1,0,NULL,NULL),(183,'3c313e00c94a4eba84be02083c307f72','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Dolor doloribus odio non totam sed.',NULL,'',201111020456873,'',NULL,'',0,0,0,'2014-02-15 08:46:04','2014-02-18 08:46:04','2014-02-15 08:46:04','2014-02-12 19:46:33',NULL,2.5,1,0,NULL,NULL),(184,'7680770e2b19473fb343983efd74475e','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Ad pariatur facilis inventore nostrum distinctio.',NULL,'',200811131356003,'',NULL,'',0,0,0,'2014-02-15 08:46:05','2014-02-18 08:46:05','2014-02-15 08:46:05','2014-02-12 18:46:33',NULL,2.5,1,0,NULL,NULL),(185,'789f89e7398b45a1a27bcef9c33dd221','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Quo est saepe voluptates aspernatur omnis et.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:05','2014-02-18 08:46:05','2014-02-15 08:46:05','2014-02-12 17:46:33',NULL,2.5,1,0,NULL,NULL),(186,'f7efa834b65a4a1aa4ded71c01324dd0','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Consectetur mollitia rerum quisquam debitis possimus id minima quam.',NULL,'',201105040529974,'',NULL,'',0,0,0,'2014-02-15 08:46:05','2014-02-18 08:46:05','2014-02-15 08:46:05','2014-02-12 16:46:33',NULL,2.5,1,0,NULL,NULL),(187,'9268a3ee6b534048b6787e67f94d00f8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Quisquamator sequieles</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:06','2014-02-18 08:46:06','2014-02-15 08:46:06','2014-02-12 15:46:33',NULL,2.5,1,0,NULL,NULL),(188,'368981c79c9f43e4b74af9a72556ad01','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Quisquamator sequieles</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:06','2014-02-18 08:46:06','2014-02-15 08:46:06','2014-02-12 14:46:33',NULL,2.5,1,0,NULL,NULL),(189,'1c90dec70bc143a1844260f1561804b4','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Veniam quam hic minus officia adipisci. Eum tenetur vitae molestias cupiditate. Optio et quos inventore dolorem.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:06','2014-02-18 08:46:06','2014-02-15 08:46:06','2014-02-12 13:46:33',NULL,2.5,1,0,NULL,NULL),(190,'92ea2cbd9bb247bca19e085b7e266a63','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ullam tempore voluptatibus voluptas soluta. Non illum nemo aut. Et omnis ullam autem similique ut autem est.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:07','2014-02-18 08:46:07','2014-02-15 08:46:07','2014-02-12 12:46:33',NULL,2.5,1,0,NULL,NULL),(191,'1f59f94b439b4c7a9df9842d7f8bf2a7','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Neque corrupti minima autem animi nihil exercitationem et aut.',NULL,'',201111020680528,'',NULL,'',0,0,0,'2014-02-15 08:46:08','2014-02-18 08:46:08','2014-02-15 08:46:08','2014-02-12 11:46:33',NULL,2.5,1,0,NULL,NULL),(192,'e3a7dd6aa3954b44b63d6b73a9eb173e','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Dolorem et minus laborum et et beatae id provident.',NULL,'',201111020677567,'',NULL,'',0,0,0,'2014-02-15 08:46:09','2014-02-18 08:46:09','2014-02-15 08:46:09','2014-02-12 10:46:33',NULL,2.5,1,0,NULL,NULL),(193,'bff924a18b6f409198e4bb9f7d110a8b','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sed eveniet perferendis optio ullam aut sint cupiditate.',NULL,'',200811131372942,'',NULL,'',0,0,0,'2014-02-15 08:46:09','2014-02-18 08:46:09','2014-02-15 08:46:09','2014-02-12 09:46:33',NULL,2.5,1,0,NULL,NULL),(194,'0cf05bf17b574d06a8fc835a8dd1b6cb','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Dolore eum aut qui.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:09','2014-02-18 08:46:09','2014-02-15 08:46:09','2014-02-12 08:46:33',NULL,2.5,1,0,NULL,NULL),(195,'4c58c9518b5c4c278a1220dc4f1b3df6','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Quia impedit dolores accusantium deserunt.',NULL,'',201105040538097,'',NULL,'',0,0,0,'2014-02-15 08:46:10','2014-02-18 08:46:10','2014-02-15 08:46:10','2014-02-12 07:46:33',NULL,2.5,1,0,NULL,NULL),(196,'2b19e0b8218545c8a064c5c2582bbfbc','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Bacteria</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:10','2014-02-18 08:46:10','2014-02-15 08:46:10','2014-02-12 06:46:33',NULL,2.5,1,0,NULL,NULL),(197,'0754513ca5784b8d8921bea7af9fe9ab','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Bacteria</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:10','2014-02-18 08:46:10','2014-02-15 08:46:10','2014-02-12 05:46:33',NULL,2.5,1,0,NULL,NULL),(198,'0f9f47f2521b4c698dc2fa0c4b4266c8','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Inventore dignissimos quia. Aperiam voluptate sit aut labore commodi. Omnis molestiae doloribus sint id laudantium amet mollitia. Nobis officia ratione minima voluptas magni quod quaerat.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:11','2014-02-18 08:46:11','2014-02-15 08:46:11','2014-02-12 04:46:33',NULL,2.5,1,0,NULL,NULL),(199,'9e392335e04e4f7180169cd99e204f5b','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Aut sint accusamus suscipit qui omnis quaerat quis. Non sunt ex non sed dolores perferendis. Culpa dignissimos qui sunt incidunt quia aut.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:11','2014-02-18 08:46:11','2014-02-15 08:46:11','2014-02-12 03:46:33',NULL,2.5,1,0,NULL,NULL),(200,'35cdda325cef47a5804b4fc997173924','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Quod fuga tempora ipsum corrupti et est asperiores quia.',NULL,'',201201290348969,'',NULL,'',0,0,0,'2014-02-15 08:46:14','2014-02-18 08:46:14','2014-02-15 08:46:14','2014-02-12 02:46:33',NULL,2.5,1,0,NULL,NULL),(201,'16db2c173ca642febdde36c14bfdf2f8','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Repellat ut nostrum possimus labore.',NULL,'',201111240192495,'',NULL,'',0,0,0,'2014-02-15 08:46:14','2014-02-18 08:46:14','2014-02-15 08:46:14','2014-02-12 01:46:33',NULL,2.5,1,0,NULL,NULL),(202,'a13e6cbc14d64ebd8bbb64975d0f9557','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Et voluptatem in ea inventore similique ut rerum eius.',NULL,'',200811131393363,'',NULL,'',0,0,0,'2014-02-15 08:46:14','2014-02-18 08:46:14','2014-02-15 08:46:14','2014-02-12 00:46:33',NULL,2.5,1,0,NULL,NULL),(203,'e801444f76dc4616934e788f8c7ee18b','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Vel ipsum perspiciatis quae cumque ea hic itaque.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:14','2014-02-18 08:46:14','2014-02-15 08:46:14','2014-02-11 23:46:33',NULL,2.5,1,0,NULL,NULL),(204,'adfefe4b5e1f429aa7dbaa7d500f6846','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Qui aut pariatur asperiores sed nihil non ea excepturi.',NULL,'',201105040535175,'',NULL,'',0,0,0,'2014-02-15 08:46:14','2014-02-18 08:46:14','2014-02-15 08:46:14','2014-02-11 22:46:33',NULL,2.5,1,0,NULL,NULL),(205,'f38a9efe114c4131bcd5655bdb734000','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Essees eaqueata</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:14','2014-02-18 08:46:14','2014-02-15 08:46:14','2014-02-11 21:46:33',NULL,2.5,1,0,NULL,NULL),(206,'3b3ac73a357b4057b8505996e1cb6dc3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Essees eaqueata</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:15','2014-02-18 08:46:15','2014-02-15 08:46:15','2014-02-11 20:46:33',NULL,2.5,1,0,NULL,NULL),(207,'edc6e6b75111442aa179b6287fa295c1','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Sapiente voluptatem maxime molestias sit natus. Alias qui unde nihil ut. Sapiente suscipit ad. Dolorem est animi perspiciatis doloribus rerum. Voluptatibus nesciunt esse nam a.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:15','2014-02-18 08:46:15','2014-02-15 08:46:15','2014-02-11 19:46:33',NULL,2.5,1,0,NULL,NULL),(208,'7340f8e14ed441f291d81158ee2dc7ed','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Ex praesentium magni et nihil sunt in mollitia. Quo quis similique quia culpa aut sunt dolor. Magni facilis eius voluptates eos perferendis. Sed facere quo adipisci.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:15','2014-02-18 08:46:15','2014-02-15 08:46:15','2014-02-11 18:46:33',NULL,2.5,1,0,NULL,NULL),(209,'4e6edf58df004337a14f0ca8920ed0ed','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Molestias rerum ipsa omnis est a non consectetur.',NULL,'',201206250194550,'',NULL,'',0,0,0,'2014-02-15 08:46:17','2014-02-18 08:46:17','2014-02-15 08:46:17','2014-02-11 17:46:33',NULL,2.5,1,0,NULL,NULL),(210,'7d86d65dce554bddb7cfa33c0f0cc310','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Et nobis sit repudiandae necessitatibus dolorem aut eveniet tenetur.',NULL,'',201201070101022,'',NULL,'',0,0,0,'2014-02-15 08:46:17','2014-02-18 08:46:17','2014-02-15 08:46:17','2014-02-11 16:46:33',NULL,2.5,1,0,NULL,NULL),(211,'ca5485cfbaaa4aaf8bf8b808d0c7eef3','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Sint maiores debitis in unde accusantium repellat.',NULL,'',200811131382901,'',NULL,'',0,0,0,'2014-02-15 08:46:18','2014-02-18 08:46:18','2014-02-15 08:46:18','2014-02-11 15:46:33',NULL,2.5,1,0,NULL,NULL),(212,'7083f3dd329945d79636dec4b7fd0608','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Nisi asperiores accusantium magnam ipsa ut quod consequatur repellendus.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:18','2014-02-18 08:46:18','2014-02-15 08:46:18','2014-02-11 14:46:33',NULL,2.5,1,0,NULL,NULL),(213,'cb17288804b749339fd76142b6068169','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Rerum voluptatem repudiandae accusantium id.',NULL,'',201105040549841,'',NULL,'',0,0,0,'2014-02-15 08:46:18','2014-02-18 08:46:18','2014-02-15 08:46:18','2014-02-11 13:46:33',NULL,2.5,1,0,NULL,NULL),(214,'55c1920b76114578ab9a48c1599dfae3','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Animiens atdoloribuseron</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:18','2014-02-18 08:46:18','2014-02-15 08:46:18','2014-02-11 12:46:33',NULL,2.5,1,0,NULL,NULL),(215,'91d1cc6f60a24b5b84a8b2ff69259fd5','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Animiens atdoloribuseron</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:19','2014-02-18 08:46:19','2014-02-15 08:46:19','2014-02-11 11:46:33',NULL,2.5,1,0,NULL,NULL),(216,'f6bc491307a740c6b7ea9fb7eff0f033','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Est non eum et similique. Cum non sed ab. Qui enim sapiente nobis sit qui. Aut nam aut illum impedit sit eum. Dolorem asperiores ut numquam deleniti autem.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:19','2014-02-18 08:46:19','2014-02-15 08:46:19','2014-02-11 10:46:33',NULL,2.5,1,0,NULL,NULL),(217,'3ea4f8fcdcf344a79c1d6570f229e2af','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Eveniet hic est quibusdam autem dolores ut. Quia voluptatibus totam ad ipsam et quod deserunt. Voluptates expedita impedit odit explicabo architecto nisi voluptatem.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:19','2014-02-18 08:46:19','2014-02-15 08:46:19','2014-02-11 09:46:33',NULL,2.5,1,0,NULL,NULL),(218,'78771854e9a341faaf642bb5deabce08','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Velit ducimus et doloribus quo veniam molestiae voluptate.',NULL,'',201301070350990,'',NULL,'',0,0,0,'2014-02-15 08:46:21','2014-02-18 08:46:21','2014-02-15 08:46:21','2014-02-11 08:46:33',NULL,2.5,1,0,NULL,NULL),(219,'c3eac32dece64cd0a47dd3ba02924fb8','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Dolorem magni qui accusamus.',NULL,'',201205060097570,'',NULL,'',0,0,0,'2014-02-15 08:46:21','2014-02-18 08:46:21','2014-02-15 08:46:21','2014-02-11 07:46:33',NULL,2.5,1,0,NULL,NULL),(220,'650ec9c3ba884502adbb2a4ff98a51be','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Quo nemo vero ut eveniet sed labore ullam natus.',NULL,'',200811131355461,'',NULL,'',0,0,0,'2014-02-15 08:46:21','2014-02-18 08:46:21','2014-02-15 08:46:21','2014-02-11 06:46:33',NULL,2.5,1,0,NULL,NULL),(221,'3f6e7fa042064181a7c7df2a22d93b74','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Cumque est veritatis facere.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:22','2014-02-18 08:46:22','2014-02-15 08:46:22','2014-02-11 05:46:33',NULL,2.5,1,0,NULL,NULL),(222,'c8aa25d6ab994527b0f43bca9f103593','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','Non aut fugit tenetur molestias.',NULL,'',201105040560889,'',NULL,'',0,0,0,'2014-02-15 08:46:22','2014-02-18 08:46:22','2014-02-15 08:46:22','2014-02-11 04:46:33',NULL,2.5,1,0,NULL,NULL),(223,'552d2ff360474e9fb592a8da24958548','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Adaliasii iurea</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:22','2014-02-18 08:46:22','2014-02-15 08:46:22','2014-02-11 03:46:33',NULL,2.5,1,0,NULL,NULL),(224,'89ce22daff964d4294f461e7a1de990f','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Adaliasii iurea</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:23','2014-02-18 08:46:23','2014-02-15 08:46:23','2014-02-11 02:46:33',NULL,2.5,1,0,NULL,NULL),(225,'1e319f0dc7a94d4eb97b172685200617','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Quos voluptates sequi ut consequatur dolor iure. Nihil ea dolorem minus dignissimos facilis ut libero. Deserunt aliquid nemo assumenda. Non ducimus quis magnam voluptas cupiditate.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:23','2014-02-18 08:46:23','2014-02-15 08:46:23','2014-02-11 01:46:33',NULL,2.5,1,0,NULL,NULL),(226,'2c313807a2744657996938a87bc603a2','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Est velit odio quo commodi sed. Atque dolor eius sed. Debitis quia vitae. Quia error ratione distinctio natus totam reprehenderit. Et illo et omnis repudiandae rem expedita rerum.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:23','2014-02-18 08:46:23','2014-02-15 08:46:23','2014-02-11 00:46:33',NULL,2.5,1,0,NULL,NULL),(227,'99137c4597dc44a8a973455f0342c574','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Consequatur provident vitae qui et.',NULL,'',201111021659647,'',NULL,'',0,0,0,'2014-02-15 08:46:25','2014-02-18 08:46:25','2014-02-15 08:46:25','2014-02-10 23:46:33',NULL,2.5,1,0,NULL,NULL),(228,'9505738be7d14b15b2e438d838dce61c','',NULL,2,NULL,1,'',1,NULL,1,'Test rights statement','','','','Sit nihil magni distinctio facere dolorum.',NULL,'',201111210127467,'',NULL,'',0,0,0,'2014-02-15 08:46:25','2014-02-18 08:46:25','2014-02-15 08:46:25','2014-02-10 22:46:33',NULL,2.5,1,0,NULL,NULL),(229,'7381fa502c334db6a10fce00b5e5b168','',NULL,7,NULL,5,'',1,NULL,1,'Test rights statement','','','','Quo ad id molestias sequi.',NULL,'',200811131374742,'',NULL,'',0,0,0,'2014-02-15 08:46:26','2014-02-18 08:46:26','2014-02-15 08:46:26','2014-02-10 21:46:33',NULL,2.5,1,0,NULL,NULL),(230,'af5b96eba19e42b8bdf09727521007b1','',NULL,6,NULL,5,'',1,NULL,1,'Test rights statement','','','','Cum asperiores animi doloremque.',NULL,'',0,'',NULL,'',0,0,0,'2014-02-15 08:46:26','2014-02-18 08:46:26','2014-02-15 08:46:26','2014-02-10 20:46:33',NULL,2.5,1,0,NULL,NULL),(231,'e0b2fa74cf804e9495f2432c332aacb4','',NULL,3,NULL,2,'',1,NULL,1,'Test rights statement','','','','In ut delectus omnis eum veniam error neque animi.',NULL,'',201105040555104,'',NULL,'',0,0,0,'2014-02-15 08:46:26','2014-02-18 08:46:26','2014-02-15 08:46:26','2014-02-10 19:46:33',NULL,2.5,1,0,NULL,NULL),(232,'3fa828f8b76e4f84ab38887f8c1140a1','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an overview of the <b>Nonnumquamerus numquamerus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:26','2014-02-18 08:46:26','2014-02-15 08:46:26','2014-02-10 18:46:33',NULL,2.5,1,0,NULL,NULL),(233,'969b1a8383d34fef8ce48da43a8612c7','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','This is an description of the <b>Nonnumquamerus numquamerus</b> hierarchy entry.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:26','2014-02-18 08:46:26','2014-02-15 08:46:26','2014-02-10 17:46:33',NULL,2.5,1,0,NULL,NULL),(234,'c7103b85c7e34ec1bd6c80823e088049','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Et quas soluta quis quisquam molestiae. Dolorum ipsa quos voluptatum nostrum. Quis facilis quia. Voluptatem id possimus et perspiciatis quasi est. Nobis est omnis magni quo.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:27','2014-02-18 08:46:27','2014-02-15 08:46:27','2014-02-10 16:46:33',NULL,2.5,1,0,NULL,NULL),(235,'035b4fa1fb8349a1a75c5ec3bb4d84db','',NULL,1,NULL,3,'',1,NULL,3,'Test rights statement','Someone','','','Beatae nulla non explicabo quis. Repellendus dicta eum. Voluptate nam nostrum voluptatem et. Est dignissimos inventore.',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:27','2014-02-18 08:46:27','2014-02-15 08:46:27','2014-02-10 15:46:33',NULL,2.5,1,0,NULL,NULL),(236,'aa8a71e7510345a2b7b30efa3765b48d','',NULL,2,NULL,1,'',1,NULL,3,'Test rights statement','Test rights holder','','','Test Data Object',NULL,'',NULL,'',NULL,'',0,0,0,'2014-02-15 08:46:36','2014-02-18 08:46:36','2014-02-15 08:46:36','2014-02-17 08:46:36',NULL,2.5,1,0,NULL,NULL);
/*!40000 ALTER TABLE `data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_harvest_events`
--

DROP TABLE IF EXISTS `data_objects_harvest_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_harvest_events` (
  `harvest_event_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`harvest_event_id`,`data_object_id`),
  KEY `index_data_objects_harvest_events_on_guid` (`guid`),
  KEY `index_data_objects_harvest_events_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_harvest_events`
--

LOCK TABLES `data_objects_harvest_events` WRITE;
/*!40000 ALTER TABLE `data_objects_harvest_events` DISABLE KEYS */;
INSERT INTO `data_objects_harvest_events` VALUES (2,2,'63bc0fb4110f02f511278dbc993f6606',1),(2,3,'1d4e71aff2d76870060ad90ef478e187',1),(2,4,'c7128c403252b6596a662bc6f305c200',1),(2,5,'6e15e8f732611fc13e1ed277785bdb46',1),(2,6,'15d1da74a37b9c3edeb5b2284e104a2f',1),(2,7,'b0cd08da80a1c3b47b3b09ceef20304e',1),(2,8,'17bd0ac0760df74efb3dfa8bdac8a1be',1),(2,9,'4d473c7a2fbe0d8e1d8c579379b6bdc3',1),(2,10,'f15546bc8073f750cfac45dbcd829cbb',1),(2,11,'e4d638e5e93ea99e778288d9367fc71a',1),(2,12,'7e626fa13c5873613763ce8b647bee91',1),(2,13,'92b44b49eec192b4fc03b0446118cfc1',1),(2,14,'7c834682cc363caac15dd10ec7d22e46',1),(2,15,'e7dfa0454c713c2f09c751823e7b6d89',1),(2,16,'7bf8cd3b8a953400236865787fe255a6',1),(2,17,'bcfadb913dccba0c61d1376acc167af3',1),(2,18,'14ef8935e320c0798eeceeb41117a68e',1),(2,19,'304a74d006a50cabc09b788c418dc77d',1),(2,20,'e5d75988279d77e30f7455aeba990866',1),(2,21,'5a8e86b2ea2efeac6034a31d1fd11417',1),(2,22,'ca50927088272b0545f772adcb6c1956',1),(2,23,'8af6b8eeda97688bcdfe753fda9fa090',1),(2,24,'8470c1a073abbb51d91ffd42834e3dec',1),(2,25,'fafd0d95feb124bf8e485e5469fdaa19',1),(2,26,'e45a9d8fc77acf751d153d52f9d587ee',1),(2,27,'6382212f0fb2d9e52d2f96a514aefe6d',1),(2,28,'d3f79022b8744621ecb39d24ea4243e2',1),(2,29,'f2d2490af0639907044f797533ff41cc',1),(2,30,'8101af22c93ab20130a2accead6645ed',1),(2,31,'c00a658b3fe2863164f796e1a1a286eb',1),(2,32,'7c4f49b2466f1ae04a2107eb1e47ec1f',1),(2,33,'ee055daaa016598623516219b5662898',1),(2,34,'6858fea5ef57970e648795314a849f3f',1),(2,35,'b735e36959e7ebe936dfb8d7cd193c58',1),(2,36,'b8f914866e1193fe44d8307dcb1b406e',1),(2,37,'78973d02ef0c1bfa31fc988af177e24c',1),(2,38,'e79db7b365b2a8cfdfd53df2a2fb632e',1),(2,39,'b4e3261fd6a1f908779f3c4953840efb',1),(2,40,'0090e6389f999fea20fd2974b45d345d',1),(2,41,'2963d6381319dc54689d7bdac0a57833',1),(2,42,'5b219bfa8371c61441284444cdcda18a',1),(2,43,'2a5f951d7c6adfb7c314b86757b3b446',1),(2,44,'4cbab47746ecb9e4a13538249c5e0db4',1),(2,45,'46c4fbd706b2a96e5d3ab2bda089f393',1),(2,46,'4ae2e3508ceeec265fc3cb4ba1af9777',1),(2,47,'8de33ac04a76000221dde75189637b11',1),(2,48,'6bacf8b2d24961487a39093f8cb306a9',1),(2,49,'80e863fb1fc218c9357803189f658486',1),(2,50,'ad16ad036da1e66be00397e683f3e63c',1),(2,51,'3bd56012e8465e35f131d2724709b546',1),(2,52,'7b077177405c34046839642d8c2559df',1),(2,53,'d487467c9c4863c3702a275a46408d1c',1),(2,54,'67c694a765eea6d0348d128511b3ec0f',1),(2,55,'5da8c7c8b77c096a219ca952ed09a137',1),(2,56,'09c9a541eb25fefb6d58c1e977c01e88',1),(2,57,'eb0af4f3dded31009e435cb994e7415e',1),(2,58,'d0a51134c0f82d7d158aabd5be03f700',1),(2,59,'4746fe2d3d4cf323c7e5b8c3dba84725',1),(2,60,'d3cbf74d24681051bcbad049bfa686a4',1),(2,61,'f0617c575110061c2a9f11d2afa2cf90',1),(2,62,'4e65f696aada0e91ad0117b87a650486',1),(2,63,'afa75eda796a981ed3ce5e19d7ed694c',1),(2,64,'9b2690c3177e243ad5a7cf7d4618d0f6',1),(2,65,'595aa0c2a9225d5c2c4d3ff8c7af7519',1),(2,66,'7b9e6d6b6292dae2a73d3b375abfc38d',1),(2,67,'9bbda5814bfefad3da13512c14ece405',1),(2,68,'fa04c7c9b14c7308d1e25e76adbcee2a',1),(2,69,'404d65e4085576c1332b7ce019948c24',1),(2,70,'3246376c26aee3a6fb8d1e8f1a182da1',1),(2,71,'039d783c023d392b4d8ed682c3a23ad0',1),(2,72,'3675225c6e0b60926d29d71fa60e1718',1),(2,73,'a5278488e98e87f2859f9036ffcee5ed',1),(2,74,'29c574f74466e5c5389dd0f9b8725921',1),(2,75,'131557bd1c6b9e4d06fb0aae2624d3c7',1),(2,76,'a68bf1c7b7eed1798918d6929ac5ccdb',1),(2,77,'f55d8515b734a60f73b18cb6fd244399',1),(2,78,'f503b92c62e11e7e24eb3145857a541c',1),(2,79,'2ef4a64309aa3dfa93b2c39612a5a81f',1),(2,80,'f2b6c2183a378f91d7c55445a1382963',1),(2,81,'5cf874bfe46feef2240b7184d9d578c0',1),(2,82,'b5511a7a4a8a75962554b04fc2a70bfe',1),(2,83,'7057bbdd8dda6b297679a7a51af71f1d',1),(2,84,'264c4639d039bfdeb579d82b490aad94',1),(2,85,'08f346a2d852b563e5cbae7977df1af6',1),(2,86,'8713d496eff397a4661c6cf2ebaecfca',1),(2,87,'c70a3b03114e5641f89296562827bebe',1),(2,88,'c67bfe3fe3daa3658e8a1f8380ad5e24',1),(2,89,'49476e0f73e0c903595912671c314021',1),(2,101,'83b73bfa687272700b7ef1107bacac34',1),(2,102,'fa3514976eac4b1b381291a2df829115',1),(2,103,'d745d1dc3a861f1a8a80f4d85dbf3e92',1),(2,104,'c5958b535801e8b187060c015ad8b915',1),(2,105,'a1049571fc02163cb328cb7967c263ca',1),(2,106,'386947e1344e67ce64280890733a8e1b',1),(2,107,'f405adadc577e2042d0f38bbc5cabd81',1),(2,108,'0b16fe1c86332f3249dd49694825d602',1),(2,109,'95c4153f164cdf72e29d4912e251e087',1),(2,110,'da96c7742ed9b2faf547c8ce9093d3fc',1),(2,111,'092044bf54eaed4e30376b2afdff6b9f',1),(2,112,'630049a4da239e4d98cd47b81699e859',1),(2,113,'663a492a47e21c6430b6c9eb811bb34a',1),(2,114,'ec3d13eafca3c597165fa3d8b480d578',1),(2,115,'37a8816f0b2d772e3ea2eebea5c246d6',1),(2,116,'e6a3044783b4987eed720c0b773ddd98',1),(2,117,'91e252f7673df6110317b3bf05e25780',1),(2,118,'efe0613e84241982168a1f639554540c',1),(2,119,'07558bbde0edfd14fb4ffd573e962255',1),(2,120,'a30e888b66ddabea5c13583e1f71645a',1),(2,121,'89920bab6f5315dbcaa579b71ccb84ff',1),(2,122,'bb4db078e0773724d89f5bb68804e796',1),(2,123,'ae9a2d942d7a6a2aa2836b7493918f25',1),(2,124,'659e1e37bd2d897b2cd2368ea55f2780',1),(2,125,'7b5dd1739cb93cbf8ae10cac515d7003',1),(2,126,'12321148f89b8862b42b740e6595d15e',1),(2,127,'8748447a1cc15b898f8be9907f371996',1),(2,128,'459ba91ea91e48f380ba40d3e48e9d22',1),(2,129,'c6c7bdbcd34e28f447effec358681420',1),(2,130,'d9dcebd5a199a3bdcceca227da8b3d17',1),(2,131,'2a15af6fc278a53009ec76416e4face4',1),(2,132,'e3ae92fcc0847cd1e2167349148efe71',1),(2,133,'381feb83a99b15a2cfb48771abefd838',1),(2,134,'f7d25afbdf6eb85cbd890145f448b992',1),(2,135,'7202ae3e94d1583a2e0850d2d8ff4638',1),(2,136,'e64b9809cd6fb5e806f9408fe4a3c1e4',1),(2,137,'60a83d3df93bf0e2f8cabe8b4a8b1699',1),(2,138,'9be67bc54d8bdac4104203f48b8f91fd',1),(2,139,'7320134ee6bc93f0a02dfb3b04bdd973',1),(2,140,'20be31a0b897eda65df206e6c4b86337',1),(2,141,'9a7b4c2a52bfea5d3d8c6bf98f5ea261',1),(2,142,'dae6b49e4eed6332cc0826dae888f110',1),(2,143,'d4f31a1b0533e7367e469039a2273f6c',1),(2,144,'80d050c8ced8d75581ed0a8b6e6ae4a0',1),(2,145,'e2e03fb553a61b4ca38eeb02833f8c4c',1),(2,146,'a3209762413815abbc512843ad32cff7',1),(2,147,'90eddd6800e57ea99e2f0a0fdca7db08',1),(2,148,'6ef18b19d0e3614d9f3268cd929e0853',1),(2,149,'7dc851bfa7831cfb0b12b418ddf89bf9',1),(2,150,'f4092d017c1183a41da89ea0b9826f90',1),(2,151,'4347ad960f7934bb4d90a608e469b279',1),(2,152,'a6f3b9f08d3e3fff83aa36cc825024aa',1),(2,153,'412030c6389369c8795dd5e0ff552486',1),(2,154,'4594a8032c0d7997f087190ff0f585e9',1),(2,155,'8afacb95e920c3b9a64b6ff771eafdc9',1),(2,156,'cbee71ba5618653532e9bfe3219e88dd',1),(2,157,'3fb255600702afcc7074fc558b576ed2',1),(2,158,'f6cb5d2505f25fadb0fcd3be195e758c',1),(2,159,'80ec71973202087b519a6d1f60ee093e',1),(2,160,'84f3e8838acc86468cefe4f0b28f91b0',1),(2,161,'9b74d578fd1f12af3e62f4452a6c805f',1),(2,162,'ad6fbea0201ed0a07e92896b0c79897f',1),(2,163,'330f9cbcc074fd106e997d5ad0184f4f',1),(2,164,'84d6ac6077ca03c258223716029286f7',1),(2,165,'b1632ba4f2c90df430862a6562c57b12',1),(2,166,'deaaa765bba1178b275c1002d11f4f42',1),(2,167,'5366276b8bb797ff99f8abc28e5c8eef',1),(2,168,'f77339df26d16594a4a396f6b0c8fa9a',1),(2,169,'6cb43ca84282ed4320471d031315066e',1),(2,170,'3a831c70c90d4088bd18bd14c47cc4af',1),(2,171,'0c408bc1e6cfac6c230315786b09638c',1),(2,172,'271bb43ab67d2a9ded2037a079027171',1),(2,173,'1c333abad58e286a6bf13969c4d09425',1),(2,174,'ace1bc28e937229a18eabd2015d7e128',1),(2,175,'3e0fad3670f5233c0b48ff8a36a454fb',1),(2,176,'52d2e3f21a84fb8943c7ae216df510a9',1),(2,177,'947127489ef0732a428b15419dc77348',1),(2,178,'f760dfc6fbf2ff435ee33c26a9336e69',1),(2,179,'dcd011ec2f267aeb052d048a9c04f0b5',1),(2,180,'ade5eac1250e8a9d53f6c74edf9a0a37',1),(2,181,'fd7d989bfcf7caef9de7e0d27b171f6e',1),(2,182,'a029bd11e1a90b1f2737b4cf0f26bb07',1),(2,183,'d1522a08061bbc87c53ed7f129ac5199',1),(2,184,'efd14b08f4c9513268b10955ec4f28ae',1),(2,185,'5d422e262772fc4de729596d835cba1e',1),(2,186,'5d221533ea149cd47b7384f744cb8ebb',1),(2,187,'78a05bc80eefd4964d769884b46e3d41',1),(2,188,'28fcdd37aa98169401548b84a84b46b5',1),(2,189,'491f9a9a144042d49852cc48369f36cc',1),(2,190,'733ad17f3c317c70b24f2870ccda910f',1),(2,191,'4159ead0167f4de18837ee195c9f4fad',1),(2,192,'896fb5bcc17c2e9db20a6411b3e2ea80',1),(2,193,'dfbacb7fe1b614b57b31d7496d95dacd',1),(2,194,'01fa7fc4086b01bc0d4f868067ae848e',1),(2,195,'a5c26cb687971aa3b01391a69c9d483b',1),(2,196,'2eb2470714271c941893e32feb443cea',1),(2,197,'fd113d5913f736a606aeb4d97b2ae02f',1),(2,198,'6f85be1a72080b934f6cbf40bd5a303f',1),(2,199,'962bdb4033b2fc011c3e9511b72cd88d',1),(2,200,'4551f0f441f21d351c8bd9f49ed66db2',1),(2,201,'d7dca72314086ca1034099aca5b129a4',1),(2,202,'804e596efe27ee0490778807bb2ca318',1),(2,203,'0e0fe2b377c035e55f842175fcdcf402',1),(2,204,'e1ccc309825c276fefd75d2f6d04b279',1),(2,205,'a61c4cc88be949ec00ac583e4c17c9e5',1),(2,206,'3dd3536e6d0680330999f5cfa7f11652',1),(2,207,'c96fe932552d3d897272d5e5d58046a6',1),(2,208,'58566599e13b4841123c9a48d1284a4e',1),(2,209,'baad626c18c1b6504c962d30a1b5cb18',1),(2,210,'6dc25032608deff683ff7d08477bfa6e',1),(2,211,'c2d78f31d0ab26f25189968b5af4c36b',1),(2,212,'e0c98b343a73805fbf58ff7b73955ad3',1),(2,213,'f0a0fa5d3536bdd0bfc7c111762fbf8d',1),(2,214,'15e6db48fe4cce9eff0a3a43fedab5ac',1),(2,215,'52f86c814266a95fb6482d3543642204',1),(2,216,'5ed5988289fea795ab308d23796af14d',1),(2,217,'6aac2af355f0ee2c2e7e59b6cc0f57c2',1),(2,218,'90ab693f3b3a5a69f751c214e4631e25',1),(2,219,'2f9f52e5ce3977c51a16549238775b1c',1),(2,220,'a1c3502f5f0e2368ea3b9d4dade4cc65',1),(2,221,'d12d6a73206e43314d78d69b6177d277',1),(2,222,'aa93b35811f1742fe7e12aaf9cd56314',1),(2,223,'ecf472068216887bcfd3e880bed98521',1),(2,224,'9a9f828afd45ec59a7028702f4e36ce6',1),(2,225,'6ef93077f7d247caa11dee91fa2eefc3',1),(2,226,'211c75bba48cf94b822b4e4d8ddcd1d8',1),(2,227,'69946cf7c5d1de39dd10d33430b26ba3',1),(2,228,'5b31bae924a4f4fdb1282cdab56d92c7',1),(2,229,'acbc04d74bb30ccb84d2ec25c23aa205',1),(2,230,'0b04c448e693e094e9229243e48500e3',1),(2,231,'960cf0b1b7ac148a0b34667f10f1a761',1),(2,232,'5f8c76599c26245eb747d14c8c54aad8',1),(2,233,'f28c29c11a4470a7f0494362344d5e15',1),(2,234,'b47f4681d0107ac4ee2ab0a9ad8f4e3d',1),(2,235,'3ef01b4d4ec651c90e19450a94f3233f',1),(3,82,'b5511a7a4a8a75962554b04fc2a70bfe',1),(4,88,'c67bfe3fe3daa3658e8a1f8380ad5e24',1),(5,92,'725b639020a8e749f26de27ad5003ff7',1),(5,93,'bd2ced1d0146a5e5ae8816d41398c938',1),(5,94,'cdd4a4c6491eb3c8dc47ac617db97b8d',1),(5,95,'9b3bb4a50afeed30b51679eb0731948e',1),(5,96,'398d288438e5e770057a58e259a4dd9d',1),(5,97,'b5b26dbe67e7126882aa09f067653934',1),(5,98,'2d69f44caee8658efc4c0678e8248a68',1),(5,99,'731c63014fb96dee1931d3ae377cb111',1),(5,100,'c4bca73c316222efd572c3456b4ff34b',1);
/*!40000 ALTER TABLE `data_objects_harvest_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_hierarchy_entries`
--

DROP TABLE IF EXISTS `data_objects_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_hierarchy_entries` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_hierarchy_entries`
--

LOCK TABLES `data_objects_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `data_objects_hierarchy_entries` DISABLE KEYS */;
INSERT INTO `data_objects_hierarchy_entries` VALUES (1,1,1,2),(2,2,1,2),(2,3,1,2),(2,4,1,2),(2,5,1,2),(2,6,1,2),(2,7,1,2),(2,8,1,2),(2,9,1,2),(2,10,1,2),(3,11,1,2),(3,12,1,2),(3,13,1,2),(3,14,1,2),(3,15,1,2),(3,16,1,2),(3,17,1,2),(3,18,1,2),(3,19,1,2),(4,20,1,2),(4,21,1,2),(4,22,1,2),(4,23,1,2),(4,24,1,2),(4,25,1,2),(4,26,1,2),(4,27,1,2),(4,28,1,2),(5,29,1,2),(5,30,1,2),(5,31,1,2),(5,32,1,2),(5,33,1,2),(5,34,1,2),(5,35,1,2),(5,36,1,2),(5,37,1,2),(6,38,1,2),(6,39,1,2),(6,40,1,2),(6,41,1,2),(6,42,1,2),(6,43,1,2),(6,44,1,2),(6,45,1,2),(6,46,1,2),(7,47,1,2),(7,48,4,2),(7,49,3,2),(7,50,2,2),(7,51,1,1),(7,52,1,3),(7,53,2,1),(7,54,3,1),(7,55,2,3),(7,56,1,2),(7,57,1,2),(7,58,1,2),(7,59,1,2),(7,60,1,2),(7,61,1,2),(7,62,1,2),(8,63,1,2),(9,64,1,2),(10,65,1,2),(11,66,1,2),(11,67,4,2),(11,68,3,2),(11,69,2,2),(11,70,1,1),(11,71,1,3),(11,72,2,1),(11,73,3,1),(11,74,2,3),(11,75,3,2),(11,76,3,2),(11,77,1,2),(11,78,1,2),(11,79,1,2),(11,80,1,2),(11,81,1,2),(12,82,1,2),(12,83,1,2),(12,84,2,2),(12,85,2,2),(12,86,3,2),(12,87,1,2),(12,88,1,2),(12,89,1,2),(12,90,1,2),(12,91,1,2),(13,92,1,2),(13,93,1,2),(13,94,1,2),(13,95,1,2),(13,96,1,2),(13,97,1,2),(13,98,1,2),(13,99,1,2),(14,100,2,3),(17,101,1,2),(17,102,1,2),(17,103,1,2),(17,104,1,2),(17,105,1,2),(17,106,1,2),(17,107,1,2),(17,108,1,2),(17,109,1,2),(24,110,1,2),(24,111,1,2),(24,112,1,2),(24,113,1,2),(24,114,1,2),(24,115,1,2),(24,116,1,2),(24,117,1,2),(24,118,1,2),(26,119,1,2),(26,120,1,2),(26,121,1,2),(26,122,1,2),(26,123,1,2),(26,124,1,2),(26,125,1,2),(26,126,1,2),(26,127,1,2),(27,128,1,2),(27,129,1,2),(27,130,1,2),(27,131,1,2),(27,132,1,2),(27,133,1,2),(27,134,1,2),(27,135,1,2),(27,136,1,2),(28,137,1,2),(28,138,1,2),(28,139,1,2),(28,140,1,2),(28,141,1,2),(28,142,1,2),(28,143,1,2),(28,144,1,2),(28,145,1,2),(29,146,1,2),(29,147,1,2),(29,148,1,2),(29,149,1,2),(29,150,1,2),(29,151,1,2),(29,152,1,2),(29,153,1,2),(29,154,1,2),(30,155,1,2),(30,156,1,2),(30,157,1,2),(30,158,1,2),(30,159,1,2),(30,160,1,2),(30,161,1,2),(30,162,1,2),(30,163,1,2),(31,164,1,2),(31,165,1,2),(31,166,1,2),(31,167,1,2),(31,168,1,2),(31,169,1,2),(31,170,1,2),(31,171,1,2),(31,172,1,2),(32,173,1,2),(32,174,1,2),(32,175,1,2),(32,176,1,2),(32,177,1,2),(32,178,1,2),(32,179,1,2),(32,180,1,2),(32,181,1,2),(33,182,1,2),(33,183,1,2),(33,184,1,2),(33,185,1,2),(33,186,1,2),(33,187,1,2),(33,188,1,2),(33,189,1,2),(33,190,1,2),(34,191,1,2),(34,192,1,2),(34,193,1,2),(34,194,1,2),(34,195,1,2),(34,196,1,2),(34,197,1,2),(34,198,1,2),(34,199,1,2),(35,200,1,2),(35,201,1,2),(35,202,1,2),(35,203,1,2),(35,204,1,2),(35,205,1,2),(35,206,1,2),(35,207,1,2),(35,208,1,2),(36,209,1,2),(36,210,1,2),(36,211,1,2),(36,212,1,2),(36,213,1,2),(36,214,1,2),(36,215,1,2),(36,216,1,2),(36,217,1,2),(37,218,1,2),(37,219,1,2),(37,220,1,2),(37,221,1,2),(37,222,1,2),(37,223,1,2),(37,224,1,2),(37,225,1,2),(37,226,1,2),(38,227,1,2),(38,228,1,2),(38,229,1,2),(38,230,1,2),(38,231,1,2),(38,232,1,2),(38,233,1,2),(38,234,1,2),(38,235,1,2);
/*!40000 ALTER TABLE `data_objects_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_info_items`
--

DROP TABLE IF EXISTS `data_objects_info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_info_items` (
  `data_object_id` int(10) unsigned NOT NULL,
  `info_item_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`info_item_id`),
  KEY `info_item_id` (`info_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_info_items`
--

LOCK TABLES `data_objects_info_items` WRITE;
/*!40000 ALTER TABLE `data_objects_info_items` DISABLE KEYS */;
INSERT INTO `data_objects_info_items` VALUES (7,1),(16,1),(25,1),(34,1),(43,1),(59,1),(78,1),(88,1),(97,1),(98,1),(106,1),(115,1),(124,1),(133,1),(142,1),(151,1),(160,1),(169,1),(178,1),(187,1),(196,1),(205,1),(214,1),(223,1),(232,1),(8,2),(17,2),(26,2),(35,2),(44,2),(60,2),(79,2),(89,2),(99,2),(107,2),(116,2),(125,2),(134,2),(143,2),(152,2),(161,2),(163,2),(170,2),(172,2),(179,2),(188,2),(197,2),(206,2),(215,2),(224,2),(225,2),(233,2),(9,3),(99,3),(144,3),(9,4),(144,4),(8,5),(17,5),(26,5),(35,5),(44,5),(60,5),(79,5),(89,5),(99,5),(107,5),(116,5),(125,5),(134,5),(143,5),(152,5),(161,5),(163,5),(170,5),(172,5),(179,5),(188,5),(197,5),(206,5),(215,5),(224,5),(225,5),(233,5),(8,6),(17,6),(26,6),(35,6),(44,6),(60,6),(79,6),(89,6),(99,6),(107,6),(116,6),(125,6),(134,6),(143,6),(152,6),(161,6),(163,6),(170,6),(172,6),(179,6),(188,6),(197,6),(206,6),(215,6),(224,6),(225,6),(233,6),(8,7),(17,7),(26,7),(35,7),(44,7),(60,7),(79,7),(89,7),(99,7),(107,7),(116,7),(125,7),(134,7),(143,7),(152,7),(161,7),(163,7),(170,7),(172,7),(179,7),(188,7),(197,7),(206,7),(215,7),(224,7),(225,7),(233,7),(199,8),(37,9),(8,10),(17,10),(26,10),(35,10),(44,10),(60,10),(79,10),(89,10),(99,10),(107,10),(116,10),(125,10),(134,10),(143,10),(152,10),(161,10),(163,10),(170,10),(172,10),(179,10),(188,10),(197,10),(206,10),(215,10),(224,10),(225,10),(233,10),(97,15);
/*!40000 ALTER TABLE `data_objects_info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_link_types`
--

DROP TABLE IF EXISTS `data_objects_link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_link_types` (
  `data_object_id` int(10) unsigned NOT NULL,
  `link_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`),
  KEY `data_type_id` (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_link_types`
--

LOCK TABLES `data_objects_link_types` WRITE;
/*!40000 ALTER TABLE `data_objects_link_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_objects_link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_refs`
--

DROP TABLE IF EXISTS `data_objects_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_refs` (
  `data_object_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`ref_id`),
  KEY `do_id_ref_id` (`data_object_id`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_refs`
--

LOCK TABLES `data_objects_refs` WRITE;
/*!40000 ALTER TABLE `data_objects_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_objects_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_table_of_contents`
--

DROP TABLE IF EXISTS `data_objects_table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_table_of_contents` (
  `data_object_id` int(10) unsigned NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`data_object_id`,`toc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_table_of_contents`
--

LOCK TABLES `data_objects_table_of_contents` WRITE;
/*!40000 ALTER TABLE `data_objects_table_of_contents` DISABLE KEYS */;
INSERT INTO `data_objects_table_of_contents` VALUES (7,1),(8,5),(9,7),(10,57),(16,1),(17,5),(18,29),(19,57),(25,1),(26,5),(27,21),(28,36),(34,1),(35,5),(36,15),(37,27),(43,1),(44,5),(45,21),(46,16),(59,1),(60,5),(61,28),(62,15),(78,1),(79,5),(80,13),(81,23),(88,1),(89,5),(90,1),(97,1),(98,1),(99,5),(106,1),(107,5),(108,13),(109,32),(115,1),(116,5),(117,23),(118,24),(124,1),(125,5),(126,37),(127,34),(133,1),(134,5),(135,26),(136,58),(142,1),(143,5),(144,7),(145,30),(151,1),(152,5),(153,8),(154,52),(160,1),(161,5),(162,50),(163,5),(169,1),(170,5),(171,20),(172,5),(178,1),(179,5),(180,45),(181,48),(187,1),(188,5),(189,34),(190,20),(196,1),(197,5),(198,53),(199,25),(205,1),(206,5),(207,21),(208,6),(214,1),(215,5),(216,56),(217,28),(223,1),(224,5),(225,5),(226,46),(232,1),(233,5),(234,33),(235,30);
/*!40000 ALTER TABLE `data_objects_table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_objects_taxon_concepts`
--

DROP TABLE IF EXISTS `data_objects_taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_objects_taxon_concepts` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_objects_taxon_concepts`
--

LOCK TABLES `data_objects_taxon_concepts` WRITE;
/*!40000 ALTER TABLE `data_objects_taxon_concepts` DISABLE KEYS */;
INSERT INTO `data_objects_taxon_concepts` VALUES (7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(10,36),(10,37),(11,38),(11,39),(11,40),(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(12,47),(12,48),(12,49),(12,50),(12,51),(12,52),(12,53),(12,54),(12,55),(12,56),(12,57),(12,58),(12,59),(12,60),(12,61),(12,62),(13,63),(14,64),(15,65),(16,66),(16,67),(16,68),(16,69),(16,70),(16,71),(16,72),(16,73),(16,74),(16,75),(16,76),(16,77),(16,78),(16,79),(16,80),(16,81),(17,82),(17,83),(17,84),(17,85),(17,86),(17,87),(17,88),(17,89),(17,90),(17,91),(18,92),(18,93),(18,94),(18,95),(18,96),(18,97),(18,98),(18,99),(18,100),(20,101),(20,102),(20,103),(20,104),(20,105),(20,106),(20,107),(20,108),(20,109),(21,110),(21,111),(21,112),(21,113),(21,114),(21,115),(21,116),(21,117),(21,118),(22,119),(22,120),(22,121),(22,122),(22,123),(22,124),(22,125),(22,126),(22,127),(23,128),(23,129),(23,130),(23,131),(23,132),(23,133),(23,134),(23,135),(23,136),(24,137),(24,138),(24,139),(24,140),(24,141),(24,142),(24,143),(24,144),(24,145),(25,146),(25,147),(25,148),(25,149),(25,150),(25,151),(25,152),(25,153),(25,154),(26,155),(26,156),(26,157),(26,158),(26,159),(26,160),(26,161),(26,162),(26,163),(27,164),(27,165),(27,166),(27,167),(27,168),(27,169),(27,170),(27,171),(27,172),(28,173),(28,174),(28,175),(28,176),(28,177),(28,178),(28,179),(28,180),(28,181),(29,182),(29,183),(29,184),(29,185),(29,186),(29,187),(29,188),(29,189),(29,190),(30,191),(30,192),(30,193),(30,194),(30,195),(30,196),(30,197),(30,198),(30,199),(31,200),(31,201),(31,202),(31,203),(31,204),(31,205),(31,206),(31,207),(31,208),(32,209),(32,210),(32,211),(32,212),(32,213),(32,214),(32,215),(32,216),(32,217),(33,218),(33,219),(33,220),(33,221),(33,222),(33,223),(33,224),(33,225),(33,226),(34,227),(34,228),(34,229),(34,230),(34,231),(34,232),(34,233),(34,234),(34,235);
/*!40000 ALTER TABLE `data_objects_taxon_concepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_point_uris`
--

DROP TABLE IF EXISTS `data_point_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_point_uris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vetted_id` int(11) DEFAULT '1',
  `visibility_id` int(11) DEFAULT '2',
  `class_type` varchar(255) DEFAULT NULL,
  `predicate` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `user_added_data_id` int(11) DEFAULT NULL,
  `predicate_known_uri_id` int(11) DEFAULT NULL,
  `object_known_uri_id` int(11) DEFAULT NULL,
  `unit_of_measure_known_uri_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_point_uris_on_uri_and_taxon_concept_id` (`uri`,`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_point_uris`
--

LOCK TABLES `data_point_uris` WRITE;
/*!40000 ALTER TABLE `data_point_uris` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_point_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_search_files`
--

DROP TABLE IF EXISTS `data_search_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_search_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q` varchar(512) DEFAULT NULL,
  `uri` varchar(512) NOT NULL,
  `from` float DEFAULT NULL,
  `to` float DEFAULT NULL,
  `sort` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `known_uri_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hosted_file_url` varchar(255) DEFAULT NULL,
  `row_count` int(10) unsigned DEFAULT NULL,
  `unit_uri` varchar(255) DEFAULT NULL,
  `taxon_concept_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_search_files_on_user_id` (`user_id`),
  KEY `index_data_search_files_on_known_uri_id` (`known_uri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_search_files`
--

LOCK TABLES `data_search_files` WRITE;
/*!40000 ALTER TABLE `data_search_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_search_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'http://purl.org/dc/dcmitype/Text'),(2,'http://purl.org/dc/dcmitype/StillImage'),(3,'http://purl.org/dc/dcmitype/Sound'),(4,'http://purl.org/dc/dcmitype/MovingImage'),(5,'GBIF Image'),(6,'YouTube'),(7,'Flash'),(8,'IUCN'),(9,'Map'),(10,'Link');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eol_statistics`
--

DROP TABLE IF EXISTS `eol_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eol_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `members_count` mediumint(9) DEFAULT NULL,
  `communities_count` mediumint(9) DEFAULT NULL,
  `collections_count` mediumint(9) DEFAULT NULL,
  `pages_count` int(11) DEFAULT NULL,
  `pages_with_content` int(11) DEFAULT NULL,
  `pages_with_text` int(11) DEFAULT NULL,
  `pages_with_image` int(11) DEFAULT NULL,
  `pages_with_map` mediumint(9) DEFAULT NULL,
  `pages_with_video` mediumint(9) DEFAULT NULL,
  `pages_with_sound` mediumint(9) DEFAULT NULL,
  `pages_without_text` mediumint(9) DEFAULT NULL,
  `pages_without_image` mediumint(9) DEFAULT NULL,
  `pages_with_image_no_text` mediumint(9) DEFAULT NULL,
  `pages_with_text_no_image` mediumint(9) DEFAULT NULL,
  `base_pages` int(11) DEFAULT NULL,
  `pages_with_at_least_a_trusted_object` int(11) DEFAULT NULL,
  `pages_with_at_least_a_curatorial_action` mediumint(9) DEFAULT NULL,
  `pages_with_BHL_links` mediumint(9) DEFAULT NULL,
  `pages_with_BHL_links_no_text` mediumint(9) DEFAULT NULL,
  `pages_with_BHL_links_only` mediumint(9) DEFAULT NULL,
  `content_partners` mediumint(9) DEFAULT NULL,
  `content_partners_with_published_resources` mediumint(9) DEFAULT NULL,
  `content_partners_with_published_trusted_resources` mediumint(9) DEFAULT NULL,
  `published_resources` mediumint(9) DEFAULT NULL,
  `published_trusted_resources` mediumint(9) DEFAULT NULL,
  `published_unreviewed_resources` mediumint(9) DEFAULT NULL,
  `newly_published_resources_in_the_last_30_days` mediumint(9) DEFAULT NULL,
  `data_objects` int(11) DEFAULT NULL,
  `data_objects_texts` int(11) DEFAULT NULL,
  `data_objects_images` int(11) DEFAULT NULL,
  `data_objects_videos` mediumint(9) DEFAULT NULL,
  `data_objects_sounds` mediumint(9) DEFAULT NULL,
  `data_objects_maps` mediumint(9) DEFAULT NULL,
  `data_objects_trusted` int(11) DEFAULT NULL,
  `data_objects_unreviewed` int(11) DEFAULT NULL,
  `data_objects_untrusted` mediumint(9) DEFAULT NULL,
  `data_objects_trusted_or_unreviewed_but_hidden` mediumint(9) DEFAULT NULL,
  `udo_published` mediumint(9) DEFAULT NULL,
  `udo_published_by_curators` mediumint(9) DEFAULT NULL,
  `udo_published_by_non_curators` mediumint(9) DEFAULT NULL,
  `rich_pages` mediumint(9) DEFAULT NULL,
  `hotlist_pages` mediumint(9) DEFAULT NULL,
  `rich_hotlist_pages` mediumint(9) DEFAULT NULL,
  `redhotlist_pages` mediumint(9) DEFAULT NULL,
  `rich_redhotlist_pages` mediumint(9) DEFAULT NULL,
  `pages_with_score_10_to_39` mediumint(9) DEFAULT NULL,
  `pages_with_score_less_than_10` mediumint(9) DEFAULT NULL,
  `curators` mediumint(9) DEFAULT NULL,
  `curators_assistant` mediumint(9) DEFAULT NULL,
  `curators_full` mediumint(9) DEFAULT NULL,
  `curators_master` mediumint(9) DEFAULT NULL,
  `active_curators` mediumint(9) DEFAULT NULL,
  `pages_curated_by_active_curators` mediumint(9) DEFAULT NULL,
  `objects_curated_in_the_last_30_days` mediumint(9) DEFAULT NULL,
  `curator_actions_in_the_last_30_days` mediumint(9) DEFAULT NULL,
  `lifedesk_taxa` mediumint(9) DEFAULT NULL,
  `lifedesk_data_objects` mediumint(9) DEFAULT NULL,
  `marine_pages` mediumint(9) DEFAULT NULL,
  `marine_pages_in_col` mediumint(9) DEFAULT NULL,
  `marine_pages_with_objects` mediumint(9) DEFAULT NULL,
  `marine_pages_with_objects_vetted` mediumint(9) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '2014-02-20 09:53:08',
  `total_triples` int(10) unsigned DEFAULT NULL,
  `total_occurrences` int(10) unsigned DEFAULT NULL,
  `total_measurements` int(10) unsigned DEFAULT NULL,
  `total_associations` int(10) unsigned DEFAULT NULL,
  `total_measurement_types` int(10) unsigned DEFAULT NULL,
  `total_association_types` int(10) unsigned DEFAULT NULL,
  `total_taxa_with_data` int(10) unsigned DEFAULT NULL,
  `total_user_added_data` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eol_statistics`
--

LOCK TABLES `eol_statistics` WRITE;
/*!40000 ALTER TABLE `eol_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `eol_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exception_name` varchar(250) DEFAULT NULL,
  `backtrace` text,
  `url` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_error_logs_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_logs`
--

LOCK TABLES `error_logs` WRITE;
/*!40000 ALTER TABLE `error_logs` DISABLE KEYS */;
INSERT INTO `error_logs` VALUES (1,'content partner logo upload service has an error',NULL,'',NULL,NULL,NULL,'2014-02-24 13:51:25','2014-02-24 13:51:25'),(2,'content partner logo upload service has an error',NULL,'',NULL,NULL,NULL,'2014-03-02 12:38:06','2014-03-02 12:38:06');
/*!40000 ALTER TABLE `error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_data_objects`
--

DROP TABLE IF EXISTS `feed_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_data_objects` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_data_objects`
--

LOCK TABLES `feed_data_objects` WRITE;
/*!40000 ALTER TABLE `feed_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_item_types`
--

DROP TABLE IF EXISTS `feed_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_item_types`
--

LOCK TABLES `feed_item_types` WRITE;
/*!40000 ALTER TABLE `feed_item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_items`
--

DROP TABLE IF EXISTS `feed_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `feed_type` varchar(255) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `feed_item_type_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_items`
--

LOCK TABLES `feed_items` WRITE;
/*!40000 ALTER TABLE `feed_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_categories`
--

DROP TABLE IF EXISTS `forum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `view_order` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_categories`
--

LOCK TABLES `forum_categories` WRITE;
/*!40000 ALTER TABLE `forum_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_topic_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_to_post_id` int(11) DEFAULT NULL,
  `edit_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topics`
--

DROP TABLE IF EXISTS `forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `number_of_posts` int(11) NOT NULL DEFAULT '0',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `first_post_id` int(11) DEFAULT NULL,
  `last_post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topics`
--

LOCK TABLES `forum_topics` WRITE;
/*!40000 ALTER TABLE `forum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `view_order` int(11) NOT NULL DEFAULT '0',
  `number_of_posts` int(11) NOT NULL DEFAULT '0',
  `number_of_topics` int(11) NOT NULL DEFAULT '0',
  `number_of_views` int(11) NOT NULL DEFAULT '0',
  `last_post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gbif_identifiers_with_maps`
--

DROP TABLE IF EXISTS `gbif_identifiers_with_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbif_identifiers_with_maps` (
  `gbif_taxon_id` int(11) NOT NULL,
  PRIMARY KEY (`gbif_taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbif_identifiers_with_maps`
--

LOCK TABLES `gbif_identifiers_with_maps` WRITE;
/*!40000 ALTER TABLE `gbif_identifiers_with_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `gbif_identifiers_with_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary_terms`
--

DROP TABLE IF EXISTS `glossary_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) DEFAULT NULL,
  `definition` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary_terms`
--

LOCK TABLES `glossary_terms` WRITE;
/*!40000 ALTER TABLE `glossary_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_page_stats`
--

DROP TABLE IF EXISTS `google_analytics_page_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_page_stats` (
  `taxon_concept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  `page_views` int(10) unsigned NOT NULL,
  `unique_page_views` int(10) unsigned NOT NULL,
  `time_on_page` time NOT NULL,
  KEY `month_year` (`month`,`year`),
  KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_page_stats`
--

LOCK TABLES `google_analytics_page_stats` WRITE;
/*!40000 ALTER TABLE `google_analytics_page_stats` DISABLE KEYS */;
INSERT INTO `google_analytics_page_stats` VALUES (16,2015,2,390,20,'00:52:49'),(16,2015,1,912,49,'00:49:58'),(16,2014,12,672,27,'00:22:49'),(16,2014,11,474,40,'00:25:08'),(16,2014,10,813,80,'00:06:07'),(16,2014,9,279,32,'00:03:51'),(16,2014,8,242,91,'00:50:57'),(16,2014,7,662,7,'00:57:53'),(16,2014,6,863,84,'00:18:41'),(16,2014,5,512,74,'00:38:39'),(16,2014,4,392,0,'00:41:26'),(16,2014,3,332,0,'00:08:39'),(16,2014,2,712,49,'00:43:56'),(16,2014,1,628,55,'00:52:08'),(16,2013,12,471,32,'00:23:28'),(16,2013,11,262,26,'00:13:36'),(16,2013,10,346,90,'00:54:52'),(16,2013,9,448,2,'00:20:38'),(16,2013,8,310,18,'00:33:12'),(16,2013,7,156,15,'00:39:37'),(16,2013,6,184,39,'00:12:41'),(16,2013,5,736,42,'00:58:18'),(16,2013,4,607,8,'00:01:24'),(16,2013,3,471,32,'00:40:08'),(16,2013,2,254,25,'00:57:48');
/*!40000 ALTER TABLE `google_analytics_page_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_partner_summaries`
--

DROP TABLE IF EXISTS `google_analytics_partner_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_partner_summaries` (
  `year` smallint(4) NOT NULL DEFAULT '0',
  `month` tinyint(2) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `taxa_pages` int(11) DEFAULT NULL,
  `taxa_pages_viewed` int(11) DEFAULT NULL,
  `unique_page_views` int(11) DEFAULT NULL,
  `page_views` int(11) DEFAULT NULL,
  `time_on_page` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`year`,`month`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_partner_summaries`
--

LOCK TABLES `google_analytics_partner_summaries` WRITE;
/*!40000 ALTER TABLE `google_analytics_partner_summaries` DISABLE KEYS */;
INSERT INTO `google_analytics_partner_summaries` VALUES (2013,2,2,250,61,24,2481,895.00),(2013,3,2,286,48,150,5412,307.00),(2013,4,2,29,79,294,7356,320.00),(2013,5,2,272,35,456,9501,786.00),(2013,6,2,830,9,151,6215,624.00),(2013,7,2,726,89,632,8178,817.00),(2013,8,2,501,3,55,9300,34.00),(2013,9,2,427,26,402,4040,173.00),(2013,10,2,760,33,787,644,435.00),(2013,11,2,946,1,184,3184,19.00),(2013,12,2,197,3,795,5316,748.00),(2014,1,2,757,11,612,353,476.00),(2014,2,2,850,11,526,8712,685.00),(2014,3,2,352,36,110,7295,670.00),(2014,4,2,94,70,52,7849,585.00),(2014,5,2,978,13,414,1970,707.00),(2014,6,2,306,32,226,7146,352.00),(2014,7,2,510,70,288,1828,442.00),(2014,8,2,779,13,381,3391,663.00),(2014,9,2,466,77,950,6544,742.00),(2014,10,2,820,81,69,3154,45.00),(2014,11,2,274,72,268,2065,513.00),(2014,12,2,458,19,692,7695,964.00),(2015,1,2,350,5,198,9603,132.00),(2015,2,2,313,95,567,6219,2.00);
/*!40000 ALTER TABLE `google_analytics_partner_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_partner_taxa`
--

DROP TABLE IF EXISTS `google_analytics_partner_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_partner_taxa` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  KEY `concept_user_month_year` (`taxon_concept_id`,`user_id`,`month`,`year`),
  KEY `user_month` (`user_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_partner_taxa`
--

LOCK TABLES `google_analytics_partner_taxa` WRITE;
/*!40000 ALTER TABLE `google_analytics_partner_taxa` DISABLE KEYS */;
INSERT INTO `google_analytics_partner_taxa` VALUES (16,2,2014,1),(16,2,2015,1),(16,2,2013,2),(16,2,2014,2),(16,2,2015,2),(16,2,2013,3),(16,2,2014,3),(16,2,2013,4),(16,2,2014,4),(16,2,2013,5),(16,2,2014,5),(16,2,2013,6),(16,2,2014,6),(16,2,2013,7),(16,2,2014,7),(16,2,2013,8),(16,2,2014,8),(16,2,2013,9),(16,2,2014,9),(16,2,2013,10),(16,2,2014,10),(16,2,2013,11),(16,2,2014,11),(16,2,2013,12),(16,2,2014,12);
/*!40000 ALTER TABLE `google_analytics_partner_taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_summaries`
--

DROP TABLE IF EXISTS `google_analytics_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_analytics_summaries` (
  `year` smallint(4) NOT NULL,
  `month` tinyint(2) NOT NULL,
  `visits` int(11) DEFAULT NULL,
  `visitors` int(11) DEFAULT NULL,
  `pageviews` int(11) DEFAULT NULL,
  `unique_pageviews` int(11) DEFAULT NULL,
  `ave_pages_per_visit` float DEFAULT NULL,
  `ave_time_on_site` time DEFAULT NULL,
  `ave_time_on_page` time DEFAULT NULL,
  `per_new_visits` float DEFAULT NULL,
  `bounce_rate` float DEFAULT NULL,
  `per_exit` float DEFAULT NULL,
  `taxa_pages` int(11) DEFAULT NULL,
  `taxa_pages_viewed` int(11) DEFAULT NULL,
  `time_on_pages` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`),
  KEY `year` (`year`),
  KEY `month` (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_summaries`
--

LOCK TABLES `google_analytics_summaries` WRITE;
/*!40000 ALTER TABLE `google_analytics_summaries` DISABLE KEYS */;
INSERT INTO `google_analytics_summaries` VALUES (2013,2,69,40,9442,843,8.7,'00:38:19','00:27:04',9.3,7.6,9.8,643,24,716),(2013,3,21,69,8626,59,2.4,'00:37:05','00:38:58',2.5,5.1,8.2,585,7,858),(2013,4,620,69,9444,547,5.7,'00:42:52','00:53:12',7,9.4,1.3,359,53,366),(2013,5,985,71,4942,877,6.2,'00:12:51','00:07:16',8.3,9.9,5.9,668,12,89),(2013,6,436,4,7574,650,1.3,'00:05:39','00:50:31',4.3,0.4,2,225,4,629),(2013,7,765,90,7177,732,8.6,'00:41:07','00:41:25',2.2,1.6,0.5,138,53,752),(2013,8,146,86,5731,752,5.3,'00:29:22','00:11:15',9.4,0.9,2.2,496,41,851),(2013,9,39,20,2572,868,7.5,'00:31:39','00:33:30',6.1,0.5,0.6,454,55,579),(2013,10,835,20,1368,100,9,'00:33:17','00:12:59',3.8,8,1.1,393,22,492),(2013,11,527,75,9349,398,7.3,'00:39:06','00:28:45',6.1,5.4,4.9,333,52,884),(2013,12,951,63,1131,889,5.5,'00:49:05','00:45:53',8.5,6.4,9.9,979,25,474),(2014,1,677,44,7282,720,9.3,'00:03:07','00:39:01',3.3,0.3,0.4,407,43,976),(2014,2,746,34,2917,625,3.8,'00:33:08','00:37:56',1.7,0.2,3,649,31,664),(2014,3,35,27,9989,641,3.9,'00:17:11','00:47:33',4,0.1,6.3,903,34,762),(2014,4,199,64,9004,610,5.7,'00:19:34','00:24:40',4.8,8.5,0.6,769,59,677),(2014,5,368,66,9947,350,9.7,'00:24:33','00:59:05',9.1,4.3,5.6,220,3,924),(2014,6,535,51,5246,988,5.5,'00:41:47','00:21:44',2.9,3.9,3.3,884,49,502),(2014,7,340,22,7798,633,3.2,'00:00:02','00:55:06',4.6,2.6,6.5,259,74,848),(2014,8,797,92,6501,283,9.5,'00:38:43','00:36:32',7.9,4,5.7,482,90,712),(2014,9,545,83,6268,743,2.2,'00:02:52','00:56:08',8,7.9,2.1,243,10,324),(2014,10,353,8,818,382,4.5,'00:18:17','00:07:15',5.3,0.7,6.2,295,98,0),(2014,11,874,38,5906,269,3.2,'00:31:46','00:56:06',8.4,9.4,7.2,156,67,315),(2014,12,118,49,1588,578,8.5,'00:23:13','00:16:11',3.7,3.6,0.4,277,50,486),(2015,1,768,35,5678,993,2.1,'00:49:39','00:31:46',6.1,4.2,0.3,406,80,374),(2015,2,197,1,8194,730,7,'00:02:06','00:30:41',5.8,4.2,5.1,999,49,760);
/*!40000 ALTER TABLE `google_analytics_summaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_events`
--

DROP TABLE IF EXISTS `harvest_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(10) unsigned NOT NULL,
  `began_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_events`
--

LOCK TABLES `harvest_events` WRITE;
/*!40000 ALTER TABLE `harvest_events` DISABLE KEYS */;
INSERT INTO `harvest_events` VALUES (1,2,'2014-02-20 03:44:11','2014-02-20 04:44:11','2014-02-20 05:44:11',0),(2,3,'2014-02-20 03:44:31','2014-02-20 04:44:31','2014-02-20 05:44:31',0),(3,3,'2014-02-20 03:45:15','2014-02-20 04:45:15','2014-02-20 05:45:15',0),(4,3,'2014-02-20 03:45:15','2014-02-20 04:45:15','2014-02-20 05:45:15',0),(5,4,'2014-02-20 03:45:16','2014-02-20 04:45:16','2014-02-20 05:45:16',0),(6,5,'2014-02-20 03:45:20','2014-02-20 04:45:20','2014-02-20 05:45:20',0);
/*!40000 ALTER TABLE `harvest_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_events_hierarchy_entries`
--

DROP TABLE IF EXISTS `harvest_events_hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_events_hierarchy_entries` (
  `harvest_event_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`harvest_event_id`,`hierarchy_entry_id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_events_hierarchy_entries`
--

LOCK TABLES `harvest_events_hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `harvest_events_hierarchy_entries` DISABLE KEYS */;
INSERT INTO `harvest_events_hierarchy_entries` VALUES (2,2,'',4),(2,3,'',5),(2,4,'',6),(2,5,'',7),(2,6,'',8),(2,7,'',9),(2,8,'',10),(2,9,'',11),(2,10,'',12),(2,11,'',13),(2,12,'',14),(2,17,'',16),(2,24,'',17),(2,26,'',18),(2,27,'',19),(2,28,'',20),(2,29,'',21),(2,30,'',22),(2,31,'',23),(2,32,'',24),(2,33,'',25),(2,34,'',26),(2,35,'',27),(2,36,'',28),(2,37,'',29),(2,38,'',30),(5,13,'',15);
/*!40000 ALTER TABLE `harvest_events_hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_process_logs`
--

DROP TABLE IF EXISTS `harvest_process_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_process_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(255) DEFAULT NULL,
  `began_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_process_logs`
--

LOCK TABLES `harvest_process_logs` WRITE;
/*!40000 ALTER TABLE `harvest_process_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest_process_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchies`
--

DROP TABLE IF EXISTS `hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL COMMENT 'recommended; our internal id of the source agent responsible for the entire hierarchy',
  `label` varchar(255) NOT NULL COMMENT 'recommended; succinct title for the hierarchy (e.g. Catalogue of Life: Annual Checklist 2009)',
  `descriptive_label` varchar(255) DEFAULT NULL,
  `description` text NOT NULL COMMENT 'not required; a more verbose description describing the hierarchy. Could be a paragraph describing what it is and what it contains',
  `indexed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'required; the date which we created and indexed the hierarchy',
  `hierarchy_group_id` int(10) unsigned NOT NULL COMMENT 'not required; there is no hierarchy_groups table, but this field was meant to identify hierarchies of the same source so they can be verioned and older versions retained but not presented',
  `hierarchy_group_version` tinyint(3) unsigned NOT NULL COMMENT 'not required; this is mean to uniquely identify hierarchies within the same group. This version number has been an internal incrementing value',
  `url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'not required; a link back to a web page describing this hierarchy',
  `outlink_uri` varchar(255) DEFAULT NULL,
  `ping_host_url` varchar(255) DEFAULT NULL,
  `browsable` int(11) DEFAULT NULL,
  `complete` tinyint(3) unsigned DEFAULT '1',
  `request_publish` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='A container for hierarchy_entries. These are usually taxonomic hierarchies, but can be general collections of assertions about taxa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchies`
--

LOCK TABLES `hierarchies` WRITE;
/*!40000 ALTER TABLE `hierarchies` DISABLE KEYS */;
INSERT INTO `hierarchies` VALUES (1,4,'LigerCat',NULL,'LigerCat Biomedical Terms Tag Cloud','2014-02-20 03:44:05',0,0,'http://ligercat.ubio.org','http://ligercat.ubio.org/eol/%%ID%%.cloud',NULL,0,1,0),(2,5,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-02-20 03:44:06',0,0,'',NULL,NULL,0,1,0),(3,2,'Species 2000 & ITIS Catalogue of Life: May 2012',NULL,'','2014-02-20 03:44:08',0,0,'',NULL,NULL,1,1,0),(4,2,'Species 2000 & ITIS Catalogue of Life: Annual Checklist 2007',NULL,'','2014-02-20 03:44:08',0,0,'',NULL,NULL,0,1,0),(5,6,'Encyclopedia of Life Contributors',NULL,'','2014-02-20 03:44:08',0,0,'',NULL,NULL,0,1,0),(6,3,'NCBI Taxonomy',NULL,'','2014-02-20 03:44:08',101,2,'',NULL,NULL,1,1,0),(7,7,'GBIF Nub Taxonomy',NULL,'','2014-02-20 03:44:08',0,0,'',NULL,NULL,0,1,0),(8,8,'IUCN',NULL,'','2014-02-20 03:44:11',0,0,'',NULL,NULL,0,1,0),(9,10,'GBIF Nub Taxonomy',NULL,'','2014-02-20 03:44:32',0,0,'',NULL,NULL,0,1,0),(10,38,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-02-20 03:45:16',0,0,'',NULL,NULL,0,1,0),(11,43,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-02-20 03:45:20',0,0,'',NULL,NULL,0,1,0),(12,42,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-02-20 03:45:20',0,0,'',NULL,NULL,0,1,0),(13,44,'A nested structure of divisions related to their probable evolutionary descent',NULL,'','2014-02-20 03:45:21',0,0,'',NULL,NULL,0,1,0),(14,51,'AntWeb',NULL,'Currently AntWeb contains information on the ant faunas of several areas in the Nearctic and Malagasy biogeographic regions, and global coverage of all ant genera.','2014-02-20 03:45:28',0,0,'http://www.antweb.org/','http://www.antweb.org/specimen.do?name=%%ID%%',NULL,0,1,0),(15,52,'National Center for Biotechnology Information',NULL,'Established in 1988 as a national resource for molecular biology information, NCBI creates public databases, conducts research in computational biology, develops software tools for analyzing genome data, and disseminates biomedical information - all for the better understanding of molecular processes affecting human health and disease','2014-02-20 03:45:28',0,0,'http://www.ncbi.nlm.nih.gov/','http://www.ncbi.nlm.nih.gov/sites/entrez?Db=genomeprj&cmd=ShowDetailView&TermToSearch=%%ID%%',NULL,0,1,0);
/*!40000 ALTER TABLE `hierarchies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchies_content`
--

DROP TABLE IF EXISTS `hierarchies_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchies_content` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `text` tinyint(3) unsigned NOT NULL,
  `text_unpublished` tinyint(3) unsigned NOT NULL,
  `image` tinyint(3) unsigned NOT NULL,
  `image_unpublished` tinyint(3) unsigned NOT NULL,
  `child_image` tinyint(3) unsigned NOT NULL,
  `child_image_unpublished` tinyint(3) unsigned NOT NULL,
  `flash` tinyint(3) unsigned NOT NULL,
  `youtube` tinyint(3) unsigned NOT NULL,
  `map` tinyint(3) unsigned NOT NULL,
  `content_level` tinyint(3) unsigned NOT NULL,
  `image_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Summarizes the data types available to a given hierarchy entry. Also lists its content level and the data_object_id of the first displayed image.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchies_content`
--

LOCK TABLES `hierarchies_content` WRITE;
/*!40000 ALTER TABLE `hierarchies_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchies_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries`
--

DROP TABLE IF EXISTS `hierarchy_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `identifier` varchar(255) NOT NULL COMMENT 'recommended; a unique id from the provider for this node',
  `source_url` text,
  `name_id` int(10) unsigned NOT NULL COMMENT 'recommended; the name string for this node. It is possible that nodes have no names, but most of the time they will',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'recommended; the parent_id references the hierarchy_entry_id of the parent of this node. Used to create trees. Root nodes will have a partent_id of 0',
  `hierarchy_id` smallint(5) unsigned NOT NULL COMMENT 'required; the id of the container hierarchy',
  `rank_id` smallint(5) unsigned NOT NULL COMMENT 'recommended; when available, this is the id of the rank string which defines the taxonomic rank of the node',
  `ancestry` varchar(500) CHARACTER SET ascii NOT NULL COMMENT 'not required; perhaps now obsolete. Used to store the materialized path of this node''s ancestors',
  `lft` int(10) unsigned NOT NULL COMMENT 'required; the left value of this node within the hierarchy''s nested set',
  `rgt` int(10) unsigned NOT NULL COMMENT 'required; the right value of this node within the hierarchy''s nested set',
  `depth` tinyint(3) unsigned NOT NULL COMMENT 'recommended; the depth of this node in within the hierarchy''s tree',
  `taxon_concept_id` int(10) unsigned NOT NULL COMMENT 'required; the id of the taxon_concept described by this hierarchy_entry',
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `visibility_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxon_remarks` text,
  PRIMARY KEY (`id`),
  KEY `name_id` (`name_id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft` (`lft`),
  KEY `taxon_concept_id` (`taxon_concept_id`),
  KEY `vetted_id` (`vetted_id`),
  KEY `visibility_id` (`visibility_id`),
  KEY `published` (`published`),
  KEY `identifier` (`identifier`),
  KEY `hierarchy_parent` (`hierarchy_id`,`parent_id`),
  KEY `concept_published_visible` (`taxon_concept_id`,`published`,`visibility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries`
--

LOCK TABLES `hierarchy_entries` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries` DISABLE KEYS */;
INSERT INTO `hierarchy_entries` VALUES (1,'ba5d4a07e52d4e3a8074c8253646f042','','',1,0,3,184,'',1,2,2,1,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(2,'b42270bf09324d8e891f5a80d8ae9c72','','',2,0,3,1,'',3,24,0,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(3,'25645fd09d9742cead37aedce02ad84b','','',4,2,3,0,'',4,23,2,8,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(4,'d71f4b27253945d3aa9ad4ac05488f5d','','',6,3,3,0,'',5,22,3,9,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(5,'195e2f68729e4640b01e9477bad83e0b','','',8,4,3,0,'',6,21,4,10,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(6,'148f74cbaaa24515bd0c96331eb7b322','','',10,5,3,0,'',7,20,5,11,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(7,'3ad633bf293f4e7282f43acca0feb2e4','','',12,6,3,0,'',8,9,6,12,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(8,'0a4c2d5106254f8a83929632f4de36cf','','',14,6,3,0,'',10,11,6,13,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(9,'71d532f242b24a768e87a8be4881130b','','',21,6,3,0,'',12,13,6,14,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(10,'313fd3efba914939b6d063a6729b350f','','',22,6,3,0,'',14,15,6,15,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(11,'83bb2daa6bb94c5498da065e3df0bc79','','',23,6,3,0,'',16,17,6,16,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(12,'5cc8ea565bdb416cb14a80bbfa3e7385','','',25,6,3,0,'',18,19,6,17,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:29',NULL),(13,'1671587d18b64cb585d500357cd75f7e','','',27,0,3,0,'',25,26,6,18,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(14,'014fc85bc4d444ad8dfdb45ec521f2ce','','',28,0,12,0,'',1,2,0,18,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(15,'dee91710b3e443f38ec718030b6560c3','13810203','',28,0,9,0,'',1,2,0,18,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(16,'3eb13f7aac344c7bb0224bc711fddfad','','',29,0,13,184,'',1,2,2,19,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(17,'15290c6935894b7e850cabccb8dbd2b2','','',30,0,3,0,'',27,28,6,20,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(18,'a595f235553348cbb7968eff7ef2be06','20','',30,0,2,184,'',1,2,2,20,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(19,'3c983b0c15c24b98a048378e444f0438','casent0129891','',2,0,14,184,'',1,2,2,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(20,'0b93054f3444400f8fd257c41ef5095b','casent0496198','',2,0,14,184,'',3,4,2,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(21,'a09c0c2c89e949f4b007b6aead0e6e22','casent0179524','',2,0,14,184,'',5,6,2,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(22,'03d5cf1e6a4946bf82ecb6406e6850d4','13646','',2,0,15,184,'',1,2,2,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:43:55',NULL),(23,'f6bc09c87c3445ebbd640c2a2d81ee88','9551','',2,0,15,184,'',3,4,2,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(24,'b5d33aefcb8a49bc9244f55e85903d6d','','',34,0,6,20,'',1,20,0,21,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(25,'1fbbdbbc9e1041ae898300b451489474','33154','',36,24,6,1,'',2,19,0,7,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(26,'1f7b561dd0634baf84d4f46419e2dbdf','','',38,25,6,0,'',3,4,1,22,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(27,'bdd6ea8fb4fa4830a941fb3489cd806e','','',40,25,6,0,'',5,18,1,23,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(28,'c9f17eb723d644a690fc005633239885','','',42,27,6,0,'',6,7,2,24,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(29,'f6afc68732d74240a7c45ac6e708b361','','',44,27,6,0,'',8,17,2,25,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(30,'4ab817595ddf41feb779361a3f1e371e','','',46,29,6,0,'',9,10,3,26,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(31,'b2dddf49d2864aff8be29d5d640093f7','','',48,29,6,0,'',11,16,3,27,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(32,'0794de1f3ab64455b0b13e0d721c1330','','',50,31,6,0,'',12,13,4,28,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(33,'bbf0f1b9623d42e6857012f232c799c8','','',52,31,6,0,'',14,15,4,29,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(34,'5539a46214164a1ab802d1fd7b2f7437','','',54,0,6,20,'',21,30,0,30,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(35,'31cdc77829df47019904af69d4b0aebe','','',66,34,6,0,'',22,29,1,31,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(36,'2a51c8467d324aea835f48b281ba9ec5','','',68,35,6,0,'',23,28,2,32,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(37,'0e311c14cafe40de8f3728d405136f1b','','',70,36,6,0,'',24,27,3,33,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL),(38,'0aeab24a1168425cbdc63341d1dcfaa5','','',72,37,6,0,'',25,26,4,34,1,1,2,'2014-02-20 08:43:55','2014-02-20 08:46:30',NULL);
/*!40000 ALTER TABLE `hierarchy_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries_flattened`
--

DROP TABLE IF EXISTS `hierarchy_entries_flattened`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries_flattened` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`ancestor_id`),
  KEY `ancestor_id` (`ancestor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries_flattened`
--

LOCK TABLES `hierarchy_entries_flattened` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries_flattened` DISABLE KEYS */;
INSERT INTO `hierarchy_entries_flattened` VALUES (3,2),(4,2),(4,3),(5,2),(5,3),(5,4),(6,2),(6,3),(6,4),(6,5),(7,2),(7,3),(7,4),(7,5),(7,6),(8,2),(8,3),(8,4),(8,5),(8,6),(9,2),(9,3),(9,4),(9,5),(9,6),(10,2),(10,3),(10,4),(10,5),(10,6),(11,2),(11,3),(11,4),(11,5),(11,6),(12,2),(12,3),(12,4),(12,5),(12,6),(25,24),(26,24),(26,25),(27,24),(27,25),(28,24),(28,25),(28,27),(29,24),(29,25),(29,27),(30,24),(30,25),(30,27),(30,29),(31,24),(31,25),(31,27),(31,29),(32,24),(32,25),(32,27),(32,29),(32,31),(33,24),(33,25),(33,27),(33,29),(33,31),(35,34),(36,34),(36,35),(37,34),(37,35),(37,36),(38,34),(38,35),(38,36),(38,37);
/*!40000 ALTER TABLE `hierarchy_entries_flattened` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entries_refs`
--

DROP TABLE IF EXISTS `hierarchy_entries_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entries_refs` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entries_refs`
--

LOCK TABLES `hierarchy_entries_refs` WRITE;
/*!40000 ALTER TABLE `hierarchy_entries_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entries_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_moves`
--

DROP TABLE IF EXISTS `hierarchy_entry_moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_moves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hierarchy_entry_id` int(11) NOT NULL,
  `classification_curation_id` int(11) NOT NULL,
  `error` varchar(256) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_and_curation_index` (`hierarchy_entry_id`,`classification_curation_id`),
  KEY `index_hierarchy_entry_moves_on_hierarchy_entry_id` (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_moves`
--

LOCK TABLES `hierarchy_entry_moves` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_moves` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_relationships`
--

DROP TABLE IF EXISTS `hierarchy_entry_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_relationships` (
  `hierarchy_entry_id_1` int(10) unsigned NOT NULL,
  `hierarchy_entry_id_2` int(10) unsigned NOT NULL,
  `relationship` varchar(30) NOT NULL,
  `score` double NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id_1`,`hierarchy_entry_id_2`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_relationships`
--

LOCK TABLES `hierarchy_entry_relationships` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy_entry_stats`
--

DROP TABLE IF EXISTS `hierarchy_entry_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy_entry_stats` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `text_trusted` mediumint(8) unsigned NOT NULL,
  `text_untrusted` mediumint(8) unsigned NOT NULL,
  `image_trusted` mediumint(8) unsigned NOT NULL,
  `image_untrusted` mediumint(8) unsigned NOT NULL,
  `bhl` mediumint(8) unsigned NOT NULL,
  `all_text_trusted` mediumint(8) unsigned NOT NULL,
  `all_text_untrusted` mediumint(8) unsigned NOT NULL,
  `have_text` mediumint(8) unsigned NOT NULL,
  `all_image_trusted` mediumint(8) unsigned NOT NULL,
  `all_image_untrusted` mediumint(8) unsigned NOT NULL,
  `have_images` mediumint(8) unsigned NOT NULL,
  `all_bhl` int(10) unsigned NOT NULL,
  `total_children` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy_entry_stats`
--

LOCK TABLES `hierarchy_entry_stats` WRITE;
/*!40000 ALTER TABLE `hierarchy_entry_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `hierarchy_entry_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_crops`
--

DROP TABLE IF EXISTS `image_crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_crops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `original_object_cache_url` bigint(20) unsigned NOT NULL,
  `new_object_cache_url` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_crops`
--

LOCK TABLES `image_crops` WRITE;
/*!40000 ALTER TABLE `image_crops` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_items`
--

DROP TABLE IF EXISTS `info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_items` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `schema_value` varchar(255) CHARACTER SET ascii NOT NULL,
  `toc_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_items`
--

LOCK TABLES `info_items` WRITE;
/*!40000 ALTER TABLE `info_items` DISABLE KEYS */;
INSERT INTO `info_items` VALUES (1,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#TaxonBiology',1),(2,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#GeneralDescription',5),(3,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Distribution',7),(4,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Habitat',7),(5,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Morphology',5),(6,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Conservation',5),(7,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Uses',5),(8,'http://www.eol.org/voc/table_of_contents#Education',25),(9,'http://www.eol.org/voc/table_of_contents#EducationResources',27),(10,'http://www.eol.org/voc/table_of_contents#IdentificationResources',5),(11,'http://www.eol.org/voc/table_of_contents#Wikipedia',9),(12,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Associations',0),(13,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Behaviour',0),(14,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#ConservationStatus',0),(15,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Cyclicity',0),(16,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Cytology',0),(17,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#DiagnosticDescription',0),(18,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Diseases',0),(19,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Dispersal',0),(20,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Evolution',0),(21,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Genetics',0),(22,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Growth',0),(23,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Legislation',0),(24,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LifeCycle',0),(25,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LifeExpectancy',0),(26,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#LookAlikes',0),(27,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Management',0),(28,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Migration',0),(29,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#MolecularBiology',0),(30,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Physiology',0),(31,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#PopulationBiology',0),(32,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Procedures',0),(33,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Reproduction',0),(34,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#RiskStatement',0),(35,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Size',0),(36,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Threats',0),(37,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#Trends',0),(38,'http://rs.tdwg.org/ontology/voc/SPMInfoItems#TrophicStrategy',0);
/*!40000 ALTER TABLE `info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pages`
--

DROP TABLE IF EXISTS `item_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_item_id` int(10) unsigned NOT NULL,
  `year` varchar(20) NOT NULL,
  `volume` varchar(20) NOT NULL,
  `issue` varchar(20) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `number` varchar(20) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  `page_type` varchar(20) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. The publication items have many pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pages`
--

LOCK TABLES `item_pages` WRITE;
/*!40000 ALTER TABLE `item_pages` DISABLE KEYS */;
INSERT INTO `item_pages` VALUES (1,1,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(2,2,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(3,3,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(4,4,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(5,5,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(6,6,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(7,7,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(8,8,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(9,9,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(10,10,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(11,11,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(12,12,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(13,13,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(14,14,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(15,15,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(16,16,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(17,17,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(18,18,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(19,19,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(20,20,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(21,21,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(22,22,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(23,23,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(24,24,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(25,25,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(26,26,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(27,27,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(28,28,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(29,29,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(30,30,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(31,31,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(32,32,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(33,33,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(34,34,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(35,35,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(36,36,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(37,37,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(38,38,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(39,39,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(40,40,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(41,41,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(42,42,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(43,43,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(44,44,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(45,45,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(46,46,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(47,47,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(48,48,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(49,49,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(50,50,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(51,51,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(52,52,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(53,53,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(54,54,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(55,55,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(56,56,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(57,57,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(58,58,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(59,59,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(60,60,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(61,61,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(62,62,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(63,63,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(64,64,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(65,65,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(66,66,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(67,67,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(68,68,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting',''),(69,69,'1999','2','42','Page','6','http://www.biodiversitylibrary.org/page/ThisWontWork.JustTesting','');
/*!40000 ALTER TABLE `item_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_uri_relationships`
--

DROP TABLE IF EXISTS `known_uri_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_uri_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_known_uri_id` int(11) NOT NULL,
  `to_known_uri_id` int(11) NOT NULL,
  `relationship_uri` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_to_unique` (`from_known_uri_id`,`to_known_uri_id`,`relationship_uri`),
  KEY `to_known_uri_id` (`to_known_uri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_uri_relationships`
--

LOCK TABLES `known_uri_relationships` WRITE;
/*!40000 ALTER TABLE `known_uri_relationships` DISABLE KEYS */;
INSERT INTO `known_uri_relationships` VALUES (1,1,2,'http://eol.org/schema/allowedValue','2014-02-20 10:44:19','2014-02-20 10:44:19'),(2,1,3,'http://eol.org/schema/allowedValue','2014-02-20 10:44:19','2014-02-20 10:44:19'),(3,1,4,'http://eol.org/schema/allowedValue','2014-02-20 10:44:19','2014-02-20 10:44:19'),(4,1,5,'http://eol.org/schema/allowedValue','2014-02-20 10:44:19','2014-02-20 10:44:19'),(5,1,6,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(6,1,7,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(7,1,8,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(8,1,9,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(9,1,10,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(10,1,11,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(11,1,12,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(12,1,13,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(13,14,15,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20'),(14,14,16,'http://eol.org/schema/allowedValue','2014-02-20 10:44:20','2014-02-20 10:44:20');
/*!40000 ALTER TABLE `known_uri_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_uris`
--

DROP TABLE IF EXISTS `known_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_uris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(2000) NOT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `exclude_from_exemplars` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `uri_type_id` int(11) NOT NULL DEFAULT '1',
  `ontology_information_url` varchar(255) DEFAULT NULL,
  `ontology_source_url` varchar(255) DEFAULT NULL,
  `group_by_clade` tinyint(1) DEFAULT NULL,
  `clade_exemplar` tinyint(1) DEFAULT NULL,
  `exemplar_for_same_as` tinyint(1) DEFAULT NULL,
  `value_is_text` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `by_uri` (`uri`(250))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_uris`
--

LOCK TABLES `known_uris` WRITE;
/*!40000 ALTER TABLE `known_uris` DISABLE KEYS */;
INSERT INTO `known_uris` VALUES (1,'http://rs.tdwg.org/dwc/terms/measurementUnit',1,2,'2014-02-20 10:44:19','2014-02-20 10:44:19',0,1,4,NULL,NULL,NULL,NULL,NULL,0),(2,'http://purl.obolibrary.org/obo/UO_0000022',1,2,'2014-02-20 10:44:19','2014-02-20 10:44:19',0,2,3,NULL,NULL,NULL,NULL,NULL,0),(3,'http://purl.obolibrary.org/obo/UO_0000021',1,2,'2014-02-20 10:44:19','2014-02-20 10:44:19',0,3,3,NULL,NULL,NULL,NULL,NULL,0),(4,'http://purl.obolibrary.org/obo/UO_0000009',1,2,'2014-02-20 10:44:19','2014-02-20 10:44:19',0,4,3,NULL,NULL,NULL,NULL,NULL,0),(5,'http://purl.obolibrary.org/obo/UO_0000016',1,2,'2014-02-20 10:44:19','2014-02-20 10:44:19',0,5,3,NULL,NULL,NULL,NULL,NULL,0),(6,'http://purl.obolibrary.org/obo/UO_0000015',1,2,'2014-02-20 10:44:19','2014-02-20 10:44:19',0,6,3,NULL,NULL,NULL,NULL,NULL,0),(7,'http://purl.obolibrary.org/obo/UO_0000008',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,7,3,NULL,NULL,NULL,NULL,NULL,0),(8,'http://purl.obolibrary.org/obo/UO_0000012',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,8,3,NULL,NULL,NULL,NULL,NULL,0),(9,'http://purl.obolibrary.org/obo/UO_0000027',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,9,3,NULL,NULL,NULL,NULL,NULL,0),(10,'http://purl.obolibrary.org/obo/UO_0000033',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,10,3,NULL,NULL,NULL,NULL,NULL,0),(11,'http://purl.obolibrary.org/obo/UO_0000036',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,11,3,NULL,NULL,NULL,NULL,NULL,0),(12,'http://eol.org/schema/terms/onetenthdegreescelsius',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,12,3,NULL,NULL,NULL,NULL,NULL,0),(13,'http://eol.org/schema/terms/log10gram',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,13,3,NULL,NULL,NULL,NULL,NULL,0),(14,'http://rs.tdwg.org/dwc/terms/sex',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,14,4,NULL,NULL,NULL,NULL,NULL,0),(15,'http://eol.org/schema/terms/male',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,15,3,NULL,NULL,NULL,NULL,NULL,0),(16,'http://eol.org/schema/terms/female',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,16,3,NULL,NULL,NULL,NULL,NULL,0),(17,'http://purl.org/dc/terms/source',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,17,4,NULL,NULL,NULL,NULL,NULL,0),(18,'http://purl.org/dc/terms/license',1,2,'2014-02-20 10:44:20','2014-02-20 10:44:20',0,18,4,NULL,NULL,NULL,NULL,NULL,0),(19,'http://purl.org/dc/terms/bibliographicCitation',1,2,'2014-02-20 10:44:21','2014-02-20 10:44:21',0,19,4,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `known_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `known_uris_toc_items`
--

DROP TABLE IF EXISTS `known_uris_toc_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_uris_toc_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `known_uri_id` int(11) NOT NULL,
  `toc_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `known_uris_toc_items`
--

LOCK TABLES `known_uris_toc_items` WRITE;
/*!40000 ALTER TABLE `known_uris_toc_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `known_uris_toc_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_groups`
--

DROP TABLE IF EXISTS `language_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `representative_language_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_groups`
--

LOCK TABLES `language_groups` WRITE;
/*!40000 ALTER TABLE `language_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `iso_639_1` varchar(12) NOT NULL,
  `iso_639_2` varchar(12) NOT NULL,
  `iso_639_3` varchar(12) NOT NULL,
  `source_form` varchar(100) NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '1',
  `activated_on` timestamp NULL DEFAULT NULL,
  `language_group_id` smallint(5) unsigned DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iso_639_1` (`iso_639_1`),
  KEY `iso_639_2` (`iso_639_2`),
  KEY `iso_639_3` (`iso_639_3`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','eng','eng','English',1,'2014-02-18 08:44:00',NULL,NULL,NULL),(2,'fr','fre','','Français',1,'2014-02-19 08:44:09',NULL,NULL,NULL),(3,'es','spa','','Español',2,'2014-02-19 08:44:09',NULL,NULL,NULL),(4,'ar','','','العربية',3,'2014-02-19 08:44:09',NULL,NULL,NULL),(5,'','','','Scientific Name',4,NULL,NULL,NULL,NULL),(6,'','','','Unknown',5,NULL,NULL,NULL,NULL),(7,'de','','','',65,'2014-02-19 08:46:12',NULL,NULL,NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `source_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `version` varchar(6) CHARACTER SET ascii NOT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii NOT NULL,
  `show_to_content_partners` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `source_url` (`source_url`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'public domain','http://creativecommons.org/licenses/publicdomain/','1','',1),(2,'all rights reserved','','1','',0),(3,'cc-by 3.0','http://creativecommons.org/licenses/by/3.0/','1','cc_by_small.png',1),(4,'cc-by-sa 3.0','http://creativecommons.org/licenses/by-sa/3.0/','1','cc_by_sa_small.png',1),(5,'cc-by-nc 3.0','http://creativecommons.org/licenses/by-nc/3.0/','1','cc_by_nc_small.png',1),(6,'cc-by-nc-sa 3.0','http://creativecommons.org/licenses/by-nc-sa/3.0/','1','cc_by_nc_sa_small.png',1),(7,'cc-zero 1.0','http://creativecommons.org/publicdomain/zero/1.0/','1','cc_zero_small.png',1),(8,'no known copyright restrictions','http://www.flickr.com/commons/usage/','1','',1),(9,'not applicable','','1','',0);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_types`
--

DROP TABLE IF EXISTS `link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_types`
--

LOCK TABLES `link_types` WRITE;
/*!40000 ALTER TABLE `link_types` DISABLE KEYS */;
INSERT INTO `link_types` VALUES (1,'2014-02-20 10:44:08','2014-02-20 10:44:08'),(2,'2014-02-20 10:44:08','2014-02-20 10:44:08'),(3,'2014-02-20 10:44:08','2014-02-20 10:44:08'),(4,'2014-02-20 10:44:08','2014-02-20 10:44:08'),(5,'2014-02-20 10:44:08','2014-02-20 10:44:08'),(6,'2014-02-20 10:44:08','2014-02-20 10:44:08');
/*!40000 ALTER TABLE `link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `manager` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,7,1,'2014-02-20 10:44:34','2014-02-20 10:44:34',NULL),(2,9,1,'2014-02-20 10:44:40','2014-02-20 10:44:40',NULL),(3,11,1,'2014-02-20 10:44:45','2014-02-20 10:44:45',NULL),(4,13,1,'2014-02-20 10:44:49','2014-02-20 10:44:49',NULL),(5,15,1,'2014-02-20 10:44:53','2014-02-20 10:44:53',NULL),(6,17,1,'2014-02-20 10:44:57','2014-02-20 10:44:57',NULL),(7,20,1,'2014-02-20 10:45:04','2014-02-20 10:45:04',NULL),(8,22,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL),(9,24,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL),(10,26,1,'2014-02-20 10:45:06','2014-02-20 10:45:06',NULL),(11,28,1,'2014-02-20 10:45:11','2014-02-20 10:45:11',NULL),(12,30,1,'2014-02-20 10:45:14','2014-02-20 10:45:14',NULL),(13,33,1,'2014-02-20 10:45:16','2014-02-20 10:45:16',NULL),(14,37,1,'2014-02-20 10:45:21','2014-02-20 10:45:21',NULL),(15,39,1,'2014-02-20 10:45:23','2014-02-20 10:45:23',NULL),(16,41,1,'2014-02-20 10:45:27','2014-02-20 10:45:27',NULL),(17,44,1,'2014-02-20 10:45:30','2014-02-20 10:45:30',NULL),(18,46,1,'2014-02-20 10:45:34','2014-02-20 10:45:34',NULL),(19,48,1,'2014-02-20 10:45:39','2014-02-20 10:45:39',NULL),(20,50,1,'2014-02-20 10:45:43','2014-02-20 10:45:43',NULL),(21,52,1,'2014-02-20 10:45:48','2014-02-20 10:45:48',NULL),(22,54,1,'2014-02-20 10:45:51','2014-02-20 10:45:51',NULL),(23,56,1,'2014-02-20 10:45:56','2014-02-20 10:45:56',NULL),(24,58,1,'2014-02-20 10:45:59','2014-02-20 10:45:59',NULL),(25,60,1,'2014-02-20 10:46:04','2014-02-20 10:46:04',NULL),(26,62,1,'2014-02-20 10:46:08','2014-02-20 10:46:08',NULL),(27,64,1,'2014-02-20 10:46:13','2014-02-20 10:46:13',NULL),(28,66,1,'2014-02-20 10:46:16','2014-02-20 10:46:16',NULL),(29,68,1,'2014-02-20 10:46:20','2014-02-20 10:46:20',NULL),(30,70,1,'2014-02-20 10:46:25','2014-02-20 10:46:25',NULL),(31,80,1,'2014-02-24 13:32:01','2014-02-24 13:32:01',NULL),(32,83,1,'2014-02-27 08:30:15','2014-02-27 08:30:15',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mime_types`
--

DROP TABLE IF EXISTS `mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mime_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Type of data object. Controlled list used in the EOL schema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mime_types`
--

LOCK TABLES `mime_types` WRITE;
/*!40000 ALTER TABLE `mime_types` DISABLE KEYS */;
INSERT INTO `mime_types` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21);
/*!40000 ALTER TABLE `mime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_languages`
--

DROP TABLE IF EXISTS `name_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `name_languages` (
  `name_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL COMMENT 'required; the language of the string. ''Scientific name'' is a language',
  `parent_name_id` int(10) unsigned NOT NULL COMMENT 'not required; associated a common name or surrogate with its proper scientific name',
  `preferred` tinyint(3) unsigned NOT NULL COMMENT 'not required; identifies if the common names is preferred for the given scientific name in the given language',
  PRIMARY KEY (`name_id`,`language_id`,`parent_name_id`),
  KEY `parent_name_id` (`parent_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used mainly to identify which names are scientific names, and to link up common names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_languages`
--

LOCK TABLES `name_languages` WRITE;
/*!40000 ALTER TABLE `name_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `name_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namebank_id` int(10) unsigned NOT NULL COMMENT 'required; this identifies the uBio NameBank id for this string so that we can stay in sync. Many newer names will have this set to 0 as it is unknown if the name is in NameBank',
  `string` varchar(300) NOT NULL COMMENT 'the actual name. This is unique - every unique sequence of characters has one and only one name_id (we should probably add a unique index to this field)',
  `clean_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'there is a one to one reltaionship between a name string and a clean name. The clean name takes the string and lowercases it (uncluding diacriticals), removes leading/trailing whitespace, removes some punctuation (periods and more), and pads remaining pun',
  `italicized` varchar(300) NOT NULL COMMENT 'required; this includes html <i> tags in the proper place to display the string in its italicized form. Generally only species and subspecific names are italizied. Usually algorithmically generated',
  `italicized_verified` tinyint(3) unsigned NOT NULL COMMENT 'required; if an editor verifies the italicized form is correct, or corrects it, this should be set to 1 so it is not algorithmically replaced if we change the algorithm',
  `canonical_form_id` int(10) unsigned NOT NULL COMMENT 'required; every name string has a canonical form',
  `ranked_canonical_form_id` int(10) unsigned DEFAULT NULL,
  `canonical_verified` tinyint(3) unsigned NOT NULL COMMENT 'required; same as with italicized form, if an editor verifies the canonical form we want to maintin their edits if we were to redo the canonical form algorithm',
  PRIMARY KEY (`id`),
  KEY `canonical_form_id` (`canonical_form_id`),
  KEY `clean_name` (`clean_name`(255))
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='Represents the name of a taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names`
--

LOCK TABLES `names` WRITE;
/*!40000 ALTER TABLE `names` DISABLE KEYS */;
INSERT INTO `names` VALUES (1,0,'Nesciunterox autrerumalis','nesciunterox autrerumalis','<i>Nesciunterox autrerumalis</i>',1,1,NULL,1),(2,0,'Animalia Linn.','animalia linn','<i>Animalia</i> Linn.',1,2,2,1),(3,0,'Animals','animals','<i>Animals</i>',0,3,NULL,0),(4,0,'Autrecusandaees repudiandaeica Linnaeus','autrecusandaees repudiandaeica linnaeus','<i>Autrecusandaees repudiandaeica</i> Linnaeus',1,4,4,1),(5,0,'ravenous clover','ravenous clover','<i>ravenous clover</i>',0,5,NULL,0),(6,0,'Nihileri voluptasus G. D\'Amore','nihileri voluptasus g d\'amore','<i>Nihileri voluptasus</i> G. D\'Amore',1,6,6,1),(7,0,'red suntus','red suntus','<i>red suntus</i>',0,7,NULL,0),(8,0,'Dignissimosii inutes R. Bergstrom','dignissimosii inutes r bergstrom','<i>Dignissimosii inutes</i> R. Bergstrom',1,8,8,1),(9,0,'darning needle','darning needle','<i>darning needle</i>',0,9,NULL,0),(10,0,'Fugais utharumatus L.','fugais utharumatus l','<i>Fugais utharumatus</i> L.',1,10,10,1),(11,0,'tiger','tiger','<i>tiger</i>',0,11,NULL,0),(12,0,'Minuseli ullamens Linn','minuseli ullamens linn','<i>Minuseli ullamens</i> Linn',1,12,12,1),(13,0,'Tiger moth','tiger moth','<i>Tiger moth</i>',0,13,NULL,0),(14,0,'Dignissimosatus nobisosyne R. Cartwright','dignissimosatus nobisosyne r cartwright','<i>Dignissimosatus nobisosyne</i> R. Cartwright',1,14,14,1),(15,0,'Tiger lilly','tiger lilly','<i>Tiger lilly</i>',0,15,NULL,0),(16,0,'Tiger water lilly','tiger water lilly','<i>Tiger water lilly</i>',0,16,NULL,0),(17,0,'lilly of the tiger','lilly of the tiger','<i>lilly of the tiger</i>',0,17,NULL,0),(18,0,'Tiger flower','tiger flower','<i>Tiger flower</i>',0,18,NULL,0),(19,0,'Tiger-stripe lilly','tiger - stripe lilly','<i>Tiger-stripe lilly</i>',0,19,NULL,0),(20,0,'Tiger-eye lilly','tiger - eye lilly','<i>Tiger-eye lilly</i>',0,20,NULL,0),(21,0,'Expeditaalia evenietelia L.','expeditaalia evenietelia l','<i>Expeditaalia evenietelia</i> L.',1,21,21,1),(22,0,'Earumeles beataeata Linn.','earumeles beataeata linn','<i>Earumeles beataeata</i> Linn.',1,22,22,1),(23,0,'Culpaensis sapienteesi Linnaeus','culpaensis sapienteesi linnaeus','<i>Culpaensis sapienteesi</i> Linnaeus',1,23,23,1),(24,0,'frizzlebek','frizzlebek','<i>frizzlebek</i>',0,24,NULL,0),(25,0,'Utomnisesi sequialis N. Upton','utomnisesi sequialis n upton','<i>Utomnisesi sequialis</i> N. Upton',1,25,25,1),(26,0,'purple dust crab','purple dust crab','<i>purple dust crab</i>',0,26,NULL,0),(27,0,'Autaliquideri minimais L. Carroll','autaliquideri minimais l carroll','<i>Autaliquideri minimais</i> L. Carroll',1,27,27,1),(28,0,'Beataeelia etnemoiae','beataeelia etnemoiae','<i>Beataeelia etnemoiae</i>',1,27,NULL,1),(29,0,'Autemalius utsimiliqueesi','autemalius utsimiliqueesi','<i>Autemalius utsimiliqueesi</i>',1,28,NULL,1),(30,0,'Etconsequaturelia autenimalia M. Port','etconsequaturelia autenimalia m port','<i>Etconsequaturelia autenimalia</i> M. Port',1,29,29,1),(31,0,'wumpus','wumpus','<i>wumpus</i>',0,30,NULL,0),(32,0,'wompus','wompus','<i>wompus</i>',0,31,NULL,0),(33,0,'wampus','wampus','<i>wampus</i>',0,32,NULL,0),(34,0,'Eukaryota S. Posford','eukaryota s posford','<i>Eukaryota</i> S. Posford',1,33,33,1),(35,0,'eukaryotes','eukaryotes','<i>eukaryotes</i>',0,34,NULL,0),(36,0,'Metazoa','metazoa','<i>Metazoa</i>',1,35,NULL,1),(37,0,'opisthokonts','opisthokonts','<i>opisthokonts</i>',1,36,NULL,1),(38,0,'Quoautesi natuseri Posford & Ram','quoautesi natuseri posford & ram','<i>Quoautesi natuseri</i> Posford & Ram',1,37,37,1),(39,0,'cloud swallow','cloud swallow','<i>cloud swallow</i>',0,38,NULL,0),(40,0,'Voluptatumeri esseensis L.','voluptatumeri esseensis l','<i>Voluptatumeri esseensis</i> L.',1,39,39,1),(41,0,'spiny possom','spiny possom','<i>spiny possom</i>',0,40,NULL,0),(42,0,'Ameti maioresis Linnaeus','ameti maioresis linnaeus','<i>Ameti maioresis</i> Linnaeus',1,41,41,1),(43,0,'common desert mouse','common desert mouse','<i>common desert mouse</i>',0,42,NULL,0),(44,0,'Ipsamalius distinctioerox','ipsamalius distinctioerox','<i>Ipsamalius distinctioerox</i>',1,43,43,1),(45,0,'fisher','fisher','<i>fisher</i>',0,44,NULL,0),(46,0,'Maximees veritatisatus P. Leary','maximees veritatisatus p leary','<i>Maximees veritatisatus</i> P. Leary',1,45,45,1),(47,0,'chartruse turtle','chartruse turtle','<i>chartruse turtle</i>',0,46,NULL,0),(48,0,'Molestiaeus rationealia Padderson','molestiaeus rationealia padderson','<i>Molestiaeus rationealia</i> Padderson',1,47,47,1),(49,0,'horny toad','horny toad','<i>horny toad</i>',0,48,NULL,0),(50,0,'Fugitens dolorealius Linnaeus','fugitens dolorealius linnaeus','<i>Fugitens dolorealius</i> Linnaeus',1,49,49,1),(51,0,'scarlet vermillion','scarlet vermillion','<i>scarlet vermillion</i>',0,50,NULL,0),(52,0,'Quisquamator sequieles L.','quisquamator sequieles l','<i>Quisquamator sequieles</i> L.',1,51,51,1),(53,0,'Mozart\'s nemesis','mozart\'s nemesis','<i>Mozart\'s nemesis</i>',0,52,NULL,0),(54,0,'Bacteria M. Mayer','bacteria m mayer','<i>Bacteria</i> M. Mayer',1,53,53,1),(55,0,'bacteria','bacteria','<i>bacteria</i>',0,53,NULL,0),(56,0,'bugs','bugs','<i>bugs</i>',0,54,NULL,0),(57,0,'grime','grime','<i>grime</i>',0,55,NULL,0),(58,0,'critters','critters','<i>critters</i>',0,56,NULL,0),(59,0,'bakteria','bakteria','<i>bakteria</i>',0,57,NULL,0),(60,0,'die buggen','die buggen','<i>die buggen</i>',0,58,NULL,0),(61,0,'das greim','das greim','<i>das greim</i>',0,59,NULL,0),(62,0,'baseteir','baseteir','<i>baseteir</i>',0,60,NULL,0),(63,0,'le grimme','le grimme','<i>le grimme</i>',0,61,NULL,0),(64,0,'ler petit bugge','ler petit bugge','<i>ler petit bugge</i>',0,62,NULL,0),(65,0,'microbia','microbia','microbia',1,53,NULL,1),(66,0,'Essees eaqueata L.','essees eaqueata l','<i>Essees eaqueata</i> L.',1,63,63,1),(67,0,'quick brown fox','quick brown fox','<i>quick brown fox</i>',0,64,NULL,0),(68,0,'Animiens atdoloribuseron Linn.','animiens atdoloribuseron linn','<i>Animiens atdoloribuseron</i> Linn.',1,65,65,1),(69,0,'painted horse','painted horse','<i>painted horse</i>',0,66,NULL,0),(70,0,'Adaliasii iurea Linnaeus','adaliasii iurea linnaeus','<i>Adaliasii iurea</i> Linnaeus',1,67,67,1),(71,0,'thirsty aphid','thirsty aphid','<i>thirsty aphid</i>',0,68,NULL,0),(72,0,'Nonnumquamerus numquamerus G. D\'Amore','nonnumquamerus numquamerus g d\'amore','<i>Nonnumquamerus numquamerus</i> G. D\'Amore',1,69,69,1),(73,0,'bloody eel','bloody eel','<i>bloody eel</i>',0,70,NULL,0);
/*!40000 ALTER TABLE `names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_items`
--

DROP TABLE IF EXISTS `news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL,
  `display_date` datetime DEFAULT NULL,
  `activated_on` datetime DEFAULT NULL,
  `last_update_user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_items`
--

LOCK TABLES `news_items` WRITE;
/*!40000 ALTER TABLE `news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_emailer_settings`
--

DROP TABLE IF EXISTS `notification_emailer_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_emailer_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_daily_emails_sent` datetime DEFAULT NULL,
  `last_weekly_emails_sent` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_emailer_settings`
--

LOCK TABLES `notification_emailer_settings` WRITE;
/*!40000 ALTER TABLE `notification_emailer_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_emailer_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_frequencies`
--

DROP TABLE IF EXISTS `notification_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_frequencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_frequencies`
--

LOCK TABLES `notification_frequencies` WRITE;
/*!40000 ALTER TABLE `notification_frequencies` DISABLE KEYS */;
INSERT INTO `notification_frequencies` VALUES (1,'never'),(2,'newsfeed only'),(3,'weekly'),(4,'daily digest'),(5,'send immediately');
/*!40000 ALTER TABLE `notification_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reply_to_comment` int(11) DEFAULT '5',
  `comment_on_my_profile` int(11) DEFAULT '5',
  `comment_on_my_contribution` int(11) DEFAULT '5',
  `comment_on_my_collection` int(11) DEFAULT '5',
  `comment_on_my_community` int(11) DEFAULT '5',
  `made_me_a_manager` int(11) DEFAULT '5',
  `member_joined_my_community` int(11) DEFAULT '5',
  `comment_on_my_watched_item` int(11) DEFAULT '2',
  `curation_on_my_watched_item` int(11) DEFAULT '2',
  `new_data_on_my_watched_item` int(11) DEFAULT '2',
  `changes_to_my_watched_collection` int(11) DEFAULT '2',
  `changes_to_my_watched_community` int(11) DEFAULT '2',
  `member_joined_my_watched_community` int(11) DEFAULT '2',
  `member_left_my_community` int(11) DEFAULT '2',
  `new_manager_in_my_community` int(11) DEFAULT '2',
  `i_am_being_watched` int(11) DEFAULT '2',
  `eol_newsletter` tinyint(1) DEFAULT '1',
  `last_notification_sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:04','2014-02-20 10:44:04'),(2,2,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:04','2014-02-20 10:44:04'),(3,3,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:05','2014-02-20 10:44:05'),(4,4,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:21','2014-02-20 10:44:21'),(5,5,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:31','2014-02-20 10:44:31'),(6,6,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:33','2014-02-20 10:44:33'),(7,7,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:33','2014-02-20 10:44:33'),(8,8,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:40','2014-02-20 10:44:40'),(9,9,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:40','2014-02-20 10:44:40'),(10,10,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:44','2014-02-20 10:44:44'),(11,11,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:44','2014-02-20 10:44:44'),(12,12,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:49','2014-02-20 10:44:49'),(13,13,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:49','2014-02-20 10:44:49'),(14,14,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:53','2014-02-20 10:44:53'),(15,15,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:53','2014-02-20 10:44:53'),(16,16,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:57','2014-02-20 10:44:57'),(17,17,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:44:57','2014-02-20 10:44:57'),(18,18,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:02','2014-02-20 10:45:02'),(19,19,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:03','2014-02-20 10:45:03'),(20,20,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:04','2014-02-20 10:45:04'),(21,21,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:04','2014-02-20 10:45:04'),(22,22,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:05','2014-02-20 10:45:05'),(23,23,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:05','2014-02-20 10:45:05'),(24,24,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:05','2014-02-20 10:45:05'),(25,25,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:06','2014-02-20 10:45:06'),(26,26,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:06','2014-02-20 10:45:06'),(27,27,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:11','2014-02-20 10:45:11'),(28,28,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:11','2014-02-20 10:45:11'),(29,29,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:13','2014-02-20 10:45:13'),(30,30,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:13','2014-02-20 10:45:13'),(31,31,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:15','2014-02-20 10:45:15'),(32,32,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:16','2014-02-20 10:45:16'),(33,33,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:16','2014-02-20 10:45:16'),(34,34,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:20','2014-02-20 10:45:20'),(35,35,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:20','2014-02-20 10:45:20'),(36,36,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:21','2014-02-20 10:45:21'),(37,37,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:21','2014-02-20 10:45:21'),(38,38,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:23','2014-02-20 10:45:23'),(39,39,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:23','2014-02-20 10:45:23'),(40,40,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:27','2014-02-20 10:45:27'),(41,41,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:27','2014-02-20 10:45:27'),(42,42,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:29','2014-02-20 10:45:29'),(43,43,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:29','2014-02-20 10:45:29'),(44,44,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:30','2014-02-20 10:45:30'),(45,45,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:34','2014-02-20 10:45:34'),(46,46,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:34','2014-02-20 10:45:34'),(47,47,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:38','2014-02-20 10:45:38'),(48,48,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:39','2014-02-20 10:45:39'),(49,49,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:43','2014-02-20 10:45:43'),(50,50,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:43','2014-02-20 10:45:43'),(51,51,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:47','2014-02-20 10:45:47'),(52,52,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:48','2014-02-20 10:45:48'),(53,53,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:51','2014-02-20 10:45:51'),(54,54,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:51','2014-02-20 10:45:51'),(55,55,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:55','2014-02-20 10:45:55'),(56,56,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:55','2014-02-20 10:45:55'),(57,57,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:59','2014-02-20 10:45:59'),(58,58,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:45:59','2014-02-20 10:45:59'),(59,59,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:04','2014-02-20 10:46:04'),(60,60,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:04','2014-02-20 10:46:04'),(61,61,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:08','2014-02-20 10:46:08'),(62,62,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:08','2014-02-20 10:46:08'),(63,63,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:13','2014-02-20 10:46:13'),(64,64,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:13','2014-02-20 10:46:13'),(65,65,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:16','2014-02-20 10:46:16'),(66,66,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:16','2014-02-20 10:46:16'),(67,67,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:20','2014-02-20 10:46:20'),(68,68,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:20','2014-02-20 10:46:20'),(69,69,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:24','2014-02-20 10:46:24'),(70,70,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:24','2014-02-20 10:46:24'),(71,71,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:36','2014-02-20 10:46:36'),(72,72,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:55','2014-02-20 10:46:55'),(73,73,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 10:46:55','2014-02-20 10:46:55'),(74,74,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-20 13:31:28','2014-02-20 13:31:28'),(75,75,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-23 07:12:16','2014-02-23 07:12:16'),(76,76,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-23 08:17:23','2014-02-23 08:17:23'),(77,77,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-23 08:33:59','2014-02-23 08:33:59'),(78,78,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-23 13:03:10','2014-02-23 13:03:10'),(79,79,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-24 07:10:54','2014-02-24 07:10:54'),(80,80,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-24 10:41:20','2014-02-24 10:41:20'),(81,81,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-24 12:33:43','2014-02-24 12:33:43'),(82,81,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-25 09:47:52','2014-02-25 09:47:52'),(83,82,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-25 10:02:31','2014-02-25 10:02:31'),(84,83,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-25 10:12:41','2014-02-25 10:12:41'),(85,84,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-27 13:55:23','2014-02-27 13:55:23'),(86,85,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-02-27 13:59:56','2014-02-27 13:59:56'),(87,86,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 07:41:41','2014-03-02 07:41:41'),(88,87,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 08:13:13','2014-03-02 08:13:13'),(89,88,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 09:20:15','2014-03-02 09:20:15'),(90,89,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 09:48:49','2014-03-02 09:48:49'),(91,90,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 11:43:56','2014-03-02 11:43:56'),(92,91,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 12:01:53','2014-03-02 12:01:53'),(93,92,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-02 12:12:50','2014-03-02 12:12:50'),(94,93,5,5,5,5,5,5,5,2,2,2,2,2,2,2,2,2,1,NULL,'2014-03-03 09:02:53','2014-03-03 09:02:53');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_authentications`
--

DROP TABLE IF EXISTS `open_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_guid` (`provider`,`guid`),
  UNIQUE KEY `user_id_provider` (`user_id`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_authentications`
--

LOCK TABLES `open_authentications` WRITE;
/*!40000 ALTER TABLE `open_authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_names`
--

DROP TABLE IF EXISTS `page_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_names` (
  `item_page_id` int(10) unsigned NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name_id`,`item_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used for BHL. Links name strings to BHL page identifiers. Many names on a given page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_names`
--

LOCK TABLES `page_names` WRITE;
/*!40000 ALTER TABLE `page_names` DISABLE KEYS */;
INSERT INTO `page_names` VALUES (1,2),(2,2),(3,2),(4,4),(5,4),(6,4),(7,6),(8,6),(9,6),(10,8),(11,8),(12,8),(13,10),(14,10),(15,10),(16,12),(17,12),(18,12),(19,21),(20,21),(21,21),(22,27),(23,27),(24,27),(25,30),(26,30),(27,30),(28,34),(29,34),(30,34),(31,38),(32,38),(33,38),(34,40),(35,40),(36,40),(37,42),(38,42),(39,42),(40,44),(41,44),(42,44),(43,46),(44,46),(45,46),(46,48),(47,48),(48,48),(49,50),(50,50),(51,50),(52,52),(53,52),(54,52),(55,54),(56,54),(57,54),(58,66),(59,66),(60,66),(61,68),(62,68),(63,68),(64,70),(65,70),(66,70),(67,72),(68,72),(69,72);
/*!40000 ALTER TABLE `page_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_dataobjects`
--

DROP TABLE IF EXISTS `page_stats_dataobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_dataobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` varchar(1) DEFAULT 'n',
  `taxa_count` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_untrusted_published_visible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_unknown_published_notVisible_uniqueGuid` int(11) DEFAULT NULL,
  `vetted_untrusted_published_notVisible_uniqueGuid` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `time_created` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_vetted_unknown_published_visible_uniqueGuid` longtext,
  `a_vetted_untrusted_published_visible_uniqueGuid` longtext,
  `a_vetted_unknown_published_notVisible_uniqueGuid` longtext,
  `a_vetted_untrusted_published_notVisible_uniqueGuid` longtext,
  `user_submitted_text` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_dataobjects`
--

LOCK TABLES `page_stats_dataobjects` WRITE;
/*!40000 ALTER TABLE `page_stats_dataobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_dataobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_marine`
--

DROP TABLE IF EXISTS `page_stats_marine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_marine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '0',
  `names_from_xml` int(11) DEFAULT NULL,
  `names_in_eol` int(11) DEFAULT NULL,
  `marine_pages` int(11) DEFAULT NULL,
  `pages_with_objects` int(11) DEFAULT NULL,
  `pages_with_vetted_objects` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `time_created` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_marine`
--

LOCK TABLES `page_stats_marine` WRITE;
/*!40000 ALTER TABLE `page_stats_marine` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_marine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_stats_taxa`
--

DROP TABLE IF EXISTS `page_stats_taxa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_stats_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxa_count` int(11) DEFAULT NULL,
  `taxa_text` int(11) DEFAULT NULL,
  `taxa_images` int(11) DEFAULT NULL,
  `taxa_text_images` int(11) DEFAULT NULL,
  `taxa_BHL_no_text` int(11) DEFAULT NULL,
  `taxa_links_no_text` int(11) DEFAULT NULL,
  `taxa_images_no_text` int(11) DEFAULT NULL,
  `taxa_text_no_images` int(11) DEFAULT NULL,
  `vet_obj_only_1cat_inCOL` int(11) DEFAULT NULL,
  `vet_obj_only_1cat_notinCOL` int(11) DEFAULT NULL,
  `vet_obj_morethan_1cat_inCOL` int(11) DEFAULT NULL,
  `vet_obj_morethan_1cat_notinCOL` int(11) DEFAULT NULL,
  `vet_obj` int(11) DEFAULT NULL,
  `no_vet_obj2` int(11) DEFAULT NULL,
  `with_BHL` int(11) DEFAULT NULL,
  `vetted_not_published` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_inCol` int(11) DEFAULT NULL,
  `vetted_unknown_published_visible_notinCol` int(11) DEFAULT NULL,
  `pages_incol` int(11) DEFAULT NULL,
  `pages_not_incol` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lifedesk_taxa` int(11) DEFAULT NULL,
  `lifedesk_dataobject` int(11) DEFAULT NULL,
  `data_objects_count_per_category` text,
  `content_partners_count_per_category` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_stats_taxa`
--

LOCK TABLES `page_stats_taxa` WRITE;
/*!40000 ALTER TABLE `page_stats_taxa` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_stats_taxa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_notifications`
--

DROP TABLE IF EXISTS `pending_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `notification_frequency_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(64) DEFAULT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pending_notifications_on_user_id` (`user_id`),
  KEY `index_pending_notifications_on_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_notifications`
--

LOCK TABLES `pending_notifications` WRITE;
/*!40000 ALTER TABLE `pending_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,1,'2014-02-20 10:44:18','2014-02-20 10:45:22'),(2,0,'2014-02-20 10:44:19','2014-02-20 10:44:19'),(3,2,'2014-02-20 10:44:19','2014-02-20 10:46:55'),(4,0,'2014-02-20 10:44:19','2014-02-20 10:44:19');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_permissions_users_on_permission_id_and_user_id` (`permission_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
INSERT INTO `permissions_users` VALUES (1,37,1,'2014-02-20 10:45:22','2014-02-20 10:45:22'),(2,37,3,'2014-02-20 10:45:22','2014-02-20 10:45:22'),(3,72,3,'2014-02-20 10:46:55','2014-02-20 10:46:55');
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_titles`
--

DROP TABLE IF EXISTS `publication_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marc_bib_id` varchar(40) NOT NULL,
  `marc_leader` varchar(40) NOT NULL,
  `title` varchar(300) NOT NULL,
  `short_title` varchar(300) NOT NULL,
  `details` varchar(300) NOT NULL,
  `call_number` varchar(40) NOT NULL,
  `start_year` varchar(10) NOT NULL,
  `end_year` varchar(10) NOT NULL,
  `language` varchar(10) NOT NULL,
  `author` varchar(150) NOT NULL,
  `abbreviation` varchar(150) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. The main publications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_titles`
--

LOCK TABLES `publication_titles` WRITE;
/*!40000 ALTER TABLE `publication_titles` DISABLE KEYS */;
INSERT INTO `publication_titles` VALUES (1,'','','Great Big Journal of Fun','Publication','Nifty Titles Are Our Business','','','','','bob','','http://publication.titles.te.st'),(2,'','','The Journal You Cannot Afford','Publication','Nifty Titles Are Our Business','','','','','bob','','http://publication.titles.te.st');
/*!40000 ALTER TABLE `publication_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `random_hierarchy_images`
--

DROP TABLE IF EXISTS `random_hierarchy_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `random_hierarchy_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) NOT NULL,
  `hierarchy_entry_id` int(11) DEFAULT NULL,
  `hierarchy_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `hierarchy_id` (`hierarchy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `random_hierarchy_images`
--

LOCK TABLES `random_hierarchy_images` WRITE;
/*!40000 ALTER TABLE `random_hierarchy_images` DISABLE KEYS */;
INSERT INTO `random_hierarchy_images` VALUES (30,2,2,3,7,'<i>Autvoluptatesus temporaalis</i> Factory TestFramework'),(31,11,3,3,8,'<i>Excepturialia omnisa</i> Factory TestFramework'),(32,20,4,3,9,'<i>Estveroalia nihilata</i> Factory TestFramework'),(33,29,5,3,10,'<i>Quiincidunta culpaelia</i> Factory TestFramework'),(34,38,6,3,11,'<i>Providentalia estquaeratens</i> Factory TestFramework'),(35,47,7,3,12,'<i>Placeatalia uteosensis</i> Factory TestFramework'),(36,66,11,3,16,'<i>Ipsaensis architectoalius</i> Factory TestFramework'),(37,82,12,3,17,'<i>Deserunterox facererox</i> Factory TestFramework'),(38,92,13,3,18,'<i>Suntalia estsitalius</i> Factory TestFramework'),(39,101,17,3,20,'<i>Aliasosyne quiadipisciatus</i> Factory TestFramework'),(40,110,24,6,21,'<i>Illoica exexplicaboalia</i> Factory TestFramework'),(41,119,26,6,22,'<i>Laboriosamerus quisis</i> Factory TestFramework'),(42,128,27,6,23,'<i>Optiois molestiasalia</i> Factory TestFramework'),(43,137,28,6,24,'<i>Ipsuma animius</i> Factory TestFramework'),(44,146,29,6,25,'<i>Quiserox eligendii</i> Factory TestFramework'),(45,155,30,6,26,'<i>Eteaiae nullais</i> Factory TestFramework'),(46,164,31,6,27,'<i>Quibusdameli estculpaatut</i> Factory TestFramework'),(47,173,32,6,28,'<i>Estasperioreseli etquidemit</i> Factory TestFramework'),(48,182,33,6,29,'<i>Nesciunterox autrerumalit</i> Factory TestFramework'),(49,191,34,6,30,'<i>Voluptasalius optioerut</i> Factory TestFramework'),(50,200,35,6,31,'<i>Remrerumeron auteterut</i> Factory TestFramework'),(51,209,36,6,32,'<i>Veritatises idofficiisiaf</i> Factory TestFramework'),(52,218,37,6,33,'<i>Accusamusalis pariaturb</i> Factory TestFramework'),(53,227,38,6,34,'<i>Voluptateseri doloremosynf</i> Factory TestFramework');
/*!40000 ALTER TABLE `random_hierarchy_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rank_group_id` smallint(6) NOT NULL COMMENT 'not required; there is no rank_groups table. This is used to group (reconcile) different strings for the same rank',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Stores taxonomic ranks (ex: phylum, order, class, family...). Used in hierarchy_entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_identifier_types`
--

DROP TABLE IF EXISTS `ref_identifier_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_identifier_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_identifier_types`
--

LOCK TABLES `ref_identifier_types` WRITE;
/*!40000 ALTER TABLE `ref_identifier_types` DISABLE KEYS */;
INSERT INTO `ref_identifier_types` VALUES (3,'bici'),(4,'coden'),(2,'doi'),(5,'eissn'),(6,'handle'),(7,'isbn'),(8,'issn'),(9,'lsid'),(10,'oclc'),(11,'sici'),(1,'url'),(12,'urn');
/*!40000 ALTER TABLE `ref_identifier_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_identifiers`
--

DROP TABLE IF EXISTS `ref_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_identifiers` (
  `ref_id` int(10) unsigned NOT NULL,
  `ref_identifier_type_id` smallint(5) unsigned NOT NULL,
  `identifier` varchar(255) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`ref_id`,`ref_identifier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_identifiers`
--

LOCK TABLES `ref_identifiers` WRITE;
/*!40000 ALTER TABLE `ref_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_reference` text NOT NULL,
  `provider_mangaed_id` varchar(255) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `editors` varchar(255) DEFAULT NULL,
  `publication_created_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `page_start` varchar(50) DEFAULT NULL,
  `page_end` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL,
  `user_submitted` tinyint(1) NOT NULL DEFAULT '0',
  `visibility_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `full_reference` (`full_reference`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores reference full strings. References are linked to data objects and taxa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs`
--

LOCK TABLES `refs` WRITE;
/*!40000 ALTER TABLE `refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_statuses`
--

DROP TABLE IF EXISTS `resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='The status of the resource in harvesting';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_statuses`
--

LOCK TABLES `resource_statuses` WRITE;
/*!40000 ALTER TABLE `resource_statuses` DISABLE KEYS */;
INSERT INTO `resource_statuses` VALUES (1,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(2,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(3,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(4,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(5,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(6,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(7,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(8,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(9,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(10,'2014-02-20 10:44:28','2014-02-20 10:44:28'),(11,'2014-02-20 10:44:28','2014-02-20 10:44:28');
/*!40000 ALTER TABLE `resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `accesspoint_url` varchar(255) DEFAULT NULL COMMENT 'recommended; the url where the resource can be accessed. Not used when the resource is a file which was uploaded',
  `metadata_url` varchar(255) DEFAULT NULL,
  `dwc_archive_url` varchar(255) DEFAULT NULL,
  `service_type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'recommended; if accesspoint_url is defined, this will indicate what kind of protocal can be expected to be found there. (this is perhaps misued right now)',
  `service_version` varchar(255) DEFAULT NULL,
  `resource_set_code` varchar(255) DEFAULT NULL COMMENT 'not required; if the resource contains several subsets (such as DiGIR providers) theis indicates the set we are to harvest',
  `description` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `language_id` smallint(5) unsigned DEFAULT NULL COMMENT 'not required; the default language of the contents of the resource',
  `subject` varchar(255) NOT NULL,
  `bibliographic_citation` varchar(400) DEFAULT NULL COMMENT 'not required; the default bibliographic citation for all data objects whithin the resource',
  `license_id` tinyint(3) unsigned NOT NULL,
  `rights_statement` varchar(400) DEFAULT NULL,
  `rights_holder` varchar(255) DEFAULT NULL,
  `refresh_period_hours` smallint(5) unsigned DEFAULT NULL COMMENT 'recommended; if the resource is to be harvested regularly, this field indicates how frequent the updates are',
  `resource_modified_at` datetime DEFAULT NULL,
  `resource_created_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harvested_at` datetime DEFAULT NULL COMMENT 'required; this field is updated each time the resource is harvested',
  `dataset_file_name` varchar(255) DEFAULT NULL,
  `dataset_content_type` varchar(255) DEFAULT NULL,
  `dataset_file_size` int(11) DEFAULT NULL,
  `resource_status_id` int(11) DEFAULT NULL,
  `auto_publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'required; boolean; indicates whether the resource is to be published immediately after harvesting',
  `vetted` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text,
  `hierarchy_id` int(10) unsigned DEFAULT NULL,
  `dwc_hierarchy_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `preview_collection_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dataset_license_id` int(11) DEFAULT NULL,
  `dataset_rights_holder` varchar(255) DEFAULT NULL,
  `dataset_rights_statement` varchar(400) DEFAULT NULL,
  `dataset_source_url` varchar(255) DEFAULT NULL,
  `dataset_hosted_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hierarchy_id` (`hierarchy_id`),
  KEY `content_partner_id` (`content_partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Content parters supply resource files which contain data objects and taxa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,3,'LigerCat resource','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-02-18 10:43:56','2014-02-20 08:44:06',NULL,NULL,NULL,NULL,NULL,0,0,NULL,2,NULL,NULL,NULL,'2014-02-20 08:44:06',NULL,NULL,NULL,NULL,NULL),(2,1,'Initial IUCN Import','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-02-18 10:43:56','2014-02-20 08:44:11',NULL,NULL,NULL,NULL,NULL,0,0,NULL,8,NULL,NULL,NULL,'2014-02-20 08:44:11',NULL,NULL,NULL,NULL,NULL),(3,2,'Bootstrapper','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-02-18 10:43:56','2014-02-20 08:44:31',NULL,NULL,NULL,NULL,8,0,1,NULL,NULL,NULL,NULL,NULL,'2014-02-20 08:44:31',NULL,NULL,NULL,NULL,NULL),(4,4,'Test Framework Import','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-02-18 10:43:56','2014-02-20 08:45:16',NULL,NULL,NULL,NULL,8,0,0,NULL,10,NULL,NULL,NULL,'2014-02-20 08:45:16',NULL,NULL,NULL,NULL,NULL),(5,6,'Test ContentPartner import','http://eol.org/opensearchdescription.xml',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Test Resource Subject',NULL,3,NULL,NULL,0,NULL,'2014-02-18 10:43:56','2014-02-20 08:45:20',NULL,NULL,NULL,NULL,8,0,1,NULL,11,NULL,NULL,NULL,'2014-02-20 08:45:20',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090115212906'),('20090115213411'),('20120103141320'),('20120110075736'),('20120110103907'),('20120111211217'),('20120112191907'),('20120112200143'),('20120117213105'),('20120120205849'),('20120131212129'),('20120206154220'),('20120207203935'),('20120208221609'),('20120210202432'),('20120222032338'),('20120223204740'),('20120229152123'),('20120229170021'),('20120301041857'),('20120307204553'),('20120313030838'),('20120315225035'),('20120322050318'),('20120322201426'),('20120322203550'),('20120328143839'),('20120409142449'),('20120411135611'),('20120416134434'),('20120416205738'),('20120424162745'),('20120425185543'),('20120502204941'),('20120508144927'),('20120509164521'),('20120511145911'),('20120523132153'),('20120524195141'),('20120606174130'),('20120612185023'),('20120620180925'),('20120621170001'),('20120702161131'),('20120711180628'),('20120711191923'),('20120717195215'),('20120723173028'),('20120725174440'),('20120726181117'),('20120803133442'),('20120822130345'),('20120824212655'),('20120831194556'),('20120913212558'),('20120921163501'),('20121017193823'),('20121024195217'),('20121214213208'),('20121214213210'),('20121226211903'),('20130114173940'),('20130115161931'),('20130122175125'),('20130131151206'),('20130213150346'),('20130218224336'),('20130221155225'),('20130312205157'),('20130314154506'),('20130316220630'),('20130405164819'),('20130409183346'),('20130417184926'),('20130507192132'),('20130513160049'),('20130514165519'),('20130516163352'),('20130616133515'),('20130616133666'),('20130621154953'),('20130625164819'),('20130705175328'),('20130716181945'),('20130719150708'),('20130814154004'),('20130821135151'),('20130822141249'),('20130822212627'),('20130828134735'),('20130903164208'),('20131003131947'),('20131007005920'),('20131015172505'),('20131016162919'),('20131017205031'),('20131018135212'),('20131114214249'),('20131127153518'),('20131220005325'),('20131223163226'),('20140107210209'),('20140123190941'),('20140207155052'),('20140209080829'),('20140209081037'),('20140209081242'),('20140209081429'),('20140209081622'),('20140209081840'),('20140209084025'),('20140209084158'),('20140209084302'),('20140209084355'),('20140209084455');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_suggestions`
--

DROP TABLE IF EXISTS `search_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(255) NOT NULL DEFAULT '',
  `language_label` varchar(255) NOT NULL DEFAULT 'en',
  `taxon_id` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `content_notes` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_suggestions`
--

LOCK TABLES `search_suggestions` WRITE;
/*!40000 ALTER TABLE `search_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_types`
--

DROP TABLE IF EXISTS `service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_types` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='What type of protocol the content partners are exposing';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_types`
--

LOCK TABLES `service_types` WRITE;
/*!40000 ALTER TABLE `service_types` DISABLE KEYS */;
INSERT INTO `service_types` VALUES (1);
/*!40000 ALTER TABLE `service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_options`
--

DROP TABLE IF EXISTS `site_configuration_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_site_configuration_options_on_parameter` (`parameter`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_options`
--

LOCK TABLES `site_configuration_options` WRITE;
/*!40000 ALTER TABLE `site_configuration_options` DISABLE KEYS */;
INSERT INTO `site_configuration_options` VALUES (1,'email_actions_to_curators','','2014-02-20 10:44:00','2014-02-20 10:44:00'),(2,'email_actions_to_curators_address','','2014-02-20 10:44:00','2014-02-20 10:44:00'),(3,'global_site_warning','','2014-02-20 10:44:00','2014-02-20 10:44:00'),(4,'all_users_can_see_data','false','2014-02-20 10:44:00','2014-02-20 10:44:00'),(5,'reference_parsing_enabled','','2014-02-20 10:44:00','2014-02-20 10:44:00'),(6,'reference_parser_pid','','2014-02-20 10:44:00','2014-02-20 10:44:00'),(7,'reference_parser_endpoint','','2014-02-20 10:44:00','2014-02-20 10:44:00'),(8,'notification_error_user_id','','2014-02-20 10:44:00','2014-02-20 10:44:00');
/*!40000 ALTER TABLE `site_configuration_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sort_styles`
--

DROP TABLE IF EXISTS `sort_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sort_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sort_styles`
--

LOCK TABLES `sort_styles` WRITE;
/*!40000 ALTER TABLE `sort_styles` DISABLE KEYS */;
INSERT INTO `sort_styles` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `sort_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_collections`
--

DROP TABLE IF EXISTS `special_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_collections`
--

LOCK TABLES `special_collections` WRITE;
/*!40000 ALTER TABLE `special_collections` DISABLE KEYS */;
INSERT INTO `special_collections` VALUES (1,'Focus'),(2,'Watch');
/*!40000 ALTER TABLE `special_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Generic status table designed to be used in several places. Now only used in harvest_event tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responses`
--

DROP TABLE IF EXISTS `survey_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxon_id` varchar(255) DEFAULT NULL,
  `user_response` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responses`
--

LOCK TABLES `survey_responses` WRITE;
/*!40000 ALTER TABLE `survey_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_events`
--

DROP TABLE IF EXISTS `sync_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_md5_hash` varchar(255) DEFAULT NULL,
  `success_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `failed_reason` varchar(255) DEFAULT NULL,
  `UUID` varchar(255) DEFAULT NULL,
  `is_pull` tinyint(1) DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_events`
--

LOCK TABLES `sync_events` WRITE;
/*!40000 ALTER TABLE `sync_events` DISABLE KEYS */;
INSERT INTO `sync_events` VALUES (1,1,'/files/sync_logs/1.json','/files/sync_logs/1.md5','2014-03-02 12:13:42','2014-03-02 12:13:42',1,NULL,'18331cf8-a204-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 12:13:40','2014-03-02 12:14:18'),(2,1,'/files/sync_logs/2.json','/files/sync_logs/2.md5','2014-03-02 12:17:32','2014-03-02 12:17:24',1,NULL,'9cb9e740-a204-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 12:17:23','2014-03-02 12:17:57'),(3,1,'/files/sync_logs/3.json','/files/sync_logs/3.md5','2014-03-02 12:20:42','2014-03-02 12:20:38',1,NULL,'10acb240-a205-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 12:20:37','2014-03-02 12:21:16'),(4,1,'/files/sync_logs/4.json','/files/sync_logs/4.md5','2014-03-02 12:24:12','2014-03-02 12:24:05',1,NULL,'8bee916c-a205-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 12:24:05','2014-03-02 12:24:43'),(5,1,'/files/sync_logs/5.json','/files/sync_logs/5.md5','2014-03-02 12:29:43','2014-03-02 12:29:35',1,NULL,'50936948-a206-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 12:29:34','2014-03-02 12:30:12'),(6,1,'/files/sync_logs/6.json','/files/sync_logs/6.md5','2014-03-02 13:28:44','2014-03-02 13:28:43',1,NULL,'931870e4-a20e-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 13:28:42','2014-03-02 13:29:19'),(7,1,'/files/sync_logs/7.json','/files/sync_logs/7.md5','2014-03-02 13:34:14','2014-03-02 13:34:11',1,NULL,'568244ba-a20f-11e3-b94d-080027d6c7a0',NULL,NULL,NULL,'2014-03-02 13:34:09','2014-03-02 13:34:57'),(8,0,NULL,NULL,'2014-03-03 09:02:54',NULL,1,NULL,'f14fb16a-a2b1-11e3-b94d-080027d6c7a0',1,NULL,NULL,'2014-03-03 09:02:51','2014-03-03 09:02:54');
/*!40000 ALTER TABLE `sync_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_log_action_parameters`
--

DROP TABLE IF EXISTS `sync_log_action_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_log_action_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peer_log_id` int(11) DEFAULT NULL,
  `param_object_type_id` int(11) DEFAULT NULL,
  `param_object_id` int(11) DEFAULT NULL,
  `param_object_site_id` int(11) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_log_action_parameters`
--

LOCK TABLES `sync_log_action_parameters` WRITE;
/*!40000 ALTER TABLE `sync_log_action_parameters` DISABLE KEYS */;
INSERT INTO `sync_log_action_parameters` VALUES (1,1,NULL,NULL,NULL,'language','1','2014-03-02 12:12:54','2014-03-02 12:12:54'),(2,1,NULL,NULL,NULL,'validation_code','d3eed04ffae3fd3c807548b8ebbbc13a658fdaa1','2014-03-02 12:12:54','2014-03-02 12:12:54'),(3,1,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 12:12:54','2014-03-02 12:12:54'),(4,1,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 12:12:54','2014-03-02 12:12:54'),(5,1,NULL,NULL,NULL,'site_id','1','2014-03-02 12:12:54','2014-03-02 12:12:54'),(6,1,NULL,NULL,NULL,'created_at','2014-03-02 12:12:50','2014-03-02 12:12:54','2014-03-02 12:12:54'),(7,1,NULL,NULL,NULL,'username','user1','2014-03-02 12:12:54','2014-03-02 12:12:54'),(8,1,NULL,NULL,NULL,'agreed_with_terms','1','2014-03-02 12:12:54','2014-03-02 12:12:54'),(9,2,NULL,NULL,NULL,'language','1','2014-03-02 12:16:38','2014-03-02 12:16:38'),(10,2,NULL,NULL,NULL,'validation_code',NULL,'2014-03-02 12:16:38','2014-03-02 12:16:38'),(11,2,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 12:16:38','2014-03-02 12:16:38'),(12,2,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 12:16:38','2014-03-02 12:16:38'),(13,2,NULL,NULL,NULL,'site_id','1','2014-03-02 12:16:38','2014-03-02 12:16:38'),(14,2,NULL,NULL,NULL,'updated_at','2014-03-02 12:16:25','2014-03-02 12:16:39','2014-03-02 12:16:39'),(15,2,NULL,NULL,NULL,'bio','i am walaa','2014-03-02 12:16:39','2014-03-02 12:16:39'),(16,2,NULL,NULL,NULL,'given_name','','2014-03-02 12:16:39','2014-03-02 12:16:39'),(17,2,NULL,NULL,NULL,'family_name','','2014-03-02 12:16:39','2014-03-02 12:16:39'),(18,2,NULL,NULL,NULL,'tag_line','','2014-03-02 12:16:39','2014-03-02 12:16:39'),(19,2,NULL,NULL,NULL,'user_identity_ids','1,2','2014-03-02 12:16:39','2014-03-02 12:16:39'),(20,2,NULL,NULL,NULL,'username','user1','2014-03-02 12:16:39','2014-03-02 12:16:39'),(21,2,NULL,NULL,NULL,'language_abbr','en','2014-03-02 12:16:39','2014-03-02 12:16:39'),(22,3,NULL,NULL,NULL,'language','1','2014-03-02 12:19:55','2014-03-02 12:19:55'),(23,3,NULL,NULL,NULL,'validation_code',NULL,'2014-03-02 12:19:55','2014-03-02 12:19:55'),(24,3,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 12:19:55','2014-03-02 12:19:55'),(25,3,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 12:19:55','2014-03-02 12:19:55'),(26,3,NULL,NULL,NULL,'site_id','1','2014-03-02 12:19:56','2014-03-02 12:19:56'),(27,3,NULL,NULL,NULL,'updated_at','2014-03-02 12:19:49','2014-03-02 12:19:56','2014-03-02 12:19:56'),(28,3,NULL,NULL,NULL,'bio','i am walaa','2014-03-02 12:19:56','2014-03-02 12:19:56'),(29,3,NULL,NULL,NULL,'given_name','walaa','2014-03-02 12:19:56','2014-03-02 12:19:56'),(30,3,NULL,NULL,NULL,'family_name','elsayed','2014-03-02 12:19:56','2014-03-02 12:19:56'),(31,3,NULL,NULL,NULL,'tag_line','Bird enthusiast','2014-03-02 12:19:56','2014-03-02 12:19:56'),(32,3,NULL,NULL,NULL,'user_identity_ids','1','2014-03-02 12:19:56','2014-03-02 12:19:56'),(33,3,NULL,NULL,NULL,'username','user1','2014-03-02 12:19:56','2014-03-02 12:19:56'),(34,3,NULL,NULL,NULL,'language_abbr','en','2014-03-02 12:19:56','2014-03-02 12:19:56'),(35,4,NULL,NULL,NULL,'language','1','2014-03-02 12:23:24','2014-03-02 12:23:24'),(36,4,NULL,NULL,NULL,'validation_code',NULL,'2014-03-02 12:23:24','2014-03-02 12:23:24'),(37,4,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 12:23:24','2014-03-02 12:23:24'),(38,4,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 12:23:24','2014-03-02 12:23:24'),(39,4,NULL,NULL,NULL,'site_id','1','2014-03-02 12:23:24','2014-03-02 12:23:24'),(40,4,NULL,NULL,NULL,'updated_at','2014-03-02 12:23:16','2014-03-02 12:23:24','2014-03-02 12:23:24'),(41,4,NULL,NULL,NULL,'bio','i am walaa','2014-03-02 12:23:24','2014-03-02 12:23:24'),(42,4,NULL,NULL,NULL,'given_name','walaa','2014-03-02 12:23:24','2014-03-02 12:23:24'),(43,4,NULL,NULL,NULL,'family_name','elsayed','2014-03-02 12:23:24','2014-03-02 12:23:24'),(44,4,NULL,NULL,NULL,'tag_line','Bird enthusiast','2014-03-02 12:23:24','2014-03-02 12:23:24'),(45,4,NULL,NULL,NULL,'user_identity_ids',NULL,'2014-03-02 12:23:24','2014-03-02 12:23:24'),(46,4,NULL,NULL,NULL,'username','user2','2014-03-02 12:23:24','2014-03-02 12:23:24'),(47,4,NULL,NULL,NULL,'language_abbr','en','2014-03-02 12:23:24','2014-03-02 12:23:24'),(48,5,NULL,NULL,NULL,'language','1','2014-03-02 12:28:45','2014-03-02 12:28:45'),(49,5,NULL,NULL,NULL,'validation_code',NULL,'2014-03-02 12:28:45','2014-03-02 12:28:45'),(50,5,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 12:28:45','2014-03-02 12:28:45'),(51,5,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 12:28:45','2014-03-02 12:28:45'),(52,5,NULL,NULL,NULL,'site_id','1','2014-03-02 12:28:45','2014-03-02 12:28:45'),(53,5,NULL,NULL,NULL,'updated_at','2014-03-02 12:28:36','2014-03-02 12:28:45','2014-03-02 12:28:45'),(54,5,NULL,NULL,NULL,'bio','i am walaa','2014-03-02 12:28:45','2014-03-02 12:28:45'),(55,5,NULL,NULL,NULL,'given_name','walaa','2014-03-02 12:28:45','2014-03-02 12:28:45'),(56,5,NULL,NULL,NULL,'family_name','elsayed','2014-03-02 12:28:45','2014-03-02 12:28:45'),(57,5,NULL,NULL,NULL,'tag_line','Bird enthusiast','2014-03-02 12:28:45','2014-03-02 12:28:45'),(58,5,NULL,NULL,NULL,'user_identity_ids',NULL,'2014-03-02 12:28:45','2014-03-02 12:28:45'),(59,5,NULL,NULL,NULL,'username','user2','2014-03-02 12:28:45','2014-03-02 12:28:45'),(60,5,NULL,NULL,NULL,'language_abbr','en','2014-03-02 12:28:45','2014-03-02 12:28:45'),(61,6,NULL,NULL,NULL,'language','1','2014-03-02 13:27:40','2014-03-02 13:27:40'),(62,6,NULL,NULL,NULL,'validation_code',NULL,'2014-03-02 13:27:40','2014-03-02 13:27:40'),(63,6,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 13:27:40','2014-03-02 13:27:40'),(64,6,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 13:27:40','2014-03-02 13:27:40'),(65,6,NULL,NULL,NULL,'site_id','1','2014-03-02 13:27:40','2014-03-02 13:27:40'),(66,6,NULL,NULL,NULL,'updated_at','2014-03-02 13:26:42','2014-03-02 13:27:40','2014-03-02 13:27:40'),(67,6,NULL,NULL,NULL,'api_key','b72b0dc4a754b3d12a1abb92257f91ed87b458fc','2014-03-02 13:27:40','2014-03-02 13:27:40'),(68,6,NULL,NULL,NULL,'bio','i am wala2','2014-03-02 13:27:40','2014-03-02 13:27:40'),(69,6,NULL,NULL,NULL,'given_name','walaa','2014-03-02 13:27:40','2014-03-02 13:27:40'),(70,6,NULL,NULL,NULL,'family_name','elsayed','2014-03-02 13:27:40','2014-03-02 13:27:40'),(71,6,NULL,NULL,NULL,'tag_line','Bird enthusiast','2014-03-02 13:27:40','2014-03-02 13:27:40'),(72,6,NULL,NULL,NULL,'user_identity_ids',NULL,'2014-03-02 13:27:40','2014-03-02 13:27:40'),(73,6,NULL,NULL,NULL,'username','user2','2014-03-02 13:27:41','2014-03-02 13:27:41'),(74,6,NULL,NULL,NULL,'language_abbr','en','2014-03-02 13:27:41','2014-03-02 13:27:41'),(75,7,NULL,NULL,NULL,'language','1','2014-03-02 13:33:20','2014-03-02 13:33:20'),(76,7,NULL,NULL,NULL,'validation_code',NULL,'2014-03-02 13:33:20','2014-03-02 13:33:20'),(77,7,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-02 13:33:20','2014-03-02 13:33:20'),(78,7,NULL,NULL,NULL,'user_origin_id','92','2014-03-02 13:33:20','2014-03-02 13:33:20'),(79,7,NULL,NULL,NULL,'site_id','1','2014-03-02 13:33:20','2014-03-02 13:33:20'),(80,7,NULL,NULL,NULL,'updated_at','2014-03-02 13:26:42','2014-03-02 13:33:20','2014-03-02 13:33:20'),(81,7,NULL,NULL,NULL,'api_key','b72b0dc4a754b3d12a1abb92257f91ed87b458fc','2014-03-02 13:33:20','2014-03-02 13:33:20'),(82,7,NULL,NULL,NULL,'bio','i am wala2','2014-03-02 13:33:20','2014-03-02 13:33:20'),(83,7,NULL,NULL,NULL,'given_name','walaa','2014-03-02 13:33:20','2014-03-02 13:33:20'),(84,7,NULL,NULL,NULL,'family_name','elsayed','2014-03-02 13:33:20','2014-03-02 13:33:20'),(85,7,NULL,NULL,NULL,'tag_line','Bird enthusiast','2014-03-02 13:33:20','2014-03-02 13:33:20'),(86,7,NULL,NULL,NULL,'user_identity_ids','2','2014-03-02 13:33:20','2014-03-02 13:33:20'),(87,7,NULL,NULL,NULL,'username','user2','2014-03-02 13:33:20','2014-03-02 13:33:20'),(88,7,NULL,NULL,NULL,'language_abbr','en','2014-03-02 13:33:20','2014-03-02 13:33:20'),(89,8,NULL,NULL,NULL,'language','en','2014-03-03 09:02:52','2014-03-03 09:02:52'),(90,8,NULL,NULL,NULL,'validation_code','9587c74733f8572dd15d756c56aa2ef0a5c4fa4d','2014-03-03 09:02:52','2014-03-03 09:02:52'),(91,8,NULL,NULL,NULL,'remote_ip','127.0.0.1','2014-03-03 09:02:52','2014-03-03 09:02:52'),(92,8,NULL,NULL,NULL,'user_origin_id','2','2014-03-03 09:02:52','2014-03-03 09:02:52'),(93,8,NULL,NULL,NULL,'site_id','2','2014-03-03 09:02:52','2014-03-03 09:02:52'),(94,8,NULL,NULL,NULL,'created_at','2014-03-03 08:56:49','2014-03-03 09:02:52','2014-03-03 09:02:52'),(95,8,NULL,NULL,NULL,'username','user100','2014-03-03 09:02:52','2014-03-03 09:02:52'),(96,8,NULL,NULL,NULL,'agreed_with_terms','1','2014-03-03 09:02:52','2014-03-03 09:02:52');
/*!40000 ALTER TABLE `sync_log_action_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_object_actions`
--

DROP TABLE IF EXISTS `sync_object_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_object_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_action` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_object_actions`
--

LOCK TABLES `sync_object_actions` WRITE;
/*!40000 ALTER TABLE `sync_object_actions` DISABLE KEYS */;
INSERT INTO `sync_object_actions` VALUES (1,'create','2014-03-02 12:12:53','2014-03-02 12:12:53'),(2,'update','2014-03-02 12:16:38','2014-03-02 12:16:38');
/*!40000 ALTER TABLE `sync_object_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_object_types`
--

DROP TABLE IF EXISTS `sync_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_object_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_object_types`
--

LOCK TABLES `sync_object_types` WRITE;
/*!40000 ALTER TABLE `sync_object_types` DISABLE KEYS */;
INSERT INTO `sync_object_types` VALUES (1,'User','2014-03-02 12:12:53','2014-03-02 12:12:53');
/*!40000 ALTER TABLE `sync_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_peer_logs`
--

DROP TABLE IF EXISTS `sync_peer_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_peer_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_site_id` int(11) DEFAULT NULL,
  `user_site_object_id` int(11) DEFAULT NULL,
  `action_taken_at_time` datetime DEFAULT NULL,
  `sync_object_action_id` int(11) DEFAULT NULL,
  `sync_object_type_id` int(11) DEFAULT NULL,
  `sync_object_id` int(11) DEFAULT NULL,
  `sync_object_site_id` int(11) DEFAULT NULL,
  `sync_event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_peer_logs`
--

LOCK TABLES `sync_peer_logs` WRITE;
/*!40000 ALTER TABLE `sync_peer_logs` DISABLE KEYS */;
INSERT INTO `sync_peer_logs` VALUES (1,1,92,'2014-03-02 12:12:53',1,1,92,1,1,'2014-03-02 12:12:53','2014-03-02 12:12:53'),(2,1,92,'2014-03-02 12:16:38',2,1,92,1,2,'2014-03-02 12:16:38','2014-03-02 12:16:38'),(3,1,92,'2014-03-02 12:19:55',2,1,92,1,3,'2014-03-02 12:19:55','2014-03-02 12:19:55'),(4,1,92,'2014-03-02 12:23:24',2,1,92,1,4,'2014-03-02 12:23:24','2014-03-02 12:23:24'),(5,1,92,'2014-03-02 12:28:45',2,1,92,1,5,'2014-03-02 12:28:45','2014-03-02 12:28:45'),(6,1,92,'2014-03-02 13:27:40',2,1,92,1,6,'2014-03-02 13:27:40','2014-03-02 13:27:40'),(7,1,92,'2014-03-02 13:33:20',2,1,92,1,7,'2014-03-02 13:33:20','2014-03-02 13:33:20'),(8,2,2,'2014-03-03 08:56:51',1,1,2,2,8,'2014-03-03 09:02:52','2014-03-03 09:02:52');
/*!40000 ALTER TABLE `sync_peer_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_uuids`
--

DROP TABLE IF EXISTS `sync_uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_uuids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_uuid` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_uuids`
--

LOCK TABLES `sync_uuids` WRITE;
/*!40000 ALTER TABLE `sync_uuids` DISABLE KEYS */;
INSERT INTO `sync_uuids` VALUES (1,'f14fb16a-a2b1-11e3-b94d-080027d6c7a0','2014-03-02 12:13:42','2014-03-03 09:02:54');
/*!40000 ALTER TABLE `sync_uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonym_relations`
--

DROP TABLE IF EXISTS `synonym_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym_relations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonym_relations`
--

LOCK TABLES `synonym_relations` WRITE;
/*!40000 ALTER TABLE `synonym_relations` DISABLE KEYS */;
INSERT INTO `synonym_relations` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49);
/*!40000 ALTER TABLE `synonym_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonyms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_id` int(10) unsigned NOT NULL,
  `synonym_relation_id` tinyint(3) unsigned NOT NULL COMMENT 'the relationship this synonym has with the preferred name for this node',
  `language_id` smallint(5) unsigned NOT NULL COMMENT 'generally only set when the synonym is a common name',
  `hierarchy_entry_id` int(10) unsigned NOT NULL COMMENT 'associated node in the hierarchy',
  `preferred` tinyint(3) unsigned NOT NULL COMMENT 'set to 1 if this is a common name and is the preferred common name for the node in its language',
  `hierarchy_id` smallint(5) unsigned NOT NULL COMMENT 'this is redundant as it can be found via the synonym''s hierarchy_entry. I think its here for legacy reasons, but we can probably get rid of it',
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `taxon_remarks` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_names` (`name_id`,`synonym_relation_id`,`language_id`,`hierarchy_entry_id`,`hierarchy_id`),
  KEY `hierarchy_entry_id` (`hierarchy_entry_id`),
  KEY `name_id` (`name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Used to assigned taxonomic synonyms and common names to hierarchy entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonyms`
--

LOCK TABLES `synonyms` WRITE;
/*!40000 ALTER TABLE `synonyms` DISABLE KEYS */;
INSERT INTO `synonyms` VALUES (1,2,1,5,2,1,5,2,1,NULL),(2,3,2,1,2,1,5,2,1,NULL),(3,4,1,5,3,1,5,2,1,NULL),(4,5,2,1,3,1,5,2,1,NULL),(5,6,1,5,4,1,5,2,1,NULL),(6,7,2,1,4,1,5,2,1,NULL),(7,8,1,5,5,1,5,2,1,NULL),(8,9,2,1,5,1,5,2,1,NULL),(9,10,1,5,6,1,5,2,1,NULL),(10,11,2,1,6,1,5,2,1,NULL),(11,12,1,5,7,1,5,2,1,NULL),(12,13,2,1,7,1,5,2,1,NULL),(13,14,1,5,8,1,5,2,1,NULL),(14,15,2,1,8,1,5,2,1,NULL),(15,16,2,1,8,0,5,2,1,NULL),(16,17,2,1,8,0,5,2,1,NULL),(17,18,2,1,8,0,5,2,1,NULL),(18,19,2,1,8,0,5,2,1,NULL),(19,20,2,1,8,0,5,2,1,NULL),(20,21,1,5,9,1,5,2,1,NULL),(21,11,2,1,9,1,5,2,1,NULL),(22,22,1,5,10,1,5,2,1,NULL),(23,23,1,5,11,1,5,2,1,NULL),(24,24,2,1,11,1,5,2,1,NULL),(25,26,2,1,12,1,5,2,1,NULL),(26,25,1,5,12,1,5,2,1,NULL),(27,27,1,5,13,1,5,2,1,NULL),(28,31,2,1,17,0,5,2,1,NULL),(29,32,2,1,17,1,5,2,1,NULL),(30,33,2,1,17,0,5,2,1,NULL),(31,30,1,5,17,1,5,2,1,NULL),(32,35,2,1,24,1,5,2,1,NULL),(33,34,1,5,24,1,5,2,1,NULL),(34,39,2,1,26,1,5,2,1,NULL),(35,38,1,5,26,1,5,2,1,NULL),(36,41,2,1,27,1,5,2,1,NULL),(37,40,1,5,27,1,5,2,1,NULL),(38,43,2,1,28,1,5,2,1,NULL),(39,42,1,5,28,1,5,2,1,NULL),(40,45,2,1,29,1,5,2,1,NULL),(41,44,1,5,29,1,5,2,1,NULL),(42,47,2,1,30,1,5,2,1,NULL),(43,46,1,5,30,1,5,2,1,NULL),(44,49,2,1,31,1,5,2,1,NULL),(45,48,1,5,31,1,5,2,1,NULL),(46,51,2,1,32,1,5,2,1,NULL),(47,50,1,5,32,1,5,2,1,NULL),(48,53,2,1,33,1,5,2,1,NULL),(49,52,1,5,33,1,5,2,1,NULL),(50,54,1,5,34,1,5,2,1,NULL),(51,55,2,1,34,1,5,2,1,NULL),(52,56,2,1,34,0,5,2,1,NULL),(53,57,2,1,34,0,5,2,1,NULL),(54,58,2,1,34,0,5,2,1,NULL),(55,59,2,7,34,1,5,2,1,NULL),(56,60,2,7,34,0,5,2,1,NULL),(57,61,2,7,34,0,5,2,1,NULL),(58,62,2,2,34,1,5,2,1,NULL),(59,63,2,2,34,0,5,2,1,NULL),(60,64,2,2,34,0,5,2,1,NULL),(61,65,1,5,34,0,5,2,1,NULL),(62,67,2,1,35,1,5,2,1,NULL),(63,66,1,5,35,1,5,2,1,NULL),(64,69,2,1,36,1,5,2,1,NULL),(65,68,1,5,36,1,5,2,1,NULL),(66,71,2,1,37,1,5,2,1,NULL),(67,70,1,5,37,1,5,2,1,NULL),(68,73,2,1,38,1,5,2,1,NULL),(69,72,1,5,38,1,5,2,1,NULL);
/*!40000 ALTER TABLE `synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_of_contents`
--

DROP TABLE IF EXISTS `table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_of_contents` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL COMMENT 'refers to the parent taxon_of_contents id. Our table of content is only two levels deep',
  `view_order` smallint(5) unsigned DEFAULT '0' COMMENT 'used to organize the view of the table of contents on the species page in order of priority, not alphabetically',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_of_contents`
--

LOCK TABLES `table_of_contents` WRITE;
/*!40000 ALTER TABLE `table_of_contents` DISABLE KEYS */;
INSERT INTO `table_of_contents` VALUES (1,0,1),(2,1,2),(3,5,39),(4,0,3),(5,0,4),(6,5,5),(7,0,6),(8,7,7),(9,0,8),(10,5,9),(11,0,50),(12,11,51),(13,11,52),(14,11,53),(15,0,57),(16,15,58),(17,0,61),(18,0,62),(19,0,70),(20,19,71),(21,0,58),(22,18,65),(23,18,66),(24,18,67),(25,0,68),(26,25,69),(27,25,70),(28,5,41),(29,0,77),(30,0,78),(31,0,57),(32,0,80),(33,5,43),(34,0,56),(35,0,83),(36,0,84),(37,0,85),(38,0,59),(39,5,40),(40,5,42),(41,5,44),(42,5,45),(43,5,46),(44,5,47),(45,5,48),(46,5,49),(47,5,50),(48,5,51),(49,5,52),(50,5,53),(51,0,55),(52,38,60),(53,38,61),(54,38,62),(55,38,63),(56,38,64),(57,38,65),(58,38,66),(59,0,65);
/*!40000 ALTER TABLE `table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_classifications_locks`
--

DROP TABLE IF EXISTS `taxon_classifications_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_classifications_locks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_classifications_locks`
--

LOCK TABLES `taxon_classifications_locks` WRITE;
/*!40000 ALTER TABLE `taxon_classifications_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_classifications_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_content`
--

DROP TABLE IF EXISTS `taxon_concept_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_content` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `text` tinyint(3) unsigned NOT NULL,
  `text_unpublished` tinyint(3) unsigned NOT NULL,
  `image` tinyint(3) unsigned NOT NULL,
  `image_unpublished` tinyint(3) unsigned NOT NULL,
  `child_image` tinyint(3) unsigned NOT NULL,
  `child_image_unpublished` tinyint(3) unsigned NOT NULL,
  `flash` tinyint(3) unsigned NOT NULL,
  `youtube` tinyint(3) unsigned NOT NULL,
  `map` tinyint(3) unsigned NOT NULL,
  `content_level` tinyint(3) unsigned NOT NULL,
  `image_object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_content`
--

LOCK TABLES `taxon_concept_content` WRITE;
/*!40000 ALTER TABLE `taxon_concept_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_exemplar_articles`
--

DROP TABLE IF EXISTS `taxon_concept_exemplar_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_exemplar_articles` (
  `taxon_concept_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_exemplar_articles`
--

LOCK TABLES `taxon_concept_exemplar_articles` WRITE;
/*!40000 ALTER TABLE `taxon_concept_exemplar_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_exemplar_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_exemplar_images`
--

DROP TABLE IF EXISTS `taxon_concept_exemplar_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_exemplar_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_exemplar_images`
--

LOCK TABLES `taxon_concept_exemplar_images` WRITE;
/*!40000 ALTER TABLE `taxon_concept_exemplar_images` DISABLE KEYS */;
INSERT INTO `taxon_concept_exemplar_images` VALUES (7,2),(8,11),(9,20),(10,29),(11,38),(12,47),(16,66),(18,92),(20,101),(21,110),(22,119),(23,128),(24,137),(25,146),(26,155),(27,164),(28,173),(29,182),(30,191),(31,200),(32,209),(33,218),(34,227);
/*!40000 ALTER TABLE `taxon_concept_exemplar_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_metrics`
--

DROP TABLE IF EXISTS `taxon_concept_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_metrics` (
  `taxon_concept_id` int(11) NOT NULL DEFAULT '0',
  `image_total` mediumint(9) DEFAULT NULL,
  `image_trusted` mediumint(9) DEFAULT NULL,
  `image_untrusted` mediumint(9) DEFAULT NULL,
  `image_unreviewed` mediumint(9) DEFAULT NULL,
  `image_total_words` mediumint(9) DEFAULT NULL,
  `image_trusted_words` mediumint(9) DEFAULT NULL,
  `image_untrusted_words` mediumint(9) DEFAULT NULL,
  `image_unreviewed_words` mediumint(9) DEFAULT NULL,
  `text_total` mediumint(9) DEFAULT NULL,
  `text_trusted` mediumint(9) DEFAULT NULL,
  `text_untrusted` mediumint(9) DEFAULT NULL,
  `text_unreviewed` mediumint(9) DEFAULT NULL,
  `text_total_words` mediumint(9) DEFAULT NULL,
  `text_trusted_words` mediumint(9) DEFAULT NULL,
  `text_untrusted_words` mediumint(9) DEFAULT NULL,
  `text_unreviewed_words` mediumint(9) DEFAULT NULL,
  `video_total` mediumint(9) DEFAULT NULL,
  `video_trusted` mediumint(9) DEFAULT NULL,
  `video_untrusted` mediumint(9) DEFAULT NULL,
  `video_unreviewed` mediumint(9) DEFAULT NULL,
  `video_total_words` mediumint(9) DEFAULT NULL,
  `video_trusted_words` mediumint(9) DEFAULT NULL,
  `video_untrusted_words` mediumint(9) DEFAULT NULL,
  `video_unreviewed_words` mediumint(9) DEFAULT NULL,
  `sound_total` mediumint(9) DEFAULT NULL,
  `sound_trusted` mediumint(9) DEFAULT NULL,
  `sound_untrusted` mediumint(9) DEFAULT NULL,
  `sound_unreviewed` mediumint(9) DEFAULT NULL,
  `sound_total_words` mediumint(9) DEFAULT NULL,
  `sound_trusted_words` mediumint(9) DEFAULT NULL,
  `sound_untrusted_words` mediumint(9) DEFAULT NULL,
  `sound_unreviewed_words` mediumint(9) DEFAULT NULL,
  `flash_total` mediumint(9) DEFAULT NULL,
  `flash_trusted` mediumint(9) DEFAULT NULL,
  `flash_untrusted` mediumint(9) DEFAULT NULL,
  `flash_unreviewed` mediumint(9) DEFAULT NULL,
  `flash_total_words` mediumint(9) DEFAULT NULL,
  `flash_trusted_words` mediumint(9) DEFAULT NULL,
  `flash_untrusted_words` mediumint(9) DEFAULT NULL,
  `flash_unreviewed_words` mediumint(9) DEFAULT NULL,
  `youtube_total` mediumint(9) DEFAULT NULL,
  `youtube_trusted` mediumint(9) DEFAULT NULL,
  `youtube_untrusted` mediumint(9) DEFAULT NULL,
  `youtube_unreviewed` mediumint(9) DEFAULT NULL,
  `youtube_total_words` mediumint(9) DEFAULT NULL,
  `youtube_trusted_words` mediumint(9) DEFAULT NULL,
  `youtube_untrusted_words` mediumint(9) DEFAULT NULL,
  `youtube_unreviewed_words` mediumint(9) DEFAULT NULL,
  `iucn_total` tinyint(3) DEFAULT NULL,
  `iucn_trusted` tinyint(3) DEFAULT NULL,
  `iucn_untrusted` tinyint(3) DEFAULT NULL,
  `iucn_unreviewed` tinyint(3) DEFAULT NULL,
  `iucn_total_words` tinyint(3) DEFAULT NULL,
  `iucn_trusted_words` tinyint(3) DEFAULT NULL,
  `iucn_untrusted_words` tinyint(3) DEFAULT NULL,
  `iucn_unreviewed_words` tinyint(3) DEFAULT NULL,
  `data_object_references` smallint(6) DEFAULT NULL,
  `info_items` smallint(6) DEFAULT NULL,
  `BHL_publications` smallint(6) DEFAULT NULL,
  `content_partners` smallint(6) DEFAULT NULL,
  `outlinks` smallint(6) DEFAULT NULL,
  `has_GBIF_map` tinyint(1) DEFAULT NULL,
  `has_biomedical_terms` tinyint(1) DEFAULT NULL,
  `user_submitted_text` smallint(6) DEFAULT NULL,
  `submitted_text_providers` smallint(6) DEFAULT NULL,
  `common_names` smallint(6) DEFAULT NULL,
  `common_name_providers` smallint(6) DEFAULT NULL,
  `synonyms` smallint(6) DEFAULT NULL,
  `synonym_providers` smallint(6) DEFAULT NULL,
  `page_views` mediumint(9) DEFAULT NULL,
  `unique_page_views` mediumint(9) DEFAULT NULL,
  `richness_score` float DEFAULT NULL,
  `map_total` mediumint(9) DEFAULT NULL,
  `map_trusted` mediumint(9) DEFAULT NULL,
  `map_untrusted` mediumint(9) DEFAULT NULL,
  `map_unreviewed` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_metrics`
--

LOCK TABLES `taxon_concept_metrics` WRITE;
/*!40000 ALTER TABLE `taxon_concept_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_names`
--

DROP TABLE IF EXISTS `taxon_concept_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_names` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `name_id` int(10) unsigned NOT NULL,
  `source_hierarchy_entry_id` int(10) unsigned NOT NULL COMMENT 'recommended; if the name came from a certain hierarchy entry or its associated synonyms, the id of the entry will be listed here. This can be used to track down the source or attribution for a given name',
  `language_id` int(10) unsigned NOT NULL,
  `vern` tinyint(3) unsigned NOT NULL COMMENT 'boolean; if this is a common name, set this field to 1',
  `preferred` tinyint(3) unsigned NOT NULL,
  `synonym_id` int(11) NOT NULL DEFAULT '0',
  `vetted_id` int(11) DEFAULT '0',
  PRIMARY KEY (`taxon_concept_id`,`name_id`,`source_hierarchy_entry_id`,`language_id`,`synonym_id`),
  KEY `vern` (`vern`),
  KEY `name_id` (`name_id`),
  KEY `source_hierarchy_entry_id` (`source_hierarchy_entry_id`),
  KEY `index_taxon_concept_names_on_synonym_id` (`synonym_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_names`
--

LOCK TABLES `taxon_concept_names` WRITE;
/*!40000 ALTER TABLE `taxon_concept_names` DISABLE KEYS */;
INSERT INTO `taxon_concept_names` VALUES (7,2,2,5,0,1,1,2),(7,3,2,1,1,1,2,2),(7,36,25,5,0,1,0,1),(7,37,25,1,1,1,0,1),(8,4,3,5,0,1,3,2),(8,5,3,1,1,1,4,2),(9,6,4,5,0,1,5,2),(9,7,4,1,1,1,6,2),(10,8,5,5,0,1,7,2),(10,9,5,1,1,1,8,2),(11,10,6,5,0,1,9,2),(11,11,6,1,1,1,10,2),(12,12,7,5,0,1,11,2),(12,13,7,1,1,1,12,2),(13,14,8,5,0,1,13,2),(13,15,8,1,1,1,14,2),(13,16,8,1,1,0,15,2),(13,17,8,1,1,0,16,2),(13,18,8,1,1,0,17,2),(13,19,8,1,1,0,18,2),(13,20,8,1,1,0,19,2),(14,11,9,1,1,1,21,2),(14,21,9,5,0,1,20,2),(15,22,10,5,0,1,22,2),(16,23,11,5,0,1,23,2),(16,24,11,1,1,1,24,2),(17,25,12,5,0,1,26,2),(17,26,12,1,1,1,25,2),(18,27,13,5,0,1,27,2),(20,30,17,5,0,1,31,2),(20,31,17,1,1,0,28,2),(20,32,17,1,1,1,29,2),(20,33,17,1,1,0,30,2),(21,34,24,5,0,1,33,2),(21,35,24,1,1,1,32,2),(22,38,26,5,0,1,35,2),(22,39,26,1,1,1,34,2),(23,40,27,5,0,1,37,2),(23,41,27,1,1,1,36,2),(24,42,28,5,0,1,39,2),(24,43,28,1,1,1,38,2),(25,44,29,5,0,1,41,2),(25,45,29,1,1,1,40,2),(26,46,30,5,0,1,43,2),(26,47,30,1,1,1,42,2),(27,48,31,5,0,1,45,2),(27,49,31,1,1,1,44,2),(28,50,32,5,0,1,47,2),(28,51,32,1,1,1,46,2),(29,52,33,5,0,1,49,2),(29,53,33,1,1,1,48,2),(30,54,34,5,0,1,50,2),(30,55,34,1,1,1,51,2),(30,56,34,1,1,0,52,2),(30,57,34,1,1,0,53,2),(30,58,34,1,1,0,54,2),(30,59,34,7,1,1,55,2),(30,60,34,7,1,0,56,2),(30,61,34,7,1,0,57,2),(30,62,34,2,1,1,58,2),(30,63,34,2,1,0,59,2),(30,64,34,2,1,0,60,2),(30,65,34,5,0,0,61,2),(31,66,35,5,0,1,63,2),(31,67,35,1,1,1,62,2),(32,68,36,5,0,1,65,2),(32,69,36,1,1,1,64,2),(33,70,37,5,0,1,67,2),(33,71,37,1,1,1,66,2),(34,72,38,5,0,1,69,2),(34,73,38,1,1,1,68,2);
/*!40000 ALTER TABLE `taxon_concept_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_preferred_entries`
--

DROP TABLE IF EXISTS `taxon_concept_preferred_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_preferred_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxon_concept_id` (`taxon_concept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_preferred_entries`
--

LOCK TABLES `taxon_concept_preferred_entries` WRITE;
/*!40000 ALTER TABLE `taxon_concept_preferred_entries` DISABLE KEYS */;
INSERT INTO `taxon_concept_preferred_entries` VALUES (65,7,2,'2014-02-27 10:17:21'),(64,8,3,'2014-02-27 10:17:20'),(49,9,4,'2014-02-27 09:12:56'),(46,10,5,'2014-02-27 09:12:55'),(41,11,6,'2014-02-27 09:12:53'),(43,12,7,'2014-02-27 09:12:54'),(7,13,8,'2014-02-20 08:45:03'),(8,14,9,'2014-02-20 08:45:04'),(9,15,10,'2014-02-20 08:45:05'),(48,16,11,'2014-02-27 09:12:55'),(44,17,12,'2014-02-27 09:12:54'),(47,18,13,'2014-02-27 09:12:55'),(40,20,17,'2014-02-27 09:12:53'),(42,21,24,'2014-02-27 09:12:54'),(45,22,26,'2014-02-27 09:12:54'),(50,23,27,'2014-02-27 09:12:56'),(51,24,28,'2014-02-27 09:12:56'),(57,25,29,'2014-02-27 09:13:22'),(68,26,30,'2014-02-27 11:11:40'),(52,27,31,'2014-02-27 09:13:15'),(53,28,32,'2014-02-27 09:13:15'),(54,29,33,'2014-02-27 09:13:16'),(55,30,34,'2014-02-27 09:13:16'),(56,31,35,'2014-02-27 09:13:16'),(69,32,36,'2014-02-27 11:12:18'),(70,33,37,'2014-02-27 11:12:18'),(27,34,38,'2014-02-20 08:46:24');
/*!40000 ALTER TABLE `taxon_concept_preferred_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concept_stats`
--

DROP TABLE IF EXISTS `taxon_concept_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concept_stats` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `text_trusted` mediumint(8) unsigned NOT NULL,
  `text_untrusted` mediumint(8) unsigned NOT NULL,
  `image_trusted` mediumint(8) unsigned NOT NULL,
  `image_untrusted` mediumint(8) unsigned NOT NULL,
  `bhl` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concept_stats`
--

LOCK TABLES `taxon_concept_stats` WRITE;
/*!40000 ALTER TABLE `taxon_concept_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_concept_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concepts`
--

DROP TABLE IF EXISTS `taxon_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supercedure_id` int(10) unsigned NOT NULL COMMENT 'if concepts are at first thought to be distinct, there will be two concepts with two different ids. When they are confirmed to be the same one will be superceded by the other, and that replacement is kept track of so that older URLs can be redirected to the proper ids',
  `split_from` int(10) unsigned NOT NULL,
  `vetted_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'some concepts come from untrusted resources and are left untrusted until the resources become trusted',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'some concepts come from resource left unpublished until the resource becomes published',
  PRIMARY KEY (`id`),
  KEY `supercedure_id` (`supercedure_id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='This table is poorly named. Used to group similar hierarchy entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concepts`
--

LOCK TABLES `taxon_concepts` WRITE;
/*!40000 ALTER TABLE `taxon_concepts` DISABLE KEYS */;
INSERT INTO `taxon_concepts` VALUES (1,0,0,0,1),(7,0,0,1,1),(8,0,0,1,1),(9,0,0,1,1),(10,0,0,1,1),(11,0,0,1,1),(12,0,0,1,1),(13,0,0,3,1),(14,0,0,2,1),(15,0,0,1,1),(16,0,0,1,1),(17,0,0,1,1),(18,0,0,1,1),(19,0,0,0,1),(20,0,0,1,1),(21,0,0,1,1),(22,0,0,1,1),(23,0,0,1,1),(24,0,0,1,1),(25,0,0,1,1),(26,0,0,1,1),(27,0,0,1,1),(28,0,0,1,1),(29,0,0,1,1),(30,0,0,1,1),(31,0,0,1,1),(32,0,0,1,1),(33,0,0,1,1),(34,0,0,1,1);
/*!40000 ALTER TABLE `taxon_concepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_concepts_flattened`
--

DROP TABLE IF EXISTS `taxon_concepts_flattened`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_concepts_flattened` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`ancestor_id`),
  KEY `ancestor_id` (`ancestor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_concepts_flattened`
--

LOCK TABLES `taxon_concepts_flattened` WRITE;
/*!40000 ALTER TABLE `taxon_concepts_flattened` DISABLE KEYS */;
INSERT INTO `taxon_concepts_flattened` VALUES (7,21),(8,7),(9,7),(9,8),(10,7),(10,8),(10,9),(11,7),(11,8),(11,9),(11,10),(12,7),(12,8),(12,9),(12,10),(12,11),(13,7),(13,8),(13,9),(13,10),(13,11),(14,7),(14,8),(14,9),(14,10),(14,11),(15,7),(15,8),(15,9),(15,10),(15,11),(16,7),(16,8),(16,9),(16,10),(16,11),(17,7),(17,8),(17,9),(17,10),(17,11),(22,7),(22,21),(23,7),(23,21),(24,7),(24,21),(24,23),(25,7),(25,21),(25,23),(26,7),(26,21),(26,23),(26,25),(27,7),(27,21),(27,23),(27,25),(28,7),(28,21),(28,23),(28,25),(28,27),(29,7),(29,21),(29,23),(29,25),(29,27),(31,30),(32,30),(32,31),(33,30),(33,31),(33,32),(34,30),(34,31),(34,32),(34,33);
/*!40000 ALTER TABLE `taxon_concepts_flattened` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_data_exemplars`
--

DROP TABLE IF EXISTS `taxon_data_exemplars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_data_exemplars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `data_point_uri_id` int(11) DEFAULT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_taxon_data_exemplars_on_taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_data_exemplars`
--

LOCK TABLES `taxon_data_exemplars` WRITE;
/*!40000 ALTER TABLE `taxon_data_exemplars` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_data_exemplars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_items`
--

DROP TABLE IF EXISTS `title_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publication_title_id` int(10) unsigned NOT NULL,
  `bar_code` varchar(50) NOT NULL,
  `marc_item_id` varchar(50) NOT NULL,
  `call_number` varchar(100) NOT NULL,
  `volume_info` varchar(100) NOT NULL,
  `url` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'url for the description page for this item',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Used for BHL. Publications can have different volumes, versions, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_items`
--

LOCK TABLES `title_items` WRITE;
/*!40000 ALTER TABLE `title_items` DISABLE KEYS */;
INSERT INTO `title_items` VALUES (1,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(2,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(3,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(4,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(5,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(6,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(7,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(8,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(9,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(10,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(11,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(12,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(13,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(14,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(15,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(16,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(17,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(18,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(19,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(20,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(21,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(22,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(23,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(24,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(25,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(26,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(27,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(28,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(29,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(30,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(31,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(32,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(33,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(34,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(35,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(36,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(37,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(38,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(39,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(40,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(41,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(42,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(43,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(44,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(45,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(46,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(47,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(48,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(49,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(50,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(51,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(52,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(53,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(54,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(55,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(56,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(57,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(58,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(59,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(60,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(61,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(62,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(63,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(64,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(65,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(66,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(67,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(68,1,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting'),(69,2,'73577357735742','i11604463','QK1 .H38','1864 v. 3','http://www.biodiversitylibrary.org/item/ThisWontWork.OnlyTesting');
/*!40000 ALTER TABLE `title_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_concept_images`
--

DROP TABLE IF EXISTS `top_concept_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_concept_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_concept_images`
--

LOCK TABLES `top_concept_images` WRITE;
/*!40000 ALTER TABLE `top_concept_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_concept_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_images`
--

DROP TABLE IF EXISTS `top_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL COMMENT 'data object id of the image',
  `view_order` smallint(5) unsigned NOT NULL COMMENT 'order in which to show the images, lower values shown first',
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caches the top 300 or so best images for a particular hierarchy entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_images`
--

LOCK TABLES `top_images` WRITE;
/*!40000 ALTER TABLE `top_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_species_images`
--

DROP TABLE IF EXISTS `top_species_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_species_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL COMMENT 'data object id of the image',
  `view_order` smallint(5) unsigned NOT NULL COMMENT 'order in which to show the images, lower values shown first',
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='caches the top 300 or so best images for a particular hierarchy entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_species_images`
--

LOCK TABLES `top_species_images` WRITE;
/*!40000 ALTER TABLE `top_species_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_species_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_concept_images`
--

DROP TABLE IF EXISTS `top_unpublished_concept_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_concept_images` (
  `taxon_concept_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`taxon_concept_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_concept_images`
--

LOCK TABLES `top_unpublished_concept_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_concept_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_concept_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_images`
--

DROP TABLE IF EXISTS `top_unpublished_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cache the top 300 or so images which are unpublished - for curators and content partners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_images`
--

LOCK TABLES `top_unpublished_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_unpublished_species_images`
--

DROP TABLE IF EXISTS `top_unpublished_species_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_unpublished_species_images` (
  `hierarchy_entry_id` int(10) unsigned NOT NULL,
  `data_object_id` int(10) unsigned NOT NULL,
  `view_order` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`hierarchy_entry_id`,`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cache the top 300 or so images which are unpublished - for curators and content partners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_unpublished_species_images`
--

LOCK TABLES `top_unpublished_species_images` WRITE;
/*!40000 ALTER TABLE `top_unpublished_species_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_unpublished_species_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_agent_roles`
--

DROP TABLE IF EXISTS `translated_agent_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_agent_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_role_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_role_id` (`agent_role_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_agent_roles`
--

LOCK TABLES `translated_agent_roles` WRITE;
/*!40000 ALTER TABLE `translated_agent_roles` DISABLE KEYS */;
INSERT INTO `translated_agent_roles` VALUES (1,1,1,'Author',NULL),(2,2,1,'Source',NULL),(3,3,1,'Source Database',NULL),(4,4,1,'Contributor',NULL),(5,5,1,'Photographer',NULL),(6,6,1,'Editor',NULL),(7,7,1,'provider',NULL),(8,8,1,'Animator',NULL),(9,9,1,'Compiler',NULL),(10,10,1,'Composer',NULL),(11,11,1,'Creator',NULL),(12,12,1,'Director',NULL),(13,13,1,'Illustrator',NULL),(14,14,1,'Project',NULL),(15,15,1,'Publisher',NULL),(16,16,1,'Recorder',NULL),(17,17,1,'Contact Person',NULL),(18,18,1,'writer',NULL);
/*!40000 ALTER TABLE `translated_agent_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_audiences`
--

DROP TABLE IF EXISTS `translated_audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audience_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `audience_id` (`audience_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_audiences`
--

LOCK TABLES `translated_audiences` WRITE;
/*!40000 ALTER TABLE `translated_audiences` DISABLE KEYS */;
INSERT INTO `translated_audiences` VALUES (1,1,1,'Children',NULL),(2,2,1,'Expert users',NULL),(3,3,1,'General public',NULL);
/*!40000 ALTER TABLE `translated_audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_collection_types`
--

DROP TABLE IF EXISTS `translated_collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_collection_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_type_id` (`collection_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_collection_types`
--

LOCK TABLES `translated_collection_types` WRITE;
/*!40000 ALTER TABLE `translated_collection_types` DISABLE KEYS */;
INSERT INTO `translated_collection_types` VALUES (1,1,1,'Links',NULL),(2,2,1,'Literature',NULL),(3,3,1,'Images',NULL),(4,4,1,'Specimen',NULL),(5,5,1,'Natural',NULL),(6,6,1,'Species Pages',NULL),(7,7,1,'Molecular',NULL),(8,8,1,'Novice',NULL),(9,9,1,'Expert',NULL),(10,10,1,'Marine',NULL),(11,11,1,'Bugs',NULL);
/*!40000 ALTER TABLE `translated_collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_contact_roles`
--

DROP TABLE IF EXISTS `translated_contact_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_contact_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_role_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_contact_role_id` (`contact_role_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_contact_roles`
--

LOCK TABLES `translated_contact_roles` WRITE;
/*!40000 ALTER TABLE `translated_contact_roles` DISABLE KEYS */;
INSERT INTO `translated_contact_roles` VALUES (1,1,1,'Primary Contact',NULL),(2,2,1,'Administrative Contact',NULL),(3,3,1,'Technical Contact',NULL);
/*!40000 ALTER TABLE `translated_contact_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_contact_subjects`
--

DROP TABLE IF EXISTS `translated_contact_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_contact_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_subject_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `phonetic_action_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_subject_id` (`contact_subject_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_contact_subjects`
--

LOCK TABLES `translated_contact_subjects` WRITE;
/*!40000 ALTER TABLE `translated_contact_subjects` DISABLE KEYS */;
INSERT INTO `translated_contact_subjects` VALUES (1,1,1,'Membership and registration',NULL),(2,2,1,'Terms of use and licensing',NULL),(3,3,1,'Learning and education',NULL),(4,4,1,'Become a content partner',NULL),(5,5,1,'Content partner support',NULL),(6,6,1,'Curator support',NULL),(7,7,1,'Make a correction (spelling and grammar, images, information)',NULL),(8,8,1,'Contribute images, videos or sounds',NULL),(9,9,1,'Media requests (interviews, press inquiries, logo requests)',NULL),(10,10,1,'Make a financial donation',NULL),(11,11,1,'Technical questions (problems with search, website functionality)',NULL),(12,12,1,'General feedback',NULL);
/*!40000 ALTER TABLE `translated_contact_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_page_archives`
--

DROP TABLE IF EXISTS `translated_content_page_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_page_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translated_content_page_id` int(11) DEFAULT NULL,
  `content_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `left_content` text,
  `main_content` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `original_creation_date` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_page_archives`
--

LOCK TABLES `translated_content_page_archives` WRITE;
/*!40000 ALTER TABLE `translated_content_page_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `translated_content_page_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_pages`
--

DROP TABLE IF EXISTS `translated_content_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `left_content` text,
  `main_content` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active_translation` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_page_id` (`content_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_pages`
--

LOCK TABLES `translated_content_pages` WRITE;
/*!40000 ALTER TABLE `translated_content_pages` DISABLE KEYS */;
INSERT INTO `translated_content_pages` VALUES (1,1,1,'Home','<h3>This is Left Content in a Home</h3>','<h1>Main Content for Home ROCKS!</h1>','keywords for Home','description for Home','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(2,2,1,'Who We Are','<h3>This is Left Content in a Who We Are</h3>','<h1>Main Content for Who We Are ROCKS!</h1>','keywords for Who We Are','description for Who We Are','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(3,3,1,'Working Groups','<h3>This is Left Content in a Working Groups</h3>','<h1>Main Content for Working Groups ROCKS!</h1>','keywords for Working Groups','description for Working Groups','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(4,4,1,'Working Group A','<h3>This is Left Content in a Working Group A</h3>','<h1>Main Content for Working Group A ROCKS!</h1>','keywords for Working Group A','description for Working Group A','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(5,5,1,'Working Group B','<h3>This is Left Content in a Working Group B</h3>','<h1>Main Content for Working Group B ROCKS!</h1>','keywords for Working Group B','description for Working Group B','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(6,6,1,'Working Group C','<h3>This is Left Content in a Working Group C</h3>','<h1>Main Content for Working Group C ROCKS!</h1>','keywords for Working Group C','description for Working Group C','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(7,7,1,'Working Group D','<h3>This is Left Content in a Working Group D</h3>','<h1>Main Content for Working Group D ROCKS!</h1>','keywords for Working Group D','description for Working Group D','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(8,8,1,'Working Group E','<h3>This is Left Content in a Working Group E</h3>','<h1>Main Content for Working Group E ROCKS!</h1>','keywords for Working Group E','description for Working Group E','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(9,9,1,'Contact Us','<h3>This is Left Content in a Contact Us</h3>','<h1>Main Content for Contact Us ROCKS!</h1>','keywords for Contact Us','description for Contact Us','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(10,10,1,'Screencasts','<h3>This is Left Content in a Screencasts</h3>','<h1>Main Content for Screencasts ROCKS!</h1>','keywords for Screencasts','description for Screencasts','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(11,11,1,'Press Releases','<h3>This is Left Content in a Press Releases</h3>','<h1>Main Content for Press Releases ROCKS!</h1>','keywords for Press Releases','description for Press Releases','2014-02-20 10:44:00','2014-02-20 10:44:00',1),(12,12,1,'Terms of Use','<h3>This is Left Content in a Terms of Use</h3>','<h1>Main Content for Terms of Use ROCKS!</h1>','keywords for Terms of Use','description for Terms of Use','2014-02-20 10:44:01','2014-02-20 10:44:01',1),(13,13,1,'Curator central','','<h1>Main Content for Curator central ROCKS!</h1>','keywords for Curator central','description for Curator central','2014-02-20 10:45:27','2014-02-20 10:45:27',1);
/*!40000 ALTER TABLE `translated_content_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_partner_statuses`
--

DROP TABLE IF EXISTS `translated_content_partner_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_partner_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_status_id` tinyint(3) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_status_id` (`content_partner_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_partner_statuses`
--

LOCK TABLES `translated_content_partner_statuses` WRITE;
/*!40000 ALTER TABLE `translated_content_partner_statuses` DISABLE KEYS */;
INSERT INTO `translated_content_partner_statuses` VALUES (1,1,1,'Active',NULL),(2,2,1,'Inactive',NULL),(3,3,1,'Archived',NULL),(4,4,1,'Pending',NULL);
/*!40000 ALTER TABLE `translated_content_partner_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_content_tables`
--

DROP TABLE IF EXISTS `translated_content_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_content_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_table_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_content_tables`
--

LOCK TABLES `translated_content_tables` WRITE;
/*!40000 ALTER TABLE `translated_content_tables` DISABLE KEYS */;
INSERT INTO `translated_content_tables` VALUES (1,1,1,'Details',''),(2,2,1,'Details','');
/*!40000 ALTER TABLE `translated_content_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_data_types`
--

DROP TABLE IF EXISTS `translated_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_data_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_type_id` (`data_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_data_types`
--

LOCK TABLES `translated_data_types` WRITE;
/*!40000 ALTER TABLE `translated_data_types` DISABLE KEYS */;
INSERT INTO `translated_data_types` VALUES (1,1,1,'Text',NULL),(2,2,1,'Image',NULL),(3,3,1,'Sound',NULL),(4,4,1,'Video',NULL),(5,5,1,'GBIF Image',NULL),(6,6,1,'YouTube',NULL),(7,7,1,'Flash',NULL),(8,8,1,'IUCN',NULL),(9,9,1,'Map',NULL),(10,10,1,'Link',NULL);
/*!40000 ALTER TABLE `translated_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_info_items`
--

DROP TABLE IF EXISTS `translated_info_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_info_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_item_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `info_item_id` (`info_item_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_info_items`
--

LOCK TABLES `translated_info_items` WRITE;
/*!40000 ALTER TABLE `translated_info_items` DISABLE KEYS */;
INSERT INTO `translated_info_items` VALUES (1,1,1,'TaxonBiology',NULL),(2,2,1,'GeneralDescription',NULL),(3,3,1,'Distribution',NULL),(4,4,1,'Habitat',NULL),(5,5,1,'Morphology',NULL),(6,6,1,'Conservation',NULL),(7,7,1,'Uses',NULL),(8,8,1,'Education',NULL),(9,9,1,'Education Resources',NULL),(10,10,1,'IdentificationResources',NULL),(11,11,1,'Wikipedia',NULL),(12,12,1,'Associations',NULL),(13,13,1,'Behaviour',NULL),(14,14,1,'ConservationStatus',NULL),(15,15,1,'Cyclicity',NULL),(16,16,1,'Cytology',NULL),(17,17,1,'DiagnosticDescription',NULL),(18,18,1,'Diseases',NULL),(19,19,1,'Dispersal',NULL),(20,20,1,'Evolution',NULL),(21,21,1,'Genetics',NULL),(22,22,1,'Growth',NULL),(23,23,1,'Legislation',NULL),(24,24,1,'LifeCycle',NULL),(25,25,1,'LifeExpectancy',NULL),(26,26,1,'LookAlikes',NULL),(27,27,1,'Management',NULL),(28,28,1,'Migration',NULL),(29,29,1,'MolecularBiology',NULL),(30,30,1,'Physiology',NULL),(31,31,1,'PopulationBiology',NULL),(32,32,1,'Procedures',NULL),(33,33,1,'Reproduction',NULL),(34,34,1,'RiskStatement',NULL),(35,35,1,'Size',NULL),(36,36,1,'Threats',NULL),(37,37,1,'Trends',NULL),(38,38,1,'TrophicStrategy',NULL);
/*!40000 ALTER TABLE `translated_info_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_known_uris`
--

DROP TABLE IF EXISTS `translated_known_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_known_uris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `known_uri_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `definition` text,
  `comment` text,
  `attribution` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `by_language` (`known_uri_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_known_uris`
--

LOCK TABLES `translated_known_uris` WRITE;
/*!40000 ALTER TABLE `translated_known_uris` DISABLE KEYS */;
INSERT INTO `translated_known_uris` VALUES (1,1,1,'Unit of Measure',NULL,NULL,NULL),(2,2,1,'milligrams',NULL,NULL,NULL),(3,3,1,'grams',NULL,NULL,NULL),(4,4,1,'kilograms',NULL,NULL,NULL),(5,5,1,'millimeters',NULL,NULL,NULL),(6,6,1,'centimeters',NULL,NULL,NULL),(7,7,1,'meters',NULL,NULL,NULL),(8,8,1,'kelvin',NULL,NULL,NULL),(9,9,1,'degrees Celsius',NULL,NULL,NULL),(10,10,1,'days',NULL,NULL,NULL),(11,11,1,'years',NULL,NULL,NULL),(12,12,1,'0.1°C',NULL,NULL,NULL),(13,13,1,'Log10 grams',NULL,NULL,NULL),(14,14,1,'Sex',NULL,NULL,NULL),(15,15,1,'male',NULL,NULL,NULL),(16,16,1,'female',NULL,NULL,NULL),(17,17,1,'Source',NULL,NULL,NULL),(18,18,1,'License',NULL,NULL,NULL),(19,19,1,'Reference',NULL,NULL,NULL);
/*!40000 ALTER TABLE `translated_known_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_languages`
--

DROP TABLE IF EXISTS `translated_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_language_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `original_language_id` (`original_language_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_languages`
--

LOCK TABLES `translated_languages` WRITE;
/*!40000 ALTER TABLE `translated_languages` DISABLE KEYS */;
INSERT INTO `translated_languages` VALUES (1,1,1,'English',NULL),(2,2,1,'French',NULL),(3,3,1,'Spanish',NULL),(4,4,1,'Arabic',NULL),(5,5,1,'Scientific Name',NULL),(6,6,1,'Unknown',NULL),(7,7,1,'German',NULL);
/*!40000 ALTER TABLE `translated_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_licenses`
--

DROP TABLE IF EXISTS `translated_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `description` varchar(400) NOT NULL,
  `phonetic_description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_id` (`license_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_licenses`
--

LOCK TABLES `translated_licenses` WRITE;
/*!40000 ALTER TABLE `translated_licenses` DISABLE KEYS */;
INSERT INTO `translated_licenses` VALUES (1,1,1,'No rights reserved',NULL),(2,2,1,'&#169; All rights reserved',NULL),(3,3,1,'Some rights reserved',NULL),(4,4,1,'Some rights reserved',NULL),(5,5,1,'Some rights reserved',NULL),(6,6,1,'Some rights reserved',NULL),(7,7,1,'Public Domain',NULL),(8,8,1,'No known copyright restrictions',NULL),(9,9,1,'License not applicable',NULL);
/*!40000 ALTER TABLE `translated_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_link_types`
--

DROP TABLE IF EXISTS `translated_link_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_link_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `phonetic_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_type_id` (`link_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_link_types`
--

LOCK TABLES `translated_link_types` WRITE;
/*!40000 ALTER TABLE `translated_link_types` DISABLE KEYS */;
INSERT INTO `translated_link_types` VALUES (1,1,1,'Blog',NULL),(2,2,1,'News',NULL),(3,3,1,'Organization',NULL),(4,4,1,'Paper',NULL),(5,5,1,'Multimedia',NULL),(6,6,1,'Citizen Science',NULL);
/*!40000 ALTER TABLE `translated_link_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_mime_types`
--

DROP TABLE IF EXISTS `translated_mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_mime_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mime_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mime_type_id` (`mime_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_mime_types`
--

LOCK TABLES `translated_mime_types` WRITE;
/*!40000 ALTER TABLE `translated_mime_types` DISABLE KEYS */;
INSERT INTO `translated_mime_types` VALUES (1,1,1,'image/jpeg',NULL),(2,2,1,'audio/mpeg',NULL),(3,3,1,'text/html',NULL),(4,4,1,'text/plain',NULL),(5,5,1,'video/x-flv',NULL),(6,6,1,'video/quicktime',NULL),(7,7,1,'audio/x-wav',NULL),(8,8,1,'video/mp4',NULL),(9,9,1,'video/mpeg',NULL),(10,10,1,'audio/x-ms-wma',NULL),(11,11,1,'audio/x-pn-realaudio',NULL),(12,12,1,'audio/x-realaudio',NULL),(13,13,1,'image/bmp',NULL),(14,14,1,'image/gif',NULL),(15,15,1,'image/png',NULL),(16,16,1,'image/svg+xml',NULL),(17,17,1,'image/tiff',NULL),(18,18,1,'text/richtext',NULL),(19,19,1,'text/rtf',NULL),(20,20,1,'text/xml',NULL),(21,21,1,'video/x-ms-wmv',NULL);
/*!40000 ALTER TABLE `translated_mime_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_news_items`
--

DROP TABLE IF EXISTS `translated_news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_item_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `body` text NOT NULL,
  `title` varchar(255) DEFAULT '',
  `active_translation` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_item_id` (`news_item_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_news_items`
--

LOCK TABLES `translated_news_items` WRITE;
/*!40000 ALTER TABLE `translated_news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `translated_news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_permissions`
--

DROP TABLE IF EXISTS `translated_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_translated_permissions_on_permission_id_and_language_id` (`permission_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_permissions`
--

LOCK TABLES `translated_permissions` WRITE;
/*!40000 ALTER TABLE `translated_permissions` DISABLE KEYS */;
INSERT INTO `translated_permissions` VALUES (1,'edit permissions',1,1),(2,'beta test',1,2),(3,'see data',1,3),(4,'edit cms',1,4);
/*!40000 ALTER TABLE `translated_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_ranks`
--

DROP TABLE IF EXISTS `translated_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank_id` (`rank_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_ranks`
--

LOCK TABLES `translated_ranks` WRITE;
/*!40000 ALTER TABLE `translated_ranks` DISABLE KEYS */;
INSERT INTO `translated_ranks` VALUES (1,1,1,'kingdom',NULL),(2,2,1,'phylum',NULL),(3,3,1,'order',NULL),(4,4,1,'class',NULL),(5,5,1,'family',NULL),(6,6,1,'genus',NULL),(7,7,1,'species',NULL),(8,8,1,'subspecies',NULL),(9,9,1,'infraspecies',NULL),(10,10,1,'variety',NULL),(11,11,1,'form',NULL),(12,20,1,'superkingdom',NULL);
/*!40000 ALTER TABLE `translated_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_resource_statuses`
--

DROP TABLE IF EXISTS `translated_resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_status_id` int(11) NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_status_id` (`resource_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_resource_statuses`
--

LOCK TABLES `translated_resource_statuses` WRITE;
/*!40000 ALTER TABLE `translated_resource_statuses` DISABLE KEYS */;
INSERT INTO `translated_resource_statuses` VALUES (1,1,1,'Uploading',NULL),(2,2,1,'Uploaded',NULL),(3,3,1,'Upload Failed',NULL),(4,4,1,'Moved to Content Server',NULL),(5,5,1,'Validated',NULL),(6,6,1,'Validation Failed',NULL),(7,7,1,'Being Processed',NULL),(8,8,1,'Processed',NULL),(9,9,1,'Processing Failed',NULL),(10,10,1,'Force Harvest',NULL),(11,11,1,'Published',NULL);
/*!40000 ALTER TABLE `translated_resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_service_types`
--

DROP TABLE IF EXISTS `translated_service_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_service_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_type_id` (`service_type_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_service_types`
--

LOCK TABLES `translated_service_types` WRITE;
/*!40000 ALTER TABLE `translated_service_types` DISABLE KEYS */;
INSERT INTO `translated_service_types` VALUES (1,1,1,'EOL Transfer Schema',NULL);
/*!40000 ALTER TABLE `translated_service_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_sort_styles`
--

DROP TABLE IF EXISTS `translated_sort_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_sort_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `sort_style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_sort_styles`
--

LOCK TABLES `translated_sort_styles` WRITE;
/*!40000 ALTER TABLE `translated_sort_styles` DISABLE KEYS */;
INSERT INTO `translated_sort_styles` VALUES (1,'Recently Added',1,1),(2,'Oldest',1,2),(3,'Alphabetical',1,3),(4,'Reverse Alphabetical',1,4),(5,'Richness',1,5),(6,'Rating',1,6),(7,'Sort Field',1,7),(8,'Reverse Sort Field',1,8);
/*!40000 ALTER TABLE `translated_sort_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_statuses`
--

DROP TABLE IF EXISTS `translated_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_id` (`status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_statuses`
--

LOCK TABLES `translated_statuses` WRITE;
/*!40000 ALTER TABLE `translated_statuses` DISABLE KEYS */;
INSERT INTO `translated_statuses` VALUES (1,1,1,'Inserted',NULL),(2,2,1,'Unchanged',NULL),(3,3,1,'Updated',NULL);
/*!40000 ALTER TABLE `translated_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_synonym_relations`
--

DROP TABLE IF EXISTS `translated_synonym_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_synonym_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `synonym_relation_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `synonym_relation_id` (`synonym_relation_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_synonym_relations`
--

LOCK TABLES `translated_synonym_relations` WRITE;
/*!40000 ALTER TABLE `translated_synonym_relations` DISABLE KEYS */;
INSERT INTO `translated_synonym_relations` VALUES (1,1,1,'synonym',NULL),(2,2,1,'common name',NULL),(3,3,1,'genbank common name',NULL),(4,4,1,'acronym',NULL),(5,5,1,'anamorph',NULL),(6,6,1,'blast name',NULL),(7,7,1,'equivalent name',NULL),(8,8,1,'genbank acronym',NULL),(9,9,1,'genbank anamorph',NULL),(10,10,1,'genbank synonym',NULL),(11,11,1,'in-part',NULL),(12,12,1,'includes',NULL),(13,13,1,'misnomer',NULL),(14,14,1,'misspelling',NULL),(15,15,1,'teleomorph',NULL),(16,16,1,'ambiguous synonym',NULL),(17,17,1,'misapplied name',NULL),(18,18,1,'provisionally accepted name',NULL),(19,19,1,'accepted name',NULL),(20,20,1,'database artifact',NULL),(21,21,1,'other, see comments',NULL),(22,22,1,'orthographic variant (misspelling)',NULL),(23,23,1,'misapplied',NULL),(24,24,1,'rejected name',NULL),(25,25,1,'homonym (illegitimate)',NULL),(26,26,1,'pro parte',NULL),(27,27,1,'superfluous renaming (illegitimate)',NULL),(28,28,1,'nomen oblitum',NULL),(29,29,1,'junior synonym',NULL),(30,30,1,'unavailable, database artifact',NULL),(31,31,1,'unnecessary replacement',NULL),(32,32,1,'subsequent name/combination',NULL),(33,33,1,'unavailable, literature misspelling',NULL),(34,34,1,'original name/combination',NULL),(35,35,1,'unavailable, incorrect orig. spelling',NULL),(36,36,1,'junior homonym',NULL),(37,37,1,'homonym & junior synonym',NULL),(38,38,1,'unavailable, suppressed by ruling',NULL),(39,39,1,'unjustified emendation',NULL),(40,40,1,'unavailable, other',NULL),(41,41,1,'unavailable, nomen nudum',NULL),(42,42,1,'nomen dubium',NULL),(43,43,1,'invalidly published, other',NULL),(44,44,1,'invalidly published, nomen nudum',NULL),(45,45,1,'basionym',NULL),(46,46,1,'heterotypic synonym',NULL),(47,47,1,'homotypic synonym',NULL),(48,48,1,'unavailable name',NULL),(49,49,1,'valid name',NULL);
/*!40000 ALTER TABLE `translated_synonym_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_table_of_contents`
--

DROP TABLE IF EXISTS `translated_table_of_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_table_of_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_of_contents_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_of_contents_id` (`table_of_contents_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_table_of_contents`
--

LOCK TABLES `translated_table_of_contents` WRITE;
/*!40000 ALTER TABLE `translated_table_of_contents` DISABLE KEYS */;
INSERT INTO `translated_table_of_contents` VALUES (1,1,1,'Overview',NULL),(2,2,1,'Brief Summary',NULL),(3,3,1,'Brief Description',NULL),(4,4,1,'Comprehensive Description',NULL),(5,5,1,'Description',NULL),(6,6,1,'Nucleotide Sequences',NULL),(7,7,1,'Ecology and Distribution',NULL),(8,8,1,'Distribution',NULL),(9,9,1,'Wikipedia',NULL),(10,10,1,'Identification Resources',NULL),(11,11,1,'Names and Taxonomy',NULL),(12,12,1,'Related Names',NULL),(13,13,1,'Synonyms',NULL),(14,14,1,'Common Names',NULL),(15,15,1,'Page Statistics',NULL),(16,16,1,'Content Summary',NULL),(17,17,1,'Biodiversity Heritage Library',NULL),(18,18,1,'References and More Information',NULL),(19,19,1,'Citizen Science',NULL),(20,20,1,'Citizen Science Links',NULL),(21,21,1,'Literature References',NULL),(22,22,1,'Content Partners',NULL),(23,23,1,'Biomedical Terms',NULL),(24,24,1,'Search the Web',NULL),(25,25,1,'Education',NULL),(26,26,1,'Education Links',NULL),(27,27,1,'Education Resources',NULL),(28,28,1,'Physical Description',NULL),(29,29,1,'Ecology',NULL),(30,30,1,'Life History and Behavior',NULL),(31,31,1,'Evolution and Systematics',NULL),(32,32,1,'Physiology and Cell Biology',NULL),(33,33,1,'Molecular Biology and Genetics',NULL),(34,34,1,'Conservation',NULL),(35,35,1,'Relevance to Humans and Ecosystems',NULL),(36,36,1,'Notes',NULL),(37,37,1,'Database and Repository Coverage',NULL),(38,38,1,'Relevance',NULL),(39,39,1,'Diagnosis of genus and species',NULL),(40,40,1,'Formal Description',NULL),(41,41,1,'Phenology',NULL),(42,42,1,'Life History',NULL),(43,43,1,'Geographical Distribution',NULL),(44,44,1,'Etymology',NULL),(45,45,1,'Adult Characteristics',NULL),(46,46,1,'Comparison with Similar Species',NULL),(47,47,1,'Host, Oviposition, and Larval Feeding Habits',NULL),(48,48,1,'Type',NULL),(49,49,1,'Characteristics',NULL),(50,50,1,'General Description',NULL),(51,51,1,'Reproductive Behavior',NULL),(52,52,1,'Harmful Blooms',NULL),(53,53,1,'Relation to Humans',NULL),(54,54,1,'Toxicity, Symptoms and Treatment',NULL),(55,55,1,'Cultivation',NULL),(56,56,1,'Culture',NULL),(57,57,1,'Ethnobotany',NULL),(58,58,1,'Suppliers',NULL);
/*!40000 ALTER TABLE `translated_table_of_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_untrust_reasons`
--

DROP TABLE IF EXISTS `translated_untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_untrust_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `untrust_reason_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `untrust_reason_id` (`untrust_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_untrust_reasons`
--

LOCK TABLES `translated_untrust_reasons` WRITE;
/*!40000 ALTER TABLE `translated_untrust_reasons` DISABLE KEYS */;
INSERT INTO `translated_untrust_reasons` VALUES (1,1,1,'misidentified',NULL),(2,2,1,'incorrect/misleading',NULL),(3,3,1,'low quality',NULL),(4,4,1,'duplicate',NULL);
/*!40000 ALTER TABLE `translated_untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_uri_types`
--

DROP TABLE IF EXISTS `translated_uri_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_uri_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `uri_type_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_uri_types`
--

LOCK TABLES `translated_uri_types` WRITE;
/*!40000 ALTER TABLE `translated_uri_types` DISABLE KEYS */;
INSERT INTO `translated_uri_types` VALUES (1,'measurement',1,1),(2,'association',2,1),(3,'value',3,1),(4,'metadata',4,1),(5,'Unit of Measure',5,1);
/*!40000 ALTER TABLE `translated_uri_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_user_identities`
--

DROP TABLE IF EXISTS `translated_user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_user_identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_identity_id` smallint(5) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_identity_id` (`user_identity_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_user_identities`
--

LOCK TABLES `translated_user_identities` WRITE;
/*!40000 ALTER TABLE `translated_user_identities` DISABLE KEYS */;
INSERT INTO `translated_user_identities` VALUES (1,1,1,'an enthusiast'),(2,2,1,'a student'),(3,3,1,'an educator'),(4,4,1,'a citizen scientist'),(5,5,1,'a professional scientist');
/*!40000 ALTER TABLE `translated_user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_vetted`
--

DROP TABLE IF EXISTS `translated_vetted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_vetted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vetted_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vetted_id` (`vetted_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_vetted`
--

LOCK TABLES `translated_vetted` WRITE;
/*!40000 ALTER TABLE `translated_vetted` DISABLE KEYS */;
INSERT INTO `translated_vetted` VALUES (1,1,1,'Trusted',NULL),(2,2,1,'Unknown',NULL),(3,3,1,'Untrusted',NULL),(4,4,1,'Inappropriate',NULL);
/*!40000 ALTER TABLE `translated_vetted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_view_styles`
--

DROP TABLE IF EXISTS `translated_view_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_view_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `view_style_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_view_styles`
--

LOCK TABLES `translated_view_styles` WRITE;
/*!40000 ALTER TABLE `translated_view_styles` DISABLE KEYS */;
INSERT INTO `translated_view_styles` VALUES (1,'List',1,1),(2,'Gallery',1,2),(3,'Annotated',1,3);
/*!40000 ALTER TABLE `translated_view_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translated_visibilities`
--

DROP TABLE IF EXISTS `translated_visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translated_visibilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visibility_id` int(10) unsigned NOT NULL,
  `language_id` smallint(5) unsigned NOT NULL,
  `label` varchar(300) NOT NULL,
  `phonetic_label` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visibility_id` (`visibility_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translated_visibilities`
--

LOCK TABLES `translated_visibilities` WRITE;
/*!40000 ALTER TABLE `translated_visibilities` DISABLE KEYS */;
INSERT INTO `translated_visibilities` VALUES (1,1,1,'Invisible',NULL),(2,2,1,'Visible',NULL),(3,3,1,'Preview',NULL);
/*!40000 ALTER TABLE `translated_visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_visitors`
--

DROP TABLE IF EXISTS `unique_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_visitors`
--

LOCK TABLES `unique_visitors` WRITE;
/*!40000 ALTER TABLE `unique_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `unique_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `untrust_reasons`
--

DROP TABLE IF EXISTS `untrust_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `untrust_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `class_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `untrust_reasons`
--

LOCK TABLES `untrust_reasons` WRITE;
/*!40000 ALTER TABLE `untrust_reasons` DISABLE KEYS */;
INSERT INTO `untrust_reasons` VALUES (1,'2014-02-20 10:43:56','2014-02-20 10:44:16','misidentified'),(2,'2014-02-20 10:43:56','2014-02-20 10:44:16','incorrect'),(3,'2014-02-20 10:43:56','2014-02-20 10:44:16','poor'),(4,'2014-02-20 10:43:56','2014-02-20 10:44:16','duplicate');
/*!40000 ALTER TABLE `untrust_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uri_types`
--

DROP TABLE IF EXISTS `uri_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uri_types`
--

LOCK TABLES `uri_types` WRITE;
/*!40000 ALTER TABLE `uri_types` DISABLE KEYS */;
INSERT INTO `uri_types` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `uri_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_added_data`
--

DROP TABLE IF EXISTS `user_added_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_added_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject_type` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `predicate` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `vetted_id` int(11) DEFAULT '1',
  `visibility_id` int(11) DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_added_data`
--

LOCK TABLES `user_added_data` WRITE;
/*!40000 ALTER TABLE `user_added_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_added_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_added_data_metadata`
--

DROP TABLE IF EXISTS `user_added_data_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_added_data_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_added_data_id` int(11) NOT NULL,
  `predicate` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_added_data_id` (`user_added_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_added_data_metadata`
--

LOCK TABLES `user_added_data_metadata` WRITE;
/*!40000 ALTER TABLE `user_added_data_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_added_data_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_identities`
--

DROP TABLE IF EXISTS `user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_identities` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sort_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_identities`
--

LOCK TABLES `user_identities` WRITE;
/*!40000 ALTER TABLE `user_identities` DISABLE KEYS */;
INSERT INTO `user_identities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areas_of_interest` varchar(255) DEFAULT NULL,
  `heard_of_eol` varchar(128) DEFAULT NULL,
  `interested_in_contributing` tinyint(1) DEFAULT NULL,
  `interested_in_curating` tinyint(1) DEFAULT NULL,
  `interested_in_advisory_forum` tinyint(1) DEFAULT NULL,
  `show_information` tinyint(1) DEFAULT NULL,
  `age_range` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_primary_role_id` int(11) DEFAULT NULL,
  `interested_in_development` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_primary_roles`
--

DROP TABLE IF EXISTS `user_primary_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_primary_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_primary_roles`
--

LOCK TABLES `user_primary_roles` WRITE;
/*!40000 ALTER TABLE `user_primary_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_primary_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remote_ip` varchar(24) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `hashed_password` varchar(32) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `notes` text,
  `curator_approved` tinyint(1) NOT NULL DEFAULT '0',
  `curator_verdict_by_id` int(11) DEFAULT NULL,
  `curator_verdict_at` datetime DEFAULT NULL,
  `credentials` text NOT NULL,
  `validation_code` varchar(255) DEFAULT '',
  `failed_login_attempts` int(11) DEFAULT '0',
  `curator_scope` text NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `recover_account_token` char(40) DEFAULT NULL,
  `recover_account_token_expires_at` datetime DEFAULT NULL,
  `agent_id` int(10) unsigned DEFAULT NULL,
  `email_reports_frequency_hours` int(11) DEFAULT '24',
  `last_report_email` datetime DEFAULT NULL,
  `api_key` char(40) DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `logo_cache_url` bigint(20) unsigned DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(10) unsigned DEFAULT '0',
  `tag_line` varchar(255) DEFAULT NULL,
  `agreed_with_terms` tinyint(1) DEFAULT NULL,
  `bio` text,
  `curator_level_id` int(11) DEFAULT NULL,
  `requested_curator_level_id` int(11) DEFAULT NULL,
  `requested_curator_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT '0',
  `last_notification_at` datetime DEFAULT '2014-02-13 09:53:07',
  `last_message_at` datetime DEFAULT '2014-02-13 09:53:07',
  `disable_email_notifications` tinyint(1) DEFAULT '0',
  `news_in_preferred_language` tinyint(1) DEFAULT '0',
  `number_of_forum_posts` int(11) DEFAULT NULL,
  `user_origin_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_agent_id` (`agent_id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `index_users_on_created_at` (`created_at`),
  KEY `index_users_on_api_key` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'123.45.67.19','bob1@smith.com','IUCN','Reinger',NULL,'i_reinger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:04','2014-02-20 10:44:04',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,1,24,NULL,NULL,NULL,201210030069362,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(2,'123.45.67.13','bob2@smith.com','Janie','Jacobs',NULL,'j_jacobs','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:04','2014-02-20 10:44:04',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,2,24,NULL,NULL,NULL,201204220191542,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(3,'123.45.67.16','bob3@smith.com','Helmer','Crona',NULL,'h_crona','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:05','2014-02-20 10:44:05',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,4,24,NULL,NULL,NULL,318700,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(4,'123.45.67.14','bob4@smith.com','Ahmad','Murphy',NULL,'we_loaded_foundation','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:21','2014-02-20 10:44:21',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,9,24,NULL,NULL,NULL,201202040069888,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(5,'123.45.67.16','bob5@smith.com','Roxane','Connelly',NULL,'r_connelly','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:31','2014-02-20 10:44:31',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,10,24,NULL,NULL,NULL,201111020692069,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(6,'123.45.67.14','bob6@smith.com','Mariana','Runolfsson',NULL,'m_runolfsson','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:33','2014-02-20 10:44:33',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,12,24,NULL,NULL,NULL,201207302359794,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(7,'123.45.67.11','bob7@smith.com','Joshuah','Ernser',NULL,'j_ernser','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:33','2014-02-20 10:44:34',NULL,1,6,'2014-02-18 10:44:33','Curator','',0,'scope',NULL,NULL,NULL,NULL,13,24,NULL,NULL,NULL,201301170225666,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(8,'123.45.67.14','bob8@smith.com','Antonia','Nolan',NULL,'a_nolan','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:40','2014-02-20 10:44:40',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,14,24,NULL,NULL,NULL,201202110214753,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(9,'123.45.67.17','bob9@smith.com','Eugene','Mosciski',NULL,'e_mosciski','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:40','2014-02-20 10:44:40',NULL,1,8,'2014-02-18 10:44:40','Curator','',0,'scope',NULL,NULL,NULL,NULL,15,24,NULL,NULL,NULL,201201080155483,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(10,'123.45.67.17','bob10@smith.com','Kaitlin','Larkin',NULL,'k_larkin','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:44','2014-02-20 10:44:44',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,16,24,NULL,NULL,NULL,201111021252396,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(11,'123.45.67.10','bob11@smith.com','Otho','Willms',NULL,'o_willms','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:44','2014-02-20 10:44:45',NULL,1,10,'2014-02-18 10:44:44','Curator','',0,'scope',NULL,NULL,NULL,NULL,17,24,NULL,NULL,NULL,201112090080634,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(12,'123.45.67.11','bob12@smith.com','Camila','Deckow',NULL,'c_deckow','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:49','2014-02-20 10:44:49',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,18,24,NULL,NULL,NULL,201111021244952,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(13,'123.45.67.18','bob13@smith.com','Colt','Stracke',NULL,'c_stracke','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:49','2014-02-20 10:44:49',NULL,1,12,'2014-02-18 10:44:49','Curator','',0,'scope',NULL,NULL,NULL,NULL,19,24,NULL,NULL,NULL,201204250072439,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(14,'123.45.67.14','bob14@smith.com','Mathew','Deckow',NULL,'m_deckow','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:53','2014-02-20 10:44:53',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,20,24,NULL,NULL,NULL,201111021075853,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(15,'123.45.67.10','bob15@smith.com','Electa','Na',NULL,'e_na','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:53','2014-02-20 10:44:53',NULL,1,14,'2014-02-18 10:44:53','Curator','',0,'scope',NULL,NULL,NULL,NULL,21,24,NULL,NULL,NULL,201111011563090,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(16,'123.45.67.12','bob16@smith.com','Damaris','Torphy',NULL,'d_torphy','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:57','2014-02-20 10:44:57',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,22,24,NULL,NULL,NULL,201202160129393,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(17,'123.45.67.16','bob17@smith.com','Aidan','Mills',NULL,'a_mills','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:44:57','2014-02-20 10:44:57',NULL,1,16,'2014-02-18 10:44:57','Curator','',0,'scope',NULL,NULL,NULL,NULL,23,24,NULL,NULL,NULL,201206220152592,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(18,'123.45.67.13','bob17@smith.com','Dora','Pollich',NULL,'d_pollich','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:02','2014-02-20 10:45:02',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,24,24,NULL,NULL,NULL,201112270143930,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(19,'123.45.67.17','bob18@smith.com','Emmanuelle','Beatty',NULL,'e_beatty','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:03','2014-02-20 10:45:03',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,25,24,NULL,NULL,NULL,201111012383579,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(20,'123.45.67.16','bob19@smith.com','Sam','Hettinger',NULL,'s_hettinger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:04','2014-02-20 10:45:04',NULL,1,19,'2014-02-18 10:45:03','Curator','',0,'scope',NULL,NULL,NULL,NULL,26,24,NULL,NULL,NULL,201207260783649,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(21,'123.45.67.18','bob20@smith.com','Betty','Okuneva',NULL,'b_okuneva','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:04','2014-02-20 10:45:04',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,27,24,NULL,NULL,NULL,201111012169032,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(22,'123.45.67.13','bob21@smith.com','Reuben','Olson',NULL,'r_olson','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL,1,21,'2014-02-18 10:45:05','Curator','',0,'scope',NULL,NULL,NULL,NULL,28,24,NULL,NULL,NULL,201111011158648,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(23,'123.45.67.16','bob22@smith.com','Ashley','West',NULL,'a_west','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,29,24,NULL,NULL,NULL,201111020612441,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(24,'123.45.67.14','bob23@smith.com','Vicente','Schowalter',NULL,'v_schowalter','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:05','2014-02-20 10:45:05',NULL,1,23,'2014-02-18 10:45:05','Curator','',0,'scope',NULL,NULL,NULL,NULL,30,24,NULL,NULL,NULL,201211270043984,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(25,'123.45.67.10','bob24@smith.com','Heber','Hill',NULL,'h_hill','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:06','2014-02-20 10:45:06',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,31,24,NULL,NULL,NULL,201111021029613,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(26,'123.45.67.16','bob25@smith.com','Maybell','Schneider',NULL,'m_schneider','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:06','2014-02-20 10:45:06',NULL,1,25,'2014-02-18 10:45:06','Curator','',0,'scope',NULL,NULL,NULL,NULL,32,24,NULL,NULL,NULL,201209022352216,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(27,'123.45.67.11','bob26@smith.com','Okey','McCullough',NULL,'o_mccullough','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:11','2014-02-20 10:45:11',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,33,24,NULL,NULL,NULL,201111011344479,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(28,'123.45.67.15','bob27@smith.com','Leonardo','Schamberger',NULL,'l_schamberge','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:11','2014-02-20 10:45:11',NULL,1,27,'2014-02-18 10:45:11','Curator','',0,'scope',NULL,NULL,NULL,NULL,34,24,NULL,NULL,NULL,201111011679845,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(29,'123.45.67.10','bob28@smith.com','Gerhard','Bode',NULL,'g_bode','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:13','2014-02-20 10:45:13',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,35,24,NULL,NULL,NULL,201111300968085,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(30,'123.45.67.16','bob29@smith.com','Cicero','Stehr',NULL,'curator_for_tc','5f4dcc3b5aa765d61d8327deb882cf99',1,1,'2014-02-20 10:45:13','2014-02-20 10:45:14',NULL,1,29,'2014-02-18 10:45:13','Curator','',0,'scope',NULL,NULL,NULL,NULL,36,24,NULL,NULL,NULL,201205100347094,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(31,'123.45.67.12','bob30@smith.com','Maritza','Kuhic',NULL,'m_kuhic','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:15','2014-02-20 10:45:15',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,37,24,NULL,NULL,NULL,201209112315713,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(32,'123.45.67.14','bob31@smith.com','Wyatt','Hansen',NULL,'w_hansen','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:16','2014-02-20 10:45:16',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,39,24,NULL,NULL,NULL,201203120007511,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(33,'123.45.67.18','bob32@smith.com','Ming','Spencer',NULL,'m_spencer','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:16','2014-02-20 10:45:16',NULL,1,32,'2014-02-18 10:45:16','Curator','',0,'scope',NULL,NULL,NULL,NULL,40,24,NULL,NULL,NULL,201207070051807,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(34,'123.45.67.18','bob33@smith.com','Ralph','Wiggum',NULL,'testcp','f5ec1938b346bf01dc3be259aa270dfa',1,1,'2014-02-20 10:45:20','2014-02-20 10:45:20',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,41,24,NULL,NULL,NULL,201211040848246,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(35,'123.45.67.16','bob34@smith.com','Benton','Corwin',NULL,'test_cp','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:20','2014-02-20 10:45:20',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,42,24,NULL,NULL,NULL,201203290044598,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(36,'123.45.67.17','bob35@smith.com','Rosalia','Toy',NULL,'r_toy','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:21','2014-02-20 10:45:21',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,45,24,NULL,NULL,NULL,201211280051661,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(37,'123.45.67.19','bob36@smith.com','Admin','User',NULL,'admin','21232f297a57a5a743894a0e4a801fc3',1,1,'2014-02-20 10:45:21','2014-02-20 10:45:22',NULL,1,36,'2014-02-18 10:45:21','Curator','',0,'scope',NULL,NULL,NULL,NULL,46,24,NULL,NULL,NULL,201111020821391,NULL,NULL,0,NULL,1,NULL,1,NULL,NULL,1,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(38,'123.45.67.17','bob37@smith.com','Christie','Ankunding',NULL,'c_ankunding','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:23','2014-02-20 10:45:23',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,47,24,NULL,NULL,NULL,201111012194996,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(39,'123.45.67.17','bob38@smith.com','Madelynn','Beatty',NULL,'m_beatty','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:23','2014-02-20 10:45:23',NULL,1,38,'2014-02-18 10:45:23','Curator','',0,'scope',NULL,NULL,NULL,NULL,48,24,NULL,NULL,NULL,201202260041221,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(40,'123.45.67.11','bob39@smith.com','Jeramie','Botsford',NULL,'j_botsford','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:27','2014-02-20 10:45:27',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,49,24,NULL,NULL,NULL,201207170007419,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(41,'123.45.67.16','bob40@smith.com','test','curator',NULL,'test_curator','5f4dcc3b5aa765d61d8327deb882cf99',1,1,'2014-02-20 10:45:27','2014-02-20 10:45:27',NULL,1,40,'2014-02-18 10:45:27','Curator','',0,'scope',NULL,NULL,NULL,NULL,50,24,NULL,NULL,NULL,201211040827144,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(42,'123.45.67.16','bob41@smith.com','Duane','Leuschke',NULL,'d_leuschke','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:29','2014-02-20 10:45:29',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,3,24,NULL,NULL,NULL,201201250295337,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(43,'123.45.67.11','bob42@smith.com','Herbert','Senger',NULL,'h_senger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:29','2014-02-20 10:45:29',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,53,24,NULL,NULL,NULL,201112300194339,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(44,'123.45.67.14','bob43@smith.com','Rolfe','Luettgen',NULL,'r_luettgen','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:30','2014-02-20 10:45:30',NULL,1,43,'2014-02-18 10:45:29','Curator','',0,'scope',NULL,NULL,NULL,NULL,54,24,NULL,NULL,NULL,201204200147552,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(45,'123.45.67.16','bob44@smith.com','Kali','Lubowitz',NULL,'k_lubowitz','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:34','2014-02-20 10:45:34',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,55,24,NULL,NULL,NULL,201206210040082,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(46,'123.45.67.13','bob45@smith.com','Jacky','Welch',NULL,'j_welch','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:34','2014-02-20 10:45:34',NULL,1,45,'2014-02-18 10:45:34','Curator','',0,'scope',NULL,NULL,NULL,NULL,56,24,NULL,NULL,NULL,201111012185408,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(47,'123.45.67.15','bob46@smith.com','Marilie','Harvey',NULL,'m_harvey','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:38','2014-02-20 10:45:38',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,57,24,NULL,NULL,NULL,201301040017859,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(48,'123.45.67.16','bob47@smith.com','Jon','Schultz',NULL,'j_schultz','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:39','2014-02-20 10:45:39',NULL,1,47,'2014-02-18 10:45:38','Curator','',0,'scope',NULL,NULL,NULL,NULL,58,24,NULL,NULL,NULL,201111011984102,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(49,'123.45.67.16','bob48@smith.com','Rachel','Keebler',NULL,'r_keebler','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:43','2014-02-20 10:45:43',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,59,24,NULL,NULL,NULL,201111021286828,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(50,'123.45.67.17','bob49@smith.com','Scot','Hudson',NULL,'s_hudson','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:43','2014-02-20 10:45:43',NULL,1,49,'2014-02-18 10:45:43','Curator','',0,'scope',NULL,NULL,NULL,NULL,60,24,NULL,NULL,NULL,201201250380510,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(51,'123.45.67.18','bob50@smith.com','Rhea','Leffler',NULL,'r_leffler','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:47','2014-02-20 10:45:47',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,61,24,NULL,NULL,NULL,201209252381279,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(52,'123.45.67.16','bob51@smith.com','Greta','Gleason',NULL,'g_gleason','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:48','2014-02-20 10:45:48',NULL,1,51,'2014-02-18 10:45:48','Curator','',0,'scope',NULL,NULL,NULL,NULL,62,24,NULL,NULL,NULL,201205310077602,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(53,'123.45.67.16','bob52@smith.com','Dameon','Schmidt',NULL,'d_schmidt','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:51','2014-02-20 10:45:51',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,63,24,NULL,NULL,NULL,201111012233905,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(54,'123.45.67.10','bob53@smith.com','Rasheed','Skiles',NULL,'r_skiles','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:51','2014-02-20 10:45:51',NULL,1,53,'2014-02-18 10:45:51','Curator','',0,'scope',NULL,NULL,NULL,NULL,64,24,NULL,NULL,NULL,201111011892631,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(55,'123.45.67.14','bob54@smith.com','Bertrand','Gleason',NULL,'b_gleason','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:55','2014-02-20 10:45:55',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,65,24,NULL,NULL,NULL,201203290090064,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(56,'123.45.67.17','bob55@smith.com','Seao','Cummerata',NULL,'s_cummerata','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:55','2014-02-20 10:45:56',NULL,1,55,'2014-02-18 10:45:55','Curator','',0,'scope',NULL,NULL,NULL,NULL,66,24,NULL,NULL,NULL,201209172384084,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(57,'123.45.67.17','bob56@smith.com','Janif','Stamm',NULL,'j_stamm','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:59','2014-02-20 10:45:59',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,67,24,NULL,NULL,NULL,201204150016376,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(58,'123.45.67.16','bob57@smith.com','Helmes','Beier',NULL,'h_beier','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:45:59','2014-02-20 10:45:59',NULL,1,57,'2014-02-18 10:45:59','Curator','',0,'scope',NULL,NULL,NULL,NULL,68,24,NULL,NULL,NULL,201202260034012,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(59,'123.45.67.10','bob58@smith.com','Fionb','Dickens',NULL,'f_dickens','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:04','2014-02-20 10:46:04',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,69,24,NULL,NULL,NULL,201111012266993,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(60,'123.45.67.12','bob59@smith.com','Spences','Kulas',NULL,'s_kulas','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:04','2014-02-20 10:46:04',NULL,1,59,'2014-02-18 10:46:04','Curator','',0,'scope',NULL,NULL,NULL,NULL,70,24,NULL,NULL,NULL,201112220171145,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(61,'123.45.67.12','bob60@smith.com','Camreo','Franecki',NULL,'c_franecki','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:08','2014-02-20 10:46:08',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,71,24,NULL,NULL,NULL,201111011632931,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(62,'123.45.67.19','bob61@smith.com','Ahmae','Kuhic',NULL,'a_kuhic','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:08','2014-02-20 10:46:08',NULL,1,61,'2014-02-18 10:46:08','Curator','',0,'scope',NULL,NULL,NULL,NULL,72,24,NULL,NULL,NULL,201203270131349,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(63,'123.45.67.19','bob62@smith.com','Roxanf','Padberg',NULL,'r_padberg','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:13','2014-02-20 10:46:13',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,73,24,NULL,NULL,NULL,201111020255217,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(64,'123.45.67.11','bob63@smith.com','Marianb','Haley',NULL,'m_haley','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:13','2014-02-20 10:46:13',NULL,1,63,'2014-02-18 10:46:13','Curator','',0,'scope',NULL,NULL,NULL,NULL,74,24,NULL,NULL,NULL,201205050025674,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(65,'123.45.67.12','bob64@smith.com','Joshuai','Gorczany',NULL,'j_gorczany','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:16','2014-02-20 10:46:16',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,75,24,NULL,NULL,NULL,201111020299829,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(66,'123.45.67.13','bob65@smith.com','Antonib','Hoeger',NULL,'a_hoeger','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:16','2014-02-20 10:46:16',NULL,1,65,'2014-02-18 10:46:16','Curator','',0,'scope',NULL,NULL,NULL,NULL,76,24,NULL,NULL,NULL,201302041061045,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(67,'123.45.67.15','bob66@smith.com','Eugenf','Cronio',NULL,'e_cronio','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:20','2014-02-20 10:46:20',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,77,24,NULL,NULL,NULL,201111020073931,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(68,'123.45.67.17','bob67@smith.com','Kaitlio','Reinges',NULL,'k_reinges','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:20','2014-02-20 10:46:20',NULL,1,67,'2014-02-18 10:46:20','Curator','',0,'scope',NULL,NULL,NULL,NULL,78,24,NULL,NULL,NULL,201111020541857,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(69,'123.45.67.16','bob68@smith.com','Othp','Jacobt',NULL,'o_jacobt','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:24','2014-02-20 10:46:24',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,79,24,NULL,NULL,NULL,201111020722713,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(70,'123.45.67.10','bob69@smith.com','Camilb','Cronb',NULL,'c_cronb','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:24','2014-02-20 10:46:24',NULL,1,69,'2014-02-18 10:46:24','Curator','',0,'scope',NULL,NULL,NULL,NULL,80,24,NULL,NULL,NULL,201112090037380,NULL,NULL,0,NULL,1,NULL,2,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(71,'123.45.67.16','bob70@smith.com','Colu','Parisiao',NULL,'c_parisiao','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:36','2014-02-20 10:46:36',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,81,24,NULL,NULL,NULL,201111011130833,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(72,'123.45.67.18','bob71@smith.com','Mathex','Bergstron',NULL,'datamama11','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:55','2014-02-27 12:14:30','',0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,82,24,NULL,NULL,NULL,201205310020621,NULL,NULL,0,'',1,'',NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,2),(73,'123.45.67.10','bob72@smith.com','Electb','Rhyt',NULL,'we_loaded_bootstrap','2aaa8335fd030e054a98e3b2c5852b34',1,1,'2014-02-20 10:46:55','2014-02-20 10:46:55',NULL,0,NULL,NULL,'','',0,'',NULL,NULL,NULL,NULL,83,24,NULL,NULL,NULL,201201050110344,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,NULL,NULL),(92,'127.0.0.1','user2@example.com','walaa','elsayed',NULL,'user2','7e58d63b60197ceb55a1c487989a3720',1,1,'2014-03-02 12:12:50','2014-03-02 13:26:42',NULL,0,NULL,NULL,'',NULL,0,'',NULL,NULL,NULL,NULL,103,24,NULL,'b72b0dc4a754b3d12a1abb92257f91ed87b458fc',NULL,201310010059333,'images.jpeg','image/jpeg',4234,'Bird enthusiast',1,'i am wala2',NULL,NULL,NULL,NULL,0,'2014-03-02 12:40:08','2014-02-13 09:53:07',0,0,NULL,92,1),(93,'127.0.0.1',NULL,NULL,NULL,NULL,'user100',NULL,NULL,1,'2014-03-03 08:56:49','2014-03-03 09:02:53',NULL,0,NULL,NULL,'','9587c74733f8572dd15d756c56aa2ef0a5c4fa4d',0,'',NULL,NULL,NULL,NULL,104,24,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,0,'2014-02-13 09:53:07','2014-02-13 09:53:07',0,0,NULL,2,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data_objects`
--

DROP TABLE IF EXISTS `users_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `taxon_concept_id` int(11) DEFAULT NULL,
  `vetted_id` int(11) NOT NULL,
  `visibility_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_data_objects_on_data_object_id` (`data_object_id`),
  KEY `index_users_data_objects_on_taxon_concept_id` (`taxon_concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data_objects`
--

LOCK TABLES `users_data_objects` WRITE;
/*!40000 ALTER TABLE `users_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_data_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data_objects_ratings`
--

DROP TABLE IF EXISTS `users_data_objects_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data_objects_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `data_object_guid` varchar(32) CHARACTER SET ascii NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_data_objects_ratings_1` (`data_object_guid`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data_objects_ratings`
--

LOCK TABLES `users_data_objects_ratings` WRITE;
/*!40000 ALTER TABLE `users_data_objects_ratings` DISABLE KEYS */;
INSERT INTO `users_data_objects_ratings` VALUES (1,30,NULL,1,'79c006ab83374417b67af7fb03a003c8','2014-02-20 10:45:14','2014-02-20 10:45:14',1),(2,30,NULL,1,'9e21e537e9cd4c509c5a26b869110712','2014-02-20 10:45:14','2014-02-20 10:45:14',1);
/*!40000 ALTER TABLE `users_data_objects_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_identities`
--

DROP TABLE IF EXISTS `users_user_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_identities` (
  `user_id` int(10) unsigned NOT NULL,
  `user_identity_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_identities`
--

LOCK TABLES `users_user_identities` WRITE;
/*!40000 ALTER TABLE `users_user_identities` DISABLE KEYS */;
INSERT INTO `users_user_identities` VALUES (87,1),(87,2),(88,2),(89,1),(89,3),(92,2);
/*!40000 ALTER TABLE `users_user_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vetted`
--

DROP TABLE IF EXISTS `vetted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vetted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `view_order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Vetted statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vetted`
--

LOCK TABLES `vetted` WRITE;
/*!40000 ALTER TABLE `vetted` DISABLE KEYS */;
INSERT INTO `vetted` VALUES (1,'2014-02-20 10:44:16','2014-02-20 10:44:16',1),(2,'2014-02-20 10:44:16','2014-02-20 10:44:16',2),(3,'2014-02-20 10:44:16','2014-02-20 10:44:16',3),(4,'2014-02-20 10:44:16','2014-02-20 10:44:16',4);
/*!40000 ALTER TABLE `vetted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_styles`
--

DROP TABLE IF EXISTS `view_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_items_per_page` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_styles`
--

LOCK TABLES `view_styles` WRITE;
/*!40000 ALTER TABLE `view_styles` DISABLE KEYS */;
INSERT INTO `view_styles` VALUES (1,NULL),(2,NULL),(3,NULL);
/*!40000 ALTER TABLE `view_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visibilities`
--

DROP TABLE IF EXISTS `visibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visibilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visibilities`
--

LOCK TABLES `visibilities` WRITE;
/*!40000 ALTER TABLE `visibilities` DISABLE KEYS */;
INSERT INTO `visibilities` VALUES (1,'2014-02-20 10:44:17','2014-02-20 10:44:17'),(2,'2014-02-20 10:44:17','2014-02-20 10:44:17'),(3,'2014-02-20 10:44:17','2014-02-20 10:44:17');
/*!40000 ALTER TABLE `visibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whats_this`
--

DROP TABLE IF EXISTS `whats_this`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whats_this` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whats_this`
--

LOCK TABLES `whats_this` WRITE;
/*!40000 ALTER TABLE `whats_this` DISABLE KEYS */;
/*!40000 ALTER TABLE `whats_this` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikipedia_queue`
--

DROP TABLE IF EXISTS `wikipedia_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikipedia_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `harvested_at` timestamp NULL DEFAULT NULL,
  `harvest_succeeded` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikipedia_queue`
--

LOCK TABLES `wikipedia_queue` WRITE;
/*!40000 ALTER TABLE `wikipedia_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `wikipedia_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worklist_ignored_data_objects`
--

DROP TABLE IF EXISTS `worklist_ignored_data_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worklist_ignored_data_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `data_object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_worklist_ignored_data_objects_on_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worklist_ignored_data_objects`
--

LOCK TABLES `worklist_ignored_data_objects` WRITE;
/*!40000 ALTER TABLE `worklist_ignored_data_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `worklist_ignored_data_objects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-03 11:07:15
