-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bms_db
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `account_info`
--

DROP TABLE IF EXISTS `account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_info` (
  `account_no` bigint NOT NULL,
  `customer_id` int DEFAULT NULL,
  `account_type` varchar(10) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `ifsc_code` varchar(10) DEFAULT NULL,
  `interest` decimal(7,2) DEFAULT NULL,
  `initial_deposit` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`account_no`),
  KEY `account_info_pers_fk` (`customer_id`),
  KEY `account_info_bk_fk` (`ifsc_code`),
  CONSTRAINT `account_info_bk_fk` FOREIGN KEY (`ifsc_code`) REFERENCES `bank_info` (`ifsc_code`),
  CONSTRAINT `account_info_pers_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer_personal_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_info`
--

LOCK TABLES `account_info` WRITE;
/*!40000 ALTER TABLE `account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_info` (
  `ifsc_code` varchar(10) NOT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ifsc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_info`
--

LOCK TABLES `bank_info` WRITE;
/*!40000 ALTER TABLE `bank_info` DISABLE KEYS */;
INSERT INTO `bank_info` VALUES ('CBI6432','CentralBank','Lucknow'),('CBN2398','CanaraBank','Prayagraj'),('HDFC0021','HDFC','Vyas Nagar'),('ICICI234','ICICI','Kanpur'),('SBIT874','SBI','Varanasi');
/*!40000 ALTER TABLE `bank_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_personal_info`
--

DROP TABLE IF EXISTS `customer_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_personal_info` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `guardian_name` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_no` int DEFAULT NULL,
  `mail_id` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `martial_status` varchar(10) DEFAULT NULL,
  `identification_doc_type` varchar(20) DEFAULT NULL,
  `id_doc_no` varchar(20) DEFAULT NULL,
  `citizenship` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_personal_info`
--

LOCK TABLES `customer_personal_info` WRITE;
/*!40000 ALTER TABLE `customer_personal_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reference_info`
--

DROP TABLE IF EXISTS `customer_reference_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reference_info` (
  `customer_id` int NOT NULL,
  `reference_acc_name` varchar(20) DEFAULT NULL,
  `reference_acc_no` bigint DEFAULT NULL,
  `reference_acc_address` varchar(50) DEFAULT NULL,
  `relation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `customer_reference_info_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_personal_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reference_info`
--

LOCK TABLES `customer_reference_info` WRITE;
/*!40000 ALTER TABLE `customer_reference_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_reference_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-03 12:39:54
