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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Phone` varchar(50) NOT NULL,
  `Age` int NOT NULL,
  `Salary` int NOT NULL,
  `JobType` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `MName` varchar(50) DEFAULT NULL,
  `FName` varchar(50) NOT NULL,
  `SSN` int NOT NULL,
  `Sex` varchar(50) NOT NULL,
  `AP_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `AP_Name` (`AP_Name`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`AP_Name`) REFERENCES `airport` (`AP_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('111-222-3333',28,55000,'Mechanic','789 Oak St, Karnataka','Brown','C','David',111222333,'Male','Kempegowda International Airport'),('111-777-2222',27,52000,'Customer Service','987 Pine St, West Bengal','Hill','P','Emily',111777222,'Female','Netaji Subhas Chandra Bose International Airport'),('123-456-7890',30,60000,'Pilot','123 Main St, Delhi','Smith','A','John',123456789,'Male','Indira Gandhi International Airport'),('222-333-4444',33,68000,'Pilot','987 Maple St, Gujarat','Martin','G','Kevin',222333444,'Male','Sardar Vallabhbhai Patel International Airport'),('222-777-2222',28,57000,'Security','789 Birch St, Maharashtra','Harris','L','Jessica',222777222,'Female','Chhatrapati Shivaji International Airport'),('333-222-1111',29,60000,'Flight Attendant','456 Oak St, Goa','Taylor','H','Jennifer',333222111,'Female','Dabolim Airport'),('333-555-9999',29,59000,'Mechanic','444 Elm St, Telangana','Turner','O','Nicholas',333555999,'Male','Rajiv Gandhi International Airport'),('444-555-6666',32,70000,'Mechanic','555 Elm St, Rajasthan','Anderson','I','Michael',444555666,'Male','Jaipur International Airport'),('444-777-5555',31,64000,'Flight Attendant','123 Cedar St, Kerala','Perez','T','Sophia',444777555,'Female','Cochin International Airport'),('555-444-7777',28,56000,'Pilot','777 Elm St, Rajasthan','Gonzalez','S','Andrew',555444777,'Male','Jaipur International Airport'),('555-666-7777',22,40000,'Customer Service','101 Pine St, Tamil Nadu','Davis','D','Linda',555666777,'Female','Chennai International Airport'),('555-888-4444',24,43000,'Pilot','123 Cedar St, Karnataka','Clark','M','William',555888444,'Male','Kempegowda International Airport'),('666-555-4444',26,48000,'Security','321 Oak St, Goa','Baker','R','Olivia',666555444,'Female','Dabolim Airport'),('777-555-3333',31,66000,'Manager','222 Pine St, Delhi','Miller','K','Daniel',777555333,'Male','Indira Gandhi International Airport'),('777-888-9999',27,52000,'Security','222 Birch St, West Bengal','Lee','F','Sarah',777888999,'Female','Netaji Subhas Chandra Bose International Airport'),('777-999-6666',30,62000,'Flight Attendant','333 Oak St, Tamil Nadu','Walker','N','Samantha',777999666,'Female','Chennai International Airport'),('888-777-6666',26,49000,'Customer Service','321 Oak St, Kerala','Wilson','J','Elizabeth',888777666,'Female','Cochin International Airport'),('987-654-3210',25,45000,'Flight Attendant','456 Elm St, Maharashtra','Johnson','B','Mary',987654321,'Female','Chhatrapati Shivaji International Airport'),('999-333-7777',35,73000,'Manager','555 Birch St, Gujarat','Adams','Q','Matthew',999333777,'Male','Sardar Vallabhbhai Patel International Airport'),('999-888-7777',35,75000,'Manager','321 Cedar St, Telangana','Williams','E','Robert',999888777,'Male','Rajiv Gandhi International Airport');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
