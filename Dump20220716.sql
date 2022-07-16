-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: resilia
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `DATA_NASCIMENTO` date DEFAULT NULL,
  `TURMAS_ID` int DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  KEY `TURMAS_ID` (`TURMAS_ID`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`TURMAS_ID`) REFERENCES `turmas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES ('11111111122','Maria','1997-08-10',1),('33333333322','Josefa','1996-12-05',2),('44444444488','Joana Maria da Silva','2000-06-01',1),('55555555544','Robert','2000-07-18',1),('55555555599','João José de Souza','1998-03-03',2),('77777777766','Pedro José','1999-11-24',2);
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) DEFAULT NULL,
  `TIPO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'WEB DEV FULLSTACK','TECNOLOGIA DA INFORMAÇÃO'),(2,'DATA ANALYTICS','CIENCIA DE DADOS');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LINK_REPOSITORIO` varchar(100) DEFAULT NULL,
  `MODULO` int DEFAULT NULL,
  `ALUNOS_CPF` varchar(11) DEFAULT NULL,
  `CONCEITO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ALUNOS_CPF` (`ALUNOS_CPF`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`ALUNOS_CPF`) REFERENCES `alunos` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,'https://github.com/jomaria/repoProjeto1',1,'44444444488','Ainda não está pronto'),(2,'https://github.com/jomaria/repoProjeto2',2,'44444444488','Mais do que pronto'),(3,'https://github.com/jojose8/repoProjeto1',1,'55555555599','Chegando lá'),(4,'https://github.com/jojose8/repoProjeto2',2,'55555555599','Mais do que pronto'),(5,'https://github.com/josefa/repoProjeto3',1,'33333333322','Ainda não está pronto'),(6,'https://github.com/maria2/repoProjeto2',1,'11111111122','Pronto'),(7,'https://github.com/pedro/repoProjeto4',1,'77777777766','Mais do que pronto'),(8,'https://github.com/robert/repoProjeto3',1,'55555555544','Chegando lá');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turmas`
--

DROP TABLE IF EXISTS `turmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turmas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NUMERO` int DEFAULT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `CURSOS_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CURSOS_ID` (`CURSOS_ID`),
  CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`CURSOS_ID`) REFERENCES `cursos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turmas`
--

LOCK TABLES `turmas` WRITE;
/*!40000 ALTER TABLE `turmas` DISABLE KEYS */;
INSERT INTO `turmas` VALUES (1,19,'Geração Futuro',1),(2,20,'Startech',2);
/*!40000 ALTER TABLE `turmas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-16 17:12:14
