-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: kanqiu
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `desc` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'足球新闻','五大联赛最新资讯'),(2,'篮球新闻','国际国内篮球赛事'),(3,'国际足球','');
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
  `type` tinyint(4) DEFAULT '1' COMMENT '1新闻 2帖子',
  `ref_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (6,2,1,1),(11,2,2,1),(15,1,1,2),(17,1,1,12),(19,1,1,1),(20,1,1,1);
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
  `type` tinyint(4) DEFAULT '0' COMMENT '1新闻评论 2帖子评论',
  `content` varchar(255) DEFAULT '',
  `user_id` int(11) DEFAULT '0',
  `ref_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (6,1521347614,2,'切尔西比必胜',1,1),(7,1521347657,2,'切尔西比必胜 切尔西比必胜 切尔西比必胜 切尔西比必胜 ',1,1),(8,1521347659,2,'切尔西比必胜 切尔西比必胜 ',1,1),(9,1521347978,2,'回合分别于',1,2),(11,1521349025,2,'回合分别于 ',1,2),(13,1521359956,2,'切尔西比必胜切尔西比必胜',1,1),(14,1521359958,2,'',1,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT '',
  `category` tinyint(4) DEFAULT '1',
  `content` text,
  `user_id` int(11) DEFAULT '0',
  `post_at` int(11) DEFAULT '0',
  `click` int(11) DEFAULT '0',
  `comments_count` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `type` tinyint(4) DEFAULT '1' COMMENT '1新闻贴 2视频新闻',
  `video` varchar(255) DEFAULT '',
  `txt` text,
  `face` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'曼城欧冠签运让瓜帅抓头 他最不想碰的是克洛普',1,'<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">欧冠1/4决赛抽签仪式结束，虽然八强中英超只剩下曼城和利物浦两支球队，但却被直接抽在了一起，迎来英超内战。尽管曼城本赛季在英超和欧冠都有出色的表现，但利物浦却并不是一个他们想要碰到的对手。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　在目前的英超积分榜上，曼城积分已经达到81分，战绩是恐怖的26胜3平1负，而这1负正是拜利物浦所赐，英超第23轮，利物浦在主场迎战曼城，张伯伦为利物浦首开纪录，萨内为曼城扳平，随后菲尔米诺、马内和萨拉赫连续进球帮助利物浦锁定胜局，贝纳尔多和京多安的进球也没能挽救曼城，曼城3-4遭遇了本赛季第一场失利。不过在双方本赛季第一次联赛交手中，曼城曾经送给利物浦一场5-0的惨败，但那毕竟是赛季初。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/w650h455/20180115/7w1L-fyqrewi1263356.jpg\" alt=\"利物浦送给曼城赛季首败\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">利物浦送给曼城赛季首败</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　曼城和利物浦彼此之间已经非常熟悉，而利物浦作为英格兰传统豪门，对曼城的交战记录也保持着上风，虽然最近几个赛季曼城联赛成绩出色，但利物浦已经连续五个赛季能够至少击败曼城一次，而曼城上一次能够在一个赛季对利物浦全胜竟然已经是在1935-36赛季。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　对瓜迪奥拉来说，克洛普也称得上是一个熟悉的对手，早在执教拜仁时，他就和执教多特的克洛普有过多次交锋，克洛普两度从瓜迪奥拉手中抢走了德国超级杯，并终结过一次拜仁的德国杯冠军之路。双方转战英超后，瓜迪奥拉在4战克洛普的比赛中取得1胜1平2负，还稍处下风。在谈到利物浦时，瓜迪奥拉也承认对手的强大：“克洛普是顶级的教练，喜欢攻势足球，而利物浦是强队的克星。”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　从风格上来说，瓜迪奥拉率领的曼城和克洛普的利物浦都充满着浪漫主义情怀，打法都是进攻进攻再进攻，这样的比赛对球迷来说固然好看，但对于球员和教练来说，这样的比赛充满着未知，结果很难在自己的掌控之中，对于志在欧冠取得突破的曼城来说，利物浦确实不是他们想要对阵的球队。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　巧合的是，曼城和利物浦恰巧是目前英超进攻能力最为强悍的球队，曼城联赛已经打入85球，利物浦也打入68球，进球数分居前两位。射手榜是两支球队也十分抢眼，萨拉赫打入24球排在榜首，但21球的阿圭罗、15球的斯特林分居三四位。萨拉赫身边还有菲尔米诺和马内两位强力帮手，但曼城这边德布劳内、萨内的进球能力同样不容忽视。可以预见，这将是一组不缺乏进球的两回合大战。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/310/w650h460/20180316/ZXJ2-fysimak1622280.jpg\" alt=\"萨拉赫是目前英超射手王\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">萨拉赫是目前英超射手王</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　对于曼城来说，最大的利好消息莫过于他们距离英超冠军奖杯只有咫尺之遥，可以将更多的精力放在欧战赛场上，而这也是他们所期望的。利物浦还需要把不小的精力放在联赛争四上。虽然目前领先第五名的切尔西有4分的优势，后边的赛程也相当不错，但显然还不保险。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/275/w650h425/20180316/PIR4-fyshfuq4407495.jpg\" alt=\"德布劳内的发挥对曼城很关键\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">德布劳内的发挥对曼城很关键</span></p><p><br/></p>',1,1521271833,0,0,1,1,'','欧冠1/4决赛抽签仪式结束，虽然八强中英超只剩下曼城和利物浦两支球队，但却被直接抽在了一起，迎来英超内战。尽管曼城本赛季在英超和欧冠都有出色的表现，但利物浦却并不是一个他们想要碰到的对手。　　在目前的英超积分榜上，曼城积分已经达到81分，战绩是恐怖的26胜3平1负，而这1负正是拜利物浦所赐，英超第23轮，利物浦在主场迎战曼城，张伯伦为利物浦首开纪录，萨内为曼城扳平，随后菲尔米诺、马内和萨拉赫连续进球帮助利物浦锁定胜局，贝纳尔多和京多安的进球也没能挽救曼城，曼城3-4遭遇了本赛季第一场失利。不过在双方本赛季第一次联赛交手中，曼城曾经送给利物浦一场5-0的惨败，但那毕竟是赛季初。利物浦送给曼城赛季首败　　曼城和利物浦彼此之间已经非常熟悉，而利物浦作为英格兰传统豪门，对曼城的交战记录也保持着上风，虽然最近几个赛季曼城联赛成绩出色，但利物浦已经连续五个赛季能够至少击败曼城一次，而曼城上一次能够在一个赛季对利物浦全胜竟然已经是在1935-36赛季。　　对瓜迪奥拉来说，克洛普也称得上是一个熟悉的对手，早在执教拜仁时，他就和执教多特的克洛普有过多次交锋，克洛普两度从瓜迪奥拉手中抢走了德国超级杯，并终结过一次拜仁的德国杯冠军之路。双方转战英超后，瓜迪奥拉在4战克洛普的比赛中取得1胜1平2负，还稍处下风。在谈到利物浦时，瓜迪奥拉也承认对手的强大：“克洛普是顶级的教练，喜欢攻势足球，而利物浦是强队的克星。”　　从风格上来说，瓜迪奥拉率领的曼城和克洛普的利物浦都充满着浪漫主义情怀，打法都是进攻进攻再进攻，这样的比赛对球迷来说固然好看，但对于球员和教练来说，这样的比赛充满着未知，结果很难在自己的掌控之中，对于志在欧冠取得突破的曼城来说，利物浦确实不是他们想要对阵的球队。　　巧合的是，曼城和利物浦恰巧是目前英超进攻能力最为强悍的球队，曼城联赛已经打入85球，利物浦也打入68球，进球数分居前两位。射手榜是两支球队也十分抢眼，萨拉赫打入24球排在榜首，但21球的阿圭罗、15球的斯特林分居三四位。萨拉赫身边还有菲尔米诺和马内两位强力帮手，但曼城这边德布劳内、萨内的进球能力同样不容忽视。可以预见，这将是一组不缺乏进球的两回合大战。萨拉赫是目前英超射手王　　对于曼城来说，最大的利好消息莫过于他们距离英超冠军奖杯只有咫尺之遥，可以将更多的精力放在欧战赛场上，而这也是他们所期望的。利物浦还需要把不小的精力放在联赛争四上。虽然目前领先第五名的切尔西有4分的优势，后边的赛程也相当不错，但显然还不保险。德布劳内的发挥对曼城很关键',''),(2,'拜仁又抽好签？最会打西甲的海因克斯回来了',1,'<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　“塞维利亚！拜仁再次在抽签中得到运气眷顾。”这是欧冠1/4决赛抽签结果揭晓之后，《踢球者》打出的标题。1/8决赛以小组第二身份抽到贝西克塔斯，1/4决赛又抽到塞维利亚，拜仁今年欧冠淘汰赛的“手气”确实不错。这当然不是说塞维利亚就多么好打，体育主管萨利哈米季奇也指出这支西甲劲旅淘汰了曼联，因此这完全不能说是个容易的签——但考虑到皇马、巴萨、尤文图斯、曼城这样的可能对手，塞维利亚确实是相对更容易对付的了，就像《图片报》所说，拜仁明显是这组对决的热门。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/283/w650h433/20180316/ySOv-fyshfuq4371261.jpg\" alt=\"海因克斯谈到了塞维利亚的变化\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">海因克斯谈到了塞维利亚的变化</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　在抽签结束之后，拜仁主帅海因克斯也谈到了这组对决：“我并没有感觉到你们的那种欢快。我非常熟悉西班牙足球，很了解塞维利亚。自从换帅之后，他们防守上更稳定了。在我看来，这是一个困难的抽签。有件事情你们应该知道，欧冠八强没有容易对付的对手。”从目前的恢复情况来看，拜仁最强的个人突破点科曼很可能依旧无缘对塞维利亚的两回合，这对德甲班霸的进攻有不小的影响。对阵贝西克塔斯的两回合比赛，在首回合15分钟维达吃到红牌之后，拜仁晋级的局面就基本奠定了，并没有太考验到球队的进攻。面对实力明显更强的塞维利亚，拜仁在攻防两端都要拿出更高的强度来。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/283/w650h433/20180316/Vuy3-fyshfuq4422014.jpg\" alt=\"塞维利亚是一个新对手\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">塞维利亚是一个新对手</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　在八强当中，只有塞维利亚是从来没有和拜仁遭遇过的，这对拜仁而言也是一个全新的考验。这支西甲劲旅拥有很强的技术能力和攻击力，防守端的稳定性也在提升，淘汰曼联也不是偶然的。<strong>过去四年当中，拜仁连续被西甲球队淘汰，其中皇马2次，巴萨1次，马竞1次。</strong>正因为这一点，《图片报》也提醒拜仁，这未必是绝对意义上的好签。拜仁上下也都表示塞维利亚并不是容易对付的对手，有着典型的西班牙风格。先客后主的赛程安排下，拜仁需要争取在皮斯胡安球场先取得良好的结果，并且尽量争取进球，别忘了曼联客场0-0回主场丢球之后的被动。当然，塞维利亚的欧冠经验相对不足，拜仁球员则大多久经考验，抓对手失误的能力也更强。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/214/w619h395/20180316/1Xgh-fyshfuq4470492.png\" alt=\"海帅的拜仁并不惧怕西甲\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">海帅的拜仁并不惧怕西甲</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; color: rgb(77, 79, 83); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　自从海因克斯回归之后，除了技战术方面的提升之外，拜仁的“气场”似乎又回来了，在欧冠赛场上谁也不惧。上一次执教拜仁的时候，海因克斯在两届欧冠当中都能打入决赛，<strong>而且对阵四支西甲球队共计6胜1平1负，淘汰过皇马和巴萨。</strong>在对付西甲球队方面，海帅是有自己的办法的。当然历史数据只是一个参考，想要晋级还得靠场上的出色表现。此番面对又一个不同的西甲对手，迎回海帅的拜仁能有怎样的表现呢？</p><p><br/></p>',1,1521271979,0,0,1,1,'','　“塞维利亚！拜仁再次在抽签中得到运气眷顾。”这是欧冠1/4决赛抽签结果揭晓之后，《踢球者》打出的标题。1/8决赛以小组第二身份抽到贝西克塔斯，1/4决赛又抽到塞维利亚，拜仁今年欧冠淘汰赛的“手气”确实不错。这当然不是说塞维利亚就多么好打，体育主管萨利哈米季奇也指出这支西甲劲旅淘汰了曼联，因此这完全不能说是个容易的签——但考虑到皇马、巴萨、尤文图斯、曼城这样的可能对手，塞维利亚确实是相对更容易对付的了，就像《图片报》所说，拜仁明显是这组对决的热门。海因克斯谈到了塞维利亚的变化　　在抽签结束之后，拜仁主帅海因克斯也谈到了这组对决：“我并没有感觉到你们的那种欢快。我非常熟悉西班牙足球，很了解塞维利亚。自从换帅之后，他们防守上更稳定了。在我看来，这是一个困难的抽签。有件事情你们应该知道，欧冠八强没有容易对付的对手。”从目前的恢复情况来看，拜仁最强的个人突破点科曼很可能依旧无缘对塞维利亚的两回合，这对德甲班霸的进攻有不小的影响。对阵贝西克塔斯的两回合比赛，在首回合15分钟维达吃到红牌之后，拜仁晋级的局面就基本奠定了，并没有太考验到球队的进攻。面对实力明显更强的塞维利亚，拜仁在攻防两端都要拿出更高的强度来。塞维利亚是一个新对手　　在八强当中，只有塞维利亚是从来没有和拜仁遭遇过的，这对拜仁而言也是一个全新的考验。这支西甲劲旅拥有很强的技术能力和攻击力，防守端的稳定性也在提升，淘汰曼联也不是偶然的。过去四年当中，拜仁连续被西甲球队淘汰，其中皇马2次，巴萨1次，马竞1次。正因为这一点，《图片报》也提醒拜仁，这未必是绝对意义上的好签。拜仁上下也都表示塞维利亚并不是容易对付的对手，有着典型的西班牙风格。先客后主的赛程安排下，拜仁需要争取在皮斯胡安球场先取得良好的结果，并且尽量争取进球，别忘了曼联客场0-0回主场丢球之后的被动。当然，塞维利亚的欧冠经验相对不足，拜仁球员则大多久经考验，抓对手失误的能力也更强。海帅的拜仁并不惧怕西甲　　自从海因克斯回归之后，除了技战术方面的提升之外，拜仁的“气场”似乎又回来了，在欧冠赛场上谁也不惧。上一次执教拜仁的时候，海因克斯在两届欧冠当中都能打入决赛，而且对阵四支西甲球队共计6胜1平1负，淘汰过皇马和巴萨。在对付西甲球队方面，海帅是有自己的办法的。当然历史数据只是一个参考，想要晋级还得靠场上的出色表现。此番面对又一个不同的西甲对手，迎回海帅的拜仁能有怎样的表现呢？',''),(11,'阿森纳总比分4-1击败AC米兰挺进欧冠4强',1,NULL,1,1521280553,0,0,1,2,'20180317/d95cd24b50fa1db2c1eb24a98cc9fa60.mp4','','20180317/3b861ca15c48c450af286438367e91b2.jpg'),(12,'阿森纳总比分4-1击败AC米兰挺进欧冠4强',1,'<p>阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强</p>',1,1521359709,0,0,1,1,'','阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强阿森纳总比分4-1击败AC米兰挺进欧冠4强',''),(13,'拜仁又抽好签？最会打西甲的海因克斯回来了',1,NULL,1,1521360013,0,0,1,2,'20180318/02e42bb735998c94a2f795ff99161a13.mp4','','20180318/0fe14cebeb7a98f03d45776c7eedc0a6.jpg');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `content` text,
  `post_at` int(11) DEFAULT '0',
  `click` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `category` int(11) DEFAULT '0',
  `is_good` tinyint(4) DEFAULT '0',
  `comments_count` int(11) DEFAULT '0',
  `last_reply` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'切尔西客场4球大胜巴萨!!!','<p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　北京时间3月16日19时（瑞士当地时间12时），欧洲冠军联赛1/4决赛抽签在尼翁欧足联总部进行，皇马遭遇尤文图斯，曼城和利物浦上演英超德比；巴塞罗那抽到罗马；拜仁对阵塞维利亚。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　具体抽签结果如下(列前者先打主场)：</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　巴塞罗那 vs&nbsp;罗马</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　塞维利亚 vs&nbsp;拜仁</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　尤文图斯 vs&nbsp;皇马</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　利物浦 vs&nbsp;曼城</p><p><img src=\"http://n.sinaimg.cn/sports/transform/283/w650h433/20180316/TYHr-fysikcy7412603.jpg\" alt=\"舍甫琴科\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 12px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">舍甫琴科</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　欧足联副秘书长马尔凯蒂主持抽签，本届决赛举办地大使舍甫琴科担任嘉宾。本届8强均来自4大联赛，这在冠军联赛历史上还是首次出现。西甲独占3席(巴塞罗那、皇马、塞维利亚)，意甲（尤文图斯、罗马）和英超（曼城、利物浦）各占2席，德甲还剩拜仁。1/4决赛抽签采取随机方式，不设种子队，同联赛球队也不回避。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/157/w574h383/20180316/rxO3-fyshfuq3991634.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 12px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\"></span></p><p><img src=\"http://n.sinaimg.cn/sports/transform/283/w650h433/20180316/Y3nJ-fyshfuq3996849.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 12px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　1/4决赛两回合分别于4月3/4日和10/11日举行，半决赛抽签4月13日举行。决赛将于5月26日在基辅奥林匹克国家体育场举行。</p><p><br/></p>',1521359967,1,1,1,0,0,1521359958),(2,1,'欧冠抽签-皇马遇尤文 曼城利物浦内战 巴萨碰罗马','<p><br/></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　北京时间3月16日19时（瑞士当地时间12时），欧洲冠军联赛1/4决赛抽签在尼翁欧足联总部进行，皇马遭遇尤文图斯，曼城和利物浦上演英超德比；巴塞罗那抽到罗马；拜仁对阵塞维利亚。</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　具体抽签结果如下(列前者先打主场)：</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　巴塞罗那 vs&nbsp;罗马</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　塞维利亚 vs&nbsp;拜仁</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　尤文图斯 vs&nbsp;皇马</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　利物浦 vs&nbsp;曼城</p><p><img src=\"http://n.sinaimg.cn/sports/transform/283/w650h433/20180316/TYHr-fysikcy7412603.jpg\" alt=\"舍甫琴科\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 12px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">舍甫琴科</span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　欧足联副秘书长马尔凯蒂主持抽签，本届决赛举办地大使舍甫琴科担任嘉宾。本届8强均来自4大联赛，这在冠军联赛历史上还是首次出现。西甲独占3席(巴塞罗那、皇马、塞维利亚)，意甲（尤文图斯、罗马）和英超（曼城、利物浦）各占2席，德甲还剩拜仁。1/4决赛抽签采取随机方式，不设种子队，同联赛球队也不回避。</p><p><img src=\"http://n.sinaimg.cn/sports/transform/157/w574h383/20180316/rxO3-fyshfuq3991634.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 12px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\"></span></p><p><img src=\"http://n.sinaimg.cn/sports/transform/283/w650h433/20180316/Y3nJ-fyshfuq3996849.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 12px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%; font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, SimSun, 宋体, Arial; font-size: 18px; letter-spacing: 1px; white-space: normal;\">　　1/4决赛两回合分别于4月3/4日和10/11日举行，半决赛抽签4月13日举行。决赛将于5月26日在基辅奥林匹克国家体育场举行。</p><p><br/></p>',1521347938,8,1,1,0,2,1521349025);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
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

-- Dump completed on 2018-03-18 16:38:24
