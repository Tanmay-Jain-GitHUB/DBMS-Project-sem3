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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketNo` int NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Source` varchar(50) NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `Class` varchar(50) NOT NULL,
  `SeatNo` varchar(50) NOT NULL,
  `DateofTravel` datetime NOT NULL,
  `PassportNo` int NOT NULL,
  PRIMARY KEY (`TicketNo`),
  KEY `PassportNo` (`PassportNo`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PassportNo`) REFERENCES `passenger` (`PassportNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1001,'2000','Delhi','Mumbai','Economy','A25','2023-11-01 00:00:00',100001),(1002,'2500','Mumbai','Chennai','Business','B10','2023-11-02 00:00:00',100002),(1003,'1500','Kolkata','Bangalore','Economy','C15','2023-11-03 00:00:00',100003),(1004,'1800','Delhi','Hyderabad','Economy','D30','2023-11-04 00:00:00',100004),(1005,'3000','Chennai','Kolkata','Business','A12','2023-11-05 00:00:00',100005),(1006,'1200','Hyderabad','Delhi','Economy','B05','2023-11-06 00:00:00',100006),(1007,'2200','Mumbai','Bangalore','Economy','C20','2023-11-07 00:00:00',100007),(1008,'2600','Delhi','Kolkata','Business','D15','2023-11-08 00:00:00',100008),(1009,'1750','Bangalore','Chennai','Economy','A08','2023-11-09 00:00:00',100009),(1010,'1900','Chennai','Hyderabad','Economy','B25','2023-11-10 00:00:00',100010);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 17:40:50
