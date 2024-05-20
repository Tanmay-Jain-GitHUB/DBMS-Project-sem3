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
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Age` int NOT NULL,
  `PassportNo` int NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `MName` varchar(50) DEFAULT NULL,
  `FName` varchar(50) NOT NULL,
  `Sex` varchar(50) NOT NULL,
  `FlightCode` int NOT NULL,
  PRIMARY KEY (`PassportNo`),
  KEY `FlightCode` (`FlightCode`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`FlightCode`) REFERENCES `flight` (`FlightCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (30,100001,'123-456-7890','123 Main St, Delhi','Smith','A','John','Male',101),(25,100002,'987-654-3210','456 Elm St, Maharashtra','Johnson','B','Mary','Female',102),(28,100003,'111-222-3333','789 Oak St, Karnataka','Brown','C','David','Male',103),(22,100004,'555-666-7777','101 Pine St, Tamil Nadu','Davis','D','Linda','Female',104),(35,100005,'999-888-7777','321 Cedar St, Telangana','Williams','E','Robert','Male',105),(27,100006,'777-888-9999','222 Birch St, West Bengal','Lee','F','Sarah','Female',106),(33,100007,'222-333-4444','987 Maple St, Gujarat','Martin','G','Kevin','Male',107),(29,100008,'333-222-1111','456 Oak St, Goa','Taylor','H','Jennifer','Female',108),(32,100009,'444-555-6666','555 Elm St, Rajasthan','Anderson','I','Michael','Male',109),(26,100010,'888-777-6666','321 Oak St, Kerala','Wilson','J','Elizabeth','Female',110);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
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
