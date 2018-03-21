-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: huodong
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '',
  `face` varchar(128) DEFAULT '',
  `act_at` int(11) DEFAULT '0',
  `desc` text,
  `create_at` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `members_limit` int(11) DEFAULT '0',
  `comments_count` int(11) DEFAULT NULL,
  `clicks` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `txt` text,
  `location` varchar(64) DEFAULT NULL,
  `limit` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (10,'巅峰戰神，排名4，S10赛季拿战队皮肤，欢迎加入！','20180321/ea81540e0cdac73d28fd0112c2df27a9.jpeg',1521777600,'<p><strong><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">战队目标：s10共同冲刺前3名。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">福利：每天战队红包，每周600金币，赛季结束拿战队皮肤。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">队长喜欢骚白、张大仙等技术主播，喜欢研究探讨铭文出装。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">有意者加我微信拉你入队。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">期待您的加入。。。&nbsp;</span></strong><br/><img src=\"/huodong/public/static/ueditor/php/upload/image/20180321/1521621632754205.jpg\" title=\"1521595886444945.jpg\" alt=\"fmQ5-8c60ZhT3cSiq-ow.jpg.medium.jpg\"/></p>',0,1,10,0,2,3,'战队目标：s10共同冲刺前3名。福利：每天战队红包，每周600金币，赛季结束拿战队皮肤。队长喜欢骚白、张大仙等技术主播，喜欢研究探讨铭文出装。有意者加我微信拉你入队。期待您的加入。。。 ','学5食堂4楼','钻石及以上队员，周活跃2000，战队赛4场。不要求改名'),(11,'巅峰戰神，排名37，S10赛季拿战队皮肤，欢迎加入！','20180321/ea81540e0cdac73d28fd0112c2df27a9.jpeg',1521777600,'<p><strong><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">战队目标：s10共同冲刺前20名。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">福利：每天战队红包，每周600金币，赛季结束拿战队皮肤。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">队长喜欢骚白、张大仙等技术主播，喜欢研究探讨铭文出装。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">有意者加我微信拉你入队。</span><br/><span style=\"color: rgb(16, 39, 63); font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 12px; background-color: rgb(245, 232, 203);\">期待您的加入。。。&nbsp;</span></strong><br/><img src=\"/huodong/public/static/ueditor/php/upload/image/20180321/1521621632754205.jpg\" title=\"1521595886444945.jpg\" alt=\"fmQ5-8c60ZhT3cSiq-ow.jpg.medium.jpg\"/></p>',0,1,11,1,6,3,'战队目标：s10共同冲刺前20名。福利：每天战队红包，每周600金币，赛季结束拿战队皮肤。队长喜欢骚白、张大仙等技术主播，喜欢研究探讨铭文出装。有意者加我微信拉你入队。期待您的加入。。。 ','学5食堂3楼','钻石及以上队员，周活跃2000，战队赛4场。不要求改名');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `at` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'13598562413','推荐更多更好的活动',2,1,1501234567);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'经验分享'),(2,'优惠资讯'),(3,'招聘/招募'),(4,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (6,2,1),(11,2,1),(15,1,2),(17,1,12),(19,1,1),(20,1,1),(22,1,8);
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `at` int(11) DEFAULT '0',
  `content` varchar(255) DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (25,1521593994,'感谢楼主分享！',1,8),(26,1521594012,'感谢楼主分享！',1,8),(27,1521596027,'感谢楼主分享',1,10),(28,1521604019,'感谢楼主分享',2,10),(29,1521617574,'感谢楼主分享',2,10),(34,1521628870,'求加入',1,10);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,8,1),(4,10,1),(5,10,2);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '',
  `role` tinyint(4) DEFAULT '3' COMMENT '1管理员 2主编 3普通用户',
  `password` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `register_at` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wan',2,'e10adc3949ba59abbe56e057f20f883e','wanshitong11@qq.com',1501234568,1),(2,'hen',2,'e10adc3949ba59abbe56e057f20f883e','henry123@qq.com',1502334123,1),(3,'admin',1,'e10adc3949ba59abbe56e057f20f883e',NULL,0,1),(4,'henry',2,'e10adc3949ba59abbe56e057f20f883e','henry@qq.com',1521357754,1),(5,'haha',2,'e10adc3949ba59abbe56e057f20f883e','haha@qq.com',1521360065,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 18:43:35
