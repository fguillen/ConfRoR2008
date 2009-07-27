-- MySQL dump 10.11
--
-- Host: localhost    Database: registro_conferencia_rails
-- ------------------------------------------------------
-- Server version	5.0.32-Debian_7etch5~bpo31+1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL auto_increment,
  `recipients` text,
  `from` varchar(255) default NULL,
  `subject` text,
  `sent_on` datetime default NULL,
  `body` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) default NULL,
  `apellido1` varchar(255) default NULL,
  `apellido2` varchar(255) default NULL,
  `telefono` varchar(255) default NULL,
  `empresa` varchar(255) default NULL,
  `url_empresa` varchar(255) default NULL,
  `titulo_blog` varchar(255) default NULL,
  `url_blog` varchar(255) default NULL,
  `cena` tinyint(1) default NULL,
  `publico` tinyint(1) default NULL,
  `usuario_id` int(11) default NULL,
  `facturacion` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'organizacion','conferencia rails','','','','','','',0,0,1,''),(2,'javier','ramirez','','655819687','aspgems','http://www.aspgems.com','format internet','http://formatinternet.wordpress.com',1,1,2,'javier ramirez gomara\r\n25465828K\r\nJulia Mediavilla 37 3Izquierda\r\n28053 Madrid'),(3,'Jaime','Iniesta','Alemán','658513170','Railes.net','http://www.railes.net','Jaime Iniesta - Programador freelance','http://www.jaimeiniesta.com',1,1,3,'NIF: 17728733-B\r\nDirección: Avda. Lluis Pericot, 49-51, 1º 6ª'),(4,'Javier','Vidal','Postigo','609747571','Javier Vidal Postigo','http://javiervidal.net/','Javier Vidal Postigo','http://javiervidal.net/',0,1,4,'Javier Vidal Postigo\r\nC/ Bahía de Algeciras, 1 P3 - 3B\r\n28033 Madrid'),(5,'Amaia','Castro','','606853030','Dabne Tecnologías de la Información','http://www.dabne.net','Apuntes de Rails','http://apuntesderails.amaiac.net',1,1,5,'Dabne Tecnologías de la Información\r\nc/ Los Madrazo, 16 - 3º 4\r\n28014 Madrid\r\nCIF: F-84291905');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'organizador'),(3,'asistente'),(4,'ponente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
CREATE TABLE `roles_usuarios` (
  `role_id` int(11) default NULL,
  `usuario_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (3,1),(1,1),(3,2),(1,2),(2,2),(3,3),(3,4),(3,5);
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_info`
--

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` VALUES (10);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifas`
--

DROP TABLE IF EXISTS `tarifas`;
CREATE TABLE `tarifas` (
  `id` int(11) NOT NULL auto_increment,
  `importe` int(11) default NULL,
  `actual` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tarifas`
--

LOCK TABLES `tarifas` WRITE;
/*!40000 ALTER TABLE `tarifas` DISABLE KEYS */;
INSERT INTO `tarifas` VALUES (1,0,1);
/*!40000 ALTER TABLE `tarifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `activation_code` varchar(40) default NULL,
  `activated_at` datetime default NULL,
  `password_reset_code` varchar(40) default NULL,
  `password_reseted_at` datetime default NULL,
  `pagado_at` datetime default NULL,
  `tarifa_id` int(11) default NULL,
  `pagado_cena_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'organizador','supercoco9@gmail.com','88ea590f3516d8a97b9c9f95ccb9ac8645f07a09','639de8282c3474d76dc58e201ced337fc181a78a','2008-07-19 00:21:57','2008-07-19 00:30:26',NULL,NULL,NULL,'2008-07-18 22:24:20',NULL,NULL,NULL,1,NULL),(2,'javier','javier.ramirez.gomara@gmail.com','09c84d05cde445498bf1b8c7b9a06403f5617588','247abca3953b307d235fd8dc1c95ed4b1d26c6a5','2008-07-19 00:31:53','2008-07-19 00:34:58',NULL,NULL,NULL,'2008-07-18 22:32:11',NULL,NULL,NULL,1,NULL),(3,'jaimeiniesta','jaimeiniesta@gmail.com','e8814d12eac71f4ea9977906f66d40220afbe9c2','2564a3ced571eca74da6a8536e7b49b34de56290','2008-08-02 21:09:20','2008-08-02 21:10:33',NULL,NULL,NULL,'2008-08-02 19:10:33',NULL,NULL,NULL,1,NULL),(4,'zanaguara','zanaguara@gmail.com','1a893f55b52f7d0714de880a6bf6e359b0ce6205','0a1f60c7a8eae4e9b9ff3fe0b5526ff310f3896b','2008-08-04 10:21:00','2008-08-04 10:22:04',NULL,NULL,NULL,'2008-08-04 08:22:04',NULL,NULL,NULL,1,NULL),(5,'amaia','amaia@dabne.net','ce17b7db2df46213e9cf779ff8384d503a82b59e','21343c0c81c2d46c39546dddcd8a3ca53811d5f6','2008-08-04 17:47:11','2008-08-04 17:48:23',NULL,NULL,NULL,'2008-08-04 15:48:04',NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-09-19  9:51:38
