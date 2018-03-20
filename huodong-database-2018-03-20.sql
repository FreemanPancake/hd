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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (6,'黄教主宝刀不老 18年手机市场不缺席魅族','20180320/761ee77ad2b01e42aca281526d4e52da.jpg',1521691200,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; line-height: 2; font-size: 11pt; white-space: normal; background-color: rgb(255, 255, 255); font-family: 宋体; text-indent: 2em; text-align: justify;\">3.15的风潮刚刚吹过，就在一众品牌商侥幸“逃过一劫”的时候，总有一些专注于极致和信仰的品牌甚至不为所动，对这些品牌而言，真正的匠心产品不仅需要经过市场真金烈火的考验，更是来源于自身对产品的强烈自信和未来的战略布局。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; line-height: 2; font-size: 11pt; white-space: normal; background-color: rgb(255, 255, 255); font-family: 宋体; text-indent: 2em; text-align: justify;\">3月16日，备受瞩目的魅族再度迎来社会各界的审视——隐匿一年多的魅族掌门人黄章突然在论坛发声，表示“由于时间关系，15只是我多年后回归魅族的小试牛刀，随后推出的16系列才是我全力打造的产品”，一石激起千层浪，这条重磅消息对于翘首以盼的广大魅友门无疑打上了一阵兴奋剂，随后不久J.Wong再次发声“16系列紧跟着8月份左右就能推出”，让原本已经火热的态势彻底沸腾起来，相比较诸多品牌纷纷选择“谨言慎行”，魅族的这一系列举动着实赚足了眼球，也收获了来自社会各层面的强势关注。</p><p><img src=\"/ueditor/php/upload/image/20180320/1521530477105154.jpg\" title=\"1521530477105154.jpg\" alt=\"1db9dec6-22f9-4782-8fbf-7084141c1a4d.jpg\"/></p>',0,1,60,0,39,1,'',NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'经验分享'),(2,'优惠资讯');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (6,2,1),(11,2,1),(15,1,2),(17,1,12),(19,1,1),(20,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (6,1521347614,'切尔西比必胜',1,1),(7,1521347657,'切尔西比必胜 切尔西比必胜 切尔西比必胜 切尔西比必胜 ',1,1),(8,1521347659,'切尔西比必胜 切尔西比必胜 ',1,1),(9,1521347978,'回合分别于',1,2),(11,1521349025,'回合分别于 ',1,2),(13,1521359956,'切尔西比必胜切尔西比必胜',1,1),(14,1521359958,'',1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pic`
--

DROP TABLE IF EXISTS `pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) DEFAULT '0',
  `url` varchar(128) DEFAULT '',
  `sort` tinyint(4) DEFAULT NULL,
  `brief` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pic`
--

LOCK TABLES `pic` WRITE;
/*!40000 ALTER TABLE `pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pic` ENABLE KEYS */;
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
  `role_status` int(11) DEFAULT NULL,
  `role_reason` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'足球万事通',2,'e10adc3949ba59abbe56e057f20f883e','wanshitong@qq.com',1501234568,1,1,''),(2,'亨利',3,'e10adc3949ba59abbe56e057f20f883e','henry12@qq.com',1502334123,1,NULL,''),(3,'admin',1,'e10adc3949ba59abbe56e057f20f883e',NULL,0,1,NULL,''),(4,'henry',2,'e10adc3949ba59abbe56e057f20f883e','henry@qq.com',1521357754,1,1,''),(5,'haha',2,'e10adc3949ba59abbe56e057f20f883e','haha@qq.com',1521360065,1,0,'足球爱好者');
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

-- Dump completed on 2018-03-20 18:33:48
