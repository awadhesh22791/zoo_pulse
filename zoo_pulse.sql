CREATE DATABASE  IF NOT EXISTS `zoo_pulse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zoo_pulse`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: zoo_pulse
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `animal_feeding_logs`
--

DROP TABLE IF EXISTS `animal_feeding_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_feeding_logs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `animal_id` int NOT NULL COMMENT 'Animal who feed.',
  `staff_id` int NOT NULL COMMENT 'Staff member who feed the animal.',
  `feed_time` time NOT NULL COMMENT 'Feeding time.',
  `quantity` varchar(45) NOT NULL COMMENT 'Quantity of feeding materials.',
  `feeding_notes` text NOT NULL COMMENT 'Feeding note details',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_animal_feeding_logs_x_animals_idx` (`animal_id`),
  KEY `fk_animal_feeding_logs_x_staff_idx` (`staff_id`),
  CONSTRAINT `fk_animal_feeding_logs_x_animals` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`),
  CONSTRAINT `fk_animal_feeding_logs_x_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Animal feeding logs detail.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_feeding_logs`
--

LOCK TABLES `animal_feeding_logs` WRITE;
/*!40000 ALTER TABLE `animal_feeding_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_feeding_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_medical_history`
--

DROP TABLE IF EXISTS `animal_medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_medical_history` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `animal_id` int NOT NULL COMMENT 'Animal who is under observation.',
  `staff_id` int NOT NULL COMMENT 'Staff member id ',
  `date` date NOT NULL COMMENT 'Date of observation.',
  `diagnosis_report` text NOT NULL COMMENT 'Diagnosis report provided by vetenary doctor',
  `treatment` text NOT NULL COMMENT 'Treatment applied on animal.',
  `medication` text NOT NULL COMMENT 'Medication provided by staff member.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_animal_medical_history_x_animals_idx` (`animal_id`),
  KEY `fk_animal_medial_history_x_staff_idx` (`staff_id`),
  CONSTRAINT `fk_animal_medial_history_x_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  CONSTRAINT `fk_animal_medical_history_x_animals` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Medial history of animals';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_medical_history`
--

LOCK TABLES `animal_medical_history` WRITE;
/*!40000 ALTER TABLE `animal_medical_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enclosure_id` int NOT NULL,
  `species` varchar(45) NOT NULL COMMENT 'Species name of animal',
  `name` varchar(45) NOT NULL COMMENT 'Name of animal',
  `description` text NOT NULL COMMENT 'Description of animal',
  `birthdate` date DEFAULT NULL COMMENT 'Birthdate of animal',
  `gender` varchar(45) NOT NULL COMMENT 'Gender of animal',
  `health_status` varchar(45) NOT NULL COMMENT 'Health status of animal eg. healthy, unhealthy',
  `diet_plan` text NOT NULL COMMENT 'Diet plan for the animal',
  `precautions` text NOT NULL COMMENT 'Extra precaution details for animal.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_animals_x_enclosures_idx` (`enclosure_id`),
  CONSTRAINT `fk_animals_x_enclosures` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store animal details.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id of designation',
  `name` varchar(45) NOT NULL COMMENT 'Designation name.',
  `basic_responsibilities` text NOT NULL COMMENT 'Basic responsibilities associated with designation.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store designation details.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donations` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `donor_name` varchar(200) NOT NULL COMMENT 'Donor name',
  `mobile_number` varchar(45) NOT NULL COMMENT 'Donor mobile number',
  `email_id` varchar(45) NOT NULL COMMENT 'Donor email id',
  `amount` float NOT NULL COMMENT 'Donation amount.',
  `date` date NOT NULL COMMENT 'Date when donation is given.',
  `purpose` text NOT NULL COMMENT 'Purpose of donation. Eg. Animal care, enclosure development etc.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enclosure_assignment`
--

DROP TABLE IF EXISTS `enclosure_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enclosure_assignment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key of record.',
  `staff_member_id` int NOT NULL COMMENT 'Staff member id who is assigned to enclosure.',
  `enclosure_id` int NOT NULL COMMENT 'Enclosure id where staff member assigned.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Enclosure assignment detail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enclosure_assignment`
--

LOCK TABLES `enclosure_assignment` WRITE;
/*!40000 ALTER TABLE `enclosure_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enclosure_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enclosures`
--

DROP TABLE IF EXISTS `enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enclosures` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for enclosure.',
  `name` varchar(45) NOT NULL COMMENT 'Name of habitat',
  `size` varchar(45) NOT NULL COMMENT 'Size of enclosure.',
  `habitat_type` varchar(45) NOT NULL COMMENT 'Habitat type of enclosure eg. muddy, grass land, etc.',
  `capacity` int NOT NULL COMMENT 'Capacity of enclosure',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Enclosure details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enclosures`
--

LOCK TABLES `enclosures` WRITE;
/*!40000 ALTER TABLE `enclosures` DISABLE KEYS */;
/*!40000 ALTER TABLE `enclosures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_staffs`
--

DROP TABLE IF EXISTS `event_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_staffs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `event_id` int NOT NULL COMMENT 'Event id on which staff member assigned.',
  `staff_member_id` int NOT NULL COMMENT 'Staff member id assigned to event.',
  `rating` int DEFAULT NULL COMMENT 'Rating for staff member on event',
  `review` int DEFAULT NULL COMMENT 'Review detail for staff member on event',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Staff details involved in event.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_staffs`
--

LOCK TABLES `event_staffs` WRITE;
/*!40000 ALTER TABLE `event_staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for event.',
  `name` varchar(45) NOT NULL COMMENT 'Name of event',
  `date_time` datetime NOT NULL COMMENT 'Date time when event will be held.',
  `description` text NOT NULL COMMENT 'Description of event.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Event details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key of record.',
  `visitor_id` int NOT NULL COMMENT 'Visitor who given the feedback.',
  `date` date NOT NULL COMMENT 'Date when feedback is given.',
  `feedback` text NOT NULL COMMENT 'Feedback given by visitors',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_feedbacks_x_visitors_idx` (`visitor_id`),
  CONSTRAINT `fk_feedbacks_x_visitors` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to save feedbacks of visitors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designation_id` int NOT NULL COMMENT 'Designation of staff member.',
  `name` varchar(200) NOT NULL COMMENT 'Name of staff member.',
  `mobile_number` varchar(45) NOT NULL COMMENT 'Mobile number of staff member.',
  `address` text NOT NULL COMMENT 'Address of staff member.',
  `additiona_responsibilities` text NOT NULL COMMENT 'Specific responsibilities given to staff member.',
  `current_shift_schidule` varchar(45) DEFAULT NULL COMMENT 'Current shift schedule',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `update_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_staff_member_x_designation_idx` (`designation_id`),
  CONSTRAINT `fk_staff_member_x_designation` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store staff details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key for record.',
  `visitor_id` int NOT NULL COMMENT 'Visitor id who purchase the ticket.',
  `ticket_number` varchar(45) NOT NULL COMMENT 'Ticket number to display on ticket.',
  `event_id` int DEFAULT NULL COMMENT 'Event id if applicable.',
  `purchase_date` date NOT NULL COMMENT 'Purchase date of ticket.',
  `type` varchar(45) NOT NULL COMMENT 'Type of ticket eg. general, premium, etc.',
  `price` float NOT NULL COMMENT 'Price of ticket.',
  `payment_status` varchar(45) NOT NULL COMMENT 'Payment status of ticket.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`),
  KEY `fk_tickets_x_visitor_idx` (`visitor_id`),
  CONSTRAINT `fk_tickets_x_visitor` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store ticket details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id of visitor',
  `name` varchar(200) NOT NULL COMMENT 'Name of visitor',
  `age` int DEFAULT NULL COMMENT 'Age of visitor',
  `contact_information` text COMMENT 'Contact details of visitor.',
  `created_at` timestamp NOT NULL COMMENT 'Date when record is created.',
  `updated_at` timestamp NOT NULL COMMENT 'Date when record is updated.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table to store visitor details.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03 21:45:20
