CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: project
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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `City` varchar(50) NOT NULL,
  `AirlineId` int NOT NULL,
  `AL_Name` varchar(50) NOT NULL,
  `Three_digit_code` int NOT NULL,
  `PassportNo` int NOT NULL,
  `FlightCode` int NOT NULL,
  KEY `PassportNo` (`PassportNo`),
  KEY `FlightCode` (`FlightCode`),
  CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`PassportNo`) REFERENCES `passenger` (`PassportNo`),
  CONSTRAINT `airline_ibfk_2` FOREIGN KEY (`FlightCode`) REFERENCES `flight` (`FlightCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('Mumbai',101,'Air India',123,100001,101),('Delhi',102,'IndiGo',456,100002,102),('Bangalore',103,'SpiceJet',789,100003,103),('Chennai',104,'Vistara',234,100004,104),('Hyderabad',105,'GoAir',567,100005,105),('Kolkata',106,'AirAsia',890,100006,106),('Delhi',107,'Air India',123,100007,107),('Mumbai',108,'IndiGo',456,100008,108),('Bangalore',109,'SpiceJet',789,100009,109),('Chennai',110,'Vistara',234,100010,110),('Hyderabad',111,'GoAir',567,100001,111),('Kolkata',112,'AirAsia',890,100002,112),('Delhi',113,'Air India',123,100003,113),('Mumbai',114,'IndiGo',456,100004,114),('Bangalore',115,'SpiceJet',789,100005,115);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 17:40:51
