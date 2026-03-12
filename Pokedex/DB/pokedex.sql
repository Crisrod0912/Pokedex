CREATE DATABASE  IF NOT EXISTS `pokedex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pokedex`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: pokedex
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '2b9f1c4c-f49b-11f0-9172-18c04da8b6b8:1-434';

--
-- Table structure for table `enfermeria`
--

DROP TABLE IF EXISTS `enfermeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeria` (
  `AtencionID` int NOT NULL AUTO_INCREMENT,
  `NombrePokemon` varchar(100) DEFAULT NULL,
  `NombreDuenno` varchar(100) DEFAULT NULL,
  `Padecimiento` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AtencionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeria`
--

LOCK TABLES `enfermeria` WRITE;
/*!40000 ALTER TABLE `enfermeria` DISABLE KEYS */;
INSERT INTO `enfermeria` VALUES (1,'Pikachu','Ash','Fatiga','Pendiente'),(2,'Charizard','Brock','Insomnio','Pendiente'),(3,'Butterfree','Misty','Escalofríos','Pendiente'),(4,'Pidgeotto','Todd','Fiebre','Pendiente'),(5,'Bulbasaur','Ash','Herida en hoja','Pendiente'),(6,'Squirtle','Misty','Deshidratación','Pendiente'),(7,'Jigglypuff','Jessie','Pérdida de voz','Pendiente'),(8,'Meowth','James','Estrés','Pendiente');
/*!40000 ALTER TABLE `enfermeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `IdEntrenador` int NOT NULL AUTO_INCREMENT,
  `NombreEntrenador` varchar(100) DEFAULT NULL,
  `NombreEquipo` varchar(100) DEFAULT NULL,
  `Nivel` int DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdEntrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (1,'Ash Ketchum','Pikachu Squad',3,1),(2,'Brock','Charizard Crew',2,0),(3,'Misty','Squirtle Squad',1,1),(4,'Tracey Sketchit','Dragonite Force',4,1),(5,'May','Blaziken Team',2,0),(6,'Dawn','Piplup Party',3,1),(7,'Iris','Haxorus Clan',2,1),(8,'Cilan','Leavanny League',1,0),(9,'Serena','Sylveon Squad',4,1),(10,'Clemont','Luxray Force',3,1);
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `IdMensaje` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `Mensaje` text NOT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdMensaje`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `NombreUsuario` varchar(100) NOT NULL,
  `Contrasenna` varchar(255) NOT NULL,
  `Rol` enum('Admin','Entrenador','Enfermera') NOT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Rubius','Rubén','$2a$10$l8ZMjM.Qg0UnUd5r/TxqWeccY7WV1BZ0CYZpn52tQ6foDT4xkSlmC','Admin'),(2,'JuegaGerman','Germán','$2a$10$Ry96suy1J/gwSRltJkqYuuYOF6S9V9x4XFBLsWHsxqZQD1BOendtq','Entrenador'),(3,'WindyGirk','Katherine','$2a$10$2iuJ.zFuYZwBXnf6QgeHWe8dC7TUF.QVNEAJurWKpb5qHDXcFF7di','Enfermera');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-10 18:21:32
