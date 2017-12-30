-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurantmanagementsystem
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idcustomer` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT '',
  PRIMARY KEY (`idcustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Raghu'),(2,'Ramya'),(3,'Nanda'),(4,'Sandeep'),(5,'Pranay');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `orderId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`menuId`,`orderId`),
  KEY `orderId_idx` (`orderId`),
  CONSTRAINT `menuId` FOREIGN KEY (`menuId`) REFERENCES `menu` (`idmenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `order` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (3,1,4),(5,1,6),(2,2,1),(3,2,2),(2,3,3),(4,3,3),(1,4,2),(4,4,1),(3,5,5);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `name` varchar(45) DEFAULT '',
  `quantitiesLeft` int(11) DEFAULT '0',
  `price` varchar(45) DEFAULT '0',
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Aloo',20,'20'),(2,'Paneer',48,'30'),(3,'Kaju',23,'40'),(4,'Ice Cream',46,'10'),(5,'Dosa',67,'25');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `orderTime` date NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `customerId_idx` (`customerId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`idcustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,'2017-12-26'),(2,3,'2017-12-27'),(3,5,'2017-12-21'),(4,1,'2017-12-22'),(5,4,'2017-12-23'),(6,4,'2017-12-24'),(7,2,'2017-12-25'),(8,5,'2017-12-26'),(9,3,'2017-12-19'),(10,5,'2017-12-13');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customersnapshot`
--

DROP TABLE IF EXISTS `vw_customersnapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_customersnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_customersnapshot` AS SELECT 
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ordersnapshot`
--

DROP TABLE IF EXISTS `vw_ordersnapshot`;
/*!50001 DROP VIEW IF EXISTS `vw_ordersnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ordersnapshot` AS SELECT 
 1 AS `idmenu`,
 1 AS `name`,
 1 AS `quantitiesLeft`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'restaurantmanagementsystem'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_GetOrderTimeElapsed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_GetOrderTimeElapsed`(custId INT) RETURNS int(11)
BEGIN
	declare elapse int;
    set elapse =  (SELECT DATEDIFF(now(), `orderTime`) as diff from restaurantmanagementsystem.order where customerId = custId limit 1);
RETURN elapse;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetOrder`(IN CustomID int)
BEGIN
select * from restaurantmanagementsystem.order where customerId = CustomId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_customersnapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_customersnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customersnapshot` AS select `restaurantmanagementsystem`.`customer`.`Name` AS `name` from `restaurantmanagementsystem`.`customer` where `restaurantmanagementsystem`.`customer`.`idcustomer` in (select `custid`.`customerId` from (select `countmax`.`customerId` AS `customerId`,max(`countmax`.`counted`) AS `MAX(``counted``)` from (select `restaurantmanagementsystem`.`order`.`customerId` AS `customerId`,count(0) AS `counted` from `restaurantmanagementsystem`.`order` group by `restaurantmanagementsystem`.`order`.`customerId`) `countmax`) `custid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordersnapshot`
--

/*!50001 DROP VIEW IF EXISTS `vw_ordersnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordersnapshot` AS select `restaurantmanagementsystem`.`menu`.`idmenu` AS `idmenu`,`restaurantmanagementsystem`.`menu`.`name` AS `name`,`restaurantmanagementsystem`.`menu`.`quantitiesLeft` AS `quantitiesLeft`,`restaurantmanagementsystem`.`menu`.`price` AS `price` from `restaurantmanagementsystem`.`menu` where `restaurantmanagementsystem`.`menu`.`idmenu` in (select `custid`.`menuId` from (select `countmax`.`menuId` AS `menuId`,max(`countmax`.`counted`) AS `MAX(``counted``)` from (select `restaurantmanagementsystem`.`items`.`menuId` AS `menuId`,count(0) AS `counted` from `restaurantmanagementsystem`.`items` group by `restaurantmanagementsystem`.`items`.`menuId`) `countmax`) `custid`) */;
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

-- Dump completed on 2017-12-28 23:04:51
