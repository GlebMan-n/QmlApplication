-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: sophic_medical
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `patient` int(11) NOT NULL,
  `activity_type` smallint(3) NOT NULL,
  `patient_position` bigint(18) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity__activity_type__FK_IDX` (`activity_type`),
  KEY `activity__patient__FK_IDX` (`patient`),
  KEY `activity__patient_position__FK_IDX` (`patient_position`),
  CONSTRAINT `activity__activity_type__FK` FOREIGN KEY (`activity_type`) REFERENCES `activity_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `activity__patient__FK` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `activity__patient_position__FK` FOREIGN KEY (`patient_position`) REFERENCES `patient_position` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_class`
--

DROP TABLE IF EXISTS `activity_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_class` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_class`
--

LOCK TABLES `activity_class` WRITE;
/*!40000 ALTER TABLE `activity_class` DISABLE KEYS */;
INSERT INTO `activity_class` VALUES (1,'Default',NULL),(2,'Information',NULL),(3,'Success',NULL),(4,'Warning',NULL),(5,'Danger',NULL);
/*!40000 ALTER TABLE `activity_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_type`
--

DROP TABLE IF EXISTS `activity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_type` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `activity_class` tinyint(2) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `activity_type__activity_class__FK_IDX` (`activity_class`),
  CONSTRAINT `activity_type__activity_class__FK` FOREIGN KEY (`activity_class`) REFERENCES `activity_class` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_type`
--

LOCK TABLES `activity_type` WRITE;
/*!40000 ALTER TABLE `activity_type` DISABLE KEYS */;
INSERT INTO `activity_type` VALUES (1,'Fall detected',5,NULL),(2,'Abnormail gait',4,NULL);
/*!40000 ALTER TABLE `activity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_device`
--

DROP TABLE IF EXISTS `admin_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_device` (
  `code` varchar(5) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_device`
--

LOCK TABLES `admin_device` WRITE;
/*!40000 ALTER TABLE `admin_device` DISABLE KEYS */;
INSERT INTO `admin_device` VALUES ('DEF','Default admin device',NULL);
/*!40000 ALTER TABLE `admin_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_method`
--

DROP TABLE IF EXISTS `admin_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_method` (
  `code` varchar(5) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_method`
--

LOCK TABLES `admin_method` WRITE;
/*!40000 ALTER TABLE `admin_method` DISABLE KEYS */;
INSERT INTO `admin_method` VALUES ('CH','CHEW',NULL),('DI','DISSOLVE',NULL),('DU','DUST',NULL),('IF','INFILTRATE',NULL),('IR','IRRIGATE',NULL),('IS','INSERT',NULL),('IVP','IV PUSH',NULL),('IVPB','IV PIGGYBACK',NULL),('NB','NEBULIZE',NULL),('PF','PERFUSE',NULL),('PT','PAIN',NULL),('SH','SHAMPOO',NULL),('SO','SOAK',NULL),('WA','WASH',NULL),('WI','WIPE',NULL);
/*!40000 ALTER TABLE `admin_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_route`
--

DROP TABLE IF EXISTS `admin_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_route` (
  `code` varchar(5) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_route`
--

LOCK TABLES `admin_route` WRITE;
/*!40000 ALTER TABLE `admin_route` DISABLE KEYS */;
INSERT INTO `admin_route` VALUES ('AP','APPLY EXTERNALLY',NULL),('B','BUCCAL',NULL),('DT','DENTAL',NULL),('GTT','GASTRONOMY TUBE',NULL),('GU','GU IRRIGANT',NULL),('IA','INTRO-ARTERIAL',NULL),('IC','INTRACARDIAC',NULL),('ID','INTRADERMAL',NULL),('IH','INHALATION',NULL),('IM','INTRAMUSCULAR',NULL),('IN','INTRANASAL',NULL),('IO','INTRAOCULAR',NULL),('IP','INTRAPERITONEAL',NULL),('IS','INTRASYNOVIAL',NULL),('IT','INTRATHECAL',NULL),('IV','INTRAVENOUS',NULL),('NG','NASOGASTRIC',NULL),('NS','NASAL',NULL),('OT','OTIC',NULL),('PO','ORAL',NULL),('PR','RECTAL',NULL),('SC','SUBCUTANEOUS',NULL),('SL','SUBLINGUAL',NULL),('TD','TRANSDERMAL',NULL),('TL','TRANSLINGUAL',NULL),('TP','TOPICAL',NULL),('UR','URETHRAL',NULL),('VG','VAGINAL',NULL);
/*!40000 ALTER TABLE `admin_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_site`
--

DROP TABLE IF EXISTS `admin_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_site` (
  `code` varchar(5) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_site`
--

LOCK TABLES `admin_site` WRITE;
/*!40000 ALTER TABLE `admin_site` DISABLE KEYS */;
INSERT INTO `admin_site` VALUES ('DEF','Default admin site',NULL);
/*!40000 ALTER TABLE `admin_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `household` int(11) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `area__household__FK_IDX` (`household`),
  CONSTRAINT `area__household__FK` FOREIGN KEY (`household`) REFERENCES `household` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'1-st floor',1,'Y','2017-07-27 19:05:30'),(2,'2-nd floor',1,'Y','2017-07-27 19:05:30'),(3,'1-st floor',2,'Y','2017-07-27 19:05:30'),(4,'kitchen',3,'Y','2020-10-13 17:40:00');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`area_after_insert`
AFTER INSERT ON `area`
FOR EACH ROW
BEGIN
/*  Name: area_after_insert
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$household_hist` BIGINT(20) DEFAULT NULL;
    
  	SET `$household_hist` = get_household_hist_id(NEW.household);
    
    INSERT INTO `area_history`(
	  `prev_id`,
	  `history_dt`,
	  `area`,
	  `history_type`,
	  `name`,
      `household_hist`,
      `is_active`,
      `last_modified`
    )
    VALUES(
		NULL,
        now(),
        NEW.`id`,
        'CREATED',
        NEW.`name`,
        `$household_hist`,
        NEW.`is_active`,
        NEW.`last_modified`
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`area_after_update`
AFTER UPDATE ON `sophic_medical`.`area`
FOR EACH ROW
BEGIN
/*  Name: area_after_update
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$household_hist` BIGINT(20);
    
    SELECT `id` INTO `$prev_id` FROM `area_history` A 
		WHERE A.`area` = OLD.`id` ORDER BY A.`history_dt` DESC LIMIT 1;  

  	SET `$household_hist` = get_household_hist_id(NEW.household);

    INSERT INTO `area_history`(
 	  `prev_id`,
 	  `history_dt`,
 	  `history_type`,
	  `area`,
	  `name`,
      `household_hist`,
      `is_active`,
 	  `last_modified`
    )
    VALUES(
       `$prev_id`,
        now(),
        'UPDATED',
        NEW.`id`,
        NEW.`name`,
		`$household_hist`,
        NEW.`is_active`,
        NEW.`last_modified`
    );
     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`area_after_delete`
AFTER DELETE ON `area`
FOR EACH ROW
BEGIN
/*  Name: area_after_delete
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$household_hist` BIGINT(20);

    SELECT `id` INTO `$prev_id` FROM `area_history` A 
		WHERE A.`area` = OLD.`id` ORDER BY A.`history_dt` DESC LIMIT 1;  

	SET `$household_hist` = get_household_hist_id(OLD.household);

    INSERT INTO `area_history`(
 	  `prev_id`,
 	  `history_dt`,
 	  `history_type`,
	  `area`,
	  `name`,
      `household_hist`,
      `is_active`,
 	  `last_modified`
    )
    VALUES(
       `$prev_id`,
        now(),
        'DELETED',
        OLD.`id`,
        OLD.`name`,
		`$household_hist`,
        OLD.`is_active`,
        OLD.`last_modified`
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `area_history`
--

DROP TABLE IF EXISTS `area_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prev_id` bigint(20) DEFAULT NULL,
  `history_dt` datetime NOT NULL,
  `history_type` enum('CREATED','UPDATED','DELETED','ADDED_EXISTING') DEFAULT NULL,
  `area` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `household_hist` bigint(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_history__UNIQ` (`history_dt`,`area`),
  KEY `area_history__household_history__FK_IDX` (`household_hist`),
  KEY `area_history__area_history__FK` (`prev_id`),
  CONSTRAINT `area_history__area_history__FK` FOREIGN KEY (`prev_id`) REFERENCES `area_history` (`id`),
  CONSTRAINT `area_history__household_history__FK` FOREIGN KEY (`household_hist`) REFERENCES `household_history` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_history`
--

LOCK TABLES `area_history` WRITE;
/*!40000 ALTER TABLE `area_history` DISABLE KEYS */;
INSERT INTO `area_history` VALUES (1,NULL,'2018-01-25 19:44:18','CREATED',1,'1-st floor',0,'Y','2017-07-27 19:05:30'),(2,NULL,'2018-01-25 19:44:18','CREATED',2,'2-nd floor',0,'Y','2017-07-27 19:05:30'),(3,NULL,'2018-01-25 19:44:18','CREATED',3,'1-st floor',0,'Y','2017-07-27 19:05:30'),(4,NULL,'2020-10-13 17:40:00','CREATED',4,'kitchen',3,'Y','2020-10-13 17:40:00');
/*!40000 ALTER TABLE `area_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin`
--

DROP TABLE IF EXISTS `bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin` (
  `code` varchar(16) NOT NULL,
  `color` varchar(16) DEFAULT NULL,
  `loaded_datetime` datetime DEFAULT NULL,
  `loaded_to_slot` tinyint(2) DEFAULT NULL,
  `loaded_to_cartridge` varchar(16) DEFAULT NULL,
  `scanned_datetime` datetime DEFAULT NULL,
  `scanned_in_slot` tinyint(2) DEFAULT NULL,
  `scanned_in_cartridge_num` tinyint(2) DEFAULT NULL,
  `scanned_in_device` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `bin__bin_color__FK_IDX` (`color`),
  KEY `bin_cartridge_FK_idx` (`loaded_to_cartridge`),
  KEY `bin__device__FK_IDX` (`scanned_in_device`),
  CONSTRAINT `bin__bin_color__FK` FOREIGN KEY (`color`) REFERENCES `bin_color` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `bin__device__FK` FOREIGN KEY (`scanned_in_device`) REFERENCES `device` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bin_cartridge_FK` FOREIGN KEY (`loaded_to_cartridge`) REFERENCES `cartridge` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin`
--

LOCK TABLES `bin` WRITE;
/*!40000 ALTER TABLE `bin` DISABLE KEYS */;
INSERT INTO `bin` VALUES ('7X7mVdl24F','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',12,1,1),('9lKrr','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',9,3,1),('AAAAABBBBB','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('BBBBBAAAAA','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cDkH0BCgZN','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('DqGfqVzSDq','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',6,1,1),('dxlgW','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',7,1,1),('e4ZJEBkRQN','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',11,3,1),('H5Xb4','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',5,1,1),('hPUer','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',10,3,1),('KNKP98mnlx','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',6,3,1),('mPhMn7fBjX','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',8,1,1),('Mwtt1AruNx','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',2,3,1),('OfdHD','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',7,3,1),('pD5SbalaM8','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',1,3,1),('pMOAo','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('psBy5','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',10,1,1),('REZi8MszhC','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',8,3,1),('t9hWvr1ipZ','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('TbbiI5T1f3','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',11,1,1),('V6BfdpR6tO','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',3,3,1),('WKgVnXHzzX','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('xT0VLDHzF8','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',9,1,1),('Y0ZEt33XJ5','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',12,3,1);
/*!40000 ALTER TABLE `bin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`bin_after_insert`
AFTER INSERT ON `bin`
FOR EACH ROW
BEGIN
/*  Name: bin_after_insert
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$cartridge_hist` BIGINT(20) DEFAULT NULL;
    DECLARE `$device_hist` BIGINT(20) DEFAULT NULL;
    
  	SET `$cartridge_hist` = get_cartridge_hist_id(NEW.loaded_to_cartridge);
    SET `$device_hist` = get_device_hist_id(NEW.scanned_in_device);

	INSERT INTO `bin_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`bin`,
		`color`,
		`loaded_datetime`,
		`loaded_to_slot`,
		`loaded_to_cartridge_hist`,
        `scanned_datetime`,
        `scanned_in_slot`,
        `scanned_in_cartridge_num`,
        `scanned_in_device_hist`
	)
	VALUES
	(
		NULL,
		now(),
		'CREATED',
		NEW.code,
        NEW.color,
        NEW.`loaded_datetime`,
        NEW.`loaded_to_slot`,
        `$cartridge_hist`,
        NEW.`scanned_datetime`,
        NEW.`scanned_in_slot`,
        NEW.`scanned_in_cartridge_num`,
        `$device_hist`
    );
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`bin_after_update`
AFTER UPDATE ON `sophic_medical`.`bin`
FOR EACH ROW
BEGIN
/*  Name: bin_after_update
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$cartridge_hist` BIGINT(20);
    DECLARE `$device_hist` BIGINT(20);
    
    SELECT `id` INTO `$prev_id` FROM `bin_history` B 
		WHERE B.`bin` = OLD.`code` ORDER BY B.`history_dt` DESC LIMIT 1;  
	
  	SET `$cartridge_hist` = get_cartridge_hist_id(NEW.loaded_to_cartridge);
    SET `$device_hist` = get_device_hist_id(NEW.scanned_in_device);

	INSERT INTO `bin_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`bin`,
		`color`,
		`loaded_datetime`,
		`loaded_to_slot`,
		`loaded_to_cartridge_hist`,
        `scanned_datetime`,
        `scanned_in_slot`,
        `scanned_in_cartridge_num`,
        `scanned_in_device_hist`
	)
	VALUES
	(
		`$prev_id`,
		now(),
		'UPDATED',
		NEW.code,
        NEW.color,
        NEW.`loaded_datetime`,
        NEW.`loaded_to_slot`,
        `$cartridge_hist`,
        NEW.`scanned_datetime`,
        NEW.`scanned_in_slot`,
        NEW.`scanned_in_cartridge_num`,
        `$device_hist`
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`bin_after_delete`
AFTER DELETE ON `bin`
FOR EACH ROW
BEGIN
/*  Name: bin_after_delete
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$cartridge_hist` BIGINT(20);
    DECLARE `$device_hist` BIGINT(20);

    SELECT `id` INTO `$prev_id` FROM `bin_history` B 
		WHERE B.`bin` = OLD.`code` ORDER BY B.`history_dt` DESC LIMIT 1;  
        
  	SET `$cartridge_hist` = get_cartridge_hist_id(OLD.loaded_to_cartridge);
    SET `$device_hist` = get_device_hist_id(OLD.scanned_in_device);

	INSERT INTO `bin_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`bin`,
		`color`,
		`loaded_datetime`,
		`loaded_to_slot`,
		`loaded_to_cartridge_hist`,
        `scanned_datetime`,
        `scanned_in_slot`,
        `scanned_in_cartridge_num`,
        `scanned_in_device_hist`
	)
	VALUES
	(
		`$prev_id`,
		now(),
		'DELETED',
		OLD.code,
        OLD.color,
        OLD.`loaded_datetime`,
        OLD.`loaded_to_slot`,
        `$cartridge_hist`,
        OLD.`scanned_datetime`,
        OLD.`scanned_in_slot`,
        OLD.`scanned_in_cartridge_num`,
        `$cartridge_hist`
    );
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bin__cartridge`
--

DROP TABLE IF EXISTS `bin__cartridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin__cartridge` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `bin` varchar(16) NOT NULL,
  `cartridge` varchar(16) NOT NULL,
  `slot` tinyint(2) NOT NULL,
  `is_loaded` char(1) NOT NULL DEFAULT 'Y',
  `datetime` datetime NOT NULL,
  `transaction` bigint(18) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bin__cartridge__bin__FK_IDX` (`bin`),
  KEY `bin__cartridge__cartridge__FK_IDX` (`cartridge`),
  KEY `bin__cartridge__transaction__FK_IDX` (`transaction`),
  CONSTRAINT `bin__cartridge__bin__FK` FOREIGN KEY (`bin`) REFERENCES `bin` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bin__cartridge__cartridge__FK` FOREIGN KEY (`cartridge`) REFERENCES `cartridge` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bin__cartridge__transaction__FK` FOREIGN KEY (`transaction`) REFERENCES `transaction` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin__cartridge`
--

LOCK TABLES `bin__cartridge` WRITE;
/*!40000 ALTER TABLE `bin__cartridge` DISABLE KEYS */;
/*!40000 ALTER TABLE `bin__cartridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_color`
--

DROP TABLE IF EXISTS `bin_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_color` (
  `code` varchar(16) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_color`
--

LOCK TABLES `bin_color` WRITE;
/*!40000 ALTER TABLE `bin_color` DISABLE KEYS */;
INSERT INTO `bin_color` VALUES ('BLUE','Blue'),('RED','Red');
/*!40000 ALTER TABLE `bin_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bin_history`
--

DROP TABLE IF EXISTS `bin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bin_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prev_id` bigint(20) DEFAULT NULL,
  `history_dt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'datetime when row has been created',
  `history_type` enum('CREATED','UPDATED','DELETED','ADDED_EXISTING') DEFAULT NULL,
  `bin` varchar(16) NOT NULL,
  `color` varchar(16) DEFAULT NULL,
  `loaded_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `loaded_to_slot` tinyint(2) DEFAULT NULL,
  `loaded_to_cartridge_hist` bigint(20) DEFAULT NULL,
  `scanned_datetime` datetime DEFAULT NULL,
  `scanned_in_slot` tinyint(2) DEFAULT NULL,
  `scanned_in_cartridge_num` tinyint(2) DEFAULT NULL,
  `scanned_in_device_hist` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bin__bin_color__FK_IDX` (`color`),
  KEY `bin_cartridge_FK_idx` (`loaded_to_cartridge_hist`),
  KEY `bin_history__device_hist_FK_idx` (`scanned_in_device_hist`),
  CONSTRAINT `bin_history__bin_color__FK` FOREIGN KEY (`color`) REFERENCES `bin_color` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `bin_history__cartridge_hist_FK` FOREIGN KEY (`loaded_to_cartridge_hist`) REFERENCES `cartridge_history` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bin_history__device_hist_FK` FOREIGN KEY (`scanned_in_device_hist`) REFERENCES `device_history` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bin_history`
--

LOCK TABLES `bin_history` WRITE;
/*!40000 ALTER TABLE `bin_history` DISABLE KEYS */;
INSERT INTO `bin_history` VALUES (1,NULL,'2018-01-25 19:44:18','CREATED','AAAAABBBBB','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,'2018-01-25 19:44:18','CREATED','BBBBBAAAAA','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,'2018-01-25 19:44:18','CREATED','DqGfqVzSDqtyLpFa','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'2018-01-25 19:44:18','CREATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'2018-01-25 19:44:18','CREATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'2018-01-25 19:44:18','CREATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'2018-01-25 19:44:18','CREATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'2018-01-25 19:44:18','CREATED','gvVl0','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'2018-01-25 19:44:18','CREATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'2018-01-25 19:44:18','CREATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,'2018-01-25 19:44:18','CREATED','Y0ZEt33XJ5Ygv6tM','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'2018-01-25 19:44:18','CREATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'2018-01-25 19:44:18','CREATED','t9hWvr1ipZo5oXYz','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,'2018-01-25 19:44:18','CREATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,10,'2020-10-15 20:56:17','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',5,1,37),(16,5,'2020-10-15 20:56:17','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',1,2,37),(17,6,'2020-10-15 20:56:17','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',11,1,37),(18,7,'2020-10-15 20:56:17','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',9,2,37),(19,9,'2020-10-15 20:56:17','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',10,2,37),(20,12,'2020-10-15 20:56:17','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',8,2,37),(21,14,'2020-10-15 20:56:17','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',3,1,37),(22,4,'2020-10-15 20:56:17','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-15 20:56:17',3,2,37),(23,18,'2020-10-15 21:22:09','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,15,'2020-10-15 21:22:09','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,19,'2020-10-15 21:22:09','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,16,'2020-10-15 21:22:09','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,20,'2020-10-15 21:22:09','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,17,'2020-10-15 21:22:09','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,22,'2020-10-15 21:22:09','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,21,'2020-10-15 21:22:09','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,11,'2020-10-15 21:22:09','UPDATED','Y0ZEt33XJ5Ygv6tM','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',12,2,37),(32,3,'2020-10-15 21:22:09','UPDATED','DqGfqVzSDqtyLpFa','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',6,1,37),(33,13,'2020-10-15 21:22:09','UPDATED','t9hWvr1ipZo5oXYz','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',4,1,37),(34,24,'2020-10-15 21:22:09','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',5,1,37),(35,26,'2020-10-15 21:22:09','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',1,2,37),(36,28,'2020-10-15 21:22:09','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',11,1,37),(37,23,'2020-10-15 21:22:09','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',9,2,37),(38,25,'2020-10-15 21:22:09','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',10,2,37),(39,29,'2020-10-15 21:22:09','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',3,2,37),(40,30,'2020-10-15 21:22:09','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',3,1,37),(41,27,'2020-10-15 21:22:09','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-15 21:22:09',8,2,37),(42,23,'2020-10-15 21:26:15','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,32,'2020-10-15 21:26:15','UPDATED','DqGfqVzSDqtyLpFa','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,24,'2020-10-15 21:26:15','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,25,'2020-10-15 21:26:15','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,26,'2020-10-15 21:26:15','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,27,'2020-10-15 21:26:15','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,33,'2020-10-15 21:26:15','UPDATED','t9hWvr1ipZo5oXYz','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,28,'2020-10-15 21:26:15','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,29,'2020-10-15 21:26:15','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,30,'2020-10-15 21:26:15','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,31,'2020-10-15 21:26:15','UPDATED','Y0ZEt33XJ5Ygv6tM','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,50,'2020-10-15 21:26:15','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',3,2,37),(54,44,'2020-10-15 21:26:15','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',5,1,37),(55,46,'2020-10-15 21:26:15','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',1,2,37),(56,49,'2020-10-15 21:26:15','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',11,1,37),(57,42,'2020-10-15 21:26:15','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',9,2,37),(58,45,'2020-10-15 21:26:15','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',10,2,37),(59,47,'2020-10-15 21:26:15','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',8,2,37),(60,51,'2020-10-15 21:26:15','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-15 21:26:15',3,1,37),(61,57,'2020-10-15 21:31:59','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,54,'2020-10-15 21:31:59','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,58,'2020-10-15 21:31:59','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,55,'2020-10-15 21:31:59','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,59,'2020-10-15 21:31:59','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,56,'2020-10-15 21:31:59','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,53,'2020-10-15 21:31:59','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,60,'2020-10-15 21:31:59','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,62,'2020-10-15 21:31:59','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',5,1,37),(70,64,'2020-10-15 21:31:59','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',1,2,37),(71,66,'2020-10-15 21:31:59','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',11,1,37),(72,61,'2020-10-15 21:31:59','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',9,2,37),(73,63,'2020-10-15 21:31:59','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',10,2,37),(74,67,'2020-10-15 21:31:59','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',3,2,37),(75,68,'2020-10-15 21:31:59','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',3,1,37),(76,65,'2020-10-15 21:31:59','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-15 21:31:59',8,2,37),(77,61,'2020-10-15 21:35:45','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,62,'2020-10-15 21:35:45','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,63,'2020-10-15 21:35:45','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,64,'2020-10-15 21:35:45','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,65,'2020-10-15 21:35:45','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,66,'2020-10-15 21:35:45','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,67,'2020-10-15 21:35:45','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,68,'2020-10-15 21:35:45','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,78,'2020-10-15 21:35:45','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',5,1,37),(86,80,'2020-10-15 21:35:45','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',1,2,37),(87,82,'2020-10-15 21:35:45','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',11,1,37),(88,77,'2020-10-15 21:35:45','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',9,2,37),(89,79,'2020-10-15 21:35:45','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',10,2,37),(90,81,'2020-10-15 21:35:45','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',8,2,37),(91,84,'2020-10-15 21:35:45','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',3,1,37),(92,83,'2020-10-15 21:35:45','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',3,2,37),(93,85,'2020-10-16 13:39:10','DELETED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',5,1,NULL),(94,88,'2020-10-16 13:42:32','DELETED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',9,2,NULL),(95,89,'2020-10-16 13:42:32','DELETED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',10,2,NULL),(96,86,'2020-10-16 13:42:32','DELETED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',1,2,NULL),(97,90,'2020-10-16 13:42:32','DELETED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',8,2,NULL),(98,87,'2020-10-16 13:42:32','DELETED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',11,1,NULL),(99,92,'2020-10-16 13:42:32','DELETED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',3,2,NULL),(100,91,'2020-10-16 13:42:32','DELETED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-15 21:35:45',3,1,NULL),(101,52,'2020-10-16 13:42:32','DELETED','Y0ZEt33XJ5Ygv6tM','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,43,'2020-10-16 14:10:59','DELETED','DqGfqVzSDqtyLpFa','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,8,'2020-10-16 14:10:59','DELETED','gvVl0','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,48,'2020-10-16 14:10:59','DELETED','t9hWvr1ipZo5oXYz','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(127,NULL,'2020-10-19 18:19:58','CREATED','pMOAo','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(128,NULL,'2020-10-19 18:19:58','CREATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(129,NULL,'2020-10-19 18:19:58','CREATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(130,NULL,'2020-10-19 18:19:58','CREATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,NULL,'2020-10-19 18:19:58','CREATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,NULL,'2020-10-19 18:19:58','CREATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,NULL,'2020-10-19 18:19:58','CREATED','dxlgW','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,NULL,'2020-10-19 18:19:58','CREATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,NULL,'2020-10-19 18:19:59','CREATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,NULL,'2020-10-19 18:19:59','CREATED','psBy5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,NULL,'2020-10-19 18:19:59','CREATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,NULL,'2020-10-19 18:19:59','CREATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,NULL,'2020-10-19 18:19:59','CREATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,NULL,'2020-10-19 18:19:59','CREATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,NULL,'2020-10-19 18:19:59','CREATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,NULL,'2020-10-19 18:19:59','CREATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(143,NULL,'2020-10-19 18:19:59','CREATED','OfdHD','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,NULL,'2020-10-19 18:19:59','CREATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,NULL,'2020-10-19 18:19:59','CREATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,NULL,'2020-10-19 18:19:59','CREATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(147,NULL,'2020-10-19 18:19:59','CREATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,NULL,'2020-10-19 18:19:59','CREATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,139,'2020-10-19 18:24:15','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',1,2,57),(150,142,'2020-10-19 18:24:15','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',6,2,57),(151,137,'2020-10-19 18:24:15','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',11,1,57),(152,134,'2020-10-19 18:24:15','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',8,1,57),(153,138,'2020-10-19 18:24:15','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',12,1,57),(154,146,'2020-10-19 18:24:15','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',10,2,57),(155,128,'2020-10-19 18:24:15','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',2,1,57),(156,133,'2020-10-19 18:24:15','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',7,1,57),(157,144,'2020-10-19 18:24:15','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',8,2,57),(158,141,'2020-10-19 18:24:15','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',3,2,57),(159,129,'2020-10-19 18:24:15','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',3,1,57),(160,132,'2020-10-19 18:24:15','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',6,1,57),(161,127,'2020-10-19 18:24:15','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',1,1,57),(162,147,'2020-10-19 18:24:15','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',11,2,57),(163,130,'2020-10-19 18:24:15','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',4,1,57),(164,145,'2020-10-19 18:24:15','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',9,2,57),(165,143,'2020-10-19 18:24:15','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',7,2,57),(166,140,'2020-10-19 18:24:15','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',2,2,57),(167,148,'2020-10-19 18:24:15','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',12,2,57),(168,131,'2020-10-19 18:24:15','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',5,1,57),(169,135,'2020-10-19 18:24:15','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',9,1,57),(170,136,'2020-10-19 18:24:15','UPDATED','psBy5','BLUE',NULL,NULL,NULL,'2020-10-19 18:24:15',10,1,57),(171,153,'2020-10-19 20:29:24','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,164,'2020-10-19 20:29:24','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,155,'2020-10-19 20:29:24','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(174,160,'2020-10-19 20:29:24','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,156,'2020-10-19 20:29:24','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,162,'2020-10-19 20:29:24','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,168,'2020-10-19 20:29:24','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,154,'2020-10-19 20:29:24','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,150,'2020-10-19 20:29:24','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,152,'2020-10-19 20:29:24','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,166,'2020-10-19 20:29:24','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,165,'2020-10-19 20:29:24','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(183,149,'2020-10-19 20:29:24','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,161,'2020-10-19 20:29:24','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,170,'2020-10-19 20:29:24','UPDATED','psBy5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,157,'2020-10-19 20:29:24','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(187,163,'2020-10-19 20:29:24','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,151,'2020-10-19 20:29:24','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,158,'2020-10-19 20:29:24','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,159,'2020-10-19 20:29:24','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(191,169,'2020-10-19 20:29:24','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,167,'2020-10-19 20:29:24','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,183,'2020-10-19 20:29:24','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',1,6,61),(194,179,'2020-10-19 20:29:24','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',6,6,61),(195,188,'2020-10-19 20:29:24','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',11,4,61),(196,180,'2020-10-19 20:29:24','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',8,4,61),(197,171,'2020-10-19 20:29:24','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',12,4,61),(198,178,'2020-10-19 20:29:24','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',10,6,61),(199,173,'2020-10-19 20:29:24','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',2,4,61),(200,175,'2020-10-19 20:29:24','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',7,4,61),(201,186,'2020-10-19 20:29:24','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',8,6,61),(202,189,'2020-10-19 20:29:24','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',3,6,61),(203,190,'2020-10-19 20:29:24','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',3,4,61),(204,174,'2020-10-19 20:29:24','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',6,4,61),(205,184,'2020-10-19 20:29:24','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',1,4,61),(206,176,'2020-10-19 20:29:24','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',11,6,61),(207,187,'2020-10-19 20:29:24','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',4,4,61),(208,172,'2020-10-19 20:29:24','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',9,6,61),(209,182,'2020-10-19 20:29:24','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',7,6,61),(210,181,'2020-10-19 20:29:24','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',2,6,61),(211,192,'2020-10-19 20:29:24','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',12,6,61),(212,177,'2020-10-19 20:29:24','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',5,4,61),(213,191,'2020-10-19 20:29:24','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',9,4,61),(214,185,'2020-10-19 20:29:24','UPDATED','psBy5','BLUE',NULL,NULL,NULL,'2020-10-19 20:29:24',10,4,61),(215,171,'2020-10-19 20:44:34','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,208,'2020-10-19 20:44:34','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,173,'2020-10-19 20:44:34','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,174,'2020-10-19 20:44:34','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,175,'2020-10-19 20:44:34','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,176,'2020-10-19 20:44:34','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,212,'2020-10-19 20:44:34','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,198,'2020-10-19 20:44:34','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,179,'2020-10-19 20:44:34','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,180,'2020-10-19 20:44:34','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,181,'2020-10-19 20:44:34','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,182,'2020-10-19 20:44:34','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(227,193,'2020-10-19 20:44:34','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,184,'2020-10-19 20:44:34','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,185,'2020-10-19 20:44:34','UPDATED','psBy5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,201,'2020-10-19 20:44:34','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(231,187,'2020-10-19 20:44:34','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,195,'2020-10-19 20:44:34','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,202,'2020-10-19 20:44:34','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,203,'2020-10-19 20:44:34','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(235,191,'2020-10-19 20:44:34','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,192,'2020-10-19 20:44:34','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,227,'2020-10-19 20:44:34','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',1,11,61),(238,223,'2020-10-19 20:44:34','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',6,11,61),(239,232,'2020-10-19 20:44:34','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',11,12,61),(240,224,'2020-10-19 20:44:34','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',8,12,61),(241,215,'2020-10-19 20:44:34','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',12,12,61),(242,222,'2020-10-19 20:44:34','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',10,11,61),(243,217,'2020-10-19 20:44:34','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',2,12,61),(244,219,'2020-10-19 20:44:34','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',7,12,61),(245,230,'2020-10-19 20:44:34','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',8,11,61),(246,233,'2020-10-19 20:44:34','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',3,11,61),(247,234,'2020-10-19 20:44:34','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',3,12,61),(248,218,'2020-10-19 20:44:34','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',6,12,61),(249,228,'2020-10-19 20:44:34','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',1,12,61),(250,220,'2020-10-19 20:44:34','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',11,11,61),(251,231,'2020-10-19 20:44:34','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',4,12,61),(252,216,'2020-10-19 20:44:34','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',9,11,61),(253,226,'2020-10-19 20:44:34','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',7,11,61),(254,225,'2020-10-19 20:44:34','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',2,11,61),(255,236,'2020-10-19 20:44:34','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',12,11,61),(256,221,'2020-10-19 20:44:34','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',5,12,61),(257,235,'2020-10-19 20:44:34','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',9,12,61),(258,229,'2020-10-19 20:44:34','UPDATED','psBy5','BLUE',NULL,NULL,NULL,'2020-10-19 20:44:34',10,12,61),(259,241,'2020-10-19 21:03:42','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,216,'2020-10-19 21:03:42','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,243,'2020-10-19 21:03:42','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,248,'2020-10-19 21:03:42','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,244,'2020-10-19 21:03:42','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,250,'2020-10-19 21:03:42','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(265,221,'2020-10-19 21:03:42','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,222,'2020-10-19 21:03:42','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(267,238,'2020-10-19 21:03:42','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,240,'2020-10-19 21:03:42','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,254,'2020-10-19 21:03:42','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,253,'2020-10-19 21:03:42','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,227,'2020-10-19 21:03:42','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,249,'2020-10-19 21:03:42','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,258,'2020-10-19 21:03:42','UPDATED','psBy5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,230,'2020-10-19 21:03:42','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(275,251,'2020-10-19 21:03:42','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,232,'2020-10-19 21:03:42','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(277,233,'2020-10-19 21:03:42','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,234,'2020-10-19 21:03:42','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,257,'2020-10-19 21:03:42','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(280,255,'2020-10-19 21:03:42','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(281,271,'2020-10-19 21:03:42','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',1,13,61),(282,267,'2020-10-19 21:03:42','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',6,13,61),(283,276,'2020-10-19 21:03:42','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',11,12,61),(284,268,'2020-10-19 21:03:42','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',8,12,61),(285,259,'2020-10-19 21:03:42','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',12,12,61),(286,266,'2020-10-19 21:03:42','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',10,13,61),(287,261,'2020-10-19 21:03:42','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',2,12,61),(288,263,'2020-10-19 21:03:42','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',7,12,61),(289,274,'2020-10-19 21:03:42','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',8,13,61),(290,277,'2020-10-19 21:03:42','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',3,13,61),(291,278,'2020-10-19 21:03:42','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',3,12,61),(292,262,'2020-10-19 21:03:42','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',6,12,61),(293,272,'2020-10-19 21:03:42','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',1,12,61),(294,264,'2020-10-19 21:03:42','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',11,13,61),(295,275,'2020-10-19 21:03:42','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',4,12,61),(296,260,'2020-10-19 21:03:42','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',9,13,61),(297,270,'2020-10-19 21:03:42','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',7,13,61),(298,269,'2020-10-19 21:03:42','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',2,13,61),(299,280,'2020-10-19 21:03:42','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',12,13,61),(300,265,'2020-10-19 21:03:42','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',5,12,61),(301,279,'2020-10-19 21:03:42','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',9,12,61),(302,273,'2020-10-19 21:03:42','UPDATED','psBy5','BLUE',NULL,NULL,NULL,'2020-10-19 21:03:42',10,12,61),(303,259,'2020-10-19 21:16:34','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(304,296,'2020-10-19 21:16:34','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(305,261,'2020-10-19 21:16:34','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(306,262,'2020-10-19 21:16:34','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(307,263,'2020-10-19 21:16:34','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(308,264,'2020-10-19 21:16:34','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(309,300,'2020-10-19 21:16:34','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(310,286,'2020-10-19 21:16:34','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(311,267,'2020-10-19 21:16:34','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,268,'2020-10-19 21:16:34','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,269,'2020-10-19 21:16:34','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,270,'2020-10-19 21:16:34','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(315,281,'2020-10-19 21:16:34','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(316,272,'2020-10-19 21:16:34','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(317,273,'2020-10-19 21:16:34','UPDATED','psBy5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(318,289,'2020-10-19 21:16:34','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,275,'2020-10-19 21:16:34','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(320,283,'2020-10-19 21:16:34','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,290,'2020-10-19 21:16:34','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,291,'2020-10-19 21:16:34','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,279,'2020-10-19 21:16:34','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,280,'2020-10-19 21:16:34','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(325,315,'2020-10-19 21:16:34','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',1,13,61),(326,311,'2020-10-19 21:16:34','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',6,13,61),(327,320,'2020-10-19 21:16:34','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',11,12,61),(328,312,'2020-10-19 21:16:34','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',8,12,61),(329,303,'2020-10-19 21:16:34','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',12,12,61),(330,310,'2020-10-19 21:16:34','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',10,13,61),(331,305,'2020-10-19 21:16:34','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',2,12,61),(332,307,'2020-10-19 21:16:34','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',7,12,61),(333,318,'2020-10-19 21:16:34','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',8,13,61),(334,321,'2020-10-19 21:16:34','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',3,13,61),(335,322,'2020-10-19 21:16:34','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',3,12,61),(336,306,'2020-10-19 21:16:34','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',6,12,61),(337,316,'2020-10-19 21:16:34','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',1,12,61),(338,308,'2020-10-19 21:16:34','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',11,13,61),(339,319,'2020-10-19 21:16:34','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',4,12,61),(340,304,'2020-10-19 21:16:34','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',9,13,61),(341,314,'2020-10-19 21:16:34','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',7,13,61),(342,313,'2020-10-19 21:16:34','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',2,13,61),(343,324,'2020-10-19 21:16:34','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',12,13,61),(344,309,'2020-10-19 21:16:34','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',5,12,61),(345,323,'2020-10-19 21:16:34','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',9,12,61),(346,317,'2020-10-19 21:16:34','UPDATED','psBy5','BLUE',NULL,NULL,NULL,'2020-10-19 21:16:34',10,12,61),(347,329,'2020-10-19 21:29:45','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(348,304,'2020-10-19 21:29:45','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(349,331,'2020-10-19 21:29:45','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(350,336,'2020-10-19 21:29:45','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,332,'2020-10-19 21:29:45','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,338,'2020-10-19 21:29:45','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,309,'2020-10-19 21:29:45','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,310,'2020-10-19 21:29:45','UPDATED','hPUer','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(355,326,'2020-10-19 21:29:45','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,328,'2020-10-19 21:29:45','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,342,'2020-10-19 21:29:45','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(358,341,'2020-10-19 21:29:45','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(359,315,'2020-10-19 21:29:45','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,337,'2020-10-19 21:29:45','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(361,346,'2020-10-19 21:29:45','UPDATED','psBy5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(362,318,'2020-10-19 21:29:45','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(363,339,'2020-10-19 21:29:45','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(364,320,'2020-10-19 21:29:45','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(365,321,'2020-10-19 21:29:45','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(366,322,'2020-10-19 21:29:45','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(367,345,'2020-10-19 21:29:45','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,343,'2020-10-19 21:29:45','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(369,359,'2020-10-19 21:29:45','UPDATED','pD5SbalaM8','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',1,11,63),(370,355,'2020-10-19 21:29:45','UPDATED','KNKP98mnlx','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',6,11,63),(371,364,'2020-10-19 21:29:45','UPDATED','TbbiI5T1f3','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',11,12,63),(372,356,'2020-10-19 21:29:45','UPDATED','mPhMn7fBjX','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',8,12,63),(373,347,'2020-10-19 21:29:45','UPDATED','7X7mVdl24F','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',12,12,63),(374,354,'2020-10-19 21:29:45','UPDATED','hPUer','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',10,11,63),(375,349,'2020-10-19 21:29:45','UPDATED','cDkH0BCgZN','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',2,12,63),(376,351,'2020-10-19 21:29:45','UPDATED','dxlgW','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',7,12,63),(377,362,'2020-10-19 21:29:45','UPDATED','REZi8MszhC','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',8,11,63),(378,365,'2020-10-19 21:29:45','UPDATED','V6BfdpR6tO','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',3,11,63),(379,366,'2020-10-19 21:29:45','UPDATED','WKgVnXHzzX','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',3,12,63),(380,350,'2020-10-19 21:29:45','UPDATED','DqGfqVzSDq','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',6,12,63),(381,360,'2020-10-19 21:29:45','UPDATED','pMOAo','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',1,12,63),(382,352,'2020-10-19 21:29:45','UPDATED','e4ZJEBkRQN','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',11,11,63),(383,363,'2020-10-19 21:29:45','UPDATED','t9hWvr1ipZ','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',4,12,63),(384,348,'2020-10-19 21:29:45','UPDATED','9lKrr','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',9,11,63),(385,358,'2020-10-19 21:29:45','UPDATED','OfdHD','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',7,11,63),(386,357,'2020-10-19 21:29:45','UPDATED','Mwtt1AruNx','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',2,11,63),(387,368,'2020-10-19 21:29:45','UPDATED','Y0ZEt33XJ5','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',12,11,63),(388,353,'2020-10-19 21:29:45','UPDATED','H5Xb4','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',5,12,63),(389,367,'2020-10-19 21:29:45','UPDATED','xT0VLDHzF8','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',9,12,63),(390,361,'2020-10-19 21:29:45','UPDATED','psBy5','BLUE',NULL,NULL,NULL,'2020-10-19 21:29:45',10,12,63),(391,347,'2020-10-20 13:00:01','UPDATED','7X7mVdl24F','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',12,12,63),(392,384,'2020-10-20 13:00:01','UPDATED','9lKrr','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',9,11,63),(393,349,'2020-10-20 13:00:01','UPDATED','cDkH0BCgZN','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',2,12,63),(394,350,'2020-10-20 13:00:01','UPDATED','DqGfqVzSDq','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',6,12,63),(395,351,'2020-10-20 13:00:01','UPDATED','dxlgW','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',7,12,63),(396,352,'2020-10-20 13:00:01','UPDATED','e4ZJEBkRQN','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',11,11,63),(397,388,'2020-10-20 13:00:01','UPDATED','H5Xb4','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',5,12,63),(398,374,'2020-10-20 13:00:01','UPDATED','hPUer','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',10,11,63),(399,355,'2020-10-20 13:00:01','UPDATED','KNKP98mnlx','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',6,11,63),(400,356,'2020-10-20 13:00:01','UPDATED','mPhMn7fBjX','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',8,12,63),(401,357,'2020-10-20 13:00:01','UPDATED','Mwtt1AruNx','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',2,11,63),(402,358,'2020-10-20 13:00:01','UPDATED','OfdHD','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',7,11,63),(403,369,'2020-10-20 13:00:01','UPDATED','pD5SbalaM8','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',1,11,63),(404,360,'2020-10-20 13:00:02','UPDATED','pMOAo','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',1,12,63),(405,361,'2020-10-20 13:00:02','UPDATED','psBy5','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',10,12,63),(406,377,'2020-10-20 13:00:02','UPDATED','REZi8MszhC','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',8,11,63),(407,363,'2020-10-20 13:00:02','UPDATED','t9hWvr1ipZ','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',4,12,63),(408,371,'2020-10-20 13:00:02','UPDATED','TbbiI5T1f3','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',11,12,63),(409,378,'2020-10-20 13:00:02','UPDATED','V6BfdpR6tO','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',3,11,63),(410,379,'2020-10-20 13:00:02','UPDATED','WKgVnXHzzX','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',3,12,63),(411,367,'2020-10-20 13:00:02','UPDATED','xT0VLDHzF8','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',9,12,63),(412,368,'2020-10-20 13:00:02','UPDATED','Y0ZEt33XJ5','RED',NULL,NULL,NULL,'2020-10-19 21:29:45',12,11,63),(413,404,'2020-10-20 13:06:36','UPDATED','pMOAo','RED','2020-10-20 13:06:36',1,1,'2020-10-19 21:29:45',1,12,63),(414,393,'2020-10-20 13:06:36','UPDATED','cDkH0BCgZN','RED','2020-10-20 13:06:36',2,1,'2020-10-19 21:29:45',2,12,63),(415,410,'2020-10-20 13:06:36','UPDATED','WKgVnXHzzX','RED','2020-10-20 13:06:36',3,1,'2020-10-19 21:29:45',3,12,63),(416,407,'2020-10-20 13:06:36','UPDATED','t9hWvr1ipZ','RED','2020-10-20 13:06:36',4,1,'2020-10-19 21:29:45',4,12,63),(417,413,'2020-10-20 13:21:28','UPDATED','pMOAo','RED','2020-10-20 13:06:36',1,2,NULL,NULL,NULL,NULL),(418,414,'2020-10-20 13:21:28','UPDATED','cDkH0BCgZN','RED','2020-10-20 13:06:36',2,2,NULL,NULL,NULL,NULL),(419,415,'2020-10-20 13:21:28','UPDATED','WKgVnXHzzX','RED','2020-10-20 13:06:36',3,2,NULL,NULL,NULL,NULL),(420,416,'2020-10-20 13:21:28','UPDATED','t9hWvr1ipZ','RED','2020-10-20 13:06:36',4,2,NULL,NULL,NULL,NULL),(421,391,'2020-10-20 13:21:28','UPDATED','7X7mVdl24F','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,392,'2020-10-20 13:21:28','UPDATED','9lKrr','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,394,'2020-10-20 13:21:28','UPDATED','DqGfqVzSDq','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,395,'2020-10-20 13:21:28','UPDATED','dxlgW','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(425,396,'2020-10-20 13:21:28','UPDATED','e4ZJEBkRQN','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(426,397,'2020-10-20 13:21:28','UPDATED','H5Xb4','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(427,398,'2020-10-20 13:21:28','UPDATED','hPUer','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(428,399,'2020-10-20 13:21:28','UPDATED','KNKP98mnlx','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,400,'2020-10-20 13:21:28','UPDATED','mPhMn7fBjX','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(430,401,'2020-10-20 13:21:28','UPDATED','Mwtt1AruNx','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,402,'2020-10-20 13:21:28','UPDATED','OfdHD','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,403,'2020-10-20 13:21:28','UPDATED','pD5SbalaM8','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,405,'2020-10-20 13:21:28','UPDATED','psBy5','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,406,'2020-10-20 13:21:28','UPDATED','REZi8MszhC','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(435,408,'2020-10-20 13:21:28','UPDATED','TbbiI5T1f3','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(436,409,'2020-10-20 13:21:28','UPDATED','V6BfdpR6tO','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(437,411,'2020-10-20 13:21:28','UPDATED','xT0VLDHzF8','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(438,412,'2020-10-20 13:21:28','UPDATED','Y0ZEt33XJ5','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(439,432,'2020-10-20 13:21:28','UPDATED','pD5SbalaM8','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',1,3,65),(440,428,'2020-10-20 13:21:28','UPDATED','KNKP98mnlx','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',6,3,65),(441,435,'2020-10-20 13:21:28','UPDATED','TbbiI5T1f3','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',11,1,65),(442,429,'2020-10-20 13:21:28','UPDATED','mPhMn7fBjX','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',8,1,65),(443,421,'2020-10-20 13:21:28','UPDATED','7X7mVdl24F','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',12,1,65),(444,427,'2020-10-20 13:21:28','UPDATED','hPUer','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',10,3,65),(445,418,'2020-10-20 13:21:28','UPDATED','cDkH0BCgZN','RED','2020-10-20 13:06:36',2,2,'2020-10-20 13:21:28',2,1,65),(446,424,'2020-10-20 13:21:28','UPDATED','dxlgW','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',7,1,65),(447,434,'2020-10-20 13:21:28','UPDATED','REZi8MszhC','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',8,3,65),(448,436,'2020-10-20 13:21:28','UPDATED','V6BfdpR6tO','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',3,3,65),(449,419,'2020-10-20 13:21:28','UPDATED','WKgVnXHzzX','RED','2020-10-20 13:06:36',3,2,'2020-10-20 13:21:28',3,1,65),(450,423,'2020-10-20 13:21:28','UPDATED','DqGfqVzSDq','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',6,1,65),(451,417,'2020-10-20 13:21:28','UPDATED','pMOAo','RED','2020-10-20 13:06:36',1,2,'2020-10-20 13:21:28',1,1,65),(452,425,'2020-10-20 13:21:28','UPDATED','e4ZJEBkRQN','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',11,3,65),(453,420,'2020-10-20 13:21:28','UPDATED','t9hWvr1ipZ','RED','2020-10-20 13:06:36',4,2,'2020-10-20 13:21:28',4,1,65),(454,422,'2020-10-20 13:21:28','UPDATED','9lKrr','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',9,3,65),(455,431,'2020-10-20 13:21:28','UPDATED','OfdHD','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',7,3,65),(456,430,'2020-10-20 13:21:28','UPDATED','Mwtt1AruNx','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',2,3,65),(457,438,'2020-10-20 13:21:28','UPDATED','Y0ZEt33XJ5','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',12,3,65),(458,426,'2020-10-20 13:21:28','UPDATED','H5Xb4','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',5,1,65),(459,437,'2020-10-20 13:21:28','UPDATED','xT0VLDHzF8','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',9,1,65),(460,433,'2020-10-20 13:21:28','UPDATED','psBy5','RED',NULL,NULL,NULL,'2020-10-20 13:21:28',10,1,65),(461,451,'2020-10-20 13:24:03','UPDATED','pMOAo','RED','2020-10-20 13:06:36',1,2,NULL,NULL,NULL,NULL),(462,461,'2020-10-20 13:24:03','UPDATED','pMOAo','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(463,445,'2020-10-20 13:26:22','UPDATED','cDkH0BCgZN','RED','2020-10-20 13:06:36',2,2,NULL,NULL,NULL,NULL),(464,463,'2020-10-20 13:26:22','UPDATED','cDkH0BCgZN','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,419,'2020-10-20 13:56:42','UPDATED','WKgVnXHzzX','RED','2020-10-20 13:06:36',3,2,NULL,NULL,NULL,NULL),(466,465,'2020-10-20 13:56:42','UPDATED','WKgVnXHzzX','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(467,453,'2020-10-20 14:07:57','UPDATED','t9hWvr1ipZ','RED','2020-10-20 13:06:36',4,2,NULL,NULL,NULL,NULL),(468,467,'2020-10-20 14:07:57','UPDATED','t9hWvr1ipZ','RED',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartridge`
--

DROP TABLE IF EXISTS `cartridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartridge` (
  `code` varchar(16) NOT NULL,
  `loaded_datetime` datetime DEFAULT NULL,
  `loaded_to_device` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `cartridge_device_FK_idx` (`loaded_to_device`),
  CONSTRAINT `cartridge_device_FK` FOREIGN KEY (`loaded_to_device`) REFERENCES `device` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartridge`
--

LOCK TABLES `cartridge` WRITE;
/*!40000 ALTER TABLE `cartridge` DISABLE KEYS */;
INSERT INTO `cartridge` VALUES ('BBBBBAAAAA','2020-10-20 13:06:36',1);
/*!40000 ALTER TABLE `cartridge` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`cartridge_after_insert`
AFTER INSERT ON `cartridge`
FOR EACH ROW
BEGIN
/*  Name: cartridge_after_insert
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$device_hist` BIGINT(20) DEFAULT NULL;
    
  	SET `$device_hist` = get_device_hist_id(NEW.loaded_to_device);

	INSERT INTO `cartridge_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`cartridge`,
		`loaded_datetime`,
		`loaded_to_device_hist`)
	VALUES(
		NULL,
		now(),
		'CREATED',
        NEW.`code`,
        NEW.`loaded_datetime`,
        `$device_hist`
    );
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`cartridge_after_update`
AFTER UPDATE ON `sophic_medical`.`cartridge`
FOR EACH ROW
BEGIN
/*  Name: cartridge_after_update
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$device_hist` BIGINT(20);
    
    SELECT `id` INTO `$prev_id` FROM `cartridge_history` C 
		WHERE C.`cartridge` = OLD.`code` ORDER BY C.`history_dt` DESC LIMIT 1;  
	
  	SET `$device_hist` = get_device_hist_id(NEW.loaded_to_device);

	INSERT INTO `cartridge_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`cartridge`,
		`loaded_datetime`,
		`loaded_to_device_hist`)
	VALUES(
		`$prev_id`,
		now(),
		'UPDATED',
        NEW.`code`,
        NEW.`loaded_datetime`,
        `$device_hist`
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`cartridge_after_delete`
AFTER DELETE ON `cartridge`
FOR EACH ROW
BEGIN
/*  Name: cartridge_after_delete
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$device_hist` BIGINT(20);

    SELECT `id` INTO `$prev_id` FROM `cartridge_history` C 
		WHERE C.`cartridge` = OLD.`code` ORDER BY C.`history_dt` DESC LIMIT 1;  
        
  	SET `$device_hist` = get_device_hist_id(OLD.loaded_to_device);

	INSERT INTO `cartridge_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`cartridge`,
		`loaded_datetime`,
		`loaded_to_device_hist`)
	VALUES(
		`$prev_id`,
		now(),
		'DELETED',
        OLD.`code`,
        OLD.`loaded_datetime`,
        `$device_hist`
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cartridge__device`
--

DROP TABLE IF EXISTS `cartridge__device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartridge__device` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `cartridge` varchar(16) NOT NULL,
  `device` int(11) NOT NULL,
  `is_loaded` char(1) NOT NULL DEFAULT 'Y',
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartridge__device__cartridge__FK_IDX` (`cartridge`),
  KEY `cartridge__device__device__FK_IDX` (`device`),
  CONSTRAINT `cartridge__device__cartridge__FK` FOREIGN KEY (`cartridge`) REFERENCES `cartridge` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartridge__device__device__FK` FOREIGN KEY (`device`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartridge__device`
--

LOCK TABLES `cartridge__device` WRITE;
/*!40000 ALTER TABLE `cartridge__device` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartridge__device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartridge_history`
--

DROP TABLE IF EXISTS `cartridge_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartridge_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prev_id` bigint(20) DEFAULT NULL,
  `history_dt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'datetime when row has been created',
  `history_type` enum('CREATED','UPDATED','DELETED','ADDED_EXISTING') DEFAULT NULL,
  `cartridge` varchar(16) NOT NULL,
  `loaded_datetime` datetime DEFAULT NULL,
  `loaded_to_device_hist` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartridge_history__device_history_FK_idx` (`loaded_to_device_hist`),
  CONSTRAINT `cartridge_history__device_history_FK` FOREIGN KEY (`loaded_to_device_hist`) REFERENCES `device_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartridge_history`
--

LOCK TABLES `cartridge_history` WRITE;
/*!40000 ALTER TABLE `cartridge_history` DISABLE KEYS */;
INSERT INTO `cartridge_history` VALUES (1,NULL,'2018-01-25 19:44:18','CREATED','BBBBBAAAAA',NULL,NULL),(2,1,'2020-10-20 13:06:36','UPDATED','BBBBBAAAAA','2020-10-20 13:06:36',63);
/*!40000 ALTER TABLE `cartridge_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `region` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city__region__FK_IDX` (`region`),
  CONSTRAINT `city__region__FK` FOREIGN KEY (`region`) REFERENCES `region` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Tampa',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daw`
--

DROP TABLE IF EXISTS `daw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daw` (
  `code` tinyint(1) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daw`
--

LOCK TABLES `daw` WRITE;
/*!40000 ALTER TABLE `daw` DISABLE KEYS */;
INSERT INTO `daw` VALUES (0,'No product selection indicated','No special instructions',NULL),(1,'Brand product is \'medically necessary\'','No substitution is allowed by the prescriber',NULL),(2,'Substitution allowed','Patient requested product dispensed',NULL),(3,'Substitution allowed','Pharmacist selected product dispensed',NULL),(4,'Substitution allowed','Generic drug not in stock',NULL),(5,'Substitution allowed','Brand dispensed as pharmacy\'s generic',NULL),(6,'Override DAW Code','The all-purpose override code',NULL),(7,'Brand mandated by state law','The brand name must be dispensed due to state law',NULL),(8,'Generic Product not available in the market place','Generic Product not available due to a legal or license reason',NULL),(9,'Other','The all-purpose code used whenever an existing code doesn\'t accurately describe the note required',NULL);
/*!40000 ALTER TABLE `daw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree` (
  `code` varchar(2) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES ('DO','Doctor of Osteopathic Medicine',NULL),('MD','Doctor of Medicine',NULL);
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` int(11) DEFAULT NULL,
  `position` point DEFAULT NULL,
  `modem_number` bigint(11) DEFAULT NULL,
  `modem_imei` bigint(15) DEFAULT NULL,
  `modem_status` varchar(10) NOT NULL DEFAULT 'OFFLINE',
  `modem_offline_timeout` mediumint(5) NOT NULL DEFAULT '1800',
  `modem_behavior` varchar(10) NOT NULL DEFAULT 'ON',
  `wifi_enabled` char(1) NOT NULL DEFAULT 'N',
  `wifi_ssid` varchar(32) DEFAULT NULL,
  `wifi_security` varchar(8) NOT NULL DEFAULT 'None',
  `wifi_key` varchar(63) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `device__area__FK_IDX` (`area`),
  KEY `device__device_modem_behavior__FK_IDX` (`modem_behavior`),
  KEY `device__device_modem_status__FK_idx` (`modem_status`),
  KEY `device__device_wifi_security__FK_idx` (`wifi_security`),
  CONSTRAINT `device__area__FK` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  CONSTRAINT `device__device_modem_behavior__FK` FOREIGN KEY (`modem_behavior`) REFERENCES `device_modem_behavior` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `device__device_modem_status__FK` FOREIGN KEY (`modem_status`) REFERENCES `device_modem_status` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `device__device_wifi_security__FK` FOREIGN KEY (`wifi_security`) REFERENCES `device_wifi_security` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-22 18:13:19'),(2,2,NULL,NULL,NULL,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2017-07-27 19:07:36'),(3,3,NULL,NULL,NULL,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2017-07-27 19:07:36'),(4,4,NULL,NULL,NULL,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2020-10-13 17:40:00');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`device_after_insert`
AFTER INSERT ON `device`
FOR EACH ROW
BEGIN
/*  Name: device_after_insert
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	DECLARE `$area_hist` BIGINT(20) DEFAULT NULL;
    
  	SET `$area_hist` = get_area_hist_id(NEW.area);
    
    INSERT INTO `device_history`(
		  `prev_id`, 
		  `history_dt`, 
		  `history_type`,
		  `device`,
		  `area_hist`,
		  `position`,
          `modem_number`,
          `modem_imei`,
          `modem_status`,
          `modem_offline_timeout`,
		  `modem_behavior`,
          `wifi_enabled`,
          `wifi_ssid`,
          `wifi_security`,
          `wifi_key`,
          `is_active`,
		  `last_modified`
    )
    VALUES(
			NULL,
			now(),
			'CREATED',
			NEW.`id`,
			`$area_hist`,
			NEW.`position`,
            NEW.`modem_number`,
            NEW.`modem_imei`,
            NEW.`modem_status`,
            NEW.`modem_offline_timeout`,
			NEW.`modem_behavior`,
            NEW.`wifi_enabled`,
            NEW.`wifi_ssid`,
            NEW.`wifi_security`,
            NEW.`wifi_key`,
            NEW.`is_active`,
			NEW.`last_modified`
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`device_after_update`
AFTER UPDATE ON `sophic_medical`.`device`
FOR EACH ROW
BEGIN
/*  Name: device_after_update
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$area_hist` BIGINT(20);
    
    SELECT `id` INTO `$prev_id` FROM `device_history` D 
		WHERE D.`device` = OLD.`id` ORDER BY D.`history_dt` DESC LIMIT 1;  

	
  	SET `$area_hist` = get_area_hist_id(NEW.area);
	
--     DELETE FROM Log;
--     INSERT INTO log VALUES(now(), `$area_hist`);
-- 	   INSERT INTO log VALUES(now(), NEW.area);
    
    INSERT INTO `device_history`(
		  `prev_id`, 
		  `history_dt`, 
		  `history_type`,
		  `device`,
		  `area_hist`,
		  `position`,
          `modem_number`,
          `modem_imei`,
          `modem_status`,
          `modem_offline_timeout`,
		  `modem_behavior`,
          `wifi_enabled`,
          `wifi_ssid`,
          `wifi_security`,
          `wifi_key`,
          `is_active`,
		  `last_modified`
    )
    VALUES(
			`$prev_id`,
			now(),
			'UPDATED',
			NEW.`id`,
			`$area_hist`,
			NEW.`position`,
            NEW.`modem_number`,
            NEW.`modem_imei`,
            NEW.`modem_status`,
            NEW.`modem_offline_timeout`,
			NEW.`modem_behavior`,
            NEW.`wifi_enabled`,
            NEW.`wifi_ssid`,
            NEW.`wifi_security`,
            NEW.`wifi_key`,
            NEW.`is_active`,
			NEW.`last_modified`
    );
     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`device_after_delete`
AFTER DELETE ON `device`
FOR EACH ROW
BEGIN
/*  Name: device_after_delete
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
	DECLARE `$area_hist` BIGINT(20);

    SELECT `id` INTO `$prev_id` FROM `device_history` D 
		WHERE D.`device` = OLD.`id` ORDER BY D.`history_dt` DESC LIMIT 1;  
        
  	SET `$area_hist` = get_area_hist_id(OLD.area);

    INSERT INTO `device_history`(
		  `prev_id`, 
		  `history_dt`, 
		  `history_type`,
		  `device`,
		  `area_hist`,
		  `position`,
          `modem_number`,
          `modem_imei`,
          `modem_status`,
          `modem_offline_timeout`,
		  `modem_behavior`,
          `wifi_enabled`,
          `wifi_ssid`,
          `wifi_security`,
          `wifi_key`,
          `is_active`,
		  `last_modified`
    )
    VALUES(
			`$prev_id`,
			now(),
			'DELETED',
			OLD.`id`,
			`$area_hist`,
			OLD.`position`,
            OLD.`modem_number`,
            OLD.`modem_imei`,
            OLD.`modem_status`,
            OLD.`modem_offline_timeout`,
			OLD.`modem_behavior`,
            OLD.`wifi_enabled`,
            OLD.`wifi_ssid`,
            OLD.`wifi_security`,
            OLD.`wifi_key`,
            OLD.`is_active`,
			OLD.`last_modified`
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `device_action_notrcg`
--

DROP TABLE IF EXISTS `device_action_notrcg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_action_notrcg` (
  `code` varchar(10) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_action_notrcg`
--

LOCK TABLES `device_action_notrcg` WRITE;
/*!40000 ALTER TABLE `device_action_notrcg` DISABLE KEYS */;
INSERT INTO `device_action_notrcg` VALUES ('ALRT','Alert caregiver'),('DSP','Dispense medication'),('NOTDSP','Don\'t dispense medication');
/*!40000 ALTER TABLE `device_action_notrcg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_history`
--

DROP TABLE IF EXISTS `device_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prev_id` bigint(20) DEFAULT NULL,
  `history_dt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'datetime when row has been created',
  `history_type` enum('CREATED','UPDATED','DELETED','ADDED_EXISTING') DEFAULT NULL,
  `device` int(11) DEFAULT NULL COMMENT 'device id',
  `area_hist` bigint(20) DEFAULT NULL,
  `position` point DEFAULT NULL,
  `modem_number` bigint(11) DEFAULT NULL,
  `modem_imei` bigint(15) DEFAULT NULL,
  `modem_status` varchar(10) DEFAULT NULL,
  `modem_offline_timeout` mediumint(5) DEFAULT NULL,
  `modem_behavior` varchar(10) NOT NULL,
  `wifi_enabled` char(1) DEFAULT NULL,
  `wifi_ssid` varchar(32) DEFAULT NULL,
  `wifi_security` varchar(8) DEFAULT NULL,
  `wifi_key` varchar(63) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_history__device_modem_behavior__FK_IDX` (`modem_behavior`),
  KEY `device_history__device_history__FK` (`prev_id`),
  KEY `device_history__area_history__FK` (`area_hist`),
  KEY `device_history__device_modem_status__FK_IDX` (`modem_status`),
  KEY `device_history__device_wifi_security__FK_idx` (`wifi_security`),
  CONSTRAINT `device_history__area_history__FK` FOREIGN KEY (`area_hist`) REFERENCES `area_history` (`id`),
  CONSTRAINT `device_history__device_history__FK` FOREIGN KEY (`prev_id`) REFERENCES `device_history` (`id`),
  CONSTRAINT `device_history__device_modem_behavior__FK` FOREIGN KEY (`modem_behavior`) REFERENCES `device_modem_behavior` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `device_history__device_modem_status__FK` FOREIGN KEY (`modem_status`) REFERENCES `device_modem_status` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `device_history__device_wifi_security__FK` FOREIGN KEY (`wifi_security`) REFERENCES `device_wifi_security` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_history`
--

LOCK TABLES `device_history` WRITE;
/*!40000 ALTER TABLE `device_history` DISABLE KEYS */;
INSERT INTO `device_history` VALUES (1,NULL,'2018-01-25 19:44:18','CREATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2017-07-27 19:07:36'),(2,NULL,'2018-01-25 19:44:18','CREATED',2,2,NULL,NULL,NULL,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2017-07-27 19:07:36'),(3,NULL,'2018-01-25 19:44:18','CREATED',3,3,NULL,NULL,NULL,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2017-07-27 19:07:36'),(4,1,'2018-01-25 20:20:41','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-25 20:20:41'),(5,4,'2018-01-25 20:20:49','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-25 20:20:49'),(6,5,'2018-01-25 20:25:08','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-25 20:25:08'),(7,6,'2018-01-26 20:04:01','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 20:04:01'),(8,7,'2018-01-26 20:30:37','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 20:30:37'),(9,8,'2018-01-26 20:46:07','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 20:46:07'),(10,9,'2018-01-26 20:47:16','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 20:47:16'),(11,10,'2018-01-26 21:13:48','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 21:13:48'),(12,11,'2018-01-26 21:16:56','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 21:16:56'),(13,12,'2018-01-26 21:16:57','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 21:16:57'),(14,13,'2018-01-26 21:17:22','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 21:17:22'),(15,14,'2018-01-26 21:18:38','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N',NULL,'None',NULL,'Y','2018-01-26 21:18:38'),(16,15,'2018-01-26 21:22:17','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:22:17'),(17,16,'2018-01-26 21:22:32','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:22:32'),(18,17,'2018-01-26 21:39:47','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:39:47'),(19,18,'2018-01-26 21:39:59','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N','Xata','WPA2','Easytofly32167','Y','2018-01-26 21:39:59'),(20,19,'2018-01-26 21:41:26','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N','Xata','WPA2','Easytofly32167','Y','2018-01-26 21:41:26'),(21,20,'2018-01-26 21:42:03','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N','Xata','WPA2','Easytofly32167','Y','2018-01-26 21:42:03'),(22,21,'2018-01-26 21:42:39','UPDATED',1,1,NULL,421940632314,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:42:39'),(23,22,'2018-01-26 21:42:52','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:42:52'),(24,23,'2018-01-26 22:09:08','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:42:52'),(25,24,'2018-01-26 22:09:23','UPDATED',1,1,NULL,421940632314,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-26 21:42:52'),(26,25,'2018-01-30 20:38:54','UPDATED',1,1,NULL,380666037713,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-30 20:38:54'),(27,26,'2018-01-30 20:52:29','UPDATED',1,1,NULL,380666037713,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-30 20:52:29'),(28,27,'2018-01-30 20:53:33','UPDATED',1,1,NULL,380666037713,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-30 20:53:33'),(29,28,'2018-01-30 22:17:47','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-01-30 22:17:47'),(30,29,'2018-02-06 20:11:50','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-02-06 20:11:50'),(31,30,'2018-02-06 20:23:35','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-02-06 20:23:35'),(32,NULL,'2020-10-13 17:40:00','CREATED',4,4,NULL,NULL,NULL,'OFFLINE',1800,'ON','N',NULL,'None',NULL,'Y','2020-10-13 17:40:00'),(33,31,'2020-10-15 17:42:01','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2018-02-06 20:23:35'),(34,33,'2020-10-15 17:42:29','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2020-10-15 17:42:29'),(35,34,'2020-10-15 20:34:45','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2020-10-15 20:34:45'),(36,35,'2020-10-15 20:34:48','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','XataTest','WPA','Easytofly32167','Y','2020-10-15 20:34:48'),(37,36,'2020-10-15 20:40:21','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-15 20:40:21'),(38,37,'2020-10-15 21:40:16','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-15 21:40:16'),(39,38,'2020-10-16 12:49:23','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 12:49:23'),(40,39,'2020-10-16 13:47:10','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 13:47:10'),(41,40,'2020-10-16 13:56:02','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 13:56:02'),(42,41,'2020-10-16 13:56:16','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 13:56:16'),(43,42,'2020-10-16 13:57:40','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 13:57:40'),(44,43,'2020-10-16 15:38:23','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 15:38:23'),(45,44,'2020-10-16 15:39:30','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 15:39:30'),(46,45,'2020-10-16 16:51:04','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 16:51:04'),(47,46,'2020-10-16 17:45:15','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 17:45:15'),(48,47,'2020-10-16 17:52:46','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 17:52:46'),(49,48,'2020-10-16 20:00:11','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-16 20:00:11'),(50,49,'2020-10-17 06:16:18','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-17 06:16:18'),(51,50,'2020-10-17 06:16:19','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-17 06:16:19'),(52,51,'2020-10-19 14:09:24','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 14:09:24'),(53,52,'2020-10-19 14:10:53','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 14:10:53'),(54,53,'2020-10-19 16:47:02','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 16:47:02'),(55,54,'2020-10-19 16:47:17','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 16:47:17'),(56,55,'2020-10-19 16:50:47','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 16:50:47'),(57,56,'2020-10-19 16:51:01','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 16:51:01'),(58,57,'2020-10-19 18:30:06','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 18:30:06'),(59,58,'2020-10-19 19:03:19','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 19:03:19'),(60,59,'2020-10-19 19:29:11','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 19:29:11'),(61,60,'2020-10-19 19:29:39','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 19:29:39'),(62,61,'2020-10-19 21:24:18','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 21:24:18'),(63,62,'2020-10-19 21:24:21','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-19 21:24:21'),(64,63,'2020-10-20 13:08:38','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 13:08:38'),(65,64,'2020-10-20 13:08:48','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 13:08:48'),(66,65,'2020-10-20 14:06:58','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 14:06:58'),(67,66,'2020-10-20 14:07:14','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 14:07:14'),(68,67,'2020-10-20 15:18:06','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:18:06'),(69,68,'2020-10-20 15:25:55','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:25:55'),(70,69,'2020-10-20 15:32:29','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:32:29'),(71,70,'2020-10-20 15:32:48','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:32:48'),(72,71,'2020-10-20 15:37:02','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:37:02'),(73,72,'2020-10-20 15:37:19','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:37:19'),(74,73,'2020-10-20 15:39:14','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:39:14'),(75,74,'2020-10-20 15:39:28','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:39:28'),(76,75,'2020-10-20 15:46:57','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 15:46:57'),(77,76,'2020-10-20 16:07:26','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 16:07:26'),(78,77,'2020-10-20 16:20:15','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 16:20:15'),(79,78,'2020-10-20 16:47:07','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 16:47:07'),(80,79,'2020-10-20 16:58:32','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 16:58:32'),(81,80,'2020-10-20 17:19:11','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 17:19:11'),(82,81,'2020-10-20 18:01:42','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 18:01:42'),(83,82,'2020-10-20 18:24:32','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 18:24:32'),(84,83,'2020-10-20 19:05:01','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 19:05:01'),(85,84,'2020-10-20 19:05:03','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-20 19:05:03'),(86,85,'2020-10-22 12:28:47','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-22 12:28:47'),(87,86,'2020-10-22 12:35:48','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-22 12:35:48'),(88,87,'2020-10-22 16:37:35','UPDATED',1,1,NULL,15003487981,357041060003624,'ONLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-22 12:35:48'),(89,88,'2020-10-22 18:13:19','UPDATED',1,1,NULL,15003487981,357041060003624,'OFFLINE',1800,'ON','N','Zerg','WPA2','EasyToFly32167','Y','2020-10-22 18:13:19');
/*!40000 ALTER TABLE `device_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_modem_behavior`
--

DROP TABLE IF EXISTS `device_modem_behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_modem_behavior` (
  `code` varchar(10) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_modem_behavior`
--

LOCK TABLES `device_modem_behavior` WRITE;
/*!40000 ALTER TABLE `device_modem_behavior` DISABLE KEYS */;
INSERT INTO `device_modem_behavior` VALUES ('OFF','Always offline (manual start)'),('ON','Always online'),('SCHD','Scheduled');
/*!40000 ALTER TABLE `device_modem_behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_modem_local_traffic`
--

DROP TABLE IF EXISTS `device_modem_local_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_modem_local_traffic` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `device` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `rx_bytes_counter` bigint(18) NOT NULL,
  `tx_bytes_counter` bigint(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_modem_local_traffic`
--

LOCK TABLES `device_modem_local_traffic` WRITE;
/*!40000 ALTER TABLE `device_modem_local_traffic` DISABLE KEYS */;
INSERT INTO `device_modem_local_traffic` VALUES (1,1,'2018-01-23 00:53:50',2935,5252),(2,1,'2018-01-26 21:39:23',3397,5503),(3,1,'2018-01-26 21:39:43',15241,29553),(4,1,'2018-01-26 21:40:03',19311,36951),(5,1,'2018-01-26 21:40:24',20427,38677),(6,1,'2018-01-26 21:40:44',21173,40237),(7,1,'2018-01-26 21:41:04',21803,41447);
/*!40000 ALTER TABLE `device_modem_local_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_modem_provider_traffic`
--

DROP TABLE IF EXISTS `device_modem_provider_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_modem_provider_traffic` (
  `id` bigint(18) NOT NULL,
  `device` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `bytes_counter` bigint(18) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_modem_provider_traffic__device__FK_idx` (`device`),
  CONSTRAINT `device_modem_provider_traffic__device__FK` FOREIGN KEY (`device`) REFERENCES `device` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_modem_provider_traffic`
--

LOCK TABLES `device_modem_provider_traffic` WRITE;
/*!40000 ALTER TABLE `device_modem_provider_traffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_modem_provider_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_modem_status`
--

DROP TABLE IF EXISTS `device_modem_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_modem_status` (
  `code` varchar(10) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_modem_status`
--

LOCK TABLES `device_modem_status` WRITE;
/*!40000 ALTER TABLE `device_modem_status` DISABLE KEYS */;
INSERT INTO `device_modem_status` VALUES ('OFFLINE','Offline'),('ONLINE','Online');
/*!40000 ALTER TABLE `device_modem_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_temperature`
--

DROP TABLE IF EXISTS `device_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_temperature` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `device` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `temperature_c` decimal(3,1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_temperature__device__FK_IDX` (`device`),
  CONSTRAINT `device_temperature__device__FK` FOREIGN KEY (`device`) REFERENCES `device` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_temperature`
--

LOCK TABLES `device_temperature` WRITE;
/*!40000 ALTER TABLE `device_temperature` DISABLE KEYS */;
INSERT INTO `device_temperature` VALUES (1,1,'2020-10-16 15:27:58',29.4),(2,1,'2020-10-16 15:28:13',29.4),(3,1,'2020-10-16 15:28:28',29.4),(4,1,'2020-10-16 15:28:43',29.4),(5,1,'2020-10-16 15:28:58',29.5),(6,1,'2020-10-16 15:29:13',30.0),(7,1,'2020-10-16 15:29:28',30.6),(8,1,'2020-10-16 15:29:43',31.1),(9,1,'2020-10-16 15:29:58',31.8),(10,1,'2020-10-16 15:30:13',32.3),(11,1,'2020-10-16 15:30:28',32.6),(12,1,'2020-10-16 15:30:43',33.0),(13,1,'2020-10-16 15:30:58',32.9),(14,1,'2020-10-16 15:31:13',32.6),(15,1,'2020-10-16 15:31:28',32.4),(16,1,'2020-10-16 15:31:43',32.1),(17,1,'2020-10-16 15:31:58',32.1),(18,1,'2020-10-16 15:32:13',32.0),(19,1,'2020-10-16 15:32:28',31.8),(20,1,'2020-10-16 15:32:43',31.6),(21,1,'2020-10-16 15:32:58',31.5),(22,1,'2020-10-16 15:33:13',31.4),(23,1,'2020-10-16 15:33:28',31.3),(24,1,'2020-10-16 15:33:43',31.1),(25,1,'2020-10-16 15:33:58',31.0),(26,1,'2020-10-16 15:34:13',30.9),(27,1,'2020-10-16 15:34:28',30.9),(28,1,'2020-10-16 15:34:43',30.8),(29,1,'2020-10-16 15:34:58',30.8),(30,1,'2020-10-16 15:35:13',30.6),(31,1,'2020-10-16 15:35:28',30.5),(32,1,'2020-10-16 15:35:43',30.5),(33,1,'2020-10-16 15:35:58',30.4),(34,1,'2020-10-16 15:36:13',30.4),(35,1,'2020-10-16 15:36:28',30.4),(36,1,'2020-10-16 15:36:44',30.5),(37,1,'2020-10-16 15:36:59',30.6),(38,1,'2020-10-16 15:37:14',30.8),(39,1,'2020-10-16 15:37:29',30.9),(40,1,'2020-10-16 15:37:44',31.0),(41,1,'2020-10-16 15:37:59',31.1),(42,1,'2020-10-16 15:38:14',31.3),(43,1,'2020-10-16 15:38:29',31.5),(44,1,'2020-10-16 15:38:44',31.5),(45,1,'2020-10-16 15:38:59',31.8),(46,1,'2020-10-16 15:39:14',31.9),(47,1,'2020-10-16 15:39:29',32.0),(48,1,'2020-10-16 15:39:44',32.0),(49,1,'2020-10-16 15:39:59',32.0),(50,1,'2020-10-16 15:40:14',32.0),(51,1,'2020-10-16 15:40:29',32.1),(52,1,'2020-10-16 15:40:44',32.1),(53,1,'2020-10-16 15:40:59',32.3),(54,1,'2020-10-16 15:41:14',32.4),(55,1,'2020-10-16 15:41:29',32.4),(56,1,'2020-10-16 15:41:44',32.5),(57,1,'2020-10-16 15:41:59',32.5),(58,1,'2020-10-16 15:42:14',32.6),(59,1,'2020-10-16 15:42:29',32.6),(60,1,'2020-10-16 15:42:44',32.6),(61,1,'2020-10-16 15:42:59',32.8),(62,1,'2020-10-16 15:43:14',32.8),(63,1,'2020-10-16 15:43:29',32.8),(64,1,'2020-10-16 15:43:44',32.8),(65,1,'2020-10-16 15:43:59',32.8),(66,1,'2020-10-16 15:44:14',32.9),(67,1,'2020-10-16 15:44:29',32.9),(68,1,'2020-10-16 15:44:44',33.0),(69,1,'2020-10-16 15:44:59',33.0),(70,1,'2020-10-16 15:45:14',33.1),(71,1,'2020-10-16 15:45:29',33.0),(72,1,'2020-10-16 15:45:44',33.1),(73,1,'2020-10-16 15:45:59',33.1),(74,1,'2020-10-16 15:46:14',33.1),(75,1,'2020-10-16 15:46:29',33.1),(76,1,'2020-10-16 15:46:44',33.1),(77,1,'2020-10-16 15:46:59',33.1),(78,1,'2020-10-16 15:47:14',33.1),(79,1,'2020-10-16 15:47:29',33.1),(80,1,'2020-10-16 15:47:44',33.3),(81,1,'2020-10-16 15:47:59',33.1),(82,1,'2020-10-16 15:48:14',33.3),(83,1,'2020-10-16 15:48:29',33.1),(84,1,'2020-10-16 15:48:44',33.3),(85,1,'2020-10-16 15:48:59',33.1),(86,1,'2020-10-16 15:49:14',33.1),(87,1,'2020-10-16 15:49:29',33.1),(88,1,'2020-10-16 15:49:44',33.0),(89,1,'2020-10-16 15:49:59',33.0),(90,1,'2020-10-16 15:50:14',33.0),(91,1,'2020-10-16 15:50:29',32.9),(92,1,'2020-10-16 15:50:44',32.8),(93,1,'2020-10-16 15:51:00',32.6),(94,1,'2020-10-16 15:51:15',32.5),(95,1,'2020-10-16 15:51:30',32.4),(96,1,'2020-10-16 15:51:45',32.3),(97,1,'2020-10-16 15:52:00',32.1),(98,1,'2020-10-16 15:52:15',32.0),(99,1,'2020-10-16 15:52:30',31.9),(100,1,'2020-10-16 15:52:45',31.8),(101,1,'2020-10-16 15:53:00',31.6),(102,1,'2020-10-16 15:53:15',31.5),(103,1,'2020-10-16 15:53:30',31.5),(104,1,'2020-10-16 15:53:45',31.4),(105,1,'2020-10-16 15:54:00',31.4),(106,1,'2020-10-16 15:54:15',31.4),(107,1,'2020-10-16 15:54:30',31.4),(108,1,'2020-10-16 15:54:45',31.3),(109,1,'2020-10-16 15:55:00',31.1),(110,1,'2020-10-16 15:55:15',31.1),(111,1,'2020-10-16 15:55:30',31.1),(112,1,'2020-10-16 15:55:45',31.0),(113,1,'2020-10-16 15:56:00',31.0),(114,1,'2020-10-16 15:56:15',31.0),(115,1,'2020-10-16 15:56:30',31.0),(116,1,'2020-10-16 15:56:45',31.0),(117,1,'2020-10-16 15:57:00',31.0),(118,1,'2020-10-16 15:57:15',30.9),(119,1,'2020-10-16 15:57:30',30.9),(120,1,'2020-10-16 15:57:45',30.9),(121,1,'2020-10-16 15:58:00',30.9),(122,1,'2020-10-16 15:58:15',30.8),(123,1,'2020-10-16 15:58:30',30.8),(124,1,'2020-10-16 15:58:45',30.8),(125,1,'2020-10-16 15:59:00',30.8),(126,1,'2020-10-16 15:59:15',30.6),(127,1,'2020-10-16 15:59:30',30.6),(128,1,'2020-10-16 15:59:45',30.6),(129,1,'2020-10-16 16:00:00',30.6),(130,1,'2020-10-16 16:00:15',30.6),(131,1,'2020-10-16 16:00:30',30.6),(132,1,'2020-10-16 16:00:45',30.5),(133,1,'2020-10-16 16:01:00',30.5),(134,1,'2020-10-16 16:01:15',30.5),(135,1,'2020-10-16 16:01:30',30.4),(136,1,'2020-10-16 16:01:45',30.4),(137,1,'2020-10-16 16:02:00',30.3),(138,1,'2020-10-16 16:02:15',30.3),(139,1,'2020-10-16 16:02:30',30.3),(140,1,'2020-10-16 16:02:45',30.1),(141,1,'2020-10-16 16:03:00',30.1),(142,1,'2020-10-16 16:03:15',30.1),(143,1,'2020-10-16 16:03:30',30.1),(144,1,'2020-10-16 16:03:45',30.0),(145,1,'2020-10-16 16:04:00',30.0),(146,1,'2020-10-16 16:04:15',30.0),(147,1,'2020-10-16 16:04:30',30.0),(148,1,'2020-10-16 16:04:45',30.0),(149,1,'2020-10-16 16:05:00',29.9),(150,1,'2020-10-16 16:05:16',29.9),(151,1,'2020-10-16 16:05:31',29.9),(152,1,'2020-10-16 16:05:46',29.8),(153,1,'2020-10-16 16:06:01',29.8),(154,1,'2020-10-16 16:06:16',29.8),(155,1,'2020-10-16 16:06:31',29.8),(156,1,'2020-10-16 16:06:46',29.8),(157,1,'2020-10-16 16:07:01',29.8),(158,1,'2020-10-16 16:07:16',29.8),(159,1,'2020-10-16 16:07:31',29.6),(160,1,'2020-10-16 16:07:46',29.6),(161,1,'2020-10-16 16:08:01',29.6),(162,1,'2020-10-16 16:08:16',29.6),(163,1,'2020-10-16 16:08:31',29.6),(164,1,'2020-10-16 16:08:46',29.6),(165,1,'2020-10-16 16:09:01',29.6),(166,1,'2020-10-16 16:09:16',29.6),(167,1,'2020-10-16 16:09:31',29.6),(168,1,'2020-10-16 16:09:46',29.6),(169,1,'2020-10-16 16:10:01',29.5),(170,1,'2020-10-16 16:10:16',29.6),(171,1,'2020-10-16 16:10:31',29.6),(172,1,'2020-10-16 16:10:46',29.5),(173,1,'2020-10-16 16:11:01',29.5),(174,1,'2020-10-16 16:11:16',29.5),(175,1,'2020-10-16 16:11:31',29.4),(176,1,'2020-10-16 16:11:46',29.4),(177,1,'2020-10-16 16:12:01',29.4),(178,1,'2020-10-16 16:12:16',29.5),(179,1,'2020-10-16 16:12:31',29.4),(180,1,'2020-10-16 16:12:46',29.4),(181,1,'2020-10-16 16:13:01',29.4),(182,1,'2020-10-16 16:13:16',29.5),(183,1,'2020-10-16 16:13:31',29.4),(184,1,'2020-10-16 16:13:46',29.5),(185,1,'2020-10-16 16:14:01',29.4),(186,1,'2020-10-16 16:14:16',29.4),(187,1,'2020-10-16 16:14:31',29.4),(188,1,'2020-10-16 16:14:46',29.5),(189,1,'2020-10-16 16:15:01',29.5),(190,1,'2020-10-16 16:15:16',29.5),(191,1,'2020-10-16 16:15:31',29.4),(192,1,'2020-10-16 16:15:46',29.4),(193,1,'2020-10-16 16:16:01',29.4),(194,1,'2020-10-16 16:16:16',29.5),(195,1,'2020-10-16 16:16:31',29.5),(196,1,'2020-10-16 16:16:46',29.4),(197,1,'2020-10-16 16:17:01',29.4),(198,1,'2020-10-16 16:17:16',29.4),(199,1,'2020-10-16 16:17:31',29.4),(200,1,'2020-10-16 16:17:46',29.4),(201,1,'2020-10-16 16:18:01',29.4),(202,1,'2020-10-16 16:18:16',29.4),(203,1,'2020-10-16 16:18:31',29.4),(204,1,'2020-10-16 16:18:46',29.4),(205,1,'2020-10-16 16:19:01',29.4),(206,1,'2020-10-16 16:19:16',29.4),(207,1,'2020-10-16 16:19:31',29.4),(208,1,'2020-10-16 16:19:47',29.4),(209,1,'2020-10-16 16:20:02',29.4),(210,1,'2020-10-16 16:20:17',29.4),(211,1,'2020-10-16 16:20:32',29.4),(212,1,'2020-10-16 16:20:47',29.4),(213,1,'2020-10-16 16:21:02',29.4),(214,1,'2020-10-16 16:21:17',29.4),(215,1,'2020-10-16 16:21:32',29.4),(216,1,'2020-10-16 16:21:47',29.5),(217,1,'2020-10-16 16:22:02',29.5),(218,1,'2020-10-16 16:22:17',29.5),(219,1,'2020-10-16 16:22:32',29.5),(220,1,'2020-10-16 16:22:47',29.5),(221,1,'2020-10-16 16:23:02',29.5),(222,1,'2020-10-16 16:23:17',29.4),(223,1,'2020-10-16 16:23:32',29.4),(224,1,'2020-10-16 16:23:47',29.4),(225,1,'2020-10-16 16:24:02',29.5),(226,1,'2020-10-16 16:24:17',29.5),(227,1,'2020-10-16 16:24:32',29.5),(228,1,'2020-10-16 16:24:47',29.4),(229,1,'2020-10-16 16:25:02',29.5),(230,1,'2020-10-16 16:25:17',29.5),(231,1,'2020-10-16 16:25:32',29.5),(232,1,'2020-10-16 16:25:47',29.4),(233,1,'2020-10-16 16:26:02',29.5),(234,1,'2020-10-16 16:26:17',29.5),(235,1,'2020-10-16 16:26:32',29.5),(236,1,'2020-10-16 16:26:47',29.5),(237,1,'2020-10-16 16:27:02',29.4),(238,1,'2020-10-16 16:27:17',29.4),(239,1,'2020-10-16 16:27:32',29.4),(240,1,'2020-10-16 16:27:47',29.5),(241,1,'2020-10-16 16:28:02',29.5),(242,1,'2020-10-16 16:28:17',29.5),(243,1,'2020-10-16 16:28:32',29.5),(244,1,'2020-10-16 16:28:47',29.5),(245,1,'2020-10-16 16:29:02',29.6),(246,1,'2020-10-16 16:29:17',29.6),(247,1,'2020-10-16 16:29:32',29.6),(248,1,'2020-10-16 16:29:47',29.6),(249,1,'2020-10-16 16:30:02',29.5),(250,1,'2020-10-16 16:30:17',29.5),(251,1,'2020-10-16 16:30:32',29.5),(252,1,'2020-10-16 16:30:47',29.6),(253,1,'2020-10-16 16:31:02',29.5),(254,1,'2020-10-16 16:31:17',29.5),(255,1,'2020-10-16 16:31:32',29.5),(256,1,'2020-10-16 16:31:47',29.5),(257,1,'2020-10-16 16:32:02',29.5),(258,1,'2020-10-16 16:32:17',29.6),(259,1,'2020-10-16 16:32:32',29.5),(260,1,'2020-10-16 16:32:47',29.6),(261,1,'2020-10-16 16:33:02',29.6),(262,1,'2020-10-16 16:33:17',29.6),(263,1,'2020-10-16 16:33:32',29.5),(264,1,'2020-10-16 16:33:47',29.5),(265,1,'2020-10-16 16:34:02',29.5),(266,1,'2020-10-16 16:34:18',29.5),(267,1,'2020-10-16 16:34:33',29.5),(268,1,'2020-10-16 16:34:48',29.5),(269,1,'2020-10-16 16:35:03',29.6),(270,1,'2020-10-16 16:35:18',29.5),(271,1,'2020-10-16 16:35:33',29.5),(272,1,'2020-10-16 16:35:48',29.5),(273,1,'2020-10-16 16:36:03',29.5),(274,1,'2020-10-16 16:36:18',29.5),(275,1,'2020-10-16 16:36:33',29.5),(276,1,'2020-10-16 16:36:48',29.5),(277,1,'2020-10-16 16:37:03',29.5),(278,1,'2020-10-16 16:37:18',29.5),(279,1,'2020-10-16 16:37:33',29.5),(280,1,'2020-10-16 16:37:48',29.5),(281,1,'2020-10-16 16:38:03',29.5),(282,1,'2020-10-16 16:38:18',29.5),(283,1,'2020-10-16 16:38:33',29.5),(284,1,'2020-10-16 16:38:48',29.5),(285,1,'2020-10-16 16:39:03',29.5),(286,1,'2020-10-16 16:39:18',29.5),(287,1,'2020-10-16 16:39:33',29.5),(288,1,'2020-10-16 16:39:48',29.5),(289,1,'2020-10-16 16:40:03',29.6),(290,1,'2020-10-16 16:40:18',29.6),(291,1,'2020-10-16 16:40:33',29.6),(292,1,'2020-10-16 16:40:48',29.6),(293,1,'2020-10-16 16:41:03',29.6),(294,1,'2020-10-16 16:41:18',29.6),(295,1,'2020-10-16 16:41:33',29.5),(296,1,'2020-10-16 16:41:48',29.6),(297,1,'2020-10-16 16:42:03',29.6),(298,1,'2020-10-16 16:42:18',29.6),(299,1,'2020-10-16 16:42:33',29.6),(300,1,'2020-10-16 16:42:48',29.6),(301,1,'2020-10-16 16:43:03',29.6),(302,1,'2020-10-16 16:43:18',29.6),(303,1,'2020-10-16 16:43:33',29.6),(304,1,'2020-10-16 16:43:48',29.6),(305,1,'2020-10-16 16:44:03',29.6),(306,1,'2020-10-16 16:44:18',29.6),(307,1,'2020-10-16 16:44:33',29.6),(308,1,'2020-10-16 16:44:48',29.6),(309,1,'2020-10-16 16:45:03',29.6),(310,1,'2020-10-16 16:45:18',29.6),(311,1,'2020-10-16 16:45:33',29.6),(312,1,'2020-10-16 16:45:48',29.6),(313,1,'2020-10-16 16:46:03',29.6),(314,1,'2020-10-16 16:46:18',29.8),(315,1,'2020-10-16 16:46:33',29.6),(316,1,'2020-10-16 16:46:48',29.6),(317,1,'2020-10-16 16:47:03',29.6),(318,1,'2020-10-16 16:47:18',29.6),(319,1,'2020-10-16 16:47:33',29.8),(320,1,'2020-10-16 16:47:48',29.8),(321,1,'2020-10-16 16:48:03',29.8),(322,1,'2020-10-16 16:48:18',29.8),(323,1,'2020-10-16 16:48:33',29.8),(324,1,'2020-10-16 16:48:49',29.8),(325,1,'2020-10-16 16:49:04',29.8),(326,1,'2020-10-16 16:49:19',29.8),(327,1,'2020-10-16 16:49:34',29.8),(328,1,'2020-10-16 16:49:49',29.6),(329,1,'2020-10-16 16:50:04',29.6),(330,1,'2020-10-16 16:50:19',29.8),(331,1,'2020-10-16 16:50:34',29.8),(332,1,'2020-10-16 16:50:49',29.8),(333,1,'2020-10-16 16:51:04',29.8);
/*!40000 ALTER TABLE `device_temperature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_wifi_local_traffic`
--

DROP TABLE IF EXISTS `device_wifi_local_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_wifi_local_traffic` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `device` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `rx_bytes_counter` bigint(18) NOT NULL,
  `tx_bytes_counter` bigint(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23439 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_wifi_local_traffic`
--

LOCK TABLES `device_wifi_local_traffic` WRITE;
/*!40000 ALTER TABLE `device_wifi_local_traffic` DISABLE KEYS */;
INSERT INTO `device_wifi_local_traffic` VALUES (21440,1,'2020-10-22 06:57:21',1502897,2259027),(21441,1,'2020-10-22 06:57:41',1503661,2260331),(21442,1,'2020-10-22 06:58:01',1504461,2261541),(21443,1,'2020-10-22 06:58:21',1505381,2262685),(21444,1,'2020-10-22 06:58:41',1506301,2263829),(21445,1,'2020-10-22 06:59:01',1506921,2264973),(21446,1,'2020-10-22 06:59:21',1507601,2266117),(21447,1,'2020-10-22 06:59:42',1508365,2267421),(21448,1,'2020-10-22 07:00:02',1509165,2268631),(21449,1,'2020-10-22 07:00:22',1510145,2269775),(21450,1,'2020-10-22 07:00:42',1511185,2270981),(21451,1,'2020-10-22 07:01:02',1511805,2272125),(21452,1,'2020-10-22 07:01:22',1512425,2273269),(21453,1,'2020-10-22 07:01:42',1513045,2274413),(21454,1,'2020-10-22 07:02:02',1513845,2275557),(21455,1,'2020-10-22 07:02:22',1514885,2276767),(21456,1,'2020-10-22 07:02:42',1515895,2278021),(21457,1,'2020-10-22 07:03:02',1516515,2279165),(21458,1,'2020-10-22 07:03:22',1517135,2280309),(21459,1,'2020-10-22 07:03:43',1517839,2281613),(21460,1,'2020-10-22 07:04:03',1518579,2282757),(21461,1,'2020-10-22 07:04:23',1519679,2283967),(21462,1,'2020-10-22 07:04:43',1520539,2285111),(21463,1,'2020-10-22 07:05:03',1521159,2286255),(21464,1,'2020-10-22 07:05:23',1521779,2287399),(21465,1,'2020-10-22 07:05:43',1522543,2288703),(21466,1,'2020-10-22 07:06:03',1523283,2289847),(21467,1,'2020-10-22 07:06:23',1524383,2291057),(21468,1,'2020-10-22 07:06:43',1525363,2292263),(21469,1,'2020-10-22 07:07:03',1525983,2293407),(21470,1,'2020-10-22 07:07:23',1526603,2294551),(21471,1,'2020-10-22 07:07:44',1527367,2295855),(21472,1,'2020-10-22 07:08:04',1528107,2296999),(21473,1,'2020-10-22 07:08:24',1529207,2298209),(21474,1,'2020-10-22 07:08:44',1530127,2299353),(21475,1,'2020-10-22 07:09:04',1530747,2300497),(21476,1,'2020-10-22 07:09:24',1531307,2301641),(21477,1,'2020-10-22 07:09:44',1532071,2302945),(21478,1,'2020-10-22 07:10:04',1532811,2304089),(21479,1,'2020-10-22 07:10:24',1533911,2305299),(21480,1,'2020-10-22 07:10:44',1534831,2306443),(21481,1,'2020-10-22 07:11:04',1535451,2307587),(21482,1,'2020-10-22 07:11:24',1536071,2308731),(21483,1,'2020-10-22 07:11:44',1536631,2309875),(21484,1,'2020-10-22 07:12:05',1537371,2311019),(21485,1,'2020-10-22 07:12:25',1538531,2312225),(21486,1,'2020-10-22 07:12:45',1539331,2313435),(21487,1,'2020-10-22 07:13:05',1539951,2314579),(21488,1,'2020-10-22 07:13:25',1540571,2315723),(21489,1,'2020-10-22 07:13:45',1541191,2316867),(21490,1,'2020-10-22 07:14:05',1541871,2318011),(21491,1,'2020-10-22 07:14:25',1542971,2319155),(21492,1,'2020-10-22 07:14:45',1543891,2320365),(21493,1,'2020-10-22 07:15:05',1544511,2321509),(21494,1,'2020-10-22 07:15:25',1545131,2322653),(21495,1,'2020-10-22 07:15:45',1545751,2323797),(21496,1,'2020-10-22 07:16:06',1546491,2324941),(21497,1,'2020-10-22 07:16:26',1547591,2326085),(21498,1,'2020-10-22 07:16:46',1548391,2327295),(21499,1,'2020-10-22 07:17:06',1548951,2328439),(21500,1,'2020-10-22 07:17:26',1549571,2329583),(21501,1,'2020-10-22 07:17:46',1550191,2330727),(21502,1,'2020-10-22 07:18:06',1550991,2331933),(21503,1,'2020-10-22 07:18:26',1552211,2333077),(21504,1,'2020-10-22 07:18:46',1552951,2334287),(21505,1,'2020-10-22 07:19:06',1553631,2335431),(21506,1,'2020-10-22 07:19:26',1554191,2336575),(21507,1,'2020-10-22 07:19:46',1554955,2338039),(21508,1,'2020-10-22 07:20:06',1555695,2339183),(21509,1,'2020-10-22 07:20:27',1556975,2340327),(21510,1,'2020-10-22 07:20:47',1557715,2341471),(21511,1,'2020-10-22 07:21:07',1558335,2342681),(21512,1,'2020-10-22 07:21:27',1558955,2343825),(21513,1,'2020-10-22 07:21:47',1559575,2344969),(21514,1,'2020-10-22 07:22:07',1560315,2346113),(21515,1,'2020-10-22 07:22:27',1561595,2347257),(21516,1,'2020-10-22 07:22:47',1562215,2348401),(21517,1,'2020-10-22 07:23:07',1562895,2349611),(21518,1,'2020-10-22 07:23:27',1563515,2350755),(21519,1,'2020-10-22 07:23:47',1564219,2352219),(21520,1,'2020-10-22 07:24:08',1565019,2353363),(21521,1,'2020-10-22 07:24:28',1566359,2354507),(21522,1,'2020-10-22 07:24:48',1567039,2355651),(21523,1,'2020-10-22 07:25:08',1567719,2356861),(21524,1,'2020-10-22 07:25:28',1568399,2358067),(21525,1,'2020-10-22 07:25:48',1569019,2359211),(21526,1,'2020-10-22 07:26:08',1569759,2360355),(21527,1,'2020-10-22 07:26:28',1571099,2361499),(21528,1,'2020-10-22 07:26:48',1571719,2362643),(21529,1,'2020-10-22 07:27:08',1572399,2363853),(21530,1,'2020-10-22 07:27:28',1573019,2364997),(21531,1,'2020-10-22 07:27:49',1573639,2366141),(21532,1,'2020-10-22 07:28:09',1574379,2367285),(21533,1,'2020-10-22 07:28:29',1575719,2368429),(21534,1,'2020-10-22 07:28:49',1576339,2369573),(21535,1,'2020-10-22 07:29:09',1577079,2370845),(21536,1,'2020-10-22 07:29:29',1577699,2371989),(21537,1,'2020-10-22 07:29:49',1578319,2373133),(21538,1,'2020-10-22 07:30:09',1579059,2374277),(21539,1,'2020-10-22 07:30:29',1580279,2375421),(21540,1,'2020-10-22 07:30:49',1580899,2376565),(21541,1,'2020-10-22 07:31:09',1581519,2377709),(21542,1,'2020-10-22 07:31:30',1582199,2378919),(21543,1,'2020-10-22 07:31:50',1582819,2380063),(21544,1,'2020-10-22 07:32:10',1583559,2381207),(21545,1,'2020-10-22 07:32:30',1584839,2382351),(21546,1,'2020-10-22 07:32:50',1585459,2383495),(21547,1,'2020-10-22 07:33:10',1586139,2384701),(21548,1,'2020-10-22 07:33:30',1586819,2385911),(21549,1,'2020-10-22 07:33:50',1587379,2387055),(21550,1,'2020-10-22 07:34:10',1588119,2388199),(21551,1,'2020-10-22 07:34:30',1589459,2389343),(21552,1,'2020-10-22 07:34:50',1590139,2390487),(21553,1,'2020-10-22 07:35:10',1590759,2391631),(21554,1,'2020-10-22 07:35:31',1591439,2392841),(21555,1,'2020-10-22 07:35:51',1592209,2393985),(21556,1,'2020-10-22 07:36:11',1592949,2395129),(21557,1,'2020-10-22 07:36:31',1594289,2396273),(21558,1,'2020-10-22 07:36:51',1594939,2397527),(21559,1,'2020-10-22 07:37:11',1595559,2398671),(21560,1,'2020-10-22 07:37:31',1596397,2400139),(21561,1,'2020-10-22 07:37:51',1597083,2401283),(21562,1,'2020-10-22 07:38:11',1597823,2402427),(21563,1,'2020-10-22 07:38:31',1599103,2403571),(21564,1,'2020-10-22 07:38:51',1599723,2404715),(21565,1,'2020-10-22 07:39:11',1600343,2405859),(21566,1,'2020-10-22 07:39:32',1601101,2407163),(21567,1,'2020-10-22 07:39:52',1601847,2408435),(21568,1,'2020-10-22 07:40:12',1602587,2409579),(21569,1,'2020-10-22 07:40:32',1603927,2410723),(21570,1,'2020-10-22 07:40:52',1604547,2411867),(21571,1,'2020-10-22 07:41:12',1605167,2413011),(21572,1,'2020-10-22 07:41:32',1605955,2414315),(21573,1,'2020-10-22 07:41:52',1606701,2415525),(21574,1,'2020-10-22 07:42:12',1607441,2416669),(21575,1,'2020-10-22 07:42:32',1608781,2417813),(21576,1,'2020-10-22 07:42:52',1609401,2418957),(21577,1,'2020-10-22 07:43:12',1609961,2420101),(21578,1,'2020-10-22 07:43:33',1610581,2421245),(21579,1,'2020-10-22 07:43:53',1611261,2422455),(21580,1,'2020-10-22 07:44:13',1611941,2423599),(21581,1,'2020-10-22 07:44:33',1613341,2424743),(21582,1,'2020-10-22 07:44:53',1614021,2425887),(21583,1,'2020-10-22 07:45:13',1614641,2427031),(21584,1,'2020-10-22 07:45:33',1615339,2428335),(21585,1,'2020-10-22 07:45:53',1616085,2429545),(21586,1,'2020-10-22 07:46:13',1616825,2430689),(21587,1,'2020-10-22 07:46:33',1618165,2431833),(21588,1,'2020-10-22 07:46:53',1618845,2433039),(21589,1,'2020-10-22 07:47:13',1619465,2434183),(21590,1,'2020-10-22 07:47:34',1620085,2435327),(21591,1,'2020-10-22 07:47:54',1620765,2436471),(21592,1,'2020-10-22 07:48:14',1621505,2437681),(21593,1,'2020-10-22 07:48:34',1622725,2438825),(21594,1,'2020-10-22 07:48:54',1623345,2439969),(21595,1,'2020-10-22 07:49:14',1623965,2441113),(21596,1,'2020-10-22 07:49:34',1624585,2442257),(21597,1,'2020-10-22 07:49:54',1625205,2443401),(21598,1,'2020-10-22 07:50:14',1626005,2444611),(21599,1,'2020-10-22 07:50:34',1627345,2445755),(21600,1,'2020-10-22 07:50:54',1627905,2446899),(21601,1,'2020-10-22 07:51:14',1628525,2448043),(21602,1,'2020-10-22 07:51:35',1629145,2449187),(21603,1,'2020-10-22 07:51:55',1629765,2450331),(21604,1,'2020-10-22 07:52:15',1630625,2451603),(21605,1,'2020-10-22 07:52:35',1631965,2452747),(21606,1,'2020-10-22 07:52:55',1632585,2453891),(21607,1,'2020-10-22 07:53:15',1633205,2455035),(21608,1,'2020-10-22 07:53:35',1633825,2456179),(21609,1,'2020-10-22 07:53:55',1634445,2457323),(21610,1,'2020-10-22 07:54:15',1635305,2458533),(21611,1,'2020-10-22 07:54:35',1636585,2459677),(21612,1,'2020-10-22 07:54:55',1637265,2460821),(21613,1,'2020-10-22 07:55:15',1637885,2461965),(21614,1,'2020-10-22 07:55:36',1638445,2463109),(21615,1,'2020-10-22 07:55:56',1639065,2464253),(21616,1,'2020-10-22 07:56:16',1639925,2465463),(21617,1,'2020-10-22 07:56:36',1641085,2466607),(21618,1,'2020-10-22 07:56:56',1641705,2467751),(21619,1,'2020-10-22 07:57:16',1642265,2468895),(21620,1,'2020-10-22 07:57:36',1642885,2470101),(21621,1,'2020-10-22 07:57:56',1643505,2471245),(21622,1,'2020-10-22 07:58:16',1644515,2472389),(21623,1,'2020-10-22 07:58:36',1645735,2473599),(21624,1,'2020-10-22 07:58:56',1646355,2474743),(21625,1,'2020-10-22 07:59:16',1646975,2475887),(21626,1,'2020-10-22 07:59:37',1647595,2477031),(21627,1,'2020-10-22 07:59:57',1648215,2478175),(21628,1,'2020-10-22 08:00:17',1649075,2479319),(21629,1,'2020-10-22 08:00:37',1650535,2480529),(21630,1,'2020-10-22 08:00:57',1651095,2481673),(21631,1,'2020-10-22 08:01:17',1651715,2482817),(21632,1,'2020-10-22 08:01:37',1652479,2484121),(21633,1,'2020-10-22 08:01:57',1653099,2485265),(21634,1,'2020-10-22 08:02:17',1653959,2486409),(21635,1,'2020-10-22 08:02:37',1655179,2487681),(21636,1,'2020-10-22 08:02:57',1655799,2488825),(21637,1,'2020-10-22 08:03:17',1656419,2489969),(21638,1,'2020-10-22 08:03:38',1657039,2491113),(21639,1,'2020-10-22 08:03:58',1657659,2492257),(21640,1,'2020-10-22 08:04:18',1658519,2493401),(21641,1,'2020-10-22 08:04:38',1659679,2494611),(21642,1,'2020-10-22 08:04:58',1660299,2495755),(21643,1,'2020-10-22 08:05:18',1660919,2496899),(21644,1,'2020-10-22 08:05:38',1661683,2498203),(21645,1,'2020-10-22 08:05:58',1662363,2499347),(21646,1,'2020-10-22 08:06:18',1663163,2500491),(21647,1,'2020-10-22 08:06:38',1664263,2501635),(21648,1,'2020-10-22 08:06:59',1664883,2502845),(21649,1,'2020-10-22 08:07:19',1665563,2504051),(21650,1,'2020-10-22 08:07:39',1666327,2505355),(21651,1,'2020-10-22 08:07:59',1667007,2506499),(21652,1,'2020-10-22 08:08:19',1667927,2507643),(21653,1,'2020-10-22 08:08:39',1668967,2508787),(21654,1,'2020-10-22 08:08:59',1669647,2509997),(21655,1,'2020-10-22 08:09:19',1670267,2511141),(21656,1,'2020-10-22 08:09:40',1670887,2512285),(21657,1,'2020-10-22 08:10:00',1671627,2513429),(21658,1,'2020-10-22 08:10:20',1672487,2514573),(21659,1,'2020-10-22 08:10:40',1673527,2515717),(21660,1,'2020-10-22 08:11:00',1674297,2517037),(21661,1,'2020-10-22 08:11:20',1674917,2518243),(21662,1,'2020-10-22 08:11:40',1675537,2519387),(21663,1,'2020-10-22 08:12:00',1676277,2520531),(21664,1,'2020-10-22 08:12:20',1677197,2521675),(21665,1,'2020-10-22 08:12:40',1678237,2522819),(21666,1,'2020-10-22 08:13:00',1678917,2524029),(21667,1,'2020-10-22 08:13:20',1679537,2525173),(21668,1,'2020-10-22 08:13:41',1680157,2526317),(21669,1,'2020-10-22 08:14:01',1680897,2527461),(21670,1,'2020-10-22 08:14:21',1681817,2528605),(21671,1,'2020-10-22 08:14:41',1682917,2529749),(21672,1,'2020-10-22 08:15:01',1683657,2531021),(21673,1,'2020-10-22 08:15:21',1684277,2532165),(21674,1,'2020-10-22 08:15:41',1684897,2533309),(21675,1,'2020-10-22 08:16:01',1685637,2534453),(21676,1,'2020-10-22 08:16:21',1686617,2535597),(21677,1,'2020-10-22 08:16:41',1687597,2536741),(21678,1,'2020-10-22 08:17:01',1688277,2537885),(21679,1,'2020-10-22 08:17:21',1688897,2539095),(21680,1,'2020-10-22 08:17:42',1689661,2540399),(21681,1,'2020-10-22 08:18:02',1690341,2541543),(21682,1,'2020-10-22 08:18:22',1691261,2542687),(21683,1,'2020-10-22 08:18:42',1692301,2543831),(21684,1,'2020-10-22 08:19:02',1692981,2544975),(21685,1,'2020-10-22 08:19:22',1693661,2546185),(21686,1,'2020-10-22 08:19:42',1694425,2547489),(21687,1,'2020-10-22 08:20:02',1695165,2548633),(21688,1,'2020-10-22 08:20:22',1696145,2549839),(21689,1,'2020-10-22 08:20:42',1697065,2550983),(21690,1,'2020-10-22 08:21:02',1697685,2552127),(21691,1,'2020-10-22 08:21:22',1698365,2553337),(21692,1,'2020-10-22 08:21:42',1699129,2554641),(21693,1,'2020-10-22 08:22:03',1699869,2555785),(21694,1,'2020-10-22 08:22:23',1700909,2556929),(21695,1,'2020-10-22 08:22:43',1701829,2558073),(21696,1,'2020-10-22 08:23:03',1702449,2559217),(21697,1,'2020-10-22 08:23:23',1703129,2560427),(21698,1,'2020-10-22 08:23:43',1703749,2561571),(21699,1,'2020-10-22 08:24:03',1704489,2562715),(21700,1,'2020-10-22 08:24:23',1705529,2563859),(21701,1,'2020-10-22 08:24:43',1706509,2565003),(21702,1,'2020-10-22 08:25:03',1707069,2566147),(21703,1,'2020-10-22 08:25:23',1707749,2567357),(21704,1,'2020-10-22 08:25:43',1708369,2568501),(21705,1,'2020-10-22 08:26:04',1709109,2569645),(21706,1,'2020-10-22 08:26:24',1710149,2570789),(21707,1,'2020-10-22 08:26:44',1711009,2571933),(21708,1,'2020-10-22 08:27:04',1711689,2573139),(21709,1,'2020-10-22 08:27:24',1712309,2574283),(21710,1,'2020-10-22 08:27:44',1713073,2575587),(21711,1,'2020-10-22 08:28:04',1713813,2576731),(21712,1,'2020-10-22 08:28:24',1714853,2577875),(21713,1,'2020-10-22 08:28:44',1715773,2579019),(21714,1,'2020-10-22 08:29:04',1716393,2580163),(21715,1,'2020-10-22 08:29:24',1717013,2581307),(21716,1,'2020-10-22 08:29:44',1717693,2582517),(21717,1,'2020-10-22 08:30:05',1718433,2583661),(21718,1,'2020-10-22 08:30:25',1719533,2584805),(21719,1,'2020-10-22 08:30:45',1720393,2585949),(21720,1,'2020-10-22 08:31:05',1721013,2587093),(21721,1,'2020-10-22 08:31:25',1721633,2588237),(21722,1,'2020-10-22 08:31:45',1722253,2589447),(21723,1,'2020-10-22 08:32:05',1722993,2590591),(21724,1,'2020-10-22 08:32:25',1724213,2591797),(21725,1,'2020-10-22 08:32:45',1725013,2592941),(21726,1,'2020-10-22 08:33:05',1725633,2594085),(21727,1,'2020-10-22 08:33:25',1726253,2595229),(21728,1,'2020-10-22 08:33:45',1726933,2596439),(21729,1,'2020-10-22 08:34:06',1727673,2597583),(21730,1,'2020-10-22 08:34:26',1728893,2598727),(21731,1,'2020-10-22 08:34:46',1729693,2599871),(21732,1,'2020-10-22 08:35:06',1730313,2601015),(21733,1,'2020-10-22 08:35:26',1730933,2602159),(21734,1,'2020-10-22 08:35:46',1731613,2603303),(21735,1,'2020-10-22 08:36:06',1732353,2604513),(21736,1,'2020-10-22 08:36:26',1733573,2605657),(21737,1,'2020-10-22 08:36:46',1734373,2606863),(21738,1,'2020-10-22 08:37:06',1734993,2608007),(21739,1,'2020-10-22 08:37:26',1735613,2609151),(21740,1,'2020-10-22 08:37:47',1736377,2610615),(21741,1,'2020-10-22 08:38:07',1737177,2611825),(21742,1,'2020-10-22 08:38:27',1738397,2612969),(21743,1,'2020-10-22 08:38:47',1739077,2614113),(21744,1,'2020-10-22 08:39:07',1739697,2615257),(21745,1,'2020-10-22 08:39:27',1740317,2616401),(21746,1,'2020-10-22 08:39:47',1740937,2617545),(21747,1,'2020-10-22 08:40:07',1741737,2618755),(21748,1,'2020-10-22 08:40:27',1743017,2619899),(21749,1,'2020-10-22 08:40:47',1743697,2621043),(21750,1,'2020-10-22 08:41:07',1744317,2622187),(21751,1,'2020-10-22 08:41:27',1744997,2623393),(21752,1,'2020-10-22 08:41:47',1745761,2624857),(21753,1,'2020-10-22 08:42:08',1746561,2626067),(21754,1,'2020-10-22 08:42:28',1747901,2627211),(21755,1,'2020-10-22 08:42:48',1748521,2628355),(21756,1,'2020-10-22 08:43:08',1749141,2629499),(21757,1,'2020-10-22 08:43:28',1749761,2630643),(21758,1,'2020-10-22 08:43:48',1750501,2631787),(21759,1,'2020-10-22 08:44:09',1751601,2632931),(21760,1,'2020-10-22 08:44:29',1752941,2634141),(21761,1,'2020-10-22 08:44:49',1753621,2635285),(21762,1,'2020-10-22 08:45:09',1754331,2636539),(21763,1,'2020-10-22 08:45:29',1754891,2637683),(21764,1,'2020-10-22 08:45:49',1755511,2638827),(21765,1,'2020-10-22 08:46:09',1756251,2639971),(21766,1,'2020-10-22 08:46:29',1757651,2641181),(21767,1,'2020-10-22 08:46:49',1758271,2642325),(21768,1,'2020-10-22 08:47:09',1758891,2643469),(21769,1,'2020-10-22 08:47:29',1759511,2644613),(21770,1,'2020-10-22 08:47:50',1760191,2645819),(21771,1,'2020-10-22 08:48:10',1760931,2647123),(21772,1,'2020-10-22 08:48:30',1762331,2648333),(21773,1,'2020-10-22 08:48:50',1762951,2649477),(21774,1,'2020-10-22 08:49:10',1763571,2650621),(21775,1,'2020-10-22 08:49:30',1764191,2651765),(21776,1,'2020-10-22 08:49:50',1764811,2652909),(21777,1,'2020-10-22 08:50:10',1765551,2654053),(21778,1,'2020-10-22 08:50:30',1766951,2655263),(21779,1,'2020-10-22 08:50:50',1767571,2656407),(21780,1,'2020-10-22 08:51:10',1768191,2657551),(21781,1,'2020-10-22 08:51:30',1768811,2658695),(21782,1,'2020-10-22 08:51:50',1769431,2659839),(21783,1,'2020-10-22 08:52:11',1770111,2660983),(21784,1,'2020-10-22 08:52:31',1771511,2662127),(21785,1,'2020-10-22 08:52:51',1772191,2663337),(21786,1,'2020-10-22 08:53:11',1772811,2664481),(21787,1,'2020-10-22 08:53:31',1773491,2665687),(21788,1,'2020-10-22 08:53:51',1774111,2666831),(21789,1,'2020-10-22 08:54:11',1774851,2667975),(21790,1,'2020-10-22 08:54:31',1776251,2669119),(21791,1,'2020-10-22 08:54:51',1776931,2670329),(21792,1,'2020-10-22 08:55:11',1777551,2671473),(21793,1,'2020-10-22 08:55:31',1778249,2672777),(21794,1,'2020-10-22 08:55:52',1778935,2673921),(21795,1,'2020-10-22 08:56:12',1779675,2675065),(21796,1,'2020-10-22 08:56:32',1781015,2676209),(21797,1,'2020-10-22 08:56:52',1781695,2677419),(21798,1,'2020-10-22 08:57:12',1782315,2678563),(21799,1,'2020-10-22 08:57:32',1782875,2679707),(21800,1,'2020-10-22 08:57:52',1783495,2680851),(21801,1,'2020-10-22 08:58:12',1784235,2681995),(21802,1,'2020-10-22 08:58:32',1785575,2683139),(21803,1,'2020-10-22 08:58:52',1786255,2684349),(21804,1,'2020-10-22 08:59:12',1786875,2685493),(21805,1,'2020-10-22 08:59:32',1787573,2686797),(21806,1,'2020-10-22 08:59:52',1788259,2687941),(21807,1,'2020-10-22 09:00:13',1788999,2689085),(21808,1,'2020-10-22 09:00:33',1790399,2690291),(21809,1,'2020-10-22 09:00:53',1791585,2692707),(21810,1,'2020-10-22 09:01:13',1792205,2693851),(21811,1,'2020-10-22 09:01:33',1792825,2694995),(21812,1,'2020-10-22 09:01:53',1793445,2696139),(21813,1,'2020-10-22 09:02:13',1794185,2697283),(21814,1,'2020-10-22 09:02:33',1795525,2698427),(21815,1,'2020-10-22 09:02:53',1796205,2699637),(21816,1,'2020-10-22 09:03:13',1796825,2700781),(21817,1,'2020-10-22 09:03:33',1797523,2702085),(21818,1,'2020-10-22 09:03:53',1798209,2703229),(21819,1,'2020-10-22 09:04:14',1798949,2704373),(21820,1,'2020-10-22 09:04:34',1800289,2705517),(21821,1,'2020-10-22 09:04:54',1800969,2706661),(21822,1,'2020-10-22 09:05:14',1801649,2707871),(21823,1,'2020-10-22 09:05:34',1802287,2709175),(21824,1,'2020-10-22 09:05:54',1802973,2710319),(21825,1,'2020-10-22 09:06:14',1803713,2711463),(21826,1,'2020-10-22 09:06:34',1805053,2712607),(21827,1,'2020-10-22 09:06:54',1805673,2713751),(21828,1,'2020-10-22 09:07:14',1806353,2714961),(21829,1,'2020-10-22 09:07:34',1806973,2716105),(21830,1,'2020-10-22 09:07:54',1807653,2717311),(21831,1,'2020-10-22 09:08:15',1808393,2718455),(21832,1,'2020-10-22 09:08:35',1809733,2719599),(21833,1,'2020-10-22 09:08:55',1810353,2720743),(21834,1,'2020-10-22 09:09:15',1811033,2721953),(21835,1,'2020-10-22 09:09:35',1811653,2723097),(21836,1,'2020-10-22 09:09:55',1812273,2724241),(21837,1,'2020-10-22 09:10:15',1813073,2725385),(21838,1,'2020-10-22 09:10:35',1814353,2726529),(21839,1,'2020-10-22 09:10:55',1814973,2727673),(21840,1,'2020-10-22 09:11:15',1815653,2728883),(21841,1,'2020-10-22 09:11:35',1816273,2730027),(21842,1,'2020-10-22 09:11:55',1816893,2731171),(21843,1,'2020-10-22 09:12:16',1817633,2732315),(21844,1,'2020-10-22 09:12:36',1818913,2733459),(21845,1,'2020-10-22 09:12:56',1819533,2734603),(21846,1,'2020-10-22 09:13:16',1820213,2735747),(21847,1,'2020-10-22 09:13:36',1820833,2736957),(21848,1,'2020-10-22 09:13:56',1821453,2738101),(21849,1,'2020-10-22 09:14:16',1822253,2739245),(21850,1,'2020-10-22 09:14:36',1823533,2740389),(21851,1,'2020-10-22 09:14:56',1824273,2741595),(21852,1,'2020-10-22 09:15:16',1824893,2742739),(21853,1,'2020-10-22 09:15:36',1825573,2743949),(21854,1,'2020-10-22 09:15:57',1826193,2745093),(21855,1,'2020-10-22 09:16:17',1827053,2746237),(21856,1,'2020-10-22 09:16:37',1828273,2747381),(21857,1,'2020-10-22 09:16:57',1828893,2748525),(21858,1,'2020-10-22 09:17:17',1829513,2749669),(21859,1,'2020-10-22 09:17:37',1830337,2751039),(21860,1,'2020-10-22 09:17:57',1830957,2752183),(21861,1,'2020-10-22 09:18:17',1831817,2753327),(21862,1,'2020-10-22 09:18:37',1832917,2754471),(21863,1,'2020-10-22 09:18:57',1835265,2755615),(21864,1,'2020-10-22 09:19:17',1835915,2756869),(21865,1,'2020-10-22 09:19:37',1836595,2758013),(21866,1,'2020-10-22 09:19:58',1837275,2759223),(21867,1,'2020-10-22 09:20:18',1838135,2760367),(21868,1,'2020-10-22 09:20:38',1839295,2761511),(21869,1,'2020-10-22 09:20:58',1841981,2762655),(21870,1,'2020-10-22 09:21:18',1842601,2763799),(21871,1,'2020-10-22 09:21:38',1843425,2765103),(21872,1,'2020-10-22 09:21:58',1844165,2766375),(21873,1,'2020-10-22 09:22:18',1845025,2767519),(21874,1,'2020-10-22 09:22:38',1846185,2768663),(21875,1,'2020-10-22 09:22:58',1846805,2769807),(21876,1,'2020-10-22 09:23:18',1847425,2770951),(21877,1,'2020-10-22 09:23:39',1848045,2772095),(21878,1,'2020-10-22 09:23:59',1848785,2773305),(21879,1,'2020-10-22 09:24:19',1849705,2774449),(21880,1,'2020-10-22 09:24:39',1850685,2775593),(21881,1,'2020-10-22 09:24:59',1851365,2776737),(21882,1,'2020-10-22 09:25:19',1851985,2777881),(21883,1,'2020-10-22 09:25:39',1852749,2779185),(21884,1,'2020-10-22 09:25:59',1853489,2780395),(21885,1,'2020-10-22 09:26:19',1854409,2781539),(21886,1,'2020-10-22 09:26:39',1855449,2782683),(21887,1,'2020-10-22 09:26:59',1856129,2783827),(21888,1,'2020-10-22 09:27:19',1856749,2784971),(21889,1,'2020-10-22 09:27:40',1857369,2786115),(21890,1,'2020-10-22 09:28:00',1858169,2787325),(21891,1,'2020-10-22 09:28:20',1859089,2788469),(21892,1,'2020-10-22 09:28:40',1860129,2789613),(21893,1,'2020-10-22 09:29:00',1860809,2790819),(21894,1,'2020-10-22 09:29:20',1861429,2791963),(21895,1,'2020-10-22 09:29:40',1862049,2793107),(21896,1,'2020-10-22 09:30:00',1862849,2794251),(21897,1,'2020-10-22 09:30:20',1863769,2795461),(21898,1,'2020-10-22 09:30:41',1864809,2796605),(21899,1,'2020-10-22 09:31:01',1865429,2797749),(21900,1,'2020-10-22 09:31:21',1866049,2798893),(21901,1,'2020-10-22 09:31:41',1867013,2800357),(21902,1,'2020-10-22 09:32:01',1867813,2801501),(21903,1,'2020-10-22 09:32:21',1868793,2802711),(21904,1,'2020-10-22 09:32:41',1869653,2803855),(21905,1,'2020-10-22 09:33:01',1870273,2804999),(21906,1,'2020-10-22 09:33:21',1870893,2806143),(21907,1,'2020-10-22 09:33:41',1871513,2807287),(21908,1,'2020-10-22 09:34:01',1872253,2808431),(21909,1,'2020-10-22 09:34:21',1873233,2809641),(21910,1,'2020-10-22 09:34:42',1874153,2810785),(21911,1,'2020-10-22 09:35:02',1874893,2811929),(21912,1,'2020-10-22 09:35:22',1875513,2813073),(21913,1,'2020-10-22 09:35:42',1876133,2814217),(21914,1,'2020-10-22 09:36:02',1876873,2815361),(21915,1,'2020-10-22 09:36:22',1877973,2816633),(21916,1,'2020-10-22 09:36:42',1878953,2817777),(21917,1,'2020-10-22 09:37:02',1879573,2818921),(21918,1,'2020-10-22 09:37:22',1880193,2820065),(21919,1,'2020-10-22 09:37:42',1880957,2821369),(21920,1,'2020-10-22 09:38:02',1881697,2822513),(21921,1,'2020-10-22 09:38:22',1882797,2823723),(21922,1,'2020-10-22 09:38:43',1883717,2824867),(21923,1,'2020-10-22 09:39:03',1884337,2826011),(21924,1,'2020-10-22 09:39:23',1884897,2827155),(21925,1,'2020-10-22 09:39:43',1885517,2828299),(21926,1,'2020-10-22 09:40:03',1886257,2829443),(21927,1,'2020-10-22 09:40:23',1887357,2830587),(21928,1,'2020-10-22 09:40:43',1888277,2831797),(21929,1,'2020-10-22 09:41:03',1888957,2833003),(21930,1,'2020-10-22 09:41:23',1889577,2834147),(21931,1,'2020-10-22 09:41:44',1890341,2835451),(21932,1,'2020-10-22 09:42:04',1891081,2836595),(21933,1,'2020-10-22 09:42:24',1892121,2837739),(21934,1,'2020-10-22 09:42:44',1893101,2838949),(21935,1,'2020-10-22 09:43:04',1893721,2840093),(21936,1,'2020-10-22 09:43:24',1894341,2841237),(21937,1,'2020-10-22 09:43:44',1894961,2842381),(21938,1,'2020-10-22 09:44:04',1895701,2843525),(21939,1,'2020-10-22 09:44:24',1896801,2844669),(21940,1,'2020-10-22 09:44:44',1897961,2845879),(21941,1,'2020-10-22 09:45:04',1898641,2847023),(21942,1,'2020-10-22 09:45:24',1899261,2848167),(21943,1,'2020-10-22 09:45:45',1899881,2849311),(21944,1,'2020-10-22 09:46:05',1900621,2850455),(21945,1,'2020-10-22 09:46:25',1901661,2851599),(21946,1,'2020-10-22 09:46:45',1902581,2852809),(21947,1,'2020-10-22 09:47:05',1903201,2853953),(21948,1,'2020-10-22 09:47:25',1903821,2855097),(21949,1,'2020-10-22 09:47:45',1904381,2856241),(21950,1,'2020-10-22 09:48:05',1905121,2857385),(21951,1,'2020-10-22 09:48:25',1906341,2858591),(21952,1,'2020-10-22 09:48:45',1907201,2859735),(21953,1,'2020-10-22 09:49:05',1907821,2860945),(21954,1,'2020-10-22 09:49:26',1908621,2862089),(21955,1,'2020-10-22 09:49:46',1909385,2863553),(21956,1,'2020-10-22 09:50:06',1910125,2864697),(21957,1,'2020-10-22 09:50:26',1911345,2865841),(21958,1,'2020-10-22 09:50:46',1912145,2866985),(21959,1,'2020-10-22 09:51:06',1912765,2868195),(21960,1,'2020-10-22 09:51:26',1913385,2869339),(21961,1,'2020-10-22 09:51:47',1914005,2870483),(21962,1,'2020-10-22 09:52:07',1914745,2871627),(21963,1,'2020-10-22 09:52:27',1915965,2872771),(21964,1,'2020-10-22 09:52:47',1916705,2873915),(21965,1,'2020-10-22 09:53:07',1917829,2875125),(21966,1,'2020-10-22 09:53:27',1918539,2876379),(21967,1,'2020-10-22 09:53:47',1919303,2877843),(21968,1,'2020-10-22 09:54:07',1920043,2878987),(21969,1,'2020-10-22 09:54:27',1921263,2880131),(21970,1,'2020-10-22 09:54:47',1922003,2881275),(21971,1,'2020-10-22 09:55:07',1922743,2882485),(21972,1,'2020-10-22 09:55:28',1923693,2883629),(21973,1,'2020-10-22 09:55:48',1924373,2884835),(21974,1,'2020-10-22 09:56:08',1925353,2885979),(21975,1,'2020-10-22 09:56:28',1926873,2887123),(21976,1,'2020-10-22 09:56:48',1927493,2888267),(21977,1,'2020-10-22 09:57:08',1928173,2889477),(21978,1,'2020-10-22 09:57:28',1928793,2890621),(21979,1,'2020-10-22 09:57:48',1929557,2892085),(21980,1,'2020-10-22 09:58:08',1930297,2893229),(21981,1,'2020-10-22 09:58:28',1931637,2894373),(21982,1,'2020-10-22 09:58:48',1932257,2895517),(21983,1,'2020-10-22 09:59:08',1933077,2896759),(21984,1,'2020-10-22 09:59:29',1933637,2897969),(21985,1,'2020-10-22 09:59:49',1934257,2899113),(21986,1,'2020-10-22 10:00:09',1935357,2900257),(21987,1,'2020-10-22 10:00:29',1936697,2901401),(21988,1,'2020-10-22 10:00:49',1937737,2902545),(21989,1,'2020-10-22 10:01:09',1938864,2903689),(21990,1,'2020-10-22 10:01:29',1939964,2904899),(21991,1,'2020-10-22 10:01:49',1941400,2906363),(21992,1,'2020-10-22 10:02:09',1942441,2907507),(21993,1,'2020-10-22 10:02:29',1943781,2908651),(21994,1,'2020-10-22 10:02:49',1944461,2909857),(21995,1,'2020-10-22 10:03:09',1945081,2911001),(21996,1,'2020-10-22 10:03:30',1945761,2912211),(21997,1,'2020-10-22 10:03:50',1946381,2913355),(21998,1,'2020-10-22 10:04:10',1947121,2914499),(21999,1,'2020-10-22 10:04:30',1948461,2915643),(22000,1,'2020-10-22 10:04:50',1949141,2916787),(22001,1,'2020-10-22 10:05:10',1949941,2917931),(22002,1,'2020-10-22 10:05:30',1950939,2919301),(22003,1,'2020-10-22 10:05:50',1952765,2920445),(22004,1,'2020-10-22 10:06:11',1954645,2921589),(22005,1,'2020-10-22 10:06:31',1956945,2922733),(22006,1,'2020-10-22 10:06:51',1958525,2923877),(22007,1,'2020-10-22 10:07:11',1959925,2925021),(22008,1,'2020-10-22 10:07:31',1960785,2926231),(22009,1,'2020-10-22 10:07:51',1961585,2927375),(22010,1,'2020-10-22 10:08:11',1962685,2928519),(22011,1,'2020-10-22 10:08:31',1964205,2929663),(22012,1,'2020-10-22 10:08:51',1965005,2930807),(22013,1,'2020-10-22 10:09:11',1965865,2931951),(22014,1,'2020-10-22 10:09:31',1966845,2933095),(22015,1,'2020-10-22 10:09:51',1967705,2934367),(22016,1,'2020-10-22 10:10:12',1968625,2935511),(22017,1,'2020-10-22 10:10:32',1970325,2936655),(22018,1,'2020-10-22 10:10:52',1971125,2937799),(22019,1,'2020-10-22 10:11:12',1971925,2938943),(22020,1,'2020-10-22 10:11:32',1972785,2940087),(22021,1,'2020-10-22 10:11:52',1973645,2941297),(22022,1,'2020-10-22 10:12:12',1974565,2942441),(22023,1,'2020-10-22 10:12:32',1976205,2943585),(22024,1,'2020-10-22 10:12:52',1977065,2944729),(22025,1,'2020-10-22 10:13:12',1977865,2945873),(22026,1,'2020-10-22 10:13:32',1978665,2947017),(22027,1,'2020-10-22 10:13:52',1979645,2948227),(22028,1,'2020-10-22 10:14:13',1980565,2949371),(22029,1,'2020-10-22 10:14:33',1982085,2950515),(22030,1,'2020-10-22 10:14:53',1983125,2951659),(22031,1,'2020-10-22 10:15:13',1983925,2952803),(22032,1,'2020-10-22 10:15:33',1984725,2953947),(22033,1,'2020-10-22 10:15:53',1985765,2955157),(22034,1,'2020-10-22 10:16:13',1986745,2956363),(22035,1,'2020-10-22 10:16:33',1988265,2957507),(22036,1,'2020-10-22 10:16:53',1989185,2958651),(22037,1,'2020-10-22 10:17:14',1990045,2959795),(22038,1,'2020-10-22 10:17:34',1990845,2960939),(22039,1,'2020-10-22 10:17:54',1991765,2962083),(22040,1,'2020-10-22 10:18:14',1992805,2963293),(22041,1,'2020-10-22 10:18:34',1994265,2964437),(22042,1,'2020-10-22 10:18:54',1995125,2965581),(22043,1,'2020-10-22 10:19:14',1996105,2966725),(22044,1,'2020-10-22 10:19:34',1996905,2967869),(22045,1,'2020-10-22 10:19:54',1997705,2969013),(22046,1,'2020-10-22 10:20:14',1998685,2970223),(22047,1,'2020-10-22 10:20:34',1999965,2971367),(22048,1,'2020-10-22 10:20:55',2000585,2972511),(22049,1,'2020-10-22 10:21:15',2001205,2973655),(22050,1,'2020-10-22 10:21:35',2001825,2974799),(22051,1,'2020-10-22 10:21:55',2002445,2975943),(22052,1,'2020-10-22 10:22:15',2003305,2977215),(22053,1,'2020-10-22 10:22:35',2004645,2978359),(22054,1,'2020-10-22 10:22:55',2005265,2979503),(22055,1,'2020-10-22 10:23:15',2005885,2980647),(22056,1,'2020-10-22 10:23:35',2006505,2981791),(22057,1,'2020-10-22 10:23:55',2007125,2982935),(22058,1,'2020-10-22 10:24:15',2007985,2984145),(22059,1,'2020-10-22 10:24:35',2009265,2985289),(22060,1,'2020-10-22 10:24:56',2009945,2986433),(22061,1,'2020-10-22 10:25:16',2010565,2987577),(22062,1,'2020-10-22 10:25:36',2011469,2988979),(22063,1,'2020-10-22 10:25:56',2012089,2990123),(22064,1,'2020-10-22 10:26:16',2012949,2991333),(22065,1,'2020-10-22 10:26:36',2014229,2992477),(22066,1,'2020-10-22 10:26:56',2014789,2993621),(22067,1,'2020-10-22 10:27:16',2015409,2994765),(22068,1,'2020-10-22 10:27:36',2016403,2996339),(22069,1,'2020-10-22 10:27:56',2017023,2997483),(22070,1,'2020-10-22 10:28:16',2017943,2998627),(22071,1,'2020-10-22 10:28:36',2019163,2999837),(22072,1,'2020-10-22 10:28:57',2019783,3000981),(22073,1,'2020-10-22 10:29:17',2020403,3002125),(22074,1,'2020-10-22 10:29:37',2021023,3003269),(22075,1,'2020-10-22 10:29:57',2021643,3004413),(22076,1,'2020-10-22 10:30:17',2024939,3005939),(22077,1,'2020-10-22 10:30:37',2028820,3007149),(22078,1,'2020-10-22 10:30:57',2029641,3008293),(22079,1,'2020-10-22 10:31:17',2030261,3009437),(22080,1,'2020-10-22 10:31:37',2030881,3010581),(22081,1,'2020-10-22 10:31:57',2031561,3011725),(22082,1,'2020-10-22 10:32:17',2032421,3012869),(22083,1,'2020-10-22 10:32:37',2033641,3014079),(22084,1,'2020-10-22 10:32:58',2034261,3015223),(22085,1,'2020-10-22 10:33:18',2038313,3016429),(22086,1,'2020-10-22 10:33:38',2039077,3017733),(22087,1,'2020-10-22 10:33:58',2039817,3018877),(22088,1,'2020-10-22 10:34:18',2040677,3020021),(22089,1,'2020-10-22 10:34:38',2041897,3021231),(22090,1,'2020-10-22 10:34:58',2042577,3022375),(22091,1,'2020-10-22 10:35:18',2043257,3023519),(22092,1,'2020-10-22 10:35:38',2043877,3024663),(22093,1,'2020-10-22 10:35:58',2044557,3025807),(22094,1,'2020-10-22 10:36:18',2045477,3026951),(22095,1,'2020-10-22 10:36:38',2046577,3028095),(22096,1,'2020-10-22 10:36:59',2047257,3029367),(22097,1,'2020-10-22 10:37:19',2047877,3030511),(22098,1,'2020-10-22 10:37:39',2048641,3031815),(22099,1,'2020-10-22 10:37:59',2049321,3032959),(22100,1,'2020-10-22 10:38:19',2050301,3034103),(22101,1,'2020-10-22 10:38:39',2051432,3035247),(22102,1,'2020-10-22 10:38:59',2052995,3036457),(22103,1,'2020-10-22 10:39:19',2053615,3037601),(22104,1,'2020-10-22 10:39:39',2054235,3038745),(22105,1,'2020-10-22 10:39:59',2054975,3039889),(22106,1,'2020-10-22 10:40:19',2055986,3041033),(22107,1,'2020-10-22 10:40:39',2057026,3042239),(22108,1,'2020-10-22 10:41:00',2057706,3043449),(22109,1,'2020-10-22 10:41:20',2058326,3044593),(22110,1,'2020-10-22 10:41:40',2058946,3045737),(22111,1,'2020-10-22 10:42:00',2060339,3046881),(22112,1,'2020-10-22 10:42:20',2061259,3048025),(22113,1,'2020-10-22 10:42:40',2062299,3049169),(22114,1,'2020-10-22 10:43:00',2062979,3050379),(22115,1,'2020-10-22 10:43:20',2063599,3051523),(22116,1,'2020-10-22 10:43:40',2065304,3052667),(22117,1,'2020-10-22 10:44:00',2066344,3053811),(22118,1,'2020-10-22 10:44:21',2067324,3054955),(22119,1,'2020-10-22 10:44:41',2068304,3056099),(22120,1,'2020-10-22 10:45:01',2069044,3057243),(22121,1,'2020-10-22 10:45:21',2069664,3058453),(22122,1,'2020-10-22 10:45:41',2070428,3059757),(22123,1,'2020-10-22 10:46:01',2071168,3060901),(22124,1,'2020-10-22 10:46:21',2072148,3062045),(22125,1,'2020-10-22 10:46:41',2073128,3063189),(22126,1,'2020-10-22 10:47:01',2073808,3064333),(22127,1,'2020-10-22 10:47:21',2074368,3065543),(22128,1,'2020-10-22 10:47:41',2074988,3066687),(22129,1,'2020-10-22 10:48:01',2075788,3067893),(22130,1,'2020-10-22 10:48:22',2076768,3069037),(22131,1,'2020-10-22 10:48:42',2077748,3070181),(22132,1,'2020-10-22 10:49:02',2078368,3071325),(22133,1,'2020-10-22 10:49:22',2079048,3072535),(22134,1,'2020-10-22 10:49:42',2079608,3073679),(22135,1,'2020-10-22 10:50:02',2080348,3074823),(22136,1,'2020-10-22 10:50:22',2081328,3075967),(22137,1,'2020-10-22 10:50:42',2082308,3077111),(22138,1,'2020-10-22 10:51:02',2082928,3078255),(22139,1,'2020-10-22 10:51:22',2083608,3079465),(22140,1,'2020-10-22 10:51:42',2084228,3080609),(22141,1,'2020-10-22 10:52:02',2084968,3081753),(22142,1,'2020-10-22 10:52:22',2086008,3082897),(22143,1,'2020-10-22 10:52:43',2086928,3084041),(22144,1,'2020-10-22 10:53:03',2087548,3085185),(22145,1,'2020-10-22 10:53:23',2088228,3086395),(22146,1,'2020-10-22 10:53:43',2088992,3087699),(22147,1,'2020-10-22 10:54:03',2089732,3088843),(22148,1,'2020-10-22 10:54:23',2090712,3089987),(22149,1,'2020-10-22 10:54:43',2091572,3091131),(22150,1,'2020-10-22 10:55:03',2092252,3092275),(22151,1,'2020-10-22 10:55:23',2092932,3093485),(22152,1,'2020-10-22 10:55:43',2093612,3094691),(22153,1,'2020-10-22 10:56:03',2094352,3095835),(22154,1,'2020-10-22 10:56:23',2095392,3096979),(22155,1,'2020-10-22 10:56:44',2096312,3098123),(22156,1,'2020-10-22 10:57:04',2096932,3099267),(22157,1,'2020-10-22 10:57:24',2097552,3100411),(22158,1,'2020-10-22 10:57:44',2098232,3101621),(22159,1,'2020-10-22 10:58:04',2098972,3102765),(22160,1,'2020-10-22 10:58:24',2100012,3103909),(22161,1,'2020-10-22 10:58:44',2100932,3105053),(22162,1,'2020-10-22 10:59:04',2101552,3106197),(22163,1,'2020-10-22 10:59:24',2102172,3107341),(22164,1,'2020-10-22 10:59:44',2102996,3108711),(22165,1,'2020-10-22 11:00:04',2103736,3109855),(22166,1,'2020-10-22 11:00:24',2104836,3110999),(22167,1,'2020-10-22 11:00:45',2105696,3112143),(22168,1,'2020-10-22 11:01:05',2106256,3113287),(22169,1,'2020-10-22 11:01:25',2106876,3114431),(22170,1,'2020-10-22 11:01:45',2107646,3115751),(22171,1,'2020-10-22 11:02:05',2108386,3116895),(22172,1,'2020-10-22 11:02:25',2109546,3118039),(22173,1,'2020-10-22 11:02:45',2110406,3119245),(22174,1,'2020-10-22 11:03:05',2111026,3120389),(22175,1,'2020-10-22 11:03:25',2111646,3121533),(22176,1,'2020-10-22 11:03:45',2112326,3122743),(22177,1,'2020-10-22 11:04:05',2113066,3123887),(22178,1,'2020-10-22 11:04:26',2114286,3125031),(22179,1,'2020-10-22 11:04:46',2115026,3126175),(22180,1,'2020-10-22 11:05:06',2115706,3127319),(22181,1,'2020-10-22 11:05:26',2116386,3128525),(22182,1,'2020-10-22 11:05:46',2117066,3129669),(22183,1,'2020-10-22 11:06:06',2117806,3130879),(22184,1,'2020-10-22 11:06:26',2119026,3132023),(22185,1,'2020-10-22 11:06:46',2119766,3133167),(22186,1,'2020-10-22 11:07:07',2120386,3134311),(22187,1,'2020-10-22 11:07:27',2121006,3135455),(22188,1,'2020-10-22 11:07:47',2121566,3136599),(22189,1,'2020-10-22 11:08:07',2122366,3137809),(22190,1,'2020-10-22 11:08:27',2123586,3138953),(22191,1,'2020-10-22 11:08:47',2124326,3140097),(22192,1,'2020-10-22 11:09:07',2124946,3141241),(22193,1,'2020-10-22 11:09:27',2125626,3142385),(22194,1,'2020-10-22 11:09:47',2126246,3143529),(22195,1,'2020-10-22 11:10:07',2127106,3144801),(22196,1,'2020-10-22 11:10:27',2128446,3145945),(22197,1,'2020-10-22 11:10:47',2129066,3147089),(22198,1,'2020-10-22 11:11:08',2129686,3148233),(22199,1,'2020-10-22 11:11:28',2130306,3149377),(22200,1,'2020-10-22 11:11:48',2130926,3150521),(22201,1,'2020-10-22 11:12:08',2131726,3151665),(22202,1,'2020-10-22 11:12:28',2133066,3152875),(22203,1,'2020-10-22 11:12:48',2133686,3154019),(22204,1,'2020-10-22 11:13:08',2134306,3155163),(22205,1,'2020-10-22 11:13:28',2134926,3156307),(22206,1,'2020-10-22 11:13:48',2135546,3157451),(22207,1,'2020-10-22 11:14:08',2136346,3158661),(22208,1,'2020-10-22 11:14:28',2137566,3159805),(22209,1,'2020-10-22 11:14:48',2138186,3160949),(22210,1,'2020-10-22 11:15:08',2138926,3162155),(22211,1,'2020-10-22 11:15:29',2139546,3163299),(22212,1,'2020-10-22 11:15:49',2140166,3164443),(22213,1,'2020-10-22 11:16:09',2140906,3165587),(22214,1,'2020-10-22 11:16:29',2142306,3166797),(22215,1,'2020-10-22 11:16:49',2142926,3167941),(22216,1,'2020-10-22 11:17:09',2143546,3169085),(22217,1,'2020-10-22 11:17:29',2144166,3170229),(22218,1,'2020-10-22 11:17:49',2144786,3171373),(22219,1,'2020-10-22 11:18:09',2145526,3172517),(22220,1,'2020-10-22 11:18:30',2146926,3173727),(22221,1,'2020-10-22 11:18:50',2147546,3174871),(22222,1,'2020-10-22 11:19:10',2148226,3176015),(22223,1,'2020-10-22 11:19:30',2148906,3177221),(22224,1,'2020-10-22 11:19:50',2149526,3178365),(22225,1,'2020-10-22 11:20:10',2150266,3179509),(22226,1,'2020-10-22 11:20:30',2151666,3180719),(22227,1,'2020-10-22 11:20:50',2152286,3181863),(22228,1,'2020-10-22 11:21:10',2152846,3183007),(22229,1,'2020-10-22 11:21:30',2153466,3184151),(22230,1,'2020-10-22 11:21:50',2154086,3185295),(22231,1,'2020-10-22 11:22:10',2154826,3186439),(22232,1,'2020-10-22 11:22:31',2156166,3187583),(22233,1,'2020-10-22 11:22:51',2156786,3188727),(22234,1,'2020-10-22 11:23:11',2157406,3189871),(22235,1,'2020-10-22 11:23:31',2158104,3191175),(22236,1,'2020-10-22 11:23:51',2158790,3192319),(22237,1,'2020-10-22 11:24:11',2159530,3193463),(22238,1,'2020-10-22 11:24:31',2160930,3194607),(22239,1,'2020-10-22 11:24:51',2161550,3195817),(22240,1,'2020-10-22 11:25:11',2162230,3196961),(22241,1,'2020-10-22 11:25:31',2162850,3198105),(22242,1,'2020-10-22 11:25:51',2163530,3199311),(22243,1,'2020-10-22 11:26:12',2164270,3200455),(22244,1,'2020-10-22 11:26:32',2165610,3201599),(22245,1,'2020-10-22 11:26:52',2166290,3202809),(22246,1,'2020-10-22 11:27:12',2166910,3203953),(22247,1,'2020-10-22 11:27:32',2167608,3205257),(22248,1,'2020-10-22 11:27:52',2168294,3206401),(22249,1,'2020-10-22 11:28:12',2168974,3207545),(22250,1,'2020-10-22 11:28:32',2170314,3208689),(22251,1,'2020-10-22 11:28:52',2170994,3209899),(22252,1,'2020-10-22 11:29:12',2171614,3211043),(22253,1,'2020-10-22 11:29:32',2172234,3212187),(22254,1,'2020-10-22 11:29:52',2172854,3213331),(22255,1,'2020-10-22 11:30:13',2173594,3214475),(22256,1,'2020-10-22 11:30:33',2174934,3215619),(22257,1,'2020-10-22 11:30:53',2175614,3216829),(22258,1,'2020-10-22 11:31:13',2176234,3217973),(22259,1,'2020-10-22 11:31:33',2176932,3219277),(22260,1,'2020-10-22 11:31:53',2177678,3220483),(22261,1,'2020-10-22 11:32:13',2178418,3221627),(22262,1,'2020-10-22 11:32:33',2179698,3222771),(22263,1,'2020-10-22 11:32:53',2180378,3223915),(22264,1,'2020-10-22 11:33:13',2180998,3225125),(22265,1,'2020-10-22 11:33:33',2181618,3226269),(22266,1,'2020-10-22 11:33:53',2182238,3227413),(22267,1,'2020-10-22 11:34:14',2182978,3228557),(22268,1,'2020-10-22 11:34:34',2184318,3229701),(22269,1,'2020-10-22 11:34:54',2184878,3230845),(22270,1,'2020-10-22 11:35:14',2185618,3232055),(22271,1,'2020-10-22 11:35:34',2186316,3233359),(22272,1,'2020-10-22 11:35:54',2187152,3234675),(22273,1,'2020-10-22 11:36:14',2187892,3235819),(22274,1,'2020-10-22 11:36:34',2189232,3236963),(22275,1,'2020-10-22 11:36:54',2189852,3238107),(22276,1,'2020-10-22 11:37:14',2190532,3239317),(22277,1,'2020-10-22 11:37:34',2191152,3240461),(22278,1,'2020-10-22 11:37:54',2191772,3241605),(22279,1,'2020-10-22 11:38:14',2192512,3242749),(22280,1,'2020-10-22 11:38:35',2193852,3243893),(22281,1,'2020-10-22 11:38:55',2194472,3245037),(22282,1,'2020-10-22 11:39:15',2195152,3246247),(22283,1,'2020-10-22 11:39:35',2195772,3247391),(22284,1,'2020-10-22 11:39:55',2196392,3248535),(22285,1,'2020-10-22 11:40:15',2197192,3249679),(22286,1,'2020-10-22 11:40:35',2198472,3250823),(22287,1,'2020-10-22 11:40:55',2199092,3251967),(22288,1,'2020-10-22 11:41:15',2199772,3253177),(22289,1,'2020-10-22 11:41:36',2200616,3254579),(22290,1,'2020-10-22 11:41:56',2201236,3255723),(22291,1,'2020-10-22 11:42:16',2202036,3256867),(22292,1,'2020-10-22 11:42:36',2203316,3258011),(22293,1,'2020-10-22 11:42:56',2203936,3259155),(22294,1,'2020-10-22 11:43:16',2204676,3260361),(22295,1,'2020-10-22 11:43:36',2205356,3261571),(22296,1,'2020-10-22 11:43:56',2205976,3262715),(22297,1,'2020-10-22 11:44:16',2206836,3263859),(22298,1,'2020-10-22 11:44:36',2208056,3265003),(22299,1,'2020-10-22 11:44:56',2208676,3266147),(22300,1,'2020-10-22 11:45:17',2209356,3267291),(22301,1,'2020-10-22 11:45:37',2210036,3268501),(22302,1,'2020-10-22 11:45:57',2210656,3269645),(22303,1,'2020-10-22 11:46:17',2211516,3270789),(22304,1,'2020-10-22 11:46:37',2212736,3271933),(22305,1,'2020-10-22 11:46:57',2213356,3273077),(22306,1,'2020-10-22 11:47:17',2215268,3274221),(22307,1,'2020-10-22 11:47:37',2216232,3275591),(22308,1,'2020-10-22 11:47:57',2216912,3276735),(22309,1,'2020-10-22 11:48:17',2217772,3277879),(22310,1,'2020-10-22 11:48:37',2218932,3279085),(22311,1,'2020-10-22 11:48:57',2219954,3280229),(22312,1,'2020-10-22 11:49:18',2220574,3281373),(22313,1,'2020-10-22 11:49:38',2221254,3282517),(22314,1,'2020-10-22 11:49:58',2221934,3283727),(22315,1,'2020-10-22 11:50:18',2222794,3284871),(22316,1,'2020-10-22 11:50:38',2223834,3286015),(22317,1,'2020-10-22 11:50:58',2224454,3287159),(22318,1,'2020-10-22 11:51:18',2225074,3288303),(22319,1,'2020-10-22 11:51:38',2225838,3289673),(22320,1,'2020-10-22 11:51:58',2226518,3290817),(22321,1,'2020-10-22 11:52:18',2227678,3291961),(22322,1,'2020-10-22 11:52:38',2228778,3293105),(22323,1,'2020-10-22 11:52:58',2229648,3294249),(22324,1,'2020-10-22 11:53:19',2230328,3295455),(22325,1,'2020-10-22 11:53:39',2231092,3296759),(22326,1,'2020-10-22 11:53:59',2231832,3297969),(22327,1,'2020-10-22 11:54:19',2232812,3299113),(22328,1,'2020-10-22 11:54:39',2233852,3300257),(22329,1,'2020-10-22 11:54:59',2234472,3301401),(22330,1,'2020-10-22 11:55:19',2235092,3302545),(22331,1,'2020-10-22 11:55:39',2235712,3303689),(22332,1,'2020-10-22 11:55:59',2236512,3304899),(22333,1,'2020-10-22 11:56:19',2237432,3306043),(22334,1,'2020-10-22 11:56:39',2238472,3307187),(22335,1,'2020-10-22 11:56:59',2239092,3308331),(22336,1,'2020-10-22 11:57:20',2239712,3309475),(22337,1,'2020-10-22 11:57:40',2240332,3310619),(22338,1,'2020-10-22 11:58:00',2241132,3311763),(22339,1,'2020-10-22 11:58:20',2242112,3313035),(22340,1,'2020-10-22 11:58:40',2243152,3314179),(22341,1,'2020-10-22 11:59:00',2243772,3315323),(22342,1,'2020-10-22 11:59:20',2244392,3316467),(22343,1,'2020-10-22 11:59:40',2245012,3317611),(22344,1,'2020-10-22 12:00:00',2245812,3318755),(22345,1,'2020-10-22 12:00:20',2246732,3319965),(22346,1,'2020-10-22 12:00:40',2247772,3321109),(22347,1,'2020-10-22 12:01:00',2248392,3322253),(22348,1,'2020-10-22 12:01:21',2249012,3323397),(22349,1,'2020-10-22 12:01:41',2249632,3324541),(22350,1,'2020-10-22 12:02:01',2250372,3325685),(22351,1,'2020-10-22 12:02:21',2251292,3326895),(22352,1,'2020-10-22 12:02:41',2252272,3328039),(22353,1,'2020-10-22 12:03:01',2252892,3329183),(22354,1,'2020-10-22 12:03:21',2253512,3330327),(22355,1,'2020-10-22 12:03:41',2254416,3331729),(22356,1,'2020-10-22 12:04:01',2255156,3332873),(22357,1,'2020-10-22 12:04:22',2256196,3334083),(22358,1,'2020-10-22 12:04:42',2257176,3335227),(22359,1,'2020-10-22 12:05:02',2257916,3336433),(22360,1,'2020-10-22 12:05:22',2258536,3337577),(22361,1,'2020-10-22 12:05:42',2259300,3338881),(22362,1,'2020-10-22 12:06:02',2260040,3340025),(22363,1,'2020-10-22 12:06:22',2261210,3341235),(22364,1,'2020-10-22 12:06:42',2262130,3342379),(22365,1,'2020-10-22 12:07:02',2262750,3343523),(22366,1,'2020-10-22 12:07:22',2263370,3344667),(22367,1,'2020-10-22 12:07:42',2263990,3345811),(22368,1,'2020-10-22 12:08:02',2264730,3346955),(22369,1,'2020-10-22 12:08:23',2265830,3348165),(22370,1,'2020-10-22 12:08:43',2266750,3349309),(22371,1,'2020-10-22 12:09:03',2267310,3350453),(22372,1,'2020-10-22 12:09:23',2267870,3351597),(22373,1,'2020-10-22 12:09:43',2268490,3352741),(22374,1,'2020-10-22 12:10:03',2269320,3353995),(22375,1,'2020-10-22 12:10:23',2270180,3355205),(22376,1,'2020-10-22 12:10:43',2271261,3356349),(22377,1,'2020-10-22 12:11:03',2272030,3357493),(22378,1,'2020-10-22 12:11:23',2272753,3358637),(22379,1,'2020-10-22 12:11:43',2273479,3359843),(22380,1,'2020-10-22 12:12:04',2274620,3360987),(22381,1,'2020-10-22 12:12:24',2275809,3362131),(22382,1,'2020-10-22 12:12:44',2276984,3363341),(22383,1,'2020-10-22 12:13:04',2278395,3364485),(22384,1,'2020-10-22 12:13:24',2279061,3365629),(22385,1,'2020-10-22 12:13:44',2279825,3366933),(22386,1,'2020-10-22 12:14:04',2280565,3368077),(22387,1,'2020-10-22 12:14:24',2281665,3369221),(22388,1,'2020-10-22 12:14:44',2282585,3370431),(22389,1,'2020-10-22 12:15:04',2283265,3371575),(22390,1,'2020-10-22 12:15:24',2283885,3372719),(22391,1,'2020-10-22 12:15:44',2284445,3373863),(22392,1,'2020-10-22 12:16:04',2285125,3375007),(22393,1,'2020-10-22 12:16:25',2286225,3376151),(22394,1,'2020-10-22 12:16:45',2287145,3377361),(22395,1,'2020-10-22 12:17:05',2287765,3378505),(22396,1,'2020-10-22 12:17:25',2288455,3379649),(22397,1,'2020-10-22 12:17:45',2289195,3380855),(22398,1,'2020-10-22 12:18:05',2289935,3381999),(22399,1,'2020-10-22 12:18:25',2291095,3383143),(22400,1,'2020-10-22 12:18:45',2291955,3384353),(22401,1,'2020-10-22 12:19:05',2292635,3385497),(22402,1,'2020-10-22 12:19:25',2293255,3386641),(22403,1,'2020-10-22 12:19:45',2293875,3387785),(22404,1,'2020-10-22 12:20:06',2294615,3388929),(22405,1,'2020-10-22 12:20:26',2295835,3390073),(22406,1,'2020-10-22 12:20:46',2296635,3391217),(22407,1,'2020-10-22 12:21:06',2297255,3392427),(22408,1,'2020-10-22 12:21:26',2297875,3393571),(22409,1,'2020-10-22 12:21:46',2298495,3394715),(22410,1,'2020-10-22 12:22:06',2299235,3395859),(22411,1,'2020-10-22 12:22:26',2300455,3397003),(22412,1,'2020-10-22 12:22:46',2301135,3398147),(22413,1,'2020-10-22 12:23:06',2301815,3399357),(22414,1,'2020-10-22 12:23:26',2305981,3400501),(22415,1,'2020-10-22 12:23:46',2306805,3402027),(22416,1,'2020-10-22 12:24:06',2307927,3403171),(22417,1,'2020-10-22 12:24:27',2309147,3404315),(22418,1,'2020-10-22 12:24:47',2309887,3405459),(22419,1,'2020-10-22 12:25:07',2310627,3406669),(22420,1,'2020-10-22 12:25:27',2311571,3407813),(22421,1,'2020-10-22 12:25:47',2312191,3408957),(22422,1,'2020-10-22 12:26:07',2312931,3410101),(22423,1,'2020-10-22 12:26:27',2314211,3411245),(22424,1,'2020-10-22 12:26:47',2314831,3412389),(22425,1,'2020-10-22 12:27:07',2315511,3413599),(22426,1,'2020-10-22 12:27:27',2316131,3414743),(22427,1,'2020-10-22 12:27:47',2316895,3416207),(22428,1,'2020-10-22 12:28:08',2317635,3417351),(22429,1,'2020-10-22 12:28:28',2318975,3418495),(22430,1,'2020-10-22 11:35:52',0,0),(22431,1,'2020-10-22 12:28:28',2318975,3418495),(22432,1,'2020-10-22 11:36:12',4037,7547),(22433,1,'2020-10-22 12:36:25',5423,8977),(22434,1,'2020-10-22 12:36:45',6373,10215),(22435,1,'2020-10-22 12:37:05',6993,11343),(22436,1,'2020-10-22 12:37:25',7613,12471),(22437,1,'2020-10-22 12:37:45',8293,13665),(22438,1,'2020-10-22 12:38:05',9063,14903),(22439,1,'2020-10-22 12:38:25',10283,16031),(22440,1,'2020-10-22 12:38:45',11023,17159),(22441,1,'2020-10-22 12:39:05',11643,18287),(22442,1,'2020-10-22 12:39:25',12263,19415),(22443,1,'2020-10-22 12:39:45',12943,20609),(22444,1,'2020-10-22 12:40:06',13773,21847),(22445,1,'2020-10-22 12:40:26',14993,22975),(22446,1,'2020-10-22 12:40:46',15733,24103),(22447,1,'2020-10-22 12:41:06',16353,25231),(22448,1,'2020-10-22 12:41:26',16913,26359),(22449,1,'2020-10-22 12:41:46',17653,27615),(22450,1,'2020-10-22 12:42:06',18393,28743),(22451,1,'2020-10-22 12:42:26',19613,29871),(22452,1,'2020-10-22 12:42:46',20353,30999),(22453,1,'2020-10-22 12:43:06',21051,32287),(22454,1,'2020-10-22 12:43:26',21737,33415),(22455,1,'2020-10-22 12:43:46',22417,34543),(22456,1,'2020-10-22 12:44:07',23157,35737),(22457,1,'2020-10-22 12:44:27',24467,36975),(22458,1,'2020-10-22 12:44:47',25207,38103),(22459,1,'2020-10-22 12:45:07',25887,39231),(22460,1,'2020-10-22 12:45:27',26507,40359),(22461,1,'2020-10-22 12:45:47',27187,41487),(22462,1,'2020-10-22 12:46:07',27927,42681),(22463,1,'2020-10-22 12:46:27',29327,43871),(22464,1,'2020-10-22 12:46:47',29947,44999),(22465,1,'2020-10-22 12:47:07',30645,46287),(22466,1,'2020-10-22 12:47:27',31331,47415),(22467,1,'2020-10-22 12:47:47',31951,48543),(22468,1,'2020-10-22 12:48:08',32691,49737),(22469,1,'2020-10-22 12:48:28',33971,50865),(22470,1,'2020-10-22 12:48:48',34591,51993),(22471,1,'2020-10-22 12:49:08',35211,53121),(22472,1,'2020-10-22 12:49:28',35831,54249),(22473,1,'2020-10-22 12:49:48',36451,55377),(22474,1,'2020-10-22 12:50:08',37251,56571),(22475,1,'2020-10-22 12:50:28',38591,57699),(22476,1,'2020-10-22 12:50:48',39211,58827),(22477,1,'2020-10-22 12:51:08',39891,60017),(22478,1,'2020-10-22 12:51:28',40511,61145),(22479,1,'2020-10-22 12:51:48',41191,62273),(22480,1,'2020-10-22 12:52:09',41991,63467),(22481,1,'2020-10-22 12:52:29',43331,64595),(22482,1,'2020-10-22 12:52:49',44041,65833),(22483,1,'2020-10-22 12:53:09',44601,66961),(22484,1,'2020-10-22 12:53:29',45221,68089),(22485,1,'2020-10-22 12:53:49',45841,69217),(22486,1,'2020-10-22 12:54:09',46641,70411),(22487,1,'2020-10-22 12:54:29',47921,71539),(22488,1,'2020-10-22 12:54:49',48481,72667),(22489,1,'2020-10-22 12:55:09',49161,73795),(22490,1,'2020-10-22 12:55:29',49841,74985),(22491,1,'2020-10-22 12:55:49',50701,76113),(22492,1,'2020-10-22 12:56:10',51381,77241),(22493,1,'2020-10-22 12:56:30',52721,78435),(22494,1,'2020-10-22 12:56:50',53341,79563),(22495,1,'2020-10-22 12:57:10',54105,80851),(22496,1,'2020-10-22 12:57:30',54725,81979),(22497,1,'2020-10-22 12:57:50',55345,83107),(22498,1,'2020-10-22 12:58:10',56145,84297),(22499,1,'2020-10-22 12:58:30',57545,85491),(22500,1,'2020-10-22 12:58:50',58165,86619),(22501,1,'2020-10-22 12:59:10',58785,87747),(22502,1,'2020-10-22 12:59:30',59405,88875),(22503,1,'2020-10-22 12:59:50',60025,90003),(22504,1,'2020-10-22 13:00:11',60765,91131),(22505,1,'2020-10-22 13:00:31',62165,92325),(22506,1,'2020-10-22 13:00:51',62785,93453),(22507,1,'2020-10-22 13:01:11',63405,94581),(22508,1,'2020-10-22 13:01:31',64025,95771),(22509,1,'2020-10-22 13:01:51',64645,96899),(22510,1,'2020-10-22 13:02:11',65385,98027),(22511,1,'2020-10-22 13:02:31',66785,99155),(22512,1,'2020-10-22 13:02:51',67405,100349),(22513,1,'2020-10-22 13:03:11',68025,101493),(22514,1,'2020-10-22 13:03:31',68645,102637),(22515,1,'2020-10-22 13:03:51',69205,103781),(22516,1,'2020-10-22 13:04:12',69945,104925),(22517,1,'2020-10-22 13:04:32',71285,106069),(22518,1,'2020-10-22 13:04:52',71965,107341),(22519,1,'2020-10-22 13:05:12',73059,108645),(22520,1,'2020-10-22 13:05:32',73799,109789),(22521,1,'2020-10-22 13:05:52',74419,110933),(22522,1,'2020-10-22 13:06:12',75159,112077),(22523,1,'2020-10-22 13:06:32',76499,113221),(22524,1,'2020-10-22 13:06:52',77179,114431),(22525,1,'2020-10-22 13:07:12',77799,115575),(22526,1,'2020-10-22 13:07:32',78419,116719),(22527,1,'2020-10-22 13:07:52',79039,117863),(22528,1,'2020-10-22 13:08:13',79719,119007),(22529,1,'2020-10-22 13:08:33',81119,120151),(22530,1,'2020-10-22 13:08:53',81799,121361),(22531,1,'2020-10-22 13:09:13',82419,122505),(22532,1,'2020-10-22 13:09:33',83039,123649),(22533,1,'2020-10-22 13:09:53',83749,124903),(22534,1,'2020-10-22 13:10:14',84489,126047),(22535,1,'2020-10-22 13:10:34',85829,127253),(22536,1,'2020-10-22 13:10:54',86509,128463),(22537,1,'2020-10-22 13:11:14',87129,129607),(22538,1,'2020-10-22 13:11:34',87749,130751),(22539,1,'2020-10-22 13:11:54',88369,131895),(22540,1,'2020-10-22 13:12:14',89109,133039),(22541,1,'2020-10-22 13:12:34',90449,134183),(22542,1,'2020-10-22 13:12:54',91129,135393),(22543,1,'2020-10-22 13:13:14',91749,136537),(22544,1,'2020-10-22 13:13:34',92369,137681),(22545,1,'2020-10-22 13:13:54',92989,138825),(22546,1,'2020-10-22 13:14:15',93729,139969),(22547,1,'2020-10-22 13:14:35',106947,141113),(22548,1,'2020-10-22 13:14:55',118536,142319),(22549,1,'2020-10-22 13:15:15',124912,143529),(22550,1,'2020-10-22 13:15:35',126878,144673),(22551,1,'2020-10-22 13:15:55',129192,145817),(22552,1,'2020-10-22 13:16:15',132224,146961),(22553,1,'2020-10-22 13:16:35',134629,148105),(22554,1,'2020-10-22 13:16:55',135249,149249),(22555,1,'2020-10-22 13:17:15',136013,150553),(22556,1,'2020-10-22 13:17:35',137455,151697),(22557,1,'2020-10-22 13:17:55',138075,152841),(22558,1,'2020-10-22 13:18:16',138875,153985),(22559,1,'2020-10-22 13:18:36',141021,155129),(22560,1,'2020-10-22 13:18:56',141701,156273),(22561,1,'2020-10-22 13:19:16',146689,157483),(22562,1,'2020-10-22 13:19:36',148473,158689),(22563,1,'2020-10-22 13:19:56',149093,159833),(22564,1,'2020-10-22 13:20:16',150255,160977),(22565,1,'2020-10-22 13:20:36',153611,162219),(22566,1,'2020-10-22 13:20:56',154231,163363),(22567,1,'2020-10-22 13:21:16',155175,164733),(22568,1,'2020-10-22 13:21:36',155795,165877),(22569,1,'2020-10-22 13:21:56',156355,167021),(22570,1,'2020-10-22 13:22:17',157215,168165),(22571,1,'2020-10-22 13:22:37',158561,169309),(22572,1,'2020-10-22 13:22:57',159181,170453),(22573,1,'2020-10-22 13:23:17',159801,171597),(22574,1,'2020-10-22 13:23:37',162733,172807),(22575,1,'2020-10-22 13:23:57',163614,173951),(22576,1,'2020-10-22 13:24:17',164796,175095),(22577,1,'2020-10-22 13:24:37',166142,176239),(22578,1,'2020-10-22 13:24:57',166822,177445),(22579,1,'2020-10-22 13:25:17',167502,178589),(22580,1,'2020-10-22 13:25:37',168228,179799),(22581,1,'2020-10-22 13:25:57',168968,180943),(22582,1,'2020-10-22 13:26:18',169990,182087),(22583,1,'2020-10-22 13:26:38',171174,183231),(22584,1,'2020-10-22 13:26:58',171794,184375),(22585,1,'2020-10-22 13:27:18',172558,185679),(22586,1,'2020-10-22 13:27:38',173284,186889),(22587,1,'2020-10-22 13:27:58',173964,188033),(22588,1,'2020-10-22 13:28:18',174926,189177),(22589,1,'2020-10-22 13:28:38',176050,190321),(22590,1,'2020-10-22 13:28:58',176670,191465),(22591,1,'2020-10-22 13:29:18',178008,192609),(22592,1,'2020-10-22 13:29:38',183320,193753),(22593,1,'2020-10-22 13:29:58',184000,194963),(22594,1,'2020-10-22 13:30:19',185628,196107),(22595,1,'2020-10-22 13:30:39',186752,197251),(22596,1,'2020-10-22 13:30:59',187492,198395),(22597,1,'2020-10-22 13:31:19',188112,199539),(22598,1,'2020-10-22 13:31:39',188792,200749),(22599,1,'2020-10-22 13:31:59',189532,201893),(22600,1,'2020-10-22 13:32:19',191606,203099),(22601,1,'2020-10-22 13:32:39',192890,204243),(22602,1,'2020-10-22 13:32:59',193510,205387),(22603,1,'2020-10-22 13:33:19',194130,206531),(22604,1,'2020-10-22 13:33:40',194750,207675),(22605,1,'2020-10-22 13:34:00',195596,208885),(22606,1,'2020-10-22 13:34:20',196600,210029),(22607,1,'2020-10-22 13:34:40',197682,211173),(22608,1,'2020-10-22 13:35:00',198302,212317),(22609,1,'2020-10-22 13:35:20',198922,213461),(22610,1,'2020-10-22 13:35:40',199542,214605),(22611,1,'2020-10-22 13:36:00',200462,215815),(22612,1,'2020-10-22 13:36:20',201568,216959),(22613,1,'2020-10-22 13:36:41',202548,218103),(22614,1,'2020-10-22 13:37:01',203228,219309),(22615,1,'2020-10-22 13:37:21',203992,220773),(22616,1,'2020-10-22 13:37:41',204612,221917),(22617,1,'2020-10-22 13:38:01',205412,223127),(22618,1,'2020-10-22 13:38:21',206518,224271),(22619,1,'2020-10-22 13:38:41',207601,225415),(22620,1,'2020-10-22 13:39:01',208221,226559),(22621,1,'2020-10-22 13:39:21',208841,227703),(22622,1,'2020-10-22 13:39:41',214487,228847),(22623,1,'2020-10-22 13:40:01',215287,229991),(22624,1,'2020-10-22 13:40:21',216393,231201),(22625,1,'2020-10-22 13:40:42',217433,232407),(22626,1,'2020-10-22 13:41:02',218173,233551),(22627,1,'2020-10-22 13:41:22',218937,235015),(22628,1,'2020-10-22 13:41:42',220379,236159),(22629,1,'2020-10-22 13:42:02',221119,237303),(22630,1,'2020-10-22 13:42:22',222271,238513),(22631,1,'2020-10-22 13:42:42',223191,239657),(22632,1,'2020-10-22 13:43:02',223811,240801),(22633,1,'2020-10-22 13:43:22',224431,241945),(22634,1,'2020-10-22 13:43:42',225051,243089),(22635,1,'2020-10-22 13:44:02',225881,244343),(22636,1,'2020-10-22 13:44:22',227153,245553),(22637,1,'2020-10-22 13:44:42',228073,246697),(22638,1,'2020-10-22 13:45:03',229515,247841),(22639,1,'2020-10-22 13:45:23',230255,249047),(22640,1,'2020-10-22 13:45:43',230875,250191),(22641,1,'2020-10-22 13:46:03',231735,251335),(22642,1,'2020-10-22 13:46:23',233031,252545),(22643,1,'2020-10-22 13:46:43',233891,253689),(22644,1,'2020-10-22 13:47:03',234511,254833),(22645,1,'2020-10-22 13:47:23',236066,255977),(22646,1,'2020-10-22 13:47:43',236830,257281),(22647,1,'2020-10-22 13:48:04',238176,258425),(22648,1,'2020-10-22 13:48:24',239448,259635),(22649,1,'2020-10-22 13:48:44',240368,260779),(22650,1,'2020-10-22 13:49:04',240928,261923),(22651,1,'2020-10-22 13:49:24',241548,263067),(22652,1,'2020-10-22 13:49:44',247194,264211),(22653,1,'2020-10-22 13:50:04',247934,265355),(22654,1,'2020-10-22 13:50:24',249326,266561),(22655,1,'2020-10-22 13:50:44',250186,267771),(22656,1,'2020-10-22 13:51:04',251923,269431),(22657,1,'2020-10-22 13:51:24',252543,270575),(22658,1,'2020-10-22 13:51:44',253163,271719),(22659,1,'2020-10-22 13:52:05',253903,272863),(22660,1,'2020-10-22 13:52:25',255129,274007),(22661,1,'2020-10-22 13:52:45',256049,275217),(22662,1,'2020-10-22 13:53:05',256669,276361),(22663,1,'2020-10-22 13:53:25',257804,277505),(22664,1,'2020-10-22 13:53:45',258424,278649),(22665,1,'2020-10-22 13:54:05',259164,279793),(22666,1,'2020-10-22 13:54:25',261138,281195),(22667,1,'2020-10-22 13:54:45',262366,282983),(22668,1,'2020-10-22 13:55:05',262926,284127),(22669,1,'2020-10-22 13:55:25',263828,285751),(22670,1,'2020-10-22 13:55:45',264514,286957),(22671,1,'2020-10-22 13:56:06',265374,288101),(22672,1,'2020-10-22 13:56:26',266864,289405),(22673,1,'2020-10-22 13:56:46',267664,290615),(22674,1,'2020-10-22 13:57:06',268284,291759),(22675,1,'2020-10-22 13:57:26',268904,292903),(22676,1,'2020-10-22 13:57:46',269524,294047),(22677,1,'2020-10-22 13:58:06',270264,295191),(22678,1,'2020-10-22 13:58:26',271610,296335),(22679,1,'2020-10-22 13:58:46',272350,297545),(22680,1,'2020-10-22 13:59:06',273108,298911),(22681,1,'2020-10-22 13:59:26',273794,300055),(22682,1,'2020-10-22 13:59:46',274414,301199),(22683,1,'2020-10-22 14:00:07',280240,302343),(22684,1,'2020-10-22 14:00:27',281586,303487),(22685,1,'2020-10-22 14:00:47',282386,304697),(22686,1,'2020-10-22 14:01:07',283126,305841),(22687,1,'2020-10-22 14:01:27',283746,306985),(22688,1,'2020-10-22 14:01:47',284366,308129),(22689,1,'2020-10-22 14:02:07',285106,309273),(22690,1,'2020-10-22 14:02:27',286512,310417),(22691,1,'2020-10-22 14:02:47',287132,311561),(22692,1,'2020-10-22 14:03:07',288010,312931),(22693,1,'2020-10-22 14:03:27',288756,314075),(22694,1,'2020-10-22 14:03:47',289376,315219),(22695,1,'2020-10-22 14:04:08',290116,316363),(22696,1,'2020-10-22 14:04:28',291642,317507),(22697,1,'2020-10-22 14:04:48',292262,318651),(22698,1,'2020-10-22 14:05:08',292882,319861),(22699,1,'2020-10-22 14:05:28',293562,321005),(22700,1,'2020-10-22 14:05:48',294182,322149),(22701,1,'2020-10-22 14:06:08',295102,323355),(22702,1,'2020-10-22 14:06:28',296508,324499),(22703,1,'2020-10-22 14:06:48',297128,325643),(22704,1,'2020-10-22 14:07:08',297748,326787),(22705,1,'2020-10-22 14:07:28',298368,327931),(22706,1,'2020-10-22 14:07:48',298988,329075),(22707,1,'2020-10-22 14:08:09',299728,330219),(22708,1,'2020-10-22 14:08:29',301074,331363),(22709,1,'2020-10-22 14:08:49',301694,332507),(22710,1,'2020-10-22 14:09:09',302374,333717),(22711,1,'2020-10-22 14:09:29',302934,334861),(22712,1,'2020-10-22 14:09:49',303554,336005),(22713,1,'2020-10-22 14:10:09',309320,337149),(22714,1,'2020-10-22 14:10:29',310642,338293),(22715,1,'2020-10-22 14:10:49',313608,342091),(22716,1,'2020-10-22 14:11:09',315836,344805),(22717,1,'2020-10-22 14:11:29',316916,346015),(22718,1,'2020-10-22 14:11:49',318760,347159),(22719,1,'2020-10-22 14:12:10',319500,348303),(22720,1,'2020-10-22 14:12:30',320762,349447),(22721,1,'2020-10-22 14:12:50',322160,350653),(22722,1,'2020-10-22 14:13:10',322780,351797),(22723,1,'2020-10-22 14:13:30',323400,353007),(22724,1,'2020-10-22 14:13:50',324744,354151),(22725,1,'2020-10-22 14:14:10',326424,355295),(22726,1,'2020-10-22 14:14:30',328567,356439),(22727,1,'2020-10-22 14:14:50',329187,357583),(22728,1,'2020-10-22 14:15:10',329951,358887),(22729,1,'2020-10-22 14:15:30',330691,360097),(22730,1,'2020-10-22 14:15:50',331251,361241),(22731,1,'2020-10-22 14:16:11',332051,362385),(22732,1,'2020-10-22 14:16:31',333277,363529),(22733,1,'2020-10-22 14:16:51',333897,364673),(22734,1,'2020-10-22 14:17:11',334517,365817),(22735,1,'2020-10-22 14:17:31',335137,366961),(22736,1,'2020-10-22 14:17:51',335757,368171),(22737,1,'2020-10-22 14:18:11',336647,369487),(22738,1,'2020-10-22 14:18:31',338113,370631),(22739,1,'2020-10-22 14:18:51',338733,371775),(22740,1,'2020-10-22 14:19:11',339413,372919),(22741,1,'2020-10-22 14:19:31',340093,374063),(22742,1,'2020-10-22 14:19:51',340713,375273),(22743,1,'2020-10-22 14:20:12',345043,376417),(22744,1,'2020-10-22 14:20:32',347705,377561),(22745,1,'2020-10-22 14:20:52',350246,380719),(22746,1,'2020-10-22 14:21:12',355077,386131),(22747,1,'2020-10-22 14:21:32',365557,399259),(22748,1,'2020-10-22 14:21:52',369913,404083),(22749,1,'2020-10-22 14:22:12',373175,407707),(22750,1,'2020-10-22 14:22:32',374539,408913),(22751,1,'2020-10-22 14:22:52',376399,411553),(22752,1,'2020-10-22 14:23:13',377847,413667),(22753,1,'2020-10-22 14:23:33',380401,416887),(22754,1,'2020-10-22 14:23:53',381965,418829),(22755,1,'2020-10-22 14:24:13',383205,419973),(22756,1,'2020-10-22 14:24:33',393158,421117),(22757,1,'2020-10-22 14:24:53',393778,422261),(22758,1,'2020-10-22 14:25:13',394398,423405),(22759,1,'2020-10-22 14:25:33',395138,424611),(22760,1,'2020-10-22 14:25:53',396024,426643),(22761,1,'2020-10-22 14:26:13',398668,427787),(22762,1,'2020-10-22 14:26:33',404790,430945),(22763,1,'2020-10-22 14:26:54',407262,433425),(22764,1,'2020-10-22 14:27:14',407882,434569),(22765,1,'2020-10-22 14:27:34',408502,435713),(22766,1,'2020-10-22 14:27:54',409848,438455),(22767,1,'2020-10-22 14:28:14',410588,440135),(22768,1,'2020-10-22 14:28:34',411994,441467),(22769,1,'2020-10-22 14:28:54',416396,448395),(22770,1,'2020-10-22 14:29:14',417016,449539),(22771,1,'2020-10-22 14:29:34',417576,450683),(22772,1,'2020-10-22 14:29:54',420545,454761),(22773,1,'2020-10-22 14:30:14',434799,472889),(22774,1,'2020-10-22 14:30:34',450423,485821),(22775,1,'2020-10-22 14:30:55',456965,494667),(22776,1,'2020-10-22 14:31:15',458865,499515),(22777,1,'2020-10-22 14:31:35',471607,509365),(22778,1,'2020-10-22 14:31:55',472449,510885),(22779,1,'2020-10-22 14:32:15',478859,520947),(22780,1,'2020-10-22 14:32:35',481293,523533),(22781,1,'2020-10-22 14:32:55',481973,524739),(22782,1,'2020-10-22 14:33:15',482593,525883),(22783,1,'2020-10-22 14:33:35',489911,536157),(22784,1,'2020-10-22 14:33:55',490531,537301),(22785,1,'2020-10-22 14:34:15',491451,538511),(22786,1,'2020-10-22 14:34:36',500439,539655),(22787,1,'2020-10-22 14:34:56',504408,540799),(22788,1,'2020-10-22 14:35:16',507384,542189),(22789,1,'2020-10-22 14:35:36',509366,543333),(22790,1,'2020-10-22 14:35:56',509986,544477),(22791,1,'2020-10-22 14:36:16',510966,545687),(22792,1,'2020-10-22 14:36:36',512312,546831),(22793,1,'2020-10-22 14:36:56',512932,547975),(22794,1,'2020-10-22 14:37:16',515246,549119),(22795,1,'2020-10-22 14:37:36',515866,550263),(22796,1,'2020-10-22 14:37:56',516546,551407),(22797,1,'2020-10-22 14:38:16',517406,552551),(22798,1,'2020-10-22 14:38:37',519416,553761),(22799,1,'2020-10-22 14:38:57',520036,554905),(22800,1,'2020-10-22 14:39:17',520716,556111),(22801,1,'2020-10-22 14:39:37',521336,557255),(22802,1,'2020-10-22 14:39:57',522016,558399),(22803,1,'2020-10-22 14:40:17',522816,559543),(22804,1,'2020-10-22 14:40:37',529248,560753),(22805,1,'2020-10-22 14:40:57',529868,561897),(22806,1,'2020-10-22 14:41:17',530752,563201),(22807,1,'2020-10-22 14:41:37',531372,564345),(22808,1,'2020-10-22 14:41:57',532052,565489),(22809,1,'2020-10-22 14:42:18',532912,566633),(22810,1,'2020-10-22 14:42:38',534258,567843),(22811,1,'2020-10-22 14:42:58',534878,568987),(22812,1,'2020-10-22 14:43:18',537358,572145),(22813,1,'2020-10-22 14:43:38',538750,573745),(22814,1,'2020-10-22 14:43:58',541470,576903),(22815,1,'2020-10-22 14:44:18',542852,578275),(22816,1,'2020-10-22 14:44:38',544198,579559),(22817,1,'2020-10-22 14:44:58',544878,580765),(22818,1,'2020-10-22 14:45:18',545558,581909),(22819,1,'2020-10-22 14:45:39',546178,583053),(22820,1,'2020-10-22 14:45:59',547038,584197),(22821,1,'2020-10-22 14:46:19',547958,585341),(22822,1,'2020-10-22 14:46:39',549064,586485),(22823,1,'2020-10-22 14:46:59',549684,587695),(22824,1,'2020-10-22 14:47:19',552133,592839),(22825,1,'2020-10-22 14:47:39',552753,593983),(22826,1,'2020-10-22 14:47:59',553493,595127),(22827,1,'2020-10-22 14:48:19',554413,596271),(22828,1,'2020-10-22 14:48:39',555579,597415),(22829,1,'2020-10-22 14:48:59',558677,600793),(22830,1,'2020-10-22 14:49:19',561337,604173),(22831,1,'2020-10-22 14:49:39',565771,610099),(22832,1,'2020-10-22 14:50:00',568221,613535),(22833,1,'2020-10-22 14:50:20',569489,614975),(22834,1,'2020-10-22 14:50:40',573995,616477),(22835,1,'2020-10-22 14:51:00',577357,617983),(22836,1,'2020-10-22 14:51:20',578385,619423),(22837,1,'2020-10-22 14:51:40',579413,620863),(22838,1,'2020-10-22 14:52:00',580561,622303),(22839,1,'2020-10-22 14:52:20',581979,623853),(22840,1,'2020-10-22 14:52:40',583553,625305),(22841,1,'2020-10-22 14:53:00',584743,626885),(22842,1,'2020-10-22 14:53:20',585873,628411),(22843,1,'2020-10-22 14:53:40',586901,629851),(22844,1,'2020-10-22 14:54:01',588049,631291),(22845,1,'2020-10-22 14:54:21',589437,632731),(22846,1,'2020-10-22 14:54:41',590951,634171),(22847,1,'2020-10-22 14:55:01',592039,635677),(22848,1,'2020-10-22 14:55:21',593271,637437),(22849,1,'2020-10-22 14:55:41',594299,638877),(22850,1,'2020-10-22 14:56:01',595627,640379),(22851,1,'2020-10-22 14:56:21',597155,641917),(22852,1,'2020-10-22 14:56:41',598669,643357),(22853,1,'2020-10-22 14:57:01',599637,644797),(22854,1,'2020-10-22 14:57:21',600665,646237),(22855,1,'2020-10-22 14:57:41',601693,647677),(22856,1,'2020-10-22 14:58:02',602841,649117),(22857,1,'2020-10-22 14:58:22',604169,650557),(22858,1,'2020-10-22 14:58:42',605683,651997),(22859,1,'2020-10-22 14:59:02',606711,653437),(22860,1,'2020-10-22 14:59:22',607799,654943),(22861,1,'2020-10-22 14:59:42',608827,656383),(22862,1,'2020-10-22 15:00:02',609975,657823),(22863,1,'2020-10-22 15:00:22',611423,659263),(22864,1,'2020-10-22 15:00:42',612877,660703),(22865,1,'2020-10-22 15:01:03',619153,662229),(22866,1,'2020-10-22 15:01:23',620445,664117),(22867,1,'2020-10-22 15:01:43',621473,665557),(22868,1,'2020-10-22 15:02:03',622621,666997),(22869,1,'2020-10-22 15:02:23',624009,668437),(22870,1,'2020-10-22 15:02:43',625463,669877),(22871,1,'2020-10-22 15:03:03',626593,671403),(22872,1,'2020-10-22 15:03:23',627681,672909),(22873,1,'2020-10-22 15:03:43',628709,674349),(22874,1,'2020-10-22 15:04:03',629797,675789),(22875,1,'2020-10-22 15:04:23',632137,677229),(22876,1,'2020-10-22 15:04:44',633591,678669),(22877,1,'2020-10-22 15:05:04',634721,680195),(22878,1,'2020-10-22 15:05:24',635869,681635),(22879,1,'2020-10-22 15:05:44',639729,686295),(22880,1,'2020-10-22 15:06:04',640997,687735),(22881,1,'2020-10-22 15:06:24',642607,689261),(22882,1,'2020-10-22 15:06:44',644205,690873),(22883,1,'2020-10-22 15:07:04',645233,692313),(22884,1,'2020-10-22 15:07:24',647153,693753),(22885,1,'2020-10-22 15:07:44',648241,695259),(22886,1,'2020-10-22 15:08:04',651087,699009),(22887,1,'2020-10-22 15:08:24',652817,700597),(22888,1,'2020-10-22 15:08:45',654211,702037),(22889,1,'2020-10-22 15:09:05',655351,703887),(22890,1,'2020-10-22 15:09:25',656037,705031),(22891,1,'2020-10-22 15:09:45',656717,706241),(22892,1,'2020-10-22 15:10:05',657457,707385),(22893,1,'2020-10-22 15:10:25',658677,708529),(22894,1,'2020-10-22 15:10:45',660644,710741),(22895,1,'2020-10-22 15:11:05',671812,720569),(22896,1,'2020-10-22 15:11:25',675046,725779),(22897,1,'2020-10-22 15:11:45',675726,726989),(22898,1,'2020-10-22 15:12:05',676466,728133),(22899,1,'2020-10-22 15:12:26',677686,729277),(22900,1,'2020-10-22 15:12:46',680472,732435),(22901,1,'2020-10-22 15:13:06',682774,735521),(22902,1,'2020-10-22 15:13:26',688703,742893),(22903,1,'2020-10-22 15:13:46',693381,749906),(22904,1,'2020-10-22 15:14:06',696177,754376),(22905,1,'2020-10-22 15:14:26',700044,756728),(22906,1,'2020-10-22 15:14:46',701318,758168),(22907,1,'2020-10-22 15:15:06',702526,759854),(22908,1,'2020-10-22 15:15:26',707276,766665),(22909,1,'2020-10-22 15:15:46',711305,772035),(22910,1,'2020-10-22 15:16:06',712573,773541),(22911,1,'2020-10-22 15:16:27',714141,774981),(22912,1,'2020-10-22 15:16:47',715415,776421),(22913,1,'2020-10-22 15:17:07',716443,777861),(22914,1,'2020-10-22 15:17:27',724113,785701),(22915,1,'2020-10-22 15:17:47',725141,787141),(22916,1,'2020-10-22 15:18:07',726349,788647),(22917,1,'2020-10-22 15:18:27',728097,790087),(22918,1,'2020-10-22 15:18:47',731382,793689),(22919,1,'2020-10-22 15:19:07',1009542,807065),(22920,1,'2020-10-22 15:19:28',1430546,827743),(22921,1,'2020-10-22 15:19:48',1439152,914683),(22922,1,'2020-10-22 15:20:08',1442316,918417),(22923,1,'2020-10-22 15:20:28',1446552,922763),(22924,1,'2020-10-22 15:20:48',1448546,953655),(22925,1,'2020-10-22 15:21:08',1449898,955267),(22926,1,'2020-10-22 15:21:28',1457512,958409),(22927,1,'2020-10-22 15:21:48',1458718,960109),(22928,1,'2020-10-22 15:22:08',1462842,971437),(22929,1,'2020-10-22 15:22:28',1464650,972877),(22930,1,'2020-10-22 15:22:48',1465804,974317),(22931,1,'2020-10-22 15:23:09',1468709,977765),(22932,1,'2020-10-22 15:23:29',1655690,990901),(22933,1,'2020-10-22 15:23:49',1664532,1026753),(22934,1,'2020-10-22 15:24:09',1666342,1041765),(22935,1,'2020-10-22 15:24:29',1668030,1043271),(22936,1,'2020-10-22 15:24:49',1669362,1045077),(22937,1,'2020-10-22 15:25:09',1671818,1053337),(22938,1,'2020-10-22 15:25:29',1672906,1054777),(22939,1,'2020-10-22 15:25:49',1678450,1061511),(22940,1,'2020-10-22 15:26:09',1704686,1086153),(22941,1,'2020-10-22 15:26:29',1718452,1098017),(22942,1,'2020-10-22 15:26:50',1742848,1112713),(22943,1,'2020-10-22 15:27:10',1750202,1118943),(22944,1,'2020-10-22 15:27:30',2536895,1169511),(22945,1,'2020-10-22 15:27:50',2537923,1170951),(22946,1,'2020-10-22 15:28:10',2539249,1172603),(22947,1,'2020-10-22 15:28:30',2541117,1174171),(22948,1,'2020-10-22 15:28:50',2542271,1175611),(22949,1,'2020-10-22 15:29:10',2543299,1177051),(22950,1,'2020-10-22 15:29:30',2544327,1178491),(22951,1,'2020-10-22 15:29:50',2545355,1179931),(22952,1,'2020-10-22 15:30:10',2548165,1183159),(22953,1,'2020-10-22 15:30:30',2549973,1184665),(22954,1,'2020-10-22 15:30:51',2551127,1186105),(22955,1,'2020-10-22 15:31:11',2552377,1187631),(22956,1,'2020-10-22 15:31:31',2558473,1189157),(22957,1,'2020-10-22 15:31:51',2566757,1200571),(22958,1,'2020-10-22 15:32:11',2567905,1202011),(22959,1,'2020-10-22 15:32:31',2569815,1203603),(22960,1,'2020-10-22 15:32:51',2570969,1205043),(22961,1,'2020-10-22 15:33:11',2571997,1206483),(22962,1,'2020-10-22 15:33:31',2573127,1208009),(22963,1,'2020-10-22 15:33:51',2574155,1209449),(22964,1,'2020-10-22 15:34:11',2575303,1210889),(22965,1,'2020-10-22 15:34:31',2577171,1212391),(22966,1,'2020-10-22 15:34:52',9906923,1447464),(22967,1,'2020-10-22 15:35:12',9908191,1449744),(22968,1,'2020-10-22 15:35:32',9909519,1452306),(22969,1,'2020-10-22 15:35:58',10621869,1489276),(22970,1,'2020-10-22 15:36:18',10626945,1498164),(22971,1,'2020-10-22 15:36:38',10628435,1499456),(22972,1,'2020-10-22 15:36:58',10629559,1500962),(22973,1,'2020-10-22 15:37:18',10633101,1505108),(22974,1,'2020-10-22 15:37:38',10634129,1506548),(22975,1,'2020-10-22 15:37:58',10635277,1507988),(22976,1,'2020-10-22 15:38:19',10638294,1511212),(22977,1,'2020-10-22 15:38:39',10682840,1516258),(22978,1,'2020-10-22 15:38:59',10689206,1525886),(22979,1,'2020-10-22 15:39:19',10693584,1535298),(22980,1,'2020-10-22 15:39:39',10696926,1542008),(22981,1,'2020-10-22 15:39:59',10698074,1543448),(22982,1,'2020-10-22 15:40:19',10699342,1544888),(22983,1,'2020-10-22 15:40:39',10702759,1550208),(22984,1,'2020-10-22 15:40:59',10710247,1559048),(22985,1,'2020-10-22 15:41:19',10738065,1569506),(22986,1,'2020-10-22 15:41:39',10745543,1574124),(22987,1,'2020-10-22 15:41:59',10747031,1576100),(22988,1,'2020-10-22 15:42:20',10751283,1587690),(22989,1,'2020-10-22 15:42:40',10760425,1596218),(22990,1,'2020-10-22 15:43:00',10767569,1607348),(22991,1,'2020-10-22 15:43:20',10774913,1619944),(22992,1,'2020-10-22 15:43:40',10781333,1632120),(22993,1,'2020-10-22 15:44:00',10787627,1637948),(22994,1,'2020-10-22 15:44:20',10794349,1647114),(22995,1,'2020-10-22 15:44:40',10795983,1648616),(22996,1,'2020-10-22 15:45:00',10800635,1660646),(22997,1,'2020-10-22 15:45:20',10805673,1667044),(22998,1,'2020-10-22 15:45:40',10811131,1676082),(22999,1,'2020-10-22 15:46:00',10814711,1685978),(23000,1,'2020-10-22 15:46:21',10826585,1704802),(23001,1,'2020-10-22 15:46:41',10831603,1711256),(23002,1,'2020-10-22 15:47:01',10835683,1718820),(23003,1,'2020-10-22 15:47:21',10837489,1720992),(23004,1,'2020-10-22 15:47:41',10841495,1725526),(23005,1,'2020-10-22 15:48:01',10842643,1726966),(23006,1,'2020-10-22 15:48:21',10844133,1728492),(23007,1,'2020-10-22 15:48:41',10845647,1729932),(23008,1,'2020-10-22 15:49:01',10846675,1731372),(23009,1,'2020-10-22 15:49:21',10847847,1733198),(23010,1,'2020-10-22 15:49:41',10848875,1734638),(23011,1,'2020-10-22 15:50:01',10850023,1736078),(23012,1,'2020-10-22 15:50:22',10851411,1737518),(23013,1,'2020-10-22 15:50:42',10852823,1738884),(23014,1,'2020-10-22 15:51:02',10854073,1740398),(23015,1,'2020-10-22 15:51:22',10855221,1741966),(23016,1,'2020-10-22 15:51:42',10872921,1752650),(23017,1,'2020-10-22 15:52:02',10893791,1763592),(23018,1,'2020-10-22 15:52:22',10902603,1772712),(23019,1,'2020-10-22 15:52:42',10906401,1776286),(23020,1,'2020-10-22 15:53:02',10907471,1777812),(23021,1,'2020-10-22 15:53:22',10908559,1779252),(23022,1,'2020-10-22 15:53:42',10909527,1780758),(23023,1,'2020-10-22 15:54:03',10918329,1782284),(23024,1,'2020-10-22 15:54:23',10921143,1784366),(23025,1,'2020-10-22 15:54:43',10922597,1785806),(23026,1,'2020-10-22 15:55:03',10924517,1787246),(23027,1,'2020-10-22 15:55:23',10925605,1788752),(23028,1,'2020-10-22 15:55:43',10927585,1790192),(23029,1,'2020-10-22 15:56:03',10928853,1791632),(23030,1,'2020-10-22 15:56:23',10932590,1795486),(23031,1,'2020-10-22 15:56:43',10934596,1796988),(23032,1,'2020-10-22 15:57:03',10935726,1798514),(23033,1,'2020-10-22 15:57:23',10938200,1801718),(23034,1,'2020-10-22 15:57:43',10939288,1803224),(23035,1,'2020-10-22 15:58:03',10942683,1806486),(23036,1,'2020-10-22 15:58:24',10944707,1808420),(23037,1,'2020-10-22 15:58:44',10946161,1809860),(23038,1,'2020-10-22 15:59:04',10947129,1811300),(23039,1,'2020-10-22 15:59:24',10948157,1812740),(23040,1,'2020-10-22 15:59:44',10949245,1814246),(23041,1,'2020-10-22 16:00:04',10950393,1815686),(23042,1,'2020-10-22 16:00:24',10951841,1817126),(23043,1,'2020-10-22 16:00:44',10953325,1818676),(23044,1,'2020-10-22 16:01:04',10955011,1820722),(23045,1,'2020-10-22 16:01:24',10956039,1822162),(23046,1,'2020-10-22 16:01:44',10957187,1823730),(23047,1,'2020-10-22 16:02:04',10963361,1825170),(23048,1,'2020-10-22 16:02:25',10964869,1826610),(23049,1,'2020-10-22 16:02:45',10966263,1828050),(23050,1,'2020-10-22 16:03:05',10967291,1829490),(23051,1,'2020-10-22 16:03:25',10968319,1830930),(23052,1,'2020-10-22 16:03:45',10969407,1832370),(23053,1,'2020-10-22 16:04:05',10970555,1833876),(23054,1,'2020-10-22 16:04:25',10972183,1835316),(23055,1,'2020-10-22 16:04:45',10973457,1836756),(23056,1,'2020-10-22 16:05:05',10974545,1838258),(23057,1,'2020-10-22 16:05:25',10975633,1839698),(23058,1,'2020-10-22 16:05:45',10976721,1841138),(23059,1,'2020-10-22 16:06:05',10977989,1842644),(23060,1,'2020-10-22 16:06:26',10979659,1844170),(23061,1,'2020-10-22 16:06:46',10980933,1845610),(23062,1,'2020-10-22 16:07:06',10982267,1847704),(23063,1,'2020-10-22 16:07:26',10982953,1848848),(23064,1,'2020-10-22 16:07:46',10983573,1849992),(23065,1,'2020-10-22 16:08:06',10984373,1851202),(23066,1,'2020-10-22 16:08:26',10985593,1852346),(23067,1,'2020-10-22 16:08:46',10986459,1853490),(23068,1,'2020-10-22 16:09:06',10987079,1854634),(23069,1,'2020-10-22 16:09:26',10987699,1855778),(23070,1,'2020-10-22 16:09:46',10988319,1856922),(23071,1,'2020-10-22 16:10:07',10989119,1858132),(23072,1,'2020-10-22 16:10:27',10990279,1859276),(23073,1,'2020-10-22 16:10:47',10991145,1860420),(23074,1,'2020-10-22 16:11:07',10991885,1861564),(23075,1,'2020-10-22 16:11:27',10992625,1862770),(23076,1,'2020-10-22 16:11:47',10993245,1863914),(23077,1,'2020-10-22 16:12:07',10999071,1865124),(23078,1,'2020-10-22 16:12:27',11000411,1866268),(23079,1,'2020-10-22 16:12:47',11001157,1867412),(23080,1,'2020-10-22 16:13:07',11001855,1868716),(23081,1,'2020-10-22 16:13:27',11002541,1869860),(23082,1,'2020-10-22 16:13:48',11003161,1871004),(23083,1,'2020-10-22 16:14:08',11003901,1872148),(23084,1,'2020-10-22 16:14:28',11006770,1873420),(23085,1,'2020-10-22 16:14:48',11007516,1874564),(23086,1,'2020-10-22 16:15:08',11008136,1875708),(23087,1,'2020-10-22 16:15:28',11008816,1876852),(23088,1,'2020-10-22 16:15:48',11009436,1877996),(23089,1,'2020-10-22 16:16:08',11012125,1881370),(23090,1,'2020-10-22 16:16:28',11013525,1882580),(23091,1,'2020-10-22 16:16:48',11016319,1885792),(23092,1,'2020-10-22 16:17:08',11016939,1886936),(23093,1,'2020-10-22 16:17:28',11019448,1890372),(23094,1,'2020-10-22 16:17:49',11020068,1891516),(23095,1,'2020-10-22 16:18:09',11020808,1892660),(23096,1,'2020-10-22 16:18:29',11022208,1893870),(23097,1,'2020-10-22 16:18:49',11022954,1895014),(23098,1,'2020-10-22 16:19:09',11023634,1896158),(23099,1,'2020-10-22 16:19:29',11024254,1897302),(23100,1,'2020-10-22 16:19:49',11024874,1898446),(23101,1,'2020-10-22 16:20:09',11032988,1910636),(23102,1,'2020-10-22 16:20:29',11042525,1923262),(23103,1,'2020-10-22 16:20:49',11049128,1932678),(23104,1,'2020-10-22 16:21:09',11049868,1933822),(23105,1,'2020-10-22 16:21:29',11052048,1936742),(23106,1,'2020-10-22 16:21:50',11052668,1937886),(23107,1,'2020-10-22 16:22:10',11055562,1939030),(23108,1,'2020-10-22 16:22:30',11059834,1940240),(23109,1,'2020-10-22 16:22:50',11060580,1941384),(23110,1,'2020-10-22 16:23:10',11063042,1944998),(23111,1,'2020-10-22 16:23:30',11063662,1946142),(23112,1,'2020-10-22 16:23:50',11065718,1948988),(23113,1,'2020-10-22 16:24:10',11066752,1950132),(23114,1,'2020-10-22 16:24:30',11068152,1951276),(23115,1,'2020-10-22 16:24:50',11068898,1952486),(23116,1,'2020-10-22 16:25:11',11069458,1953630),(23117,1,'2020-10-22 16:25:31',11070138,1954774),(23118,1,'2020-10-22 16:25:51',11070818,1955980),(23119,1,'2020-10-22 16:26:11',11071678,1957124),(23120,1,'2020-10-22 16:26:31',11073018,1958268),(23121,1,'2020-10-22 16:26:51',11073824,1959478),(23122,1,'2020-10-22 16:27:11',11074444,1960622),(23123,1,'2020-10-22 16:27:31',11075004,1961766),(23124,1,'2020-10-22 16:27:51',11075624,1962910),(23125,1,'2020-10-22 16:28:11',11076364,1964054),(23126,1,'2020-10-22 16:28:31',11077704,1965198),(23127,1,'2020-10-22 16:28:51',11078510,1966408),(23128,1,'2020-10-22 16:29:12',11079274,1967712),(23129,1,'2020-10-22 16:29:32',11079894,1968856),(23130,1,'2020-10-22 16:29:52',11087158,1978442),(23131,1,'2020-10-22 16:30:12',11089458,1981362),(23132,1,'2020-10-22 16:30:32',11090798,1982506),(23133,1,'2020-10-22 16:30:52',11091604,1983716),(23134,1,'2020-10-22 16:31:12',11092404,1984922),(23135,1,'2020-10-22 16:31:32',11093024,1986066),(23136,1,'2020-10-22 16:31:52',11093644,1987210),(23137,1,'2020-10-22 16:32:12',11094384,1988354),(23138,1,'2020-10-22 16:32:32',11100750,1989498),(23139,1,'2020-10-22 16:32:53',11103385,1992872),(23140,1,'2020-10-22 16:33:13',11104005,1994082),(23141,1,'2020-10-22 16:33:33',11104625,1995226),(23142,1,'2020-10-22 16:33:53',11105245,1996370),(23143,1,'2020-10-22 16:34:13',11105925,1997514),(23144,1,'2020-10-22 16:34:33',11107265,1998658),(23145,1,'2020-10-22 16:34:53',11108101,1999912),(23146,1,'2020-10-22 16:35:13',11108781,2001122),(23147,1,'2020-10-22 16:35:33',11109461,2002266),(23148,1,'2020-10-22 16:35:53',11110081,2003410),(23149,1,'2020-10-22 16:36:13',11119535,2004616),(23150,1,'2020-10-22 16:36:33',11120875,2005760),(23151,1,'2020-10-22 16:36:54',11124031,2010098),(23152,1,'2020-10-22 16:37:14',11130597,2014928),(23153,1,'2020-10-22 16:37:34',11131217,2016072),(23154,1,'2020-10-22 16:37:54',11131837,2017216),(23155,1,'2020-10-22 16:38:14',11132577,2018360),(23156,1,'2020-10-22 16:38:34',11135812,2021918),(23157,1,'2020-10-22 16:38:54',11137450,2023062),(23158,1,'2020-10-22 16:39:14',11138130,2024272),(23159,1,'2020-10-22 16:39:34',11138750,2025416),(23160,1,'2020-10-22 16:39:54',11139370,2026560),(23161,1,'2020-10-22 16:40:14',11140910,2027704),(23162,1,'2020-10-22 16:40:34',11142250,2028848),(23163,1,'2020-10-22 16:40:55',11142996,2029992),(23164,1,'2020-10-22 16:41:15',11143736,2031136),(23165,1,'2020-10-22 16:41:35',11144356,2032346),(23166,1,'2020-10-22 16:41:55',11145116,2033588),(23167,1,'2020-10-22 16:42:15',11145916,2034732),(23168,1,'2020-10-22 16:42:35',11152222,2035876),(23169,1,'2020-10-22 16:42:55',11152968,2037020),(23170,1,'2020-10-22 16:43:15',11153648,2038226),(23171,1,'2020-10-22 16:43:35',11154328,2039436),(23172,1,'2020-10-22 16:43:55',11154948,2040580),(23173,1,'2020-10-22 16:44:15',11155748,2041724),(23174,1,'2020-10-22 16:44:35',11157028,2042868),(23175,1,'2020-10-22 16:44:56',11157774,2044012),(23176,1,'2020-10-22 16:45:16',11158394,2045156),(23177,1,'2020-10-22 16:45:36',11159134,2046366),(23178,1,'2020-10-22 16:45:56',11159754,2047510),(23179,1,'2020-10-22 16:46:16',11160734,2048654),(23180,1,'2020-10-22 16:46:36',11161954,2049798),(23181,1,'2020-10-22 16:46:56',11162700,2050942),(23182,1,'2020-10-22 16:47:16',11163464,2052246),(23183,1,'2020-10-22 16:47:36',11165973,2056414),(23184,1,'2020-10-22 16:47:56',11166593,2057558),(23185,1,'2020-10-22 16:48:16',11167393,2058702),(23186,1,'2020-10-22 16:48:36',11168613,2059846),(23187,1,'2020-10-22 16:48:57',11169419,2061052),(23188,1,'2020-10-22 16:49:17',11170039,2062196),(23189,1,'2020-10-22 16:49:37',11170719,2063340),(23190,1,'2020-10-22 16:49:57',11171399,2064550),(23191,1,'2020-10-22 16:50:17',11172199,2065694),(23192,1,'2020-10-22 16:50:37',11173419,2066838),(23193,1,'2020-10-22 16:50:57',11174225,2067982),(23194,1,'2020-10-22 16:51:17',11175109,2069286),(23195,1,'2020-10-22 16:51:37',11175789,2070430),(23196,1,'2020-10-22 16:51:57',11176469,2071640),(23197,1,'2020-10-22 16:52:17',11177329,2072784),(23198,1,'2020-10-22 16:52:37',11178489,2073928),(23199,1,'2020-10-22 16:52:58',11184261,2075072),(23200,1,'2020-10-22 16:53:18',11184881,2076216),(23201,1,'2020-10-22 16:53:38',11185501,2077360),(23202,1,'2020-10-22 16:53:58',11186301,2078632),(23203,1,'2020-10-22 16:54:18',11187221,2079776),(23204,1,'2020-10-22 16:54:38',11188261,2080920),(23205,1,'2020-10-22 16:54:58',11189307,2082064),(23206,1,'2020-10-22 16:55:18',11190071,2083368),(23207,1,'2020-10-22 16:55:38',11190751,2084512),(23208,1,'2020-10-22 16:55:58',11191671,2085722),(23209,1,'2020-10-22 16:56:18',11192591,2086866),(23210,1,'2020-10-22 16:56:38',11193631,2088010),(23211,1,'2020-10-22 16:56:59',11194377,2089154),(23212,1,'2020-10-22 16:57:19',11194997,2090298),(23213,1,'2020-10-22 16:57:39',11195617,2091442),(23214,1,'2020-10-22 16:57:59',11196417,2092652),(23215,1,'2020-10-22 16:58:19',11197337,2093796),(23216,1,'2020-10-22 16:58:39',11200280,2097264),(23217,1,'2020-10-22 16:58:59',11201026,2098408),(23218,1,'2020-10-22 16:59:19',11201646,2099552),(23219,1,'2020-10-22 16:59:39',11202266,2100696),(23220,1,'2020-10-22 16:59:59',11203066,2101840),(23221,1,'2020-10-22 17:00:19',11203986,2103050),(23222,1,'2020-10-22 17:00:39',11206724,2106504),(23223,1,'2020-10-22 17:01:00',11207590,2107648),(23224,1,'2020-10-22 17:01:20',11208210,2108792),(23225,1,'2020-10-22 17:01:40',11208830,2109998),(23226,1,'2020-10-22 17:02:00',11209570,2111142),(23227,1,'2020-10-22 17:02:20',11210550,2112352),(23228,1,'2020-10-22 17:02:40',11211590,2113496),(23229,1,'2020-10-22 17:03:00',11217362,2114640),(23230,1,'2020-10-22 17:03:20',11217982,2115784),(23231,1,'2020-10-22 17:03:40',11220431,2119308),(23232,1,'2020-10-22 17:04:00',11221171,2120452),(23233,1,'2020-10-22 17:04:20',11222211,2121662),(23234,1,'2020-10-22 17:04:40',11223191,2122806),(23235,1,'2020-10-22 17:05:01',11223937,2123950),(23236,1,'2020-10-22 17:05:21',11224701,2125414),(23237,1,'2020-10-22 17:05:41',11225381,2126558),(23238,1,'2020-10-22 17:06:01',11227133,2127702),(23239,1,'2020-10-22 17:06:21',11229885,2130634),(23240,1,'2020-10-22 17:06:41',11230865,2131778),(23241,1,'2020-10-22 17:07:01',11231611,2132922),(23242,1,'2020-10-22 17:07:21',11232231,2134066),(23243,1,'2020-10-22 17:07:41',11232851,2135210),(23244,1,'2020-10-22 17:08:01',11233591,2136354),(23245,1,'2020-10-22 17:08:21',11234571,2137498),(23246,1,'2020-10-22 17:08:41',11235551,2138708),(23247,1,'2020-10-22 17:09:02',11236447,2140024),(23248,1,'2020-10-22 17:09:22',11237211,2141488),(23249,1,'2020-10-22 17:09:42',11237831,2142632),(23250,1,'2020-10-22 17:10:02',11238571,2143776),(23251,1,'2020-10-22 17:10:22',11239671,2144920),(23252,1,'2020-10-22 17:10:42',11240591,2146130),(23253,1,'2020-10-22 17:11:02',11241457,2147274),(23254,1,'2020-10-22 17:11:22',11242221,2148738),(23255,1,'2020-10-22 17:11:42',11242841,2149882),(23256,1,'2020-10-22 17:12:02',11243641,2151088),(23257,1,'2020-10-22 17:12:23',11244681,2152232),(23258,1,'2020-10-22 17:12:43',11245661,2153442),(23259,1,'2020-10-22 17:13:03',11249997,2154586),(23260,1,'2020-10-22 17:13:23',11252053,2155730),(23261,1,'2020-10-22 17:13:43',11252673,2156874),(23262,1,'2020-10-22 17:14:03',11253413,2158018),(23263,1,'2020-10-22 17:14:23',11255778,2159162),(23264,1,'2020-10-22 17:14:43',11256902,2160372),(23265,1,'2020-10-22 17:15:03',11257546,2161516),(23266,1,'2020-10-22 17:15:23',11258250,2162980),(23267,1,'2020-10-22 17:15:43',11258930,2164124),(23268,1,'2020-10-22 17:16:03',11259790,2165268),(23269,1,'2020-10-22 17:16:23',11260830,2166412),(23270,1,'2020-10-22 17:16:44',11261810,2167622),(23271,1,'2020-10-22 17:17:04',11262556,2168766),(23272,1,'2020-10-22 17:17:24',11263176,2169910),(23273,1,'2020-10-22 17:17:44',11263796,2171054),(23274,1,'2020-10-22 17:18:04',11264596,2172260),(23275,1,'2020-10-22 17:18:24',11268417,2175634),(23276,1,'2020-10-22 17:18:44',11269379,2176778),(23277,1,'2020-10-22 17:19:04',11270143,2177988),(23278,1,'2020-10-22 17:19:24',11270763,2179132),(23279,1,'2020-10-22 17:19:44',11272119,2180276),(23280,1,'2020-10-22 17:20:04',11273227,2181420),(23281,1,'2020-10-22 17:20:25',11276276,2184978),(23282,1,'2020-10-22 17:20:45',11277118,2186122),(23283,1,'2020-10-22 17:21:05',11278080,2187492),(23284,1,'2020-10-22 17:21:25',11278766,2188636),(23285,1,'2020-10-22 17:21:45',11280886,2191556),(23286,1,'2020-10-22 17:22:05',11281626,2192700),(23287,1,'2020-10-22 17:22:25',11283026,2193984),(23288,1,'2020-10-22 17:22:45',11283808,2195128),(23289,1,'2020-10-22 17:23:05',11284572,2196338),(23290,1,'2020-10-22 17:23:25',11290218,2197482),(23291,1,'2020-10-22 17:23:45',11292274,2200402),(23292,1,'2020-10-22 17:24:05',11293014,2201546),(23293,1,'2020-10-22 17:24:26',11294234,2202690),(23294,1,'2020-10-22 17:24:46',11295058,2203834),(23295,1,'2020-10-22 17:25:06',11295780,2205044),(23296,1,'2020-10-22 17:25:26',11296400,2206188),(23297,1,'2020-10-22 17:25:46',11297080,2207332),(23298,1,'2020-10-22 17:26:06',11297940,2208476),(23299,1,'2020-10-22 17:26:26',11299100,2209620),(23300,1,'2020-10-22 17:26:46',11299924,2210764),(23301,1,'2020-10-22 17:27:06',11300526,2211908),(23302,1,'2020-10-22 17:27:26',11301146,2213052),(23303,1,'2020-10-22 17:27:46',11308890,2222908),(23304,1,'2020-10-22 17:28:06',11309630,2224052),(23305,1,'2020-10-22 17:28:27',11310910,2225196),(23306,1,'2020-10-22 17:28:47',11311614,2226340),(23307,1,'2020-10-22 17:29:07',11312414,2227644),(23308,1,'2020-10-22 17:29:27',11313160,2228916),(23309,1,'2020-10-22 17:29:47',11313780,2230060),(23310,1,'2020-10-22 17:30:07',11315882,2232082),(23311,1,'2020-10-22 17:30:27',11317420,2234124),(23312,1,'2020-10-22 17:30:47',11318166,2235268),(23313,1,'2020-10-22 17:31:07',11319026,2236490),(23314,1,'2020-10-22 17:31:27',11319706,2237700),(23315,1,'2020-10-22 17:31:47',11320326,2238844),(23316,1,'2020-10-22 17:32:07',11321066,2239988),(23317,1,'2020-10-22 17:32:28',11322406,2241132),(23318,1,'2020-10-22 17:32:48',11323152,2242276),(23319,1,'2020-10-22 17:33:08',11323850,2243580),(23320,1,'2020-10-22 17:33:28',11329622,2244790),(23321,1,'2020-10-22 17:33:48',11330242,2245934),(23322,1,'2020-10-22 17:34:08',11330982,2247078),(23323,1,'2020-10-22 17:34:28',11332322,2248222),(23324,1,'2020-10-22 17:34:48',11334957,2251842),(23325,1,'2020-10-22 17:35:08',11335577,2252986),(23326,1,'2020-10-22 17:35:28',11336197,2254196),(23327,1,'2020-10-22 17:35:48',11336877,2255340),(23328,1,'2020-10-22 17:36:09',11337737,2256484),(23329,1,'2020-10-22 17:36:29',11339077,2257628),(23330,1,'2020-10-22 17:36:49',11339823,2258772),(23331,1,'2020-10-22 17:37:09',11342272,2262146),(23332,1,'2020-10-22 17:37:29',11342952,2263290),(23333,1,'2020-10-22 17:37:49',11343572,2264500),(23334,1,'2020-10-22 17:38:09',11345890,2267726),(23335,1,'2020-10-22 17:38:29',11347290,2269098),(23336,1,'2020-10-22 17:38:49',11348036,2270242),(23337,1,'2020-10-22 17:39:09',11348656,2271386),(23338,1,'2020-10-22 17:39:29',11349276,2272530),(23339,1,'2020-10-22 17:39:49',11350016,2273802),(23340,1,'2020-10-22 17:40:09',11350756,2274946),(23341,1,'2020-10-22 17:40:30',11352096,2276090),(23342,1,'2020-10-22 17:40:50',11352842,2277234),(23343,1,'2020-10-22 17:41:10',11353726,2278538),(23344,1,'2020-10-22 17:41:30',11354346,2279682),(23345,1,'2020-10-22 17:41:50',11355026,2280892),(23346,1,'2020-10-22 17:42:10',11355706,2282036),(23347,1,'2020-10-22 17:42:30',11357046,2283180),(23348,1,'2020-10-22 17:42:50',11357792,2284324),(23349,1,'2020-10-22 17:43:10',11358562,2285640),(23350,1,'2020-10-22 17:43:30',11362054,2286784),(23351,1,'2020-10-22 17:43:50',11364888,2287994),(23352,1,'2020-10-22 17:44:10',11365628,2289138),(23353,1,'2020-10-22 17:44:31',11366908,2290282),(23354,1,'2020-10-22 17:44:51',11367654,2291426),(23355,1,'2020-10-22 17:45:11',11374858,2293274),(23356,1,'2020-10-22 17:45:31',11379778,2298208),(23357,1,'2020-10-22 17:45:51',11383226,2302108),(23358,1,'2020-10-22 17:46:11',11391202,2309440),(23359,1,'2020-10-22 17:46:31',11392542,2310584),(23360,1,'2020-10-22 17:46:51',11393288,2311728),(23361,1,'2020-10-22 17:47:11',11394052,2313032),(23362,1,'2020-10-22 17:47:31',11394672,2314176),(23363,1,'2020-10-22 17:47:51',11395412,2315382),(23364,1,'2020-10-22 17:48:11',11396222,2316592),(23365,1,'2020-10-22 17:48:32',11397502,2317736),(23366,1,'2020-10-22 17:48:52',11398902,2319786),(23367,1,'2020-10-22 17:49:12',11400096,2321552),(23368,1,'2020-10-22 17:49:32',11400716,2322696),(23369,1,'2020-10-22 17:49:52',11403165,2326070),(23370,1,'2020-10-22 17:50:12',11403965,2327280),(23371,1,'2020-10-22 17:50:32',11405305,2328424),(23372,1,'2020-10-22 17:50:52',11406051,2329568),(23373,1,'2020-10-22 17:51:12',11406791,2330712),(23374,1,'2020-10-22 17:51:32',11407411,2331856),(23375,1,'2020-10-22 17:51:52',11408031,2333000),(23376,1,'2020-10-22 17:52:12',11408831,2334210),(23377,1,'2020-10-22 17:52:33',11410231,2335416),(23378,1,'2020-10-22 17:52:53',11410977,2336560),(23379,1,'2020-10-22 17:53:13',11411597,2337704),(23380,1,'2020-10-22 17:53:33',11412217,2338848),(23381,1,'2020-10-22 17:53:53',11417863,2339992),(23382,1,'2020-10-22 17:54:13',11418663,2341202),(23383,1,'2020-10-22 17:54:33',11420003,2342346),(23384,1,'2020-10-22 17:54:53',11420749,2343490),(23385,1,'2020-10-22 17:55:13',11421369,2344634),(23386,1,'2020-10-22 17:55:33',11423758,2348008),(23387,1,'2020-10-22 17:55:53',11424438,2349152),(23388,1,'2020-10-22 17:56:14',11425358,2350296),(23389,1,'2020-10-22 17:56:34',11426698,2351506),(23390,1,'2020-10-22 17:56:54',11428240,2358196),(23391,1,'2020-10-22 17:57:14',11429882,2378900),(23392,1,'2020-10-22 17:57:34',11431256,2400158),(23393,1,'2020-10-22 17:57:54',11433066,2423620),(23394,1,'2020-10-22 17:58:14',11434560,2445784),(23395,1,'2020-10-22 17:58:34',11437186,2468580),(23396,1,'2020-10-22 17:58:54',11438900,2490658),(23397,1,'2020-10-22 17:59:14',11440442,2511570),(23398,1,'2020-10-22 17:59:35',11442180,2533624),(23399,1,'2020-10-22 17:59:55',11443554,2554466),(23400,1,'2020-10-22 18:00:15',11445322,2576512),(23401,1,'2020-10-22 18:00:35',11447416,2598118),(23402,1,'2020-10-22 18:00:55',11449334,2619118),(23403,1,'2020-10-22 18:01:15',11451240,2640674),(23404,1,'2020-10-22 18:01:35',11452668,2662690),(23405,1,'2020-10-22 18:01:56',11454406,2685358),(23406,1,'2020-10-22 18:02:16',11455960,2709074),(23407,1,'2020-10-22 18:02:36',11458424,2734000),(23408,1,'2020-10-22 18:02:56',11460288,2758650),(23409,1,'2020-10-22 18:03:16',11461722,2782694),(23410,1,'2020-10-22 18:03:36',11463472,2804584),(23411,1,'2020-10-22 18:03:56',11469974,2827600),(23412,1,'2020-10-22 18:04:16',11471970,2851012),(23413,1,'2020-10-22 18:04:36',11474004,2875042),(23414,1,'2020-10-22 18:04:56',11477371,2901056),(23415,1,'2020-10-22 18:05:17',11479603,2923916),(23416,1,'2020-10-22 18:05:37',11481145,2946176),(23417,1,'2020-10-22 18:05:57',11484627,2971262),(23418,1,'2020-10-22 18:06:17',11492006,2995712),(23419,1,'2020-10-22 18:06:37',11494524,3018874),(23420,1,'2020-10-22 18:06:57',11497400,3043586),(23421,1,'2020-10-22 18:07:17',11499068,3067694),(23422,1,'2020-10-22 18:07:37',11500926,3091580),(23423,1,'2020-10-22 18:07:57',11502414,3113580),(23424,1,'2020-10-22 18:08:17',11507122,3137186),(23425,1,'2020-10-22 18:08:37',11509036,3160236),(23426,1,'2020-10-22 18:08:57',11511092,3182342),(23427,1,'2020-10-22 18:09:17',11512824,3204702),(23428,1,'2020-10-22 18:09:38',11514252,3227278),(23429,1,'2020-10-22 18:09:58',11516176,3251428),(23430,1,'2020-10-22 18:10:18',11517892,3272190),(23431,1,'2020-10-22 18:10:38',11520230,3294268),(23432,1,'2020-10-22 18:10:58',11521952,3317682),(23433,1,'2020-10-22 18:11:18',11525284,3342164),(23434,1,'2020-10-22 18:11:38',11527232,3366672),(23435,1,'2020-10-22 18:11:58',11528672,3390872),(23436,1,'2020-10-22 18:12:18',11530830,3413412),(23437,1,'2020-10-22 18:12:38',11532714,3435196),(23438,1,'2020-10-22 18:12:58',11713834,3482422);
/*!40000 ALTER TABLE `device_wifi_local_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_wifi_security`
--

DROP TABLE IF EXISTS `device_wifi_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_wifi_security` (
  `code` varchar(8) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_wifi_security`
--

LOCK TABLES `device_wifi_security` WRITE;
/*!40000 ALTER TABLE `device_wifi_security` DISABLE KEYS */;
INSERT INTO `device_wifi_security` VALUES ('None','None'),('WEP','WEP Personal'),('WPA','WPA Personal'),('WPA2','WPA2 Personal');
/*!40000 ALTER TABLE `device_wifi_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequency`
--

DROP TABLE IF EXISTS `frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequency` (
  `code` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  `is_once_dose` char(1) NOT NULL DEFAULT 'N',
  `is_continuous` char(1) NOT NULL DEFAULT 'N',
  `secs_between_doses` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mins_between_doses` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `hours_between_doses` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `days_between_doses` smallint(3) unsigned NOT NULL DEFAULT '0',
  `weeks_between_doses` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `months_between_doses` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `days_to_skip` smallint(3) unsigned NOT NULL DEFAULT '0',
  `give_mon` char(1) NOT NULL DEFAULT 'N',
  `give_tue` char(1) NOT NULL DEFAULT 'N',
  `give_wed` char(1) NOT NULL DEFAULT 'N',
  `give_thu` char(1) NOT NULL DEFAULT 'N',
  `give_fri` char(1) NOT NULL DEFAULT 'N',
  `give_sat` char(1) NOT NULL DEFAULT 'N',
  `give_sun` char(1) NOT NULL DEFAULT 'N',
  `frequency_type` varchar(30) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  KEY `frequency__frequency_type__FK_IDX` (`frequency_type`),
  CONSTRAINT `frequency__frequency_type__FK` FOREIGN KEY (`frequency_type`) REFERENCES `frequency_type` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
INSERT INTO `frequency` VALUES ('BID','Twice a day','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('ONCE','One time only','Y','N',0,0,0,0,0,0,0,'N','N','N','N','N','N','N','ONCE','2016-10-14 00:02:11'),('QAM','In the morning','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('QD','Once daily','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('QHS','Before the hour of sleep','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('QID','Four times a day','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('QOD','Every other day','N','N',0,0,0,0,0,0,2,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('QPM','In the evening','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('QSHIFT','Once per shift','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11'),('STAT','One time only','Y','N',0,0,0,0,0,0,0,'N','N','N','N','N','N','N','ONCE','2016-10-14 00:02:11'),('TID','Three times a day','N','N',0,0,0,0,0,0,1,'N','N','N','N','N','N','N','USE_DAYS_TO_SKIP','2016-10-14 00:02:11');
/*!40000 ALTER TABLE `frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequency_type`
--

DROP TABLE IF EXISTS `frequency_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequency_type` (
  `code` varchar(30) NOT NULL,
  `continuous` char(1) NOT NULL DEFAULT 'Y',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency_type`
--

LOCK TABLES `frequency_type` WRITE;
/*!40000 ALTER TABLE `frequency_type` DISABLE KEYS */;
INSERT INTO `frequency_type` VALUES ('ONCE','N',NULL),('USE_DAYS_OF_WEEK','Y',NULL),('USE_DAYS_TO_SKIP','Y',NULL),('USE_TIME_BETWEEN_DOSES','Y',NULL);
/*!40000 ALTER TABLE `frequency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household`
--

DROP TABLE IF EXISTS `household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `city` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `household__city__FK_IDX` (`city`),
  CONSTRAINT `household__city__FK` FOREIGN KEY (`city`) REFERENCES `city` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household`
--

LOCK TABLES `household` WRITE;
/*!40000 ALTER TABLE `household` DISABLE KEYS */;
INSERT INTO `household` VALUES (1,'Main street 10112, Tampa, FL',1,NULL,'Y','2017-07-27 19:04:13'),(2,'Orange street 554, Tampa, FL',1,NULL,'Y','2017-07-27 19:04:13'),(3,'Kiev street',1,NULL,'Y','2020-10-13 17:40:00');
/*!40000 ALTER TABLE `household` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`household_after_insert`
AFTER INSERT ON `household`
FOR EACH ROW
BEGIN
/*  Name: household_after_insert
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    INSERT INTO `household_history`(
	  `prev_id`,
	  `history_dt`,
	  `household`,
	  `history_type`,
      `address`,
      `city`,
	  `description`,
      `is_active`,
	  `last_modified`
    )
    VALUES(
		NULL,
        now(),
        NEW.`id`,
        'CREATED',
        NEW.`address`,
        NEW.`city`,
        NEW.`description`,
        NEW.`is_active`,
        NEW.`last_modified`
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`household_after_update`
AFTER UPDATE ON `sophic_medical`.`household`
FOR EACH ROW
BEGIN
/*  Name: household_after_update
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
   
    SELECT id INTO `$prev_id` FROM `household_history` H 
		WHERE H.`household` = OLD.`id` ORDER BY H.`history_dt` DESC LIMIT 1;  

    INSERT INTO `household_history`(
	  `prev_id`,
	  `history_dt`,
	  `household`,
	  `history_type`,
      `address`,
      `city`,
	  `description`,
      `is_active`,
	  `last_modified`
    )
    VALUES(
		`$prev_id`,
        now(),
        NEW.`id`,
        'UPDATED',
        NEW.`address`,
        NEW.`city`,
        NEW.`description`,
        NEW.`is_active`,
        NEW.`last_modified`
    );
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`household_after_delete`
AFTER DELETE ON `household`
FOR EACH ROW
BEGIN
/*  Name: household_after_delete
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;

	SELECT `id` INTO `$prev_id` FROM `household_history` H 
		WHERE H.`household` = OLD.`id` ORDER BY H.`history_dt` DESC LIMIT 1;  

    INSERT INTO `household_history`(
	  `prev_id`,
	  `history_dt`,
	  `household`,
	  `history_type`,
      `address`,
      `city`,
	  `description`,
      `is_active`,
	  `last_modified`
    )
    VALUES(
		`$prev_id`,
        now(),
        OLD.`id`,
        'DELETED',
        OLD.`address`,
        OLD.`city`,
        OLD.`description`,
        OLD.`is_active`,
        OLD.`last_modified`
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `household_history`
--

DROP TABLE IF EXISTS `household_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `household_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prev_id` bigint(20) DEFAULT NULL,
  `history_dt` datetime NOT NULL,
  `household` int(11) NOT NULL,
  `history_type` enum('CREATED','UPDATED','DELETED','ADDED_EXISTING') DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `city` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `household_history__household_history__FK` (`prev_id`),
  CONSTRAINT `household_history__household_history__FK` FOREIGN KEY (`prev_id`) REFERENCES `household_history` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household_history`
--

LOCK TABLES `household_history` WRITE;
/*!40000 ALTER TABLE `household_history` DISABLE KEYS */;
INSERT INTO `household_history` VALUES (1,NULL,'2018-01-25 19:44:18',1,'CREATED','Main street 10112, Tampa, FL',1,NULL,'Y','2017-07-27 19:04:13'),(2,NULL,'2018-01-25 19:44:18',2,'CREATED','Orange street 554, Tampa, FL',1,NULL,'Y','2017-07-27 19:04:13'),(3,NULL,'2020-10-13 17:40:00',3,'CREATED','Kiev street',1,NULL,'Y','2020-10-13 17:40:00');
/*!40000 ALTER TABLE `household_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `speaker_volume` tinyint(3) NOT NULL DEFAULT '100',
  `speaker_volume_prox` tinyint(3) NOT NULL DEFAULT '70',
  `audio_alerts_number` tinyint(2) NOT NULL DEFAULT '10',
  `audio_alerts_interval` smallint(3) NOT NULL DEFAULT '30',
  `overdue_period` smallint(3) NOT NULL DEFAULT '900',
  `action_notrcg` varchar(10) NOT NULL DEFAULT 'DSP',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient__device_action_notrcg__FK_IDX` (`action_notrcg`),
  CONSTRAINT `patient__device_action_notrcg__FK` FOREIGN KEY (`action_notrcg`) REFERENCES `device_action_notrcg` (`code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Brenda','Smith','F','1937-06-04','555-31-13','Main street 10112, Tampa, FL','078-05-1120','23d2e66f-1d92-42f4-8498-62e2f241574d.jpg',41,84,10,30,900,'DSP','Y','2020-10-22 17:59:40'),(2,'John','Smith','M','1932-02-10','555-34-34','Orange street 554, Tampa, FL','078-05-1121','b680a730-8d6b-445f-8b4c-3989f1c6b2b9.jpg',86,29,10,30,900,'DSP','Y','2020-10-22 18:00:24'),(3,'Dima','Miroshnichenko','M','1979-12-23','213266','Kiev street','123-54-1243','52809504-7083-4b29-ae89-fe7d3bb34706.png',100,70,3,30,900,'ALRT','Y','2020-10-13 17:38:07');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient__household`
--

DROP TABLE IF EXISTS `patient__household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient__household` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient` int(11) NOT NULL,
  `household` int(11) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient__household__patient__FK_IDX` (`patient`),
  KEY `patient__household__household__FK_IDX` (`household`),
  CONSTRAINT `patient__household__household__FK` FOREIGN KEY (`household`) REFERENCES `household` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient__household__patient__FK` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient__household`
--

LOCK TABLES `patient__household` WRITE;
/*!40000 ALTER TABLE `patient__household` DISABLE KEYS */;
INSERT INTO `patient__household` VALUES (1,1,1,'2017-07-27 19:11:51'),(2,2,2,'2017-07-27 19:11:51'),(3,3,3,'2020-10-13 17:40:00');
/*!40000 ALTER TABLE `patient__household` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_position`
--

DROP TABLE IF EXISTS `patient_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_position` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `patient` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `position` point NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_position__patient__FK_IDX` (`patient`),
  KEY `patient_position__area__FK_IDX` (`area`),
  CONSTRAINT `patient_position__area__FK` FOREIGN KEY (`area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_position__patient__FK` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_position`
--

LOCK TABLES `patient_position` WRITE;
/*!40000 ALTER TABLE `patient_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physician`
--

DROP TABLE IF EXISTS `physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physician` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `degree` varchar(2) DEFAULT NULL,
  `dea_number` varchar(60) DEFAULT NULL,
  `npi_number` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `physician__degree__FK_IDX` (`degree`),
  FULLTEXT KEY `physician__name__FT_IDX` (`prefix`,`first_name`,`middle_name`,`last_name`,`suffix`),
  CONSTRAINT `physician__degree__FK` FOREIGN KEY (`degree`) REFERENCES `degree` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physician`
--

LOCK TABLES `physician` WRITE;
/*!40000 ALTER TABLE `physician` DISABLE KEYS */;
INSERT INTO `physician` VALUES (1,'ALEXANDER','','POPOV','','',NULL,'F91234561','1184652760','8187539994','12512 VICTORY BLVD, #D, NORTH HOLLYWOOD, CA, 916063180, US',NULL),(2,'JAAN','E.','SIDOROV','DR.','',NULL,'F91234562','1114985066','7175666287','413 VILLAGE WAY, HARRISBURG, PA, 171128849, US',NULL),(3,'IVAN','','IVANOV','DR.','',NULL,'F91234563','','1234567344','452 HAMILTON AVENUE, TRENTON, NJ 08609',NULL),(4,'KIRAN','','PATEL','DR.','',NULL,NULL,'1255334959','3862382285','303 NORTH CLYDE MORRIS BL, HALIFAX HEALTH MEDICAL CENTER, DAYTONA BEACH, FL','2018-02-20 19:49:46'),(5,'SVETLANA','','POLYAK','','',NULL,NULL,'1164871745','3059448777','1380 NE MIAMI GARDENS DR, SUITE 285, MIAMI, FL','2018-02-20 20:44:00'),(6,'JAMES','M','ANDERSON','DR.','',NULL,NULL,'1437152378','7277673318','501 6TH AVE S, ST PETERSBURG, FL','2018-02-23 20:40:53'),(7,'MITCHELL','L','MARKS','DR.','',NULL,NULL,'1972599199','5616222022','3345 BURNS RD, STE 101, PALM BEACH GARDENS, FL','2018-07-07 00:29:05'),(8,'LISA','HELENE','RAUCH','MS.','',NULL,NULL,'1467885129','9544470635','818 NW 133RD AVE, PEMBROKE PINES, FL','2018-09-07 12:47:38'),(9,'ELVIRA','ESTHER','PEREZ PEREZ','MS.','',NULL,NULL,'1902139587','9396455938','205 DR M L KING ST N, ST PETERSBURG, FL','2019-01-04 18:37:52'),(10,'YAKUB','AHMED','POTHIAWALA','MR.','',NULL,NULL,'1215969548','8139604401','3865 NORTHDALE BLVD, TAMPA, FL','2019-01-12 01:38:57'),(11,'OSCAR','','PEREZ','','',NULL,NULL,'1124022546','8139085000','14807 TURNER ROAD, TAMPA, FL','2019-03-26 00:01:43'),(12,'MANUEL','JOSE','RODRIGUEZ-MEDINA','DR.','',NULL,NULL,'1013906692','9049532000','4500 SAN PABLO RD S, JACKSONVILLE, FL','2020-02-13 22:10:29'),(13,'ARMANDO','ANDRES','FERNANDEZ','','',NULL,NULL,'1558366377','9547486558','8890 W OAKLAND PARK BLVD, STE 100, SUNRISE, FL','2020-08-13 20:23:05'),(14,'HANNAH','SMITH','SMITH','','',NULL,NULL,'1285047597','2395659838','1190 E WASHINGTON ST, APT S501, TAMPA, FL','2020-08-13 20:27:20'),(15,'JACQUELINE','R.','ALVAREZ','','',NULL,NULL,'1639172166','3056670306','6641 S DIXIE HWY, MIAMI, FL','2020-10-20 12:52:55'),(16,'MARIANA','PAVLOVA','KAMBUROV','','',NULL,NULL,'1972784122','9545840988','6991 W BROWARD BLVD, SUITE 104, PLANTATION, FL','2020-10-20 18:53:27'),(17,'SMITH','BRAMMER','SMITH','DR.','',NULL,NULL,'1942278643','7278694100','9912 LITTLE RD, NEW PORT RICHEY, FL','2020-10-21 15:36:59'),(18,'FRANCISCO','ALBERTO','SMITH','DR.','',NULL,NULL,'1861495814','2395961995','1660 MEDICAL BLVD, STE 302, NAPLES, FL','2020-10-21 15:38:49'),(19,'ALEXANDER','J','SMIRNOFF','DR.','',NULL,NULL,'1518053024','3526332164','729 HWY 466, LADY LAKE, FL','2020-10-21 18:37:42'),(20,'VICTOR','MANUEL','ALVAREZ','DR.','',NULL,NULL,'1023012820','3214350070','2200 W EAU GALLIE BLVD, STE 202-A, MELBOURNE, FL','2020-10-21 23:54:27'),(21,'LUIS','GERARDO','ALVAREZ','','',NULL,NULL,'1417951922','4076501300','1222 S ORANGE AVE, ORLANDO, FL','2020-10-21 23:55:35');
/*!40000 ALTER TABLE `physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `date_written` date NOT NULL,
  `patient` int(11) NOT NULL,
  `physician` int(11) DEFAULT NULL,
  `medication_name` varchar(50) NOT NULL,
  `admin_route` varchar(5) DEFAULT NULL,
  `admin_method` varchar(5) DEFAULT NULL,
  `admin_device` varchar(5) DEFAULT NULL,
  `admin_site` varchar(5) DEFAULT NULL,
  `frequency` varchar(10) NOT NULL,
  `is_prn` char(1) NOT NULL DEFAULT 'N',
  `strength_amount` varchar(15) DEFAULT NULL,
  `strength_uom` varchar(15) DEFAULT NULL,
  `measure_amount` varchar(15) DEFAULT NULL,
  `measure_uom` varchar(15) DEFAULT NULL,
  `volume` varchar(15) DEFAULT NULL,
  `container_uom` varchar(15) DEFAULT NULL,
  `prescribed_qty` varchar(50) DEFAULT NULL,
  `daw` tinyint(1) NOT NULL,
  `refill` tinyint(2) NOT NULL DEFAULT '0',
  `is_discontinued` char(1) NOT NULL DEFAULT 'N',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `medication_short_name` varchar(50) GENERATED ALWAYS AS (substring_index(`medication_name`,' ',1)) STORED,
  PRIMARY KEY (`id`),
  KEY `prescription__admin_route__FK_IDX` (`admin_route`),
  KEY `prescription__admin_method__FK_IDX` (`admin_method`),
  KEY `prescription__admin_device__FK_IDX` (`admin_device`),
  KEY `prescription__admin_site__FK_IDX` (`admin_site`),
  KEY `prescription__frequency__FK_IDX` (`frequency`),
  KEY `prescription__strength_uom__FK_IDX` (`strength_uom`),
  KEY `prescription__measure_uom__FK_IDX` (`measure_uom`),
  KEY `prescription__container_uom__FK_IDX` (`container_uom`),
  KEY `prescription__patient__FK_IDX` (`patient`),
  KEY `prescription__physician__FK_IDX` (`physician`),
  KEY `prescription__daw__FK_IDX` (`daw`),
  KEY `prescription__medication_short_name` (`medication_short_name`),
  CONSTRAINT `prescription__admin_device__FK` FOREIGN KEY (`admin_device`) REFERENCES `admin_device` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__admin_method__FK` FOREIGN KEY (`admin_method`) REFERENCES `admin_method` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__admin_route__FK` FOREIGN KEY (`admin_route`) REFERENCES `admin_route` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__admin_site__FK_IDX` FOREIGN KEY (`admin_site`) REFERENCES `admin_site` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__container_uom__FK` FOREIGN KEY (`container_uom`) REFERENCES `unit_of_measure` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__daw__FK` FOREIGN KEY (`daw`) REFERENCES `daw` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__frequency__FK` FOREIGN KEY (`frequency`) REFERENCES `frequency` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__measure_uom__FK` FOREIGN KEY (`measure_uom`) REFERENCES `unit_of_measure` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__patient__FK` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__physician__FK` FOREIGN KEY (`physician`) REFERENCES `physician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription__strength_uom__FK` FOREIGN KEY (`strength_uom`) REFERENCES `unit_of_measure` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` (`id`, `date_written`, `patient`, `physician`, `medication_name`, `admin_route`, `admin_method`, `admin_device`, `admin_site`, `frequency`, `is_prn`, `strength_amount`, `strength_uom`, `measure_amount`, `measure_uom`, `volume`, `container_uom`, `prescribed_qty`, `daw`, `refill`, `is_discontinued`, `last_modified`) VALUES (1,'2018-02-23',1,6,'Ambien CR TBCR 6.25 MG',NULL,NULL,NULL,NULL,'BID','N',NULL,NULL,NULL,NULL,NULL,NULL,'45',1,2,'Y','2020-08-13 20:26:19'),(2,'2018-07-06',1,7,'Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG',NULL,NULL,NULL,NULL,'TID','N',NULL,NULL,NULL,NULL,NULL,NULL,'42',1,1,'Y','2020-08-13 20:26:14'),(3,'2018-09-01',1,6,'Aspirin CHEW 75 MG',NULL,NULL,NULL,NULL,'QD','N',NULL,NULL,NULL,NULL,NULL,NULL,'10',0,0,'Y','2020-08-13 20:26:07'),(4,'2019-01-04',1,9,'Ivabradine HCl TABS 7.5 MG',NULL,NULL,NULL,NULL,'QD','N',NULL,NULL,NULL,NULL,NULL,NULL,'30',2,2,'Y','2020-08-13 20:26:02'),(5,'2019-01-11',2,6,'Zomig TABS 5 MG',NULL,NULL,NULL,NULL,'QD','Y',NULL,NULL,NULL,NULL,NULL,NULL,'30',1,1,'N','2019-01-11 21:37:08'),(6,'2019-01-11',1,10,'Zomig TABS 5 MG',NULL,NULL,NULL,NULL,'BID','N',NULL,NULL,NULL,NULL,NULL,NULL,'30',1,1,'Y','2020-08-13 20:25:56'),(7,'2019-03-25',1,11,'PriLOSEC CPDR 20 MG',NULL,NULL,NULL,NULL,'ONCE','N',NULL,NULL,NULL,NULL,NULL,NULL,'30',2,6,'Y','2020-08-13 20:25:51'),(8,'2019-08-16',1,6,'Zomig TABS 5 MG',NULL,NULL,NULL,NULL,'QID','Y',NULL,NULL,NULL,NULL,NULL,NULL,'50',1,1,'Y','2020-08-13 20:25:44'),(9,'2020-02-13',1,12,'Namenda TABS 5 MG',NULL,NULL,NULL,NULL,'BID','N',NULL,NULL,NULL,NULL,NULL,NULL,'60',1,1,'Y','2020-08-13 20:25:34'),(10,'2020-08-14',1,13,'Butalbital Compound/ASA TABS 50-325-40 MG',NULL,NULL,NULL,NULL,'BID','Y',NULL,NULL,NULL,NULL,NULL,NULL,'30',1,1,'Y','2020-08-13 20:23:41'),(11,'2020-08-13',1,14,'Ambien CR TBCR 6.25 MG',NULL,NULL,NULL,NULL,'QD','Y',NULL,NULL,NULL,NULL,NULL,NULL,'60',1,1,'Y','2020-10-22 00:00:45'),(12,'2020-10-20',1,15,'Albuterol Sulfate ER TB12 4 MG',NULL,NULL,NULL,NULL,'BID','Y',NULL,NULL,NULL,NULL,NULL,NULL,'4',1,0,'Y','2020-10-21 23:59:32'),(13,'2020-10-20',1,16,'Viagra TABS 50 MG',NULL,NULL,NULL,NULL,'QID','Y',NULL,NULL,NULL,NULL,NULL,NULL,'8',1,0,'Y','2020-10-20 19:01:05'),(14,'2020-10-20',1,14,'Darifenacin Hydrobromide ER TB24 7.5 MG',NULL,NULL,NULL,NULL,'BID','Y',NULL,NULL,NULL,NULL,NULL,NULL,'4',1,0,'Y','2020-10-21 01:27:00'),(15,'2020-10-21',2,17,'Xanax TABS 0.25 MG',NULL,NULL,NULL,NULL,'BID','N',NULL,NULL,NULL,NULL,NULL,NULL,'4',1,0,'Y','2020-10-21 23:59:32'),(16,'2020-10-21',1,18,'Xanax TABS 2 MG',NULL,NULL,NULL,NULL,'BID','N',NULL,NULL,NULL,NULL,NULL,NULL,'8',1,0,'Y','2020-10-21 17:47:46'),(17,'2020-10-21',1,19,'Zomig TABS 2.5 MG',NULL,NULL,NULL,NULL,'BID','Y',NULL,NULL,NULL,NULL,NULL,NULL,'6',1,0,'Y','2020-10-21 23:53:05'),(18,'2020-10-21',1,13,'Donepezil HCl TABS 5 MG',NULL,NULL,NULL,NULL,'BID','N',NULL,NULL,NULL,NULL,NULL,NULL,'8',1,0,'N','2020-10-22 00:02:44');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recognition_status`
--

DROP TABLE IF EXISTS `recognition_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recognition_status` (
  `code` varchar(16) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recognition_status`
--

LOCK TABLES `recognition_status` WRITE;
/*!40000 ALTER TABLE `recognition_status` DISABLE KEYS */;
INSERT INTO `recognition_status` VALUES ('NO','NOT RECOGNIZED',NULL),('OK','RECOGNIZED',NULL);
/*!40000 ALTER TABLE `recognition_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `timezone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Florida','US/Eastern');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `prescription` bigint(18) NOT NULL,
  `start_date` date NOT NULL,
  `stop_date` date NOT NULL,
  `device` int(11) NOT NULL,
  `is_discontinued` char(1) NOT NULL DEFAULT 'N',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `schedule__device__FK_IDX` (`device`),
  KEY `schedule__prescription__FK_IDX` (`prescription`),
  CONSTRAINT `schedule__device__FK` FOREIGN KEY (`device`) REFERENCES `device` (`id`),
  CONSTRAINT `schedule__prescription__FK` FOREIGN KEY (`prescription`) REFERENCES `prescription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,'2018-02-23','2018-03-01',1,'N','2018-02-23 20:42:08'),(2,4,'2019-01-04','2019-02-01',1,'N','2019-01-04 19:26:26'),(3,5,'2019-01-11','2019-01-26',1,'N','2019-01-11 21:37:39'),(4,6,'2019-01-11','2019-01-28',1,'N','2019-01-12 01:40:11'),(5,7,'2019-03-26','2019-05-01',1,'N','2019-03-26 00:02:54'),(6,9,'2020-02-13','2020-03-08',1,'N','2020-02-13 22:11:41'),(7,9,'2020-03-08','2020-03-13',1,'N','2020-02-13 22:11:41'),(8,11,'2020-08-13','2020-09-07',1,'N','2020-08-13 20:29:03'),(9,12,'2020-10-20','2020-10-22',1,'N','2020-10-20 12:53:45'),(10,14,'2020-10-20','2020-10-22',2,'N','2020-10-20 19:13:34'),(11,15,'2020-10-21','2020-10-23',2,'N','2020-10-21 15:37:32'),(12,16,'2020-10-21','2020-10-23',2,'N','2020-10-21 15:39:52');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule__transaction`
--

DROP TABLE IF EXISTS `schedule__transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule__transaction` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `schedule` bigint(18) NOT NULL,
  `transaction` bigint(18) NOT NULL,
  `bin` varchar(16) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedule__transaction_UNIQ` (`schedule`,`transaction`),
  KEY `schedule__transaction__transaction__FK_IDX` (`transaction`),
  KEY `schedule__transaction__schedule__FK_IDX` (`schedule`),
  KEY `schedule_bin_FK_idx` (`bin`),
  CONSTRAINT `schedule__transaction__schedule__FK` FOREIGN KEY (`schedule`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule__transaction__transaction__FK` FOREIGN KEY (`transaction`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_bin_FK` FOREIGN KEY (`bin`) REFERENCES `bin` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule__transaction`
--

LOCK TABLES `schedule__transaction` WRITE;
/*!40000 ALTER TABLE `schedule__transaction` DISABLE KEYS */;
INSERT INTO `schedule__transaction` VALUES (1,1,1,NULL,'2018-02-23 20:42:08'),(2,1,2,NULL,'2018-02-23 20:42:08'),(3,1,3,NULL,'2018-02-23 20:42:08'),(4,1,4,NULL,'2018-02-23 20:42:08'),(5,1,5,NULL,'2018-02-23 20:42:08'),(6,1,6,NULL,'2018-02-23 20:42:08'),(7,1,7,NULL,'2018-02-23 20:42:08'),(8,1,8,NULL,'2018-02-23 20:42:08'),(9,1,9,NULL,'2018-02-23 20:42:08'),(10,1,10,NULL,'2018-02-23 20:42:08'),(11,1,11,NULL,'2018-02-23 20:42:08'),(12,1,12,NULL,'2018-02-23 20:42:08'),(13,2,13,NULL,'2019-01-04 19:26:26'),(14,2,14,NULL,'2019-01-04 19:26:26'),(15,2,15,NULL,'2019-01-04 19:26:26'),(16,2,16,NULL,'2019-01-04 19:26:26'),(17,2,17,NULL,'2019-01-04 19:26:26'),(18,2,18,NULL,'2019-01-04 19:26:26'),(19,2,19,NULL,'2019-01-04 19:26:26'),(20,2,20,NULL,'2019-01-04 19:26:26'),(21,2,21,NULL,'2019-01-04 19:26:26'),(22,2,22,NULL,'2019-01-04 19:26:26'),(23,2,23,NULL,'2019-01-04 19:26:26'),(24,2,24,NULL,'2019-01-04 19:26:26'),(25,2,25,NULL,'2019-01-04 19:26:26'),(26,2,26,NULL,'2019-01-04 19:26:26'),(27,2,27,NULL,'2019-01-04 19:26:26'),(28,2,28,NULL,'2019-01-04 19:26:26'),(29,2,29,NULL,'2019-01-04 19:26:26'),(30,2,30,NULL,'2019-01-04 19:26:26'),(31,2,31,NULL,'2019-01-04 19:26:26'),(32,2,32,NULL,'2019-01-04 19:26:26'),(33,2,33,NULL,'2019-01-04 19:26:26'),(34,2,34,NULL,'2019-01-04 19:26:26'),(35,2,35,NULL,'2019-01-04 19:26:26'),(36,2,36,NULL,'2019-01-04 19:26:26'),(37,2,37,NULL,'2019-01-04 19:26:26'),(38,2,38,NULL,'2019-01-04 19:26:26'),(39,2,39,NULL,'2019-01-04 19:26:26'),(40,2,40,NULL,'2019-01-04 19:26:26'),(41,3,41,NULL,'2019-01-11 21:37:39'),(42,3,42,NULL,'2019-01-11 21:37:39'),(43,3,43,NULL,'2019-01-11 21:37:39'),(44,3,44,NULL,'2019-01-11 21:37:39'),(45,3,45,NULL,'2019-01-11 21:37:39'),(46,3,46,NULL,'2019-01-11 21:37:39'),(47,3,47,NULL,'2019-01-11 21:37:39'),(48,3,48,NULL,'2019-01-11 21:37:39'),(49,3,49,NULL,'2019-01-11 21:37:39'),(50,3,50,NULL,'2019-01-11 21:37:39'),(51,3,51,NULL,'2019-01-11 21:37:39'),(52,3,52,NULL,'2019-01-11 21:37:39'),(53,3,53,NULL,'2019-01-11 21:37:39'),(54,3,54,NULL,'2019-01-11 21:37:39'),(55,3,55,NULL,'2019-01-11 21:37:39'),(56,4,56,NULL,'2019-01-12 01:40:11'),(57,4,57,NULL,'2019-01-12 01:40:11'),(58,4,58,NULL,'2019-01-12 01:40:11'),(59,4,59,NULL,'2019-01-12 01:40:11'),(60,4,60,NULL,'2019-01-12 01:40:11'),(61,4,61,NULL,'2019-01-12 01:40:11'),(62,4,62,NULL,'2019-01-12 01:40:11'),(63,4,63,NULL,'2019-01-12 01:40:11'),(64,4,64,NULL,'2019-01-12 01:40:11'),(65,4,65,NULL,'2019-01-12 01:40:11'),(66,4,66,NULL,'2019-01-12 01:40:11'),(67,4,67,NULL,'2019-01-12 01:40:11'),(68,4,68,NULL,'2019-01-12 01:40:11'),(69,4,69,NULL,'2019-01-12 01:40:11'),(70,4,70,NULL,'2019-01-12 01:40:11'),(71,4,71,NULL,'2019-01-12 01:40:11'),(72,4,72,NULL,'2019-01-12 01:40:11'),(73,4,73,NULL,'2019-01-12 01:40:11'),(74,4,74,NULL,'2019-01-12 01:40:11'),(75,4,75,NULL,'2019-01-12 01:40:11'),(76,4,76,NULL,'2019-01-12 01:40:11'),(77,4,77,NULL,'2019-01-12 01:40:11'),(78,4,78,NULL,'2019-01-12 01:40:11'),(79,4,79,NULL,'2019-01-12 01:40:11'),(80,4,80,NULL,'2019-01-12 01:40:11'),(81,4,81,NULL,'2019-01-12 01:40:11'),(82,4,82,NULL,'2019-01-12 01:40:11'),(83,4,83,NULL,'2019-01-12 01:40:11'),(84,4,84,NULL,'2019-01-12 01:40:11'),(85,4,85,NULL,'2019-01-12 01:40:11'),(86,4,86,NULL,'2019-01-12 01:40:11'),(87,4,87,NULL,'2019-01-12 01:40:11'),(88,4,88,NULL,'2019-01-12 01:40:11'),(89,4,89,NULL,'2019-01-12 01:40:11'),(90,5,90,NULL,'2019-03-26 00:02:54'),(91,6,91,NULL,'2020-02-13 22:11:41'),(92,6,92,NULL,'2020-02-13 22:11:41'),(93,6,93,NULL,'2020-02-13 22:11:41'),(94,6,94,NULL,'2020-02-13 22:11:41'),(95,6,95,NULL,'2020-02-13 22:11:41'),(96,6,96,NULL,'2020-02-13 22:11:41'),(97,6,97,NULL,'2020-02-13 22:11:41'),(98,6,98,NULL,'2020-02-13 22:11:41'),(99,6,99,NULL,'2020-02-13 22:11:41'),(100,6,100,NULL,'2020-02-13 22:11:41'),(101,6,101,NULL,'2020-02-13 22:11:41'),(102,6,102,NULL,'2020-02-13 22:11:41'),(103,6,103,NULL,'2020-02-13 22:11:41'),(104,6,104,NULL,'2020-02-13 22:11:41'),(105,6,105,NULL,'2020-02-13 22:11:41'),(106,6,106,NULL,'2020-02-13 22:11:41'),(107,6,107,NULL,'2020-02-13 22:11:41'),(108,6,108,NULL,'2020-02-13 22:11:41'),(109,6,109,NULL,'2020-02-13 22:11:41'),(110,6,110,NULL,'2020-02-13 22:11:41'),(111,6,111,NULL,'2020-02-13 22:11:41'),(112,6,112,NULL,'2020-02-13 22:11:41'),(113,6,113,NULL,'2020-02-13 22:11:41'),(114,6,114,NULL,'2020-02-13 22:11:41'),(115,6,115,NULL,'2020-02-13 22:11:41'),(116,6,116,NULL,'2020-02-13 22:11:41'),(117,6,117,NULL,'2020-02-13 22:11:41'),(118,6,118,NULL,'2020-02-13 22:11:41'),(119,6,119,NULL,'2020-02-13 22:11:41'),(120,6,120,NULL,'2020-02-13 22:11:41'),(121,6,121,NULL,'2020-02-13 22:11:41'),(122,6,122,NULL,'2020-02-13 22:11:41'),(123,6,123,NULL,'2020-02-13 22:11:41'),(124,6,124,NULL,'2020-02-13 22:11:41'),(125,6,125,NULL,'2020-02-13 22:11:41'),(126,6,126,NULL,'2020-02-13 22:11:41'),(127,6,127,NULL,'2020-02-13 22:11:41'),(128,6,128,NULL,'2020-02-13 22:11:41'),(129,6,129,NULL,'2020-02-13 22:11:41'),(130,6,130,NULL,'2020-02-13 22:11:41'),(131,6,131,NULL,'2020-02-13 22:11:41'),(132,6,132,NULL,'2020-02-13 22:11:41'),(133,6,133,NULL,'2020-02-13 22:11:41'),(134,6,134,NULL,'2020-02-13 22:11:41'),(135,6,135,NULL,'2020-02-13 22:11:41'),(136,6,136,NULL,'2020-02-13 22:11:41'),(137,6,137,NULL,'2020-02-13 22:11:41'),(138,6,138,NULL,'2020-02-13 22:11:41'),(139,7,139,NULL,'2020-02-13 22:11:41'),(140,7,140,NULL,'2020-02-13 22:11:41'),(141,7,141,NULL,'2020-02-13 22:11:41'),(142,7,142,NULL,'2020-02-13 22:11:41'),(143,7,143,NULL,'2020-02-13 22:11:41'),(144,7,144,NULL,'2020-02-13 22:11:41'),(145,7,145,NULL,'2020-02-13 22:11:41'),(146,7,146,NULL,'2020-02-13 22:11:41'),(147,7,147,NULL,'2020-02-13 22:11:41'),(148,7,148,NULL,'2020-02-13 22:11:41'),(149,8,149,NULL,'2020-08-13 20:29:03'),(150,8,150,NULL,'2020-08-13 20:29:03'),(151,8,151,NULL,'2020-08-13 20:29:03'),(152,8,152,NULL,'2020-08-13 20:29:03'),(153,8,153,NULL,'2020-08-13 20:29:03'),(154,8,154,NULL,'2020-08-13 20:29:03'),(155,8,155,NULL,'2020-08-13 20:29:03'),(156,8,156,NULL,'2020-08-13 20:29:03'),(157,8,157,NULL,'2020-08-13 20:29:03'),(158,8,158,NULL,'2020-08-13 20:29:03'),(159,8,159,NULL,'2020-08-13 20:29:03'),(160,8,160,NULL,'2020-08-13 20:29:03'),(161,8,161,NULL,'2020-08-13 20:29:03'),(162,8,162,NULL,'2020-08-13 20:29:03'),(163,8,163,NULL,'2020-08-13 20:29:03'),(164,8,164,NULL,'2020-08-13 20:29:03'),(165,8,165,NULL,'2020-08-13 20:29:03'),(166,8,166,NULL,'2020-08-13 20:29:03'),(167,8,167,NULL,'2020-08-13 20:29:03'),(168,8,168,NULL,'2020-08-13 20:29:03'),(169,8,169,NULL,'2020-08-13 20:29:03'),(170,8,170,NULL,'2020-08-13 20:29:03'),(171,8,171,NULL,'2020-08-13 20:29:03'),(172,8,172,NULL,'2020-08-13 20:29:03'),(173,8,173,NULL,'2020-08-13 20:29:03'),(174,9,174,'pMOAo','2020-10-20 13:06:36'),(175,9,175,'cDkH0BCgZN','2020-10-20 13:06:36'),(176,9,176,'WKgVnXHzzX','2020-10-20 13:06:36'),(177,9,177,'t9hWvr1ipZ','2020-10-20 13:06:36'),(178,10,178,NULL,'2020-10-20 19:13:34'),(179,10,179,NULL,'2020-10-20 19:13:34'),(180,10,180,NULL,'2020-10-20 19:13:34'),(181,10,181,NULL,'2020-10-20 19:13:34'),(182,11,182,NULL,'2020-10-21 15:37:32'),(183,11,183,NULL,'2020-10-21 15:37:32'),(184,11,184,NULL,'2020-10-21 15:37:32'),(185,11,185,NULL,'2020-10-21 15:37:32'),(186,12,186,NULL,'2020-10-21 15:39:52'),(187,12,187,NULL,'2020-10-21 15:39:52'),(188,12,188,NULL,'2020-10-21 15:39:52'),(189,12,189,NULL,'2020-10-21 15:39:52');
/*!40000 ALTER TABLE `schedule__transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signal_strength`
--

DROP TABLE IF EXISTS `signal_strength`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signal_strength` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `device` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `rssi` tinyint(2) NOT NULL,
  `ber` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `signal_strength__device__FK_IDX` (`device`),
  CONSTRAINT `signal_strength__device__FK` FOREIGN KEY (`device`) REFERENCES `device` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signal_strength`
--

LOCK TABLES `signal_strength` WRITE;
/*!40000 ALTER TABLE `signal_strength` DISABLE KEYS */;
INSERT INTO `signal_strength` VALUES (1,1,'2018-01-18 20:41:56',22,99),(2,1,'2018-01-18 20:42:12',19,99),(3,1,'2018-01-18 20:42:27',20,99),(4,1,'2018-01-18 20:42:42',19,99),(5,1,'2018-01-18 20:42:57',20,99),(6,1,'2018-01-18 20:43:12',19,99),(7,1,'2018-01-18 20:43:28',19,99),(8,1,'2018-01-18 20:43:44',19,99),(9,1,'2018-01-18 20:43:59',19,99),(10,1,'2018-01-18 20:44:14',19,99),(11,1,'2018-01-18 20:44:29',20,99),(12,1,'2018-01-18 20:44:44',18,99),(13,1,'2018-01-18 20:45:00',18,99),(14,1,'2018-01-18 20:45:15',19,99),(15,1,'2018-01-18 20:45:31',19,99),(16,1,'2018-01-18 20:45:46',19,99),(17,1,'2018-01-18 20:46:01',19,99),(18,1,'2018-01-18 20:46:16',20,99),(19,1,'2018-01-18 20:46:31',20,99),(20,1,'2018-01-18 20:46:47',20,99),(21,1,'2018-01-18 20:47:02',20,99),(22,1,'2018-01-18 20:47:17',20,99),(23,1,'2018-01-18 20:47:32',19,99),(24,1,'2018-01-18 20:47:47',19,99),(25,1,'2018-01-18 20:48:02',21,99),(26,1,'2018-01-18 20:48:18',20,99),(27,1,'2018-01-18 20:48:33',19,99),(28,1,'2018-01-18 20:48:48',19,99),(29,1,'2018-01-20 13:01:40',22,99),(30,1,'2018-01-20 13:01:55',18,99),(31,1,'2018-01-20 13:02:10',18,99),(32,1,'2018-01-20 13:02:25',18,99),(33,1,'2018-01-20 13:02:41',16,99),(34,1,'2018-01-20 13:02:56',17,99),(35,1,'2018-01-20 13:03:12',17,99),(36,1,'2018-01-20 13:03:27',17,99),(37,1,'2018-01-20 13:03:42',18,99),(38,1,'2018-01-25 20:20:40',18,99),(39,1,'2018-01-23 01:16:12',18,99),(40,1,'2018-01-23 00:48:24',26,99),(41,1,'2018-01-23 00:48:39',17,99),(42,1,'2018-01-23 00:48:54',16,99),(43,1,'2018-01-23 00:49:09',16,99),(44,1,'2018-01-23 00:49:24',17,99),(45,1,'2018-01-23 00:49:39',17,99),(46,1,'2018-01-23 00:49:54',17,99),(47,1,'2018-01-23 00:50:09',18,99),(48,1,'2018-01-23 00:50:24',17,99),(49,1,'2018-01-23 00:50:39',17,99),(50,1,'2018-01-23 00:50:55',17,99),(51,1,'2018-01-23 00:51:10',17,99),(52,1,'2018-01-23 00:51:25',16,99),(53,1,'2018-01-23 00:51:40',17,99),(54,1,'2018-01-23 00:51:55',18,99),(55,1,'2018-01-23 00:52:10',17,99),(56,1,'2018-01-23 00:52:25',18,99),(57,1,'2018-01-23 00:52:40',18,99),(58,1,'2018-01-23 00:52:55',18,99),(59,1,'2018-01-23 00:53:10',17,99),(60,1,'2018-01-23 00:53:25',17,99),(61,1,'2018-01-23 00:53:40',17,99),(62,1,'2018-01-23 00:53:55',17,99),(63,1,'2018-01-23 00:54:10',17,99),(64,1,'2018-01-23 00:54:25',17,99),(65,1,'2018-01-23 00:54:40',17,99),(66,1,'2018-01-23 00:54:55',17,99),(67,1,'2018-01-23 00:55:10',16,99),(68,1,'2018-01-23 00:55:25',18,99),(69,1,'2018-01-23 00:55:40',17,99),(70,1,'2018-01-23 00:55:55',17,99),(71,1,'2018-01-23 00:56:10',18,99),(72,1,'2018-01-23 00:56:25',17,99),(73,1,'2018-01-23 00:56:40',16,99),(74,1,'2018-01-23 00:56:55',17,99),(75,1,'2018-01-23 00:57:10',18,99),(76,1,'2018-01-23 00:57:25',17,99),(77,1,'2018-01-23 00:57:40',17,99),(78,1,'2018-01-23 00:57:55',16,99),(79,1,'2018-01-23 00:58:10',17,99),(80,1,'2018-01-23 00:58:25',18,99),(81,1,'2018-01-23 00:58:40',17,99),(82,1,'2018-01-23 00:58:55',18,99),(83,1,'2018-01-23 00:59:10',17,99),(84,1,'2018-01-23 00:59:25',17,99),(85,1,'2018-01-23 00:59:40',17,99),(86,1,'2018-01-23 00:59:55',17,99),(87,1,'2018-01-23 01:00:10',17,99),(88,1,'2018-01-23 01:00:25',17,99),(89,1,'2018-01-23 01:00:40',16,99),(90,1,'2018-01-23 01:00:55',16,99),(91,1,'2018-01-23 01:01:10',16,99),(92,1,'2018-01-23 01:01:25',17,99),(93,1,'2018-01-23 01:01:40',16,99),(94,1,'2018-01-23 01:01:55',17,99),(95,1,'2018-01-23 01:02:10',16,99),(96,1,'2018-01-23 01:02:25',18,99),(97,1,'2018-01-23 01:02:40',18,99),(98,1,'2018-01-23 01:02:55',18,99),(99,1,'2018-01-23 01:03:10',18,99),(100,1,'2018-01-23 01:03:25',17,99),(101,1,'2018-01-23 01:03:40',17,99),(102,1,'2018-01-23 01:03:55',18,99),(103,1,'2018-01-23 01:04:10',18,99),(104,1,'2018-01-23 01:04:25',17,99),(105,1,'2018-01-23 01:04:41',16,99),(106,1,'2018-01-23 01:04:56',15,99),(107,1,'2018-01-23 01:05:11',16,99),(108,1,'2018-01-23 01:05:26',15,99),(109,1,'2018-01-23 01:05:41',14,99),(110,1,'2018-01-23 01:05:56',15,99),(111,1,'2018-01-23 01:06:11',15,99),(112,1,'2018-01-23 01:06:26',16,99),(113,1,'2018-01-23 01:06:41',16,99),(114,1,'2018-01-23 01:06:56',17,99),(115,1,'2018-01-23 01:07:11',18,99),(116,1,'2018-01-23 01:07:26',17,99),(117,1,'2018-01-23 01:07:41',17,99),(118,1,'2018-01-23 01:07:56',17,99),(119,1,'2018-01-23 01:08:11',17,99),(120,1,'2018-01-23 01:08:26',17,99),(121,1,'2018-01-23 01:08:41',17,99),(122,1,'2018-01-23 01:08:56',17,99),(123,1,'2018-01-23 01:09:11',17,99),(124,1,'2018-01-23 01:09:26',17,99),(125,1,'2018-01-23 01:09:41',18,99),(126,1,'2018-01-23 01:09:56',16,99),(127,1,'2018-01-23 01:10:11',17,99),(128,1,'2018-01-23 01:10:26',18,99),(129,1,'2018-01-23 01:10:41',17,99),(130,1,'2018-01-23 01:10:56',16,99),(131,1,'2018-01-23 01:11:11',16,99),(132,1,'2018-01-23 01:11:26',16,99),(133,1,'2018-01-23 01:11:41',16,99),(134,1,'2018-01-23 01:11:56',18,99),(135,1,'2018-01-23 01:12:11',17,99),(136,1,'2018-01-23 01:12:26',16,99),(137,1,'2018-01-23 01:12:41',14,99),(138,1,'2018-01-23 01:12:56',15,99),(139,1,'2018-01-23 01:13:11',18,99),(140,1,'2018-01-23 01:13:26',17,99),(141,1,'2018-01-23 01:13:41',16,99),(142,1,'2018-01-23 01:13:56',14,99),(143,1,'2018-01-23 01:14:11',17,99),(144,1,'2018-01-23 01:14:26',16,99),(145,1,'2018-01-23 01:14:41',18,99),(146,1,'2018-01-23 01:14:56',10,99),(147,1,'2018-01-23 01:30:32',18,99),(148,1,'2018-01-23 01:30:47',15,99),(149,1,'2018-01-23 01:31:02',15,99),(150,1,'2018-01-23 01:31:17',17,99),(151,1,'2018-01-23 01:31:32',16,99),(152,1,'2018-01-23 00:48:25',26,99),(153,1,'2018-01-23 00:48:40',12,99),(154,1,'2018-01-23 00:50:29',16,99),(155,1,'2018-01-23 00:50:44',13,99),(156,1,'2018-01-23 00:50:59',17,99),(157,1,'2018-01-23 00:51:14',19,99),(158,1,'2018-01-23 00:51:29',18,99),(159,1,'2018-01-23 00:51:44',18,99),(160,1,'2018-01-23 00:51:59',18,99),(161,1,'2018-01-23 00:52:14',18,99),(162,1,'2018-01-23 00:52:29',18,99),(163,1,'2018-01-23 00:52:44',17,99),(164,1,'2018-01-23 00:52:59',19,99),(165,1,'2018-01-23 00:53:14',18,99),(166,1,'2018-01-23 00:53:29',14,99),(167,1,'2018-01-23 00:53:44',14,99),(168,1,'2018-01-26 21:17:08',14,99),(169,1,'2018-01-26 21:17:23',13,99),(170,1,'2018-01-26 21:17:38',14,99),(171,1,'2018-01-26 21:18:26',13,99),(172,1,'2018-01-26 21:18:41',14,99),(173,1,'2018-01-26 21:18:56',13,99),(174,1,'2018-01-26 21:19:11',14,99),(175,1,'2018-01-26 21:19:26',14,99),(176,1,'2018-01-26 21:19:41',14,99),(177,1,'2018-01-26 21:19:56',14,99),(178,1,'2018-01-26 21:20:11',14,99),(179,1,'2018-01-26 21:20:26',14,99),(180,1,'2018-01-26 21:20:41',15,99),(181,1,'2018-01-26 21:20:56',14,99),(182,1,'2018-01-26 21:21:11',13,99),(183,1,'2018-01-26 21:21:26',12,99),(184,1,'2018-01-26 21:21:41',12,99),(185,1,'2018-01-26 21:21:56',16,99),(186,1,'2018-01-26 21:22:11',13,99),(187,1,'2018-01-26 21:22:26',14,99),(188,1,'2018-01-26 21:22:41',13,99),(189,1,'2018-01-26 21:22:56',12,99),(190,1,'2018-01-26 21:23:11',15,99),(191,1,'2018-01-26 21:23:26',12,99),(192,1,'2018-01-26 21:23:41',12,99),(193,1,'2018-01-26 21:23:56',13,99),(194,1,'2018-01-26 21:24:11',12,99),(195,1,'2018-01-26 21:24:26',13,99),(196,1,'2018-01-26 21:24:41',15,99),(197,1,'2018-01-26 21:24:56',13,99),(198,1,'2018-01-26 21:25:11',14,99),(199,1,'2018-01-26 21:25:27',16,99),(200,1,'2018-01-26 21:25:42',16,99),(201,1,'2018-01-26 21:25:57',13,99),(202,1,'2018-01-26 21:26:12',15,99),(203,1,'2018-01-26 21:26:27',16,99),(204,1,'2018-01-26 21:26:42',16,99),(205,1,'2018-01-26 21:26:57',16,99),(206,1,'2018-01-26 21:27:12',15,99),(207,1,'2018-01-26 21:27:27',15,99),(208,1,'2018-01-26 21:27:42',15,99),(209,1,'2018-01-26 21:27:57',17,99),(210,1,'2018-01-26 21:28:12',16,99),(211,1,'2018-01-26 21:28:27',17,99),(212,1,'2018-01-26 21:28:42',17,99),(213,1,'2018-01-26 21:28:57',17,99),(214,1,'2018-01-26 21:29:12',16,99),(215,1,'2018-01-26 21:29:27',14,99),(216,1,'2018-01-26 21:29:42',15,99),(217,1,'2018-01-26 21:29:57',15,99),(218,1,'2018-01-26 21:30:12',16,99),(219,1,'2018-01-26 21:30:27',16,99),(220,1,'2018-01-26 21:30:40',16,99),(221,1,'2018-01-26 21:30:55',15,99),(222,1,'2018-01-26 21:31:11',16,99),(223,1,'2018-01-26 21:31:26',15,99),(224,1,'2018-01-26 21:31:41',14,99),(225,1,'2018-01-26 21:31:56',15,99),(226,1,'2018-01-26 21:32:11',16,99),(227,1,'2018-01-26 21:32:26',15,99),(228,1,'2018-01-26 21:32:41',16,99),(229,1,'2018-01-26 21:32:56',16,99),(230,1,'2018-01-26 21:33:11',15,99),(231,1,'2018-01-26 21:33:26',16,99),(232,1,'2018-01-26 21:33:41',15,99),(233,1,'2018-01-26 21:33:56',16,99),(234,1,'2018-01-26 21:34:11',16,99),(235,1,'2018-01-26 21:34:26',15,99),(236,1,'2018-01-26 21:34:41',15,99),(237,1,'2018-01-26 21:34:56',16,99),(238,1,'2018-01-26 21:35:11',11,99),(239,1,'2018-01-26 21:35:26',14,99),(240,1,'2018-01-26 21:35:41',15,99),(241,1,'2018-01-26 21:35:56',13,99),(242,1,'2018-01-26 21:36:11',15,99),(243,1,'2018-01-26 21:36:26',14,99),(244,1,'2018-01-26 21:36:41',12,99),(245,1,'2018-01-26 21:36:56',15,99),(246,1,'2018-01-26 21:37:11',14,99),(247,1,'2018-01-26 21:37:26',15,99),(248,1,'2018-01-26 21:37:41',14,99),(249,1,'2018-01-26 21:37:56',12,99),(250,1,'2018-01-26 21:38:11',12,99),(251,1,'2018-01-26 21:38:26',14,99),(252,1,'2018-01-26 21:38:41',13,99),(253,1,'2018-01-26 21:38:56',16,99),(254,1,'2018-01-26 21:39:11',15,99),(255,1,'2018-01-26 21:39:26',18,99),(256,1,'2018-01-26 21:39:41',18,99),(257,1,'2018-01-26 21:39:56',18,99),(258,1,'2018-01-26 21:40:11',17,99),(259,1,'2018-01-26 21:40:26',18,99),(260,1,'2018-01-26 21:40:41',18,99),(261,1,'2018-01-26 21:40:56',17,99),(262,1,'2018-01-26 21:41:11',18,99),(263,1,'2018-01-26 21:41:26',18,99),(264,1,'2018-01-26 21:41:41',18,99),(265,1,'2018-01-26 21:41:55',17,99),(266,1,'2018-01-26 21:42:10',18,99),(267,1,'2018-01-26 21:42:25',18,99),(268,1,'2018-01-26 21:42:40',17,99),(269,1,'2018-01-26 21:42:55',18,99),(270,1,'2018-01-26 21:43:10',17,99),(271,1,'2018-01-26 21:43:25',17,99),(272,1,'2018-01-26 21:43:40',14,99),(273,1,'2018-01-26 21:43:55',14,99),(274,1,'2018-01-26 21:44:10',13,99),(275,1,'2018-01-26 21:44:25',15,99),(276,1,'2018-01-26 21:44:40',15,99),(277,1,'2018-01-26 21:44:55',15,99),(278,1,'2018-01-26 21:45:10',14,99),(279,1,'2018-01-26 21:45:25',14,99),(280,1,'2018-01-26 21:45:40',13,99),(281,1,'2018-01-26 21:45:55',15,99),(282,1,'2018-01-26 21:46:10',13,99),(283,1,'2018-01-26 21:46:25',15,99),(284,1,'2018-01-26 21:46:40',15,99),(285,1,'2018-01-26 21:46:55',15,99),(286,1,'2018-01-26 21:47:10',15,99),(287,1,'2018-01-26 21:47:25',16,99),(288,1,'2018-01-26 21:47:40',15,99),(289,1,'2018-01-26 21:47:55',14,99),(290,1,'2018-01-26 21:48:10',16,99),(291,1,'2018-01-26 21:48:25',15,99),(292,1,'2018-01-26 21:48:40',16,99),(293,1,'2018-01-26 21:48:55',16,99),(294,1,'2018-01-26 21:49:10',15,99),(295,1,'2018-01-26 21:49:25',14,99),(296,1,'2018-01-26 21:49:40',14,99),(297,1,'2018-01-26 21:49:55',15,99),(298,1,'2018-01-26 21:50:10',15,99),(299,1,'2018-01-26 21:50:25',15,99),(300,1,'2018-01-26 21:50:40',15,99),(301,1,'2018-01-26 21:50:55',14,99),(302,1,'2018-01-26 21:51:10',14,99),(303,1,'2018-01-26 21:51:25',14,99),(304,1,'2018-01-26 21:51:41',14,99),(305,1,'2018-01-26 21:51:56',13,99),(306,1,'2018-01-26 21:52:11',14,99),(307,1,'2018-01-26 21:52:26',14,99),(308,1,'2018-01-26 21:52:41',15,99),(309,1,'2018-01-26 21:52:56',16,99),(310,1,'2018-01-26 21:53:11',14,99),(311,1,'2018-01-26 21:53:26',14,99),(312,1,'2018-01-26 21:53:41',15,99),(313,1,'2018-01-26 21:53:56',14,99),(314,1,'2018-01-26 21:54:11',14,99),(315,1,'2018-01-26 21:54:26',13,99),(316,1,'2018-01-26 21:54:41',14,99),(317,1,'2018-01-26 21:54:56',15,99),(318,1,'2018-01-26 21:55:11',14,99),(319,1,'2018-01-26 21:55:26',13,99),(320,1,'2018-01-26 21:55:41',14,99),(321,1,'2018-01-26 21:55:56',14,99),(322,1,'2018-01-26 21:56:11',15,99),(323,1,'2018-01-26 21:56:26',14,99),(324,1,'2018-01-26 21:56:41',14,99),(325,1,'2018-01-26 21:56:56',15,99),(326,1,'2018-01-26 21:57:11',14,99),(327,1,'2018-01-26 21:57:26',13,99),(328,1,'2018-01-26 21:57:41',14,99),(329,1,'2018-01-26 21:57:56',15,99),(330,1,'2018-01-26 21:58:11',14,99),(331,1,'2018-01-26 21:58:26',15,99),(332,1,'2018-01-26 21:58:41',14,99),(333,1,'2018-01-26 21:58:56',14,99),(334,1,'2018-01-26 21:59:11',14,99),(335,1,'2018-01-26 21:59:26',14,99),(336,1,'2018-01-26 21:59:41',15,99),(337,1,'2018-01-26 21:59:56',13,99),(338,1,'2018-01-26 22:00:11',14,99),(339,1,'2018-01-26 22:00:26',14,99),(340,1,'2018-01-26 22:00:41',13,99),(341,1,'2018-01-26 22:00:56',13,99),(342,1,'2018-01-26 22:01:11',14,99),(343,1,'2018-01-26 22:01:26',13,99),(344,1,'2018-01-26 22:01:41',13,99),(345,1,'2018-01-26 22:01:56',13,99),(346,1,'2018-01-26 22:02:11',12,99),(347,1,'2018-01-26 22:02:27',13,99),(348,1,'2018-01-26 22:02:42',13,99),(349,1,'2018-01-26 22:02:57',15,99),(350,1,'2018-01-26 22:03:12',13,99),(351,1,'2018-01-26 22:03:27',14,99),(352,1,'2018-01-26 22:03:42',14,99),(353,1,'2018-01-25 20:30:32',20,99),(354,1,'2018-01-25 20:30:47',17,99),(355,1,'2018-01-25 20:31:02',18,99),(356,1,'2018-01-25 20:31:17',18,99),(357,1,'2018-01-25 20:31:33',18,99);
/*!40000 ALTER TABLE `signal_strength` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(16) NOT NULL,
  `parameters` json DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `transaction` bigint(18) DEFAULT NULL,
  `ret_value` json DEFAULT NULL,
  `execute_status` char(1) NOT NULL DEFAULT 'N',
  `device` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task__task_type__FK_IDX` (`task_type`),
  KEY `task_execute_status_id_FK` (`execute_status`),
  KEY `task_transaction_id_FK` (`transaction`),
  KEY `task_device_FK_idx` (`device`),
  CONSTRAINT `task__task_type__FK` FOREIGN KEY (`task_type`) REFERENCES `task_type` (`code`) ON UPDATE CASCADE,
  CONSTRAINT `task_device_FK` FOREIGN KEY (`device`) REFERENCES `device` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_execute_status_id_FK` FOREIGN KEY (`execute_status`) REFERENCES `task_execute_status` (`id`),
  CONSTRAINT `task_transaction_id_FK` FOREIGN KEY (`transaction`) REFERENCES `transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'ONLINE',NULL,'2018-01-25 20:22:51',NULL,NULL,'Y',1),(2,'ONLINE',NULL,'2018-01-25 20:25:19',NULL,NULL,'Y',1),(3,'ONLINE',NULL,'2018-01-25 20:27:28',NULL,NULL,'Y',1),(4,'ONLINE',NULL,'2018-01-25 20:31:32',NULL,NULL,'Y',1),(5,'ONLINE',NULL,'2018-01-25 20:41:45',NULL,NULL,'Y',1),(6,'ONLINE',NULL,'2018-01-25 20:42:50',NULL,NULL,'Y',1),(7,'GETWIFI','{\"api\": 1, \"task_id\": 7, \"task_type\": \"GETWIFI\"}','2018-01-26 21:21:21',NULL,'[{\"ssid\": \"netis_DBAB32\", \"quality\": 10, \"security\": \"WPA2\"}, {\"ssid\": \"vlad\", \"quality\": 10, \"security\": \"WPA2\"}, {\"ssid\": \"YUREZZZ\", \"quality\": 17, \"security\": \"WPA2\"}, {\"ssid\": \"HUAWEI18a40\", \"quality\": 12, \"security\": \"WPA2\"}, {\"ssid\": \"kyivstar28\", \"quality\": 14, \"security\": \"WPA2\"}, {\"ssid\": \"homka\", \"quality\": 17, \"security\": \"WPA2\"}, {\"ssid\": \"HomeNet\", \"quality\": 10, \"security\": \"WPA2\"}, {\"ssid\": \"LCNet\", \"quality\": 100, \"security\": \"WPA\"}, {\"ssid\": \"Katia\", \"quality\": 100, \"security\": \"WPA2\"}, {\"ssid\": \"GreenBearG\", \"quality\": 27, \"security\": \"WPA2\"}, {\"ssid\": \"iVAN\", \"quality\": 10, \"security\": \"WPA2\"}, {\"ssid\": \"Ponyland\", \"quality\": 15, \"security\": \"WPA2\"}, {\"ssid\": \"vsias\", \"quality\": 12, \"security\": \"WPA2\"}, {\"ssid\": \"MRF Capsule\", \"quality\": 15, \"security\": \"WPA2\"}, {\"ssid\": \"Edimax\", \"quality\": 12, \"security\": \"WPA2\"}, {\"ssid\": \"TP-LINK_E16A\", \"quality\": 19, \"security\": \"WPA2\"}, {\"ssid\": \"Chupakabra_2006\", \"quality\": 19, \"security\": \"WPA2\"}, {\"ssid\": \"polisx\", \"quality\": 24, \"security\": \"WPA2\"}, {\"ssid\": \"TP-LINK_39\", \"quality\": 25, \"security\": \"WPA2\"}, {\"ssid\": \"ZyXEL\", \"quality\": 25, \"security\": \"WPA2\"}, {\"ssid\": \"Torm\", \"quality\": 39, \"security\": \"WPA2\"}, {\"ssid\": \"XataTest\", \"quality\": 99, \"security\": \"WPA\"}, {\"ssid\": \"Xata\", \"quality\": 99, \"security\": \"WPA2\"}]','Y',1),(8,'SYNCWIFI','{\"api\": 1, \"task_id\": 8, \"task_type\": \"SYNCWIFI\", \"task_parameters\": {\"key\": \"Easytofly32167\", \"ssid\": \"XataTest\", \"enabled\": \"N\", \"security\": \"WPA\"}}','2018-01-26 21:22:17',NULL,'null','Y',1),(9,'SYNCWIFI','{\"api\": 1, \"task_id\": 9, \"task_type\": \"SYNCWIFI\", \"task_parameters\": {\"key\": \"Easytofly32167\", \"ssid\": \"Xata\", \"enabled\": \"N\", \"security\": \"WPA2\"}}','2018-01-26 21:39:59',NULL,'null','Y',1),(10,'SYNCWIFI','{\"api\": 1, \"task_id\": 10, \"task_type\": \"SYNCWIFI\", \"task_parameters\": {\"key\": \"Easytofly32167\", \"ssid\": \"XataTest\", \"enabled\": \"N\", \"security\": \"WPA\"}}','2018-01-26 21:42:39',NULL,'null','Y',1),(11,'SYNCWIFI','{\"api\": 1, \"task_id\": 11, \"task_type\": \"SYNCWIFI\", \"task_parameters\": {\"key\": \"Easytofly32167\", \"ssid\": \"XataTest\", \"enabled\": \"N\", \"security\": \"WPA\"}}','2018-01-26 22:09:08',NULL,NULL,'Y',1),(12,'ONLINE',NULL,'2018-01-30 20:36:06',NULL,NULL,'Y',1),(13,'ONLINE',NULL,'2018-01-30 20:39:05',NULL,NULL,'Y',1),(14,'SYNC','{\"api\": 1, \"task_id\": 14, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2018-02-23 20:42:08',NULL,NULL,'Y',1),(15,'SYNC','{\"api\": 1, \"task_id\": 15, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2019-01-04 19:26:26',NULL,NULL,'Y',1),(16,'SYNC','{\"api\": 1, \"task_id\": 16, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2019-01-11 21:37:39',NULL,NULL,'Y',1),(17,'SYNC','{\"api\": 1, \"task_id\": 17, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2019-01-12 01:40:11',NULL,NULL,'Y',1),(18,'SYNC','{\"api\": 1, \"task_id\": 18, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2019-03-26 00:02:54',NULL,NULL,'Y',1),(19,'SCAN','{\"api\": 1, \"task_id\": 19, \"task_type\": \"SCAN\"}','2019-08-07 14:49:40',NULL,NULL,'Y',3),(20,'SYNC','{\"api\": 1, \"task_id\": 20, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-02-13 22:11:41',NULL,NULL,'Y',1),(21,'SYNC','{\"api\": 1, \"task_id\": 21, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-02-13 22:11:41',NULL,NULL,'Y',1),(22,'SYNC','{\"api\": 1, \"task_id\": 22, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-08-13 20:25:34',NULL,NULL,'Y',1),(23,'SYNC','{\"api\": 1, \"task_id\": 23, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-08-13 20:25:51',NULL,NULL,'Y',1),(24,'SYNC','{\"api\": 1, \"task_id\": 24, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-08-13 20:25:56',NULL,NULL,'Y',1),(25,'SYNC','{\"api\": 1, \"task_id\": 25, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-08-13 20:26:02',NULL,NULL,'Y',1),(26,'SYNC','{\"api\": 1, \"task_id\": 26, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-08-13 20:26:19',NULL,NULL,'Y',1),(27,'SYNC','{\"api\": 1, \"task_id\": 27, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-08-13 20:29:03',NULL,NULL,'Y',1),(28,'SCAN','{\"api\": 1, \"task_id\": 28, \"task_type\": \"SCAN\"}','2020-10-05 20:15:03',NULL,NULL,'Y',1),(29,'SCAN','{\"api\": 1, \"task_id\": 29, \"task_type\": \"SCAN\"}','2020-10-14 20:21:12',NULL,NULL,'Y',2),(30,'GETWIFI','{\"api\": 1, \"task_id\": 30, \"task_type\": \"GETWIFI\"}','2020-10-15 20:34:33',NULL,'[{\"ssid\": \"Zerg\", \"quality\": 1}]','Y',1),(31,'GETWIFI','{\"api\": 1, \"task_id\": 31, \"task_type\": \"GETWIFI\"}','2020-10-15 20:38:39',NULL,'[{\"ssid\": \"Zerg\", \"quality\": 3}]','Y',1),(32,'SCAN','{\"api\": 1, \"task_id\": 32, \"task_type\": \"SCAN\"}','2020-10-16 15:57:43',NULL,NULL,'Y',1),(33,'SCAN','{\"api\": 1, \"task_id\": 33, \"task_type\": \"SCAN\"}','2020-10-16 16:17:34',NULL,NULL,'Y',1),(34,'SCAN','{\"api\": 1, \"task_id\": 34, \"task_type\": \"SCAN\"}','2020-10-16 16:23:35',NULL,NULL,'Y',1),(35,'SCAN','{\"api\": 1, \"task_id\": 35, \"task_type\": \"SCAN\"}','2020-10-16 16:34:30',NULL,NULL,'Y',1),(36,'SCAN','{\"api\": 1, \"task_id\": 36, \"task_type\": \"SCAN\"}','2020-10-16 16:43:37',NULL,NULL,'Y',1),(37,'SCAN','{\"api\": 1, \"task_id\": 37, \"task_type\": \"SCAN\"}','2020-10-16 16:49:47',NULL,NULL,'Y',1),(38,'SCAN','{\"api\": 1, \"task_id\": 38, \"task_type\": \"SCAN\"}','2020-10-16 16:52:32',NULL,NULL,'Y',1),(39,'SCAN','{\"api\": 1, \"task_id\": 39, \"task_type\": \"SCAN\"}','2020-10-16 17:04:45',NULL,NULL,'Y',1),(40,'SCAN','{\"api\": 1, \"task_id\": 40, \"task_type\": \"SCAN\"}','2020-10-16 17:24:03',NULL,NULL,'Y',1),(41,'SCAN','{\"api\": 1, \"task_id\": 41, \"task_type\": \"SCAN\"}','2020-10-16 17:50:01',NULL,'null','Y',1),(42,'SCAN','{\"api\": 1, \"task_id\": 42, \"task_type\": \"SCAN\"}','2020-10-16 20:02:41',NULL,'null','Y',1),(43,'SCAN','{\"api\": 1, \"task_id\": 43, \"task_type\": \"SCAN\"}','2020-10-16 20:20:00',NULL,'null','Y',1),(44,'SCAN','{\"api\": 1, \"task_id\": 44, \"task_type\": \"SCAN\"}','2020-10-16 20:33:08',NULL,'null','Y',1),(45,'SCAN','{\"api\": 1, \"task_id\": 45, \"task_type\": \"SCAN\"}','2020-10-19 18:21:55',NULL,'null','Y',1),(46,'SCAN','{\"api\": 1, \"task_id\": 46, \"task_type\": \"SCAN\"}','2020-10-19 18:29:06',NULL,'null','Y',1),(47,'SCAN','{\"api\": 1, \"task_id\": 47, \"task_type\": \"SCAN\"}','2020-10-19 19:34:45',NULL,'null','Y',1),(48,'SCAN','{\"api\": 1, \"task_id\": 48, \"task_type\": \"SCAN\"}','2020-10-19 20:33:40',NULL,'null','Y',1),(49,'SCAN','{\"api\": 1, \"task_id\": 49, \"task_type\": \"SCAN\"}','2020-10-19 20:52:45',NULL,'null','Y',1),(50,'SCAN','{\"api\": 1, \"task_id\": 50, \"task_type\": \"SCAN\"}','2020-10-19 21:05:39',NULL,'null','Y',1),(51,'SCAN','{\"api\": 1, \"task_id\": 51, \"task_type\": \"SCAN\"}','2020-10-19 21:18:06',NULL,'null','Y',1),(52,'SYNC','{\"api\": 1, \"task_id\": 52, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-20 12:53:45',NULL,'null','Y',1),(53,'SYNC','{\"api\": 1, \"task_id\": 53, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": [{\"id\": 175, \"bins\": [{\"bin\": \"cDkH0BCgZN\", \"slot\": 2, \"cartridge\": \"BBBBBAAAAA\", \"medications\": [{\"name\": \"Albuterol Sulfate ER TB12 4 MG\", \"prescription\": 12, \"strength_uom\": \"\", \"is_discontinued\": \"N\", \"strength_amount\": \"\"}], \"is_discontinued\": \"N\"}], \"is_prn\": \"Y\", \"patient_id\": \"1\", \"patient_sex\": \"F\", \"patient_name\": \"Brenda Smith\", \"action_notrcg\": \"DSP\", \"speaker_volume\": 100, \"execute_datetime\": \"\", \"executed_datetime\": \"\", \"is_face_recognized\": \"U\", \"scheduled_datetime\": \"2020-10-21 01:00:00\", \"audio_alerts_number\": 10, \"speaker_volume_prox\": 70, \"audio_alerts_interval\": 30}, {\"id\": 174, \"bins\": [{\"bin\": \"pMOAo\", \"slot\": 1, \"cartridge\": \"BBBBBAAAAA\", \"medications\": [{\"name\": \"Albuterol Sulfate ER TB12 4 MG\", \"prescription\": 12, \"strength_uom\": \"\", \"is_discontinued\": \"N\", \"strength_amount\": \"\"}], \"is_discontinued\": \"N\"}], \"is_prn\": \"Y\", \"patient_id\": \"1\", \"patient_sex\": \"F\", \"patient_name\": \"Brenda Smith\", \"action_notrcg\": \"DSP\", \"speaker_volume\": 100, \"execute_datetime\": \"\", \"executed_datetime\": \"\", \"is_face_recognized\": \"U\", \"scheduled_datetime\": \"2020-10-20 22:00:00\", \"audio_alerts_number\": 10, \"speaker_volume_prox\": 70, \"audio_alerts_interval\": 30}, {\"id\": 177, \"bins\": [{\"bin\": \"t9hWvr1ipZ\", \"slot\": 4, \"cartridge\": \"BBBBBAAAAA\", \"medications\": [{\"name\": \"Albuterol Sulfate ER TB12 4 MG\", \"prescription\": 12, \"strength_uom\": \"\", \"is_discontinued\": \"N\", \"strength_amount\": \"\"}], \"is_discontinued\": \"N\"}], \"is_prn\": \"Y\", \"patient_id\": \"1\", \"patient_sex\": \"F\", \"patient_name\": \"Brenda Smith\", \"action_notrcg\": \"DSP\", \"speaker_volume\": 100, \"execute_datetime\": \"\", \"executed_datetime\": \"\", \"is_face_recognized\": \"U\", \"scheduled_datetime\": \"2020-10-22 01:00:00\", \"audio_alerts_number\": 10, \"speaker_volume_prox\": 70, \"audio_alerts_interval\": 30}, {\"id\": 176, \"bins\": [{\"bin\": \"WKgVnXHzzX\", \"slot\": 3, \"cartridge\": \"BBBBBAAAAA\", \"medications\": [{\"name\": \"Albuterol Sulfate ER TB12 4 MG\", \"prescription\": 12, \"strength_uom\": \"\", \"is_discontinued\": \"N\", \"strength_amount\": \"\"}], \"is_discontinued\": \"N\"}], \"is_prn\": \"Y\", \"patient_id\": \"1\", \"patient_sex\": \"F\", \"patient_name\": \"Brenda Smith\", \"action_notrcg\": \"DSP\", \"speaker_volume\": 100, \"execute_datetime\": \"\", \"executed_datetime\": \"\", \"is_face_recognized\": \"U\", \"scheduled_datetime\": \"2020-10-21 22:00:00\", \"audio_alerts_number\": 10, \"speaker_volume_prox\": 70, \"audio_alerts_interval\": 30}]}}','2020-10-20 13:06:36',NULL,'null','Y',1),(54,'SCAN','{\"api\": 1, \"task_id\": 54, \"task_type\": \"SCAN\"}','2020-10-20 13:08:23',NULL,NULL,'Y',1),(55,'SCAN','{\"api\": 1, \"task_id\": 55, \"task_type\": \"SCAN\"}','2020-10-20 13:10:59',NULL,'null','Y',1),(56,'EARLYDSP','{\"api\": 1, \"task_id\": 56, \"task_type\": \"EARLYDSP\", \"task_parameters\": {\"transaction_id\": 174}}','2020-10-20 13:23:27',174,'{\"completed_datetime\": \"2020-10-20 13:24:04\"}','Y',1),(57,'EARLYDSP','{\"api\": 1, \"task_id\": 57, \"task_type\": \"EARLYDSP\", \"task_parameters\": {\"transaction_id\": 175}}','2020-10-20 13:26:10',175,'{\"completed_datetime\": \"2020-10-20 13:26:22\"}','Y',1),(58,'EARLYDSP','{\"api\": 1, \"task_id\": 58, \"task_type\": \"EARLYDSP\", \"task_parameters\": {\"transaction_id\": 176}}','2020-10-20 13:56:35',176,'{\"completed_datetime\": \"2020-10-20 13:56:43\"}','Y',1),(59,'EARLYDSP','{\"api\": 1, \"task_id\": 59, \"task_type\": \"EARLYDSP\", \"task_parameters\": {\"transaction_id\": 177}}','2020-10-20 14:06:48',177,'{\"completed_datetime\": \"2020-10-20 14:56:43\"}','Y',1),(60,'SYNC','{\"api\": 1, \"task_id\": 60, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-20 19:13:34',NULL,NULL,'Y',2),(61,'SYNC','{\"api\": 1, \"task_id\": 61, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-21 01:27:00',NULL,NULL,'S',2),(62,'SYNC','{\"api\": 1, \"task_id\": 62, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-21 15:37:32',NULL,NULL,'S',2),(63,'SYNC','{\"api\": 1, \"task_id\": 63, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-21 15:39:52',NULL,NULL,'S',2),(64,'SYNC','{\"api\": 1, \"task_id\": 64, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-21 17:47:46',NULL,NULL,'S',2),(65,'SYNC',NULL,'2020-10-21 21:05:49',NULL,NULL,'S',1),(66,'SYNC',NULL,'2020-10-21 21:06:18',NULL,NULL,'S',1),(67,'SYNC','{\"api\": 1, \"task_id\": 67, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-21 21:07:15',NULL,NULL,'S',3),(68,'SYNC','{\"api\": 1, \"task_id\": 68, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-21 21:08:06',NULL,NULL,'S',3),(69,'SYNC',NULL,'2020-10-21 21:08:25',NULL,NULL,'S',1),(70,'SYNC',NULL,'2020-10-22 17:59:40',NULL,NULL,'S',1),(71,'SYNC','{\"api\": 1, \"task_id\": 71, \"task_type\": \"SYNC\", \"task_parameters\": {\"transactions\": []}}','2020-10-22 18:00:24',NULL,NULL,'S',3),(72,'SCAN','{\"api\": 1, \"task_id\": 72, \"task_type\": \"SCAN\"}','2020-10-22 18:14:38',NULL,NULL,'S',1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_execute_status`
--

DROP TABLE IF EXISTS `task_execute_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_execute_status` (
  `id` char(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_execute_status`
--

LOCK TABLES `task_execute_status` WRITE;
/*!40000 ALTER TABLE `task_execute_status` DISABLE KEYS */;
INSERT INTO `task_execute_status` VALUES ('E','error',NULL),('N','no execute task',NULL),('P','in process',NULL),('S','synchronizing',NULL),('Y','executed',NULL);
/*!40000 ALTER TABLE `task_execute_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_type` (
  `code` varchar(16) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES ('BYPASS','BYPASS DOSE',NULL),('EARLYDSP','EARLY DISPENSE',NULL),('GETWIFI','GET WIFI SSIDs',NULL),('OFFLINE','OFFLINE',NULL),('ONLINE','ONLINE',NULL),('SCAN','SCAN ALL BINS',NULL),('SCNBIN','SCAN BIN',NULL),('SCNCRTRG','SCAN CARTRIDGE',NULL),('SYNC','sync transaction',NULL),('SYNCWIFI','SYNC WIFI SETTINGS',NULL),('UPLDVID','UPLOAD VIDEO',NULL);
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `frequency` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_frequency_FK_idx` (`frequency`),
  CONSTRAINT `time_frequency_FK` FOREIGN KEY (`frequency`) REFERENCES `frequency` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (8,'09:00:00',NULL,'BID'),(9,'16:00:00',NULL,'BID'),(10,'09:00:00',NULL,'QAM'),(11,'09:00:00',NULL,'QD'),(12,'21:00:00',NULL,'QHS'),(13,'09:00:00',NULL,'QID'),(14,'13:00:00',NULL,'QID'),(15,'17:00:00',NULL,'QID'),(16,'21:00:00',NULL,'QID'),(17,'09:00:00',NULL,'QOD'),(18,'21:00:00',NULL,'QPM'),(19,'00:00:00',NULL,'QSHIFT'),(20,'08:00:00',NULL,'QSHIFT'),(21,'16:00:00',NULL,'QSHIFT'),(22,'09:00:00',NULL,'TID'),(23,'16:00:00',NULL,'TID'),(24,'21:00:00',NULL,'TID'),(25,'12:00:00',NULL,'ONCE'),(26,'12:00:00',NULL,'STAT');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `transaction_status` varchar(16) DEFAULT NULL,
  `recognition_status` varchar(16) DEFAULT NULL,
  `scheduled_datetime` datetime DEFAULT NULL,
  `execute_datetime` datetime DEFAULT NULL,
  `executed_datetime` datetime DEFAULT NULL,
  `transaction_direction` varchar(16) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `transaction__transaction_status__FK_IDX` (`transaction_status`),
  KEY `transaction__recognition_status__FK_IDX` (`recognition_status`),
  KEY `transaction__transaction_direction_idx` (`transaction_direction`),
  CONSTRAINT `transaction__recognition_status__FK` FOREIGN KEY (`recognition_status`) REFERENCES `recognition_status` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction__transaction_direction` FOREIGN KEY (`transaction_direction`) REFERENCES `transaction_direction` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction__transaction_status__FK` FOREIGN KEY (`transaction_status`) REFERENCES `transaction_status` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'SCHD',NULL,'2018-02-23 16:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(2,'SCHD',NULL,'2018-02-24 00:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(3,'SCHD',NULL,'2018-02-24 16:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(4,'SCHD',NULL,'2018-02-25 00:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(5,'SCHD',NULL,'2018-02-25 16:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(6,'SCHD',NULL,'2018-02-26 00:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(7,'SCHD',NULL,'2018-02-26 16:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(8,'SCHD',NULL,'2018-02-27 00:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(9,'SCHD',NULL,'2018-02-27 16:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(10,'SCHD',NULL,'2018-02-28 00:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(11,'SCHD',NULL,'2018-02-28 16:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(12,'SCHD',NULL,'2018-03-01 00:00:00',NULL,NULL,NULL,'2018-02-23 20:42:08'),(13,'SCHD',NULL,'2019-01-04 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(14,'SCHD',NULL,'2019-01-05 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(15,'SCHD',NULL,'2019-01-06 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(16,'SCHD',NULL,'2019-01-07 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(17,'SCHD',NULL,'2019-01-08 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(18,'SCHD',NULL,'2019-01-09 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(19,'SCHD',NULL,'2019-01-10 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(20,'SCHD',NULL,'2019-01-11 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(21,'SCHD',NULL,'2019-01-12 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(22,'SCHD',NULL,'2019-01-13 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(23,'SCHD',NULL,'2019-01-14 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(24,'SCHD',NULL,'2019-01-15 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(25,'SCHD',NULL,'2019-01-16 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(26,'SCHD',NULL,'2019-01-17 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(27,'SCHD',NULL,'2019-01-18 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(28,'SCHD',NULL,'2019-01-19 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(29,'SCHD',NULL,'2019-01-20 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(30,'SCHD',NULL,'2019-01-21 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(31,'SCHD',NULL,'2019-01-22 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(32,'SCHD',NULL,'2019-01-23 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(33,'SCHD',NULL,'2019-01-24 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(34,'SCHD',NULL,'2019-01-25 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(35,'SCHD',NULL,'2019-01-26 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(36,'SCHD',NULL,'2019-01-27 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(37,'SCHD',NULL,'2019-01-28 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(38,'SCHD',NULL,'2019-01-29 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(39,'SCHD',NULL,'2019-01-30 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(40,'SCHD',NULL,'2019-01-31 14:00:00',NULL,NULL,NULL,'2019-01-04 19:26:26'),(41,'SCHD',NULL,'2019-01-11 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(42,'SCHD',NULL,'2019-01-12 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(43,'SCHD',NULL,'2019-01-13 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(44,'SCHD',NULL,'2019-01-14 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(45,'SCHD',NULL,'2019-01-15 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(46,'SCHD',NULL,'2019-01-16 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(47,'SCHD',NULL,'2019-01-17 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(48,'SCHD',NULL,'2019-01-18 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(49,'SCHD',NULL,'2019-01-19 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(50,'SCHD',NULL,'2019-01-20 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(51,'SCHD',NULL,'2019-01-21 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(52,'SCHD',NULL,'2019-01-22 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(53,'SCHD',NULL,'2019-01-23 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(54,'SCHD',NULL,'2019-01-24 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(55,'SCHD',NULL,'2019-01-25 14:00:00',NULL,NULL,NULL,'2019-01-11 21:37:39'),(56,'SCHD',NULL,'2019-01-11 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(57,'SCHD',NULL,'2019-01-11 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(58,'SCHD',NULL,'2019-01-12 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(59,'SCHD',NULL,'2019-01-12 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(60,'SCHD',NULL,'2019-01-13 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(61,'SCHD',NULL,'2019-01-13 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(62,'SCHD',NULL,'2019-01-14 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(63,'SCHD',NULL,'2019-01-14 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(64,'SCHD',NULL,'2019-01-15 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(65,'SCHD',NULL,'2019-01-15 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(66,'SCHD',NULL,'2019-01-16 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(67,'SCHD',NULL,'2019-01-16 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(68,'SCHD',NULL,'2019-01-17 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(69,'SCHD',NULL,'2019-01-17 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(70,'SCHD',NULL,'2019-01-18 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(71,'SCHD',NULL,'2019-01-18 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(72,'SCHD',NULL,'2019-01-19 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(73,'SCHD',NULL,'2019-01-19 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(74,'SCHD',NULL,'2019-01-20 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(75,'SCHD',NULL,'2019-01-20 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(76,'SCHD',NULL,'2019-01-21 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(77,'SCHD',NULL,'2019-01-21 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(78,'SCHD',NULL,'2019-01-22 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(79,'SCHD',NULL,'2019-01-22 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(80,'SCHD',NULL,'2019-01-23 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(81,'SCHD',NULL,'2019-01-23 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(82,'SCHD',NULL,'2019-01-24 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(83,'SCHD',NULL,'2019-01-24 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(84,'SCHD',NULL,'2019-01-25 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(85,'SCHD',NULL,'2019-01-25 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(86,'SCHD',NULL,'2019-01-26 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(87,'SCHD',NULL,'2019-01-26 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(88,'SCHD',NULL,'2019-01-27 21:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(89,'SCHD',NULL,'2019-01-27 15:00:00',NULL,NULL,NULL,'2019-01-12 01:40:11'),(90,'SCHD',NULL,'2019-03-26 13:00:00',NULL,NULL,NULL,'2019-03-26 00:02:54'),(91,'SCHD',NULL,'2020-02-13 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(92,'SCHD',NULL,'2020-02-13 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(93,'SCHD',NULL,'2020-02-14 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(94,'SCHD',NULL,'2020-02-14 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(95,'SCHD',NULL,'2020-02-15 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(96,'SCHD',NULL,'2020-02-15 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(97,'SCHD',NULL,'2020-02-16 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(98,'SCHD',NULL,'2020-02-16 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(99,'SCHD',NULL,'2020-02-17 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(100,'SCHD',NULL,'2020-02-17 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(101,'SCHD',NULL,'2020-02-18 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(102,'SCHD',NULL,'2020-02-18 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(103,'SCHD',NULL,'2020-02-19 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(104,'SCHD',NULL,'2020-02-19 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(105,'SCHD',NULL,'2020-02-20 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(106,'SCHD',NULL,'2020-02-20 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(107,'SCHD',NULL,'2020-02-21 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(108,'SCHD',NULL,'2020-02-21 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(109,'SCHD',NULL,'2020-02-22 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(110,'SCHD',NULL,'2020-02-22 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(111,'SCHD',NULL,'2020-02-23 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(112,'SCHD',NULL,'2020-02-23 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(113,'SCHD',NULL,'2020-02-24 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(114,'SCHD',NULL,'2020-02-24 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(115,'SCHD',NULL,'2020-02-25 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(116,'SCHD',NULL,'2020-02-25 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(117,'SCHD',NULL,'2020-02-26 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(118,'SCHD',NULL,'2020-02-26 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(119,'SCHD',NULL,'2020-02-27 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(120,'SCHD',NULL,'2020-02-27 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(121,'SCHD',NULL,'2020-02-28 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(122,'SCHD',NULL,'2020-02-28 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(123,'SCHD',NULL,'2020-02-29 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(124,'SCHD',NULL,'2020-02-29 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(125,'SCHD',NULL,'2020-03-01 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(126,'SCHD',NULL,'2020-03-01 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(127,'SCHD',NULL,'2020-03-02 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(128,'SCHD',NULL,'2020-03-02 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(129,'SCHD',NULL,'2020-03-03 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(130,'SCHD',NULL,'2020-03-03 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(131,'SCHD',NULL,'2020-03-04 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(132,'SCHD',NULL,'2020-03-04 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(133,'SCHD',NULL,'2020-03-05 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(134,'SCHD',NULL,'2020-03-05 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(135,'SCHD',NULL,'2020-03-06 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(136,'SCHD',NULL,'2020-03-06 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(137,'SCHD',NULL,'2020-03-07 21:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(138,'SCHD',NULL,'2020-03-07 14:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(139,'SCHD',NULL,'2020-03-08 20:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(140,'SCHD',NULL,'2020-03-08 13:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(141,'SCHD',NULL,'2020-03-09 20:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(142,'SCHD',NULL,'2020-03-09 13:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(143,'SCHD',NULL,'2020-03-10 20:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(144,'SCHD',NULL,'2020-03-10 13:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(145,'SCHD',NULL,'2020-03-11 20:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(146,'SCHD',NULL,'2020-03-11 13:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(147,'SCHD',NULL,'2020-03-12 20:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(148,'SCHD',NULL,'2020-03-12 13:00:00',NULL,NULL,NULL,'2020-02-13 22:11:41'),(149,'SCHD',NULL,'2020-08-14 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(150,'SCHD',NULL,'2020-08-15 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(151,'SCHD',NULL,'2020-08-16 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(152,'SCHD',NULL,'2020-08-17 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(153,'SCHD',NULL,'2020-08-18 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(154,'SCHD',NULL,'2020-08-19 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(155,'SCHD',NULL,'2020-08-20 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(156,'SCHD',NULL,'2020-08-21 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(157,'SCHD',NULL,'2020-08-22 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(158,'SCHD',NULL,'2020-08-23 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(159,'SCHD',NULL,'2020-08-24 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(160,'SCHD',NULL,'2020-08-25 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(161,'SCHD',NULL,'2020-08-26 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(162,'SCHD',NULL,'2020-08-27 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(163,'SCHD',NULL,'2020-08-28 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(164,'SCHD',NULL,'2020-08-29 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(165,'SCHD',NULL,'2020-08-30 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(166,'SCHD',NULL,'2020-08-31 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(167,'SCHD',NULL,'2020-09-01 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(168,'SCHD',NULL,'2020-09-02 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(169,'SCHD',NULL,'2020-09-03 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(170,'SCHD',NULL,'2020-09-04 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(171,'SCHD',NULL,'2020-09-05 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(172,'SCHD',NULL,'2020-09-06 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(173,'SCHD',NULL,'2020-09-07 01:00:00',NULL,NULL,NULL,'2020-08-13 20:29:03'),(174,'OK','NO','2020-10-20 22:00:00',NULL,'2020-10-20 13:24:03',NULL,'2020-10-20 13:24:03'),(175,'ERROR','NO','2020-10-21 01:00:00',NULL,'2020-10-20 13:26:22',NULL,'2020-10-20 13:26:22'),(176,'MIS','NO','2020-10-21 22:00:00',NULL,'2020-10-20 13:56:42',NULL,'2020-10-20 13:56:42'),(177,'ERROR','NO','2020-10-22 01:00:00',NULL,'2020-10-20 14:07:57',NULL,'2020-10-20 14:07:57'),(178,'SCHD',NULL,'2020-10-20 20:00:00',NULL,NULL,NULL,'2020-10-20 19:13:34'),(179,'SCHD',NULL,'2020-10-20 13:00:00',NULL,NULL,NULL,'2020-10-20 19:13:34'),(180,'SCHD',NULL,'2020-10-21 20:00:00',NULL,NULL,NULL,'2020-10-20 19:13:34'),(181,'SCHD',NULL,'2020-10-21 13:00:00',NULL,NULL,NULL,'2020-10-20 19:13:34'),(182,'SCHD',NULL,'2020-10-21 20:00:00',NULL,NULL,NULL,'2020-10-21 15:37:32'),(183,'SCHD',NULL,'2020-10-21 13:00:00',NULL,NULL,NULL,'2020-10-21 15:37:32'),(184,'SCHD',NULL,'2020-10-22 20:00:00',NULL,NULL,NULL,'2020-10-21 15:37:32'),(185,'SCHD',NULL,'2020-10-22 13:00:00',NULL,NULL,NULL,'2020-10-21 15:37:32'),(186,'SCHD',NULL,'2020-10-21 20:00:00',NULL,NULL,NULL,'2020-10-21 15:39:52'),(187,'SCHD',NULL,'2020-10-21 13:00:00',NULL,NULL,NULL,'2020-10-21 15:39:52'),(188,'SCHD',NULL,'2020-10-22 20:00:00',NULL,NULL,NULL,'2020-10-21 15:39:52'),(189,'SCHD',NULL,'2020-10-22 13:00:00',NULL,NULL,NULL,'2020-10-21 15:39:52');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_direction`
--

DROP TABLE IF EXISTS `transaction_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_direction` (
  `code` varchar(16) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_direction`
--

LOCK TABLES `transaction_direction` WRITE;
/*!40000 ALTER TABLE `transaction_direction` DISABLE KEYS */;
INSERT INTO `transaction_direction` VALUES ('DB','DISPENSE BIN',NULL);
/*!40000 ALTER TABLE `transaction_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_status`
--

DROP TABLE IF EXISTS `transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_status` (
  `code` varchar(16) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_status`
--

LOCK TABLES `transaction_status` WRITE;
/*!40000 ALTER TABLE `transaction_status` DISABLE KEYS */;
INSERT INTO `transaction_status` VALUES ('ERROR','ERROR',NULL),('MIS','MISSED',NULL),('NOTRCG','NOT RECOGNIZED',NULL),('OK','SUCCESS',NULL),('OVD','OVERDUE',NULL),('SCHD','SCHEDULED',NULL);
/*!40000 ALTER TABLE `transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_of_measure`
--

DROP TABLE IF EXISTS `unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_of_measure` (
  `code` varchar(15) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measure`
--

LOCK TABLES `unit_of_measure` WRITE;
/*!40000 ALTER TABLE `unit_of_measure` DISABLE KEYS */;
INSERT INTO `unit_of_measure` VALUES ('          ',NULL,NULL),(' MG       ',NULL,NULL),('%         ',NULL,NULL),('% (Cleans)',NULL,NULL),('% (Cream) ',NULL,NULL),('% (DAILY) ',NULL,NULL),('% (Foam)  ',NULL,NULL),('% (Gel)   ',NULL,NULL),('% (Lotion)',NULL,NULL),('% (MG/ACT)',NULL,NULL),('% (Oint)  ',NULL,NULL),('% (Roll)  ',NULL,NULL),('% (Sleeve)',NULL,NULL),('% (Soln)  ',NULL,NULL),('% CREAM   ',NULL,NULL),('% GEL     ',NULL,NULL),('%-1:100000',NULL,NULL),('%-1:200000',NULL,NULL),('%-1:50000 ',NULL,NULL),('%-MG/SPRAY',NULL,NULL),('%-UNT/30GM',NULL,NULL),('(0.025%)  ',NULL,NULL),('(0.06%)   ',NULL,NULL),('(1%)      ',NULL,NULL),('(1.62%)   ',NULL,NULL),('(10 MG/ML)',NULL,NULL),('(10%)     ',NULL,NULL),('(1080 MG) ',NULL,NULL),('(1620 MG) ',NULL,NULL),('(2%)      ',NULL,NULL),('(20%)     ',NULL,NULL),('(25 MG/ML)',NULL,NULL),('(5%)      ',NULL,NULL),('(540 MG)  ',NULL,NULL),('(Device)  ',NULL,NULL),('(Dis)     ',NULL,NULL),('(Filters) ',NULL,NULL),('(Frozen)  ',NULL,NULL),('-0.025 MG ',NULL,NULL),('-1:200000 ',NULL,NULL),('0.083%    ',NULL,NULL),('0.3 ML    ',NULL,NULL),('0.5 ML    ',NULL,NULL),('0.5%      ',NULL,NULL),('1 MG X 42 ',NULL,NULL),('1 ML      ',NULL,NULL),('1.5 ML    ',NULL,NULL),('10 MCG    ',NULL,NULL),('10 ML     ',NULL,NULL),('12 ML     ',NULL,NULL),('2 ML      ',NULL,NULL),('20 ML     ',NULL,NULL),('3 ML      ',NULL,NULL),('33.33 MG  ',NULL,NULL),('5 ML      ',NULL,NULL),('6 ML      ',NULL,NULL),('AMB A 1-U ',NULL,NULL),('AU/ML     ',NULL,NULL),('B CELL    ',NULL,NULL),('BAU       ',NULL,NULL),('BAU/ML    ',NULL,NULL),('BILLION-MG',NULL,NULL),('BU/GM     ',NULL,NULL),('CM        ',NULL,NULL),('DAYS      ',NULL,NULL),('EL U/0.5ML',NULL,NULL),('EL U/ML   ',NULL,NULL),('ELU-MCG/ML',NULL,NULL),('GM        ',NULL,NULL),('GM & UNIT ',NULL,NULL),('GM-%      ',NULL,NULL),('GM-MG     ',NULL,NULL),('GM-MG-UNIT',NULL,NULL),('GM-UNIT   ',NULL,NULL),('GM/1.5ML  ',NULL,NULL),('GM/10.2GM ',NULL,NULL),('GM/1000ML ',NULL,NULL),('GM/100GM  ',NULL,NULL),('GM/100ML  ',NULL,NULL),('GM/100ML-%',NULL,NULL),('GM/10ML   ',NULL,NULL),('GM/118ML  ',NULL,NULL),('GM/120ML  ',NULL,NULL),('GM/133ML  ',NULL,NULL),('GM/15ML   ',NULL,NULL),('GM/19GM   ',NULL,NULL),('GM/200ML  ',NULL,NULL),('GM/200ML-%',NULL,NULL),('GM/20ML   ',NULL,NULL),('GM/240ML  ',NULL,NULL),('GM/25ML   ',NULL,NULL),('GM/26.3ML ',NULL,NULL),('GM/300ML  ',NULL,NULL),('GM/30ML   ',NULL,NULL),('GM/33GM   ',NULL,NULL),('GM/38GM   ',NULL,NULL),('GM/400ML  ',NULL,NULL),('GM/40ML   ',NULL,NULL),('GM/4ML    ',NULL,NULL),('GM/500ML  ',NULL,NULL),('GM/50ML   ',NULL,NULL),('GM/50ML-% ',NULL,NULL),('GM/52.6ML ',NULL,NULL),('GM/59ML   ',NULL,NULL),('GM/5ML    ',NULL,NULL),('GM/60ML   ',NULL,NULL),('GM/60ML SF',NULL,NULL),('GM/72ML   ',NULL,NULL),('GM/DOSE   ',NULL,NULL),('GM/L      ',NULL,NULL),('GM/ML     ',NULL,NULL),('GM/TSP    ',NULL,NULL),('IR        ',NULL,NULL),('KIU/ML    ',NULL,NULL),('LF-MCG/0.5',NULL,NULL),('LF/0.5ML  ',NULL,NULL),('LFU       ',NULL,NULL),('LFU/0.5ML ',NULL,NULL),('MBQ       ',NULL,NULL),('MBQ/2.5ML ',NULL,NULL),('MBQ/ML    ',NULL,NULL),('MCCI/ML   ',NULL,NULL),('MCG       ',NULL,NULL),('MCG FE/ML ',NULL,NULL),('MCG-MCG-MG',NULL,NULL),('MCG-MG    ',NULL,NULL),('MCG-MG-MCG',NULL,NULL),('MCG-MG-MG ',NULL,NULL),('MCG-MG-UNT',NULL,NULL),('MCG-UNIT  ',NULL,NULL),('MCG/0.02ML',NULL,NULL),('MCG/0.04ML',NULL,NULL),('MCG/0.1ML ',NULL,NULL),('MCG/0.3ML ',NULL,NULL),('MCG/0.42ML',NULL,NULL),('MCG/0.4ML ',NULL,NULL),('MCG/0.5 ML',NULL,NULL),('MCG/0.5ML ',NULL,NULL),('MCG/0.6ML ',NULL,NULL),('MCG/0.75ML',NULL,NULL),('MCG/0.8ML ',NULL,NULL),('MCG/1.5ML ',NULL,NULL),('MCG/1.6ML ',NULL,NULL),('MCG/100ML ',NULL,NULL),('MCG/10ML  ',NULL,NULL),('MCG/10ML-%',NULL,NULL),('MCG/15ML  ',NULL,NULL),('MCG/2.4ML ',NULL,NULL),('MCG/2.7ML ',NULL,NULL),('MCG/20ML  ',NULL,NULL),('MCG/24HR  ',NULL,NULL),('MCG/2ML   ',NULL,NULL),('MCG/2ML-% ',NULL,NULL),('MCG/3ML-% ',NULL,NULL),('MCG/50ML  ',NULL,NULL),('MCG/50ML-%',NULL,NULL),('MCG/5ML   ',NULL,NULL),('MCG/5ML-% ',NULL,NULL),('MCG/ACT   ',NULL,NULL),('MCG/ACT-% ',NULL,NULL),('MCG/BLIST ',NULL,NULL),('MCG/DAY   ',NULL,NULL),('MCG/DOSE  ',NULL,NULL),('MCG/DROP  ',NULL,NULL),('MCG/GM    ',NULL,NULL),('MCG/HR    ',NULL,NULL),('MCG/INH   ',NULL,NULL),('MCG/ML    ',NULL,NULL),('MCG/ML-%  ',NULL,NULL),('MCG/ML-%-%',NULL,NULL),('MCG/SPRAY ',NULL,NULL),('MCG/SQCM  ',NULL,NULL),('MCG/STRAIN',NULL,NULL),('MCI/5ML   ',NULL,NULL),('MCI/ML    ',NULL,NULL),('MEQ       ',NULL,NULL),('MEQ-MMOL/L',NULL,NULL),('MEQ/100ML ',NULL,NULL),('MEQ/50ML  ',NULL,NULL),('MEQ/5ML   ',NULL,NULL),('MEQ/L     ',NULL,NULL),('MEQ/L-%   ',NULL,NULL),('MEQ/L-%-% ',NULL,NULL),('MEQ/ML    ',NULL,NULL),('MG        ',NULL,NULL),('MG & %    ',NULL,NULL),('MG &MG/5ML',NULL,NULL),('MG (15/15)',NULL,NULL),('MG (21)   ',NULL,NULL),('MG (21/5) ',NULL,NULL),('MG (35)   ',NULL,NULL),('MG (48)   ',NULL,NULL),('MG (51)   ',NULL,NULL),('MG (CA-P) ',NULL,NULL),('MG (DR)   ',NULL,NULL),('MG (LAX)  ',NULL,NULL),('MG (MCG)  ',NULL,NULL),('MG (Ped)  ',NULL,NULL),('MG PE/10ML',NULL,NULL),('MG PE/2ML ',NULL,NULL),('MG-%      ',NULL,NULL),('MG-% (9GM)',NULL,NULL),('MG-25 MCG ',NULL,NULL),('MG-35 MCG ',NULL,NULL),('MG-GM     ',NULL,NULL),('MG-GM-GM  ',NULL,NULL),('MG-MCG    ',NULL,NULL),('MG-MCG &MG',NULL,NULL),('MG-MCG(24)',NULL,NULL),('MG-MCG-MCG',NULL,NULL),('MG-MCG-MG ',NULL,NULL),('MG-MCG/5ML',NULL,NULL),('MG-MCG/ML ',NULL,NULL),('MG-MG-%   ',NULL,NULL),('MG-MG-%-% ',NULL,NULL),('MG-MG-MCG ',NULL,NULL),('MG-MG-UNIT',NULL,NULL),('MG-MIN/5ML',NULL,NULL),('MG-UNIT   ',NULL,NULL),('MG-UNIT-MG',NULL,NULL),('MG-UNIT/GM',NULL,NULL),('MG-UNIT/ML',NULL,NULL),('MG-UNT-MCG',NULL,NULL),('MG-UNT-UNT',NULL,NULL),('MG-UNT/5GM',NULL,NULL),('MG-UNT/5ML',NULL,NULL),('MG/0.05ML ',NULL,NULL),('MG/0.15ML ',NULL,NULL),('MG/0.1ML  ',NULL,NULL),('MG/0.25GM ',NULL,NULL),('MG/0.25ML ',NULL,NULL),('MG/0.2ML  ',NULL,NULL),('MG/0.35ML ',NULL,NULL),('MG/0.3ML  ',NULL,NULL),('MG/0.45ML ',NULL,NULL),('MG/0.4ML  ',NULL,NULL),('MG/0.55ML ',NULL,NULL),('MG/0.5GM  ',NULL,NULL),('MG/0.5ML  ',NULL,NULL),('MG/0.65ML ',NULL,NULL),('MG/0.67ML ',NULL,NULL),('MG/0.6ML  ',NULL,NULL),('MG/0.75ML ',NULL,NULL),('MG/0.7GM  ',NULL,NULL),('MG/0.7ML  ',NULL,NULL),('MG/0.82ML ',NULL,NULL),('MG/0.875ML',NULL,NULL),('MG/0.8ML  ',NULL,NULL),('MG/0.9ML  ',NULL,NULL),('MG/1.25ML ',NULL,NULL),('MG/1.2ML  ',NULL,NULL),('MG/1.315ML',NULL,NULL),('MG/1.3ML  ',NULL,NULL),('MG/1.5ML  ',NULL,NULL),('MG/1.6ML  ',NULL,NULL),('MG/1.74GM ',NULL,NULL),('MG/1.75ML ',NULL,NULL),('MG/1.7ML  ',NULL,NULL),('MG/10.15ML',NULL,NULL),('MG/100ML  ',NULL,NULL),('MG/100ML-%',NULL,NULL),('MG/10ML   ',NULL,NULL),('MG/10ML-% ',NULL,NULL),('MG/12.5ML ',NULL,NULL),('MG/125ML  ',NULL,NULL),('MG/125ML-%',NULL,NULL),('MG/14ML   ',NULL,NULL),('MG/150ML  ',NULL,NULL),('MG/150ML-%',NULL,NULL),('MG/15ML   ',NULL,NULL),('MG/16.7ML ',NULL,NULL),('MG/16ML   ',NULL,NULL),('MG/17.5ML ',NULL,NULL),('MG/17ML   ',NULL,NULL),('MG/18DROPS',NULL,NULL),('MG/18ML   ',NULL,NULL),('MG/2.4ML  ',NULL,NULL),('MG/2.5ML  ',NULL,NULL),('MG/2.625ML',NULL,NULL),('MG/20.3ML ',NULL,NULL),('MG/200ML  ',NULL,NULL),('MG/200ML-%',NULL,NULL),('MG/20ML   ',NULL,NULL),('MG/24HR   ',NULL,NULL),('MG/250ML  ',NULL,NULL),('MG/250ML-%',NULL,NULL),('MG/25ML   ',NULL,NULL),('MG/2GM    ',NULL,NULL),('MG/2ML    ',NULL,NULL),('MG/2ML-%  ',NULL,NULL),('MG/2ML-%-%',NULL,NULL),('MG/3.2ML  ',NULL,NULL),('MG/3.5GM  ',NULL,NULL),('MG/3.5ML  ',NULL,NULL),('MG/300ML  ',NULL,NULL),('MG/300ML-%',NULL,NULL),('MG/30ML   ',NULL,NULL),('MG/30ML-% ',NULL,NULL),('MG/31ML   ',NULL,NULL),('MG/3DAYS  ',NULL,NULL),('MG/3GM    ',NULL,NULL),('MG/3ML    ',NULL,NULL),('MG/3ML-%  ',NULL,NULL),('MG/40ML   ',NULL,NULL),('MG/45ML   ',NULL,NULL),('MG/4HR    ',NULL,NULL),('MG/4ML    ',NULL,NULL),('MG/5.26ML ',NULL,NULL),('MG/500ML  ',NULL,NULL),('MG/500ML-%',NULL,NULL),('MG/50ML   ',NULL,NULL),('MG/50ML-% ',NULL,NULL),('MG/5ML    ',NULL,NULL),('MG/5ML Aro',NULL,NULL),('MG/5ML-%  ',NULL,NULL),('MG/6.1GM  ',NULL,NULL),('MG/60ML   ',NULL,NULL),('MG/60ML-% ',NULL,NULL),('MG/6ML    ',NULL,NULL),('MG/7.5ML  ',NULL,NULL),('MG/75ML   ',NULL,NULL),('MG/7ML    ',NULL,NULL),('MG/8ML    ',NULL,NULL),('MG/9HR    ',NULL,NULL),('MG/9ML    ',NULL,NULL),('MG/ACT    ',NULL,NULL),('MG/BLISTER',NULL,NULL),('MG/DAY    ',NULL,NULL),('MG/DROP   ',NULL,NULL),('MG/GM     ',NULL,NULL),('MG/HR     ',NULL,NULL),('MG/ML     ',NULL,NULL),('MG/ML-%   ',NULL,NULL),('MG/ML-%-% ',NULL,NULL),('MG/ML-1%  ',NULL,NULL),('MG/NOSEPC ',NULL,NULL),('MG/SPRAY  ',NULL,NULL),('MG/VIAL   ',NULL,NULL),('MINIM     ',NULL,NULL),('ML        ',NULL,NULL),('MM        ',NULL,NULL),('MMOL/100ML',NULL,NULL),('MMOL/10ML ',NULL,NULL),('MMOL/15ML ',NULL,NULL),('MMOL/20ML ',NULL,NULL),('MMOL/250ML',NULL,NULL),('MMOL/ML   ',NULL,NULL),('MMOLE/15ML',NULL,NULL),('MMOLE/50ML',NULL,NULL),('MMOLE/5ML ',NULL,NULL),('MMOLE/ML  ',NULL,NULL),('MOL/L     ',NULL,NULL),('MOSM/L    ',NULL,NULL),('NANOGM/ML ',NULL,NULL),('PFU/0.5ML ',NULL,NULL),('PNU/ML    ',NULL,NULL),('Strong    ',NULL,NULL),('UNIT      ',NULL,NULL),('UNIT-MCG  ',NULL,NULL),('UNIT-MG   ',NULL,NULL),('UNIT-MG/GM',NULL,NULL),('UNIT-MG/ML',NULL,NULL),('UNIT/0.1ML',NULL,NULL),('UNIT/0.2ML',NULL,NULL),('UNIT/0.3ML',NULL,NULL),('UNIT/0.5ML',NULL,NULL),('UNIT/0.6ML',NULL,NULL),('UNIT/1.2ML',NULL,NULL),('UNIT/1.3ML',NULL,NULL),('UNIT/1.5ML',NULL,NULL),('UNIT/10ML ',NULL,NULL),('UNIT/13ML ',NULL,NULL),('UNIT/15ML ',NULL,NULL),('UNIT/2.2ML',NULL,NULL),('UNIT/29ML ',NULL,NULL),('UNIT/2ML  ',NULL,NULL),('UNIT/3.8ML',NULL,NULL),('UNIT/30GM ',NULL,NULL),('UNIT/30ML ',NULL,NULL),('UNIT/4.4ML',NULL,NULL),('UNIT/4ML  ',NULL,NULL),('UNIT/500ML',NULL,NULL),('UNIT/52ML ',NULL,NULL),('UNIT/5DROP',NULL,NULL),('UNIT/5ML  ',NULL,NULL),('UNIT/60GM ',NULL,NULL),('UNIT/ACT  ',NULL,NULL),('UNIT/DROP ',NULL,NULL),('UNIT/GM   ',NULL,NULL),('UNIT/GM-% ',NULL,NULL),('UNIT/MG   ',NULL,NULL),('UNIT/ML   ',NULL,NULL),('UNIT/ML-% ',NULL,NULL),('UNIT/SPRAY',NULL,NULL),('UNT/0.03ML',NULL,NULL),('UNT/0.25ML',NULL,NULL),('UNT/0.36ML',NULL,NULL),('UNT/0.5ML ',NULL,NULL),('UNT/0.65ML',NULL,NULL),('UNT/0.72ML',NULL,NULL),('UNT/0.75ML',NULL,NULL),('UNT/1.08ML',NULL,NULL),('UNT/L-%   ',NULL,NULL),('UT/0.028ML',NULL,NULL);
/*!40000 ALTER TABLE `unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `salutation` varchar(45) DEFAULT NULL,
  `notification_email_enabled` char(1) NOT NULL DEFAULT 'N',
  `notification_email_addresses` json DEFAULT NULL,
  `notification_sms_enabled` char(1) NOT NULL DEFAULT 'N',
  `notification_sms_phones` json DEFAULT NULL,
  `notification_call_enabled` char(1) NOT NULL DEFAULT 'N',
  `notification_call_phones` json DEFAULT NULL,
  `temperature_format` char(1) NOT NULL DEFAULT 'F',
  `is_admin` char(1) NOT NULL DEFAULT 'N',
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user__name__UNIQUE` (`name`),
  KEY `user__name__password__IDX` (`name`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sm.admin','1FDy52d6otqC4K','Admin','Admin','Mr','N',NULL,'N',NULL,'N',NULL,'F','Y','Y',NULL),(2,'leo.orellano','leo.password','Leonardo','Orellano','Mr','N',NULL,'N',NULL,'N',NULL,'F','Y','Y','2017-07-27 19:13:47'),(3,'max.polezhaev','max.password','Max','Polezhaev','Mr','N',NULL,'N',NULL,'N',NULL,'C','Y','Y','2017-07-27 19:13:47'),(4,'Dick.Hertz','Q!w2e3r4t5','Dick','Hertz','Mr','Y','[\"leonardo.orellano@sophicmedical.net\", \"\", \"\"]','N',NULL,'N',NULL,'F','N','Y','2020-10-13 17:39:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sophic_medical`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`user_after_insert` AFTER INSERT ON `user` FOR EACH ROW
BEGIN
/*  Name: user_after_insert
**  Date: 2017-02-18
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	INSERT INTO `user_history`(
	  `prev_id`,
	  `history_dt`,
	  `history_type`,
      `user`,
      `name`,
      `password`,
	  `first_name`,
      `last_name`,
      `salutation`,
      `notification_email_enabled`,
      `notification_email_addresses`,
      `notification_sms_enabled`,
      `notification_sms_phones`,
      `notification_call_enabled`,
      `notification_call_phones`,
      `temperature_format`,
      `is_admin`,
      `is_active`,
      `last_modified`
    )
    VALUES(
		NULL,
        now(),
        'CREATED',
        NEW.`id`,
        NEW.`name`,
        NEW.`password`,
        NEW.`first_name`,
        NEW.`last_name`,
        NEW.`salutation`,
        NEW.`notification_email_enabled`,
        NEW.`notification_email_addresses`,
        NEW.`notification_sms_enabled`,
        NEW.`notification_sms_phones`,
        NEW.`notification_call_enabled`,
        NEW.`notification_call_phones`,
        NEW.`temperature_format`,
        NEW.`is_admin`,
        NEW.`is_active`,
        NEW.`last_modified`
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sophic_medical`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`user_after_update` AFTER UPDATE ON `user` FOR EACH ROW
BEGIN
/*  Name: user_after_update
**  Date: 2017-02-18
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;
   
    SELECT id INTO `$prev_id` FROM `user_history` H 
		WHERE H.`user` = OLD.`id` ORDER BY H.`history_dt` DESC LIMIT 1; 
        
	INSERT INTO `user_history`(
	  `prev_id`,
	  `history_dt`,
	  `history_type`,
      `user`,
      `name`,
      `password`,
	  `first_name`,
      `last_name`,
      `salutation`,
      `notification_email_enabled`,
      `notification_email_addresses`,
      `notification_sms_enabled`,
      `notification_sms_phones`,
      `notification_call_enabled`,
      `notification_call_phones`,
      `temperature_format`,
      `is_admin`,
      `is_active`,
      `last_modified`
    )
    VALUES(
		`$prev_id`,
        now(),
        'UPDATED',
        NEW.`id`,
        NEW.`name`,
        NEW.`password`,
        NEW.`first_name`,
        NEW.`last_name`,
        NEW.`salutation`,
        NEW.`notification_email_enabled`,
        NEW.`notification_email_addresses`,
        NEW.`notification_sms_enabled`,
        NEW.`notification_sms_phones`,
        NEW.`notification_call_enabled`,
        NEW.`notification_call_phones`,
        NEW.`temperature_format`,
        NEW.`is_admin`,
        NEW.`is_active`,
        NEW.`last_modified`
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sophic_medical`@`localhost`*/ /*!50003 TRIGGER `sophic_medical`.`user_after_delete` AFTER DELETE ON `user` FOR EACH ROW
BEGIN
/*  Name: user_after_delete
**  Date: 2017-02-18
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


    DECLARE `$prev_id` BIGINT(20) DEFAULT NULL;

	SELECT `id` INTO `$prev_id` FROM `user_history` H 
		WHERE H.`user` = OLD.`id` ORDER BY H.`history_dt` DESC LIMIT 1;  
        
    INSERT INTO `user_history`(
	  `prev_id`,
	  `history_dt`,
	  `history_type`,
      `user`,
      `name`,
      `password`,
	  `first_name`,
      `last_name`,
      `salutation`,
      `notification_email_enabled`,
      `notification_email_addresses`,
      `notification_sms_enabled`,
      `notification_sms_phones`,
      `notification_call_enabled`,
      `notification_call_phones`,
      `temperature_format`,
      `is_admin`,
      `is_active`,
      `last_modified`
    )
    VALUES(
		`$prev_id`,
        now(),
        'DELETED',
        OLD.`id`,
        OLD.`name`,
        OLD.`password`,
        OLD.`first_name`,
        OLD.`last_name`,
        OLD.`salutation`,
        OLD.`notification_email_enabled`,
        OLD.`notification_email_addresses`,
        OLD.`notification_sms_enabled`,
        OLD.`notification_sms_phones`,
        OLD.`notification_call_enabled`,
        OLD.`notification_call_phones`,
        OLD.`temperature_format`,
        OLD.`is_admin`,
        OLD.`is_active`,
        OLD.`last_modified`
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user__household`
--

DROP TABLE IF EXISTS `user__household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__household` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `household` int(11) NOT NULL,
  `last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user__household__user__FK_IDX` (`user`),
  KEY `user__household__household__FK_IDX` (`household`),
  CONSTRAINT `user__household__household__FK` FOREIGN KEY (`household`) REFERENCES `household` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user__household__user__FK` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__household`
--

LOCK TABLES `user__household` WRITE;
/*!40000 ALTER TABLE `user__household` DISABLE KEYS */;
INSERT INTO `user__household` VALUES (1,2,1,'2017-07-26 19:14:12'),(2,2,2,'2017-07-27 19:14:12'),(3,3,1,'2017-07-27 19:14:12'),(4,4,3,'2020-10-13 17:40:00');
/*!40000 ALTER TABLE `user__household` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prev_id` bigint(20) DEFAULT NULL,
  `history_dt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'datetime when row has been created',
  `history_type` enum('CREATED','UPDATED','DELETED','ADDED_EXISTING') DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `salutation` varchar(45) DEFAULT NULL,
  `notification_email_enabled` char(1) DEFAULT NULL,
  `notification_email_addresses` json DEFAULT NULL,
  `notification_sms_enabled` char(1) DEFAULT NULL,
  `notification_sms_phones` json DEFAULT NULL,
  `notification_call_enabled` char(1) DEFAULT NULL,
  `notification_call_phones` json DEFAULT NULL,
  `temperature_format` char(1) DEFAULT NULL,
  `is_admin` char(1) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
INSERT INTO `user_history` VALUES (1,NULL,'2018-01-25 19:44:18','CREATED',2,'leo.orellano','leo.password','Leonardo','Orellano','Mr','N',NULL,'N',NULL,'N',NULL,'F','Y','Y','2017-07-27 19:13:47'),(2,NULL,'2018-01-25 19:44:18','CREATED',3,'max.polezhaev','max.password','Max','Polezhaev','Mr','N',NULL,'N',NULL,'N',NULL,'C','Y','Y','2017-07-27 19:13:47'),(3,NULL,'2020-10-13 17:39:21','CREATED',4,'Dick.Hertz','Q!w2e3r4t5','Dick','Hertz','Mr','Y','[\"leonardo.orellano@sophicmedical.net\", \"\", \"\"]','N',NULL,'N',NULL,'F','N','Y','2020-10-13 17:39:21');
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sophic_medical'
--
/*!50003 DROP FUNCTION IF EXISTS `addrel_schedule__transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` FUNCTION `addrel_schedule__transaction`(
/*  Name:  addrel_schedule__transaction
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


	schedule_id BIGINT(18),
	transaction_id BIGINT(18)
) RETURNS bigint(18)
BEGIN
	DECLARE schedule__transaction_id BIGINT(18);
    SET schedule__transaction_id = NULL;
	INSERT INTO `sophic_medical`.`schedule__transaction`
		(`schedule`,
		`transaction`,
		`last_modified`)
		VALUES(schedule_id,
		transaction_id,
		NOW());
        
   		SELECT last_insert_id() INTO schedule__transaction_id;
        RETURN schedule__transaction_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `add_transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` FUNCTION `add_transaction`(
/*  Name:  add_transaction
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	trans_datetime DATETIME 
) RETURNS bigint(18)
BEGIN
	DECLARE transaction_id BIGINT(18) DEFAULT NULL;

	INSERT INTO `sophic_medical`.`transaction`
		(`transaction_status`,
		`recognition_status`,
		`scheduled_datetime`,
		`execute_datetime`,
		`executed_datetime`,
		`last_modified`)
	VALUES
		('SCHD',
		NULL,
		trans_datetime, 
		NULL,  
		NULL,  
		NOW());

		SELECT last_insert_id() INTO transaction_id;
        
        RETURN transaction_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `find_not_loaded_transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find_not_loaded_transaction`(
/*  Name:  find_not_loaded_transaction
**  Date: 2016-11-05
**  Notes: Returns one (first) transaction for given patient_id, device_id and trans_datetime
**    meeting the following conditions:
**    - SCHEDULED status 
**    - no loaded bin in related schedule__transaction
**    - related prescription is not discontinued
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	patient_id INT(11), 
    device_id INT(11),
    trans_datetime DATETIME
) RETURNS bigint(18)
BEGIN
	DECLARE transaction_id BIGINT(18) DEFAULT NULL;
	
	SELECT T.id INTO transaction_id 
	FROM `prescription` P
	INNER JOIN `schedule` S ON P.id = S.prescription
	INNER JOIN `schedule__transaction` ST ON S.id = ST.schedule
	INNER JOIN `transaction` T ON ST.transaction = T.id
	WHERE T.scheduled_datetime = trans_datetime  
	AND S.device = device_id 
    AND P.patient = patient_id
    AND T.transaction_status = "SCHD"
    AND ST.bin IS NULL
    AND P.is_discontinued = "N"
	LIMIT 1;

	RETURN transaction_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `find_patient_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` FUNCTION `find_patient_id`(
/*  Name:  find_patient_id
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


	prescription_id BIGINT(18)
) RETURNS int(11)
BEGIN
	DECLARE patient_id INT(11) DEFAULT NULL;

	SELECT P.patient INTO patient_id
	FROM sophic_medical.prescription P
	WHERE P.id = prescription_id;
    
    RETURN patient_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `find_transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find_transaction`(
/*  Name:  find_transaction
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	patient_id INT(11), 
    device_id INT(11),
    trans_datetime DATETIME
) RETURNS bigint(18)
BEGIN
	DECLARE transaction_id BIGINT(18) DEFAULT NULL;
	
	SELECT T.id INTO transaction_id 
	FROM prescription P
			INNER JOIN
		 `schedule` S ON P.id = S.prescription
			INNER JOIN
		 schedule__transaction ST ON S.id = ST.schedule
			INNER JOIN
		 transaction T ON ST.transaction = T.id
	WHERE T.scheduled_datetime = trans_datetime  
		AND S.device = device_id AND P.patient = patient_id
	LIMIT 1;

	RETURN transaction_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_area_hist_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_area_hist_id`(
	`$area_id` int(11)
) RETURNS bigint(20)
BEGIN
/*  Name: get_area_hist_id
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$area_hist` BIGINT(20) DEFAULT NULL;
    DECLARE `$household_id` INT(11) DEFAULT NULL;
    DECLARE `$household_hist` BIGINT(20) DEFAULT NULL;

	-- select last history row 
	SELECT id INTO `$area_hist` FROM `area_history` A WHERE A.area = `$area_id`
		ORDER BY `history_dt` DESC LIMIT 1;
    
--     DELETE FROM log;
--     INSERT INTO log values(now(), `$area_hist`);   
	
    IF `$area_hist` IS NULL THEN
    -- insert new row to area_history
		SELECT A.household INTO `$household_id` FROM area A WHERE A.id = `$area_id`;
        
        SET `$household_hist` = get_household_hist_id(`$household_id`);
                
        INSERT INTO `area_history`(
		  `prev_id`,
		  `history_dt`,
		  `history_type`,
		  `area`,
		  `name`,
		  `household_hist`,
          `is_active`,
		  `last_modified`
		)
		SELECT 
			NULL, 
			now(), 
			'ADDED_EXISTING', 
			id, 
			name, 
			`$household_hist`, 
            `is_active`,
			last_modified
		FROM area
        WHERE id = `$area_id`;
        
        SET `$area_hist` = LAST_INSERT_ID();
    END IF;
    
	RETURN `$area_hist`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_cartridge_hist_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_cartridge_hist_id`(
	`$cartridge_code` VARCHAR(16) 
) RETURNS bigint(20)
BEGIN
/*  Name: get_cartridge_hist_id
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$cartridge_hist` BIGINT(20) DEFAULT NULL;
    DECLARE `$device_id` INT(11) DEFAULT NULL;
    DECLARE `$device_hist` BIGINT(20) DEFAULT NULL;

	IF `$cartridge_code` IS NULL THEN
		RETURN NULL;
    END IF;
    
	-- select last history row 
	SELECT id INTO `$cartridge_hist` FROM `cartridge_history` C WHERE C.cartridge = `$cartridge_code`
		ORDER BY `history_dt` DESC LIMIT 1;
    
--     DELETE FROM log;
--     INSERT INTO log values(now(), `$area_hist`);   
	
    IF `$cartridge_hist` IS NULL THEN
    -- insert new row to cartridge_history
		SELECT C.loaded_to_device INTO `$device_id` FROM cartridge C WHERE C.code = `$cartridge_code`;
        
        SET `$device_hist` = get_device_hist_id(`$device_id`);

	INSERT INTO `cartridge_history`(
		`prev_id`,
		`history_dt`,
		`history_type`,
		`cartridge`,
		`loaded_datetime`,
		`loaded_to_device_hist`
        )
		SELECT
			NULL,
			now(),
            'ADDED_EXISTING',
			`$cartridge_code`,
            `loaded_datetime`,
            `$device_hist`
        FROM cartridge C
        WHERE C.code = `$cartridge_code`;
 
		SET `$cartridge_hist` = LAST_INSERT_ID();
    END IF;
    
	RETURN `$cartridge_hist`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_device_hist_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_device_hist_id`(
	`$device_id` int(11) 
) RETURNS bigint(20)
BEGIN
/*  Name: get_device_hist_id
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$device_hist` BIGINT(20) DEFAULT NULL;
    DECLARE `$area_id` INT(11) DEFAULT NULL;
    DECLARE `$area_hist` BIGINT(20) DEFAULT NULL;

	IF `$device_id` IS NULL THEN
		RETURN NULL;
    END IF;
    
	-- select last history row 
	SELECT id INTO `$device_hist` FROM `device_history` D WHERE D.device = `$device_id`
		ORDER BY `history_dt` DESC LIMIT 1;
    
--     DELETE FROM log;
--     INSERT INTO log values(now(), `$area_hist`);   
	
    IF `$device_hist` IS NULL THEN
    -- insert new row to device_history
		SELECT D.area INTO `$area_id` FROM device D WHERE D.id = `$device_id`;
        
        SET `$area_hist` = get_area_hist_id(`$area_id`);

		INSERT INTO `device_history`(
			  `prev_id`, 
			  `history_dt`, 
			  `history_type`,
			  `device`,
			  `area_hist`,
			  `position`,
              `modem_number`,
              `modem_imei`,
              `modem_status`,
              `modem_offline_timeout`,
			  `modem_behavior`,
              `wifi_enabled`,
		      `wifi_ssid`,
              `wifi_key`,
              `is_active`,
			  `last_modified`
		)
		SELECT
		  NULL, 
		  now(), 
		  'ADDED_EXISTING',
		  `id`,
		  `$area_hist`,
		  `position`,
          `modem_number`,
          `modem_imei`,
          `modem_status`,
          `modem_offline_timeout`,
		  `modem_behavior`,
          `wifi_enabled`,
          `wifi_ssid`,
          `wifi_key`,
          `is_active`,
		  `last_modified`
		FROM `device`
		WHERE `id` = `$device_id`;
                
		SET `$device_hist` = LAST_INSERT_ID();
    END IF;
    
	RETURN `$device_hist`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_household_hist_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_household_hist_id`(
	`$household_id` int(11)
) RETURNS bigint(20)
BEGIN
/*  Name: get_household_hist_id
**  Date: 2017-02-02
**  Notes: track history of table changes 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	DECLARE `$household_hist` BIGINT(20) DEFAULT NULL;

	-- select last history row 
	SELECT id INTO `$household_hist` FROM `household_history` H WHERE H.household = `$household_id`
		ORDER BY `history_dt` DESC LIMIT 1;
	
    IF `$household_hist` IS NULL THEN
    -- insert new row to household_history
		INSERT INTO `household_history`(
			  `prev_id`,
			  `history_dt`,
			  `household`,
			  `history_type`,
			  `address`,
			  `description`,
              `is_active`,
			  `last_modified`
        )
		SELECT NULL,
			now(),
            `id`,
            'ADDED_EXISTING',
            `address`,
			`description`,
            `is_active`,
			`last_modified`
        FROM `household`
        WHERE `id` = `$household_id`;
        
        SET `$household_hist` = LAST_INSERT_ID();
    END IF;
    
	RETURN `$household_hist`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `prepare_fulltext_pattern` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` FUNCTION `prepare_fulltext_pattern`(
/*  Name:  prepare_fulltext_pattern
**  Date: 2017-08-16
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


	in_str TEXT
) RETURNS text CHARSET utf8
BEGIN
	
    DECLARE ret_str LONGTEXT DEFAULT "";
    DECLARE temp_str LONGTEXT DEFAULT "";
    DECLARE a_word LONGTEXT DEFAULT "";
    DECLARE word_length INT DEFAULT 0;
    DECLARE short_length INT DEFAULT 0;
    
    SELECT variable_value INTO short_length
	FROM performance_schema.global_variables
	WHERE variable_name = 'innodb_ft_min_token_size';

    SET temp_str = TRIM(in_str);
    WHILE (LENGTH(temp_str) > 0) DO
        SET a_word = SUBSTRING_INDEX(temp_str, " ", 1);
        SET word_length = LENGTH(a_word);
        IF (word_length > short_length) THEN
            SET ret_str = CONCAT(ret_str, " ", a_word);
        END IF;
        SET temp_str = TRIM(SUBSTRING(temp_str, word_length + 1));
    END WHILE;

    RETURN CONCAT('+', REPLACE(TRIM(ret_str), ' ', ' +'), '*');
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_prescription_discontinuation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `cancel_prescription_discontinuation`(
/*  Name:  cancel_prescription_discontinuation
**  Created: 2017-08-04
**   
**  Notes: set prescription.is_discontinued to N by prescription id and sync with  all devices which have schedules for that prescription
**
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `prescription_id` BIGINT(18)
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';
	DECLARE `$done` INT DEFAULT FALSE;
	DECLARE `$device_id` INT(11);
	DECLARE `$task_id` BIGINT(18) DEFAULT 0;
	DECLARE `$task_id_lst` TEXT DEFAULT '';
	DECLARE `$comma` CHAR(1) DEFAULT '';

	DECLARE `$cur` CURSOR FOR
		SELECT DISTINCT device FROM schedule S WHERE prescription = `prescription_id`;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$done` = TRUE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;


 	START TRANSACTION;

		IF NOT EXISTS(SELECT * FROM `sophic_medical`.`prescription` WHERE `id` = `prescription_id`) THEN
			SET `$msg` = CONCAT('Prescription with id = ', `prescription_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
		END IF;
		
		UPDATE `sophic_medical`.`prescription`
			SET `is_discontinued` = 'N'
		WHERE `id` = `prescription_id`;
	
		
        OPEN `$cur`;
		read_loop: LOOP
			FETCH `$cur` INTO `$device_id`; 
			IF `$done` THEN
				LEAVE read_loop;
			END IF;
            BEGIN
				SET `$task_id` = 0;
				CALL create_sync_task_wt(`$device_id`, `$task_id`);
                SET `$task_id_lst` = concat(`$task_id_lst`, `$comma`, `$task_id`);
                SET `$comma` = ', ';
                -- SELECT `$device_id`, `$task_id`;
            END;
		END LOOP;
		CLOSE `$cur`;
    
		SELECT `$task_id_lst` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_schedule_discontinuation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `cancel_schedule_discontinuation`(
/*  Name:  cancel_schedule_discontinuation
**  Created: 2017-08-04
**   
**  Notes: set schedule.is_discontinued to N by schedule id and sync with device
**  Changes:  
**
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `schedule_id` BIGINT(18)
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';
	DECLARE `$device_id` INT(11);
	DECLARE `$task_id` BIGINT(18) DEFAULT 0;
	
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;


 	START TRANSACTION;

		IF NOT EXISTS(SELECT * FROM `sophic_medical`.`schedule` WHERE `id` = `schedule_id`) THEN
			SET `$msg` = CONCAT('Schedule with id = ', `schedule_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
		END IF;
		
		UPDATE `sophic_medical`.`schedule`
			SET `is_discontinued` = 'N'
		WHERE `id` = `schedule_id`;
        
        SELECT `device` FROM `schedule` WHERE `id` = `schedule_id` INTO `$device_id`;
		CALL create_sync_task_wt(`$device_id`, `$task_id`);
    
		SELECT `$task_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
        
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_load_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `clear_load_data`(
/*  Name:  clear_load_data
**  Date: 2017-11-01
**  Notes: 
**    Clears all data related to bin loading for the specified transaction_id
**    (sets null to all loaded_* columns for bins which are loaded for the specified transaction_id).
**    Raises MySQL error when a transaction with the given transaction_id doesn't exist in the database.
**
**  Example of calling:  
**  CALL sophic_medical.clear_load_data(123);    
**  CALL sophic_medical.clear_load_data(-3);  # error: no transaction with id = -3
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	`$transaction_id` BIGINT(18)
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

	IF NOT EXISTS(SELECT T.* FROM `transaction` T WHERE T.id = `$transaction_id`) THEN
        SET `$msg` = CONCAT('There is no transaction with id = ', `$transaction_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
 	END IF;		
    
    UPDATE `bin` B
        JOIN `schedule__transaction` ST ON ST.`bin` = B.`code`
		SET `loaded_datetime` = NULL,
			`loaded_to_slot` = NULL,
			`loaded_to_cartridge` = NULL
		WHERE ST.`transaction` = `$transaction_id`;

	SELECT `$transaction_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_scan_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `clear_scan_data`(
/*  Name:  clear_scan_data
**  Date: 2017-11-01
**  Notes: 
**    Clears all data related to bin scanning for the specified transaction_id
**    (sets null to all scanned_* columns for bins which are loaded for the specified transaction_id).
**    Raises MySQL error when a transaction with the given transaction_id doesn't exist in the database.
**
**  Example of calling:  
**  CALL sophic_medical.clear_scan_data(123);    
**  CALL sophic_medical.clear_scan_data(-3);  # error: no transaction with id = -3
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	`$transaction_id` BIGINT(18)
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

	IF NOT EXISTS(SELECT T.* FROM `transaction` T WHERE T.id = `$transaction_id`) THEN
        SET `$msg` = CONCAT('There is no transaction with id = ', `$transaction_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
 	END IF;		
    
    UPDATE `bin` B
        JOIN `schedule__transaction` ST ON ST.`bin` = B.`code`
		SET `scanned_datetime` = NULL,
			`scanned_in_slot` = NULL,
			`scanned_in_cartridge_num` = NULL,
            `scanned_in_device` = NULL
		WHERE ST.`transaction` = `$transaction_id`;

	SELECT `$transaction_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `complete_all_modem_online_tasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `complete_all_modem_online_tasks`(
/*  Name:  complete_all_modem_online_tasks
**  Last Update Date: 2017-04-24
**  Notes: sets 'Y' status to all tasks in 'S' or 'P' statuses for the specified device
**
** Examples of use:  
** CALL `sophic_medical`.`complete_all_modem_online_tasks`(1); 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$device_id` INT(11)
)
BEGIN
    DECLARE device_id INT(11);
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;

		-- check device id 
		SET device_id = NULL;
		SELECT id INTO device_id FROM `device` D 
			WHERE D.`id` = `$device_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find specified device id ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
        
        -- update tasks
        UPDATE `sophic_medical`.`task`
			SET `execute_status` = 'Y'
			WHERE (`execute_status` = 'S' or `execute_status` = 'P')
				AND `task_type` = 'ONLINE'
				AND `device` = `$device_id`;

		SELECT NULL AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `copy_physician_from_npi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `copy_physician_from_npi`(
/*  Name:  copy_physician_from_npi
**  Date: 2017-08-16
**  Notes: copy physician specified by the NPI number from NPI database to physician table
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$npi_number` INT(11)
)
BEGIN
    
    INSERT INTO `sophic_medical`.`physician` (
		`prefix`, 
        `first_name`, 
        `middle_name`, 
        `last_name`, 
        `suffix`, 
        `address`, 
        `phone`, 
        `npi_number`
	)
	SELECT `prefix`, 
		`first_name`, 
        `middle_name`, 
        `last_name`, 
        `suffix`, 
        CONCAT_WS(
			', ',
			IF(LENGTH(`address_1`), `address_1`, NULL),
			IF(LENGTH(`address_2`), `address_2`, NULL),
			IF(LENGTH(`city`), `city`, NULL),
			IF(LENGTH(`state`), `state`, NULL)
		) AS `address`,
        `phone`, 
        `npi`
	FROM `npi`.`npi`
	WHERE `npi` = `$npi_number`;
    
    SELECT last_insert_id() AS `physician_id`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_bypass_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_bypass_task`(
/*  Name:  create_bypass_task
**  Date: 2016-11-14
**  Notes: creates bypass task and sends JSON object to device related with the transaction
**  JSON object has following structure: 
**  {"api": 1, "task_type": "BYPASS", "task_id": 100, "task_parameters": 
**			{"transaction_id": 200}}');
**  api - version of the api
**	task_id - identifier of the new task from tables task
**  transaction_id - identifier of the transaction passed as parameter
**
**  Raises an error if there are not completed bypas tasks for the transaction 
**
** Examples of use:  
** CALL `sophic_medical`.`create_bypass_task`(10); 
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
    IN transaction_id_par BIGINT(18)
)
BEGIN
	DECLARE `$execute_status` CHAR(1) DEFAULT NULL;
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE trans_exists BOOLEAN;

    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
 	START TRANSACTION;
		-- checking if transaction_id is in transaction table
		SET trans_exists = EXISTS(SELECT * FROM sophic_medical.transaction WHERE id = transaction_id_par);
		IF trans_exists = FALSE THEN
			SET msg = CONCAT('Transaction with id = ', transaction_id_par, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		-- get device id from schedule table	
		SET device_id = NULL;
		SELECT DISTINCT device INTO device_id FROM `schedule__transaction` ST 
					INNER JOIN `schedule` S ON ST.`schedule` = S.id
			WHERE ST.`transaction` = transaction_id_par;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find device id for transaction with id = ', transaction_id_par);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `transaction` = transaction_id_par 
				AND T.task_type = 'BYPASS'
				AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed BYPASS task exists for transaction.id = ', transaction_id_par);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
        INSERT INTO `sophic_medical`.`task`
			(`task_type`, `transaction`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('BYPASS', transaction_id_par, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "BYPASS", "task_id":', CAST(task_id AS CHAR), 
			', "task_parameters": {"transaction_id": ', CAST(transaction_id_par AS CHAR), '}}');

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_dispense_prn_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_dispense_prn_task`(
/*  Name:  create_dispense_prn_task
**  Date: 2016-11-14
**  Notes: create dispense prn task
**  and send JSON object to device related with the transaction
**  JSON object has following structure: 
**  {"api": 1, "task_id": Number, "task_type": "DSPPRN", "task_parameters": {"transaction_id": Number}}
**
**  Raises an error if there exists not completed dispense prn tasks for the transaction 
**
** Examples of use:  
** CALL `sophic_medical`.`create_dispense_prn_task`(<id of the prn transaction>); 
**
** Next select returns id of the all prn transaction
**  SELECT T.id, frequency FROM `sophic_medical`.`transaction` T 
**	INNER JOIN `sophic_medical`.`schedule__transaction` ST
**		ON T.id = ST.transaction
**	INNER JOIN `sophic_medical`.`schedule` S
**		ON S.`id` = ST.`schedule`
**	INNER JOIN `sophic_medical`.`prescription` P
**		ON P.`id` = S.`prescription`
**	WHERE frequency = 'PRN'



**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
    IN `$transaction_id` BIGINT(18)
)
BEGIN
	DECLARE `$execute_status` CHAR(1) DEFAULT NULL;
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE trans_is_prn BOOLEAN;

    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
 	START TRANSACTION;
		-- checking if transaction_id is in transaction table

		SET trans_is_prn = EXISTS(
			SELECT T.id, frequency FROM `sophic_medical`.`transaction` T 
				INNER JOIN `sophic_medical`.`schedule__transaction` ST
					ON T.id = ST.transaction
				INNER JOIN `sophic_medical`.`schedule` S
					ON S.`id` = ST.`schedule`
				INNER JOIN `sophic_medical`.`prescription` P
					ON P.`id` = S.`prescription`
				WHERE frequency = 'PRN' AND T.`id` = `$transaction_id`
		);
       
		IF trans_is_prn = FALSE THEN
			SET msg = CONCAT('Transaction with id = ', `$transaction_id`, ' does not exist or is not PRN');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
 
		-- get device id from schedule table	
		SET device_id = NULL;
		SELECT DISTINCT device INTO device_id FROM `schedule__transaction` ST 
					INNER JOIN `schedule` S ON ST.`schedule` = S.id
			WHERE ST.`transaction` = `$transaction_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find device id for transaction with id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT * 
			FROM `task` T 
            WHERE `transaction` = `$transaction_id` 
				AND T.task_type = 'DSPPRN'
                AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed DSPPRN task exists for transaction.id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
        INSERT INTO `sophic_medical`.`task`
			(`task_type`, `transaction`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('DSPPRN', `$transaction_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "DSPPRN", "task_id":', CAST(task_id AS CHAR), 
			', "task_parameters": {"transaction_id": ', CAST(`$transaction_id` AS CHAR), '}}');

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_early_dispense_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_early_dispense_task`(
/*  Name:  create_early_dispense_task
**  Date: 2016-11-14
**  Notes: creates new early dispense for specified transaction  
**  and send JSON object to device related with the transaction
**  JSON object has following structure: 
**  {"api": 1, "task_id": Number, "task_type": "EARLYDSP", "task_parameters": {"transaction_id": Number}}
**  api - version of the api
**	task_id - identifier of the new task from tables task
**  transaction_id - identifier of the transaction passed as parameter
**
** Examples of use:  
** CALL `sophic_medical`.`create_early_dispense_task`(10); 
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$transaction_id` BIGINT(18)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE trans_exists BOOLEAN;
    
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
 	START TRANSACTION;
		-- checking if transaction_id is in transaction table
		SET trans_exists = EXISTS(SELECT * FROM sophic_medical.transaction WHERE id = `$transaction_id`);
		IF trans_exists = FALSE THEN
			SET msg = CONCAT('Transaction with id = ', `$transaction_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		-- get device id from schedule table	
		SET device_id = NULL;
		SELECT DISTINCT device INTO device_id FROM `schedule__transaction` ST 
					INNER JOIN `schedule` S ON ST.`schedule` = S.id
			WHERE ST.`transaction` = `$transaction_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find device id for transaction with id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT * 
			FROM `task` T 
            WHERE `transaction` = `$transaction_id` 
				AND T.task_type = 'EARLYDSP'
                AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed EARLYDSP task exists for transaction.id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
        INSERT INTO `sophic_medical`.`task`
			(`task_type`, `transaction`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('EARLYDSP', `$transaction_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

        SET json_data = concat('{"api": 1, "task_type": "EARLYDSP", "task_id":', CAST(task_id AS CHAR), 
			', "task_parameters": {"transaction_id": ', CAST(`$transaction_id` AS CHAR), '}}');

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_modem_offline_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_modem_offline_task`(
/*  Name:  create_modem_offline_task
**  Last Update Date: 2017-02-25
**  Notes: creates a new task for the specified device to turn its modem off
**  and sends a JSON object to the device.
**  The JSON object has following structure: 
**  {"api": 1, "task_id": Number, "task_type": "OFFLINE"}
**  api - version of the api
**	task_id - identifier of the new task from tables task
**
** Examples of use:  
** CALL `sophic_medical`.`create_modem_offline_task`(1); 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$device_id` INT(11)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;

		-- check device id 
		SET device_id = NULL;
		SELECT id INTO device_id FROM `device` D 
			WHERE D.`id` = `$device_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find specified device id ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `device` = `$device_id` 
				AND T.task_type = 'OFFLINE'
				AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed OFFLINE task exists for device_id = ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `device`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('OFFLINE', `$device_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "OFFLINE", "task_id":', CAST(task_id AS CHAR), '}');
        -- SELECT json_data;    

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
        
        -- UPDATE `sophic_medical`.`task` SET execute_status = 'Y' WHERE id = task_id;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_modem_online_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_modem_online_task`(
/*  Name:  create_modem_online_task
**  Last Update Date: 2017-04-24
**  Notes: creates a new task for the specified device to turn its modem on.
**  This procedure doesn't send JSON to the device, it just creates a task in the database; an SMS is sent externally in order to turn the modem on.
**
** Examples of use:  
** CALL `sophic_medical`.`create_modem_online_task`(1); 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$device_id` INT(11)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;

		-- check device id 
		SET device_id = NULL;
		SELECT id INTO device_id FROM `device` D 
			WHERE D.`id` = `$device_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find specified device id ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `device`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('ONLINE', `$device_id`, 'S', NULL, NOW());
		SELECT last_insert_id() INTO task_id;

		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_scan_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_scan_task`(
/*  Name:  create_scan_task
**  Last Update Date: 2017-11-01
**  Notes: creates a new task for the specified device to scan all bins
**  and sends a JSON object to the device.
**  The JSON object has following structure: 
**  {"api": 1, "task_id": Number, "task_type": "SCAN"}
**  api - version of the api
**	task_id - identifier of the new task from tables task
**
** Examples of use:  
** CALL `sophic_medical`.`create_scan_task`(1); 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$device_id` INT(11)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;

		-- check device id 
		SET device_id = NULL;
		SELECT id INTO device_id FROM `device` D 
			WHERE D.`id` = `$device_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find specified device id ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `device` = `$device_id` 
				AND T.task_type = 'SCAN'
				AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed OFFLINE task exists for device_id = ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `device`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('SCAN', `$device_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "SCAN", "task_id":', CAST(task_id AS CHAR), '}');
        -- SELECT json_data;    

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
        
        -- UPDATE `sophic_medical`.`task` SET execute_status = 'Y' WHERE id = task_id;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_schedule`(
    IN prescription_id BIGINT(18),
	IN device_id INT(11),
    IN start_datetime DATETIME,
    IN stop_datetime DATETIME,  -- it is not used for frequency type ONCE
    IN override_times VARCHAR(200) -- string with comma delimeted time '10:20,11:50,4:8'. 
															-- For frequency type ONCE it must contain exactly one time 
)
BEGIN
    DECLARE start_date DATE;
    DECLARE stop_date DATE;
	DECLARE default_times_cnt INT DEFAULT 0;
    DECLARE times_cnt INT DEFAULT 0;
	DECLARE schedule_id BIGINT(18);
    DECLARE transaction_id BIGINT(18);
	DECLARE schedule__transaction_id BIGINT(18); 
	DECLARE time_ary VARCHAR(200);
	DECLARE cur_date DATE;
    DECLARE trans_time VARCHAR(8);
    DECLARE trans_datetime DATETIME;

	DECLARE frequency_type VARCHAR(30);
	DECLARE frequency_id VARCHAR(10);
	DECLARE patient_id INT(11);

	DECLARE `$task_id` BIGINT(18) DEFAULT NULL;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

-- 	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
-- 	BEGIN
-- 		GET DIAGNOSTICS CONDITION 1 
-- 			@p1 = RETURNED_SQLSTATE,
-- 			@p2 = MESSAGE_TEXT;
-- 		SELECT 0 AS 'id', @p1 as err_code, @p2 as 'msg';
-- 		ROLLBACK;
-- 	END;

    -- convert DATETIME arguments to DATE
    SET start_date = DATE(start_datetime);
    SET stop_date = DATE(stop_datetime);

 	START TRANSACTION;
		-- for debuging
		-- TRUNCATE log;
        -- create new schedule
        INSERT INTO `sophic_medical`.`schedule`
			(`prescription`, `start_date`, `stop_date`, `device`, `last_modified`) 
			VALUES (prescription_id, start_date, stop_date, device_id, NOW());
		SELECT last_insert_id() INTO schedule_id;
        -- search frequency_type 
        SELECT F.`code`, F.frequency_type INTO frequency_id, frequency_type
			FROM `sophic_medical`.`prescription` P
				INNER JOIN `sophic_medical`.`frequency` F
				ON P.frequency = F.code
		WHERE P.id = prescription_id;
            
		-- if override_times is empty then load default time from time table into string
		IF override_times IS NULL OR LENGTH(override_times) = 0 THEN
			-- build array string of time values
			SELECT GROUP_CONCAT(CAST(T.time AS CHAR)) INTO override_times  
			FROM sophic_medical.prescription P
				INNER JOIN sophic_medical.frequency F ON P.frequency = F.code 
				INNER JOIN sophic_medical.time T ON F.code = T.frequency  
			WHERE P.id = prescription_id;
            
		ELSE
			IF frequency_type = 'ONCE' THEN
				IF LOCATE(',', override_times) > 0 THEN
					SET msg = 'There is more than one time for the frequency type ONCE';	
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
                END IF;
            ELSE -- check override_times must contain exactly the same number of items as time table 	
				SELECT COUNT(*) INTO default_times_cnt  
				FROM sophic_medical.prescription P
					INNER JOIN sophic_medical.frequency F ON P.frequency = F.`code` -- F.frequency 
					INNER JOIN sophic_medical.time T ON F.code = T.frequency  
				WHERE P.id = prescription_id;

				-- calc how many there are ',' in 
				SET times_cnt = length(override_times) - length(replace(override_times, ',', '')) + 1;
				
				IF times_cnt - default_times_cnt != 0 THEN
					SET msg = CONCAT('Wrong items count in parameter override_times: '
						, override_times, '. Must be ', default_times_cnt);	
					SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
				END IF;
			END IF;
        
        END IF;
        -- SELECT 2;
--         -- search frequency_type 
--         SELECT F.`code`, F.frequency_type INTO frequency_id, frequency_type
-- 			FROM `sophic_medical`.`prescription` P
-- 				INNER JOIN `sophic_medical`.`frequency` F
-- 				ON P.frequency = F.code
-- 		WHERE P.id = prescription_id;
--         

		IF frequency_type = 'ONCE' THEN  
			-- must have exactly one time in override_times array
            IF override_times IS NULL OR LENGTH(override_times) = 0 THEN
				SET msg = CONCAT('There is no time for the frequency ', frequency_id);	
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
			ELSEIF LOCATE(',', override_times) > 0 THEN -- there are more than one time 
				SET msg = 'There is more than one time for the frequency type ONCE';	
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
            END IF;
			-- set transaction datetime on the start_date
            SET trans_datetime = ADDTIME(start_date, override_times); -- override_times contains one time
            -- check if the transaction datetime is before the start_datetime
            IF trans_datetime < start_datetime THEN
				-- then move it on the next day
				SET trans_datetime = DATE_ADD(trans_datetime, INTERVAL 1 DAY);
			END IF;
            -- now check if the transaction datetime is before the stop_datetime
            IF trans_datetime <= stop_datetime THEN
				-- then it's ok, create a transaction
				SET transaction_id = add_transaction(trans_datetime);
				SET schedule__transaction_id = addrel_schedule__transaction(schedule_id, transaction_id);
			END IF;
        ELSE -- USE_DAYS_TO_SKIP.... 
        -- TODO: use appropriate logic for transaction generation dependong on frequency type
			-- if there is no time was found then throw exception
			IF override_times IS NULL OR LENGTH(override_times) = 0 THEN
				SET msg = CONCAT('There is no time for the frequency ', frequency_id);	
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
			END IF;

			-- loop by days
			SET cur_date = start_date;
			WHILE cur_date <= stop_date DO
				SET time_ary = CONCAT(override_times, ',');
				-- loop by time values
				times_loop: WHILE (LOCATE(',', time_ary) > 0) DO
					SET trans_time = SUBSTRING(time_ary, 1, LOCATE(',', time_ary) - 1);
					SET time_ary = SUBSTRING(time_ary, LOCATE(',', time_ary) + 1);
                    SET trans_datetime = ADDTIME(cur_date, trans_time);
                    
                    -- check if the transaction datetime is out of the start_datetime/stop_datetime period,
                    -- it will usually happen on the first and last dates,
                    IF trans_datetime < start_datetime OR trans_datetime > stop_datetime THEN
                        ITERATE times_loop;
                    END IF;

					-- check if at leas one transaction for the same patient and time exists
					-- for debuging
					-- INSERT INTO LOG(val) VALUES(ADDTIME(cur_date, trans_time));
					-- INSERT INTO LOG(val) VALUES(prescription_id);
					SET patient_id = find_patient_id(prescription_id);
                    
					SET transaction_id = find_not_loaded_transaction(patient_id, device_id, trans_datetime);
					
                    -- SELECT prescription_id, device_id, ADDTIME(cur_date, trans_time), transaction_id, patient_id ; -- DEBUGING
                    
                    IF transaction_id IS NULL THEN
					-- there was no apropriate transaction found, add new one
						-- SELECT 'add new transaction'; -- DEBUGGING
                        SET transaction_id = add_transaction(trans_datetime);
					END IF;

                    SET schedule__transaction_id = addrel_schedule__transaction(schedule_id, transaction_id);
                    -- SELECT schedule__transaction_id, schedule_id, transaction_id;
				END WHILE times_loop;
				
				SET cur_date = DATE_ADD(cur_date, INTERVAL 1 DAY);
			END WHILE;
		END IF; -- frequency_type

		-- send schedule task to Isabella
		CALL create_sync_task_wt(device_id, `$task_id`);

        -- return info table
        SELECT schedule_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_sync_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_sync_task`(
/*  Name:  create_sync_task
**  Date: 2016-12-08
**  Notes: create sync task
**  This SP creates a task to synchronize all transactions between the hub and the device.
**  and send JSON object to device related with the transaction
**  Input parameter is device_id.
**  Task type is `SYNC`.
**  JSON object has following structure: 
**  {"api": 1, "task_id": Number, "task_type": "SYNC", 
**  "task_parameters": {"transactions": [{"id": Number, "scheduled_datetime": String, 
**                   "execute_datetime": String, "bin": String, "cartridge": String, "slot": Number,
**                   "is_discontinued": Boolean}, ...]}}
**  If value one of the attributes "scheduled_datetime" or "execute_datetime" or "bin" or "cartridge"
**  is null then the attribute will be set to empty string ""
**  Value of "is_discontinued" will be set to true only if field prescription.is_discontinued = 'Y'. Otherwise it will 
**   set to false  
**  Fields schedule__transaction.id and transaction.scheduled_datetime can not be null. Otherwise error will be throwen
**
**  Examples of use:  
**  CALL `sophic_medical`.`create_sync_task`(1); 
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
    IN `$device_id` INT(11)
)
BEGIN
	DECLARE `$done` INT DEFAULT FALSE;
	DECLARE `$task_id` BIGINT(18) DEFAULT NULL;
--     DECLARE `$device_id` INT(11);
--     DECLARE `$json_data` TEXT DEFAULT NULL;
--     DECLARE `$trans_item` VARCHAR(200);
--     DECLARE `$ret_code` INT;
--     DECLARE `$trans_exist` BOOLEAN;
-- 

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';


    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;
    START TRANSACTION;
		CALL create_sync_task_wt(`$device_id`, `$task_id`);
    
		SELECT `$task_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_sync_task_wt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_sync_task_wt`(
/*  Name:  create_sync_task
**  Created 2016-12-08
**  Updated 2017-01-07 New format of json parameter was implemented
**  Updated 2017-01-14 Added to transaction JSON object:
**				executed_datetime = transaction.executed_datetime, if it is NULL then empty string
**				is_face_recognized = "Y" if transaction.recognition_status= = 'OK'
**									"N" if transaction.recognition_status= = 'NO'
**									"U" otherwise (if NULL)
**				patient_name = patient.first_name+' '+patient.last_name
**				patient_sex = patient.sex. It can be one of the values M, F, U (if NULL)
**		Added to object medication field prescription.id
**		Type of field strength_amount was changed to string	
**  Udated 2017-03-02 Updated JSON object format
**  Notes: create tasks for bin pushing for specified device. It is not use MySQL transaction and
**  must be called from an outer procedure
**  This SP creates a task to synchronize all transactions between the hub and the device
**  and send JSON object to device related with the transaction
**  Input parameter is device_id.
**  Task type is `SYNC`.
**  JSON object has following structure: 
**		<tasks> ::=	{
**						"api": 1, 
**						"task_id": Number task.id, 
**						"task_type": "SYNC", 
**						"task_parameters": {"transactions": <transactions>}
**					}
**				
**		<transactions> ::=         
**				[
**					{
**						"id": Number transaction.id, 
**						"execute_datetime": String transaction.execute_datetime, 
**						"scheduled_datetime": String transaction.scheduled_datetime,
**						"executed_datetime": String transaction.executed_datetime,
**						"is_prn": String,
**						"is_face_recognized": String,
**						"patient_id": String patient.id,
**						"patient_name": String patient.first_name+' '+patient.last_name,
**						"patient_sex": String patient.sex,
**						"speaker_volume": Number patient.speaker_volume,
**						"speaker_volume_prox": Number patient.speaker_volume_prox,
**						"audio_alerts_number": Number patient.audio_alerts_number,
**						"audio_alerts_interval": Number patient.audio_alerts_interval,
**						"action_notrcg": String patient.action_notrcg, 
**						"bins": <bins> 
**					}, ...
**				]
**					
**		<bins> ::= [
**						{	
**							"bin": String bin.code,
**							"slot": Number bin.loaded_to_slot,
**							"cartridge": String bin.loaded_to_cartridge,
**							"is_discontinued":  bin is discontinued, 
**							"medications": <medications> 
**						}, ...
**					]
**					
**		<medications> ::= [
**							{
**								"is_discontinued": String prescription.is_discontinued, 
**								"name": String prescription.medication_name,
**								"strength_amount": String prescription.strength_amount,
**								"strength_uom": String prescription.strength_uom,
**								"prescription": Integer prescription.id
**							},
**							...
**						]
**
**  if strength_amount is NULL then 0 will be returned
**  if strength_uom is NULL then "" will be returned
**
**  Examples of use:  
**  CALL `sophic_medical`.`create_sync_task`(3); 
**
**  Copyright (c) 2016 - 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
    IN `$device_id` INT(11),
    OUT `$task_id` BIGINT(18)  # returns id of the created task in `task` table 
)
BEGIN
	DECLARE `$data` TEXT DEFAULT NULL;  # json object that will be sent to device
    DECLARE `$transaction_done`, `$bin_done` BOOLEAN DEFAULT FALSE;

    DECLARE `$ret_code` INT;
    DECLARE `$trans_exist` BOOLEAN;

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

	DECLARE `$transaction_id` BIGINT(18);
	DECLARE `$scheduled_datetime` DATETIME;
    DECLARE `$execute_datetime` DATETIME;
    DECLARE `$executed_datetime` DATETIME;
    DECLARE `$is_prn` CHAR(1);
    DECLARE `$is_face_recognized` VARCHAR(1) DEFAULT 'U';
    DECLARE `$patient_id` INT(11);
    DECLARE `$patient_name` VARCHAR(101);
    DECLARE `$patient_sex` VARCHAR(1) DEFAULT 'U';
    DECLARE `$speaker_volume` TINYINT(3);
    DECLARE `$speaker_volume_prox` TINYINT(3);
    DECLARE `$audio_alerts_number` TINYINT(2);
    DECLARE `$audio_alerts_interval` SMALLINT(3);
    DECLARE `$action_notrcg` VARCHAR(10);
    
    DECLARE `$bin_id` VARCHAR(16);
    DECLARE `$cartridge_id` VARCHAR(16); 
    DECLARE `$slot` TINYINT(2);
    DECLARE `$is_discontinued` CHAR(1); 
    DECLARE `$medications` TEXT;
    DECLARE `$exists_discontinued` CHAR(1);

	DECLARE `$bin_array` TEXT;
    DECLARE	`$bin_jobj` TEXT;
	DECLARE `$transaction_array` TEXT;
	DECLARE `$transaction_jobj` TEXT;
	DECLARE `$task_jobj` TEXT;
    
	DECLARE `$transaction_cur` CURSOR FOR
		SELECT DISTINCT T.id AS id,
			T.scheduled_datetime,
			T.execute_datetime,
            T.executed_datetime,
            P.is_prn,
            CASE T.recognition_status
				WHEN 'OK' THEN 'Y'
                WHEN 'NO' THEN 'N'
				ELSE 'U'
			END AS is_face_recognized,
            A.id AS patient_id,
            concat(A.first_name, ' ', A.last_name) AS patient_name,
            ifnull(A.sex, 'U') AS patient_sex,
            A.speaker_volume AS speaker_volume,
            A.speaker_volume_prox AS speaker_volume_prox,
            A.audio_alerts_number AS audio_alerts_number,
            A.audio_alerts_interval AS audio_alerts_interval,
            A.action_notrcg AS action_notrcg
		FROM `sophic_medical`.`transaction` T
			INNER JOIN `sophic_medical`.`schedule__transaction` ST
				ON ST.transaction = T.id
			INNER JOIN `sophic_medical`.`schedule` S
				ON S.id = ST.schedule
			INNER JOIN `sophic_medical`.`prescription` P
				ON P.id = S.prescription
            INNER JOIN `sophic_medical`.`patient` A
				ON P.patient = A.id
		WHERE S.device = `$device_id` AND ST.bin IS NOT NULL;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$transaction_done` = TRUE;

-- checking are there in process 'P' SYNC tasks for `$device_id`
/*
	IF EXISTS(SELECT * 
			FROM task 
			WHERE task.device = `$device_id` 
			AND task.task_type = 'SYNC' 
			AND task.execute_status = 'P') THEN
	
		SET `$msg` = CONCAT('There are in process SYNC tasks for device with id = ', `$device_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
	END IF;			
*/
	-- create new task
	INSERT INTO `sophic_medical`.`task`
		(`task_type`, `device`, `execute_status`, `parameters`, `created_datetime`)
		VALUES('SYNC', `$device_id`, 'S', `$data`, NOW());
	SELECT last_insert_id() INTO `$task_id`;
	
    -- ranges over transactions
    SET `$transaction_array` = '';
	OPEN `$transaction_cur`;
    transaction_loop: LOOP
		FETCH `$transaction_cur` INTO 	`$transaction_id`,
			`$scheduled_datetime`,
			`$execute_datetime`,
            `$executed_datetime`,
            `$is_prn`,
            `$is_face_recognized`,
            `$patient_id`,
            `$patient_name`,
            `$patient_sex`,
            `$speaker_volume`,
            `$speaker_volume_prox`,
            `$audio_alerts_number`,
            `$audio_alerts_interval`,
            `$action_notrcg`; 

		IF `$transaction_done` THEN	
			CLOSE `$transaction_cur`;
			LEAVE transaction_loop;
		END IF;
        
        bin_block: BEGIN
			DECLARE `$bin_cur` CURSOR FOR
				SELECT DISTINCT ST.bin, 
					B.loaded_to_cartridge AS cartridge,
					B.loaded_to_slot AS slot
                FROM `schedule__transaction` ST
					LEFT OUTER JOIN `sophic_medical`.`bin` B
						ON ST.bin = B.code
                WHERE ST.transaction = `$transaction_id` AND ST.bin IS NOT NULL;
                
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$bin_done` = TRUE;
            SET `$bin_array` = '';
            OPEN `$bin_cur`;
            bin_loop: LOOP
				FETCH `$bin_cur` INTO `$bin_id`, `$cartridge_id`, `$slot`;
 
				IF `$bin_done` THEN
					SET `$bin_done` = FALSE;
                    CLOSE `$bin_cur`;
                    LEAVE bin_loop;
                END IF;

				CALL get_medication_json(`$transaction_id`, `$bin_id`, `$medications`, `$exists_discontinued`);
				
                SET `$bin_jobj` = concat('{ "bin": "', `$bin_id`, '"',
							', "slot":', `$slot`,
							', "cartridge":"', `$cartridge_id`, '"',
							', "is_discontinued": "',  `$exists_discontinued`, '"',
							', "medications": ', `$medications`, ' }');
                            
				SET `$bin_array` = concat(`$bin_array`, 
					if(length(`$bin_array`) = 0, '', ', '),
                    `$bin_jobj`);
                -- SELECT `$bin_array`;    
            END LOOP bin_loop; 
            SET `$bin_array` = concat('[ ', `$bin_array`, ' ]');
        END bin_block;
        
        SET `$transaction_jobj` = concat(
        				'{"id": ' , `$transaction_id`,
				', "execute_datetime": "', ifnull(`$execute_datetime`, ''), '"',
                ', "executed_datetime": "', ifnull(`$executed_datetime`, ''), '"',
				', "scheduled_datetime": "', ifnull(`$scheduled_datetime`, ''), '"',
                ', "is_prn": "', `$is_prn`, '"',
				', "is_face_recognized": "', `$is_face_recognized`, '"',
				', "patient_id": "', `$patient_id`, '"',
                ', "patient_name": "', `$patient_name`, '"',
				', "patient_sex": "', `$patient_sex`, '"',
                ', "speaker_volume": ', `$speaker_volume`,
                ', "speaker_volume_prox": ', `$speaker_volume_prox`,
                ', "audio_alerts_number": ', `$audio_alerts_number`,
                ', "audio_alerts_interval": ', `$audio_alerts_interval`,
                ', "action_notrcg": "', `$action_notrcg`, '"', 
				', "bins": ', `$bin_array`, ' }'
                );


        SET `$transaction_array` = concat(
				`$transaction_array`,
				if(length(`$transaction_array`) = 0, '', ', '),
                `$transaction_jobj`              
			);
        -- SELECT `$transaction_jobj`, `$transaction_array`;
    END LOOP transaction_loop;
	SET `$transaction_array` = concat('[ ', `$transaction_array`, ' ]');

	SET `$task_jobj` = concat('{ "api": 1'
				', "task_id": ', `$task_id`, 
				', "task_type": "SYNC"', 
				', "task_parameters": {	"transactions": ', `$transaction_array`, ' }',
				'}'
		);

	-- SELECT `$task_jobj`, `$transaction_array`, `$task_id`;
	
	UPDATE `sophic_medical`.`task` SET parameters = `$task_jobj` WHERE id = `$task_id`;

	SET `$ret_code` = sm_send_packet(`$device_id`, `$task_jobj`);
	
    IF `$ret_code` != 0 THEN  -- Failed to send packet for task ID to device ID
		SET `$msg` = CONCAT('Failed to send packet for task ', `$task_id`, ' to device ', `$device_id`, 
			'. Error code ', `$ret_code`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
	END IF;
        
-- SELECT `$task_id` AS 'id1', 0 AS 'err_code', 'OK' AS 'msg';    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_video_download_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_video_download_task`(
/*  Name:  create_video_download_task
**  Last Update Date: 2016-12-14
**  Notes: creates new task for specified transaction to upload video file  
**  and send JSON object to device related with the transaction
**  JSON object has following structure: 
**  {"api": 1, "task_id": Number, "task_type": "UPLDVID", "task_parameters": {"transaction_id": Number}}
**  api - version of the api
**	task_id - identifier of the new task from tables task
**  transaction_id - identifier of the transaction passed as parameter
**
** Examples of use:  
** CALL `sophic_medical`.`create_video_download_task`(10); 
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$transaction_id` BIGINT(18)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE trans_exists BOOLEAN;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;
		-- checking if transaction_id is in transaction table
		SET trans_exists = EXISTS(SELECT * FROM sophic_medical.transaction WHERE id = `$transaction_id`);
		IF trans_exists = FALSE THEN
			SET msg = CONCAT('Transaction with id = ', `$transaction_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		-- get device id from schedule table	
		SET device_id = NULL;
		SELECT DISTINCT device INTO device_id FROM `schedule__transaction` ST 
					INNER JOIN `schedule` S ON ST.`schedule` = S.id
			WHERE ST.`transaction` = `$transaction_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find device id for transaction with id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `transaction` = `$transaction_id` 
				AND T.task_type = 'UPLDVID'
				AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed UPLDVID task exists for transaction.id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `transaction`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('UPLDVID', `$transaction_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "UPLDVID", "task_id":', CAST(task_id AS CHAR), 
			', "task_parameters": {"transaction_id": ', CAST(`$transaction_id` AS CHAR), '}}');
        -- SELECT json_data;    

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

/*
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE trans_exists BOOLEAN;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;
		-- checking if transaction_id is in transaction table
		SET trans_exists = EXISTS(SELECT * FROM sophic_medical.transaction WHERE id = `$transaction_id`);
		IF trans_exists = FALSE THEN
			SET msg = CONCAT('Transaction with id = ', `$transaction_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		-- get device id from schedule table	
		SET device_id = NULL;
		SELECT DISTINCT device INTO device_id FROM `schedule__transaction` ST 
					INNER JOIN `schedule` S ON ST.`schedule` = S.id
			WHERE ST.`transaction` = `$transaction_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find device id for transaction with id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `transaction` = `$transaction_id` 
				AND T.task_type = 'UPLDVID'
				AND T.execute_status = 'P')
		THEN
			SET msg = CONCAT('Not completed UPLDVID task exists for transaction.id = ', `$transaction_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;				

		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `transaction`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('UPLDVID', `$transaction_id`, 'P', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "UPLDVID", "task_id":', CAST(task_id AS CHAR), 
			', "task_parameters": {"transaction_id": ', CAST(`$transaction_id` AS CHAR), '}}');
        -- SELECT json_data;    


		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;

		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;
*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_wifi_get_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_wifi_get_task`(
/*  Name:  create_wifi_get_task
**  Last Update Date: 2017-05-10
**  Notes: creates new task for specified device to get available wifi networks
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$device_id` INT(11)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;

		-- check device id 
		SET device_id = NULL;
		SELECT id INTO device_id FROM `device` D 
			WHERE D.`id` = `$device_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find specified device id ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `device` = `$device_id` 
				AND T.task_type = 'GETWIFI'
				AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed GETWIFI task exists for device_id = ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;					
        
		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `device`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('GETWIFI', `$device_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "GETWIFI", "task_id":', CAST(task_id AS CHAR), '}');
        -- SELECT json_data;    

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_wifi_sync_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `create_wifi_sync_task`(
/*  Name:  create_wifi_sync_task
**  Last Update Date: 2017-05-10
**  Notes: creates new task for specified device to send wifi settings
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `$device_id` INT(11)
)
BEGIN
	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE wifi_enabled CHAR(1);
    DECLARE wifi_ssid VARCHAR(32);
    DECLARE wifi_security VARCHAR(8);
    DECLARE wifi_key VARCHAR(63);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

 	START TRANSACTION;

		-- check device id 
		SET device_id = NULL;
		SELECT id INTO device_id FROM `device` D 
			WHERE D.`id` = `$device_id`;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find specified device id ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		IF EXISTS(SELECT *
			FROM `task` T 
            WHERE `device` = `$device_id` 
				AND T.task_type = 'SYNCWIFI'
				AND (T.execute_status = 'S' OR T.execute_status = 'P'))
		THEN
			SET msg = CONCAT('Not completed SYNCWIFI task exists for device_id = ', `$device_id`);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;					
        
		-- create new task
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `device`, `execute_status`, `parameters`, `created_datetime`)
			VALUES('SYNCWIFI', `$device_id`, 'S', json_data, NOW());
		SELECT last_insert_id() INTO task_id;
        
        -- get wifi settings
        SELECT D.wifi_enabled, D.wifi_ssid, D.wifi_security, D.wifi_key INTO wifi_enabled, wifi_ssid, wifi_security, wifi_key
        FROM device D
        WHERE D.id = device_id;

		-- create json object and update task
        SET json_data = concat('{"api": 1, "task_type": "SYNCWIFI", "task_id":', CAST(task_id AS CHAR), ',"task_parameters": {"enabled": "', wifi_enabled, '", "ssid": "', wifi_ssid, '", "security": "', wifi_security, '", "key": "', wifi_key, '"}}');
        -- SELECT json_data;    

		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;
		 
		SET ret_code = sm_send_packet(device_id, json_data);
		IF ret_code != 0 THEN
			SET msg = CONCAT('Failed to send packet ', json_data, ' to device ', device_id, '. Error code ', ret_code);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `discontinue_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `discontinue_prescription`(
/*  Name:  delete_prescription
**  Created: 2016-11-05
**   
**  Notes: set prescription.is_discontinued to Y by prescription id and sync with all devices which have schedules for that prescription
**  Changes:  
**	2016-12-07: is_deleted replaced on is_discontinued
**
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `prescription_id` BIGINT(18)
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';
	DECLARE `$done` INT DEFAULT FALSE;
	DECLARE `$device_id` INT(11);
	DECLARE `$task_id` BIGINT(18) DEFAULT 0;
	DECLARE `$task_id_lst` TEXT DEFAULT '';
	DECLARE `$comma` CHAR(1) DEFAULT '';

	DECLARE `$cur` CURSOR FOR
		SELECT DISTINCT device FROM schedule S WHERE prescription = `prescription_id`;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$done` = TRUE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;


 	START TRANSACTION;

		IF NOT EXISTS(SELECT * FROM `sophic_medical`.`prescription` WHERE `id` = `prescription_id`) THEN
			SET `$msg` = CONCAT('Prescription with id = ', `prescription_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
		END IF;
		
		UPDATE `sophic_medical`.`prescription`
			SET `is_discontinued` = 'Y'
		WHERE `id` = `prescription_id`;
	
		
        OPEN `$cur`;
		read_loop: LOOP
			FETCH `$cur` INTO `$device_id`; 
			IF `$done` THEN
				LEAVE read_loop;
			END IF;
            BEGIN
				SET `$task_id` = 0;
				CALL create_sync_task_wt(`$device_id`, `$task_id`);
                SET `$task_id_lst` = concat(`$task_id_lst`, `$comma`, `$task_id`);
                SET `$comma` = ', ';
                -- SELECT `$device_id`, `$task_id`;
            END;
		END LOOP;
		CLOSE `$cur`;
    
		SELECT `$task_id_lst` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `discontinue_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `discontinue_schedule`(
/*  Name:  discontinue_schedule
**  Created: 2017-08-04
**   
**  Notes: set schedule.is_discontinued to Y by schedule id  and sync with device
**
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN `schedule_id` BIGINT(18)
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';
	DECLARE `$device_id` INT(11);
	DECLARE `$task_id` BIGINT(18) DEFAULT 0;
	
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;


 	START TRANSACTION;

		IF NOT EXISTS(SELECT * FROM `sophic_medical`.`schedule` WHERE `id` = `schedule_id`) THEN
			SET `$msg` = CONCAT('Schedule with id = ', `schedule_id`, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
		END IF;
		
		UPDATE `sophic_medical`.`schedule`
			SET `is_discontinued` = 'Y'
		WHERE `id` = `schedule_id`;
        
        SELECT `device` FROM `schedule` WHERE `id` = `schedule_id` INTO `$device_id`;
		CALL create_sync_task_wt(`$device_id`, `$task_id`);
    
		SELECT `$task_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
        
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_bypass_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_bypass_status`(
/*  Name:  get_bypass_status
**  Date: 2016-11-05
**  Notes: return status of the last bypass task for specified transaction. 
**    If a task does not exist then it raises an error 
** 
** Examples of use:  
** CALL `sophic_medical`.`get_bypass_status`(10);
** CALL `sophic_medical`.`get_bypass_status`(-10);  
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$transaction_id` BIGINT(18)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
    
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as 'err_code', `$msg` as 'msg';
        RESIGNAL;
	END;

	SELECT T.execute_status AS status_id,  
		S.description AS bypass_status   
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`transaction` = `$transaction_id` AND `task_type` = 'BYPASS'
    ORDER BY T.`created_datetime` DESC 
    LIMIT 1; -- select last task of the specified task_type
    
    SELECT `$execute_status` AS status_id, `$description` AS `bypass_status`;

/*
2017.01.02

    DECLARE `$execute_status` CHAR(1) DEFAULT NULL;
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
    
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as 'err_code', `$msg` as 'msg';
        RESIGNAL;
	END;

	SELECT T.execute_status AS status_id,  
		S.description AS bypass_status   
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`transaction` = `$transaction_id` AND `task_type` = 'BYPASS'
    ORDER BY T.`created_datetime` DESC 
    LIMIT 1; -- select last task of the specified task_type

	IF `$execute_status` IS NULL THEN
		SET `$msg` = CONCAT('BYPASS task is not exist for transaction.id = ', `$transaction_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
	END IF;
    
    SELECT `$execute_status` AS status_id, `$description` AS `bypass_status`;
*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dispense_prn_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_dispense_prn_status`(
/*  Name:  get_dispense_prn_status
**  Date: 2016-12-05
**  Notes: 
**  Returns status of the last dispense prn task for the specified transaction 
**  If a task does not exist then it raises an error 
** 
** Examples of use:  
** CALL `sophic_medical`.`get_dispense_prn_status`(10);
** CALL `sophic_medical`.`get_dispense_prn_status`(-10);  
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$transaction_id` BIGINT(18)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;
    
	SELECT T.execute_status AS status_id,  
		S.description AS dispense_status
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`transaction` = `$transaction_id` AND T.`task_type` = 'DSPPRN'
    ORDER BY T.`created_datetime` DESC 
    LIMIT 1; -- select last task of the specified task_type
    
    SELECT `$execute_status` AS `status_id`, `$description` AS `dispense_status`;

/*
2017.01.02

    DECLARE `$execute_status` CHAR(1) DEFAULT NULL;
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;
    
	SELECT T.execute_status AS status_id,  
		S.description AS dispense_status
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`transaction` = `$transaction_id` AND T.`task_type` = 'DSPPRN'
    ORDER BY T.`created_datetime` DESC 
    LIMIT 1; -- select last task of the specified task_type
    
	IF `$execute_status` IS NULL THEN
		SET `$msg` = CONCAT('DSPPRN task is not exist for transaction.id = ', `$transaction_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
	END IF;
    
    SELECT `$execute_status` AS `status_id`, `$description` AS `dispense_status`;
*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_drug_adherence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_drug_adherence`(
/*  Name:  get_drug_adherence
**  Created: 2016-12-14
**  Notes: 
**    Field "all_bins_loaded" is true only if:
** 	   1) All schedule_transaction rows related with the transaction have not null field "bin"
**	   2) Bin is loaded to cartridge (field "cartridge" is not null)
**	   3) Cartridge is loaded to device (field "device" is not null)
**  
**  It returns only transactions related to prescriptions and schedules
**  that are not discontinued (field `is_discontinued` in the `prescription` and `schedule` table equals `N`).
**
**  Returned `medications` column contains json array of the medications: 
** [
**     {"name": String medication_name, "strength": String strength_amount, "uom": String strength_uom},
**     {"name": String medication_name, "strength": String strength_amount, "uom": String strength_uom},
**		...
** ]
**
**  `early_dispense_status` column contains ths status of the last EARLYDSP task)
**  `bypass_status` column contains the staus of the last BYPASS task)
**
**  Examples:
**  CALL `sophic_medical`.`get_drug_adherence`(1, 1, '2016-10-10 00:00:00', '2016-12-31 12:00:00');
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN patient_id_par INT(11), -- patient id
    IN device_id_par INT(11), -- device id
	IN start_datetime_par DATETIME, -- transaction scheduled start datetime
	IN stop_datetime_par DATETIME -- transaction scheduled end datetime
)
BEGIN
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;

    SELECT 
		TransactionMedication.transaction_id, 
        TransactionMedication.scheduled_datetime,  
		TransactionMedication.execute_datetime, 
		TransactionMedication.executed_datetime, 
        TransactionMedication.is_prn, 
		TransactionMedication.transaction_status_id, -- ERROR, OK, SCHD
		TransactionMedication.transaction_status_name, -- ERROR, SUCCESS, SCHEDULED
		TransactionMedication.medication, -- json array
		if(TransactionMedication.`not_loaded_bin_cnt` = 0
			 AND TransactionMedication.`not_loaded_cartridge_cnt` = 0, 
            TRUE, 
            FALSE
		) AS `all_bins_loaded`,
        if(TransactionMedication.`not_scanned_bin_cnt` = 0, 
            TRUE, 
            FALSE
		) AS `all_bins_scanned`,
        ifnull(PivotedTask.video_download_status_id, 'N') AS `video_download_status_id`, 
		PivotedTask.video_filename,
		ifnull(PivotedTask.early_dispense_status_id, 'N') AS `early_dispense_status_id`,
		ifnull(PivotedTask.bypass_status_id, 'N') AS `bypass_status_id`,
        VideoStatus.description AS video_download_status_name,
        DispenseStatus.description AS early_dispense_status_name,
        BypassStatus.description AS bypass_status_name
    FROM 
		-- select medication for each transaction
		(
			SELECT T.id AS transaction_id,
				T.scheduled_datetime AS scheduled_datetime,  
				T.execute_datetime AS execute_datetime, 
				T.executed_datetime AS executed_datetime, 
                P.is_prn AS is_prn,
				T.transaction_status AS transaction_status_id, -- ERROR, OK, SCHD
				TStatus.description AS transaction_status_name,
				concat('[ ', 
					group_concat(
						concat('{"name": "', ifnull(P.medication_name, ''), 
							'", "strength":"', ifnull(P.strength_amount, ''),
							'", "uom":"', ifnull(P.strength_uom, ''),
							'"}') -- end concat
						separator ', '), -- end group_concat
					' ]') 
				 AS medication,   
                 sum(if(B.loaded_datetime IS NULL, 1, 0)) AS `not_loaded_bin_cnt`,
                 sum(if(C.loaded_datetime IS NULL, 1, 0)) AS `not_loaded_cartridge_cnt`,
                 sum(if(B.scanned_datetime IS NULL, 1, 0)) AS `not_scanned_bin_cnt`,
                 P.is_discontinued
			FROM transaction T
				INNER JOIN schedule__transaction ST
					ON T.id = ST.transaction
				INNER JOIN schedule S
					ON S.id = ST.schedule
				INNER JOIN prescription P
					ON P.id = S.prescription 
				INNER JOIN transaction_status TStatus
					ON T.transaction_status = TStatus.code
                LEFT OUTER JOIN bin B  -- LEFT OUTER JOIN because of ST.bin can be NULL     
                     ON B.code = ST.bin
                LEFT OUTER JOIN cartridge C
					ON C.code = B.loaded_to_cartridge
 			WHERE P.patient = patient_id_par AND S.device = device_id_par
                    AND T.scheduled_datetime >= start_datetime_par 
					AND T.scheduled_datetime <= stop_datetime_par
                    AND P.is_discontinued = 'N'
                    AND S.is_discontinued = 'N'
			GROUP BY T.id, 
				T.scheduled_datetime, 
				T.execute_datetime, 
				T.executed_datetime, 
				T.transaction_status
		) TransactionMedication
        LEFT OUTER JOIN
        -- *** pivot task table by types
        (  
			SELECT `transaction` AS transaction_id, 
				max(video_download_status) AS video_download_status_id, 
				max(video_filename) AS video_filename,
				max(early_dispense_status) AS early_dispense_status_id,
				max(bypass_status) AS bypass_status_id
			FROM
				(SELECT T.`transaction`, 
					CASE 
						WHEN task_type = 'UPLDVID' THEN execute_status
						ELSE NULL
					END AS video_download_status,
					CASE 
						WHEN task_type = 'UPLDVID' AND ret_value IS NOT NULL 
							THEN cast(JSON_UNQUOTE(json_extract(ret_value, '$.file_name')) AS char)
						ELSE NULL
					END AS video_filename,
					CASE 
						WHEN task_type = 'EARLYDSP' THEN execute_status
						ELSE NULL
					END AS early_dispense_status,
					CASE 
						WHEN task_type = 'BYPASS' THEN execute_status
						ELSE NULL
					END AS bypass_status
				FROM task T
				WHERE created_datetime = (SELECT max(created_datetime) 
						FROM `task` A 
						WHERE A.`transaction` = T.`transaction` AND A.task_type = T.task_type)
				) TSK
			GROUP BY `transaction`
        ) PivotedTask -- *** end pivot
			ON PivotedTask.transaction_id = TransactionMedication.transaction_id
		LEFT OUTER JOIN task_execute_status VideoStatus
			ON PivotedTask.video_download_status_id = VideoStatus.id
		LEFT OUTER JOIN task_execute_status DispenseStatus
			ON PivotedTask.early_dispense_status_id = DispenseStatus.id
		LEFT OUTER JOIN task_execute_status BypassStatus
			ON PivotedTask.bypass_status_id = BypassStatus.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_early_dispense_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_early_dispense_status`(
/*  Name:  get_early_dispense_status
**  Date: 2016-12-05
**  Notes: return status of the early dispense task 
**
** Examples of use:  
** CALL `sophic_medical`.`get_early_dispense_status`(10);
** CALL `sophic_medical`.`get_early_dispense_status`(-10);  
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$transaction_id` BIGINT(18)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;
    
    
	SELECT T.execute_status AS status_id,  
		S.description AS early_dispense_status
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE `transaction` = `$transaction_id` AND task_type = 'EARLYDSP'
    ORDER BY T.created_datetime DESC 
    LIMIT 1; -- select last task of the speciofied task_type
    
    SELECT `$execute_status` AS `status_id`, `$description` AS `early_dispense_status`;

/*
2017.01.02

    DECLARE `$execute_status` CHAR(1) DEFAULT NULL;
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;
    
    
	SELECT T.execute_status AS status_id,  
		S.description AS early_dispense_status
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE `transaction` = `$transaction_id` AND task_type = 'EARLYDSP'
    ORDER BY T.created_datetime DESC 
    LIMIT 1; -- select last task of the speciofied task_type
    
	IF `$execute_status` IS NULL THEN
		SET `$msg` = CONCAT('EARLYDSP task is not exist for transaction.id = ', `$transaction_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
	END IF;
    
    SELECT `$execute_status` AS `status_id`, `$description` AS `early_dispense_status`;
*/    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_medication_json` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_medication_json`(
/*  Name:  get_medication_json
**  Created 2017-01-07
**	Updated 2017-01-14: Added to Medication object prescription.id
**				Type of field strength_amount was changed to string		
**
**  Notes: creates a list of medications for the specified transaction and bin in json format 
**  it is called from create_sync_task_wt
**  Input parameters are transaction_id and bin_id
**
**  Output parameters are: 
**		medications - json array with medication list
**		exists_discontinued - 'Y' if at least one medication was discontinued (through prescription or schedule), 'N' otherwise
**
**  Example of use:  
**  CALL sophic_medical.get_medication_json(122, 'D4F5A1C8D7', @m, @d);
**  SELECT @m, @d; 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$transaction_id`BIGINT(18), 
    IN `$bin_id` VARCHAR(16),
    OUT `$medications` TEXT,
    OUT `$exists_discontinued` CHAR(1)
)
BEGIN
	DECLARE `$done` BOOLEAN DEFAULT FALSE;
	DECLARE `$is_discontinued` CHAR(1); 
	DECLARE `$name` varchar(50);
	DECLARE `$strength_amount` VARCHAR(15); -- decimal(10,3); 
	DECLARE `$strength_uom` varchar(15);
	DECLARE `$medicament` TEXT DEFAULT NULL; 
	DECLARE `$medicaments_array` TEXT DEFAULT '';
	DECLARE `$prescription_id` BIGINT(18);

	DECLARE `$cur` CURSOR FOR
		SELECT  IF(P.is_discontinued = 'Y' OR S.is_discontinued = 'Y', 'Y', 'N') AS 'is_discontinued', 
				P.medication_name AS 'name',
				ifnull(P.strength_amount, '') AS 'strength_amount',
				ifnull(P.strength_uom, '') AS 'strength_uom',
                P.id
        FROM `schedule__transaction` ST
			INNER JOIN `schedule` S
				ON ST.schedule = S.id
            INNER JOIN `prescription` P
				ON P.id = S.prescription
		WHERE ST.transaction = `$transaction_id` AND ST.bin = `$bin_id`;
	
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$done` = TRUE;
    
    SET `$exists_discontinued` = 'N';
    OPEN `$cur`;
    patient_loop: LOOP
		FETCH `$cur` INTO `$is_discontinued`, 
						`$name`, 
                        `$strength_amount`, 
                        `$strength_uom`, 
                        `$prescription_id`; 
		IF `$done` THEN
			CLOSE `$cur`;
            LEAVE patient_loop;
        END IF;
        IF `$is_discontinued` = 'Y' THEN
			SET `$exists_discontinued` = 'Y';
        END IF;    
        SET `$medicament` = concat('{ "is_discontinued": "', `$is_discontinued`, '"', 
					', "name": "', `$name`, '"', 
                    ', "strength_amount": "', `$strength_amount`,'"'
                    ', "prescription": ', `$prescription_id`,
                    ', "strength_uom": "', `$strength_uom`, '"}'); 
		SET `$medicaments_array` = concat(`$medicaments_array`, 
						if(length(`$medicaments_array`) = 0, '', ', '), 
                        `$medicament`);
    END LOOP;    
	SET `$medications` = concat('[', `$medicaments_array`, ']');
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_running_offline_tasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_running_offline_tasks`(
/*  Name:  get_running_offline_tasks
**  Date: 2017-04-07
**  Notes: returns IDs of all tasks with type "OFFLINE" and status "S" or "P" for the specified device
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$device_id` INT(11)
)
BEGIN

	SELECT t.`id`
    FROM `task` t
    WHERE t.`task_type` = "OFFLINE"
		AND (t.`execute_status` = "S" OR t.`execute_status` = "P")
        AND t.`device` = `$device_id`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_scan_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_scan_status`(
/*  Name:  get_scan_status
**  Last Update Date: 2017-11-01
**  Notes: return status of the scan task
** 
**  Examples:
**  CALL `sophic_medical`.`get_scan_status`(1);
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `$device_id` INT(11)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
    
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;

	SELECT T.execute_status,  
		S.description   
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`device` = `$device_id` AND task_type = 'SCAN'
    ORDER BY T.created_datetime DESC 
    LIMIT 1; -- select last task of the speciofied task_type
    
-- 	IF `$execute_status` IS NULL THEN
-- 		SET `$msg` = CONCAT('SYNC task is not exist for device id = ', `$device_id`);	
-- 		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
-- 	END IF;

    
    SELECT `$execute_status` AS status_id, `$description` AS `scan_status`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_sync_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_sync_status`(
/*  Name:  get_sync_status
**  Last Update Date: 2016-12-14
**  Notes: return status of the sync task
** 
**  Examples:
**  CALL `sophic_medical`.`get_sync_status`(1);
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `$device_id` INT(11)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
    
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;

	SELECT T.execute_status,  
		S.description   
    INTO `$execute_status`, `$description`   
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`device` = `$device_id` AND task_type = 'SYNC'
    ORDER BY T.created_datetime DESC 
    LIMIT 1; -- select last task of the speciofied task_type
    
-- 	IF `$execute_status` IS NULL THEN
-- 		SET `$msg` = CONCAT('SYNC task is not exist for device id = ', `$device_id`);	
-- 		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
-- 	END IF;

    
    SELECT `$execute_status` AS status_id, `$description` AS `sync_status`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_task_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_task_by_id`(
	IN `$task_id` BIGINT
)
BEGIN
	SELECT T.* 
    FROM `sophic_medical`.`task` T
    WHERE T.id = `$task_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_transaction_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_transaction_by_id`(
/*  Name:  get_transaction_by_id
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
    IN `$transaction_id` BIGINT(18)
)
BEGIN
	SELECT T.`transaction_status`,
		T.`recognition_status`,
        T.`scheduled_datetime`,
        T.`execute_datetime`,
        T.`executed_datetime`,
        T.`transaction_direction`,
        T.`last_modified`,
        S.`device`
    FROM `transaction` T
		JOIN `schedule__transaction` ST ON ST.`transaction` = T.`id`
        JOIN `schedule` S ON S.`id` = ST.`schedule`
    WHERE T.`id` =  `$transaction_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_video_by_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_video_by_device`(
/*  Name:  get_video_by_device
**  Date: 2017-02-24
**  Notes: returns all videos successfully uploaded from the device 
**
** Examples of use:  
** CALL `sophic_medical`.`get_video_by_device`(1);
** CALL `sophic_medical`.`get_video_by_device`(2);  
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$device_id` INT(11)
)
BEGIN

	SELECT 
		T.id,
        ifnull(T.execute_datetime, T.scheduled_datetime) AS datetime,  
		A.first_name, 
		A.last_name, 
		T.transaction_status,
        V.execute_status,
		V.filename,
		concat('[ ', 
			group_concat(
				concat('{"name": "', ifnull(P.medication_name, ''), 
					'", "strength":"', ifnull(P.strength_amount, ''),
					'", "uom":"', ifnull(P.strength_uom, ''),
					'"}') -- end concat
				separator ', '), -- end group_concat
			' ]') 
		 AS medications   
	FROM 
		sophic_medical.transaction T
		INNER JOIN sophic_medical.schedule__transaction ST
			ON ST.transaction = T.id
		INNER JOIN sophic_medical.schedule S
			ON S.id = ST.schedule
		INNER JOIN sophic_medical.prescription P
			ON P.id = S.prescription
		INNER JOIN sophic_medical.patient A 
			ON P.patient = A.id
		LEFT OUTER JOIN
        (
			SELECT T.`transaction`, 
				T.execute_status,
				if(ret_value IS NOT NULL, 
					cast(JSON_UNQUOTE(json_extract(ret_value, 
					'$.file_name')) AS char), NULL) AS filename
			FROM task T
			WHERE created_datetime = (SELECT max(created_datetime) 
					FROM `task` A 
					WHERE A.`transaction` = T.`transaction` AND A.task_type = T.task_type)
				AND task_type = 'UPLDVID'
                AND execute_status = 'Y'
        )  V
        ON V.transaction = T.id
	WHERE S.device = `$device_id`
		AND V.execute_status = 'Y'
    GROUP BY T.id,
		T.execute_datetime,  
		A.first_name, 
		A.last_name, 
		T.transaction_status,
        V.execute_status,
        V.filename;

/*
	SELECT T.execute_datetime,  
		A.first_name, 
		A.last_name, 
		T.transaction_status,
		V.filename,
		concat('[ ', 
			group_concat(
				concat('{"name": "', ifnull(P.medication_name, ''), 
					'", "strength":"', ifnull(P.strength_amount, ''),
					'", "uom":"', ifnull(P.strength_uom, ''),
					'"}') -- end concat
				separator ', '), -- end group_concat
			' ]') 
		 AS medication   
	FROM sophic_medical.schedule S
		INNER JOIN sophic_medical.prescription P
			ON P.id = S.prescription
		INNER JOIN sophic_medical.patient A 
			ON P.patient = A.id
		INNER JOIN sophic_medical.schedule__transaction ST
			ON S.id = ST.schedule
		INNER JOIN sophic_medical.transaction T
			ON ST.transaction = T.id
		INNER JOIN sophic_medical.video V
			ON T.id = V.transaction
	WHERE S.device = `$device_id`;
*/
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_video_download_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_video_download_status`(
/*  Name:  get_video_download_status
**  Date: 2016-12-05
**  Notes: return status of the video download task 
**
** Examples of use:  
** CALL `sophic_medical`.`get_video_download_status`(10);
** CALL `sophic_medical`.`get_video_download_status`(-10);  
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$transaction_id` BIGINT(18)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
	DECLARE `$video_filename` VARCHAR(255)  DEFAULT NULL;

    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as 'err_code', `$msg` as 'msg';
        RESIGNAL;
	END;

	SELECT T.execute_status AS status_id,  
		S.description AS video_download_status,
        if(ret_value IS NULL, NULL, JSON_UNQUOTE(json_extract(ret_value, '$.file_name'))) AS video_filename
    INTO `$execute_status`, `$description`, `$video_filename`      
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`transaction` = `$transaction_id` AND `task_type` = 'UPLDVID'
    ORDER BY T.`created_datetime` DESC 
    LIMIT 1; -- select last task of the specified task_type

-- 	SELECT T.execute_status AS status_id,  
-- 		S.description AS video_download_status,
-- 		T.filename AS video_filename   
--     INTO `$execute_status`, `$description`, `$video_filename`   
-- 	FROM video T 
-- 		LEFT OUTER JOIN task_execute_status S 
-- 			ON T.execute_status = S.id
-- 	WHERE `transaction` = `$transaction_id`
--     ORDER BY T.created_datetime DESC 
--     LIMIT 1; -- select last task of the speciofied task_type
    
    SELECT `$execute_status` AS `status_id`, 
		`$description` AS `video_download_status`,
		`$video_filename` AS `video_filename`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_wifi_get_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_wifi_get_status`(
/*  Name:  get_wifi_get_status
**  Last Update Date: 2017-05-10
**  Notes: return status of the GETWIFI task
** 
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `$device_id` INT(11)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
    DECLARE `$created_datetime` DATETIME;
    DECLARE `$ret_value` TEXT DEFAULT NULL;
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;

	SELECT T.execute_status,  
		S.description,
        T.created_datetime,
        T.ret_value
    INTO `$execute_status`, `$description`, `$created_datetime`, `$ret_value`
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`device` = `$device_id` AND task_type = 'GETWIFI'
    ORDER BY T.created_datetime DESC 
    LIMIT 1; -- select last task of the specified task_type

    
    SELECT `$execute_status` AS status_id, `$description` AS `wifi_get_status`, `$created_datetime` AS `created_datetime`, `$ret_value` AS `response_json`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_wifi_sync_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `get_wifi_sync_status`(
/*  Name:  get_wifi_sync_status
**  Last Update Date: 2017-05-10
**  Notes: return status of the SYNCWIFI task
** 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `$device_id` INT(11)
)
BEGIN
    DECLARE `$execute_status` CHAR(1) DEFAULT 'N';
    DECLARE `$description` VARCHAR(255) DEFAULT NULL;
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`$err_code` = RETURNED_SQLSTATE, `$msg` = MESSAGE_TEXT;
        SELECT 0 AS 'id', `$err_code` as err_code, `$msg` as msg;
        RESIGNAL;
	END;

	SELECT T.execute_status,  
		S.description
    INTO `$execute_status`, `$description`
	FROM task T 
		LEFT OUTER JOIN task_execute_status S 
			ON T.execute_status = S.id
	WHERE T.`device` = `$device_id` AND task_type = 'SYNCWIFI'
    ORDER BY T.created_datetime DESC 
    LIMIT 1; -- select last task of the specified task_type

    
    SELECT `$execute_status` AS status_id, `$description` AS `wifi_sync_status`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_area` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_area`(
/*  Name:  insert_area
**  Date: 2017-07-19
**  Notes: 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
	IN `area_name` varchar(100),
	IN `area_household` int(11),
    IN `area_is_active` char(1)
)
BEGIN
	INSERT INTO `area` (
        `name`,
        `household`,
        `is_active`
	)
    VALUES (
        `area_name`,
        `area_household`,
        `area_is_active`
	) ;
    SELECT last_insert_id() AS `area_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_device`(
/*  Name:  insert_device
**  Date: 2017-07-27
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `device_area` int(11),
    IN `device_is_active` char(1)
)
BEGIN
INSERT INTO `device` (
        `area`,
        `is_active`
	)
    VALUES (
        `device_area`,
        `device_is_active`
	) ;
    SELECT last_insert_id() AS `device_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_device_modem_local_traffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_device_modem_local_traffic`(
/*  Name:  insert_device_modem_local_traffic
**  Date: 2017-08-29
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_id_par` INT(11),
    IN `datetime_par` DATETIME,
    IN `rx_bytes_counter_par` BIGINT(18),
    IN `tx_bytes_counter_par` BIGINT(18)
)
BEGIN
    
	INSERT INTO `sophic_medical`.`device_modem_local_traffic` (`device`, `datetime`, `rx_bytes_counter`, `tx_bytes_counter`)
    VALUES (`device_id_par`, `datetime_par`, `rx_bytes_counter_par`, `tx_bytes_counter_par`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_device_modem_provider_traffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_device_modem_provider_traffic`(
/*  Name:  insert_device_modem_provider_traffic
**  Date: 2017-08-24
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_modem_imei_par` INT(11),
    IN `datetime_par` DATETIME,
    IN `bytes_counter_par` BIGINT(18)
)
BEGIN
	DECLARE `$device_id` INT;
    
    SELECT `id` INTO `$device_id`
    FROM `sophic_medical`.`device` d
    WHERE d.`modem_imei` = `device_modem_imei_par`
		AND d.`is_active` = 'Y';
    
	INSERT INTO `sophic_medical`.`device_modem_provider_traffic` (`device`, `datetime`, `bytes_counter`)
    VALUES (`$device_id`, `datetime_par`, `bytes_counter_par`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_device_temperature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_device_temperature`(
/*  Name:  insert_device_temperature
**  Date: 2017-05-17
**  Notes: Inserts device temperature values
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_id_par` INT(11),
    IN `datetime_par` DATETIME,
    IN `temperature_c_par` DECIMAL(3,1)
)
BEGIN
	INSERT INTO `device_temperature` (`device`, `datetime`, `temperature_c`)
    VALUES (`device_id_par`, `datetime_par`, `temperature_c_par`) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_device_wifi_local_traffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_device_wifi_local_traffic`(
/*  Name:  insert_device_wifi_local_traffic
**  Date: 2017-08-29
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_id_par` INT(11),
    IN `datetime_par` DATETIME,
    IN `rx_bytes_counter_par` BIGINT(18),
    IN `tx_bytes_counter_par` BIGINT(18)
)
BEGIN
    
	INSERT INTO `sophic_medical`.`device_wifi_local_traffic` (`device`, `datetime`, `rx_bytes_counter`, `tx_bytes_counter`)
    VALUES (`device_id_par`, `datetime_par`, `rx_bytes_counter_par`, `tx_bytes_counter_par`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_household` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_household`(
/*  Name:  insert_household
**  Date: 2017-07-19
**  Notes: 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
	IN `household_address` varchar(100),
	IN `household_city` int(11),
	IN `household_description` varchar(100),
    IN `household_is_active` char(1)
)
BEGIN
	INSERT INTO `household` (
        `address`,
        `city`,
        `description`,
        `is_active`
	)
    VALUES (
        `household_address`,
        `household_city`,
        `household_description`,
        `household_is_active`
	) ;
    SELECT last_insert_id() AS `household_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_patient`(
/*  Name:  insert_patient
**  Date: 2017-07-17
**  Notes: 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
	IN `patient_first_name` varchar(50),
	IN `patient_last_name` varchar(50),
	IN `patient_sex` char(1),
	IN `patient_birthdate` date,
	IN `patient_phone` varchar(20),
	IN `patient_address` varchar(100),
	IN `patient_ssn` varchar(11),
	IN `patient_photo` varchar(250),
    IN `device_speaker_volume` tinyint(3),
    IN `device_speaker_volume_prox` tinyint(3),
    IN `device_audio_alerts_number` tinyint(2),
    IN `device_audio_alerts_interval` smallint(3),
    IN `medication_overdue_period` smallint(3),
    IN `device_action_notrcg` varchar(10),
    IN `patient_is_active` char(1)
)
BEGIN
	INSERT INTO `patient` (
        `first_name`,
        `last_name`,
        `sex`,
        `date_of_birth`,
        `phone`,
        `address`,
        `ssn`,
        `photo`,
        `speaker_volume`,
        `speaker_volume_prox`,
        `audio_alerts_number`,
        `audio_alerts_interval`,
        `overdue_period`,
        `action_notrcg`,
        `is_active`
	)
    VALUES (
        `patient_first_name`,
        `patient_last_name`,
        `patient_sex`,
        `patient_birthdate`,
        `patient_phone`,
        `patient_address`,
        `patient_ssn`,
        `patient_photo`,
        `device_speaker_volume`,
        `device_speaker_volume_prox`,
        `device_audio_alerts_number`,
        `device_audio_alerts_interval`,
        `medication_overdue_period`,
        `device_action_notrcg`,
        `patient_is_active`
	) ;
    SELECT last_insert_id() AS `patient_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_physician` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_physician`(
/*  Name:  insert_physician
**  Date: 2017-08-15
**  Notes: 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
    IN `physician_prefix` varchar(10),
    IN `physician_first_name` varchar(50),
	IN `physician_middle_name` varchar(50),
	IN `physician_last_name` varchar(50),
	IN `physician_suffix` varchar(10),
    IN `physician_address` varchar(100),
    IN `physician_phone` varchar(20),
    IN `physician_dea_number` varchar(60),
    IN `physician_npi_number` varchar(60)
    
)
BEGIN
	INSERT INTO `physician` (
        `prefix`,
        `first_name`,
        `middle_name`,
        `last_name`,
        `suffix`,
        `address`,
        `phone`,
        `dea_number`,
        `npi_number`
	)
    VALUES (
        `physician_prefix`,
        `physician_first_name`,
        `physician_middle_name`,
        `physician_last_name`,
        `physician_suffix`,
        `physician_address`,
        `physician_phone`,
        `physician_dea_number`,
        `physician_npi_number`
	);
    SELECT last_insert_id() AS `physician_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_prescription`(
/*  Name:  insert_prescription
**  Date: 2016-12-05
**  Notes: insert prescription into prescription table  
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `date_written` DATE,
	IN `patient` INT(11),
	IN `physician` INT(11),
	IN `medication_name` VARCHAR(50),
	IN `admin_route` VARCHAR(5),
	IN `admin_method` VARCHAR(5),
	IN `admin_device` VARCHAR(5),
	IN `admin_site` VARCHAR(5),
	IN `frequency` VARCHAR(10),
    IN `is_prn` CHAR(1),
	IN `strength_amount` VARCHAR(15),
	IN `strength_uom` VARCHAR(15),
	IN `measure_amount` VARCHAR(15),
	IN `measure_uom` VARCHAR(15),
	IN `volume` VARCHAR(15),
	IN `container_uom` VARCHAR(15),
    IN `prescribed_qty` VARCHAR(50),
	IN `daw` TINYINT(1),
	IN `refill` TINYINT(2)
)
BEGIN
	INSERT INTO `sophic_medical`.`prescription` (
		`date_written`,
		`patient`,
		`physician`,
		`medication_name`,
		`admin_route`,
		`admin_method`,
		`admin_device`,
		`admin_site`,
		`frequency`,
        `is_prn`,
		`strength_amount`,
		`strength_uom`,
		`measure_amount`,
		`measure_uom`,
		`volume`,
		`container_uom`,
        `prescribed_qty`,
		`daw`,
		`refill`)
	VALUES (
		`date_written`,
		`patient`,
		`physician`,
		`medication_name`,
		`admin_route`,
		`admin_method`,
		`admin_device`,
		`admin_site`,
		`frequency`,
        `is_prn`,
		`strength_amount`,
		`strength_uom`,
		`measure_amount`,
		`measure_uom`,
		`volume`,
		`container_uom`,
        `prescribed_qty`,
		`daw`,
		`refill`
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_signal_strength` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_signal_strength`(
/*  Name:  insert_signal_strength
**  Date: 2017-04-20
**  Notes: Inserts signal strength values
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_id_par` INT(11),
    IN `datetime_par` DATETIME,
    IN `rssi_par` TINYINT(2),
    IN `ber_par` TINYINT(2)
)
BEGIN
	INSERT INTO `signal_strength` (`device`, `datetime`, `rssi`, `ber`)
    VALUES (`device_id_par`, `datetime_par`, `rssi_par`, `ber_par`) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_transaction`(
/*  Name:  insert_transaction
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `transaction_status_par` VARCHAR(16),
	IN `recognition_status_par` VARCHAR(16),
	IN `scheduled_datetime_par` DATETIME,
	IN `execute_datetime_par` DATETIME,
	IN `executed_datetime_par` DATETIME,
	IN `bin_par` VARCHAR(16),
    IN `schedule_par` BIGINT(18)
)
BEGIN
	
	DECLARE `transaction_var` BIGINT(18) DEFAULT NULL;
    DECLARE `device_var` INT DEFAULT NULL;
    DECLARE `patient_var` INT DEFAULT NULL;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
	START TRANSACTION;
		SELECT P.patient, S.device 
			INTO `patient_var`, `device_var` 
		FROM `sophic_medical`.`schedule` S
			INNER JOIN `sophic_medical`.prescription P			
				ON S.prescription = P.id
		WHERE S.id = `schedule_par`;        

    
		SELECT DISTINCT T.id   
        INTO `transaction_var` 
		FROM `sophic_medical`.`transaction` T
			INNER JOIN `sophic_medical`.`schedule__transaction` ST
				ON T.id = ST.transaction
			INNER JOIN `sophic_medical`.`schedule` S
				ON S.id = ST.schedule
			INNER JOIN `sophic_medical`.`prescription` P
				ON P.id = S.prescription
		WHERE T.scheduled_datetime = `scheduled_datetime_par`
				AND S.device = `device_var` 
				AND P.patient = `patient_var`
		LIMIT 1;

		IF `transaction_var` IS NULL THEN
		 	
			INSERT INTO `sophic_medical`.`transaction` (
				`transaction_status`,
				`recognition_status`,
				`scheduled_datetime`,
				`execute_datetime`,
				`executed_datetime`
			)
			VALUES (
				`transaction_status_par`,
				`recognition_status_par`,
				`scheduled_datetime_par`,
				`execute_datetime_par`,
				`executed_datetime_par`
			);
			
			SET `transaction_var` = LAST_INSERT_ID();
		ELSE
			UPDATE `sophic_medical`.`transaction` 
			    SET `transaction_status` = `transaction_status_par`,
				`recognition_status` = `recognition_status_par`,
				`scheduled_datetime` = `scheduled_datetime_par`,
				`execute_datetime` = `execute_datetime_par`,
				`executed_datetime` = `executed_datetime_par`
           WHERE `transaction`.id = `transaction_var`;
			
        END IF;
        
		INSERT INTO `sophic_medical`.`schedule__transaction` (
			`schedule`,
			`transaction`,
			`bin`
		)
		VALUES (
			`schedule_par`,
			`transaction_var`,
			`bin_par`
		);

		SELECT `transaction_var` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
 	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `insert_user`(
/*  Name:  insert_user
**  Date: 2017-07-16
**  Notes: 
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
    IN `user_name` varchar(45),
    IN `user_password` varchar(45),
    IN `user_first_name` varchar(45),
    IN `user_last_name` varchar(45),
    IN `user_salutation` varchar(45),
	IN `user_notification_email_enabled` char(1),
	IN `user_notification_email_addresses` json,
	IN `user_notification_sms_enabled` char(1),
	IN `user_notification_sms_phones` json,
	IN `user_notification_call_enabled` char(1),
	IN `user_notification_call_phones` json,
    IN `user_temperature_format` char(1),
    IN `user_is_admin` char(1),
    IN `user_is_active` char(1)
)
BEGIN
	INSERT INTO `user` (
        `name`,
        `password`,
        `first_name`,
        `last_name`,
        `salutation`,
        `notification_email_enabled`,
        `notification_email_addresses`,
        `notification_sms_enabled`,
        `notification_sms_phones`,
        `notification_call_enabled`,
        `notification_call_phones`,
        `temperature_format`,
        `is_admin`,
        `is_active`
	)
    VALUES (
        `user_name`, 
        `user_password`,
        `user_first_name`,
        `user_last_name`,
        `user_salutation`,
        `user_notification_email_enabled`,
        `user_notification_email_addresses`,
        `user_notification_sms_enabled`,
        `user_notification_sms_phones`,
        `user_notification_call_enabled`,
        `user_notification_call_phones`,
        `temperature_format`,
        `is_admin`,
        `is_active`
	) ;
    SELECT last_insert_id() AS `user_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_bins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `load_bins`(
/*  Name:  load_bins
**  Notes: load bins to cartridge  
**  Date 2016-10-5
**
** examples of using:
** 
** CALL `sophic_medical`.`load_bins`('A9C6DF8E32', '[[200, "A1B2C3D4E5", 1], [100, "A2C4D6F8E0", 3]]');
** CALL `sophic_medical`.`load_bins`('A9C6DF8E32e', '[[10, "A1B2C3D4E5", 1], [5, "A2C4D6F8E0", 3]]');
** CALL `sophic_medical`.`load_bins`('A9C6DF8E32', '[]');
** CALL `sophic_medical`.`load_bins`('A9C6DF8E32', '[[10, "A1B2C3D4E5", 1]]');
**
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN cartridge_code VARCHAR(16), -- column `code` from `cartridge` table
	IN bin_ary JSON -- array of triples [[shedule__transaction, bin, slot],...]. For example [[100, "A1B2C3D4E5", 1], ["A2C4D6F8E0", 2]]
-- 						where 'shedule__transaction' is column 'id' from `shedule__transaction` table 
-- 						`bin` is column `code` from table `bin`
-- 						`slot` is integer between 1 and 12
-- 
/*
** output: table which consists of one row with information about error code 
**     -------------------------------------------------------------
**    |             id                |  err_code  |  msg          |  
**    |-------------------------------------------------------------
**    | id of row in cartrige__device |     0	   |	  Ok	   |  transaction finished succesfully
**    |-------------------------------------------------------------
**    |        0                      | Error Code | error message |  something was wrong
**    --------------------------------------------------------------
**
*/
)
BEGIN
	-- DECLARE cartrige__device_id BIGINT(18);
	-- DECLARE cartridge_exists BOOLEAN DEFAULT FALSE;
	DECLARE bin_exists BOOLEAN DEFAULT FALSE;
	DECLARE sch_tran_exists BOOLEAN DEFAULT FALSE;


    DECLARE tbs_cnt INT DEFAULT(JSON_LENGTH(bin_ary));
    DECLARE i INT;
    DECLARE schedule_transaction_id BIGINT(18);
    DECLARE bin_code VARCHAR(16);
    DECLARE slot_var INT;
    
    DECLARE path VARCHAR(250);
    DECLARE schedule_cnt INT;
    DECLARE bin_cnt INT;
    
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
    START TRANSACTION;
		SET i = 0;
		
		WHILE i < tbs_cnt DO
			SET path = CONCAT('$[', CAST(i AS CHAR), '][0]');
			SET schedule_transaction_id = JSON_EXTRACT(bin_ary, path);

			SET path = CONCAT('$[', CAST(i AS CHAR), '][1]');
			SET bin_code = JSON_EXTRACT(bin_ary, path); -- returned id is surraunded with double quotes "A1B2C3D4E5"
			SET bin_code = SUBSTRING(bin_code, 2, LENGTH(bin_code) - 2); -- clear id

			SET path = CONCAT('$[', CAST(i AS CHAR), '][2]');
			SET slot_var = JSON_EXTRACT(bin_ary, path);
			
			-- update bin
            SET bin_exists = EXISTS(SELECT * FROM sophic_medical.bin WHERE code = bin_code);
			-- TODO: check that the slot is free
            IF bin_exists = TRUE THEN
				UPDATE sophic_medical.bin SET loaded_datetime = now(),
                        loaded_to_slot = slot_var,
                        loaded_to_cartridge = cartridge_code
                WHERE sophic_medical.bin.code = bin_code;        
			ELSE
				SET msg = CONCAT('Bin with id = ', bin_code, ' does not exist');	
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
			END IF;
            -- TODO: can not be more then 1 bin related with slot
            
            -- update schedule-transaction
            SET sch_tran_exists = EXISTS(SELECT * FROM sophic_medical.schedule__transaction WHERE `id` = schedule_transaction_id);						
			IF sch_tran_exists = TRUE THEN
				UPDATE sophic_medical.schedule__transaction SET bin = bin_code
                WHERE `id` = schedule_transaction_id;
			ELSE
				SET msg = CONCAT('Schedule-transaction with id = ', schedule_transaction_id, ' does not exist');	
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
			END IF;		
            
-- 			-- CHECK: There are no more than 3 schedule-transaction (hence no more than 3 medications) are related to one bin.
-- 			SELECT COUNT(DISTINCT ST.schedule) AS schedule_cnt INTO schedule_cnt
-- 			FROM bin__cartridge BC JOIN schedule__transaction ST ON BC.transaction = ST.transaction 
-- 			WHERE BC.bin = bin_id;    
-- 			
--             IF schedule_cnt > 3 THEN
-- 				SET msg = CONCAT('There are more then 3 schedules for bin ', bin_id);
-- 				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
-- 			END IF;
--  

			SET i = i + 1;

		END WHILE;
        
		SELECT cartridge_code AS 'id', 0 AS 'err_code', 'OK' AS 'msg';

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_cartridge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `load_cartridge`(
/*  Name:  load_cartridge
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


	IN device_id_par INT(11), 
	IN cartridge_code VARCHAR(16) 

)
BEGIN
	DECLARE cartridge_exists BOOLEAN DEFAULT FALSE;
    DECLARE `$task_id` BIGINT(18) DEFAULT NULL;
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS 'id', `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
    START TRANSACTION;
		
		SET cartridge_exists = EXISTS(SELECT * FROM sophic_medical.cartridge WHERE code = cartridge_code);
    	
        IF cartridge_exists = TRUE THEN
			UPDATE cartridge 
				SET loaded_to_device = device_id_par,
					loaded_datetime = now()
            WHERE code = cartridge_code;
		ELSE
			SET msg = CONCAT('Cartridge with code = ', cartridge_code, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;
        
		-- Sync with Isabella
		CALL create_sync_task_wt(device_id_par, `$task_id`);
                
		SELECT cartridge_code AS 'id', 0 AS 'err_code', 'OK' AS 'msg';

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_area` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_area`(
/*  Name:  select_area
**  Date: 2017-07-19
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

)
BEGIN
	SELECT `area`.`id`,
		`area`.`name`,
		`area`.`household` AS `household_id`,
        `household`.`address` AS `household_address`,
        `area`.`is_active`,
		`area`.`last_modified`
	FROM `sophic_medical`.`area`
    JOIN `sophic_medical`.`household` ON `household`.`id` = `area`.`household`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_area_by_household` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_area_by_household`(
/*  Name:  select_area_by_household
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


IN `household_id` INT(11)
)
BEGIN
	SELECT `area`.`id`,
		`area`.`name`,
		`area`.`household`,
        `area`.`is_active`,
		`area`.`last_modified`
	FROM `sophic_medical`.`area`
    WHERE `area`.`household` = `household_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_area_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_area_by_id`(
/*  Name:  select_area_by_id
**  Date: 2017-07-19
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `area_id` INT(11)
)
BEGIN
	SELECT `area`.`id`,
		`area`.`name`,
		`area`.`household` AS `household_id`,
        `household`.`address` AS `household_address`,
        `area`.`is_active`,
		`area`.`last_modified`
	FROM `sophic_medical`.`area`
    JOIN `sophic_medical`.`household` ON `household`.`id` = `area`.`household`
    WHERE `area`.`id` = `area_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_bin_by_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_bin_by_code`(
/*  Name:  select_bin_by_code
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `bin_code` VARCHAR(16)
)
BEGIN
	SELECT B.`code` AS `code`,
		B.`color` AS `color`,
        BC.`name` AS `color_name`,
        B.`loaded_datetime` AS `loaded_datetime`,
        B.`loaded_to_slot` AS `loaded_to_slot`,
        C.`code` AS `loaded_to_cartridge`,
        B.`scanned_datetime` AS `scanned_datetime`,
        B.`scanned_in_slot` AS `scanned_in_slot`,
        D.`id` AS `loaded_to_device`
	FROM `sophic_medical`.`bin` B
    JOIN `sophic_medical`.`bin_color` BC ON BC.`code` = B.`color`
    LEFT JOIN `sophic_medical`.`cartridge` C ON C.`code` = B.`loaded_to_cartridge`
    LEFT JOIN `sophic_medical`.`device` D ON C.`loaded_to_device` = D.`id`
    WHERE B.`code` = `bin_code`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_caregivers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_caregivers`(
/*  Name:  select_caregivers
**  Date: 2017-02-21
**  Notes: Returns ids of all active users (caregivers) related to particular patient
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `patient_id` INT(11)
)
BEGIN
	SELECT U.`id`
	FROM `sophic_medical`.`user` U
    JOIN `sophic_medical`.`user__household` UH ON UH.`user` = U.`id`
    JOIN `sophic_medical`.`patient__household` PH ON PH.`household` = UH.`household`
    JOIN `sophic_medical`.`patient` P ON P.`id` = PH.`patient`
    WHERE P.`id` = `patient_id`
    AND U.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_caregivers_by_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_caregivers_by_device`(
/*  Name:  select_caregivers_by_device
**  Date: 2017-05-25
**  Notes: Returns ids of all active users (caregivers) related to particular device
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `device_id` INT(11)
)
BEGIN
	SELECT U.`id`
	FROM `sophic_medical`.`user` U
    JOIN `sophic_medical`.`user__household` UH ON UH.`user` = U.`id`
    JOIN `sophic_medical`.`device` D on D.`id` = UH.`household`
    WHERE D.`id` = `device_id`
    AND U.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_cartridge_by_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_cartridge_by_code`(
/*  Name:  select_cartridge_by_code
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `cartridge_code` VARCHAR(16)
)
BEGIN
	SELECT `cartridge`.`code`
	FROM `sophic_medical`.`cartridge`
    WHERE `cartridge`.`code` = `cartridge_code`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_city`(
/*  Name:  select_city
**  Date: 2017-07-19
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

)
BEGIN
	SELECT `city`.`id`,
		`city`.`name`,
		`city`.`region` AS `region_id`,
        `region`.`name` AS `region_name`,
		`region`.`timezone` AS `region_timezone`
	FROM `sophic_medical`.`city`
    JOIN `sophic_medical`.`region` ON `region`.`id` = `city`.`region`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_daw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_daw`(
/*  Name:  select_daw
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



)
BEGIN
	SELECT `daw`.`code`,
		`daw`.`title`,
		`daw`.`description`,
		`daw`.`last_modified`
	FROM `sophic_medical`.`daw`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device`(
/*  Name:  select_device
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



)
BEGIN
	SELECT `device`.`id`,
		`device`.`area`,
		`device`.`position`,
		`area`.`name` AS `area_name`,
        `household`.`address` AS `household_address`,
        `device`.`is_active`
	FROM `sophic_medical`.`device`
    JOIN `sophic_medical`.`area` ON `area`.`id` = `device`.`area`
    JOIN `sophic_medical`.`household` ON `household`.`id` = `area`.`household`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_action_notrcg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_action_notrcg`(
/*  Name:  select_device_action_notrcg
**  Date: 2016-12-10
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
)
BEGIN
	SELECT `device_action_notrcg`.`code`,
		`device_action_notrcg`.`description`
	FROM `sophic_medical`.`device_action_notrcg`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_by_area` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_by_area`(
/*  Name:  select_device_by_area
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



IN `area_id` INT(11))
BEGIN
	SELECT `device`.`id`,
		`device`.`area`,
		`device`.`position`,
		`device`.`last_modified`
	FROM `sophic_medical`.`device`
	WHERE `device`.`area` = `area_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_by_id`(
/*  Name:  select_device_by_id
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `device_id` INT(11)
)
BEGIN
	SELECT `device`.`id`,
		`device`.`area`,
		`device`.`position`,
        `device`.`modem_number`,
        `device`.`modem_status`,
		`device`.`modem_offline_timeout`,
        `device`.`modem_behavior`,
        `device_modem_behavior`.`description` AS `modem_behavior_desc`,
        (SELECT COUNT(`id`) 
			FROM `sophic_medical`.`task` 
            WHERE `device` = `device_id` 
				AND `task_type` = 'ONLINE'
                AND (`execute_status` = 'S' OR `execute_status` = 'P')) AS `modem_online_running_tasks`,
        (SELECT COUNT(`id`) 
			FROM `sophic_medical`.`task` 
            WHERE `device` = `device_id` 
				AND `task_type` = 'OFFLINE'
                AND (`execute_status` = 'S' OR `execute_status` = 'P'))  AS `modem_offline_running_tasks`,
		`device`.`wifi_enabled`,
		`device`.`wifi_ssid`,
        `device`.`wifi_security`,
        `device_wifi_security`.`name` AS `wifi_security_name`,
		`device`.`wifi_key`,
		`area`.`name` AS `area_name`,
        `household`.`address` AS `household_address`,
        `region`.`timezone` AS `timezone`,
        `device`.`is_active`
	FROM `sophic_medical`.`device`
    JOIN `sophic_medical`.`area` ON `area`.`id` = `device`.`area`
    JOIN `sophic_medical`.`household` ON `household`.`id` = `area`.`household`
    JOIN `sophic_medical`.`city` ON `city`.`id` = `household`.`city`
    JOIN `sophic_medical`.`region` ON `region`.`id` = `city`.`region`
    JOIN `sophic_medical`.`device_modem_behavior` ON `device_modem_behavior`.`code` = `device`.`modem_behavior`
    JOIN `sophic_medical`.`device_wifi_security` ON `device_wifi_security`.`code` = `device`.`wifi_security`
    WHERE `device`.`id` = `device_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_by_patient`(
/*  Name:  select_device_by_patient
**  Date: 2017-07-09
**  Notes: Returns all active devices which specified patient is related to
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


  IN `patient_id` INT(11)
)
BEGIN
	SELECT DISTINCT `device`.`id`,
		`device`.`area`,
		`device`.`position`,
        `device`.`modem_status`,
		`area`.`name` AS `area_name`,
        `household`.`address` AS `household_address`,
        `region`.`timezone` AS `timezone`
	FROM `sophic_medical`.`device`
    JOIN `sophic_medical`.`area` ON `area`.`id` = `device`.`area`
    JOIN `sophic_medical`.`household` ON `household`.`id` = `area`.`household`
    JOIN `sophic_medical`.`city` ON `city`.`id` = `household`.`city`
    JOIN `sophic_medical`.`region` ON `region`.`id` = `city`.`region`
    JOIN `sophic_medical`.`patient__household` ON `patient__household`.`household` = `household`.`id`
    WHERE `patient__household`.`patient` = `patient_id`
    AND `device`.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_by_user`(
/*  Name:  select_device_by_user
**  Date: 2016-11-05
**  Notes: Returns all active devices which specified user (caregiver) has access to
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/


  IN `user_id` INT(11)
)
BEGIN
	SELECT DISTINCT `device`.`id`,
		`device`.`area`,
		`device`.`position`,
        `device`.`modem_status`,
		`area`.`name` AS `area_name`,
        `household`.`address` AS `household_address`
	FROM `sophic_medical`.`device`
    JOIN `sophic_medical`.`area` ON `area`.`id` = `device`.`area`
    JOIN `sophic_medical`.`household` ON `household`.`id` = `area`.`household`
    JOIN `sophic_medical`.`user__household` ON `user__household`.`household` = `household`.`id`
    WHERE `user__household`.`user` = `user_id`
    AND `device`.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_modem_behavior` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_modem_behavior`(
/*  Name:  select_device_modem_behavior
**  Date: 2016-12-10
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
)
BEGIN
	SELECT `device_modem_behavior`.`code`,
		`device_modem_behavior`.`description`
	FROM `sophic_medical`.`device_modem_behavior`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_modem_local_traffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_modem_local_traffic`(
/*  Name:  select_device_modem_local_traffic
**  Created: 2017-08-29
**  Notes: Returns bytes counter values for the specified device and preiod of time
**  (and one value preceding the period to calculate the difference with the first value of the specified period)
**  
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
    IN device_id_par INT(11), -- device id
	IN start_datetime_par DATETIME, -- period start datetime
	IN stop_datetime_par DATETIME -- period end datetime
)
BEGIN

	(
		SELECT t.`datetime`,
			t.`rx_bytes_counter`,
            t.`tx_bytes_counter`
		FROM `sophic_medical`.`device_modem_local_traffic` t
			WHERE t.`datetime` < start_datetime_par
				AND t.`device` = device_id_par
		ORDER BY t.`datetime` DESC
		LIMIT 0, 1
    )
    
    UNION
 
	(
		SELECT t.`datetime`,
			t.`rx_bytes_counter`,
            t.`tx_bytes_counter`
		FROM `sophic_medical`.`device_modem_local_traffic` t
		WHERE t.`datetime` >= start_datetime_par
			AND t.`datetime` <= stop_datetime_par
            AND t.`device` = device_id_par
		ORDER BY t.`datetime`
	);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_modem_provider_traffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_modem_provider_traffic`(
/*  Name:  select_device_modem_provider_traffic
**  Created: 2017-08-24
**  Notes: Returns bytes counter values for the specified device and preiod of time
**  (and one value preceding the period to calculate the difference with the first value of the specified period)
**  
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
    IN device_id_par INT(11), -- device id
	IN start_datetime_par DATETIME, -- period start datetime
	IN stop_datetime_par DATETIME -- period end datetime
)
BEGIN

	(
		SELECT t.`datetime`,
			t.`bytes_counter`
		FROM `sophic_medical`.`device_modem_provider_traffic` t
			WHERE t.`datetime` < start_datetime_par
				AND t.`device` = device_id_par
		ORDER BY t.`datetime` DESC
		LIMIT 0, 1
    )
    
    UNION
 
	(
		SELECT t.`datetime`,
			t.`bytes_counter`
		FROM `sophic_medical`.`device_modem_provider_traffic` t
		WHERE t.`datetime` >= start_datetime_par
			AND t.`datetime` <= stop_datetime_par
            AND t.`device` = device_id_par
		ORDER BY t.`datetime`
	);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_temperature` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_temperature`(
/*  Name:  select_device_temperature
**  Date: 2017-05-17
**  Notes: returns device temperature values for the specified device and date
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_id` INT(11),
    IN `datetime_start` DATETIME,
    IN `datetime_stop` DATETIME
)
BEGIN
	SELECT t.`id`,
		t.`datetime`,
		t.`temperature_c`
	FROM `sophic_medical`.`device_temperature` t
    WHERE t.`device` = `device_id`
      AND t.`datetime` >= `datetime_start`
      AND t.`datetime` <= `datetime_stop`
	ORDER BY t.`datetime` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_wifi_local_traffic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_wifi_local_traffic`(
/*  Name:  select_device_wifi_local_traffic
**  Created: 2017-08-29
**  Notes: Returns bytes counter values for the specified device and preiod of time
**  (and one value preceding the period to calculate the difference with the first value of the specified period)
**  
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	
    IN device_id_par INT(11), -- device id
	IN start_datetime_par DATETIME, -- period start datetime
	IN stop_datetime_par DATETIME -- period end datetime
)
BEGIN

	(
		SELECT t.`datetime`,
			t.`rx_bytes_counter`,
            t.`tx_bytes_counter`
		FROM `sophic_medical`.`select_device_wifi_local_traffic` t
			WHERE t.`datetime` < start_datetime_par
				AND t.`device` = device_id_par
		ORDER BY t.`datetime` DESC
		LIMIT 0, 1
    )
    
    UNION
 
	(
		SELECT t.`datetime`,
			t.`rx_bytes_counter`,
            t.`tx_bytes_counter`
		FROM `sophic_medical`.`select_device_wifi_local_traffic` t
		WHERE t.`datetime` >= start_datetime_par
			AND t.`datetime` <= stop_datetime_par
            AND t.`device` = device_id_par
		ORDER BY t.`datetime`
	);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_device_wifi_security` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_device_wifi_security`(
/*  Name:  select_device_wifi_security
**  Date: 2018-01-25
**  Notes:
**
**  Copyright (c) 2018
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
)
BEGIN
	SELECT `device_wifi_security`.`code`,
		`device_wifi_security`.`name`
	FROM `sophic_medical`.`device_wifi_security`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_drug_drug_interaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_drug_drug_interaction`(
/*  Name:  select_drug_drug_interaction
**  Date: 2016-12-05
**  Notes:   
**  Updated:
**  2016-12-07: is_deleted replaced on is_discontinued
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$drug` VARCHAR(50), 
    IN `$patient` INT(11)
)
BEGIN
	DECLARE `$done` INT DEFAULT FALSE;
    DECLARE `$medication_name` VARCHAR(50);
    DECLARE `$class_id_1`, `$class_id_2` VARCHAR(5);
    DECLARE `$interaction_cnt` INT;
    
    DECLARE `$cur` CURSOR FOR
		SELECT DISTINCT `medication_name`, M.`CLASSID` AS medication_classid, 
			D.`CLASSID` AS drug_classid ,
			(SELECT COUNT(*)   
				FROM `medispan`.`M01INTERACTIONMAINFILE_G` I
 				WHERE I.CLASSID1 = `medication_classid` AND I.CLASSID2 = drug_classid) AS cnt
-- 			EXISTS(SELECT *   
-- 				FROM `medispan`.`M01INTERACTIONMAINFILE_G` I
--  				WHERE I.CLASSID1 = `medication_classid` AND I.CLASSID2 = drug_classid) AS cnt

		FROM
			(
				SELECT 
					P.`medication_name`, 
					N.`Drug_Name`,
					`CLS`.`CLASSID`
                    -- I.`CLASSID2`
				FROM  
					`medispan`.MF2NAME_F N
					JOIN `medispan`.MF2NDC_H NDC
						ON N.Drug_Descriptor_Identifier = NDC.Drug_Descriptor_Identifier
					JOIN `medispan`.NDC2KDC_A KDC
						ON NDC.NDC_UPC_HRI = KDC.NDC
					JOIN `medispan`.`D01CLASS_C` `CLS`
						ON KDC.KDC1 = CLS.KDC1
					JOIN `sophic_medical`.`prescription` P
						ON P.`medication_short_name`= `N`.`Drug_Name`
                    -- JOIN `medispan`.`M01INTERACTIONMAINFILE_G` I
					-- 	ON I.CLASSID1 = CLS.`CLASSID`
				WHERE P.`patient` = `$patient`
				  AND P.`is_discontinued` = 'N'
/*
				SELECT 
					P.`medication_name`, 
					D.`DrugName`,
					C.`CLASSID`
				FROM `medispan`.`D01CLASS_C` C
					JOIN `medispan`.`DRUGNAME2KDC_B` D ON D.`KDC1` = C.`KDC1`
					JOIN `sophic_medical`.`prescription` P
						ON P.`medication_short_name`= D.`DrugName`
						-- ON SUBSTRING_INDEX(P.`medication_name`, ' ', 1) = D.`DrugName`= D.`DrugName`
				WHERE P.`patient` = `$patient`
				  AND P.`is_discontinued` = 'N'
*/                  
			) AS M
            JOIN
            (
				SELECT DISTINCT N.`Drug_Name`, `CLS`.`CLASSID` 
				FROM 
					`medispan`.MF2NAME_F N
					JOIN `medispan`.MF2NDC_H NDC
						ON N.Drug_Descriptor_Identifier = NDC.Drug_Descriptor_Identifier
					JOIN `medispan`.NDC2KDC_A KDC
						ON NDC.NDC_UPC_HRI = KDC.NDC
					 JOIN `medispan`.`D01CLASS_C` `CLS`
						ON KDC.KDC1 = CLS.KDC1
				WHERE N.`Drug_Name` = `$drug`            
            /*
				SELECT `drugname2kdc`.`DrugName`,
					`class`.`CLASSID` 
				FROM `medispan`.`D01CLASS_C` `class`
					JOIN `medispan`.`DRUGNAME2KDC_B` `drugname2kdc` 
						ON `drugname2kdc`.`KDC1` = `class`.`KDC1`
				WHERE trim(`drugname2kdc`.`DrugName`) = `$drug`
                -- 'Warfarin'
                */
			) AS D
            -- ON M.`CLASSID2` = D.`CLASSID`
            ;
-- 		WHERE (SELECT COUNT(*)   
-- 				FROM `medispan`.`M01INTERACTIONMAINFILE_G` I
-- 				WHERE I.CLASSID1 = M.`CLASSID` AND I.CLASSID2 = D.`CLASSID`) > 0;
 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$done` = TRUE;
    -- TRUNCATE TABLE log_tbl;
	
    DROP TEMPORARY TABLE IF EXISTS res_tbl;
    CREATE TEMPORARY TABLE `sophic_medical`.`res_tbl`
    (
		medication_name VARCHAR(50),
        actual_text TEXT
    );
    
    OPEN `$cur`;
    read_loop: LOOP
		FETCH `$cur` INTO `$medication_name`, `$class_id_1`, `$class_id_2` , `$interaction_cnt`;
		
		IF `$done` THEN
			LEAVE read_loop;
		END IF;

		 IF `$interaction_cnt` > 0 THEN
			INSERT INTO `sophic_medical`.`res_tbl`(medication_name, actual_text)
				SELECT `$medication_name`, group_concat(ActualText  ORDER BY a.`ID` SEPARATOR '') 
					FROM `medispan`.`M01INTERACTIONMONOGRAPHS_I` a 
					WHERE a.CLASSID1 = `$class_id_1` 
							AND a.CLASSID2 = `$class_id_2` 
							AND a.TextName = 'WAR';
		 END IF;
	END LOOP;
    CLOSE `$cur`;
	SELECT * FROM `sophic_medical`.`res_tbl`;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_drug_drug_interaction2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_drug_drug_interaction2`(
/*  Name:  select_drug_drug_interaction
**  Date: 2016-12-05
**  Notes:   
**  Updated:
**  2016-12-07: is_deleted replaced on is_discontinued
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$drug` VARCHAR(50), 
    IN `$patient` INT(11)
)
BEGIN
	DECLARE `$done` INT DEFAULT FALSE;
    DECLARE `$medication_name` VARCHAR(50);
    DECLARE `$class_id_1`, `$class_id_2` VARCHAR(5);
    DECLARE `$interaction_cnt` INT;
    
    DECLARE `$cur` CURSOR FOR
		SELECT `medication_name`, M.`CLASSID` AS medication_classid, 
			D.`CLASSID` AS drug_classid -- ,
-- 			(SELECT COUNT(*)   
-- 				FROM `medispan`.`M01INTERACTIONMAINFILE_G` a
-- 				WHERE a.CLASSID1 = `medication_classid` AND a.CLASSID2 = drug_classid) AS cnt
		FROM
			(
				SELECT 
					P.`medication_name`, 
					D.`DrugName`,
					C.`CLASSID`
				FROM `medispan`.`D01CLASS_C` C
					JOIN `medispan`.`DRUGNAME2KDC_B` D ON D.`KDC1` = C.`KDC1`
					JOIN `sophic_medical`.`prescription` P
						ON P.`medication_short_name`= D.`DrugName`
						-- ON SUBSTRING_INDEX(P.`medication_name`, ' ', 1) = D.`DrugName`= D.`DrugName`
				WHERE P.`patient` = `$patient`
				  AND P.`is_discontinued` = 'N'
			) AS M,
			(
				SELECT `drugname2kdc`.`DrugName`,
					`class`.`CLASSID` 
				FROM `medispan`.`D01CLASS_C` `class`
					JOIN `medispan`.`DRUGNAME2KDC_B` `drugname2kdc` 
						ON `drugname2kdc`.`KDC1` = `class`.`KDC1`
				WHERE `drugname2kdc`.`DrugName` = `$drug`
                -- 'Warfarin'
			) AS D
            
            WHERE (SELECT COUNT(*)   
				FROM `medispan`.`M01INTERACTIONMAINFILE_G` a
				WHERE a.CLASSID1 = M.`CLASSID` AND a.CLASSID2 = D.`CLASSID`) > 0          
            
            ;
    

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$done` = TRUE;
    -- TRUNCATE TABLE log_tbl;
	
    DROP TEMPORARY TABLE IF EXISTS res_tbl;
    CREATE TEMPORARY TABLE `sophic_medical`.`res_tbl`
    (
		medication_name VARCHAR(50),
        actual_text TEXT
    );
    
    OPEN `$cur`;
    read_loop: LOOP
		FETCH `$cur` INTO `$medication_name`, `$class_id_1`, `$class_id_2`; -- , `$interaction_cnt`;
		
		IF `$done` THEN
			LEAVE read_loop;
		END IF;

		-- IF `$interaction_cnt` > 0 THEN
			INSERT INTO `sophic_medical`.`res_tbl`(medication_name, actual_text)
				SELECT `$medication_name`, group_concat(ActualText  ORDER BY a.`ID` SEPARATOR '') 
					FROM `medispan`.`M01INTERACTIONMONOGRAPHS_I` a 
					WHERE a.CLASSID1 = `$class_id_1` 
							AND a.CLASSID2 = `$class_id_2` 
							AND a.TextName = 'WAR';
		-- END IF;
	END LOOP;
    CLOSE `$cur`;
	SELECT * FROM `sophic_medical`.`res_tbl`;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_drug_schedule_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_drug_schedule_item`(
/*  Name:  select_drug_schedule_item
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `patient_id` INT(11),
    IN `date_from` DATE,
    IN `date_to` DATE
)
BEGIN
	SELECT DISTINCT `transaction`.`id`,
		`transaction`.`transaction_direction`,
		`transaction`.`transaction_status`,
		`transaction`.`recognition_status`,
		`transaction`.`scheduled_datetime`,
		`transaction`.`execute_datetime`,
		`transaction`.`executed_datetime`,
		`schedule__transaction`.`bin`,
		`transaction`.`last_modified`
	FROM `sophic_medical`.`transaction`
    LEFT JOIN `sophic_medical`.`schedule__transaction` ON `schedule__transaction`.`transaction` = `transaction`.`id`
    LEFT JOIN `sophic_medical`.`schedule` ON `schedule`.`id` = `schedule__transaction`.`schedule`
    LEFT JOIN `sophic_medical`.`prescription` ON `prescription`.`id` = `schedule`.`prescription`
    WHERE `prescription`.`patient` = `patient_id`
      AND `transaction`.`scheduled_datetime` >= `date_from`
      AND `transaction`.`scheduled_datetime` <= DATE_ADD(`date_to`, INTERVAL 1 DAY);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_frequency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_frequency`(
/*  Name:  select_frequency
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
)
BEGIN
	SELECT `frequency`.`code`,
		`frequency`.`description`,
		`frequency`.`is_once_dose`,
		`frequency`.`is_continuous`,
		`frequency`.`secs_between_doses`,
		`frequency`.`mins_between_doses`,
		`frequency`.`hours_between_doses`,
		`frequency`.`days_between_doses`,
		`frequency`.`weeks_between_doses`,
		`frequency`.`months_between_doses`,
		`frequency`.`days_to_skip`,
		`frequency`.`give_mon`,
		`frequency`.`give_tue`,
		`frequency`.`give_wed`,
		`frequency`.`give_thu`,
		`frequency`.`give_fri`,
		`frequency`.`give_sat`,
		`frequency`.`give_sun`,
		`frequency`.`frequency_type`,
		`frequency`.`last_modified`,
        `frequency_type`.`continuous`
	FROM `sophic_medical`.`frequency` `frequency`
    LEFT JOIN `sophic_medical`.`frequency_type` `frequency_type` ON `frequency_type`.`code` = `frequency`.`frequency_type`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_frequency_by_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_frequency_by_code`(
/*  Name:  select_frequency_by_code
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `frequency_code` VARCHAR(10))
BEGIN
	SELECT `frequency`.`code`,
		`frequency`.`description`,
		`frequency`.`is_once_dose`,
		`frequency`.`is_continuous`,
		`frequency`.`secs_between_doses`,
		`frequency`.`mins_between_doses`,
		`frequency`.`hours_between_doses`,
		`frequency`.`days_between_doses`,
		`frequency`.`weeks_between_doses`,
		`frequency`.`months_between_doses`,
		`frequency`.`days_to_skip`,
		`frequency`.`give_mon`,
		`frequency`.`give_tue`,
		`frequency`.`give_wed`,
		`frequency`.`give_thu`,
		`frequency`.`give_fri`,
		`frequency`.`give_sat`,
		`frequency`.`give_sun`,
		`frequency`.`frequency_type`,
		`frequency`.`last_modified`,
        `frequency_type`.`continuous`
	FROM `sophic_medical`.`frequency` `frequency`
    LEFT JOIN `sophic_medical`.`frequency_type` `frequency_type` ON `frequency_type`.`code` = `frequency`.`frequency_type`
    WHERE `frequency`.`code` = `frequency_code`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_frequency_times_by_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_frequency_times_by_code`(
/*  Name:  select_frequency_times_by_code
**  Created: 2016-11-05
**  Updated: 2016-12-16: frequency_id field was replaced to frequency 
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `frequency_code` VARCHAR(10))
BEGIN
	SELECT T.`time`
	FROM `sophic_medical`.`time` T 
    WHERE T.frequency = `frequency_code`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_household` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_household`(
/*  Name:  select_household
**  Date: 2017-07-17
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

)
BEGIN
	SELECT `household`.`id`,
		`household`.`address`,
		`household`.`description`,
        `household`.`is_active`,
		`household`.`last_modified`
	FROM `sophic_medical`.`household`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_household_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_household_by_id`(
/*  Name:  select_household_by_id
**  Date: 2017-07-19
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `household_id` INT(11)
)
BEGIN
	SELECT `household`.`id`,
		`household`.`address`,
		`household`.`city` AS `city_id`,
        `city`.`name` AS `city_name`,
        `household`.`description`,
        `household`.`is_active`,
		`household`.`last_modified`
	FROM `sophic_medical`.`household`
    JOIN `sophic_medical`.`city` ON `city`.`id` = `household`.`city`
    WHERE `household`.`id` = `household_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_household_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_household_by_patient`(
/*  Name:  select_household_by_patient
**  Date: 2017-07-17
**  Notes: Returns all active households which specified patient is related to
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `patient_id` INT(11))
BEGIN
	SELECT `household`.`id`,
		`household`.`address`,
		`household`.`description`,
		`household`.`last_modified`
	FROM `sophic_medical`.`household`
    LEFT JOIN `sophic_medical`.`patient__household` ON `patient__household`.`household` = `household`.`id`
    WHERE `patient__household`.`patient` = `patient_id`
    AND `household`.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_household_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_household_by_user`(
/*  Name:  select_household_by_user
**  Date: 2016-11-05
**  Notes: Returns all active households which specified user (caregiver) has access to
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `user_id` INT(11))
BEGIN
	SELECT `household`.`id`,
		`household`.`address`,
		`household`.`description`,
		`household`.`last_modified`
	FROM `sophic_medical`.`household`
    LEFT JOIN `sophic_medical`.`user__household` ON `user__household`.`household` = `household`.`id`
    WHERE `user__household`.`user` = `user_id`
    AND `household`.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_medication_by_pattern` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_medication_by_pattern`(
/*  Name:  select_medication_by_pattern
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `pattern` VARCHAR(50),
    IN `limit` SMALLINT(3)
)
BEGIN
	SELECT `drug_concat`.`drug_str` FROM
		(SELECT
			CONCAT_WS(
				' ',
				TRIM(`drug_name`.`Drug_Name`),
				TRIM(`drug_name`.`Dosage_Form`),
				TRIM(`drug_name`.`Strength`),
				TRIM(`drug_name`.`Strength_Unit_of_Measure`)
			) AS `drug_str`
		FROM `medispan`.`MF2NAME_F` `drug_name`) `drug_concat`
    WHERE `drug_concat`.`drug_str` LIKE CONCAT('%', `pattern`, '%')
    ORDER BY `drug_concat`.`drug_str`
    LIMIT `limit`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_notification_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_notification_data`(
/*  Name:  select_notification_data
**  Date: 2017-02-20
**  Notes: This stored proceure is used to get all needed data to create a notification message.
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `transaction_id` INT(11)
)
BEGIN
	SELECT P.`id`,
        P.`first_name`,
		P.`last_name`,
        PR.`medication_name`
	FROM `sophic_medical`.`transaction` T
    JOIN `sophic_medical`.`schedule__transaction` ST ON ST.`transaction` = T.`id`
    JOIN `sophic_medical`.`schedule` S ON S.`id` = ST.`schedule`
    JOIN `sophic_medical`.`prescription` PR ON PR.`id` = S.`prescription`
    JOIN `sophic_medical`.`patient` P ON P.`id` = PR.`patient`
    WHERE T.`id` = `transaction_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_patient`(
/*  Name:  select_patient
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
)
BEGIN
	SELECT `patient`.`id`,
		`patient`.`first_name`,
		`patient`.`last_name`,
		`patient`.`sex`,
		`patient`.`date_of_birth`,
		`patient`.`phone`,
		`patient`.`address`,
		`patient`.`ssn`,
        `patient`.`photo`,
		`patient`.`speaker_volume`,
        `patient`.`speaker_volume_prox`,
        `patient`.`audio_alerts_number`,
        `patient`.`audio_alerts_interval`,
        `patient`.`overdue_period`,
        `patient`.`action_notrcg`,
        `patient`.`is_active`,
		`patient`.`last_modified`
	FROM `sophic_medical`.`patient`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_patient_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_patient_activity`(
/*  Name:  select_patient_activity
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `user_id` INT(11),
    IN `date` DATE
)
BEGIN
	SELECT `activity`.`id`,
		`activity`.`datetime`,
		`patient`.`first_name`,
		`patient`.`last_name`,
		`activity_type`.`name`,
		`activity_class`.`name`,
		`area`.`id`,
		`area`.`name`,
		`patient_position`.`position`,
		`activity`.`message`
	FROM `sophic_medical`.`activity`
    LEFT JOIN `sophic_medical`.`activity_type` ON `activity_type`.`id` = `activity`.`activity_type`
    LEFT JOIN `sophic_medical`.`activity_class` ON `activity_class`.`id` = `activity_type`.`activity_class`
    LEFT JOIN `sophic_medical`.`patient` ON `patient`.`id` = `activity`.`patient`
    LEFT JOIN `sophic_medical`.`patient_position` ON `patient_position`.`id` = `activity`.`patient_position`
    LEFT JOIN `sophic_medical`.`area` ON `area`.`id` = `patient_position`.`area`
    LEFT JOIN `sophic_medical`.`patient__household` ON `patient__household`.`patient` = `activity`.`patient`
    LEFT JOIN `sophic_medical`.`user__household` ON `user__household`.`household` = `patient__household`.`household`
    WHERE `user__household`.`user` = `user_id`
      AND DATE(`activity`.`datetime`) = `date`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_patient_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_patient_by_id`(
/*  Name:  select_patient_by_id
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `patient_id` INT(11)
)
BEGIN
	SELECT `patient`.`id`,
		`patient`.`first_name`,
		`patient`.`last_name`,
		`patient`.`sex`,
		`patient`.`date_of_birth`,
		`patient`.`phone`,
		`patient`.`address`,
		`patient`.`ssn`,
		`patient`.`photo`,
        `patient`.`speaker_volume`,
        `patient`.`speaker_volume_prox`,
        `patient`.`audio_alerts_number`,
        `patient`.`audio_alerts_interval`,
        `patient`.`overdue_period`,
        `patient`.`action_notrcg`,
        `patient`.`is_active`,
		`patient`.`last_modified`
	FROM `sophic_medical`.`patient`
    WHERE `patient`.`id` = `patient_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_patient_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_patient_by_user`(
/*  Name:  select_patient_by_user
**  Date: 2016-11-05
**  Notes: Returns all active patients which specified user (caregiver) has access to
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `user_id` INT(11))
BEGIN


	SELECT DISTINCT `patient`.`id`,
		`patient`.`first_name`,
		`patient`.`last_name`,
		`patient`.`sex`,
		`patient`.`date_of_birth`,
		`patient`.`phone`,
		`patient`.`address`,
		`patient`.`ssn`,
		`patient`.`photo`,
        `patient`.`speaker_volume`,
        `patient`.`speaker_volume_prox`,
        `patient`.`audio_alerts_number`,
        `patient`.`audio_alerts_interval`,
        `patient`.`overdue_period`,
        `patient`.`action_notrcg`,
		`patient`.`last_modified`
	FROM `sophic_medical`.`patient`
	JOIN `sophic_medical`.`patient__household` ON `patient__household`.`patient` = `patient`.`id`
    JOIN `sophic_medical`.`user__household` ON `user__household`.`household` = `patient__household`.`household`
    WHERE `user__household`.`user` = `user_id`
    AND `patient`.`is_active` = 'Y';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_patient_position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_patient_position`(
/*  Name:  select_patient_position
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `patient_id` INT(11),
    IN `date` DATE
)
BEGIN
	SELECT `patient_position`.`id`,
		`patient_position`.`datetime`,
		`patient_position`.`patient`,
		`patient_position`.`area`,
		`patient_position`.`position`
	FROM `sophic_medical`.`patient_position`
    WHERE `patient_position`.`patient` = `patient_id`
      AND DATE(`patient_position`.`datetime`) = `date`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_physician` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_physician`(
/*  Name:  select_physician
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
)
BEGIN
	SELECT
		`physician`.`id`,
		CONCAT_WS(' ', `physician`.`first_name`, `physician`.`last_name`, `physician`.`degree`) AS `physician`
	FROM `sophic_medical`.`physician`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_physician_by_pattern` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_physician_by_pattern`(
/*  Name:  select_physician_by_pattern
**  Date: 2017-08-15
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `pattern` VARCHAR(50),
    IN `limit_local` SMALLINT(3),
    IN `limit_npi` SMALLINT(3)
)
BEGIN

	DECLARE `$prepared_pattern` TEXT DEFAULT '';

    SET `$prepared_pattern` = prepare_fulltext_pattern(`pattern`);

	SELECT * FROM
    
    (
    
		(
			SELECT
				`physician`.`prefix` AS `prefix`,
				`physician`.`first_name` AS `first_name`,
				`physician`.`middle_name` AS `middle_name`,
				`physician`.`last_name` AS `last_name`,
				`physician`.`suffix` AS `suffix`,
				`physician`.`address` AS `address`,
				`physician`.`phone` AS `phone`,
				`physician`.`npi_number` AS `npi`,
				`physician`.`id` AS `id`
			FROM `sophic_medical`.`physician`
			WHERE MATCH (
				`physician`.`prefix`,
				`physician`.`first_name`,
				`physician`.`middle_name`,
				`physician`.`last_name`,
				`physician`.`suffix`
			) AGAINST (`$prepared_pattern` IN BOOLEAN MODE)
			LIMIT `limit_local`
		)
			
		UNION DISTINCT
		
		(
			SELECT
				`npi`.`prefix` AS `prefix`,
				`npi`.`first_name` AS `first_name`,
				`npi`.`middle_name` AS `middle_name`,
				`npi`.`last_name` AS `last_name`,
				`npi`.`suffix` AS `suffix`,
				CONCAT_WS(
					', ',
					IF(LENGTH(`npi`.`address_1`), `npi`.`address_1`, NULL),
					IF(LENGTH(`npi`.`address_2`), `npi`.`address_2`, NULL),
					IF(LENGTH(`npi`.`city`), `npi`.`city`, NULL),
					IF(LENGTH(`npi`.`state`), `npi`.`state`, NULL)
				) AS `address`,
				`npi`.`phone` AS `phone`,
				`npi`.`npi` AS `npi`,
				NULL AS `id`
			FROM `npi`.`npi`
			WHERE MATCH (
				`npi`.`prefix`,
				`npi`.`first_name`,
				`npi`.`middle_name`,
				`npi`.`last_name`,
				`npi`.`suffix`
			) AGAINST (`$prepared_pattern` IN BOOLEAN MODE)
			LIMIT `limit_npi`
		)
    
    ) AS `combined`;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_prescription_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_prescription_by_id`(
/*  Name:  select_prescription_by_id
**  Date: 2016-11-05
**  Notes:
**	Updated:
**  2016-12-07 - replaced is_deleted on is_discontinued
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `prescription_id` BIGINT(18)
)
BEGIN

	SELECT `prescription`.`id`,
		`prescription`.`date_written`,
		`prescription`.`patient`,
		`prescription`.`physician`,
		`prescription`.`medication_name`,
		`prescription`.`admin_route`,
		`prescription`.`admin_method`,
		`prescription`.`admin_device`,
		`prescription`.`admin_site`,
		`prescription`.`frequency`,
        `prescription`.`is_prn`,
		`prescription`.`strength_amount`,
		`prescription`.`strength_uom`,
		`prescription`.`measure_amount`,
		`prescription`.`measure_uom`,
		`prescription`.`volume`,
		`prescription`.`container_uom`,
		`prescription`.`prescribed_qty`,
		`prescription`.`daw`,
		`prescription`.`refill`,
        `prescription`.`is_discontinued`,
        COUNT(`schedule`.`id`) AS `schedule_cnt`
	FROM `sophic_medical`.`prescription`
    LEFT JOIN `sophic_medical`.`schedule` ON `schedule`.`prescription` = `prescription`.`id`
	WHERE `prescription`.`id` = `prescription_id`
    GROUP BY(`prescription`.`id`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_prescription_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_prescription_by_patient`(
/*  Name:  select_prescription_by_patient
**  Date: 2016-11-05
**  Notes:
**	Updated:
**  2016-12-07 - replaced is_deleted on is_discontinued
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `patient_id` INT(11)
)
BEGIN

	SELECT P.`id`,
		P.`date_written`,
		P.`patient`,
		P.`physician` AS `physician_id`,
        PH.`prefix` AS `physician_prefix`,
        PH.`first_name` AS `physician_first_name`,
        PH.`middle_name` AS `physician_middle_name`,
        PH.`last_name` AS `physician_last_name`,
        PH.`suffix` AS `physician_suffix`,
		P.`medication_name`,
		P.`admin_route`,
		P.`admin_method`,
		P.`admin_device`,
		P.`admin_site`,
		P.`frequency` AS `frequency_code`,
        F.`description` AS `frequency_description`,
        P.`is_prn`,
		P.`strength_amount`,
		P.`strength_uom`,
		P.`measure_amount`,
		P.`measure_uom`,
		P.`volume`,
		P.`container_uom`,
		P.`prescribed_qty`,
		P.`daw` AS `daw_code`,
        DAW.`title` AS `daw_title`,
		P.`refill`,
        P.`is_discontinued`,
        COUNT(S.`id`) AS `schedule_cnt`
	FROM `sophic_medical`.`prescription` P
    LEFT JOIN `sophic_medical`.`schedule` S ON S.`prescription` = P.`id`
    LEFT JOIN `sophic_medical`.`physician` PH ON PH.`id` = P.`physician`
    LEFT JOIN `sophic_medical`.`frequency` F ON F.`code` = P.`frequency`
    LEFT JOIN `sophic_medical`.`daw` DAW ON DAW.`code` = P.`daw`
	WHERE P.`patient` = `patient_id`
    GROUP BY(P.`id`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_prn_by_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_prn_by_device`(
/*  Name: select_prn_by_device
**  Date: 2016-12-03
**  Notes: returns only items related to schedules and prescriptions which are not discontinued
**  Updated:
**	2016-12-07 - return a transaction.id in addition to the parameters that it returns now
**  2016-12-12 - added B.loaded_datetime into select list to fix ERROR 3065
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `$device_id` INT(11)
)
BEGIN

	SELECT DISTINCT B.code AS bin, 
		P.medication_name,
        ST.transaction AS transaction_id,
        B.loaded_datetime
	FROM `sophic_medical`.`cartridge` C
		INNER JOIN `sophic_medical`.`bin` B
			ON B.loaded_to_cartridge = C.code
		INNER JOIN `sophic_medical`.`schedule__transaction` ST
			ON ST.`bin` = B.`code` 
		INNER JOIN `sophic_medical`.`schedule` S
			ON S.id = ST.schedule
		INNER JOIN `sophic_medical`.`prescription` P
			ON S.prescription = P.id
		INNER JOIN `sophic_medical`.frequency F
			ON P.frequency = F.code
	WHERE C.loaded_to_device = `$device_id`
        AND B.scanned_in_device = `$device_id`
		AND F.`is_prn` = 'Y'
        AND P.is_discontinued = 'N'
        AND S.is_discontinued = 'N'
	ORDER BY B.loaded_datetime DESC;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_scanned_bins_by_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_scanned_bins_by_device`(
/*  Name:  select_scanned_bins_by_device
**  Date: 2017-11-01
**  Notes: Returns all bins which are scanned in the specified device
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/



	IN `device_id` INT(11)
)
BEGIN
	SELECT B.`code` AS `code`,
		B.`color` AS `color`,
		BC.`name` AS `color_name`,
		B.`loaded_datetime` AS `loaded_datetime`,
		B.`loaded_to_slot` AS `loaded_to_slot`,
		B.`loaded_to_cartridge` AS `loaded_to_cartridge`,
		C.`loaded_to_device` AS `loaded_to_device`,
		B.`scanned_datetime` AS `scanned_datetime`,
		B.`scanned_in_slot` AS `scanned_in_slot`,
		B.`scanned_in_cartridge_num` AS `scanned_in_cartridge_num`,
		B.`scanned_in_device` AS `scanned_in_device`,
		T.`scheduled_datetime` AS `scheduled_datetime`,
		P.`medication_name` AS `medication_name`,
		P.`strength_amount` AS `medication_strength_amount`,
		P.`strength_uom` AS `medication_strength_uom`,
		PT.`first_name` AS `patient_first_name`,
		PT.`last_name` AS `patient_last_name`
	FROM `sophic_medical`.`bin` B
    JOIN `sophic_medical`.`bin_color` BC ON BC.`code` = B.`color`
    LEFT JOIN `sophic_medical`.`cartridge` C ON C.`code` = B.`loaded_to_cartridge`
    LEFT JOIN `sophic_medical`.`schedule__transaction` ST ON ST.`bin` = B.`code`
    LEFT JOIN `sophic_medical`.`transaction` T ON T.`id` = ST.`transaction`
    LEFT JOIN `sophic_medical`.`schedule` S ON S.`id` = ST.`schedule`
    LEFT JOIN `prescription` P ON P.`id` = S.`prescription`
    LEFT JOIN `patient` PT ON PT.`id` = P.`patient`
    WHERE B.`scanned_in_device` = `device_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_schedule_by_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_schedule_by_device`(
/*  Name:  select_schedule_by_device
**  Date: 2017-08-02
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `device_id` INT(11)
)
BEGIN
	SELECT S.`id`,
		S.`prescription` AS `prescription_id`,
        P.`medication_name`,
        P.`strength_amount` AS `medication_strength_amount`,
        P.`strength_uom` AS `medication_strength_uom`,
        F.`code` AS `frequency_code`,
        F.`description` AS `frequency_description`,
        P.`is_prn`,
        PAT.`first_name` AS `patient_first_name`,
        PAT.`last_name` AS `patient_last_name`,
		S.`start_date`,
		S.`stop_date`,
        S.`is_discontinued` AS `schedule_is_discontinued`,
        P.`is_discontinued` AS `prescription_is_discontinued`,
		S.`last_modified`
	FROM `sophic_medical`.`schedule` S
    JOIN `sophic_medical`.`prescription` P ON P.`id` = S.`prescription`
    JOIN `sophic_medical`.`patient` PAT ON PAT.`id` = P.`patient`
    JOIN `sophic_medical`.`frequency` F ON F.`code` = P.`frequency`
    WHERE S.`device` = `device_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_schedule_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_schedule_by_id`(
/*  Name:  select_schedule_by_id
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `schedule_id` BIGINT(18)
)
BEGIN
	SELECT `schedule`.`id`,
		`schedule`.`prescription`,
		`schedule`.`start_date`,
		`schedule`.`stop_date`,
		`schedule`.`device`,
		`schedule`.`last_modified`
	FROM `sophic_medical`.`schedule`
    WHERE `schedule`.`id` = `schedule_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_schedule_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_schedule_by_patient`(
/*  Name:  select_schedule_by_patient
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `patient_id` INT(11)
)
BEGIN
	SELECT `schedule`.`id`,
		`schedule`.`prescription`,
		`schedule`.`start_date`,
		`schedule`.`stop_date`,
		`schedule`.`device`,
		`schedule`.`last_modified`
	FROM `sophic_medical`.`schedule`
    JOIN `sophic_medical`.`prescription` ON `prescription`.`id` = `schedule`.`prescription`
    WHERE `prescription`.`patient` = `patient_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_schedule_by_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_schedule_by_prescription`(
/*  Name:  select_schedule_by_prescription
**  Date: 2017-08-02
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `prescription_id` BIGINT(18)
)
BEGIN
	SELECT S.`id`,
		S.`start_date`,
		S.`stop_date`,
		S.`device` AS `device_id`,
        H.`address` AS `household_address`,
        A.`name` AS `area_name`,
        S.`is_discontinued`,
		S.`last_modified`
	FROM `sophic_medical`.`schedule` S
    JOIN `sophic_medical`.`device` D ON D.`id` = S.`device`
    JOIN `sophic_medical`.`area` A ON A.`id` = D.`area`
    JOIN `sophic_medical`.`household` H ON H.`id` = A.`household`
    WHERE S.`prescription` = `prescription_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_schedule_transaction_to_load` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_schedule_transaction_to_load`(
/*  Name:  select_schedule_transaction_to_load
**  Date: 2017-01-27
**  Notes: select scheduled but not loaded transactions (schedule_transaction) for specified device
**
** Examples of use:  
** CALL `sophic_medical`.`select_schedule_transaction_to_load`(1);
** CALL `sophic_medical`.`select_schedule_transaction_to_load`(2);  
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `device_id_par` INT(11)
)
BEGIN

	SELECT DISTINCT ST.`id` AS `schedule_transaction_id`,
		T.`id` AS `transaction_id`,
		T.`transaction_status`,
		T.`recognition_status`,
		T.`scheduled_datetime`,
		T.`execute_datetime`,
		T.`executed_datetime`,
        P.`is_prn`,
		T.`last_modified`,
        P.`medication_name`,
        P.`strength_amount`,
        P.`strength_uom`,
        PTN.`id` AS `patient_id`,
        PTN.`first_name`,
        PTN.`last_name`,
        PTN.`sex`
    FROM `sophic_medical`.`transaction` T
		INNER JOIN `sophic_medical`.`schedule__transaction`  ST
			ON ST.`transaction` = T.`id`
		INNER JOIN `sophic_medical`.`schedule` S
			ON S.`id` = ST.`schedule`
		INNER JOIN `sophic_medical`.`prescription` P 
			ON P.`id` = S.`prescription`
		INNER JOIN `sophic_medical`.`patient` PTN 
			ON PTN.`id` = P.`patient`
	WHERE ST.bin IS NULL
        AND S.`device` = `device_id_par`
        AND (T.`scheduled_datetime` > NOW() OR T.`scheduled_datetime` IS NULL)
        AND P.`is_discontinued` = "N"
        AND S.`is_discontinued` = "N"
	ORDER BY T.`scheduled_datetime`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_signal_strength` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_signal_strength`(
/*  Name:  select_signal_strength
**  Date: 2017-04-20
**  Notes: returns signal strength values for the specified device and date
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	IN `device_id` INT(11),
    IN `datetime_start` DATETIME,
    IN `datetime_stop` DATETIME
)
BEGIN
	SELECT s.`id`,
		s.`datetime`,
		s.`rssi`,
        s.`ber`
	FROM `sophic_medical`.`signal_strength` s
    WHERE s.`device` = `device_id`
      AND s.`datetime` >= `datetime_start`
      AND s.`datetime` <= `datetime_stop`
	ORDER BY s.`datetime` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_transaction_to_load` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_transaction_to_load`(
/*  Name:  select_transaction_to_load
**  Date: 2016-12-05
**  Notes: select transactions for specified device which will occur after current date
**
** Examples of use:  
** CALL `sophic_medical`.`select_transaction_to_load`(1);
** CALL `sophic_medical`.`select_transaction_to_load`(2);  
**
**  NOT USED SINCE 2017-01-27 - repaced by `select_schedule_transaction_to_load`
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `device_id_par` INT(11)
)
BEGIN

	SELECT DISTINCT T.`id`,
		T.`transaction_status`,
		T.`recognition_status`,
		T.`scheduled_datetime`,
		T.`execute_datetime`,
		T.`executed_datetime`,
		T.`last_modified`,
        P.`medication_name`,
        P.`strength_amount`,
        P.`strength_uom`,
        PTN.`id`,
        PTN.`first_name`,
        PTN.`last_name`,
        PTN.`sex`
    FROM `sophic_medical`.`transaction` T
		INNER JOIN `sophic_medical`.`schedule__transaction`  ST
			ON ST.`transaction` = T.`id`
		INNER JOIN `sophic_medical`.`schedule` S
			ON S.`id` = ST.`schedule`
		INNER JOIN `sophic_medical`.`prescription` P 
			ON P.`id` = S.`prescription`
		INNER JOIN `sophic_medical`.`patient` PTN 
			ON PTN.`id` = P.`patient`
	WHERE ST.bin IS NULL
        AND S.`device` = `device_id_par`
        AND (T.`scheduled_datetime` > NOW() OR T.`scheduled_datetime` IS NULL)
	ORDER BY T.`scheduled_datetime`;

-- 
-- 	SELECT `transaction`.`id`,
-- 		`transaction`.`transaction_status`,
-- 		`transaction`.`recognition_status`,
-- 		`transaction`.`scheduled_datetime`,
-- 		`transaction`.`execute_datetime`,
-- 		`transaction`.`executed_datetime`,
-- 		`transaction`.`last_modified`,
--         `prescription`.`medication_name`,
--         `prescription`.`strength_amount`,
--         `prescription`.`strength_uom`,
--         `patient`.`id`,
--         `patient`.`first_name`,
--         `patient`.`last_name`,
--         `patient`.`sex`
-- 	FROM `sophic_medical`.`transaction`
--     LEFT JOIN `sophic_medical`.`bin__cartridge` ON `bin__cartridge`.`transaction` = `transaction`.`id`
--     JOIN `sophic_medical`.`schedule__transaction` ON `schedule__transaction`.`transaction` = `transaction`.`id`
--     JOIN `sophic_medical`.`schedule` ON `schedule`.`id` = `schedule__transaction`.`schedule`
--     JOIN `sophic_medical`.`prescription` ON `prescription`.`id` = `schedule`.`prescription`
--     JOIN `sophic_medical`.`patient` ON `patient`.`id` = `prescription`.`patient`
--     WHERE `bin__cartridge`.`id` IS NULL
--       AND `schedule`.`device` = `device_id`
--       AND (`transaction`.`scheduled_datetime` > NOW() OR `transaction`.`scheduled_datetime` IS NULL)
-- 	ORDER BY `transaction`.`scheduled_datetime`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_users`(
/*  Name:  select_users
**  Date: 2017-07-16
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

)
BEGIN
	SELECT `user`.`id`,
		`user`.`name`,
		`user`.`password`,
		`user`.`first_name`,
        `user`.`last_name`,
        `user`.`salutation`,
		`user`.`notification_email_enabled`,
        `user`.`notification_email_addresses`,
        `user`.`notification_sms_enabled`,
        `user`.`notification_sms_phones`,
        `user`.`notification_call_enabled`,
		`user`.`notification_call_phones`,
        `user`.`temperature_format`,
        `user`.`is_admin`,
        `user`.`is_active`,
		`user`.`last_modified`
	FROM `sophic_medical`.`user`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_user_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_user_by_id`(
/*  Name:  select_user_by_id
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `user_id` INT(11))
BEGIN
	SELECT `user`.`id`,
		`user`.`name`,
		`user`.`password`,
		`user`.`first_name`,
        `user`.`last_name`,
        `user`.`salutation`,
		`user`.`notification_email_enabled`,
        `user`.`notification_email_addresses`,
        `user`.`notification_sms_enabled`,
        `user`.`notification_sms_phones`,
        `user`.`notification_call_enabled`,
		`user`.`notification_call_phones`,
        `user`.`temperature_format`,
        `user`.`is_admin`,
        `user`.`is_active`,
		`user`.`last_modified`
	FROM `sophic_medical`.`user`
    WHERE `user`.`id` = `user_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_user_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_user_by_name`(
/*  Name:  select_user_by_name
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `user_name` VARCHAR(45))
BEGIN
	SELECT `user`.`id`,
		`user`.`name`,
		`user`.`password`,
        `user`.`first_name`,
        `user`.`last_name`,
        `user`.`salutation`,
		`user`.`notification_email_enabled`,
        `user`.`notification_email_addresses`,
        `user`.`notification_sms_enabled`,
        `user`.`notification_sms_phones`,
        `user`.`notification_call_enabled`,
		`user`.`notification_call_phones`,
        `user`.`temperature_format`,
        `user`.`is_admin`,
        `user`.`is_active`,
		`user`.`last_modified`
	FROM `sophic_medical`.`user`
    WHERE `user`.`name` = `user_name`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_user_by_name_pass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `select_user_by_name_pass`(
/*  Name:  select_user_by_name_pass
**  Date: 2016-11-05
**  Notes: Used for the user authentication. Selects only users where `is_active` = "Y"
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
IN `user_name` VARCHAR(45), IN `user_password` VARCHAR(45))
BEGIN
	SELECT `user`.`id`,
		`user`.`name`,
		`user`.`password`,
        `user`.`first_name`,
        `user`.`last_name`,
		`user`.`last_modified`
	FROM `sophic_medical`.`user`
    WHERE `user`.`name` = `user_name`
      AND `user`.`password` = `user_password`
      AND `user`.`is_active` = "Y";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_cmd_UPLDVID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `send_cmd_UPLDVID`(
/*  Name:  send_cmd_UPLDVID
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

    IN transaction_id BIGINT(18)
)
BEGIN


	DECLARE task_id BIGINT(18);
    DECLARE device_id INT(11);
    DECLARE `json_data` VARCHAR(250) DEFAULT NULL;
    DECLARE ret_code INT;
    DECLARE trans_exists BOOLEAN;
   	DECLARE msg VARCHAR(250);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			@p1 = RETURNED_SQLSTATE,
			@p2 = MESSAGE_TEXT;
		SELECT 0 AS 'id', @p1 as err_code, @p2 as 'msg';
		ROLLBACK;
	END;

 	START TRANSACTION;
		
		SET trans_exists = EXISTS(SELECT * FROM sophic_medical.transaction WHERE id = transaction_id);
		IF trans_exists = FALSE THEN
			SET msg = CONCAT('Transaction with id = ', transaction_id, ' does not exist');	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		
		SET device_id = NULL;
		SELECT DISTINCT device INTO device_id FROM `schedule__transaction` ST 
					INNER JOIN `schedule` S ON ST.`schedule` = S.id
			WHERE ST.`transaction` = transaction_id;

		IF device_id IS NULL THEN
			SET msg = CONCAT('Can not find device id for transaction with id = ', transaction_id);	
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
		END IF;

		
		INSERT INTO `sophic_medical`.`task`
			(`task_type`, `device`, `parameters`, `created_datetime`)
			VALUES('UPLDVID', 1, json_data, NOW());
		SELECT last_insert_id() INTO task_id;

		
        SET json_data = concat('{"api": 1, "task_type": "UPLDVID", "task_parameters": {"task_id":',
 			CAST(task_id AS CHAR), ', "transaction_id": ', CAST(transaction_id AS CHAR), '}}');
        


		UPDATE `sophic_medical`.`task` SET parameters = json_data WHERE id = task_id;

		 
		SET ret_code = sm_send_packet(device_id, json_data);
    
		SELECT task_id AS 'id', 0 AS 'err_code', 'OK' AS 'msg';
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_patient_household` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `set_patient_household`(
/*  Name:  set_patient_household
**  Date: 2017-07-17
**  Notes: Deletes all rows from patient__household for the specified patient_id_arg
**    and inserts new from the households_arg
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN patient_id_arg INT(11),
	IN households_arg VARCHAR(200) -- string with comma delimeted households: '1,3,4,20'
)
BEGIN

	DECLARE households_str VARCHAR(200);
    DECLARE household INT(11);
    
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS id, `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
	START TRANSACTION;

		-- Delete all from user__household for the specified user_id_arg
		DELETE FROM patient__household 
        WHERE patient = patient_id_arg;
        
        -- Loop by households_arg and insert new values into user__household
        IF households_arg != '' THEN
			SET households_str = CONCAT(households_arg, ',');
			WHILE (LOCATE(',', households_str) > 0) DO
				SET household = SUBSTRING(households_str, 1, LOCATE(',', households_str) - 1);
				SET households_str = SUBSTRING(households_str, LOCATE(',', households_str) + 1);
				INSERT into patient__household(`patient`, `household`) VALUES(patient_id_arg, household);
			END WHILE;
		END IF;
        
        SELECT 0 AS id, 0 AS err_code, 'OK' AS msg;

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_user_household` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `set_user_household`(
/*  Name:  set_user_household
**  Date: 2017-07-17
**  Notes: Deletes all rows from user__household for the specified user_id_arg
**    and inserts new from the households_arg
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN user_id_arg INT(11),
	IN households_arg VARCHAR(200) -- string with comma delimeted households: '1,3,4,20'
)
BEGIN

	DECLARE households_str VARCHAR(200);
    DECLARE household INT(11);
    
    DECLARE `msg` TEXT;
	DECLARE `err_code` CHAR(5) DEFAULT '00000';

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		GET DIAGNOSTICS CONDITION 1 
			`err_code` = RETURNED_SQLSTATE, `msg` = MESSAGE_TEXT;
		ROLLBACK;
        SELECT 0 AS id, `err_code` as err_code, `msg` as msg;
        RESIGNAL;
	END;
    
	START TRANSACTION;

		-- Delete all from user__household for the specified user_id_arg
		DELETE FROM user__household 
        WHERE user = user_id_arg;
        
        -- Loop by households_arg and insert new values into user__household
        IF households_arg != '' THEN
			SET households_str = CONCAT(households_arg, ',');
			WHILE (LOCATE(',', households_str) > 0) DO
				SET household = SUBSTRING(households_str, 1, LOCATE(',', households_str) - 1);
				SET households_str = SUBSTRING(households_str, LOCATE(',', households_str) + 1);
				INSERT into user__household(`user`, `household`) VALUES(user_id_arg, household);
			END WHILE;
		END IF;
        
        SELECT 0 AS id, 0 AS err_code, 'OK' AS msg;

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_area` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_area`(
/*  Name:  update_area
**  Date: 2017-07-19
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `area_id` int(11),
	IN `area_name` varchar(100),
	IN `area_household` int(11),
    IN `area_is_active` char(1)
)
BEGIN
	UPDATE `sophic_medical`.`area`
	SET
		`name` = `area_name`,
		`household` = `area_household`,
        `is_active` = `area_is_active`
	WHERE `id` = `area_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_bin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_bin`(
/*  Name:  update_bin
**  Date: 2017-05-20
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `bin_code` varchar(16),
	IN `bin_color` varchar(16),
	IN `bin_loaded_datetime` datetime,
    IN `bin_loaded_to_slot` tinyint(2),
    IN `bin_loaded_to_cartridge` varchar(16),
	IN `bin_scanned_datetime` datetime,
	IN `bin_scanned_in_slot` tinyint(2),
    IN `bin_scanned_in_cartridge_num` tinyint(2),
    IN `bin_scanned_in_device` int(11)
)
BEGIN
	UPDATE `sophic_medical`.`bin`
	SET
		`color` = `bin_color`,
		`loaded_datetime` = `bin_loaded_datetime`,
        `loaded_to_slot` = `bin_loaded_to_slot`,
        `loaded_to_cartridge` = `bin_loaded_to_cartridge`,
		`scanned_datetime` = `bin_scanned_datetime`,
		`scanned_in_slot` = `bin_scanned_in_slot`,
        `scanned_in_cartridge_num` = `bin_scanned_in_cartridge_num`,
        `scanned_in_device` = `bin_scanned_in_device`
	WHERE `code` = `bin_code`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_device`(
/*  Name:  update_device
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `device_id` int(11),
	IN `device_area` int(11),
	IN `device_position` point,
    IN `device_modem_behavior` varchar(10),
    IN `device_wifi_enabled` char(1),
	IN `device_wifi_ssid` varchar(32),
    IN `device_wifi_security` varchar(8),
	IN `device_wifi_key` varchar(63),
    IN `device_is_active` char(1)
)
BEGIN
	UPDATE `sophic_medical`.`device`
	SET
		`area` = `device_area`,
		`position` = `device_position`,
        `modem_behavior` = `device_modem_behavior`,
        `wifi_enabled` = `device_wifi_enabled`,
		`wifi_ssid` = `device_wifi_ssid`,
        `wifi_security` = `device_wifi_security`,
		`wifi_key` = `device_wifi_key`,
        `is_active` = `device_is_active`
	WHERE `id` = `device_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_device_modem_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_device_modem_status`(
/*  Name:  update_device_modem_status
**  Date: 2017-03-23
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `device_id` int(11),
    IN `device_modem_status` varchar(10)
)
BEGIN
	UPDATE `sophic_medical`.`device`
	SET
        `modem_status` = `device_modem_status`
	WHERE `id` = `device_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_household` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_household`(
/*  Name:  update_household
**  Date: 2017-07-19
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `household_id` int(11),
    IN `household_address` varchar(100),
    IN `household_city` int(11),
	IN `household_description` varchar(100),
    IN `household_is_active` char(1)
)
BEGIN
	UPDATE `sophic_medical`.`household`
	SET
		`address` = `household_address`,
		`city` = `household_city`,
        `description` = `household_description`,
        `is_active` = `household_is_active`
	WHERE `id` = `household_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_patient`(
/*  Name:  update_patient
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `patient_id` int(11),
	IN `patient_first_name` varchar(50),
	IN `patient_last_name` varchar(50),
	IN `patient_sex` char(1),
	IN `patient_birthdate` date,
	IN `patient_phone` varchar(20),
	IN `patient_address` varchar(100),
	IN `patient_ssn` varchar(11),
	IN `patient_photo` varchar(250),
    IN `device_speaker_volume` tinyint(3),
    IN `device_speaker_volume_prox` tinyint(3),
    IN `device_audio_alerts_number` tinyint(2),
    IN `device_audio_alerts_interval` smallint(3),
    IN `medication_overdue_period` smallint(3),
    IN `device_action_notrcg` varchar(10),
    IN `patient_is_active` char(1)
)
BEGIN

	DECLARE `$device_id` INT(11);
	DECLARE `$task_id` BIGINT(18) DEFAULT 0;
	DECLARE `$done` INT DEFAULT FALSE;
	DECLARE `$cur` CURSOR FOR
		SELECT DISTINCT D.id 
        FROM patient P 
        JOIN patient__household PH ON PH.patient = P.id
        JOIN household H ON H.id = PH.household
        JOIN area A ON A.household = H.id
        JOIN device D ON D.area = A.id
        WHERE P.id = `patient_id`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET `$done` = TRUE;

	UPDATE `sophic_medical`.`patient`
	SET
		`first_name` = `patient_first_name`,
		`last_name` = `patient_last_name`,
		`sex` = `patient_sex`,
		`date_of_birth` = `patient_birthdate`,
		`phone` = `patient_phone`,
		`address` = `patient_address`,
		`ssn` = `patient_ssn`,
		`photo` = `patient_photo`,
        `speaker_volume` = `device_speaker_volume`,
        `speaker_volume_prox` = `device_speaker_volume_prox`,
        `audio_alerts_number` = `device_audio_alerts_number`,
        `audio_alerts_interval` = `device_audio_alerts_interval`,
        `overdue_period` = `medication_overdue_period`,
        `action_notrcg` = `device_action_notrcg`,
        `is_active` = `patient_is_active`
	WHERE `id` = `patient_id`;
    
    -- Sync transactions with all devices related to the patient
    OPEN `$cur`;
		read_loop: LOOP
			FETCH `$cur` INTO `$device_id`; 
			IF `$done` THEN
				LEAVE read_loop;
			END IF;
            BEGIN
				CALL create_sync_task_wt(`$device_id`, `$task_id`);
            END;
		END LOOP;
		CLOSE `$cur`;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_schedule`(
/*  Name:  update_schedule
**  Date: 2016-11-05
**  Notes:
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `schedule_id` BIGINT(18),
	IN `prescription_id` BIGINT(18),
	IN `start_date` DATE,
	IN `stop_date` DATE,
	IN `device_id` INT(11)
)
BEGIN
	UPDATE `sophic_medical`.`schedule`
	SET
		`prescription` = `prescription_id`,
		`start_date` = `start_date`,
		`stop_date` = `stop_date`,
		`device` = `device_id`
	WHERE `id` = `schedule_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_task`(
/*  Name:  update_task
**  Last Updated Date: 2017-01-05
**  Notes: 
**    Updates the task identified by the task_id with given task_status and ret_value.
**    Raises MySQL error when the task with given task_id doesn't exist in the database.
**
**  Example of calling:  
**  CALL sophic_medical.update_task(20, 'Y', '{"ret_code":"ok"}');    
**  CALL sophic_medical.update_task(20, 'Y', '{"file_name":"ff.avi"}');    
**  CALL sophic_medical.update_task(-20, 'Y', '{"ret_code":"ok"}');  # return error: task.id=-20 is not exist
**
**  Copyright (c) 2016-2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	`$task_id` BIGINT(18), 
	`$task_status` CHAR(1), 
	`$ret_value` TEXT
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';
    DECLARE `$task_type` VARCHAR(16) DEFAULT NULL;
	DECLARE `$transaction_id` BIGINT(18);

	IF NOT EXISTS(SELECT T.* FROM `task` T WHERE T.id = `$task_id`) THEN
        SET `$msg` = CONCAT('There no exist task with id = ', `$task_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
 	END IF;		
    
    UPDATE `task` SET `execute_status` = `$task_status`, `ret_value` = `$ret_value`
		WHERE id = `$task_id`;

	SELECT task.task_type, task.`transaction` INTO `$task_type`, `$transaction_id` FROM `task` WHERE id = `$task_id`;
    
	IF `$task_type` = 'UPLDVID' AND `$task_status` = 'Y' THEN # video uploading was executed
		IF EXISTS(SELECT * FROM video WHERE transaction = `$transaction_id`) THEN
			UPDATE video SET filename = json_extract(`$ret_value`, '$.file_name') WHERE transaction = `$transaction_id`;
		ELSE
			INSERT INTO video(`transaction`, `filename`) VALUE(`$transaction_id`, json_extract(`$ret_value`, '$.file_name'));
		END IF;
    ELSEIF `$task_type` = 'UPLDVID' AND `$task_status` != 'Y' THEN
		DELETE FROM video WHERE transaction = `$transaction_id`;
    END IF;	
    
	SELECT `$task_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_transaction`(
/*  Name:  update_transaction
**  Date: 2016-12-12
**  Notes: 
**    Updates the transaction identified by the transaction_id with given transaction_status, 
**    recognition_status and executed_datetime.
**    Raises MySQL error when the task with given task_id doesn't exist in the database.
**
**  Example of calling:  
**  CALL sophic_medical.update_transaction(3, 'OK', 'OK', '2016-12-14 10:00');    
**  CALL sophic_medical.update_transaction(-3, 'OK', 'OK', '2016-12-14 10:00'); # error: no transaction with id = -3
**
**  Copyright (c) 2016
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/
	`$transaction_id` BIGINT(18),
    `$transaction_status` VARCHAR(16),
    `$recognition_status` VARCHAR(16),
    `$executed_datetime` DATETIME
)
BEGIN
    DECLARE `$msg` TEXT;
	DECLARE `$err_code` CHAR(5) DEFAULT '00000';

	IF NOT EXISTS(SELECT T.* FROM `transaction` T WHERE T.id = `$transaction_id`) THEN
        SET `$msg` = CONCAT('There is no transaction with id = ', `$transaction_id`);	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = `$msg`;
 	END IF;		
    
    UPDATE `transaction` 
		SET `transaction_status` = `$transaction_status`,
			`recognition_status` = `$recognition_status`,
			`executed_datetime` = `$executed_datetime`
		WHERE `id` = `$transaction_id`;

	SELECT `$transaction_id` AS 'id', 0 AS 'err_code', 'OK' AS 'msg';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sophic_medical`@`localhost` PROCEDURE `update_user`(
/*  Name:  update_user
**  Date: 2017-02-18
**  Notes:
**
**  Copyright (c) 2017
**  Sophic Systems, LLC
**  All Rights Reserved
**
**  The information contained herein is considered to be a proprietary
**  Trade Secret of Sophic Systems, LLC. Unauthorized
**  possession, use, or disclosure may lead to civil or criminal prosecution.
*/

	IN `user_id` int(11),
    IN `user_name` varchar(45),
    IN `user_password` varchar(45),
    IN `user_first_name` varchar(45),
    IN `user_last_name` varchar(45),
    IN `user_salutation` varchar(45),
	IN `user_notification_email_enabled` char(1),
	IN `user_notification_email_addresses` json,
	IN `user_notification_sms_enabled` char(1),
	IN `user_notification_sms_phones` json,
	IN `user_notification_call_enabled` char(1),
	IN `user_notification_call_phones` json,
    IN `user_temperature_format` char(1),
    IN `user_is_admin` char(1),
    IN `user_is_active` char(1)
)
BEGIN
	UPDATE `sophic_medical`.`user`
	SET
      `name` = `user_name`,
      `password` = `user_password`,
      `first_name` = `user_first_name`,
      `last_name` = `user_last_name`,
      `salutation` = `user_salutation`,
      `notification_email_enabled` = `user_notification_email_enabled`,
      `notification_email_addresses` = `user_notification_email_addresses`,
      `notification_sms_enabled` = `user_notification_sms_enabled`,
      `notification_sms_phones` = `user_notification_sms_phones`,
      `notification_call_enabled` = `user_notification_call_enabled`,
      `notification_call_phones` = `user_notification_call_phones`,
      `temperature_format` = `user_temperature_format`,
      `is_admin` = `user_is_admin`,
      `is_active` = `user_is_active`
	WHERE `id` = `user_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-22 19:46:44