CREATE DATABASE  IF NOT EXISTS `bolsa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bolsa`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bolsa
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
-- Table structure for table `lista_empleado`
--

DROP TABLE IF EXISTS `lista_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `empleado_nombre` varchar(50) NOT NULL,
  `empleado_apellido` varchar(50) NOT NULL,
  `empleado_correo` varchar(60) NOT NULL,
  `empleado_dni` varchar(9) NOT NULL,
  `empleado_ubicacion` varchar(60) NOT NULL,
  `empleado_telefono` varchar(35) NOT NULL,
  `empleado_img` longblob NOT NULL,
  `empleado_cv` longblob NOT NULL,
  `empleado_hash` longtext NOT NULL,
  `empleado_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_empleado`
--

LOCK TABLES `lista_empleado` WRITE;
/*!40000 ALTER TABLE `lista_empleado` DISABLE KEYS */;
INSERT INTO `lista_empleado` VALUES (1,'Tomás Ariel','Vargas','vargastomaset32@gmail.com','45238491','Huaura 1483','1126365060',_binary 'que',_binary 'aaaa','cabdd3f3d61965e3b5e1b322b79a3920','2022-12-16 05:55:50'),(2,'Tomatotr','asdasda','tucococ@gmailñ.com ','123232322','sdsdsds','2323232',_binary 'sdsdssd',_binary 'asdasd','sdsdsds','2023-01-31 06:12:52'),(18,'Tomatotr','asdasda','vargasotmsdsdsasssdsdsdsdet@gmail.com','123232322','sdsdsds','2323232',_binary 'sdsdssd',_binary 'asdasd','*******','2023-01-31 08:45:56'),(19,'Tomatotr','asdasda','vargasotmsdsdsasssdsdsdsdet@gmail.com','123232322','sdsdsds','2323232',_binary 'sdsdssd',_binary 'asdasd','*******','2023-01-31 08:46:15'),(20,'Tomatotr','asdasda','vargasotmsdsdsasssdsdsdsdet@gmail.com','123232322','sdsdsds','2323232',_binary 'sdsdssd',_binary 'asdasd','*******','2023-01-31 08:47:11'),(21,'Tuco','Tuco','Tuco@gmail.com','123123','asdasd','123123',_binary 'asdasd',_binary 'Tuco','Tuco','2023-02-12 07:20:40'),(22,'Tuco','Tuco','Tussco@gmail.com','123123','asdasd','123123',_binary 'asdasd',_binary 'Tuco','Tuco','2023-02-12 07:22:53'),(23,'Tuco','Tuco','Tudsdsdssco@gmail.com','123123','asdasd','123123',_binary 'asdasd',_binary 'Tuco','Tuco','2023-02-12 07:23:15'),(24,'Tuco','Tuco','tomatote@gmail.com','123123','asdasd','123123',_binary 'asdasd',_binary 'Tuco','Tuco','2023-02-12 23:23:17');
/*!40000 ALTER TABLE `lista_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_empleador`
--

DROP TABLE IF EXISTS `lista_empleador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_empleador` (
  `id_empleador` int NOT NULL AUTO_INCREMENT,
  `empleador_nombre` varchar(50) NOT NULL,
  `empleador_apellido` varchar(50) NOT NULL,
  `empleador_correo` varchar(45) NOT NULL,
  `empleador_dni` varchar(8) NOT NULL,
  `empleador_telefono` varchar(20) NOT NULL,
  `empleador_empresa` int NOT NULL,
  `empleador_hash` longtext NOT NULL,
  PRIMARY KEY (`id_empleador`),
  KEY `lista_empleador_ibfk_1` (`empleador_empresa`),
  CONSTRAINT `lista_empleador_ibfk_1` FOREIGN KEY (`empleador_empresa`) REFERENCES `lista_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_empleador`
--

LOCK TABLES `lista_empleador` WRITE;
/*!40000 ALTER TABLE `lista_empleador` DISABLE KEYS */;
INSERT INTO `lista_empleador` VALUES (1,'Tuco','Oyea ','tuco@gmail.com','123154','54654656232',1,'cabdd3f3d61965e3b5e1b322b79a3920'),(4,'Tuco','Tuco','tuco@gmail.com','123123','123123',4,'Tuco'),(5,'tuco','Vargas','tomatote@gmail.com','45238491','1126365060',1,'tuco');
/*!40000 ALTER TABLE `lista_empleador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_empresa`
--

DROP TABLE IF EXISTS `lista_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `empresa_cuit` varchar(12) NOT NULL,
  `empresa_nombre` varchar(60) NOT NULL,
  `empresa_rubro` varchar(70) NOT NULL,
  `empresa_descripcion` longtext NOT NULL,
  `empresa_ubicacion` varchar(60) NOT NULL,
  `empresa_correo` varchar(60) NOT NULL,
  `empresa_img` longblob NOT NULL,
  `empresa_telefono` varchar(18) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_empresa`
--

LOCK TABLES `lista_empresa` WRITE;
/*!40000 ALTER TABLE `lista_empresa` DISABLE KEYS */;
INSERT INTO `lista_empresa` VALUES (1,'1231231','tuco','Informática / Software','asdasdasdkj1oi23uc 1oi2u3oi1u23oi1u2doni3 1hoil23hj1oi|2u31oi2j 4oiru1i2u34od2h35iu3y4t92 3uo4tiuy243iu56y24oiu5ht2i4y5iu24ci5jthc2oi4u5to24h5lk6jt2h45kjth42lij6y24opi5u62op4i5uy6opi24u56oi24up5o6iu24io5vuyjoirfgudoifjgshoiruytopierufe','Huaura 1483','asd@gmail.com',_binary 'que','1126365060'),(2,'123123123','Ouyea','Ouyea','Ouyea','Ouyea','ouyea@gmail.com',_binary 'Ouyea','123123123'),(3,'Tuco','Tuco','qweqw','asdasda','123123','Tudsdsdssco@gmail.com',_binary 'asdasd','Tuco'),(4,'Tuco','Tuco','qweqw','asdasda','123123','Tudsdsdssdsdssco@gmail.com',_binary 'asdasd','Tuco');
/*!40000 ALTER TABLE `lista_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_estudios`
--

DROP TABLE IF EXISTS `lista_estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_estudios` (
  `id_estudios` int NOT NULL AUTO_INCREMENT,
  `estudios_empleado` int NOT NULL,
  `estudios_titulo` varchar(200) NOT NULL,
  `estudios_promedio` double NOT NULL,
  `estudios_descripcion` varchar(400) NOT NULL,
  `estudios_fecha_inicio` date NOT NULL,
  `estudios_fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_estudios`),
  KEY `estudios_empleado` (`estudios_empleado`),
  CONSTRAINT `lista_estudios_ibfk_1` FOREIGN KEY (`estudios_empleado`) REFERENCES `lista_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_estudios`
--

LOCK TABLES `lista_estudios` WRITE;
/*!40000 ALTER TABLE `lista_estudios` DISABLE KEYS */;
INSERT INTO `lista_estudios` VALUES (11,24,'ASDASD',23123,'ASDASD','0000-00-00','0000-00-00'),(13,24,'ASDASD',23123,'ASDASD','0000-00-00','0000-00-00'),(14,24,'ASDASD',23123,'ASDASD','0000-00-00','0000-00-00'),(15,24,'sdsds',0,'asdasda','1231-03-12','1231-03-21'),(16,24,'asdasd',0,'asdasdas','0000-00-00','0312-12-23'),(18,24,'asd',0,'asda','0123-03-12','0312-12-23'),(21,24,'Ingeniero en Informatica',8.9,'asda','2020-02-12','2030-12-12');
/*!40000 ALTER TABLE `lista_estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_experiencia`
--

DROP TABLE IF EXISTS `lista_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_experiencia` (
  `id_experiencia` int NOT NULL AUTO_INCREMENT,
  `experiencia_empleado` int NOT NULL,
  `experiencia_empresa` varchar(45) DEFAULT NULL,
  `experiencia_titulo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `experiencia_rubro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `experiencia_descripcion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `experiencia_fecha_inicio` date NOT NULL,
  `experiencia_fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_experiencia`),
  KEY `experiencia_empleado` (`experiencia_empleado`),
  CONSTRAINT `lista_experiencia_ibfk_1` FOREIGN KEY (`experiencia_empleado`) REFERENCES `lista_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_experiencia`
--

LOCK TABLES `lista_experiencia` WRITE;
/*!40000 ALTER TABLE `lista_experiencia` DISABLE KEYS */;
INSERT INTO `lista_experiencia` VALUES (1,24,'Tuco','Tuco','123123','Tudsdsdssco@gmail.com','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `lista_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_idioma`
--

DROP TABLE IF EXISTS `lista_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_idioma` (
  `id_idioma` int NOT NULL AUTO_INCREMENT,
  `idioma_empleado` int NOT NULL,
  `idioma_idioma` varchar(40) NOT NULL,
  `idioma_nivel` varchar(40) NOT NULL,
  PRIMARY KEY (`id_idioma`),
  KEY `idioma_empleado` (`idioma_empleado`),
  CONSTRAINT `lista_idioma_ibfk_1` FOREIGN KEY (`idioma_empleado`) REFERENCES `lista_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_idioma`
--

LOCK TABLES `lista_idioma` WRITE;
/*!40000 ALTER TABLE `lista_idioma` DISABLE KEYS */;
INSERT INTO `lista_idioma` VALUES (39,24,'Spanish','Muy basico'),(40,24,'Spanish','Muy basico'),(44,24,'Spanish','Muy basico'),(45,24,'Arabic','Muy basico'),(46,24,'Spanish','Muy basico'),(47,24,'Spanish','Muy basico');
/*!40000 ALTER TABLE `lista_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_pasantias`
--

DROP TABLE IF EXISTS `lista_pasantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_pasantias` (
  `id_pasantias` int NOT NULL AUTO_INCREMENT,
  `pasantias_empresa` int NOT NULL,
  `pasantias_titulo` varchar(60) NOT NULL,
  `pasantias_descripcion` longtext NOT NULL,
  `pasantias_requisitos` varchar(80) NOT NULL,
  `pasantias_cantidad` int NOT NULL,
  `pasantias_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pasantias`),
  KEY `pasantias_empresa` (`pasantias_empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_pasantias`
--

LOCK TABLES `lista_pasantias` WRITE;
/*!40000 ALTER TABLE `lista_pasantias` DISABLE KEYS */;
INSERT INTO `lista_pasantias` VALUES (1,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:44'),(2,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:45'),(3,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:46'),(4,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:47'),(5,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:47'),(6,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:47'),(7,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(8,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(9,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(10,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(11,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(12,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(13,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:48'),(14,4,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:34:49'),(15,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:37'),(16,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:37'),(17,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:37'),(18,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:37'),(19,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:37'),(20,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:37'),(21,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:38'),(22,5,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:38'),(23,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:56'),(24,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:56'),(25,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(26,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(27,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(28,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(29,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(30,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(31,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:57'),(32,1,'ASDASDA','ASDASDASDASD','ASDADASDASD',2,'2023-02-16 00:43:58');
/*!40000 ALTER TABLE `lista_pasantias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_pasantias_empleado`
--

DROP TABLE IF EXISTS `lista_pasantias_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_pasantias_empleado` (
  `id_pasantias` int NOT NULL,
  `pasantias_empleado` int NOT NULL,
  `pasantias_empresa` varchar(80) NOT NULL,
  `pasantias_titulo` varchar(60) NOT NULL,
  `pasantias_descripcion` longtext NOT NULL,
  PRIMARY KEY (`id_pasantias`),
  KEY `pasantias_empleado` (`pasantias_empleado`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_pasantias_empleado`
--

LOCK TABLES `lista_pasantias_empleado` WRITE;
/*!40000 ALTER TABLE `lista_pasantias_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_pasantias_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_postulados`
--

DROP TABLE IF EXISTS `lista_postulados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_postulados` (
  `id_postulados` int NOT NULL AUTO_INCREMENT,
  `postulados_vacante` int DEFAULT NULL,
  `postulados_empleado` int DEFAULT NULL,
  `postulados_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_postulados`),
  KEY `postulados_empleado` (`postulados_empleado`),
  KEY `lista_postulados_ibfk_1` (`postulados_vacante`),
  CONSTRAINT `lista_postulados_ibfk_1` FOREIGN KEY (`postulados_vacante`) REFERENCES `lista_vacante` (`id_vacante`),
  CONSTRAINT `lista_postulados_ibfk_2` FOREIGN KEY (`postulados_empleado`) REFERENCES `lista_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_postulados`
--

LOCK TABLES `lista_postulados` WRITE;
/*!40000 ALTER TABLE `lista_postulados` DISABLE KEYS */;
INSERT INTO `lista_postulados` VALUES (12,1,1,'2023-02-16 20:18:36'),(16,2,2,'2023-02-16 20:22:44'),(20,3,2,'2023-02-16 20:22:53'),(23,2,1,'2023-02-16 20:23:55'),(35,2,24,'2023-02-17 09:00:45'),(36,3,24,'2023-02-17 09:00:48'),(37,1,24,'2023-02-17 12:15:34'),(38,5,24,'2023-02-17 12:15:46');
/*!40000 ALTER TABLE `lista_postulados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_vacante`
--

DROP TABLE IF EXISTS `lista_vacante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_vacante` (
  `id_vacante` int NOT NULL AUTO_INCREMENT,
  `vacante_titulo` varchar(50) NOT NULL,
  `vacante_descripcion` longtext NOT NULL,
  `vacante_salario` double NOT NULL,
  `vacante_cantidad` int NOT NULL,
  `vacante_ubicacion` varchar(60) NOT NULL,
  `vacante_requisitos` varchar(200) NOT NULL,
  `vacante_empresa` int NOT NULL,
  `vacante_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_vacante`),
  KEY `lista_vacante_ibfk_1` (`vacante_empresa`),
  CONSTRAINT `lista_vacante_ibfk_1` FOREIGN KEY (`vacante_empresa`) REFERENCES `lista_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_vacante`
--

LOCK TABLES `lista_vacante` WRITE;
/*!40000 ALTER TABLE `lista_vacante` DISABLE KEYS */;
INSERT INTO `lista_vacante` VALUES (1,'Algun puesto','Lol',10000,2,'micasa','aaaa',1,'2022-12-16 02:57:25'),(2,'asdasd','sdsd',220000,2,'Huaura 1483','sdsds',1,'2022-12-16 03:02:48'),(3,'sdsd','asdasd',10000,2,'asdasd','asdasd',1,'2022-12-16 03:03:08'),(4,'sdsdsd','asdasd',10000,1,'asda','asdasd',1,'2022-12-16 03:03:34'),(5,'asdasdasda','asdasd',200000,3,'asdas','asdasd',1,'2022-12-16 03:03:48');
/*!40000 ALTER TABLE `lista_vacante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_empleado`
--

DROP TABLE IF EXISTS `view_empleado`;
/*!50001 DROP VIEW IF EXISTS `view_empleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_empleado` AS SELECT 
 1 AS `id_empleado`,
 1 AS `empleado_dni`,
 1 AS `empleado_nombre`,
 1 AS `empleado_apellido`,
 1 AS `empleado_correo`,
 1 AS `empleado_ubicacion`,
 1 AS `estudios_titulo`,
 1 AS `estudios_descripcion`,
 1 AS `estudios_promedio`,
 1 AS `experiencia_titulo`,
 1 AS `experiencia_descripcion`,
 1 AS `experiencia_rubro`,
 1 AS `idioma_idioma`,
 1 AS `idioma_nivel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_empleador`
--

DROP TABLE IF EXISTS `view_empleador`;
/*!50001 DROP VIEW IF EXISTS `view_empleador`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_empleador` AS SELECT 
 1 AS `id_empleador`,
 1 AS `empleador_nombre`,
 1 AS `empleador_apellido`,
 1 AS `empleador_dni`,
 1 AS `empleador_telefono`,
 1 AS `empleador_correo`,
 1 AS `empleador_empresa`,
 1 AS `id_empresa`,
 1 AS `empresa_nombre`,
 1 AS `empresa_img`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bolsa'
--
/*!50003 DROP FUNCTION IF EXISTS `activarSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `activarSession`(
empleado__session longtext
) RETURNS longtext CHARSET utf8mb4
BEGIN
	IF(EXISTS(SELECT * FROM lista_session WHERE empleado_session = empleado__session))THEN
		UPDATE lista_Session SET session_estado = TRUE WHERE empleado_session = empleado__session;
		RETURN (SELECT hash_session FROM lista_session WHERE empleado_session = empleado__session);
	ELSE
		RETURN 0;    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `activarSessionEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `activarSessionEmpleador`(
empleador__session longtext
) RETURNS longtext CHARSET utf8mb4
BEGIN
	IF(EXISTS(SELECT * FROM lista_session_empleador WHERE empleador_session = empleador__session))THEN
		UPDATE lista_session_empleador SET session_estado = TRUE WHERE empleador_session = empleador__session;
		RETURN (SELECT hash_session FROM lista_session_empleador WHERE empleador_session = empleador__session);
	ELSE
		RETURN 0;    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cerrarSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cerrarSession`(
hash__session longtext
) RETURNS tinyint(1)
BEGIN
UPDATE lista_session SET session_estado=0 WHERE hash_session = hash__session;
RETURN TRUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cerrarSessionEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cerrarSessionEmpleador`(
hash__session longtext
) RETURNS tinyint(1)
BEGIN
UPDATE lista_session_empleador SET session_estado=0 WHERE hash_session = hash__session;
RETURN TRUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteEmplador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteEmplador`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_empleador WHERE id_empleador = id)) THEN
		DELETE FROM lista_empleador WHERE id_empleador = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteEmpleado`(id__empleado INT) RETURNS tinyint(1)
BEGIN
DELETE FROM lista_estudios WHERE estudios_empleado = id__empleado;
DELETE FROM lista_experiencia WHERE experiencia_empleado = id__empleado;
DELETE FROM lista_idioma WHERE idioma_empleado = id__empleado;
DELETE FROM lista_empleado WHERE id_empleado = id__empleado;

IF(EXISTS(SELECT * FROM lista_empleado WHERE id_empleado = id__empleado)) THEN
RETURN FALSE;
ELSE
RETURN TRUE;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteEmpleador`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_empleador WHERE id_empleador = id)) THEN
		DELETE FROM lista_empleador WHERE id_empleador = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteEstudios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteEstudios`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_estudios WHERE id_estudios = id)) THEN
		DELETE FROM lista_estudios WHERE id_estudios = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteExperiencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteExperiencia`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_experiencia WHERE id_experiencia = id)) THEN
		DELETE FROM lista_experiencia WHERE id_experiencia = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteExperincia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteExperincia`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_experiencia WHERE id_experiencia = id)) THEN
		DELETE FROM lista_experiencia WHERE id_experiencia = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteIdioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteIdioma`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_idioma WHERE id_idioma = id)) THEN
		DELETE FROM lista_idioma WHERE id_idioma = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deletePasantias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deletePasantias`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_pasantias WHERE id_pasantias = id)) THEN
		DELETE FROM lista_pasantias WHERE id_pasantias = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deletePostulados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deletePostulados`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_postulados WHERE id_postulados = id)) THEN
		DELETE FROM lista_postulados WHERE id_postulados = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deleteVacante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deleteVacante`(id int) RETURNS tinyint(1)
BEGIN
	IF(EXISTS(SELECT * FROM lista_vacante WHERE id_vacante = id)) THEN
		DELETE FROM lista_vacante WHERE id_vacante = id;
        RETURN 1;
	ELSE
		RETURN 0;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `existenciaCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `existenciaCorreo`(
`correo`varchar(35),
caso int
) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE _mensaje TEXT DEFAULT "Hubo un error";

CASE
	WHEN caso = 1 THEN
		IF(EXISTS(SELECT `empleado_correo` FROM `lista_empleado` WHERE `empleado_correo`=`correo`))THEN
			SET _mensaje="El correo existe";
		ELSE
			SET _mensaje = "ok";
		END IF;
            WHEN caso = 2 THEN
		IF(EXISTS(SELECT `empresa_correo` FROM `lista_empresa` WHERE `empresa_correo`=`correo`))THEN
			SET _mensaje="El correo existe";
		ELSE
			SET _mensaje = "ok";
		END IF;
	WHEN caso = 3 THEN
		IF(EXISTS(SELECT `empleador_correo` FROM `lista_empleador` WHERE `empleador_correo`=`correo`))THEN
			SET _mensaje="El correo existe";
		ELSE
			SET _mensaje = "ok";
		END IF;
	ELSE
		SET _mensaje="xd";
END CASE;
RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setEmpleado`(`empleado__nombre` varchar(50),
    `empleado__apellido` varchar(50),
    `empleado__dni` varchar(9),
    `empleado__correo` varchar(60),
    `empleado__telefono` varchar(35),
    `empleado__img` longblob,
    `empleado__ubicacion` varchar(60),
    `empleado__cv` longblob,
    `empleado__hash` longtext
) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE _mensaje TEXT DEFAULT "HUBO UN ERROR";


-- ------------------------------------------------VALIDACION--------------------------------------------------------
-- VERIFICAR QUE EL MAIL NO EXISTA
	SET _mensaje =  (SELECT existenciaCorreo(empleado__correo,1));

-- Validar Nombre(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empleado__nombre, "Nombre", 1));
END IF;

-- Validar Nombre(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleado__nombre, 4, 50, " ","Nombre", 1));
END IF;

-- Validar Apellido(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__apellido, "Apellido", 1));
END IF;

-- Validar Apellido(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleado__apellido, 2, 50, " ","Apellido", 1));
END IF;

-- Validar Correo(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__correo,"Correo", 1));   
END IF;

-- Validar Correo
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarCorreo(empleado__correo,"Correo"));   
END IF;

-- Validar documento(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__dni,"Documento", 1));   
END IF;

-- Validar documento(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleado__dni, 0, 9, "","Documento", 1));
END IF;

-- Validar Ubicacion(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__ubicacion,"Ubicacion", 1));   
END IF;

-- Validar Ubicacion(Longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleado__ubicacion, 0, 60, "","Ubicacion", 1));
END IF;

-- Validar Telefono(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__telefono,"Telefono", 1));   
END IF;

-- Validar Telefono(Longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleado__telefono, 0, 15, "","Telefono",1));
END IF;

-- Validar Img(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__img,"IMG", 1));   
END IF;

-- Validar Curriculum(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__cv,"Curriculum", 1));   
END IF;

-- Validar HASH(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleado__hash,"Hash", 1));   
END IF;


-- ------------------------------------------------INSERT--------------------------------------------------------
IF(_mensaje = "ok") THEN
INSERT INTO
    lista_empleado (
        empleado_nombre,
        empleado_apellido,
        empleado_correo,
        empleado_dni,
        empleado_ubicacion,
        empleado_telefono,
        empleado_img,
        empleado_cv,
        empleado_hash
    )
VALUES
    (
        empleado__nombre,
        empleado__apellido,
        empleado__correo,
        empleado__dni,
        empleado__ubicacion,
        empleado__telefono,
        empleado__img,
        empleado__cv,
        empleado__hash
    );
    
SET _mensaje = "ok";
END IF;
IF(_mensaje="ok")THEN
	SET _mensaje="REGISTRO CREADO";
END IF;
RETURN _mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setEmpleador`(`empleador__nombre` VARCHAR(50),
    `empleador__apellido` VARCHAR(50), 
    `empleador__correo` VARCHAR(50),
    `empleador__dni` VARCHAR(8),
    `empleador__telefono` VARCHAR(20),
    `empleador__empresa` INT,
    `empleador__hash` longtext
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje TEXT DEFAULT "HUBO UN ERROR";

-- ------------------------------------------------Validacion------------------------------------------------------

-- Validar empleador__nombre(Vacio)
SET _mensaje = (SELECT verificarVacio(empleador__nombre, "empleador__nombre", 1));

-- Validar empleador__nombre(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleador__nombre, 2, 50, " ","empleador__nombre", 1));
END IF;

-- Validar empleador__apellido(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = ( SELECT verificarVacio(empleador__apellido,"empleador__apellido", 1));   
END IF;

-- Validar empleador__apellido(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleador__apellido, 2, 50, " ","empleador__apellido", 1));
END IF;

-- Validar empleador__dni(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleador__dni,"empleador__dni", 1));   
END IF;

-- Validar empleador__dni(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleador__dni, 1, 9, " ","empleador__dni", 1));
END IF;

-- Validar empleador__correo(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleador__correo,"empleador__correo", 1));   
END IF;

-- Validar empleador__correo(existencia)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT existenciaCorreo(empleador__correo,3));   
END IF;

-- Validar empleador__correo(mail)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarCorreo(empleador__correo,"empleador__correo"));   
END IF;

-- Validar empleador__telefono(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleador__telefono,"empleador__telefono", 1));   
END IF;

-- Validar empleador__telefono(Longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empleador__telefono, 8, 20, " ","empleador__telefono", 1));
END IF;

-- Validar empleador__empresa(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleador__empresa,"empleador__empresa", 1));   
END IF;

-- Validar empleador__empresa(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(empleador__empresa,"empleador__empresa"));
END IF;

-- Validar empleador__hash(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(empleador__hash,"empleador__hash", 1));   
END IF;

-- ------------------------------------------------INSERT------------------------------------------------------

IF(_mensaje = "ok") THEN
    INSERT INTO
        `lista_empleador`
        (	id_empleador,
			empleador_nombre,
            empleador_apellido,
            empleador_correo,
            empleador_dni,
            empleador_telefono,
            empleador_empresa,
            empleador_hash
        )
    VALUES
        (
			null,
            empleador__nombre,
            empleador__apellido,
            empleador__correo,
            empleador__dni,
            empleador__telefono,
            empleador__empresa,
            empleador__hash
        );

SET
    _mensaje = "ok";
END IF;
IF(_mensaje = "ok")THEN
    SET _mensaje = "REGISTRO CREADO";
END IF;
RETURN _mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setEmpresa`(`empresa__cuit` varchar(12),
    `empresa__nombre` varchar(60),
    `empresa__rubro` varchar(70),
    `empresa__descripcion` longtext,
    `empresa__ubicacion` varchar(60),
    `empresa__correo` varchar(60),
    `empresa__img` longblob,
    `empresa__telefono` varchar(18)
) RETURNS text CHARSET utf8mb4
BEGIN 
DECLARE _mensaje TEXT ;
SET _mensaje = "Se prudujo un error agregando el usuario";

-- --------------------------------------------------------VALIDACION-----------------------------------------------------------

-- Validar empresa__cuit(Vacio)
SET _mensaje = (SELECT verificarVacio(empresa__cuit, "empresa__cuit", 1));

-- Validar empresa__correo(existencia)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT existenciaCorreo(empresa__correo,2));
END IF;

-- Validar empresa__cuit(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empresa__cuit, 2, 12, " ","empresa__cuit", 1));
END IF;

-- Validar empresa__nombre(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__nombre, "empresa__nombre", 1));
END IF;

-- Validar empresa__nombre(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empresa__nombre, 2, 60, " ","empresa__nombre", 1));
END IF;

-- Validar empresa__rubro(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__rubro, "empresa__rubro", 1));
END IF;

-- Validar empresa__rubro(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empresa__rubro, 2, 70, " ","empresa__rubro", 1));
END IF;

-- Validar empresa__descripcion(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__descripcion, "empresa__descripcion", 1));
END IF;

-- Validar empresa__ubicacion(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__ubicacion, "empresa__ubicacion", 1));
END IF;

-- Validar empresa__ubicacion(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empresa__ubicacion, 2, 60, " ","empresa__ubicacion", 1));
END IF;

-- Validar empresa__correo(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__correo, "empresa__correo", 1));
END IF;

-- Validar empresa__correo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarCorreo(empresa__correo,"Correo"));   
END IF;

-- Validar empresa__telefono(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__telefono, "empresa__telefono", 1));
END IF;

-- Validar empresa__img(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(empresa__img, "empresa__img", 1));
END IF;

-- Validar empresa__telefono(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(empresa__telefono, 2, 15, " ","empresa__telefono", 1));
END IF;

-- ---------------------------------------------------------INSERT-------------------------------------------------------------------

IF(_mensaje = "ok") THEN
INSERT INTO
    `lista_empresa`
    (
		id_empresa,
		empresa_cuit,
        empresa_nombre,
        empresa_rubro,
        empresa_descripcion,
        empresa_ubicacion,
        empresa_correo,
        empresa_img,
        empresa_telefono
    )
VALUES
    (
		null,
        empresa__cuit,
        empresa__nombre,
        empresa__rubro,
        empresa__descripcion,
        empresa__ubicacion,
        empresa__correo,
        empresa__img,
        empresa__telefono
    );

SET _mensaje = "REGISTRO CREADO";

END IF;

    RETURN _mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setEstudios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setEstudios`(`estudios__empleado` INT,
    `estudios__titulo` VARCHAR(200),
    `estudios__promedio` double,
    `estudios__descripcion` VARCHAR(400),
    `estudios__fecha_inicio` DATE,
    `estudios__fecha_fin` DATE
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje text DEFAULT "HUBO UN ERROR";

-- -----------------------------------------------------------VALIDACION-----------------------------------------------------------------------------

-- Validar estudios__empleado(Vacio)
SET _mensaje = (SELECT verificarVacio(estudios__empleado, "estudios__empleado", 1));

-- Validar estudios__empleado(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(estudios__empleado,"estudios__empleado"));
END IF;

-- Validar estudios__titulo(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = ( SELECT verificarVacio(estudios__titulo,"estudios__titulo", 1));   
END IF;

-- Validar estudios__titulo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(estudios__titulo, 2, 200, "maximo","estudios__titulo", 1));
END IF;

-- Validar estudios__promedio(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(estudios__promedio,"estudios__promedio", 1));   
END IF;

-- Validar estudios__descripcion(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(estudios__descripcion,"estudios__descripcion", 1));   
END IF;

-- Validar estudios__descripcion(Longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(estudios__descripcion, 2, 400, "maximo","estudios__descripcion", 1));
END IF;

-- Validar estudios__fecha_inicio(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(estudios__fecha_inicio,"estudios__fecha_inicio", 1));   
END IF;

-- Validar estudios__fecha_fin(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(estudios__fecha_fin,"estudios__fecha_fin", 1));   
END IF;

-- -----------------------------------------------------------INSERT-----------------------------------------------------------------------------

IF(_mensaje = "ok") THEN
INSERT INTO `lista_estudios`
(		
		id_estudios,
        estudios_empleado,
        estudios_titulo,
        estudios_promedio,
        estudios_descripcion,
        estudios_fecha_inicio,
        estudios_fecha_fin
)
VALUES
	(
        NULL,
        estudios__empleado,
        estudios__titulo,
        estudios__promedio,
        estudios__descripcion,
        estudios__fecha_inicio,
        estudios__fecha_fin
    );

SET _mensaje = "REGISTRO CREADO";
END IF;
RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setExperiencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setExperiencia`(`experiencia__empleado` INT,
	`experiencia__empresa` varchar(45),
    `experiencia__titulo` VARCHAR(200),
    `experiencia__rubro` VARCHAR(200),
    `experiencia__descripcion` LONGTEXT,
    `experiencia__fecha_inicio` DATE,
    `experiencia__fecha_fin` DATE
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje text DEFAULT "Se prudujo un error agregando el usuario";

-- ---------------------------------------------------------VALIDACION-------------------------------------------------------------------

-- Validar experiencia__empleado(Vacio)
SET _mensaje = (SELECT verificarVacio(experiencia__empleado, "experiencia__empleado", 1));

-- Validar experiencia__empleado(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(experiencia__empleado,"experiencia__empleado"));
END IF;

-- Validar experiencia__titulo(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = ( SELECT verificarVacio(experiencia__titulo,"experiencia__titulo", 1));   
END IF;

-- Validar experiencia__titulo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(experiencia__titulo, 2, 200, "maximo","experiencia__titulo", 1));
END IF;

-- Validar experiencia__rubro(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(experiencia__rubro,"experiencia__rubro", 1));   
END IF;

-- Validar experiencia__rubro(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(experiencia__rubro, 2, 200, "maximo","experiencia__rubro", 1));
END IF;

-- Validar experiencia__fecha_inicio(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(experiencia__fecha_inicio,"experiencia__fecha_inicio", 1));   
END IF;

-- Validar experiencia__fecha_fin(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(experiencia__fecha_fin,"experiencia__fecha_fin", 1));   
END IF;

-- Validar experiencia__empresa(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(experiencia__empresa,"experiencia__empresa", 1));   
END IF;

-- Validar experiencia__empresa(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(experiencia__empresa, 2, 200, "","experiencia__empresa", 1));
END IF;


-- ---------------------------------------------------------INSERT-------------------------------------------------------------------

IF(_mensaje = "ok") THEN
INSERT INTO 
`lista_experiencia`
(
		id_experiencia,
		experiencia_empleado,
        experiencia_empresa,
        experiencia_titulo,
        experiencia_rubro,
        experiencia_descripcion,
        experiencia_fecha_inicio,
        experiencia_fecha_fin
)
VALUES(	
		null,
        experiencia__empleado,
        experiencia__empresa,
        experiencia__titulo,
        experiencia__rubro,
        experiencia__descripcion,
        experiencia__fecha_inicio,
        experiencia__fecha_fin
    );

SET _mensaje = "REGISTRO CREADO";
END IF;

RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setIdioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setIdioma`(idioma__empleado int,
 idioma__idioma varchar(40),
 idioma__nivel varchar(40)
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje TEXT DEFAULT "HUBO UN ERROR";

-- ------------------------------------------------VALIDACION--------------------------------------------------------

-- Validar idioma__empleado(Vacio)
SET _mensaje = (SELECT verificarVacio(idioma__empleado,"idioma__empleado",1));

-- Validar idioma__empleado(Numero)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarNumero(idioma__empleado,"idioma__empleado"));
END IF;

-- Validar idioma__idioma(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(idioma__idioma,"idioma__idioma",1));
END IF;

-- Validar idioma__idioma(Longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(idioma__idioma, 4, 40, " ","idioma__idioma", 1));
END IF;

-- Validar idioma__nivel(Vacio)
IF(_mensaje = "ok") THEN
	SET _mensaje = (SELECT verificarVacio(idioma__nivel,"idioma__nivel",1));
END IF;

-- Validar idioma__nivel(Longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(idioma__nivel, 4, 40, " ","idioma__nivel", 1));
END IF;

IF(_mensaje = "ok") THEN
	INSERT INTO
    lista_idioma
    (
    idioma_empleado,
    idioma_idioma,
    idioma_nivel
    )
    VALUES
    (
	idioma__empleado,
    idioma__idioma,
    idioma__nivel
    );
    SET _mensaje="REGISTRO CREADO";
END IF;
RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setPasantias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setPasantias`(
pasantias__empresa int,
pasantias__titulo varchar(60),
pasantias__descripcion longtext,
pasantias__requisitos varchar(80),
pasantias__cantidad int
) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE _mensaje  TEXT DEFAULT "hubo un error";

-- Validar pasantias__empresa(vacio)
SET _mensaje = verificarVacio(pasantias__empresa,"pasantias__empresa",1);

-- Validar pasantias__empresa(numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(pasantias__empresa, "pasantias__empresa"));
END IF;

-- Validar pasantias__titulo(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__titulo, "pasantias__titulo", 1));
END IF;

-- Validar pasantias__titulo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(pasantias__titulo, 3, 60, " ","pasantias__titulo", 1));
END IF;

-- Validar pasantias__descripcion(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__descripcion, "pasantias__descripcion", 1));
END IF;

-- Validar pasantias__requisitos(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__requisitos, "pasantias__requisitos", 1));
END IF;

-- Validar pasantias__requisitos(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(pasantias__requisitos, 3, 80, " ","pasantias__requisitos", 1));
END IF;

-- Validar pasantias__cantidad(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__cantidad, "pasantias__cantidad", 1));
END IF;

-- Validar pasantias__cantidad(numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(pasantias__cantidad, "pasantias__cantidad"));
END IF;

IF(_mensaje = "ok") THEN
	INSERT INTO lista_pasantias 
    (
	id_pasantias,
	pasantias_empresa,
	pasantias_titulo,
	pasantias_descripcion,
	pasantias_requisitos,
	pasantias_cantidad
    )VALUES
    (
    null,
	pasantias__empresa,
	pasantias__titulo,
	pasantias__descripcion,
	pasantias__requisitos,
	pasantias__cantidad
    );
    SET _mensaje="REGISTRO CREADO";
END IF;

RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setPasantiasEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setPasantiasEmpleado`(
pasantias__empleado int,
pasantias__empresa varchar(80),
pasantias__titulo varchar(60),
pasantias__descripcion longtext
) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE _mensaje  TEXT DEFAULT "hubo un error";

-- Validar pasantias__empleado(vacio)
SET _mensaje = verificarVacio(pasantias__empleado,"pasantias__empleado",1);

-- Validar pasantias__empleado(numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(pasantias__empleado, "pasantias__empleado"));
END IF;

-- Validar pasantias__empresa(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__empresa, "pasantias__empresa", 1));
END IF;

-- Validar pasantias__empresa(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(pasantias__empresa, 3, 80, " ","pasantias__empresa", 1));
END IF;

-- Validar pasantias__titulo(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__titulo, "pasantias__titulo", 1));
END IF;

-- Validar pasantias__titulo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(pasantias__titulo, 3, 60, " ","pasantias__titulo", 1));
END IF;

-- Validar pasantias__descripcion(vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(pasantias__descripcion, "pasantias__descripcion", 1));
END IF;



IF(_mensaje = "ok") THEN
	INSERT INTO lista_pasantias_empleado
    (
	id_pasantias,    
	pasantias_empleado,
	pasantias_empresa,
	pasantias_titulo,
	pasantias_descripcion
    )VALUES
    (
    null,
	pasantias__empleado,
	pasantias__empresa,
	pasantias__titulo,
	pasantias__descripcion
    );
    SET _mensaje="Pasantia creada con exito";
END IF;

RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setPostulados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setPostulados`(`postulados__vacante` INT,
	`postulados__empleado` INT
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje TEXT DEFAULT "HUBO UN ERROR";

IF(EXISTS(SELECT * FROM lista_postulados WHERE postulados_vacante = postulados__vacante AND postulados_empleado = postulados__empleado )) THEN
	RETURN _mensaje;
ELSE
INSERT INTO 
	lista_postulados
    (id_postulados,
    postulados_vacante,
    postulados_empleado
    )
    VALUES
    (
    null,
    postulados__vacante,
    postulados__empleado
    );
SET 
	_mensaje="REGISTRO CREADO";
END IF;
RETURN _mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setVacante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setVacante`(`vacante_titulo` VARCHAR(50),
    `vacante_descripcion` longtext,
    `vacante_salario` DOUBLE,
    `vacante_cantidad` INT,
    `vacante_ubicacion` VARCHAR(60),
    `vacante_requisitos` VARCHAR(60),
	`vacante_empresa` INT
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje text DEFAULT "HUBO UN ERROR";

-- --------------------------------------------VALIDACION-------------------------------------------

-- Validar vacante_titulo(Vacio)
SET _mensaje = (SELECT verificarVacio(vacante_titulo, "vacante_titulo", 1));

-- Validar vacante_titulo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(vacante_titulo, 2, 50, "","vacante_titulo", 1));
END IF;

-- Validar vacante_descripcion(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = ( SELECT verificarVacio(vacante_descripcion,"vacante_descripcion", 1));   
END IF;

-- Validar vacante_salario(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacante_salario,"vacante_salario", 1));   
END IF;

-- Validar vacante_cantidad(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacante_cantidad,"vacante_cantidad", 1));   
END IF;

-- Validar vacante_cantidad(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(vacante_cantidad,"vacante_cantidad"));
END IF;

-- Validar vacante_ubicacion(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacante_ubicacion,"vacante_ubicacion", 1));   
END IF;

-- Validar vacante_ubicacion(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(vacante_ubicacion, 2, 60, "maximo","vacante_ubicacion", 1));
END IF;

-- Validar vacante_requisitos(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacante_requisitos,"vacante_requisitos", 1));
END IF;

-- Validar vacante_requisitos(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(vacante_requisitos, 2, 60, "maximo","vacante_requisitos", 1));  
END IF;

-- Validar vacante_empresa(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacante_empresa,"vacante_empresa", 1));
END IF;

-- Validar vacante_empresa(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(vacante_empresa,"vacante_empresa"));
END IF;

-- ---------------------------------------------------------INSERT-------------------------------------------------------------------

IF(_mensaje = "ok") THEN
	INSERT INTO
		`lista_vacante`
		
		(	
			id_vacante,
			vacante_titulo,
			vacante_descripcion,
			vacante_salario,
			vacante_cantidad,
			vacante_ubicacion,
			vacante_requisitos,
			vacante_empresa
		)
	VALUES
	(	
			null,
			vacante_titulo,
			vacante_descripcion,
			vacante_salario,
			vacante_cantidad,
			vacante_ubicacion,
			vacante_requisitos,
			vacante_empresa
		);

	SET _mensaje = "REGISTRO CREADO";

END IF;

RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `setVacantes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setVacantes`(`vacantes_titulo` VARCHAR(50),
    `vacantes_descripcion` longtext,
    `vacantes_salario` DOUBLE,
    `vacantes_cantidad` INT,
    `vacantes_ubicacion` VARCHAR(60),
    `vacantes_requisitos` VARCHAR(60),
	`vacantes_empresa` INT
) RETURNS text CHARSET utf8mb4
BEGIN DECLARE _mensaje text DEFAULT "HUBO UN ERROR";

-- --------------------------------------------VALIDACION-------------------------------------------

-- Validar vacantes_titulo(Vacio)
SET _mensaje = (SELECT verificarVacio(vacantes_titulo, "vacantes_titulo", 1));

-- Validar vacantes_titulo(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(vacantes_titulo, 2, 50, "","vacantes_titulo", 1));
END IF;

-- Validar vacantes_descripcion(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = ( SELECT verificarVacio(vacantes_descripcion,"vacantes_descripcion", 1));   
END IF;

-- Validar vacantes_salario(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacantes_salario,"vacantes_salario", 1));   
END IF;

-- Validar vacantes_cantidad(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacantes_cantidad,"vacantes_cantidad", 1));   
END IF;

-- Validar vacantes_cantidad(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(vacantes_cantidad,"vacantes_cantidad"));
END IF;

-- Validar vacantes_ubicacion(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacantes_ubicacion,"vacantes_ubicacion", 1));   
END IF;

-- Validar vacantes_ubicacion(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(vacantes_ubicacion, 2, 60, "maximo","vacantes_ubicacion", 1));
END IF;

-- Validar vacantes_requisitos(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacantes_requisitos,"vacantes_requisitos", 1));
END IF;

-- Validar vacantes_requisitos(longitud)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarLongitud(vacantes_requisitos, 2, 60, "maximo","vacantes_requisitos", 1));  
END IF;

-- Validar vacantes_empresa(Vacio)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarVacio(vacantes_empresa,"vacantes_empresa", 1));
END IF;

-- Validar vacantes_empresa(Numero)
IF(_mensaje = "ok") THEN
    SET _mensaje = (SELECT verificarNumero(vacantes_empresa,"vacantes_empresa"));
END IF;

-- ---------------------------------------------------------INSERT-------------------------------------------------------------------

IF(_mensaje = "ok") THEN
	INSERT INTO
		`lista_vacantes`
		
		(	
			id_vacantes,
			vacantes_titulo,
			vacantes_descripcion,
			vacantes_salario,
			vacantes_cantidad,
			vacantes_ubicacion,
			vacantes_requisistos,
			vacantes_empresa
		)
	VALUES
	(	
			null,
			vacantes_titulo,
			vacantes_descripcion,
			vacantes_salario,
			vacantes_cantidad,
			vacantes_ubicacion,
			vacantes_requisistos,
			vacantes_empresa
		);

	SET _mensaje = "REGISTRO CREADO";

END IF;

RETURN _mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `updateEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updateEmpleado`(
	`id__empleado` int,
	`empleado__nombre` varchar(50),
    `empleado__apellido` varchar(50),
    `empleado__dni` varchar(9),
    `empleado__correo` varchar(60),
    `empleado__telefono` varchar(35),
    `empleado__img` longblob,
    `empleado__ubicacion` varchar(60),
    `empleado__cv` longblob,
    `empleado__hash` longtext
) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE _mensaje TEXT DEFAULT "HUBO UN ERROR";


-- ------------------------------------------------VALIDACION--------------------------------------------------------
-- VERIFICAR QUE EL MAIL NO EXISTA
	SET _mensaje =  (SELECT existenciaCorreo(empleado__correo,1));



-- ------------------------------------------------INSERT--------------------------------------------------------
IF(_mensaje = "ok") THEN
UPDATE lista_empleado
SET
        empleado_nombre =empleado__nombre,
        empleado_apellido = empleado__apellido,
        empleado_correo = empleado__correo,
        empleado_dni = empleado__dni,
        empleado_ubicacion = empleado__ubicacion,
        empleado_telefono = empleado__telefono,
        empleado_img = empleado__img,
        empleado_cv = empleado__cv,
        empleado_hash = empleado__hash
WHERE
	id_empleado = id__empleado;    
SET _mensaje = "ok";
END IF;
IF(_mensaje="ok")THEN
	SET _mensaje="REGISTRO ACTUALIZADO";
END IF;
RETURN _mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `updateEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `updateEmpleador`(
	`id__empleador` int,
	`empleador__nombre` varchar(50),
    `empleador__apellido` varchar(50),
    `empleador__dni` varchar(9),
    `empleador__correo` varchar(60),
    `empleador__telefono` varchar(35),
    `empleador__empresa` int,
    `empleador__hash` longtext
) RETURNS text CHARSET utf8mb4
BEGIN
DECLARE _mensaje TEXT DEFAULT "HUBO UN ERROR";


-- ------------------------------------------------VALIDACION--------------------------------------------------------
-- VERIFICAR QUE EL MAIL NO EXISTA
	SET _mensaje =  (SELECT existenciaCorreo(empleador__correo,2));



-- ------------------------------------------------INSERT--------------------------------------------------------
IF(_mensaje = "ok") THEN
UPDATE lista_empleador
SET
        empleador_nombre =empleador__nombre,
        empleador_apellido = empleador__apellido,
        empleador_dni = empleador__dni,       
        empleador_correo = empleador__correo,
        empleador_telefono = empleador__telefono,
		empleador_empresa=empleador__empresa,
        empleador_hash = empleador__hash
WHERE
	id_empleador = id__empleador;    
SET _mensaje = "ok";
END IF;
IF(_mensaje="ok")THEN
	SET _mensaje="REGISTRO ACTUALIZADO";
END IF;
RETURN _mensaje;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarPostulados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarPostulados`( vacante int,  empleado int) RETURNS tinyint(1)
BEGIN
IF(!EXISTS(SELECT * FROM lista_postulados WHERE lista_postulados.postulados_vacante = vacante AND lista_postulados.postulados_empleado = empleado ))THEN
	RETURN 1;
ELSE
	RETURN 0;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarSession`(
hash__session longtext
) RETURNS int
BEGIN
IF(EXISTS(SELECT * FROM lista_session WHERE hash_session=hash__session AND session_estado=TRUE))THEN
	RETURN (SELECT empleado_session FROM lista_session WHERE hash_session=hash__session AND session_estado=TRUE);
ELSE 
	RETURN 0;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validarSessionEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarSessionEmpleador`(
hash__session longtext
) RETURNS int
BEGIN
IF(EXISTS(SELECT * FROM lista_session_empleador WHERE hash_session=hash__session AND session_estado=TRUE))THEN
	RETURN (SELECT empleador_session FROM lista_session_empleador WHERE hash_session=hash__session AND session_estado=TRUE);
ELSE 
	RETURN 0;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificarCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificarCorreo`(
    _valor text,
    _titulo text
) RETURNS text CHARSET utf8mb4
begin

    declare _mensaje text;

    if ( locate('@', _valor) and locate('.', _valor) > locate('@', _valor) + 1 ) then
        set _mensaje = 'ok';
    else
        set _mensaje = (select concat('error,El dato del campo ',_titulo,' debe ser un email.'));
    end if;

    return _mensaje;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificarFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificarFecha`(
    _valor date,
    _hasta date,
    _titulo text
) RETURNS text CHARSET utf8mb4
begin

    declare _mensaje text;
    declare _limite text;

    case
        when _hasta <> '0000-00-00' then
            set _limite = 'ok';
        else
            set _limite = 'no';
    end case;

    if ( _valor <> '0000-00-00' ) then
        set _mensaje = 'ok';
    else
        set _mensaje = (select concat('error,En el campo ',_titulo,' debe seleccionar una fecha'));
    end if;

    if ( _limite = 'ok' and _mensaje = 'ok' ) then
        
        if ( _valor <= _hasta ) then
            set _mensaje = 'ok';
        else
            set _mensaje = (select concat('error,La fecha del campo ',_titulo,' debe ser menor a ',_hasta));
        end if;

    end if;

    return _mensaje;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificarLongitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificarLongitud`(
    _valor text,
    _minimo int,
    _maximo int,
    _verificador varchar(75),
    _titulo text,
    _requerido int
) RETURNS text CHARSET utf8mb4
begin

    case
        when _verificador = 'minimo' then
            if ( length(_valor) >= _minimo ) then
                return 'ok';
            end if;
        when _verificador = 'maximo' then
            if ( length(_valor) <= _maximo ) then
                return 'ok';
            end if;
        when _verificador = 'unico' then
            if ( length(_valor) = _maximo ) then
                return 'ok';
            end if;
        else
            if ( length(_valor) between _minimo and _maximo ) then
                return 'ok';
            end if;
    end case;

    if ( _requerido <> 1 ) then
        return '';
    end if;

    case
        when _verificador = 'minimo' then
            return (select concat('error,El campo ',_titulo,' debe tener como minimo ',_minimo,' caracteres.'));
        when _verificador = 'maximo' then
            return (select concat('error,El campo ',_titulo,' debe tener como maximo ',_maximo,' caracteres.'));
        when _verificador = 'unico' then
            return (select concat('error,El campo ',_titulo,' debe tener ',_maximo,' caracteres.'));
        else
            return (select concat('error,El campo ',_titulo,' debe tener entre ',_minimo,' y ',_maximo,' caracteres.'));
    end case;

    return 'Sin acción';

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificarNumero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificarNumero`(
    _valor text,
    _titulo text
) RETURNS text CHARSET utf8mb4
begin

    declare _resultado text;

    set _valor = (select ceil(_valor));

    if ( _valor <> 0 ) then
        set _resultado = 'ok';
    else
        set _resultado = (select concat('error,El dato del campo ',_titulo,' debe ser de tipo númerico.'));
    end if;

	return _resultado;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificarVacio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificarVacio`(
    _valor text,
    _titulo text,
    _requerido int
) RETURNS text CHARSET utf8mb4
begin

    if ( _valor <> '' and _valor is not null ) then
        return 'ok';
    end if;

    if ( _requerido = 1 ) then
        return (select concat('error,El campo ',_titulo,' no debe estar vacio.'));
    else
        return '';
    end if;

    return 'Sin acción';

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpleado`(
in id int
)
BEGIN
IF(id=null OR id="" OR id=0 )THEN
	SELECT * FROM lista_empleado ;
ELSE 
	IF(EXISTS(SELECT id_empleado FROM lista_empleado WHERE id_empleado=id))THEN
		SELECT * FROM lista_empleado as empleado WHERE id_empleado=id ;
	ELSE 
		SELECT "NO SE ENCONTRO EL USUARIO" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpleador`(
in id__empleador int
)
BEGIN
IF(id__empleador=null OR id__empleador=""OR id__empleador=0)THEN
	SELECT * FROM view_empleador;
ELSE 
	IF(EXISTS(SELECT id_empleador FROM view_empleador WHERE id_empleador=id__empleador))THEN
		SELECT * FROM view_empleador WHERE id_empleador=id__empleador;
	ELSE 
		SELECT "NO SE ENCONTRO EL USUARIO" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpresa`(
in id__empresa int
)
BEGIN
IF(id__empresa=null OR id__empresa="")THEN
	SELECT * FROM lista_empresa;
ELSE 
	IF(EXISTS(SELECT id_empresa FROM lista_empresa WHERE id_empresa=id__empresa))THEN
		SELECT * FROM lista_empresa WHERE id_empresa=id__empresa;
	ELSE 
		SELECT "no" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEstudios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEstudios`(in id int)
BEGIN
	IF(EXISTS(SELECT estudios_empleado FROM lista_estudios WHERE estudios_empleado=id))THEN
		select * from lista_estudios where estudios_empleado = id;
	ELSE
		SELECT "no" AS "consulta";
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExperiencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExperiencia`(in id int)
BEGIN
	IF(EXISTS(SELECT experiencia_empleado FROM lista_experiencia WHERE experiencia_empleado=id))THEN
		select *  from  lista_experiencia as experiencia where experiencia_empleado = id;
	ELSE
		SELECT "no" AS "consulta";
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIdioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIdioma`(
in id int
)
BEGIN
	IF(EXISTS(SELECT idioma_empleado FROM lista_idioma WHERE idioma_empleado=id))THEN
		SELECT * FROM lista_idioma WHERE idioma_empleado = id;
	ELSE
		SELECT "no" AS "consulta";
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPasantias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPasantias`(
in id int
)
BEGIN
IF(id=null OR id="")THEN
	SELECT * FROM lista_pasantias ORDER BY pasantias_alta;
ELSE 
	IF(EXISTS(SELECT id_pasantias FROM lista_pasantias WHERE id_pasantias=id))THEN
		SELECT * FROM lista_pasantias WHERE id_pasantias=id;
	ELSE 
		SELECT "no" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPasantiasEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPasantiasEmpleado`(
in id int
)
BEGIN
	IF(EXISTS(SELECT id_pasantias FROM lista_pasantias_empleado WHERE id_pasantias=id))THEN
		select * from lista_pasantias_empleado where id_pasantias = id;
	ELSE
		SELECT "nos" AS "consulta";
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPasantiasFromEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPasantiasFromEmpresa`(in id int)
BEGIN
	SELECT * FROM lista_pasantias WHERE pasantias_empresa = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPostulados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPostulados`(in id int, in empleado boolean,in empleador boolean)
BEGIN
IF (empleado=true)THEN
	SELECT
		postulados_alta,
		postulados_vacante,
        postulados_empleado,
        vacante_titulo,
        empresa_nombre,
        id_postulados
        
	FROM lista_postulados AS consulta
    JOIN lista_vacante ON postulados_vacante =  id_vacante
    JOIN lista_empresa ON vacante_empresa = id_empresa
    WHERE postulados_empleado = id ;
ELSEIF(empleador = true)THEN
	SELECT
		postulados_alta,
		postulados_vacante,
        postulados_empleado,
        CONCAT(empleado_nombre," ",empleado_apellido)AS empleado_nombre,
        vacante_empresa
	AS consulta
    FROM lista_postulados 
    JOIN lista_empleado ON postulados_empleado =  id_empleado
    JOIN lista_vacante ON postulados_vacante = id_vacante    
    JOIN lista_empresa ON vacante_empresa = id_empresa
    JOIN lista_empleador ON empleador_empresa = id_empresa
    WHERE vacante_empresa=id ;
ELSEIF((empleador =  true and empleado = true)OR(empleador=true AND empleado=true))THEN
	SELECT "NO";
ELSE
	select "NO";
END IF;
-- Tiene que hacer un join y traerte cosas de la empresa
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVacante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVacante`(
in id int
)
BEGIN
IF(id=null OR id="")THEN
	SELECT * FROM lista_vacante;
ELSE 
	IF(EXISTS(SELECT id_vacante FROM lista_vacante WHERE id_vacante=id))THEN
		SELECT *  FROM lista_vacante AS vacante
        -- JOIN lista_empresa AS empresa ON lista_empresa.id_empresa = lista_vacante.vacante_empresa
        WHERE id_vacante=id;
	ELSE 
		SELECT "no" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVacanteFromEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVacanteFromEmpresa`(in id int)
BEGIN
	SELECT * FROM lista_vacante AS consulta WHERE vacante_empresa = id ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVacantes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVacantes`(
in id int
)
BEGIN

	IF(EXISTS(SELECT id_vacante FROM lista_vacante WHERE vacante_empresa=id))THEN
		SELECT *  FROM lista_vacante
        WHERE vacante_empresa=id;
	ELSE 
		SELECT "no se encontro vacante" as consulta;
    END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logEmpleado`(
in empleado__correo varchar(60),
in empleado__hash LONGTEXT
)
BEGIN
IF(empleado__correo="" or empleado__hash="") THEN 
	SELECT "Los campos no pueden estar vacios" as "consulta";
ELSE
	IF(EXISTS(SELECT id_empleado FROM lista_empleado WHERE empleado_correo = empleado__correo AND empleado_hash = empleado__hash))THEN
		SELECT id_empleado FROM lista_empleado WHERE empleado_correo = empleado__correo AND empleado_hash = empleado__hash;
	ELSE
		SELECT "Contraseña incorrecta" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logEmpleador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logEmpleador`(
in empleador__correo varchar(60),
in empleador__hash LONGTEXT
)
BEGIN
IF(empleador__correo="" or empleador__hash="") THEN 
	SELECT "NO SE ENCONTRO EL USUARIO";
ELSE
	IF(EXISTS(SELECT id_empleador FROM lista_empleador WHERE empleador_correo = empleador__correo AND empleador_hash = empleador__hash))THEN
		SELECT id_empleador,empleador_empresa,empleador_nombre FROM lista_empleador WHERE empleador_correo = empleador__correo AND empleador_hash = empleador__hash;
	ELSE
		SELECT "Contraseña incorrecta" as consulta;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_empleado`
--

/*!50001 DROP VIEW IF EXISTS `view_empleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empleado` AS select `lista_empleado`.`id_empleado` AS `id_empleado`,`lista_empleado`.`empleado_dni` AS `empleado_dni`,`lista_empleado`.`empleado_nombre` AS `empleado_nombre`,`lista_empleado`.`empleado_apellido` AS `empleado_apellido`,`lista_empleado`.`empleado_correo` AS `empleado_correo`,`lista_empleado`.`empleado_ubicacion` AS `empleado_ubicacion`,`lista_estudios`.`estudios_titulo` AS `estudios_titulo`,`lista_estudios`.`estudios_descripcion` AS `estudios_descripcion`,`lista_estudios`.`estudios_promedio` AS `estudios_promedio`,`lista_experiencia`.`experiencia_titulo` AS `experiencia_titulo`,`lista_experiencia`.`experiencia_descripcion` AS `experiencia_descripcion`,`lista_experiencia`.`experiencia_rubro` AS `experiencia_rubro`,`lista_idioma`.`idioma_idioma` AS `idioma_idioma`,`lista_idioma`.`idioma_nivel` AS `idioma_nivel` from (((`lista_empleado` join `lista_estudios` on((`lista_estudios`.`estudios_empleado` = `lista_empleado`.`id_empleado`))) join `lista_experiencia` on((`lista_experiencia`.`experiencia_empleado` = `lista_empleado`.`id_empleado`))) join `lista_idioma` on((`lista_idioma`.`idioma_empleado` = `lista_empleado`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_empleador`
--

/*!50001 DROP VIEW IF EXISTS `view_empleador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empleador` AS select `lista_empleador`.`id_empleador` AS `id_empleador`,`lista_empleador`.`empleador_nombre` AS `empleador_nombre`,`lista_empleador`.`empleador_apellido` AS `empleador_apellido`,`lista_empleador`.`empleador_dni` AS `empleador_dni`,`lista_empleador`.`empleador_telefono` AS `empleador_telefono`,`lista_empleador`.`empleador_correo` AS `empleador_correo`,`lista_empleador`.`empleador_empresa` AS `empleador_empresa`,`lista_empresa`.`id_empresa` AS `id_empresa`,`lista_empresa`.`empresa_nombre` AS `empresa_nombre`,`lista_empresa`.`empresa_img` AS `empresa_img` from (`lista_empleador` join `lista_empresa` on((`lista_empleador`.`empleador_empresa` = `lista_empresa`.`id_empresa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-17 14:53:46
