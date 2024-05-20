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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `Source` varchar(50) NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `Arrival` datetime NOT NULL,
  `Departure` datetime NOT NULL,
  `FlightCode` int NOT NULL,
  `FlightType` varchar(50) NOT NULL,
  `Duration` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`FlightCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('Mumbai','Delhi','2023-10-31 08:00:00','2023-10-31 06:00:00',101,'Domestic','2 hours','On Time'),('Delhi','Bangalore','2023-10-31 10:15:00','2023-10-31 08:45:00',102,'Domestic','1 hour 30 minutes','On Time'),('Chennai','Kolkata','2023-10-31 12:30:00','2023-10-31 10:45:00',103,'Domestic','1 hour 45 minutes','On Time'),('Hyderabad','Ahmedabad','2023-10-31 14:45:00','2023-10-31 13:15:00',104,'Domestic','1 hour 30 minutes','Delayed'),('Kolkata','Mumbai','2023-10-31 18:30:00','2023-10-31 16:45:00',105,'Domestic','1 hour 45 minutes','On Time'),('Bengaluru','Chennai','2023-10-31 20:15:00','2023-10-31 18:30:00',106,'Domestic','1 hour 45 minutes','Delayed'),('Delhi','Goa','2023-10-31 06:30:00','2023-10-31 04:45:00',107,'Domestic','1 hour 45 minutes','On Time'),('Mumbai','Jaipur','2023-10-31 09:00:00','2023-10-31 07:15:00',108,'Domestic','1 hour 45 minutes','On Time'),('Chennai','Kochi','2023-10-31 13:15:00','2023-10-31 11:30:00',109,'Domestic','1 hour 45 minutes','Delayed'),('Hyderabad','Vizag','2023-10-31 15:45:00','2023-10-31 14:00:00',110,'Domestic','1 hour 45 minutes','On Time'),('Kolkata','Patna','2023-10-31 18:00:00','2023-10-31 16:15:00',111,'Domestic','1 hour 45 minutes','On Time'),('Delhi','Mumbai','2023-10-31 21:30:00','2023-10-31 19:45:00',112,'Domestic','1 hour 45 minutes','On Time'),('Chennai','Bengaluru','2023-10-31 07:45:00','2023-10-31 06:00:00',113,'Domestic','1 hour 45 minutes','Delayed'),('Mumbai','Hyderabad','2023-10-31 09:45:00','2023-10-31 08:00:00',114,'Domestic','1 hour 45 minutes','On Time'),('Kolkata','Chennai','2023-10-31 12:15:00','2023-10-31 10:30:00',115,'Domestic','1 hour 45 minutes','On Time');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 17:40:52
