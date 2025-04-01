/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.18.69.57    Database: syce_21_Port
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `container` (
  `container_id` int(11) NOT NULL,
  `ship_id` int(11) DEFAULT NULL,
  `container_capacity` int(11) DEFAULT NULL,
  `type_name` varchar(10) DEFAULT NULL,
  `port_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`container_id`),
  KEY `ship_id` (`ship_id`),
  KEY `fk_port_id_1` (`port_id`),
  KEY `fk_vehicle_id` (`vehicle_id`),
  CONSTRAINT `container_ibfk_1` FOREIGN KEY (`ship_id`) REFERENCES `ship` (`ship_id`),
  CONSTRAINT `fk_port_id_1` FOREIGN KEY (`port_id`) REFERENCES `port` (`port_id`),
  CONSTRAINT `fk_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `transport_vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,1000,'cylinder',1,1),(2,2,1500,'cuboid',1,2),(3,3,1800,'cuboid',1,3),(4,4,2000,'cylinder',2,4),(5,5,2200,'cuboid',2,5),(6,6,2500,'cylinder',2,6),(7,7,3000,'cuboid',3,7),(8,8,3200,'cylinder',3,8),(9,9,3500,'cuboid',3,9);
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_name` varchar(20) NOT NULL,
  `country_tarrif` int(11) DEFAULT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('brazil',160),('france',210),('germany',200),('india',200),('italy',180),('japan',180),('uk',200),('usa',150);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customs`
--

DROP TABLE IF EXISTS `customs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customs` (
  `inspection_level` int(11) NOT NULL,
  `inspection_status` tinyint(1) DEFAULT NULL,
  `inspection_result` tinyint(1) DEFAULT NULL,
  `inspection_result_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inspection_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customs`
--

LOCK TABLES `customs` WRITE;
/*!40000 ALTER TABLE `customs` DISABLE KEYS */;
INSERT INTO `customs` VALUES (1,0,0,'No issues'),(2,1,1,'Suspicious items found'),(3,0,0,'Clear');
/*!40000 ALTER TABLE `customs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_status` tinyint(1) DEFAULT NULL,
  `emp_role` varchar(50) DEFAULT NULL,
  `emp_salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'manager',60000),(2,1,'engineer',50000),(3,0,'intern',30000),(4,1,'supervisor',55000),(5,1,'technician',45000),(6,0,'clerk',32000),(7,1,'manager',60000),(8,0,'engineer',50000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`syce2025-21`@`%`*/ /*!50003 TRIGGER prevent_negative_salary
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.emp_salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inspected`
--

DROP TABLE IF EXISTS `inspected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspected` (
  `container_id` int(11) DEFAULT NULL,
  `inspection_level` int(11) DEFAULT NULL,
  KEY `container_id` (`container_id`),
  KEY `inspection_level` (`inspection_level`),
  CONSTRAINT `inspected_ibfk_1` FOREIGN KEY (`container_id`) REFERENCES `container` (`container_id`),
  CONSTRAINT `inspected_ibfk_2` FOREIGN KEY (`inspection_level`) REFERENCES `customs` (`inspection_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspected`
--

LOCK TABLES `inspected` WRITE;
/*!40000 ALTER TABLE `inspected` DISABLE KEYS */;
INSERT INTO `inspected` VALUES (1,1),(2,2),(3,3),(4,1),(5,2),(6,3),(7,1),(8,2),(9,3);
/*!40000 ALTER TABLE `inspected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `port` (
  `port_id` int(11) NOT NULL,
  `total_ships_present` int(11) DEFAULT NULL,
  `max_container_capacity` int(11) DEFAULT NULL,
  `port_op_status` tinyint(1) DEFAULT NULL,
  `country_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`port_id`),
  KEY `fk_country_name_1` (`country_name`),
  CONSTRAINT `fk_country_name_1` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES (1,4,2000,1,'india'),(2,3,2500,1,'india'),(3,4,3000,1,'india');
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship`
--

DROP TABLE IF EXISTS `ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship` (
  `ship_id` int(11) NOT NULL,
  `ship_arrival_date` date DEFAULT NULL,
  `ship_departure_date` date DEFAULT NULL,
  `ship_op_status` tinyint(1) DEFAULT NULL,
  `ship_name` varchar(50) DEFAULT NULL,
  `ship_capacity` int(11) DEFAULT NULL,
  `docking_location` int(11) DEFAULT NULL,
  `country_name` varchar(20) DEFAULT NULL,
  `port_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ship_id`),
  KEY `fk_port_id` (`port_id`),
  KEY `fk_country_name` (`country_name`),
  CONSTRAINT `fk_country_name` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`),
  CONSTRAINT `fk_port_id` FOREIGN KEY (`port_id`) REFERENCES `port` (`port_id`),
  CONSTRAINT `chk_id` CHECK (`ship_id` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship`
--

LOCK TABLES `ship` WRITE;
/*!40000 ALTER TABLE `ship` DISABLE KEYS */;
INSERT INTO `ship` VALUES (1,'2025-01-01','2025-01-15',1,'voyager',3000,1,'india',1),(2,'2025-01-05','2025-01-20',1,'navigator',2500,2,'india',1),(3,'2025-01-10','2025-01-25',0,'explorer',2800,3,'india',1),(4,'2025-01-15','2025-01-30',1,'titan',3500,1,'india',2),(5,'2025-01-18','2025-02-02',1,'olympia',3200,2,'india',2),(6,'2025-01-22','2025-02-07',0,'majestic',2700,3,'india',2),(7,'2025-01-25','2025-02-10',1,'endeavour',3300,1,'india',3),(8,'2025-01-28','2025-02-13',1,'voyage',3000,2,'india',3),(9,'2025-02-01','2025-02-15',0,'captain',2500,3,'india',3),(10,'2025-02-01','2025-02-15',1,'titanic',2500,4,'india',3),(11,'2025-02-01','2025-02-15',0,'voyager2',2500,5,'india',1);
/*!40000 ALTER TABLE `ship` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`syce2025-21`@`%`*/ /*!50003 TRIGGER update_total_ships_in_port
AFTER INSERT ON ship
FOR EACH ROW
BEGIN
    UPDATE port
    SET total_ships_present = total_ships_present + 1
    WHERE port_id = NEW.port_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transport_vehicle`
--

DROP TABLE IF EXISTS `transport_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_vehicle` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_type` varchar(20) DEFAULT NULL,
  `vehicle_capacity` int(11) DEFAULT NULL,
  `vehicle_op_status` tinyint(1) DEFAULT NULL,
  `vehicle_location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `chk_vehicle_type` CHECK (`vehicle_type` in ('train','crane'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_vehicle`
--

LOCK TABLES `transport_vehicle` WRITE;
/*!40000 ALTER TABLE `transport_vehicle` DISABLE KEYS */;
INSERT INTO `transport_vehicle` VALUES (1,'crane',5000,1,'port 1'),(2,'train',8000,1,'port 2'),(3,'crane',4500,0,'port 3'),(4,'train',10000,1,'port 1'),(5,'crane',5000,1,'port 2'),(6,'train',12000,0,'port 3'),(7,'crane',6000,1,'port 1'),(8,'train',15000,0,'port 2'),(9,'train',10000,1,'port 3');
/*!40000 ALTER TABLE `transport_vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-01 11:34:36
