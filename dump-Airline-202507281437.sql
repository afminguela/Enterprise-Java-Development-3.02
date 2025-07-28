-- MySQL dump 10.13  Distrib 8.0.42, for macos15.2 (arm64)
--
-- Host: localhost    Database: Airline
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `customer_flights`
--

DROP TABLE IF EXISTS `customer_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_flights` (
  `id_customer` int NOT NULL,
  `flight_number` varchar(100) DEFAULT NULL,
  KEY `customer_flights_Customers_FK` (`id_customer`),
  KEY `customer_flights_Flights_FK` (`flight_number`),
  CONSTRAINT `customer_flights_Customers_FK` FOREIGN KEY (`id_customer`) REFERENCES `Customers` (`Id_customer`),
  CONSTRAINT `customer_flights_Flights_FK` FOREIGN KEY (`flight_number`) REFERENCES `Flights` (`Flight_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_flights`
--

LOCK TABLES `customer_flights` WRITE;
/*!40000 ALTER TABLE `customer_flights` DISABLE KEYS */;
INSERT INTO `customer_flights` VALUES (1,'dl143'),(1,'dl122'),(2,'dl122'),(1,'dl143'),(3,'dl122'),(3,'dl53'),(1,'dl143'),(4,'dl143'),(1,'dl143'),(4,'dl222'),(5,'dl143'),(6,'dl222'),(7,'dl222'),(5,'dl122'),(4,'dl37'),(8,'dl222');
/*!40000 ALTER TABLE `customer_flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `Id_customer` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_status` enum('Gold','Silver','none') NOT NULL,
  `Customer_Total_Mileage` bigint DEFAULT NULL,
  PRIMARY KEY (`Id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Agustine Rivera','Silver',115235),(2,'Alaina Sepúlveda','none',6008),(3,'Tom Jones','Gold',205767),(4,'sam rio','none',2653),(5,'Jessica James','Silver',127656),(6,'Ana Janco','Silver',136773),(7,'Jennifer Cortez','Gold',300582),(8,'cristian janco','Silver',14642);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flights` (
  `Flight_number` varchar(100) NOT NULL,
  `Flight_mileage` varchar(100) NOT NULL,
  PRIMARY KEY (`Flight_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flights`
--

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;
INSERT INTO `Flights` VALUES ('dl122','4370'),('dl143','135'),('dl222','1765'),('dl37','531'),('dl53','2078');
/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `Aircraft` varchar(100) NOT NULL,
  `Total_seats` int NOT NULL,
  PRIMARY KEY (`Aircraft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES ('Airbus A330',236),('Boeing 747',400),('Boeing 777',264);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes_flights`
--

DROP TABLE IF EXISTS `planes_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes_flights` (
  `aircraft` varchar(100) NOT NULL,
  `flight` varchar(100) NOT NULL,
  KEY `planes_flights_planes_FK` (`aircraft`),
  KEY `planes_flights_Flights_FK` (`flight`),
  CONSTRAINT `planes_flights_Flights_FK` FOREIGN KEY (`flight`) REFERENCES `Flights` (`Flight_number`),
  CONSTRAINT `planes_flights_planes_FK` FOREIGN KEY (`aircraft`) REFERENCES `planes` (`Aircraft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_flights`
--

LOCK TABLES `planes_flights` WRITE;
/*!40000 ALTER TABLE `planes_flights` DISABLE KEYS */;
INSERT INTO `planes_flights` VALUES ('Boeing 747','dl143'),('Airbus A330','dl122'),('Boeing 777','dl53'),('Boeing 777','dl222'),('Boeing 747','dl37');
/*!40000 ALTER TABLE `planes_flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Airline'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28 14:37:53
