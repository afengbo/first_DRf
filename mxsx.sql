-- MySQL dump 10.13  Distrib 5.6.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mxsx
-- ------------------------------------------------------
-- Server version	5.6.41-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add content type',3,'add_contenttype'),(8,'Can change content type',3,'change_contenttype'),(9,'Can delete content type',3,'delete_contenttype'),(10,'Can add session',4,'add_session'),(11,'Can change session',4,'change_session'),(12,'Can delete session',4,'delete_session'),(13,'Can add 用户',5,'add_userprofile'),(14,'Can change 用户',5,'change_userprofile'),(15,'Can delete 用户',5,'delete_userprofile'),(16,'Can add 短信验证码',6,'add_verifycode'),(17,'Can change 短信验证码',6,'change_verifycode'),(18,'Can delete 短信验证码',6,'delete_verifycode'),(19,'Can add 轮播商品',7,'add_banner'),(20,'Can change 轮播商品',7,'change_banner'),(21,'Can delete 轮播商品',7,'delete_banner'),(22,'Can add 商品',8,'add_goods'),(23,'Can change 商品',8,'change_goods'),(24,'Can delete 商品',8,'delete_goods'),(25,'Can add 商品类别',9,'add_goodscategory'),(26,'Can change 商品类别',9,'change_goodscategory'),(27,'Can delete 商品类别',9,'delete_goodscategory'),(28,'Can add 品牌',10,'add_goodscategorybrand'),(29,'Can change 品牌',10,'change_goodscategorybrand'),(30,'Can delete 品牌',10,'delete_goodscategorybrand'),(31,'Can add 商品轮播图',11,'add_goodsimage'),(32,'Can change 商品轮播图',11,'change_goodsimage'),(33,'Can delete 商品轮播图',11,'delete_goodsimage'),(34,'Can add 商品详情',12,'add_ordergoods'),(35,'Can change 商品详情',12,'change_ordergoods'),(36,'Can delete 商品详情',12,'delete_ordergoods'),(37,'Can add 订单',13,'add_orderinfo'),(38,'Can change 订单',13,'change_orderinfo'),(39,'Can delete 订单',13,'delete_orderinfo'),(40,'Can add 购物车',14,'add_shoppingcart'),(41,'Can change 购物车',14,'change_shoppingcart'),(42,'Can delete 购物车',14,'delete_shoppingcart'),(43,'Can add 用户收货地址',15,'add_useraddress'),(44,'Can change 用户收货地址',15,'change_useraddress'),(45,'Can delete 用户收货地址',15,'delete_useraddress'),(46,'Can add 用户收藏',16,'add_userfav'),(47,'Can change 用户收藏',16,'change_userfav'),(48,'Can delete 用户收藏',16,'delete_userfav'),(49,'Can add 用户留言',17,'add_userleavemessage'),(50,'Can change 用户留言',17,'change_userleavemessage'),(51,'Can delete 用户留言',17,'delete_userleavemessage'),(52,'Can view group',2,'view_group'),(53,'Can view permission',1,'view_permission'),(54,'Can view content type',3,'view_contenttype'),(55,'Can view 轮播商品',7,'view_banner'),(56,'Can view 商品',8,'view_goods'),(57,'Can view 商品类别',9,'view_goodscategory'),(58,'Can view 品牌',10,'view_goodscategorybrand'),(59,'Can view 商品轮播图',11,'view_goodsimage'),(60,'Can view session',4,'view_session'),(61,'Can view 商品详情',12,'view_ordergoods'),(62,'Can view 订单',13,'view_orderinfo'),(63,'Can view 购物车',14,'view_shoppingcart'),(64,'Can view 用户',5,'view_userprofile'),(65,'Can view 短信验证码',6,'view_verifycode'),(66,'Can view 用户收货地址',15,'view_useraddress'),(67,'Can view 用户收藏',16,'view_userfav'),(68,'Can view 用户留言',17,'view_userleavemessage'),(69,'Can add Bookmark',18,'add_bookmark'),(70,'Can change Bookmark',18,'change_bookmark'),(71,'Can delete Bookmark',18,'delete_bookmark'),(72,'Can add User Setting',19,'add_usersettings'),(73,'Can change User Setting',19,'change_usersettings'),(74,'Can delete User Setting',19,'delete_usersettings'),(75,'Can add User Widget',20,'add_userwidget'),(76,'Can change User Widget',20,'change_userwidget'),(77,'Can delete User Widget',20,'delete_userwidget'),(78,'Can add log entry',21,'add_log'),(79,'Can change log entry',21,'change_log'),(80,'Can delete log entry',21,'delete_log'),(81,'Can view Bookmark',18,'view_bookmark'),(82,'Can view log entry',21,'view_log'),(83,'Can view User Setting',19,'view_usersettings'),(84,'Can view User Widget',20,'view_userwidget'),(85,'Can add Token',22,'add_token'),(86,'Can change Token',22,'change_token'),(87,'Can delete Token',22,'delete_token'),(88,'Can view Token',22,'view_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('1d054b6a5026926c14db67f26981aef6392b4812','2018-10-19 08:36:04.057277',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'auth','group'),(1,'auth','permission'),(22,'authtoken','token'),(3,'contenttypes','contenttype'),(7,'goods','banner'),(8,'goods','goods'),(9,'goods','goodscategory'),(10,'goods','goodscategorybrand'),(11,'goods','goodsimage'),(4,'sessions','session'),(12,'trade','ordergoods'),(13,'trade','orderinfo'),(14,'trade','shoppingcart'),(5,'users','userprofile'),(6,'users','verifycode'),(15,'user_operation','useraddress'),(16,'user_operation','userfav'),(17,'user_operation','userleavemessage'),(18,'xadmin','bookmark'),(21,'xadmin','log'),(19,'xadmin','usersettings'),(20,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-16 11:48:58.387838'),(2,'contenttypes','0002_remove_content_type_name','2018-10-16 11:48:59.377895'),(3,'auth','0001_initial','2018-10-16 11:49:04.771203'),(4,'auth','0002_alter_permission_name_max_length','2018-10-16 11:49:05.746259'),(5,'auth','0003_alter_user_email_max_length','2018-10-16 11:49:05.823263'),(6,'auth','0004_alter_user_username_opts','2018-10-16 11:49:05.857265'),(7,'auth','0005_alter_user_last_login_null','2018-10-16 11:49:05.897268'),(8,'auth','0006_require_contenttypes_0002','2018-10-16 11:49:05.944270'),(9,'auth','0007_alter_validators_add_error_messages','2018-10-16 11:49:06.021275'),(10,'auth','0008_alter_user_username_max_length','2018-10-16 11:49:06.123281'),(11,'goods','0001_initial','2018-10-16 11:49:14.727773'),(12,'sessions','0001_initial','2018-10-16 11:49:15.488816'),(13,'users','0001_initial','2018-10-16 11:49:20.746117'),(14,'trade','0001_initial','2018-10-16 11:49:22.819236'),(15,'trade','0002_auto_20181016_1948','2018-10-16 11:49:29.637626'),(16,'user_operation','0001_initial','2018-10-16 11:49:31.247718'),(17,'user_operation','0002_auto_20181016_1948','2018-10-16 11:49:35.880983'),(18,'goods','0002_goodscategorybrand_category','2018-10-16 12:21:54.905889'),(19,'xadmin','0001_initial','2018-10-16 12:21:59.897174'),(20,'xadmin','0002_log','2018-10-16 12:22:01.520267'),(21,'xadmin','0003_auto_20160715_0100','2018-10-16 12:22:02.348314'),(22,'goods','0003_auto_20181016_2230','2018-10-16 14:30:35.745495'),(23,'authtoken','0001_initial','2018-10-19 07:31:24.551382'),(24,'authtoken','0002_auto_20160226_1747','2018-10-19 07:31:25.562440'),(25,'trade','0003_auto_20181019_1531','2018-10-19 07:31:26.331484'),(26,'user_operation','0003_auto_20181019_1531','2018-10-19 07:31:26.591498'),(27,'users','0002_auto_20181019_1531','2018-10-19 07:31:26.801510'),(28,'users','0003_auto_20181020_1943','2018-10-20 11:43:09.607139'),(29,'goods','0004_auto_20181020_2010','2018-10-20 12:10:15.153115'),(30,'trade','0004_auto_20181020_2010','2018-10-20 12:10:15.263121'),(31,'user_operation','0004_auto_20181020_2010','2018-10-20 12:10:15.378128'),(32,'users','0004_auto_20181020_2010','2018-10-20 12:10:15.606141'),(33,'users','0005_auto_20181020_2018','2018-10-20 12:18:19.361810'),(34,'goods','0005_goods_is_hot','2018-10-21 01:32:56.110764'),(35,'goods','0006_remove_goods_is_hot','2018-10-21 01:42:25.143311'),(36,'user_operation','0005_auto_20181022_1433','2018-10-22 06:34:11.417410'),(37,'trade','0005_auto_20181022_2149','2018-10-22 13:49:40.317897');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1ku2karpdo1aa6pgo5ezb7zcnf3afjxr','Zjc2NzNlMmRjYjZhZjM2YzNkZDkxNDUzYzMxZGNmZGUyN2Q2YzE4ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjI5NjcyYmM3ZDdlOTQ1ZTdhYmVmYTI2Njg1ZjdkNmY4NDUzZmVhNiJ9','2018-11-04 11:06:52.552416');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_banner`
--

DROP TABLE IF EXISTS `goods_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_goods_id_99e23129_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_banner`
--

LOCK TABLES `goods_banner` WRITE;
/*!40000 ALTER TABLE `goods_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goods`
--

DROP TABLE IF EXISTS `goods_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) NOT NULL,
  `name` varchar(300) NOT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext NOT NULL,
  `goods_desc` longtext NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (1,'saff','新鲜水果甜蜜香脆单果约800克',0,0,0,0,232,156,'食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',1,'goods/images/1_P_1449024889889.jpg',0,'2018-10-16 14:49:00.000000',20),(2,'','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛',0,0,0,0,106,88,'前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/2_P_1448945810202.jpg',0,'2018-10-16 14:49:55.953855',7),(3,'','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐',0,0,0,0,286,238,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/7_P_1448945104883.jpg',0,'2018-10-16 14:49:56.016859',15),(4,'','日本蒜蓉粉丝扇贝270克6只装',0,0,0,0,156,108,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/47_P_1448946213263.jpg',0,'2018-10-16 14:49:56.087863',20),(5,'','内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材',0,0,0,0,106,88,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/10_P_1448944572085.jpg',0,'2018-10-16 14:49:56.149867',7),(6,'','乌拉圭进口牛肉卷特级肥牛卷',0,0,0,0,90,75,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/4_P_1448945381985.jpg',0,'2018-10-16 14:49:56.241872',21),(7,'','五星眼肉牛排套餐8片装原味原切生鲜牛肉',0,0,0,0,150,125,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/8_P_1448945032810.jpg',0,'2018-10-16 14:49:56.311876',23),(8,'','澳洲进口120天谷饲牛仔骨4份原味生鲜',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/11_P_1448944388277.jpg',0,'2018-10-16 14:49:56.383880',7),(9,'','潮香村澳洲进口牛排家庭团购套餐20片',0,0,0,0,239,199,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/6_P_1448945167279.jpg',0,'2018-10-16 14:49:56.475885',22),(10,'','爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g',0,0,0,0,202,168,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/9_P_1448944791617.jpg',0,'2018-10-16 14:49:56.545889',20),(11,'','澳洲进口牛尾巴300g新鲜肥牛肉',0,0,0,0,306,255,'新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/3_P_1448945490837.jpg',0,'2018-10-16 14:49:56.657896',2),(12,'','新疆巴尔鲁克生鲜牛排眼肉牛扒1200g',0,0,0,0,126,88,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/48_P_1448943988970.jpg',0,'2018-10-16 14:49:56.720899',7),(13,'','澳洲进口安格斯牛切片上脑牛排1000g',0,0,0,0,144,120,'澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/5_P_1448945270390.jpg',0,'2018-10-16 14:49:56.829906',12),(14,'','帐篷出租',0,0,0,0,120,100,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'images/201705/goods_img/53_P_1495068879687.jpg',0,'2018-10-16 14:49:56.945912',21),(15,'','52度茅台集团国隆双喜酒500mlx6',0,0,0,0,23,19,'贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/16_P_1448947194687.jpg',0,'2018-10-16 14:49:57.011916',37),(16,'','52度水井坊臻酿八號500ml',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/14_P_1448947354031.jpg',0,'2018-10-16 14:49:57.061919',36),(17,'','53度茅台仁酒500ml',0,0,0,0,190,158,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/12_P_1448947547989.jpg',0,'2018-10-16 14:49:57.124922',32),(18,'','双响炮洋酒JimBeamwhiskey美国白占边',0,0,0,0,38,28,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/46_P_1448946598711.jpg',0,'2018-10-16 14:49:57.175925',29),(19,'','西夫拉姆进口洋酒小酒版',0,0,0,0,55,46,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/21_P_1448946793276.jpg',0,'2018-10-16 14:49:57.361936',36),(20,'','茅台53度飞天茅台500ml',0,0,0,0,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/15_P_1448947257324.jpg',0,'2018-10-16 14:49:57.432940',30),(21,'','52度兰陵·紫气东来1600mL山东名酒',0,0,0,0,42,35,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/13_P_1448947460386.jpg',0,'2018-10-16 14:49:57.503944',29),(22,'','JohnnieWalker尊尼获加黑牌威士忌',0,0,0,0,24,20,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/50_P_1448946543091.jpg',0,'2018-10-16 14:49:57.586949',36),(23,'','人头马CLUB特优香槟干邑350ml',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/51_P_1448946466595.jpg',0,'2018-10-16 14:49:57.658953',30),(24,'','张裕干红葡萄酒750ml*6支',0,0,0,0,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/17_P_1448947102246.jpg',0,'2018-10-16 14:49:57.720956',31),(25,'','原瓶原装进口洋酒烈酒法国云鹿XO白兰地',0,0,0,0,46,38,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/20_P_1448946850602.jpg',0,'2018-10-16 14:49:57.770959',29),(26,'','法国原装进口圣贝克干红葡萄酒750ml',0,0,0,0,82,68,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/19_P_1448946951581.jpg',0,'2018-10-16 14:49:57.811962',25),(27,'','法国百利威干红葡萄酒AOP级6支装',0,0,0,0,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/18_P_1448947011435.jpg',0,'2018-10-16 14:49:57.875965',25),(28,'','芝华士12年苏格兰威士忌700ml',0,0,0,0,71,59,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/22_P_1448946729629.jpg',0,'2018-10-16 14:49:57.924968',30),(29,'','深蓝伏特加巴维兰利口酒送预调酒',0,0,0,0,31,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/45_P_1448946661303.jpg',0,'2018-10-16 14:49:57.966971',36),(30,'','赣南脐橙特级果10斤装',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/32_P_1448948525620.jpg',0,'2018-10-16 14:49:58.017973',62),(31,'safd','泰国菠萝蜜16-18斤1个装',0,6,0,0,11,9,'【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>',1,'goods/images/30_P_1448948663450.jpg',0,'2018-10-16 14:49:00.000000',66),(32,'','四川双流草莓新鲜水果礼盒2盒',0,0,0,0,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/31_P_1448948598947.jpg',0,'2018-10-16 14:49:58.192983',70),(33,'','新鲜头茬非洲冰草冰菜',0,0,0,0,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/35_P_1448948333610.jpg',0,'2018-10-16 14:49:58.261987',58),(34,'','仿真蔬菜水果果蔬菜模型',0,0,0,0,6,5,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/36_P_1448948234405.jpg',0,'2018-10-16 14:49:58.359993',58),(35,'','现摘芭乐番石榴台湾珍珠芭乐',0,0,0,0,28,23,'海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/33_P_1448948479966.jpg',0,'2018-10-16 14:49:58.508001',62),(36,'','潍坊萝卜5斤/箱礼盒',0,0,0,0,46,38,'脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/34_P_1448948399009.jpg',0,'2018-10-16 14:49:58.625008',70),(37,'','休闲零食膨化食品焦糖/奶油/椒麻味',0,0,0,0,154,99,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/43_P_1448948762645.jpg',0,'2018-10-16 14:49:58.667011',74),(38,'','蒙牛未来星儿童成长牛奶骨力型190ml*15盒',0,0,0,0,84,70,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/38_P_1448949220255.jpg',0,'2018-10-16 14:49:58.708013',105),(39,'','蒙牛特仑苏有机奶250ml×12盒',0,0,0,0,70,32,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/44_P_1448948850187.jpg',0,'2018-10-16 14:49:58.767016',103),(40,'','1元支付测试商品',0,0,0,0,1,1,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'images/201511/goods_img/49_P_1448162819889.jpg',0,'2018-10-16 14:49:58.819019',102),(41,'','德运全脂新鲜纯牛奶1L*10盒装整箱',0,0,0,0,70,58,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/40_P_1448949038702.jpg',0,'2018-10-16 14:49:58.867022',103),(42,'','木糖醇红枣早餐奶即食豆奶粉538g',0,0,0,0,38,32,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/39_P_1448949115481.jpg',0,'2018-10-16 14:49:58.908024',106),(43,'','高钙液体奶200ml*24盒',0,0,0,0,26,22,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/41_P_1448948980358.jpg',0,'2018-10-16 14:49:58.958027',107),(44,'','新西兰进口全脂奶粉900g',0,0,0,0,720,600,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/37_P_1448949284365.jpg',0,'2018-10-16 14:49:59.000030',104),(45,'','伊利官方直营全脂营养舒化奶250ml*12盒*2提',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/42_P_1448948895193.jpg',0,'2018-10-16 14:49:59.043032',103),(46,'','维纳斯橄榄菜籽油5L/桶',0,0,0,0,187,156,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/27_P_1448947771805.jpg',0,'2018-10-16 14:49:59.092035',51),(47,'','糙米450gx3包粮油米面',0,0,0,0,18,15,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/23_P_1448948070348.jpg',0,'2018-10-16 14:49:59.133037',41),(48,'','精炼一级大豆油5L色拉油粮油食用油',0,0,0,0,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/26_P_1448947825754.jpg',0,'2018-10-16 14:49:59.185040',56),(49,'','橄榄玉米油5L*2桶',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/28_P_1448947699948.jpg',0,'2018-10-16 14:49:59.384052',54),(50,'','山西黑米农家黑米4斤',0,0,0,0,11,9,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/24_P_1448948023823.jpg',0,'2018-10-16 14:49:59.454056',55),(51,'','稻园牌稻米油粮油米糠油绿色植物油',0,0,0,0,14,12,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/25_P_1448947875346.jpg',0,'2018-10-16 14:49:59.517059',47),(52,'','融氏纯玉米胚芽油5l桶',0,0,0,0,14,12,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/29_P_1448947631994.jpg',0,'2018-10-16 14:49:59.575063',41);
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodscategory`
--

DROP TABLE IF EXISTS `goods_goodscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodscategory`
--

LOCK TABLES `goods_goodscategory` WRITE;
/*!40000 ALTER TABLE `goods_goodscategory` DISABLE KEYS */;
INSERT INTO `goods_goodscategory` VALUES (1,'生鲜食品','sxsp','',1,0,'2018-10-16 14:00:53.951583',NULL),(2,'精品肉类','jprl','',2,0,'2018-10-16 14:00:54.875635',1),(3,'羊肉','yr','',3,0,'2018-10-16 14:00:54.909637',2),(4,'禽类','ql','',3,0,'2018-10-16 14:00:54.979641',2),(5,'猪肉','zr','',3,0,'2018-10-16 14:00:55.019644',2),(6,'牛肉','nr','',3,0,'2018-10-16 14:00:55.050645',2),(7,'海鲜水产','hxsc','',2,0,'2018-10-16 14:00:55.070647',1),(8,'参鲍','cb','',3,0,'2018-10-16 14:00:55.092648',7),(9,'鱼','yu','',3,0,'2018-10-16 14:00:55.112649',7),(10,'虾','xia','',3,0,'2018-10-16 14:00:55.134650',7),(11,'蟹/贝','xb','',3,0,'2018-10-16 14:00:55.162652',7),(12,'蛋制品','dzp','',2,0,'2018-10-16 14:00:55.184653',1),(13,'松花蛋/咸鸭蛋','xhd_xyd','',3,0,'2018-10-16 14:00:55.309660',12),(14,'鸡蛋','jd','',3,0,'2018-10-16 14:00:55.359663',12),(15,'叶菜类','ycl','',2,0,'2018-10-16 14:00:55.379664',1),(16,'生菜','sc','',3,0,'2018-10-16 14:00:55.400665',15),(17,'菠菜','bc','',3,0,'2018-10-16 14:00:55.420667',15),(18,'圆椒','yj','',3,0,'2018-10-16 14:00:55.442668',15),(19,'西兰花','xlh','',3,0,'2018-10-16 14:00:55.471669',15),(20,'根茎类','gjl','',2,0,'2018-10-16 14:00:55.492671',1),(21,'茄果类','qgl','',2,0,'2018-10-16 14:00:55.512672',1),(22,'菌菇类','jgl','',2,0,'2018-10-16 14:00:55.550674',1),(23,'进口生鲜','jksx','',2,0,'2018-10-16 14:00:55.570675',1),(24,'酒水饮料','jsyl','',1,0,'2018-10-16 14:00:55.592676',NULL),(25,'白酒','bk','',2,0,'2018-10-16 14:00:55.621678',24),(26,'五粮液','wly','',3,0,'2018-10-16 14:00:55.642679',25),(27,'泸州老窖','lzlj','',3,0,'2018-10-16 14:00:55.662680',25),(28,'茅台','mt','',3,0,'2018-10-16 14:00:55.684682',25),(29,'葡萄酒','ptj','',2,0,'2018-10-16 14:00:55.704683',24),(30,'洋酒','yj','',2,0,'2018-10-16 14:00:55.725684',24),(31,'啤酒','pj','',2,0,'2018-10-16 14:00:55.754686',24),(32,'其他酒品','qtjp','',2,0,'2018-10-16 14:00:55.775687',24),(33,'其他品牌','qtpp','',3,0,'2018-10-16 14:00:55.796688',32),(34,'黄酒','hj','',3,0,'2018-10-16 14:00:55.817689',32),(35,'养生酒','ysj','',3,0,'2018-10-16 14:00:55.837690',32),(36,'饮料/水','yls','',2,0,'2018-10-16 14:00:55.857692',24),(37,'红酒','hj','',2,0,'2018-10-16 14:00:55.879693',24),(38,'白兰地','bld','',3,0,'2018-10-16 14:00:55.900694',37),(39,'威士忌','wsj','',3,0,'2018-10-16 14:00:55.920695',37),(40,'粮油副食','粮油副食','',1,0,'2018-10-16 14:00:55.942696',NULL),(41,'食用油','食用油','',2,0,'2018-10-16 14:00:55.962698',40),(42,'其他食用油','其他食用油','',3,0,'2018-10-16 14:00:55.984699',41),(43,'菜仔油','菜仔油','',3,0,'2018-10-16 14:00:56.004700',41),(44,'花生油','花生油','',3,0,'2018-10-16 14:00:56.025701',41),(45,'橄榄油','橄榄油','',3,0,'2018-10-16 14:00:56.046702',41),(46,'礼盒','礼盒','',3,0,'2018-10-16 14:00:56.067704',41),(47,'米面杂粮','米面杂粮','',2,0,'2018-10-16 14:00:56.087705',40),(48,'面粉/面条','面粉/面条','',3,0,'2018-10-16 14:00:56.109706',47),(49,'大米','大米','',3,0,'2018-10-16 14:00:56.129707',47),(50,'意大利面','意大利面','',3,0,'2018-10-16 14:00:56.150708',47),(51,'厨房调料','厨房调料','',2,0,'2018-10-16 14:00:56.171709',40),(52,'调味油/汁','调味油/汁','',3,0,'2018-10-16 14:00:56.192711',51),(53,'酱油/醋','酱油/醋','',3,0,'2018-10-16 14:00:56.212712',51),(54,'南北干货','南北干货','',2,0,'2018-10-16 14:00:56.234713',40),(55,'方便速食','方便速食','',2,0,'2018-10-16 14:00:56.267715',40),(56,'调味品','调味品','',2,0,'2018-10-16 14:00:56.287716',40),(57,'蔬菜水果','蔬菜水果','蔬菜水果',1,1,'2018-10-16 14:00:00.000000',NULL),(58,'有机蔬菜','有机蔬菜','',2,0,'2018-10-16 14:00:56.387722',57),(59,'西红柿','西红柿','',3,0,'2018-10-16 14:00:56.409723',58),(60,'韭菜','韭菜','',3,0,'2018-10-16 14:00:56.429724',58),(61,'青菜','青菜','',3,0,'2018-10-16 14:00:56.467726',58),(62,'精选蔬菜','精选蔬菜','',2,0,'2018-10-16 14:00:56.496728',57),(63,'甘蓝','甘蓝','',3,0,'2018-10-16 14:00:56.517729',62),(64,'胡萝卜','胡萝卜','',3,0,'2018-10-16 14:00:56.537730',62),(65,'黄瓜','黄瓜','',3,0,'2018-10-16 14:00:56.559732',62),(66,'进口水果','进口水果','',2,0,'2018-10-16 14:00:56.579733',57),(67,'火龙果','火龙果','',3,0,'2018-10-16 14:00:56.600734',66),(68,'菠萝蜜','菠萝蜜','',3,0,'2018-10-16 14:00:56.629736',66),(69,'奇异果','奇异果','',3,0,'2018-10-16 14:00:56.650737',66),(70,'国产水果','国产水果','',2,0,'2018-10-16 14:00:56.671738',57),(71,'水果礼盒','水果礼盒','',3,0,'2018-10-16 14:00:56.692739',70),(72,'苹果','苹果','',3,0,'2018-10-16 14:00:56.712740',70),(73,'雪梨','雪梨','',3,0,'2018-10-16 14:00:56.734742',70),(74,'休闲食品','休闲食品','休闲食品',1,1,'2018-10-16 14:00:00.000000',NULL),(75,'休闲零食','休闲零食','',2,0,'2018-10-16 14:00:56.784745',74),(76,'果冻','果冻','',3,0,'2018-10-16 14:00:56.804746',75),(77,'枣类','枣类','',3,0,'2018-10-16 14:00:56.825747',75),(78,'蜜饯','蜜饯','',3,0,'2018-10-16 14:00:56.846748',75),(79,'肉类零食','肉类零食','',3,0,'2018-10-16 14:00:56.865749',75),(80,'坚果炒货','坚果炒货','',3,0,'2018-10-16 14:00:56.887750',75),(81,'糖果','糖果','',2,0,'2018-10-16 14:00:56.909752',74),(82,'创意喜糖','创意喜糖','',3,0,'2018-10-16 14:00:56.929753',81),(83,'口香糖','口香糖','',3,0,'2018-10-16 14:00:56.950754',81),(84,'软糖','软糖','',3,0,'2018-10-16 14:00:56.970755',81),(85,'棒棒糖','棒棒糖','',3,0,'2018-10-16 14:00:57.000757',81),(86,'巧克力','巧克力','',2,0,'2018-10-16 14:00:57.020758',74),(87,'夹心巧克力','夹心巧克力','',3,0,'2018-10-16 14:00:57.042759',86),(88,'白巧克力','白巧克力','',3,0,'2018-10-16 14:00:57.062760',86),(89,'松露巧克力','松露巧克力','',3,0,'2018-10-16 14:00:57.084762',86),(90,'黑巧克力','黑巧克力','',3,0,'2018-10-16 14:00:57.104763',86),(91,'肉干肉脯/豆干','肉干肉脯/豆干','',2,0,'2018-10-16 14:00:57.134765',74),(92,'牛肉干','牛肉干','',3,0,'2018-10-16 14:00:57.154766',91),(93,'猪肉脯','猪肉脯','',3,0,'2018-10-16 14:00:57.184767',91),(94,'牛肉粒','牛肉粒','',3,0,'2018-10-16 14:00:57.255771',91),(95,'猪肉干','猪肉干','',3,0,'2018-10-16 14:00:57.300774',91),(96,'鱿鱼丝/鱼干','鱿鱼丝/鱼干','',2,0,'2018-10-16 14:00:57.320775',74),(97,'鱿鱼足','鱿鱼足','',3,0,'2018-10-16 14:00:57.342776',96),(98,'鱿鱼丝','鱿鱼丝','',3,0,'2018-10-16 14:00:57.362778',96),(99,'墨鱼/乌贼','墨鱼/乌贼','',3,0,'2018-10-16 14:00:57.384779',96),(100,'鱿鱼仔','鱿鱼仔','',3,0,'2018-10-16 14:00:57.404780',96),(101,'鱿鱼片','鱿鱼片','',3,0,'2018-10-16 14:00:57.425781',96),(102,'奶类食品','奶类食品','奶类食品',1,1,'2018-10-16 14:00:00.000000',NULL),(103,'进口奶品','进口奶品','',2,0,'2018-10-16 14:00:57.467784',102),(104,'国产奶品','国产奶品','',2,0,'2018-10-16 14:00:57.487785',102),(105,'奶粉','奶粉','',2,0,'2018-10-16 14:00:57.509786',102),(106,'有机奶','有机奶','',2,0,'2018-10-16 14:00:57.537788',102),(107,'原料奶','原料奶','',2,0,'2018-10-16 14:00:57.559789',102),(108,'天然干货','天然干货','天然干货',1,1,'2018-10-16 14:00:00.000000',NULL),(109,'菌菇类','菌菇类','',2,0,'2018-10-16 14:00:57.600791',108),(110,'腌干海产','腌干海产','',2,0,'2018-10-16 14:00:57.620792',108),(111,'汤料','汤料','',2,0,'2018-10-16 14:00:57.650794',108),(112,'豆类','豆类','',2,0,'2018-10-16 14:00:57.679796',108),(113,'干菜/菜干','干菜/菜干','',2,0,'2018-10-16 14:00:57.700797',108),(114,'干果/果干','干果/果干','',2,0,'2018-10-16 14:00:57.734799',108),(115,'豆制品','豆制品','',2,0,'2018-10-16 14:00:57.784802',108),(116,'腊味','腊味','',2,0,'2018-10-16 14:00:57.804803',108),(117,'精选茗茶','精选茗茶','精选茗茶',1,1,'2018-10-16 14:00:00.000000',NULL),(118,'白茶','白茶','',2,0,'2018-10-16 14:00:57.854806',117),(119,'红茶','红茶','',2,0,'2018-10-16 14:00:57.875807',117),(120,'绿茶','绿茶','',2,0,'2018-10-16 14:00:57.895808',117);
/*!40000 ALTER TABLE `goods_goodscategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodscategorybrand`
--

DROP TABLE IF EXISTS `goods_goodscategorybrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodscategorybrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategoryb_category_id_528934b3_fk_goods_goo` (`category_id`),
  CONSTRAINT `goods_goodscategoryb_category_id_528934b3_fk_goods_goo` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodscategorybrand`
--

LOCK TABLES `goods_goodscategorybrand` WRITE;
/*!40000 ALTER TABLE `goods_goodscategorybrand` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_goodscategorybrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsimage`
--

DROP TABLE IF EXISTS `goods_goodsimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsimage`
--

LOCK TABLES `goods_goodsimage` WRITE;
/*!40000 ALTER TABLE `goods_goodsimage` DISABLE KEYS */;
INSERT INTO `goods_goodsimage` VALUES (1,'goods/images/1_P_1449024889889.jpg','2018-10-16 14:49:55.742843',1),(2,'334913-105.jpg','2018-10-16 14:49:55.761844',1),(3,'goods/images/1_P_1449024889726.jpg','2018-10-16 14:49:55.791846',1),(4,'goods/images/1_P_1449024889018.jpg','2018-10-16 14:49:55.903853',1),(5,'goods/images/1_P_1449024889287.jpg','2018-10-16 14:49:55.924854',1),(6,'goods/images/2_P_1448945810202.jpg','2018-10-16 14:49:55.974857',2),(7,'goods/images/2_P_1448945810814.jpg','2018-10-16 14:49:55.995858',2),(8,'goods/images/7_P_1448945104883.jpg','2018-10-16 14:49:56.036860',3),(9,'goods/images/7_P_1448945104734.jpg','2018-10-16 14:49:56.058861',3),(10,'goods/images/47_P_1448946213263.jpg','2018-10-16 14:49:56.108864',4),(11,'goods/images/47_P_1448946213157.jpg','2018-10-16 14:49:56.128865',4),(12,'goods/images/10_P_1448944572085.jpg','2018-10-16 14:49:56.170868',5),(13,'goods/images/10_P_1448944572532.jpg','2018-10-16 14:49:56.191869',5),(14,'goods/images/10_P_1448944572872.jpg','2018-10-16 14:49:56.220871',5),(15,'goods/images/4_P_1448945381985.jpg','2018-10-16 14:49:56.270874',6),(16,'goods/images/4_P_1448945381013.jpg','2018-10-16 14:49:56.291875',6),(17,'goods/images/8_P_1448945032810.jpg','2018-10-16 14:49:56.342878',7),(18,'goods/images/8_P_1448945032646.jpg','2018-10-16 14:49:56.362879',7),(19,'goods/images/11_P_1448944388277.jpg','2018-10-16 14:49:56.403881',8),(20,'goods/images/11_P_1448944388034.jpg','2018-10-16 14:49:56.425882',8),(21,'goods/images/11_P_1448944388201.jpg','2018-10-16 14:49:56.445884',8),(22,'goods/images/6_P_1448945167279.jpg','2018-10-16 14:49:56.503887',9),(23,'goods/images/6_P_1448945167015.jpg','2018-10-16 14:49:56.524888',9),(24,'goods/images/9_P_1448944791617.jpg','2018-10-16 14:49:56.566890',10),(25,'goods/images/9_P_1448944791129.jpg','2018-10-16 14:49:56.586892',10),(26,'goods/images/9_P_1448944791077.jpg','2018-10-16 14:49:56.617893',10),(27,'goods/images/9_P_1448944791229.jpg','2018-10-16 14:49:56.636894',10),(28,'goods/images/3_P_1448945490837.jpg','2018-10-16 14:49:56.678897',11),(29,'goods/images/3_P_1448945490084.jpg','2018-10-16 14:49:56.700898',11),(30,'goods/images/48_P_1448943988970.jpg','2018-10-16 14:49:56.741900',12),(31,'goods/images/48_P_1448943988898.jpg','2018-10-16 14:49:56.761902',12),(32,'goods/images/48_P_1448943988439.jpg','2018-10-16 14:49:56.782903',12),(33,'goods/images/5_P_1448945270390.jpg','2018-10-16 14:49:56.874908',13),(34,'goods/images/5_P_1448945270067.jpg','2018-10-16 14:49:56.903910',13),(35,'goods/images/5_P_1448945270432.jpg','2018-10-16 14:49:56.924911',13),(36,'images/201705/goods_img/53_P_1495068879687.jpg','2018-10-16 14:49:56.991915',14),(37,'goods/images/16_P_1448947194687.jpg','2018-10-16 14:49:57.032917',15),(38,'goods/images/14_P_1448947354031.jpg','2018-10-16 14:49:57.083920',16),(39,'goods/images/14_P_1448947354433.jpg','2018-10-16 14:49:57.103921',16),(40,'goods/images/12_P_1448947547989.jpg','2018-10-16 14:49:57.145924',17),(41,'goods/images/46_P_1448946598711.jpg','2018-10-16 14:49:57.296932',18),(42,'goods/images/46_P_1448946598301.jpg','2018-10-16 14:49:57.341935',18),(43,'goods/images/21_P_1448946793276.jpg','2018-10-16 14:49:57.392938',19),(44,'goods/images/21_P_1448946793153.jpg','2018-10-16 14:49:57.411939',19),(45,'goods/images/15_P_1448947257324.jpg','2018-10-16 14:49:57.453941',20),(46,'goods/images/15_P_1448947257580.jpg','2018-10-16 14:49:57.474942',20),(47,'goods/images/13_P_1448947460386.jpg','2018-10-16 14:49:57.524945',21),(48,'goods/images/13_P_1448947460276.jpg','2018-10-16 14:49:57.545946',21),(49,'goods/images/13_P_1448947460353.jpg','2018-10-16 14:49:57.566948',21),(50,'goods/images/50_P_1448946543091.jpg','2018-10-16 14:49:57.608950',22),(51,'goods/images/50_P_1448946542182.jpg','2018-10-16 14:49:57.636952',22),(52,'goods/images/51_P_1448946466595.jpg','2018-10-16 14:49:57.678954',23),(53,'goods/images/51_P_1448946466208.jpg','2018-10-16 14:49:57.699955',23),(54,'goods/images/17_P_1448947102246.jpg','2018-10-16 14:49:57.741958',24),(55,'goods/images/20_P_1448946850602.jpg','2018-10-16 14:49:57.791961',25),(56,'goods/images/19_P_1448946951581.jpg','2018-10-16 14:49:57.832963',26),(57,'goods/images/19_P_1448946951726.jpg','2018-10-16 14:49:57.853964',26),(58,'goods/images/18_P_1448947011435.jpg','2018-10-16 14:49:57.903967',27),(59,'goods/images/22_P_1448946729629.jpg','2018-10-16 14:49:57.945969',28),(60,'goods/images/45_P_1448946661303.jpg','2018-10-16 14:49:57.986972',29),(61,'goods/images/32_P_1448948525620.jpg','2018-10-16 14:49:58.045975',30),(62,'goods/images/30_P_1448948663450.jpg','2018-10-16 14:49:58.095978',31),(63,'goods/images/30_P_1448948662571.jpg','2018-10-16 14:49:58.116979',31),(64,'goods/images/30_P_1448948663221.jpg','2018-10-16 14:49:58.149981',31),(65,'goods/images/31_P_1448948598947.jpg','2018-10-16 14:49:58.220985',32),(66,'goods/images/31_P_1448948598475.jpg','2018-10-16 14:49:58.241986',32),(67,'goods/images/35_P_1448948333610.jpg','2018-10-16 14:49:58.307990',33),(68,'goods/images/35_P_1448948333313.jpg','2018-10-16 14:49:58.328991',33),(69,'goods/images/36_P_1448948234405.jpg','2018-10-16 14:49:58.437997',34),(70,'goods/images/36_P_1448948234250.jpg','2018-10-16 14:49:58.487000',34),(71,'goods/images/33_P_1448948479966.jpg','2018-10-16 14:49:58.575005',35),(72,'goods/images/33_P_1448948479886.jpg','2018-10-16 14:49:58.604007',35),(73,'goods/images/34_P_1448948399009.jpg','2018-10-16 14:49:58.646009',36),(74,'goods/images/43_P_1448948762645.jpg','2018-10-16 14:49:58.687012',37),(75,'goods/images/38_P_1448949220255.jpg','2018-10-16 14:49:58.746015',38),(76,'goods/images/44_P_1448948850187.jpg','2018-10-16 14:49:58.796018',39),(77,'images/201511/goods_img/49_P_1448162819889.jpg','2018-10-16 14:49:58.846021',40),(78,'goods/images/40_P_1448949038702.jpg','2018-10-16 14:49:58.888023',41),(79,'goods/images/39_P_1448949115481.jpg','2018-10-16 14:49:58.938026',42),(80,'goods/images/41_P_1448948980358.jpg','2018-10-16 14:49:58.979028',43),(81,'goods/images/37_P_1448949284365.jpg','2018-10-16 14:49:59.021031',44),(82,'goods/images/42_P_1448948895193.jpg','2018-10-16 14:49:59.071034',45),(83,'goods/images/27_P_1448947771805.jpg','2018-10-16 14:49:59.113036',46),(84,'goods/images/23_P_1448948070348.jpg','2018-10-16 14:49:59.154038',47),(85,'goods/images/26_P_1448947825754.jpg','2018-10-16 14:49:59.348050',48),(86,'goods/images/28_P_1448947699948.jpg','2018-10-16 14:49:59.404053',49),(87,'goods/images/28_P_1448947699777.jpg','2018-10-16 14:49:59.435055',49),(88,'goods/images/24_P_1448948023823.jpg','2018-10-16 14:49:59.475057',50),(89,'goods/images/24_P_1448948023977.jpg','2018-10-16 14:49:59.496058',50),(90,'goods/images/25_P_1448947875346.jpg','2018-10-16 14:49:59.554061',51),(91,'goods/images/29_P_1448947631994.jpg','2018-10-16 14:49:59.596064',52);
/*!40000 ALTER TABLE `goods_goodsimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_ordergoods`
--

DROP TABLE IF EXISTS `trade_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_ordergoods`
--

LOCK TABLES `trade_ordergoods` WRITE;
/*!40000 ALTER TABLE `trade_ordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_orderinfo`
--

DROP TABLE IF EXISTS `trade_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) NOT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `pay_status` varchar(10) NOT NULL,
  `post_script` varchar(200) NOT NULL,
  `order_mount` double NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_orderinfo`
--

LOCK TABLES `trade_orderinfo` WRITE;
/*!40000 ALTER TABLE `trade_orderinfo` DISABLE KEYS */;
INSERT INTO `trade_orderinfo` VALUES (2,'201810242136191611',NULL,'wait','来一打小虾米',0,'老隆镇沿江路','超人','18219228570','2018-10-24 13:36:19.620695',1);
/*!40000 ALTER TABLE `trade_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_shoppingcart`
--

DROP TABLE IF EXISTS `trade_shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_shoppingcart_user_id_goods_id_92225e66_uniq` (`user_id`,`goods_id`),
  KEY `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_shoppingcart`
--

LOCK TABLES `trade_shoppingcart` WRITE;
/*!40000 ALTER TABLE `trade_shoppingcart` DISABLE KEYS */;
INSERT INTO `trade_shoppingcart` VALUES (5,1,'2018-10-24 13:38:35.627474',2,1);
/*!40000 ALTER TABLE `trade_shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_useraddress`
--

DROP TABLE IF EXISTS `user_operation_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(100) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_usera_user_id_fe128593_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_useraddress`
--

LOCK TABLES `user_operation_useraddress` WRITE;
/*!40000 ALTER TABLE `user_operation_useraddress` DISABLE KEYS */;
INSERT INTO `user_operation_useraddress` VALUES (2,'龙川县','老隆镇沿江路','超人','18219228570','2018-10-22 06:52:26.711057',1,'河源市','广东省'),(3,'房山区','学府路康乐大厦','凹凸曼','18520849338','2018-10-22 07:09:40.103164',1,'北京城区','北京市');
/*!40000 ALTER TABLE `user_operation_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_userfav`
--

DROP TABLE IF EXISTS `user_operation_userfav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` (`user_id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_userfav`
--

LOCK TABLES `user_operation_userfav` WRITE;
/*!40000 ALTER TABLE `user_operation_userfav` DISABLE KEYS */;
INSERT INTO `user_operation_userfav` VALUES (4,'2018-10-21 03:24:19.922056',1,12),(13,'2018-10-21 12:12:27.293470',1,1);
/*!40000 ALTER TABLE `user_operation_userfav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_userleavemessage`
--

DROP TABLE IF EXISTS `user_operation_userleavemessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_operation_userleavemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userl_user_id_b1f9a0f8_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_userl_user_id_b1f9a0f8_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_userleavemessage`
--

LOCK TABLES `user_operation_userleavemessage` WRITE;
/*!40000 ALTER TABLE `user_operation_userleavemessage` DISABLE KEYS */;
INSERT INTO `user_operation_userleavemessage` VALUES (3,1,'hi','hi gay!','messages/109951163314904028.jpg','2018-10-22 03:32:56.210383',1);
/*!40000 ALTER TABLE `user_operation_userleavemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$36000$V3xtdieX3ySR$bKA0zvtEW8K9Ri0l7SAXPUg5wPcuEtN4xW0uFSUiYdE=','2018-10-21 11:06:52.303402',1,'admin','','',1,1,'2018-10-16 12:28:53.056805','fone',NULL,'','female','609788423@qq.com','2018-10-16 20:28:53.056805'),(12,'pbkdf2_sha256$36000$Zu6YSfLaNUKk$MOPlwtgZiJue77oyFcqlfr/EF04lkr2aiW7fiitlFYw=',NULL,0,'18219228570','','',0,1,'2018-10-20 14:04:45.885098',NULL,NULL,'18219228570','female',NULL,'2018-10-20 14:04:45.885098');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_verifycode`
--

DROP TABLE IF EXISTS `users_verifycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_verifycode`
--

LOCK TABLES `users_verifycode` WRITE;
/*!40000 ALTER TABLE `users_verifycode` DISABLE KEYS */;
INSERT INTO `users_verifycode` VALUES (1,'45c6','18520849338','2018-10-20 04:15:34.226099'),(2,'dddd','18219228570','2018-10-20 14:04:00.000000');
/*!40000 ALTER TABLE `users_verifycode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-10-18 07:25:04.855807','127.0.0.1','117','精选茗茶','change','修改 desc 和 is_tab',9,1),(2,'2018-10-18 07:25:47.609252','127.0.0.1','108','天然干货','change','修改 desc 和 is_tab',9,1),(3,'2018-10-18 07:25:55.744717','127.0.0.1','102','奶类食品','change','修改 desc 和 is_tab',9,1),(4,'2018-10-18 07:26:05.286263','127.0.0.1','74','休闲食品','change','修改 desc 和 is_tab',9,1),(5,'2018-10-18 07:26:23.129284','127.0.0.1','57','蔬菜水果','change','修改 desc 和 is_tab',9,1),(6,'2018-10-18 11:24:51.555679','127.0.0.1','31','泰国菠萝蜜16-18斤1个装','change','修改 goods_sn，sold_num 和 goods_desc',8,1),(7,'2018-10-20 11:18:22.557084','127.0.0.1','2','dddd','create','已添加',6,1),(8,'2018-10-20 11:44:44.283554','127.0.0.1','2','dddd','change','修改 add_time',6,1),(9,'2018-10-20 12:07:11.701622','127.0.0.1','2','dddd','change','修改 add_time',6,1),(10,'2018-10-20 12:11:17.609687','127.0.0.1','2','dddd','change','修改 add_time',6,1),(11,'2018-10-20 12:22:42.932885','127.0.0.1','2','dddd','change','修改 add_time',6,1),(12,'2018-10-20 12:49:33.770020','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(13,'2018-10-20 12:49:52.879113','127.0.0.1','2','dddd','change','修改 add_time',6,1),(14,'2018-10-20 12:50:59.179905','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(15,'2018-10-20 13:21:32.293753','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(16,'2018-10-20 13:21:37.792068','127.0.0.1','2','dddd','change','修改 add_time',6,1),(17,'2018-10-20 13:22:14.104145','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(18,'2018-10-20 13:28:36.223001','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(19,'2018-10-20 13:28:41.775318','127.0.0.1','2','dddd','change','修改 add_time',6,1),(20,'2018-10-20 13:30:21.887044','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(21,'2018-10-20 13:31:55.473397','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(22,'2018-10-20 13:32:17.754671','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(23,'2018-10-20 13:58:34.811874','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(24,'2018-10-20 13:58:40.793216','127.0.0.1','2','dddd','change','修改 add_time',6,1),(25,'2018-10-20 14:04:26.001961','127.0.0.1',NULL,'','delete','批量删除 1 个 用户',NULL,1),(26,'2018-10-20 14:04:32.919357','127.0.0.1','2','dddd','change','修改 add_time',6,1),(27,'2018-10-21 00:47:35.150134','127.0.0.1','1','新鲜水果甜蜜香脆单果约800克','change','修改 goods_sn 和 goods_desc',8,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-26 18:26:32
