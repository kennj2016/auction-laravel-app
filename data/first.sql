-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: auction
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `admin_user_roles`
--

DROP TABLE IF EXISTS `admin_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_roles`
--

LOCK TABLES `admin_user_roles` WRITE;
/*!40000 ALTER TABLE `admin_user_roles` DISABLE KEYS */;
INSERT INTO `admin_user_roles` VALUES (1,'Webmaster','webmaster'),(2,'Administrator','administrator'),(3,'Staff','staff');
/*!40000 ALTER TABLE `admin_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_id` int(11) unsigned NOT NULL DEFAULT '3',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(255) NOT NULL,
  `login_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token_expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,1,'mrtaiw','$2a$06$lalLUB0TIaxxd5Djb/d0yuToiOgfkYHN2BgRvBSRkNd30.2PcZveS',1,'5BIpTOAh7MfnWKpmv3aJwTsGZkUptrJMFDf1N3eSe0NrKejcXgoUJUVuHiD5','749f258446f1d3bc08c9b669b3bb1a0f','2015-12-21 18:33:21','2016-07-18 07:24:08','2014-10-13 17:10:13','2016-07-18 07:24:08');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'CRKT','','/uploads/brands/crkt.png',1,'2016-07-08 04:31:36','2016-07-08 04:31:36');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands_products`
--

DROP TABLE IF EXISTS `brands_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned DEFAULT NULL,
  `brand_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_products`
--

LOCK TABLES `brands_products` WRITE;
/*!40000 ALTER TABLE `brands_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `global_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,0,'My Category','',1,0,0,'2016-07-07 15:20:00','2016-07-07 15:21:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_posts`
--

DROP TABLE IF EXISTS `categories_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_posts`
--

LOCK TABLES `categories_posts` WRITE;
/*!40000 ALTER TABLE `categories_posts` DISABLE KEYS */;
INSERT INTO `categories_posts` VALUES (1,1,1);
/*!40000 ALTER TABLE `categories_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_contents`
--

DROP TABLE IF EXISTS `category_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `language_id` int(11) unsigned NOT NULL DEFAULT '59',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1',
  `thumbnail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_contents`
--

LOCK TABLES `category_contents` WRITE;
/*!40000 ALTER TABLE `category_contents` DISABLE KEYS */;
INSERT INTO `category_contents` VALUES (1,1,59,'My Category','my-category','','','1','','',0,'2016-07-07 15:20:00','2016-07-07 15:20:00'),(2,1,1,'My category','my-category','','','1','','',1,'2016-07-07 15:21:44','2016-07-07 15:21:52');
/*!40000 ALTER TABLE `category_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_metas`
--

DROP TABLE IF EXISTS `category_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_metas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) unsigned DEFAULT NULL,
  `meta_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_metas`
--

LOCK TABLES `category_metas` WRITE;
/*!40000 ALTER TABLE `category_metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) unsigned DEFAULT NULL,
  `city_name` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4064 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,5,'Canillo',0,0),(2,5,'Encamp',0,0),(3,5,'La Massana',0,0),(4,5,'Ordino',0,0),(5,5,'Sant Julia de Loria',0,0),(6,5,'Andorra la Vella',0,0),(7,5,'Escaldes-Engordany',0,0),(8,221,'Abu Dhabi',0,0),(9,221,'Ajman',0,0),(10,221,'Dubai',0,0),(11,221,'Fujairah',0,0),(12,221,'Ras Al Khaimah',0,0),(13,221,'Sharjah',0,0),(14,221,'Umm Al Quwain',0,0),(15,1,'Badakhshan',0,0),(16,1,'Badghis',0,0),(17,1,'Baghlan',0,0),(18,1,'Bamian',0,0),(19,1,'Farah',0,0),(20,1,'Faryab',0,0),(21,1,'Ghazni',0,0),(22,1,'Ghowr',0,0),(23,1,'Helmand',0,0),(24,1,'Herat',0,0),(25,1,'Kabol',0,0),(26,1,'Kapisa',0,0),(27,1,'Lowgar',0,0),(28,1,'Nangarhar',0,0),(29,1,'Nimruz',0,0),(30,1,'Kandahar',0,0),(31,1,'Kondoz',0,0),(32,1,'Takhar',0,0),(33,1,'Vardak',0,0),(34,1,'Zabol',0,0),(35,1,'Paktika',0,0),(36,1,'Balkh',0,0),(37,1,'Jowzjan',0,0),(38,1,'Samangan',0,0),(39,1,'Sar-e Pol',0,0),(40,1,'Konar',0,0),(41,1,'Laghman',0,0),(42,1,'Paktia',0,0),(43,1,'Khowst',0,0),(44,1,'Nurestan',0,0),(45,1,'Oruzgan',0,0),(46,1,'Parvan',0,0),(47,1,'Daykondi',0,0),(48,1,'Panjshir',0,0),(49,9,'Barbuda',0,0),(50,9,'Saint George',0,0),(51,9,'Saint John',0,0),(52,9,'Saint Mary',0,0),(53,9,'Saint Paul',0,0),(54,9,'Saint Peter',0,0),(55,9,'Saint Philip',0,0),(56,9,'Redonda',0,0),(57,2,'Berat',0,0),(58,2,'Diber',0,0),(59,2,'Durres',0,0),(60,2,'Elbasan',0,0),(61,2,'Fier',0,0),(62,2,'Gjirokaster',0,0),(63,2,'Korce',0,0),(64,2,'Kukes',0,0),(65,2,'Lezhe',0,0),(66,2,'Shkoder',0,0),(67,2,'Tirane',0,0),(68,2,'Vlore',0,0),(69,11,'Aragatsotn',0,0),(70,11,'Ararat',0,0),(71,11,'Armavir',0,0),(72,11,'Geghark\'unik\'',0,0),(73,11,'Kotayk\'',0,0),(74,11,'Lorri',0,0),(75,11,'Shirak',0,0),(76,11,'Syunik\'',0,0),(77,11,'Tavush',0,0),(78,11,'Vayots\' Dzor',0,0),(79,11,'Yerevan',0,0),(80,6,'Benguela',0,0),(81,6,'Bie',0,0),(82,6,'Cabinda',0,0),(83,6,'Cuando Cubango',0,0),(84,6,'Cuanza Norte',0,0),(85,6,'Cuanza Sul',0,0),(86,6,'Cunene',0,0),(87,6,'Huambo',0,0),(88,6,'Huila',0,0),(89,6,'Malanje',0,0),(90,6,'Namibe',0,0),(91,6,'Moxico',0,0),(92,6,'Uige',0,0),(93,6,'Zaire',0,0),(94,6,'Lunda Norte',0,0),(95,6,'Lunda Sul',0,0),(96,6,'Bengo',0,0),(97,6,'Luanda',0,0),(98,10,'Buenos Aires',0,0),(99,10,'Catamarca',0,0),(100,10,'Chaco',0,0),(101,10,'Chubut',0,0),(102,10,'Cordoba',0,0),(103,10,'Corrientes',0,0),(104,10,'Distrito Federal',0,0),(105,10,'Entre Rios',0,0),(106,10,'Formosa',0,0),(107,10,'Jujuy',0,0),(108,10,'La Pampa',0,0),(109,10,'La Rioja',0,0),(110,10,'Mendoza',0,0),(111,10,'Misiones',0,0),(112,10,'Neuquen',0,0),(113,10,'Rio Negro',0,0),(114,10,'Salta',0,0),(115,10,'San Juan',0,0),(116,10,'San Luis',0,0),(117,10,'Santa Cruz',0,0),(118,10,'Santa Fe',0,0),(119,10,'Santiago del Estero',0,0),(120,10,'Tierra del Fuego',0,0),(121,10,'Tucuman',0,0),(122,14,'Burgenland',0,0),(123,14,'Karnten',0,0),(124,14,'Niederosterreich',0,0),(125,14,'Oberosterreich',0,0),(126,14,'Salzburg',0,0),(127,14,'Steiermark',0,0),(128,14,'Tirol',0,0),(129,14,'Vorarlberg',0,0),(130,14,'Wien',0,0),(131,13,'Australian Capital Territory',0,0),(132,13,'New South Wales',0,0),(133,13,'Northern Territory',0,0),(134,13,'Queensland',0,0),(135,13,'South Australia',0,0),(136,13,'Tasmania',0,0),(137,13,'Victoria',28.7466,-97.0165),(138,13,'Western Australia',0,0),(139,15,'Abseron',0,0),(140,15,'Agcabadi',0,0),(141,15,'Agdam',0,0),(142,15,'Agdas',0,0),(143,15,'Agstafa',0,0),(144,15,'Agsu',0,0),(145,15,'Ali Bayramli',0,0),(146,15,'Astara',0,0),(147,15,'Baki',0,0),(148,15,'Balakan',0,0),(149,15,'Barda',0,0),(150,15,'Beylaqan',0,0),(151,15,'Bilasuvar',0,0),(152,15,'Cabrayil',0,0),(153,15,'Calilabad',0,0),(154,15,'Daskasan',0,0),(155,15,'Davaci',0,0),(156,15,'Fuzuli',0,0),(157,15,'Gadabay',0,0),(158,15,'Ganca',0,0),(159,15,'Goranboy',0,0),(160,15,'Goycay',0,0),(161,15,'Haciqabul',0,0),(162,15,'Imisli',0,0),(163,15,'Ismayilli',0,0),(164,15,'Kalbacar',0,0),(165,15,'Kurdamir',0,0),(166,15,'Lacin',0,0),(167,15,'Lankaran',0,0),(168,15,'Lankaran',0,0),(169,15,'Lerik',0,0),(170,15,'Masalli',0,0),(171,15,'Mingacevir',0,0),(172,15,'Naftalan',0,0),(173,15,'Naxcivan',0,0),(174,15,'Neftcala',0,0),(175,15,'Oguz',0,0),(176,15,'Qabala',0,0),(177,15,'Qax',0,0),(178,15,'Qazax',0,0),(179,15,'Qobustan',0,0),(180,15,'Quba',0,0),(181,15,'Qubadli',0,0),(182,15,'Qusar',0,0),(183,15,'Saatli',0,0),(184,15,'Sabirabad',0,0),(185,15,'Saki',0,0),(186,15,'Saki',0,0),(187,15,'Salyan',0,0),(188,15,'Samaxi',0,0),(189,15,'Samkir',0,0),(190,15,'Samux',0,0),(191,15,'Siyazan',0,0),(192,15,'Sumqayit',0,0),(193,15,'Susa',0,0),(194,15,'Susa',0,0),(195,15,'Tartar',0,0),(196,15,'Tovuz',0,0),(197,15,'Ucar',0,0),(198,15,'Xacmaz',0,0),(199,15,'Xankandi',0,0),(200,15,'Xanlar',0,0),(201,15,'Xizi',0,0),(202,15,'Xocali',0,0),(203,15,'Xocavand',0,0),(204,15,'Yardimli',0,0),(205,15,'Yevlax',0,0),(206,15,'Yevlax',0,0),(207,15,'Zangilan',0,0),(208,15,'Zaqatala',0,0),(209,15,'Zardab',0,0),(210,27,'Federation of Bosnia and Herzegovina',0,0),(211,27,'Brcko District',0,0),(212,27,'Republika Srpska',0,0),(213,19,'Christ Church',0,0),(214,19,'Saint Andrew',0,0),(215,19,'Saint George',0,0),(216,19,'Saint James',0,0),(217,19,'Saint John',0,0),(218,19,'Saint Joseph',0,0),(219,19,'Saint Lucy',0,0),(220,19,'Saint Michael',0,0),(221,19,'Saint Peter',0,0),(222,19,'Saint Philip',0,0),(223,19,'Saint Thomas',0,0),(224,18,'Dhaka',0,0),(225,18,'Khulna',0,0),(226,18,'Rajshahi',0,0),(227,18,'Chittagong',0,0),(228,18,'Barisal',0,0),(229,18,'Sylhet',0,0),(230,21,'Antwerpen',0,0),(231,21,'Hainaut',0,0),(232,21,'Liege',0,0),(233,21,'Limburg',0,0),(234,21,'Luxembourg',0,0),(235,21,'Namur',0,0),(236,21,'Oost-Vlaanderen',0,0),(237,21,'West-Vlaanderen',0,0),(238,21,'Brabant Wallon',0,0),(239,21,'Brussels Hoofdstedelijk Gewest',0,0),(240,21,'Vlaams-Brabant',0,0),(241,21,'Flanders',0,0),(242,21,'Wallonia',0,0),(243,34,'Bam',0,0),(244,34,'Boulkiemde',0,0),(245,34,'Ganzourgou',0,0),(246,34,'Gnagna',0,0),(247,34,'Kouritenga',0,0),(248,34,'Oudalan',0,0),(249,34,'Passore',0,0),(250,34,'Sanguie',0,0),(251,34,'Soum',0,0),(252,34,'Tapoa',0,0),(253,34,'Zoundweogo',0,0),(254,34,'Bale',0,0),(255,34,'Banwa',0,0),(256,34,'Bazega',0,0),(257,34,'Bougouriba',0,0),(258,34,'Boulgou',0,0),(259,34,'Gourma',0,0),(260,34,'Houet',0,0),(261,34,'Ioba',0,0),(262,34,'Kadiogo',0,0),(263,34,'Kenedougou',0,0),(264,34,'Komoe',0,0),(265,34,'Komondjari',0,0),(266,34,'Kompienga',0,0),(267,34,'Kossi',0,0),(268,34,'Koulpelogo',0,0),(269,34,'Kourweogo',0,0),(270,34,'Leraba',0,0),(271,34,'Loroum',0,0),(272,34,'Mouhoun',0,0),(273,34,'Namentenga',0,0),(274,34,'Naouri',0,0),(275,34,'Nayala',0,0),(276,34,'Noumbiel',0,0),(277,34,'Oubritenga',0,0),(278,34,'Poni',0,0),(279,34,'Sanmatenga',0,0),(280,34,'Seno',0,0),(281,34,'Sissili',0,0),(282,34,'Sourou',0,0),(283,34,'Tuy',0,0),(284,34,'Yagha',0,0),(285,34,'Yatenga',0,0),(286,34,'Ziro',0,0),(287,34,'Zondoma',0,0),(288,33,'Mikhaylovgrad',0,0),(289,33,'Blagoevgrad',0,0),(290,33,'Burgas',0,0),(291,33,'Dobrich',0,0),(292,33,'Gabrovo',0,0),(293,33,'Grad Sofiya',0,0),(294,33,'Khaskovo',0,0),(295,33,'Kurdzhali',0,0),(296,33,'Kyustendil',0,0),(297,33,'Lovech',0,0),(298,33,'Montana',0,0),(299,33,'Pazardzhik',0,0),(300,33,'Pernik',0,0),(301,33,'Pleven',0,0),(302,33,'Plovdiv',0,0),(303,33,'Razgrad',0,0),(304,33,'Ruse',0,0),(305,33,'Shumen',0,0),(306,33,'Silistra',0,0),(307,33,'Sliven',0,0),(308,33,'Smolyan',0,0),(309,33,'Sofiya',0,0),(310,33,'Stara Zagora',0,0),(311,33,'Turgovishte',0,0),(312,33,'Varna',0,0),(313,33,'Veliko Turnovo',0,0),(314,33,'Vidin',0,0),(315,33,'Vratsa',0,0),(316,33,'Yambol',0,0),(317,17,'Al Hadd',0,0),(318,17,'Al Manamah',0,0),(319,17,'Jidd Hafs',0,0),(320,17,'Sitrah',0,0),(321,17,'Al Mintaqah al Gharbiyah',0,0),(322,17,'Mintaqat Juzur Hawar',0,0),(323,17,'Al Mintaqah ash Shamaliyah',0,0),(324,17,'Al Mintaqah al Wusta',0,0),(325,17,'Madinat',0,0),(326,17,'Ar Rifa',0,0),(327,17,'Madinat Hamad',0,0),(328,17,'Al Muharraq',0,0),(329,17,'Al Asimah',0,0),(330,17,'Al Janubiyah',0,0),(331,17,'Ash Shamaliyah',0,0),(332,17,'Al Wusta',0,0),(333,35,'Bujumbura',0,0),(334,35,'Bubanza',0,0),(335,35,'Bururi',0,0),(336,35,'Cankuzo',0,0),(337,35,'Cibitoke',0,0),(338,35,'Gitega',0,0),(339,35,'Karuzi',0,0),(340,35,'Kayanza',0,0),(341,35,'Kirundo',0,0),(342,35,'Makamba',0,0),(343,35,'Muyinga',0,0),(344,35,'Ngozi',0,0),(345,35,'Rutana',0,0),(346,35,'Ruyigi',0,0),(347,35,'Muramvya',0,0),(348,35,'Mwaro',0,0),(349,23,'Alibori',0,0),(350,23,'Atakora',0,0),(351,23,'Atlanyique',0,0),(352,23,'Borgou',0,0),(353,23,'Collines',0,0),(354,23,'Kouffo',0,0),(355,23,'Donga',0,0),(356,23,'Littoral',0,0),(357,23,'Mono',0,0),(358,23,'Oueme',0,0),(359,23,'Plateau',0,0),(360,23,'Zou',0,0),(361,24,'Devonshire',0,0),(362,24,'Hamilton',0,0),(363,24,'Hamilton',0,0),(364,24,'Paget',0,0),(365,24,'Pembroke',0,0),(366,24,'Saint George',0,0),(367,24,'Saint George\'s',0,0),(368,24,'Sandys',0,0),(369,24,'Smiths',0,0),(370,24,'Southampton',0,0),(371,24,'Warwick',0,0),(372,32,'Alibori',0,0),(373,32,'Belait',0,0),(374,32,'Brunei and Muara',0,0),(375,32,'Temburong',0,0),(376,32,'Collines',0,0),(377,32,'Kouffo',0,0),(378,32,'Donga',0,0),(379,32,'Littoral',0,0),(380,32,'Tutong',0,0),(381,32,'Oueme',0,0),(382,32,'Plateau',0,0),(383,32,'Zou',0,0),(384,26,'Chuquisaca',0,0),(385,26,'Cochabamba',0,0),(386,26,'El Beni',0,0),(387,26,'La Paz',0,0),(388,26,'Oruro',0,0),(389,26,'Pando',0,0),(390,26,'Potosi',0,0),(391,26,'Santa Cruz',0,0),(392,26,'Tarija',0,0),(393,30,'Acre',0,0),(394,30,'Alagoas',0,0),(395,30,'Amapa',0,0),(396,30,'Amazonas',0,0),(397,30,'Bahia',0,0),(398,30,'Ceara',0,0),(399,30,'Distrito Federal',0,0),(400,30,'Espirito Santo',0,0),(401,30,'Mato Grosso do Sul',0,0),(402,30,'Maranhao',0,0),(403,30,'Mato Grosso',0,0),(404,30,'Minas Gerais',0,0),(405,30,'Para',0,0),(406,30,'Paraiba',0,0),(407,30,'Parana',0,0),(408,30,'Piaui',0,0),(409,30,'Rio de Janeiro',0,0),(410,30,'Rio Grande do Norte',0,0),(411,30,'Rio Grande do Sul',0,0),(412,30,'Rondonia',0,0),(413,30,'Roraima',0,0),(414,30,'Santa Catarina',0,0),(415,30,'Sao Paulo',0,0),(416,30,'Sergipe',0,0),(417,30,'Goias',0,0),(418,30,'Pernambuco',0,0),(419,30,'Tocantins',0,0),(420,16,'Bimini',0,0),(421,16,'Cat Island',0,0),(422,16,'Exuma',0,0),(423,16,'Inagua',0,0),(424,16,'Long Island',0,0),(425,16,'Mayaguana',0,0),(426,16,'Ragged Island',0,0),(427,16,'Harbour Island',0,0),(428,16,'New Providence',0,0),(429,16,'Acklins and Crooked Islands',0,0),(430,16,'Freeport',0,0),(431,16,'Fresh Creek',0,0),(432,16,'Governor\'s Harbour',0,0),(433,16,'Green Turtle Cay',0,0),(434,16,'High Rock',0,0),(435,16,'Kemps Bay',0,0),(436,16,'Marsh Harbour',0,0),(437,16,'Nichollstown and Berry Islands',0,0),(438,16,'Rock Sound',0,0),(439,16,'Sandy Point',0,0),(440,16,'San Salvador and Rum Cay',0,0),(441,25,'Bumthang',0,0),(442,25,'Chhukha',0,0),(443,25,'Chirang',0,0),(444,25,'Daga',0,0),(445,25,'Geylegphug',0,0),(446,25,'Ha',0,0),(447,25,'Lhuntshi',0,0),(448,25,'Mongar',0,0),(449,25,'Paro',0,0),(450,25,'Pemagatsel',0,0),(451,25,'Punakha',0,0),(452,25,'Samchi',0,0),(453,25,'Samdrup',0,0),(454,25,'Shemgang',0,0),(455,25,'Tashigang',0,0),(456,25,'Thimphu',0,0),(457,25,'Tongsa',0,0),(458,25,'Wangdi Phodrang',0,0),(459,28,'Central',0,0),(460,28,'Ghanzi',0,0),(461,28,'Kgalagadi',0,0),(462,28,'Kgatleng',0,0),(463,28,'Kweneng',0,0),(464,28,'North-East',0,0),(465,28,'South-East',0,0),(466,28,'Southern',0,0),(467,28,'North-West',0,0),(468,20,'Brestskaya Voblasts\'',0,0),(469,20,'Homyel\'skaya Voblasts\'',0,0),(470,20,'Hrodzyenskaya Voblasts\'',0,0),(471,20,'Minsk',0,0),(472,20,'Minskaya Voblasts\'',0,0),(473,20,'Mahilyowskaya Voblasts\'',0,0),(474,20,'Vitsyebskaya Voblasts\'',0,0),(475,22,'Belize',0,0),(476,22,'Cayo',0,0),(477,22,'Corozal',0,0),(478,22,'Orange Walk',0,0),(479,22,'Stann Creek',0,0),(480,22,'Toledo',0,0),(481,38,'Alberta',0,0),(482,38,'British Columbia',0,0),(483,38,'Manitoba',0,0),(484,38,'New Brunswick',0,0),(485,38,'Newfoundland',0,0),(486,38,'Nova Scotia',0,0),(487,38,'Northwest Territories',0,0),(488,38,'Nunavut',0,0),(489,38,'Ontario',0,0),(490,38,'Prince Edward Island',0,0),(491,38,'Quebec',0,0),(492,38,'Saskatchewan',0,0),(493,38,'Yukon Territory',0,0),(504,41,'Bamingui-Bangoran',0,0),(505,41,'Basse-Kotto',0,0),(506,41,'Haute-Kotto',0,0),(507,41,'Mambere-Kadei',0,0),(508,41,'Haut-Mbomou',0,0),(509,41,'Kemo',0,0),(510,41,'Lobaye',0,0),(511,41,'Mbomou',0,0),(512,41,'Nana-Mambere',0,0),(513,41,'Ouaka',0,0),(514,41,'Ouham',0,0),(515,41,'Ouham-Pende',0,0),(516,41,'Cuvette-Ouest',0,0),(517,41,'Nana-Grebizi',0,0),(518,41,'Sangha-Mbaere',0,0),(519,41,'Ombella-Mpoko',0,0),(520,41,'Bangui',0,0),(521,49,'Bouenza',0,0),(522,49,'Kouilou',0,0),(523,49,'Lekoumou',0,0),(524,49,'Likouala',0,0),(525,49,'Niari',0,0),(526,49,'Plateaux',0,0),(527,49,'Sangha',0,0),(528,49,'Pool',0,0),(529,49,'Brazzaville',0,0),(530,49,'Cuvette',0,0),(531,49,'Cuvette-Ouest',0,0),(532,204,'Aargau',0,0),(533,204,'Ausser-Rhoden',0,0),(534,204,'Basel-Landschaft',0,0),(535,204,'Basel-Stadt',0,0),(536,204,'Bern',0,0),(537,204,'Fribourg',0,0),(538,204,'Geneve',0,0),(539,204,'Glarus',0,0),(540,204,'Graubunden',0,0),(541,204,'Inner-Rhoden',0,0),(542,204,'Luzern',0,0),(543,204,'Neuchatel',0,0),(544,204,'Nidwalden',0,0),(545,204,'Obwalden',0,0),(546,204,'Sankt Gallen',0,0),(547,204,'Schaffhausen',0,0),(548,204,'Schwyz',0,0),(549,204,'Solothurn',0,0),(550,204,'Thurgau',0,0),(551,204,'Ticino',0,0),(552,204,'Uri',0,0),(553,204,'Valais',0,0),(554,204,'Vaud',0,0),(555,204,'Zug',0,0),(556,204,'Zurich',0,0),(557,204,'Jura',0,0),(558,52,'Agneby',0,0),(559,52,'Bafing',0,0),(560,52,'Bas-Sassandra',0,0),(561,52,'Denguele',0,0),(562,52,'Dix-Huit Montagnes',0,0),(563,52,'Fromager',0,0),(564,52,'Haut-Sassandra',0,0),(565,52,'Lacs',0,0),(566,52,'Lagunes',0,0),(567,52,'Marahoue',0,0),(568,52,'Moyen-Cavally',0,0),(569,52,'Moyen-Comoe',0,0),(570,52,'N\'zi-Comoe',0,0),(571,52,'Savanes',0,0),(572,52,'Sud-Bandama',0,0),(573,52,'Sud-Comoe',0,0),(574,52,'Vallee du Bandama',0,0),(575,52,'Worodougou',0,0),(576,52,'Zanzan',0,0),(577,43,'Valparaiso',0,0),(578,43,'Aisen del General Carlos Ibanez del Campo',0,0),(579,43,'Antofagasta',0,0),(580,43,'Araucania',0,0),(581,43,'Atacama',0,0),(582,43,'Bio-Bio',0,0),(583,43,'Coquimbo',0,0),(584,43,'Libertador General Bernardo O\'Higgins',0,0),(585,43,'Los Lagos',0,0),(586,43,'Magallanes y de la Antartica Chilena',0,0),(587,43,'Maule',0,0),(588,43,'Region Metropolitana',0,0),(589,43,'Tarapaca',0,0),(590,43,'Los Lagos',0,0),(591,43,'Tarapaca',0,0),(592,43,'Arica y Parinacota',0,0),(593,43,'Los Rios',0,0),(594,37,'Est',0,0),(595,37,'Littoral',0,0),(596,37,'Nord-Ouest',0,0),(597,37,'Ouest',0,0),(598,37,'Sud-Ouest',0,0),(599,37,'Adamaoua',0,0),(600,37,'Centre',0,0),(601,37,'Extreme-Nord',0,0),(602,37,'Nord',0,0),(603,37,'Sud',0,0),(604,44,'Anhui',0,0),(605,44,'Zhejiang',0,0),(606,44,'Jiangxi',0,0),(607,44,'Jiangsu',0,0),(608,44,'Jilin',0,0),(609,44,'Qinghai',0,0),(610,44,'Fujian',0,0),(611,44,'Heilongjiang',0,0),(612,44,'Henan',0,0),(613,44,'Hebei',0,0),(614,44,'Hunan',0,0),(615,44,'Hubei',0,0),(616,44,'Xinjiang',0,0),(617,44,'Xizang',0,0),(618,44,'Gansu',0,0),(619,44,'Guangxi',0,0),(620,44,'Guizhou',0,0),(621,44,'Liaoning',0,0),(622,44,'Nei Mongol',0,0),(623,44,'Ningxia',0,0),(624,44,'Beijing',0,0),(625,44,'Shanghai',0,0),(626,44,'Shanxi',0,0),(627,44,'Shandong',0,0),(628,44,'Shaanxi',0,0),(629,44,'Tianjin',0,0),(630,44,'Yunnan',0,0),(631,44,'Guangdong',0,0),(632,44,'Hainan',0,0),(633,44,'Sichuan',0,0),(634,44,'Chongqing',0,0),(635,47,'Amazonas',0,0),(636,47,'Antioquia',0,0),(637,47,'Arauca',0,0),(638,47,'Atlantico',0,0),(639,47,'Caqueta',0,0),(640,47,'Cauca',0,0),(641,47,'Cesar',0,0),(642,47,'Choco',0,0),(643,47,'Cordoba',0,0),(644,47,'Guaviare',0,0),(645,47,'Guainia',0,0),(646,47,'Huila',0,0),(647,47,'La Guajira',0,0),(648,47,'Meta',0,0),(649,47,'Narino',0,0),(650,47,'Norte de Santander',0,0),(651,47,'Putumayo',0,0),(652,47,'Quindio',0,0),(653,47,'Risaralda',0,0),(654,47,'San Andres y Providencia',0,0),(655,47,'Santander',0,0),(656,47,'Sucre',0,0),(657,47,'Tolima',0,0),(658,47,'Valle del Cauca',0,0),(659,47,'Vaupes',0,0),(660,47,'Vichada',0,0),(661,47,'Casanare',0,0),(662,47,'Cundinamarca',0,0),(663,47,'Distrito Especial',0,0),(664,47,'Bolivar',0,0),(665,47,'Boyaca',0,0),(666,47,'Caldas',0,0),(667,47,'Magdalena',0,0),(668,51,'Alajuela',0,0),(669,51,'Cartago',0,0),(670,51,'Guanacaste',0,0),(671,51,'Heredia',0,0),(672,51,'Limon',0,0),(673,51,'Puntarenas',0,0),(674,51,'San Jose',0,0),(675,54,'Pinar del Rio',0,0),(676,54,'Ciudad de la Habana',0,0),(677,54,'Matanzas',0,0),(678,54,'Isla de la Juventud',0,0),(679,54,'Camaguey',0,0),(680,54,'Ciego de Avila',0,0),(681,54,'Cienfuegos',0,0),(682,54,'Granma',0,0),(683,54,'Guantanamo',0,0),(684,54,'La Habana',0,0),(685,54,'Holguin',0,0),(686,54,'Las Tunas',0,0),(687,54,'Sancti Spiritus',0,0),(688,54,'Santiago de Cuba',0,0),(689,54,'Villa Clara',0,0),(690,39,'Boa Vista',0,0),(691,39,'Brava',0,0),(692,39,'Maio',0,0),(693,39,'Paul',0,0),(694,39,'Ribeira Grande',0,0),(695,39,'Sal',0,0),(696,39,'Sao Nicolau',0,0),(697,39,'Sao Vicente',0,0),(698,39,'Mosteiros',0,0),(699,39,'Praia',0,0),(700,39,'Santa Catarina',0,0),(701,39,'Santa Cruz',0,0),(702,39,'Sao Domingos',0,0),(703,39,'Sao Filipe',0,0),(704,39,'Sao Miguel',0,0),(705,39,'Tarrafal',0,0),(706,55,'Famagusta',0,0),(707,55,'Kyrenia',0,0),(708,55,'Larnaca',0,0),(709,55,'Nicosia',0,0),(710,55,'Limassol',0,0),(711,55,'Paphos',0,0),(712,56,'Hlavni mesto Praha',0,0),(713,56,'Jihomoravsky kraj',0,0),(714,56,'Jihocesky kraj',0,0),(715,56,'Vysocina',0,0),(716,56,'Karlovarsky kraj',0,0),(717,56,'Kralovehradecky kraj',0,0),(718,56,'Liberecky kraj',0,0),(719,56,'Olomoucky kraj',0,0),(720,56,'Moravskoslezsky kraj',0,0),(721,56,'Pardubicky kraj',0,0),(722,56,'Plzensky kraj',0,0),(723,56,'Stredocesky kraj',0,0),(724,56,'Ustecky kraj',0,0),(725,56,'Zlinsky kraj',0,0),(726,81,'Baden-Wurttemberg',0,0),(727,81,'Bayern',0,0),(728,81,'Bremen',0,0),(729,81,'Hamburg',0,0),(730,81,'Hessen',0,0),(731,81,'Niedersachsen',0,0),(732,81,'Nordrhein-Westfalen',0,0),(733,81,'Rheinland-Pfalz',0,0),(734,81,'Saarland',0,0),(735,81,'Schleswig-Holstein',0,0),(736,81,'Brandenburg',0,0),(737,81,'Mecklenburg-Vorpommern',0,0),(738,81,'Sachsen',0,0),(739,81,'Sachsen-Anhalt',0,0),(740,81,'Thuringen',0,0),(741,81,'Berlin',0,0),(742,58,'Ali Sabieh',0,0),(743,58,'Obock',0,0),(744,58,'Tadjoura',0,0),(745,58,'Dikhil',0,0),(746,58,'Djibouti',0,0),(747,58,'Arta',0,0),(748,57,'Hovedstaden',0,0),(749,57,'Midtjylland',0,0),(750,57,'Nordjylland',0,0),(751,57,'Sjelland',0,0),(752,57,'Syddanmark',0,0),(753,59,'Saint Andrew',0,0),(754,59,'Saint David',0,0),(755,59,'Saint George',0,0),(756,59,'Saint John',0,0),(757,59,'Saint Joseph',0,0),(758,59,'Saint Luke',0,0),(759,59,'Saint Mark',0,0),(760,59,'Saint Patrick',0,0),(761,59,'Saint Paul',0,0),(762,59,'Saint Peter',0,0),(763,60,'Azua',0,0),(764,60,'Baoruco',0,0),(765,60,'Barahona',0,0),(766,60,'Dajabon',0,0),(767,60,'Distrito Nacional',0,0),(768,60,'Duarte',0,0),(769,60,'Espaillat',0,0),(770,60,'Independencia',0,0),(771,60,'La Altagracia',0,0),(772,60,'Elias Pina',0,0),(773,60,'La Romana',0,0),(774,60,'Maria Trinidad Sanchez',0,0),(775,60,'Monte Cristi',0,0),(776,60,'Pedernales',0,0),(777,60,'Peravia',0,0),(778,60,'Puerto Plata',0,0),(779,60,'Salcedo',0,0),(780,60,'Samana',0,0),(781,60,'Sanchez Ramirez',0,0),(782,60,'San Juan',0,0),(783,60,'San Pedro De Macoris',0,0),(784,60,'Santiago',0,0),(785,60,'Santiago Rodriguez',0,0),(786,60,'Valverde',0,0),(787,60,'El Seibo',0,0),(788,60,'Hato Mayor',0,0),(789,60,'La Vega',0,0),(790,60,'Monsenor Nouel',0,0),(791,60,'Monte Plata',0,0),(792,60,'San Cristobal',0,0),(793,60,'Distrito Nacional',0,0),(794,60,'Peravia',0,0),(795,60,'San Jose de Ocoa',0,0),(796,60,'Santo Domingo',0,0),(797,3,'Alger',0,0),(798,3,'Batna',0,0),(799,3,'Constantine',0,0),(800,3,'Medea',0,0),(801,3,'Mostaganem',0,0),(802,3,'Oran',0,0),(803,3,'Saida',0,0),(804,3,'Setif',0,0),(805,3,'Tiaret',0,0),(806,3,'Tizi Ouzou',0,0),(807,3,'Tlemcen',0,0),(808,3,'Bejaia',0,0),(809,3,'Biskra',0,0),(810,3,'Blida',0,0),(811,3,'Bouira',0,0),(812,3,'Djelfa',0,0),(813,3,'Guelma',0,0),(814,3,'Jijel',0,0),(815,3,'Laghouat',0,0),(816,3,'Mascara',0,0),(817,3,'M\'sila',0,0),(818,3,'Oum el Bouaghi',0,0),(819,3,'Sidi Bel Abbes',0,0),(820,3,'Skikda',0,0),(821,3,'Tebessa',0,0),(822,3,'Adrar',0,0),(823,3,'Ain Defla',0,0),(824,3,'Ain Temouchent',0,0),(825,3,'Annaba',0,0),(826,3,'Bechar',0,0),(827,3,'Bordj Bou Arreridj',0,0),(828,3,'Boumerdes',0,0),(829,3,'Chlef',0,0),(830,3,'El Bayadh',0,0),(831,3,'El Oued',0,0),(832,3,'El Tarf',0,0),(833,3,'Ghardaia',0,0),(834,3,'Illizi',0,0),(835,3,'Khenchela',0,0),(836,3,'Mila',0,0),(837,3,'Naama',0,0),(838,3,'Ouargla',0,0),(839,3,'Relizane',0,0),(840,3,'Souk Ahras',0,0),(841,3,'Tamanghasset',0,0),(842,3,'Tindouf',0,0),(843,3,'Tipaza',0,0),(844,3,'Tissemsilt',0,0),(845,62,'Galapagos',0,0),(846,62,'Azuay',0,0),(847,62,'Bolivar',0,0),(848,62,'Canar',0,0),(849,62,'Carchi',0,0),(850,62,'Chimborazo',0,0),(851,62,'Cotopaxi',0,0),(852,62,'El Oro',0,0),(853,62,'Esmeraldas',0,0),(854,62,'Guayas',0,0),(855,62,'Imbabura',0,0),(856,62,'Loja',0,0),(857,62,'Los Rios',0,0),(858,62,'Manabi',0,0),(859,62,'Morona-Santiago',0,0),(860,62,'Pastaza',0,0),(861,62,'Pichincha',0,0),(862,62,'Tungurahua',0,0),(863,62,'Zamora-Chinchipe',0,0),(864,62,'Sucumbios',0,0),(865,62,'Napo',0,0),(866,62,'Orellana',0,0),(867,67,'Harjumaa',0,0),(868,67,'Hiiumaa',0,0),(869,67,'Ida-Virumaa',0,0),(870,67,'Jarvamaa',0,0),(871,67,'Jogevamaa',0,0),(872,67,'Kohtla-Jarve',0,0),(873,67,'Laanemaa',0,0),(874,67,'Laane-Virumaa',0,0),(875,67,'Narva',0,0),(876,67,'Parnu',0,0),(877,67,'Parnumaa',0,0),(878,67,'Polvamaa',0,0),(879,67,'Raplamaa',0,0),(880,67,'Saaremaa',0,0),(881,67,'Sillamae',0,0),(882,67,'Tallinn',0,0),(883,67,'Tartu',0,0),(884,67,'Tartumaa',0,0),(885,67,'Valgamaa',0,0),(886,67,'Viljandimaa',0,0),(887,67,'Vorumaa',0,0),(888,63,'Ad Daqahliyah',0,0),(889,63,'Al Bahr al Ahmar',0,0),(890,63,'Al Buhayrah',0,0),(891,63,'Al Fayyum',0,0),(892,63,'Al Gharbiyah',0,0),(893,63,'Al Iskandariyah',0,0),(894,63,'Al Isma\'iliyah',0,0),(895,63,'Al Jizah',0,0),(896,63,'Al Minufiyah',0,0),(897,63,'Al Minya',0,0),(898,63,'Al Qahirah',0,0),(899,63,'Al Qalyubiyah',0,0),(900,63,'Al Wadi al Jadid',0,0),(901,63,'Ash Sharqiyah',0,0),(902,63,'As Suways',0,0),(903,63,'Aswan',0,0),(904,63,'Asyut',0,0),(905,63,'Bani Suwayf',0,0),(906,63,'Bur Sa\'id',0,0),(907,63,'Dumyat',0,0),(908,63,'Kafr ash Shaykh',0,0),(909,63,'Matruh',0,0),(910,63,'Qina',0,0),(911,63,'Suhaj',0,0),(912,63,'Janub Sina\'',0,0),(913,63,'Shamal Sina\'',0,0),(914,66,'Anseba',0,0),(915,66,'Debub',0,0),(916,66,'Debubawi K\'eyih Bahri',0,0),(917,66,'Gash Barka',0,0),(918,66,'Ma\'akel',0,0),(919,66,'Semenawi K\'eyih Bahri',0,0),(920,195,'Islas Baleares',0,0),(921,195,'La Rioja',0,0),(922,195,'Madrid',0,0),(923,195,'Murcia',0,0),(924,195,'Navarra',0,0),(925,195,'Asturias',0,0),(926,195,'Cantabria',0,0),(927,195,'Andalucia',0,0),(928,195,'Aragon',0,0),(929,195,'Canarias',0,0),(930,195,'Castilla-La Mancha',0,0),(931,195,'Castilla y Leon',0,0),(932,195,'Catalonia',0,0),(933,195,'Extremadura',0,0),(934,195,'Galicia',0,0),(935,195,'Pais Vasco',0,0),(936,195,'Comunidad Valenciana',0,0),(937,68,'Adis Abeba',0,0),(938,68,'Afar',0,0),(939,68,'Amara',0,0),(940,68,'Binshangul Gumuz',0,0),(941,68,'Dire Dawa',0,0),(942,68,'Gambela Hizboch',0,0),(943,68,'Hareri Hizb',0,0),(944,68,'Oromiya',0,0),(945,68,'Sumale',0,0),(946,68,'Tigray',0,0),(947,68,'YeDebub Biheroch Bihereseboch na Hizboch',0,0),(948,72,'Aland',0,0),(949,72,'Lapland',0,0),(950,72,'Oulu',0,0),(951,72,'Southern Finland',0,0),(952,72,'Eastern Finland',0,0),(953,72,'Western Finland',0,0),(954,71,'Central',0,0),(955,71,'Eastern',0,0),(956,71,'Northern',0,0),(957,71,'Rotuma',0,0),(958,71,'Western',0,0),(959,139,'Kosrae',0,0),(960,139,'Pohnpei',0,0),(961,139,'Chuuk',0,0),(962,139,'Yap',0,0),(963,73,'Aquitaine',0,0),(964,73,'Auvergne',0,0),(965,73,'Basse-Normandie',0,0),(966,73,'Bourgogne',0,0),(967,73,'Bretagne',0,0),(968,73,'Centre',0,0),(969,73,'Champagne-Ardenne',0,0),(970,73,'Corse',0,0),(971,73,'Franche-Comte',0,0),(972,73,'Haute-Normandie',0,0),(973,73,'Ile-de-France',0,0),(974,73,'Languedoc-Roussillon',0,0),(975,73,'Limousin',0,0),(976,73,'Lorraine',0,0),(977,73,'Midi-Pyrenees',0,0),(978,73,'Nord-Pas-de-Calais',0,0),(979,73,'Pays de la Loire',0,0),(980,73,'Picardie',0,0),(981,73,'Poitou-Charentes',0,0),(982,73,'Provence-Alpes-Cote d\'Azur',0,0),(983,73,'Rhone-Alpes',0,0),(984,73,'Alsace',0,0),(985,78,'Estuaire',0,0),(986,78,'Haut-Ogooue',0,0),(987,78,'Moyen-Ogooue',0,0),(988,78,'Ngounie',0,0),(989,78,'Nyanga',0,0),(990,78,'Ogooue-Ivindo',0,0),(991,78,'Ogooue-Lolo',0,0),(992,78,'Ogooue-Maritime',0,0),(993,78,'Woleu-Ntem',0,0),(994,222,'Barking and Dagenham',0,0),(995,222,'Barnet',0,0),(996,222,'Barnsley',0,0),(997,222,'Bath and North East Somerset',0,0),(998,222,'Bedfordshire',0,0),(999,222,'Bexley',0,0),(1000,222,'Birmingham',0,0),(1001,222,'Blackburn with Darwen',0,0),(1002,222,'Blackpool',0,0),(1003,222,'Bolton',0,0),(1004,222,'Bournemouth',0,0),(1005,222,'Bracknell Forest',0,0),(1006,222,'Bradford',0,0),(1007,222,'Brent',0,0),(1008,222,'Brighton and Hove',0,0),(1009,222,'Bristol, City of',0,0),(1010,222,'Bromley',0,0),(1011,222,'Buckinghamshire',0,0),(1012,222,'Bury',0,0),(1013,222,'Calderdale',0,0),(1014,222,'Cambridgeshire',0,0),(1015,222,'Camden',0,0),(1016,222,'Cheshire',0,0),(1017,222,'Cornwall',0,0),(1018,222,'Coventry',0,0),(1019,222,'Croydon',0,0),(1020,222,'Cumbria',0,0),(1021,222,'Darlington',0,0),(1022,222,'Derby',0,0),(1023,222,'Derbyshire',0,0),(1024,222,'Devon',0,0),(1025,222,'Doncaster',0,0),(1026,222,'Dorset',0,0),(1027,222,'Dudley',0,0),(1028,222,'Durham',0,0),(1029,222,'Ealing',0,0),(1030,222,'East Riding of Yorkshire',0,0),(1031,222,'East Sussex',0,0),(1032,222,'Enfield',0,0),(1033,222,'Essex',0,0),(1034,222,'Gateshead',0,0),(1035,222,'Gloucestershire',0,0),(1036,222,'Greenwich',0,0),(1037,222,'Hackney',0,0),(1038,222,'Halton',0,0),(1039,222,'Hammersmith and Fulham',0,0),(1040,222,'Hampshire',0,0),(1041,222,'Haringey',0,0),(1042,222,'Harrow',0,0),(1043,222,'Hartlepool',0,0),(1044,222,'Havering',0,0),(1045,222,'Herefordshire',0,0),(1046,222,'Hertford',0,0),(1047,222,'Hillingdon',0,0),(1048,222,'Hounslow',0,0),(1049,222,'Isle of Wight',0,0),(1050,222,'Islington',0,0),(1051,222,'Kensington and Chelsea',0,0),(1052,222,'Kent',0,0),(1053,222,'Kingston upon Hull, City of',0,0),(1054,222,'Kingston upon Thames',0,0),(1055,222,'Kirklees',0,0),(1056,222,'Knowsley',0,0),(1057,222,'Lambeth',0,0),(1058,222,'Lancashire',0,0),(1059,222,'Leeds',0,0),(1060,222,'Leicester',0,0),(1061,222,'Leicestershire',0,0),(1062,222,'Lewisham',0,0),(1063,222,'Lincolnshire',0,0),(1064,222,'Liverpool',0,0),(1065,222,'London, City of',0,0),(1066,222,'Luton',0,0),(1067,222,'Manchester',0,0),(1068,222,'Medway',0,0),(1069,222,'Merton',0,0),(1070,222,'Middlesbrough',0,0),(1071,222,'Milton Keynes',0,0),(1072,222,'Newcastle upon Tyne',0,0),(1073,222,'Newham',0,0),(1074,222,'Norfolk',0,0),(1075,222,'Northamptonshire',0,0),(1076,222,'North East Lincolnshire',0,0),(1077,222,'North Lincolnshire',0,0),(1078,222,'North Somerset',0,0),(1079,222,'North Tyneside',0,0),(1080,222,'Northumberland',0,0),(1081,222,'North Yorkshire',0,0),(1082,222,'Nottingham',0,0),(1083,222,'Nottinghamshire',0,0),(1084,222,'Oldham',0,0),(1085,222,'Oxfordshire',0,0),(1086,222,'Peterborough',0,0),(1087,222,'Plymouth',0,0),(1088,222,'Poole',0,0),(1089,222,'Portsmouth',0,0),(1090,222,'Reading',0,0),(1091,222,'Redbridge',0,0),(1092,222,'Redcar and Cleveland',0,0),(1093,222,'Richmond upon Thames',0,0),(1094,222,'Rochdale',0,0),(1095,222,'Rotherham',0,0),(1096,222,'Rutland',0,0),(1097,222,'Salford',0,0),(1098,222,'Shropshire',0,0),(1099,222,'Sandwell',0,0),(1100,222,'Sefton',0,0),(1101,222,'Sheffield',0,0),(1102,222,'Slough',0,0),(1103,222,'Solihull',0,0),(1104,222,'Somerset',0,0),(1105,222,'Southampton',0,0),(1106,222,'Southend-on-Sea',0,0),(1107,222,'South Gloucestershire',0,0),(1108,222,'South Tyneside',0,0),(1109,222,'Southwark',0,0),(1110,222,'Staffordshire',0,0),(1111,222,'St. Helens',0,0),(1112,222,'Stockport',0,0),(1113,222,'Stockton-on-Tees',0,0),(1114,222,'Stoke-on-Trent',0,0),(1115,222,'Suffolk',0,0),(1116,222,'Sunderland',0,0),(1117,222,'Surrey',0,0),(1118,222,'Sutton',0,0),(1119,222,'Swindon',0,0),(1120,222,'Tameside',0,0),(1121,222,'Telford and Wrekin',0,0),(1122,222,'Thurrock',0,0),(1123,222,'Torbay',0,0),(1124,222,'Tower Hamlets',0,0),(1125,222,'Trafford',0,0),(1126,222,'Wakefield',0,0),(1127,222,'Walsall',0,0),(1128,222,'Waltham Forest',0,0),(1129,222,'Wandsworth',0,0),(1130,222,'Warrington',0,0),(1131,222,'Warwickshire',0,0),(1132,222,'West Berkshire',0,0),(1133,222,'Westminster',0,0),(1134,222,'West Sussex',0,0),(1135,222,'Wigan',0,0),(1136,222,'Wiltshire',0,0),(1137,222,'Windsor and Maidenhead',0,0),(1138,222,'Wirral',0,0),(1139,222,'Wokingham',0,0),(1140,222,'Wolverhampton',0,0),(1141,222,'Worcestershire',0,0),(1142,222,'York',0,0),(1143,222,'Antrim',0,0),(1144,222,'Ards',0,0),(1145,222,'Armagh',0,0),(1146,222,'Ballymena',0,0),(1147,222,'Ballymoney',0,0),(1148,222,'Banbridge',0,0),(1149,222,'Belfast',0,0),(1150,222,'Carrickfergus',0,0),(1151,222,'Castlereagh',0,0),(1152,222,'Coleraine',0,0),(1153,222,'Cookstown',0,0),(1154,222,'Craigavon',0,0),(1155,222,'Down',0,0),(1156,222,'Dungannon',0,0),(1157,222,'Fermanagh',0,0),(1158,222,'Larne',0,0),(1159,222,'Limavady',0,0),(1160,222,'Lisburn',0,0),(1161,222,'Derry',0,0),(1162,222,'Magherafelt',0,0),(1163,222,'Moyle',0,0),(1164,222,'Newry and Mourne',0,0),(1165,222,'Newtownabbey',0,0),(1166,222,'North Down',0,0),(1167,222,'Omagh',0,0),(1168,222,'Strabane',0,0),(1169,222,'Aberdeen City',0,0),(1170,222,'Aberdeenshire',0,0),(1171,222,'Angus',0,0),(1172,222,'Argyll and Bute',0,0),(1173,222,'Scottish Borders, The',0,0),(1174,222,'Clackmannanshire',0,0),(1175,222,'Dumfries and Galloway',0,0),(1176,222,'Dundee City',0,0),(1177,222,'East Ayrshire',0,0),(1178,222,'East Dunbartonshire',0,0),(1179,222,'East Lothian',0,0),(1180,222,'East Renfrewshire',0,0),(1181,222,'Edinburgh, City of',0,0),(1182,222,'Falkirk',0,0),(1183,222,'Fife',0,0),(1184,222,'Glasgow City',0,0),(1185,222,'Highland',0,0),(1186,222,'Inverclyde',0,0),(1187,222,'Midlothian',0,0),(1188,222,'Moray',0,0),(1189,222,'North Ayrshire',0,0),(1190,222,'North Lanarkshire',0,0),(1191,222,'Orkney',0,0),(1192,222,'Perth and Kinross',0,0),(1193,222,'Renfrewshire',0,0),(1194,222,'Shetland Islands',0,0),(1195,222,'South Ayrshire',0,0),(1196,222,'South Lanarkshire',0,0),(1197,222,'Stirling',0,0),(1198,222,'West Dunbartonshire',0,0),(1199,222,'Eilean Siar',0,0),(1200,222,'West Lothian',0,0),(1201,222,'Isle of Anglesey',0,0),(1202,222,'Blaenau Gwent',0,0),(1203,222,'Bridgend',0,0),(1204,222,'Caerphilly',0,0),(1205,222,'Cardiff',0,0),(1206,222,'Ceredigion',0,0),(1207,222,'Carmarthenshire',0,0),(1208,222,'Conwy',0,0),(1209,222,'Denbighshire',0,0),(1210,222,'Flintshire',0,0),(1211,222,'Gwynedd',0,0),(1212,222,'Merthyr Tydfil',0,0),(1213,222,'Monmouthshire',0,0),(1214,222,'Neath Port Talbot',0,0),(1215,222,'Newport',0,0),(1216,222,'Pembrokeshire',0,0),(1217,222,'Powys',0,0),(1218,222,'Rhondda Cynon Taff',0,0),(1219,222,'Swansea',0,0),(1220,222,'Torfaen',0,0),(1221,222,'Vale of Glamorgan, The',0,0),(1222,222,'Wrexham',0,0),(1223,222,'Bedfordshire',0,0),(1224,222,'Central Bedfordshire',0,0),(1225,222,'Cheshire East',0,0),(1226,222,'Cheshire West and Chester',0,0),(1227,222,'Isles of Scilly',0,0),(1228,86,'Saint Andrew',0,0),(1229,86,'Saint David',0,0),(1230,86,'Saint George',0,0),(1231,86,'Saint John',0,0),(1232,86,'Saint Mark',0,0),(1233,86,'Saint Patrick',0,0),(1234,80,'Abashis Raioni',0,0),(1235,80,'Abkhazia',0,0),(1236,80,'Adigenis Raioni',0,0),(1237,80,'Ajaria',0,0),(1238,80,'Akhalgoris Raioni',0,0),(1239,80,'Akhalk\'alak\'is Raioni',0,0),(1240,80,'Akhalts\'ikhis Raioni',0,0),(1241,80,'Akhmetis Raioni',0,0),(1242,80,'Ambrolauris Raioni',0,0),(1243,80,'Aspindzis Raioni',0,0),(1244,80,'Baghdat\'is Raioni',0,0),(1245,80,'Bolnisis Raioni',0,0),(1246,80,'Borjomis Raioni',0,0),(1247,80,'Chiat\'ura',0,0),(1248,80,'Ch\'khorotsqus Raioni',0,0),(1249,80,'Ch\'okhatauris Raioni',0,0),(1250,80,'Dedop\'listsqaros Raioni',0,0),(1251,80,'Dmanisis Raioni',0,0),(1252,80,'Dushet\'is Raioni',0,0),(1253,80,'Gardabanis Raioni',0,0),(1254,80,'Gori',0,0),(1255,80,'Goris Raioni',0,0),(1256,80,'Gurjaanis Raioni',0,0),(1257,80,'Javis Raioni',0,0),(1258,80,'K\'arelis Raioni',0,0),(1259,80,'Kaspis Raioni',0,0),(1260,80,'Kharagaulis Raioni',0,0),(1261,80,'Khashuris Raioni',0,0),(1262,80,'Khobis Raioni',0,0),(1263,80,'Khonis Raioni',0,0),(1264,80,'K\'ut\'aisi',0,0),(1265,80,'Lagodekhis Raioni',0,0),(1266,80,'Lanch\'khut\'is Raioni',0,0),(1267,80,'Lentekhis Raioni',0,0),(1268,80,'Marneulis Raioni',0,0),(1269,80,'Martvilis Raioni',0,0),(1270,80,'Mestiis Raioni',0,0),(1271,80,'Mts\'khet\'is Raioni',0,0),(1272,80,'Ninotsmindis Raioni',0,0),(1273,80,'Onis Raioni',0,0),(1274,80,'Ozurget\'is Raioni',0,0),(1275,80,'P\'ot\'i',0,0),(1276,80,'Qazbegis Raioni',0,0),(1277,80,'Qvarlis Raioni',0,0),(1278,80,'Rust\'avi',0,0),(1279,80,'Sach\'kheris Raioni',0,0),(1280,80,'Sagarejos Raioni',0,0),(1281,80,'Samtrediis Raioni',0,0),(1282,80,'Senakis Raioni',0,0),(1283,80,'Sighnaghis Raioni',0,0),(1284,80,'T\'bilisi',0,0),(1285,80,'T\'elavis Raioni',0,0),(1286,80,'T\'erjolis Raioni',0,0),(1287,80,'T\'et\'ritsqaros Raioni',0,0),(1288,80,'T\'ianet\'is Raioni',0,0),(1289,80,'Tqibuli',0,0),(1290,80,'Ts\'ageris Raioni',0,0),(1291,80,'Tsalenjikhis Raioni',0,0),(1292,80,'Tsalkis Raioni',0,0),(1293,80,'Tsqaltubo',0,0),(1294,80,'Vanis Raioni',0,0),(1295,80,'Zestap\'onis Raioni',0,0),(1296,80,'Zugdidi',0,0),(1297,80,'Zugdidis Raioni',0,0),(1298,82,'Greater Accra',0,0),(1299,82,'Ashanti',0,0),(1300,82,'Brong-Ahafo',0,0),(1301,82,'Central',0,0),(1302,82,'Eastern',0,0),(1303,82,'Northern',0,0),(1304,82,'Volta',0,0),(1305,82,'Western',0,0),(1306,82,'Upper East',0,0),(1307,82,'Upper West',0,0),(1308,85,'Nordgronland',0,0),(1309,85,'Ostgronland',0,0),(1310,85,'Vestgronland',0,0),(1311,79,'Banjul',0,0),(1312,79,'Lower River',0,0),(1313,79,'Central River',0,0),(1314,79,'Upper River',0,0),(1315,79,'Western',0,0),(1316,79,'North Bank',0,0),(1317,90,'Beyla',0,0),(1318,90,'Boffa',0,0),(1319,90,'Boke',0,0),(1320,90,'Conakry',0,0),(1321,90,'Dabola',0,0),(1322,90,'Dalaba',0,0),(1323,90,'Dinguiraye',0,0),(1324,90,'Faranah',0,0),(1325,90,'Forecariah',0,0),(1326,90,'Fria',0,0),(1327,90,'Gaoual',0,0),(1328,90,'Gueckedou',0,0),(1329,90,'Kerouane',0,0),(1330,90,'Kindia',0,0),(1331,90,'Kissidougou',0,0),(1332,90,'Koundara',0,0),(1333,90,'Kouroussa',0,0),(1334,90,'Macenta',0,0),(1335,90,'Mali',0,0),(1336,90,'Mamou',0,0),(1337,90,'Pita',0,0),(1338,90,'Telimele',0,0),(1339,90,'Tougue',0,0),(1340,90,'Yomou',0,0),(1341,90,'Coyah',0,0),(1342,90,'Dubreka',0,0),(1343,90,'Kankan',0,0),(1344,90,'Koubia',0,0),(1345,90,'Labe',0,0),(1346,90,'Lelouma',0,0),(1347,90,'Lola',0,0),(1348,90,'Mandiana',0,0),(1349,90,'Nzerekore',0,0),(1350,90,'Siguiri',0,0),(1351,65,'Annobon',0,0),(1352,65,'Bioko Norte',0,0),(1353,65,'Bioko Sur',0,0),(1354,65,'Centro Sur',0,0),(1355,65,'Kie-Ntem',0,0),(1356,65,'Litoral',0,0),(1357,65,'Wele-Nzas',0,0),(1358,84,'Evros',0,0),(1359,84,'Rodhopi',0,0),(1360,84,'Xanthi',0,0),(1361,84,'Drama',0,0),(1362,84,'Serrai',0,0),(1363,84,'Kilkis',0,0),(1364,84,'Pella',0,0),(1365,84,'Florina',0,0),(1366,84,'Kastoria',0,0),(1367,84,'Grevena',0,0),(1368,84,'Kozani',0,0),(1369,84,'Imathia',0,0),(1370,84,'Thessaloniki',0,0),(1371,84,'Kavala',0,0),(1372,84,'Khalkidhiki',0,0),(1373,84,'Pieria',0,0),(1374,84,'Ioannina',0,0),(1375,84,'Thesprotia',0,0),(1376,84,'Preveza',0,0),(1377,84,'Arta',0,0),(1378,84,'Larisa',0,0),(1379,84,'Trikala',0,0),(1380,84,'Kardhitsa',0,0),(1381,84,'Magnisia',0,0),(1382,84,'Kerkira',0,0),(1383,84,'Levkas',0,0),(1384,84,'Kefallinia',0,0),(1385,84,'Zakinthos',0,0),(1386,84,'Fthiotis',0,0),(1387,84,'Evritania',0,0),(1388,84,'Aitolia kai Akarnania',0,0),(1389,84,'Fokis',0,0),(1390,84,'Voiotia',0,0),(1391,84,'Evvoia',0,0),(1392,84,'Attiki',0,0),(1393,84,'Argolis',0,0),(1394,84,'Korinthia',0,0),(1395,84,'Akhaia',0,0),(1396,84,'Ilia',0,0),(1397,84,'Messinia',0,0),(1398,84,'Arkadhia',0,0),(1399,84,'Lakonia',0,0),(1400,84,'Khania',0,0),(1401,84,'Rethimni',0,0),(1402,84,'Iraklion',0,0),(1403,84,'Lasithi',0,0),(1404,84,'Dhodhekanisos',0,0),(1405,84,'Samos',0,0),(1406,84,'Kikladhes',0,0),(1407,84,'Khios',0,0),(1408,84,'Lesvos',0,0),(1409,89,'Alta Verapaz',0,0),(1410,89,'Baja Verapaz',0,0),(1411,89,'Chimaltenango',0,0),(1412,89,'Chiquimula',0,0),(1413,89,'El Progreso',0,0),(1414,89,'Escuintla',0,0),(1415,89,'Guatemala',0,0),(1416,89,'Huehuetenango',0,0),(1417,89,'Izabal',0,0),(1418,89,'Jalapa',0,0),(1419,89,'Jutiapa',0,0),(1420,89,'Peten',0,0),(1421,89,'Quetzaltenango',0,0),(1422,89,'Quiche',0,0),(1423,89,'Retalhuleu',0,0),(1424,89,'Sacatepequez',0,0),(1425,89,'San Marcos',0,0),(1426,89,'Santa Rosa',0,0),(1427,89,'Solola',0,0),(1428,89,'Suchitepequez',0,0),(1429,89,'Totonicapan',0,0),(1430,89,'Zacapa',0,0),(1431,91,'Bafata',0,0),(1432,91,'Quinara',0,0),(1433,91,'Oio',0,0),(1434,91,'Bolama',0,0),(1435,91,'Cacheu',0,0),(1436,91,'Tombali',0,0),(1437,91,'Gabu',0,0),(1438,91,'Bissau',0,0),(1439,91,'Biombo',0,0),(1440,92,'Barima-Waini',0,0),(1441,92,'Cuyuni-Mazaruni',0,0),(1442,92,'Demerara-Mahaica',0,0),(1443,92,'East Berbice-Corentyne',0,0),(1444,92,'Essequibo Islands-West Demerara',0,0),(1445,92,'Mahaica-Berbice',0,0),(1446,92,'Pomeroon-Supenaam',0,0),(1447,92,'Potaro-Siparuni',0,0),(1448,92,'Upper Demerara-Berbice',0,0),(1449,92,'Upper Takutu-Upper Essequibo',0,0),(1450,95,'Atlantida',0,0),(1451,95,'Choluteca',0,0),(1452,95,'Colon',0,0),(1453,95,'Comayagua',0,0),(1454,95,'Copan',0,0),(1455,95,'Cortes',0,0),(1456,95,'El Paraiso',0,0),(1457,95,'Francisco Morazan',0,0),(1458,95,'Gracias a Dios',0,0),(1459,95,'Intibuca',0,0),(1460,95,'Islas de la Bahia',0,0),(1461,95,'La Paz',0,0),(1462,95,'Lempira',0,0),(1463,95,'Ocotepeque',0,0),(1464,95,'Olancho',0,0),(1465,95,'Santa Barbara',0,0),(1466,95,'Valle',0,0),(1467,95,'Yoro',0,0),(1468,53,'Bjelovarsko-Bilogorska',0,0),(1469,53,'Brodsko-Posavska',0,0),(1470,53,'Dubrovacko-Neretvanska',0,0),(1471,53,'Istarska',0,0),(1472,53,'Karlovacka',0,0),(1473,53,'Koprivnicko-Krizevacka',0,0),(1474,53,'Krapinsko-Zagorska',0,0),(1475,53,'Licko-Senjska',0,0),(1476,53,'Medimurska',0,0),(1477,53,'Osjecko-Baranjska',0,0),(1478,53,'Pozesko-Slavonska',0,0),(1479,53,'Primorsko-Goranska',0,0),(1480,53,'Sibensko-Kninska',0,0),(1481,53,'Sisacko-Moslavacka',0,0),(1482,53,'Splitsko-Dalmatinska',0,0),(1483,53,'Varazdinska',0,0),(1484,53,'Viroviticko-Podravska',0,0),(1485,53,'Vukovarsko-Srijemska',0,0),(1486,53,'Zadarska',0,0),(1487,53,'Zagrebacka',0,0),(1488,53,'Grad Zagreb',0,0),(1489,93,'Nord-Ouest',0,0),(1490,93,'Artibonite',0,0),(1491,93,'Centre',0,0),(1492,93,'Nord',0,0),(1493,93,'Nord-Est',0,0),(1494,93,'Ouest',0,0),(1495,93,'Sud',0,0),(1496,93,'Sud-Est',0,0),(1497,93,'Grand\' Anse',0,0),(1498,93,'Nippes',0,0),(1499,97,'Bacs-Kiskun',0,0),(1500,97,'Baranya',0,0),(1501,97,'Bekes',0,0),(1502,97,'Borsod-Abauj-Zemplen',0,0),(1503,97,'Budapest',0,0),(1504,97,'Csongrad',0,0),(1505,97,'Debrecen',0,0),(1506,97,'Fejer',0,0),(1507,97,'Gyor-Moson-Sopron',0,0),(1508,97,'Hajdu-Bihar',0,0),(1509,97,'Heves',0,0),(1510,97,'Komarom-Esztergom',0,0),(1511,97,'Miskolc',0,0),(1512,97,'Nograd',0,0),(1513,97,'Pecs',0,0),(1514,97,'Pest',0,0),(1515,97,'Somogy',0,0),(1516,97,'Szabolcs-Szatmar-Bereg',0,0),(1517,97,'Szeged',0,0),(1518,97,'Jasz-Nagykun-Szolnok',0,0),(1519,97,'Tolna',0,0),(1520,97,'Vas',0,0),(1521,97,'Veszprem',0,0),(1522,97,'Zala',0,0),(1523,97,'Gyor',0,0),(1524,97,'Bekescsaba',0,0),(1525,97,'Dunaujvaros',0,0),(1526,97,'Eger',0,0),(1527,97,'Hodmezovasarhely',0,0),(1528,97,'Kaposvar',0,0),(1529,97,'Kecskemet',0,0),(1530,97,'Nagykanizsa',0,0),(1531,97,'Nyiregyhaza',0,0),(1532,97,'Sopron',0,0),(1533,97,'Szekesfehervar',0,0),(1534,97,'Szolnok',0,0),(1535,97,'Szombathely',0,0),(1536,97,'Tatabanya',0,0),(1537,97,'Veszprem',0,0),(1538,97,'Zalaegerszeg',0,0),(1539,97,'Salgotarjan',0,0),(1540,97,'Szekszard',0,0),(1541,97,'Erd',0,0),(1542,100,'Aceh',0,0),(1543,100,'Bali',0,0),(1544,100,'Bengkulu',0,0),(1545,100,'Jakarta Raya',0,0),(1546,100,'Jambi',0,0),(1547,100,'Jawa Tengah',0,0),(1548,100,'Jawa Timur',0,0),(1549,100,'Yogyakarta',0,0),(1550,100,'Kalimantan Barat',0,0),(1551,100,'Kalimantan Selatan',0,0),(1552,100,'Kalimantan Tengah',0,0),(1553,100,'Kalimantan Timur',0,0),(1554,100,'Lampung',0,0),(1555,100,'Nusa Tenggara Barat',0,0),(1556,100,'Nusa Tenggara Timur',0,0),(1557,100,'Sulawesi Tengah',0,0),(1558,100,'Sulawesi Tenggara',0,0),(1559,100,'Sumatera Barat',0,0),(1560,100,'Sumatera Utara',0,0),(1561,100,'Maluku',0,0),(1562,100,'Maluku Utara',0,0),(1563,100,'Jawa Barat',0,0),(1564,100,'Sulawesi Utara',0,0),(1565,100,'Sumatera Selatan',0,0),(1566,100,'Banten',0,0),(1567,100,'Gorontalo',0,0),(1568,100,'Kepulauan Bangka Belitung',0,0),(1569,100,'Papua',0,0),(1570,100,'Riau',0,0),(1571,100,'Sulawesi Selatan',0,0),(1572,100,'Irian Jaya Barat',0,0),(1573,100,'Kepulauan Riau',0,0),(1574,100,'Sulawesi Barat',0,0),(1575,103,'Carlow',0,0),(1576,103,'Cavan',0,0),(1577,103,'Clare',0,0),(1578,103,'Cork',0,0),(1579,103,'Donegal',0,0),(1580,103,'Dublin',0,0),(1581,103,'Galway',0,0),(1582,103,'Kerry',0,0),(1583,103,'Kildare',0,0),(1584,103,'Kilkenny',0,0),(1585,103,'Leitrim',0,0),(1586,103,'Laois',0,0),(1587,103,'Limerick',0,0),(1588,103,'Longford',0,0),(1589,103,'Louth',0,0),(1590,103,'Mayo',0,0),(1591,103,'Meath',0,0),(1592,103,'Monaghan',0,0),(1593,103,'Offaly',0,0),(1594,103,'Roscommon',0,0),(1595,103,'Sligo',0,0),(1596,103,'Tipperary',0,0),(1597,103,'Waterford',0,0),(1598,103,'Westmeath',0,0),(1599,103,'Wexford',0,0),(1600,103,'Wicklow',0,0),(1601,104,'HaDarom',0,0),(1602,104,'HaMerkaz',0,0),(1603,104,'HaZafon',0,0),(1604,104,'Hefa',0,0),(1605,104,'Tel Aviv',0,0),(1606,104,'Yerushalayim',0,0),(1607,99,'Andaman and Nicobar Islands',0,0),(1608,99,'Andhra Pradesh',0,0),(1609,99,'Assam',0,0),(1610,99,'Chandigarh',0,0),(1611,99,'Dadra and Nagar Haveli',0,0),(1612,99,'Delhi',0,0),(1613,99,'Gujarat',0,0),(1614,99,'Haryana',0,0),(1615,99,'Himachal Pradesh',0,0),(1616,99,'Jammu and Kashmir',0,0),(1617,99,'Kerala',0,0),(1618,99,'Lakshadweep',0,0),(1619,99,'Maharashtra',0,0),(1620,99,'Manipur',0,0),(1621,99,'Meghalaya',0,0),(1622,99,'Karnataka',0,0),(1623,99,'Nagaland',0,0),(1624,99,'Orissa',0,0),(1625,99,'Puducherry',0,0),(1626,99,'Punjab',0,0),(1627,99,'Rajasthan',0,0),(1628,99,'Tamil Nadu',0,0),(1629,99,'Tripura',0,0),(1630,99,'West Bengal',0,0),(1631,99,'Sikkim',0,0),(1632,99,'Arunachal Pradesh',0,0),(1633,99,'Mizoram',0,0),(1634,99,'Daman and Diu',0,0),(1635,99,'Goa',0,0),(1636,99,'Bihar',0,0),(1637,99,'Madhya Pradesh',0,0),(1638,99,'Uttar Pradesh',0,0),(1639,99,'Chhattisgarh',0,0),(1640,99,'Jharkhand',0,0),(1641,99,'Uttarakhand',0,0),(1642,102,'Al Anbar',0,0),(1643,102,'Al Basrah',0,0),(1644,102,'Al Muthanna',0,0),(1645,102,'Al Qadisiyah',0,0),(1646,102,'As Sulaymaniyah',0,0),(1647,102,'Babil',0,0),(1648,102,'Baghdad',0,0),(1649,102,'Dahuk',0,0),(1650,102,'Dhi Qar',0,0),(1651,102,'Diyala',0,0),(1652,102,'Arbil',0,0),(1653,102,'Karbala\'',0,0),(1654,102,'At Ta\'mim',0,0),(1655,102,'Maysan',0,0),(1656,102,'Ninawa',0,0),(1657,102,'Wasit',0,0),(1658,102,'An Najaf',0,0),(1659,102,'Salah ad Din',0,0),(1660,101,'Azarbayjan-e Bakhtari',0,0),(1661,101,'Chahar Mahall va Bakhtiari',0,0),(1662,101,'Sistan va Baluchestan',0,0),(1663,101,'Kohkiluyeh va Buyer Ahmadi',0,0),(1664,101,'Fars',0,0),(1665,101,'Gilan',0,0),(1666,101,'Hamadan',0,0),(1667,101,'Ilam',0,0),(1668,101,'Hormozgan',0,0),(1669,101,'Kerman',0,0),(1670,101,'Bakhtaran',0,0),(1671,101,'Khuzestan',0,0),(1672,101,'Kordestan',0,0),(1673,101,'Mazandaran',0,0),(1674,101,'Semnan Province',0,0),(1675,101,'Markazi',0,0),(1676,101,'Zanjan',0,0),(1677,101,'Bushehr',0,0),(1678,101,'Lorestan',0,0),(1679,101,'Markazi',0,0),(1680,101,'Semnan',0,0),(1681,101,'Tehran',0,0),(1682,101,'Zanjan',0,0),(1683,101,'Esfahan',0,0),(1684,101,'Kerman',0,0),(1685,101,'Khorasan',0,0),(1686,101,'Yazd',0,0),(1687,101,'Ardabil',0,0),(1688,101,'East Azarbaijan',0,0),(1689,101,'Markazi',0,0),(1690,101,'Mazandaran',0,0),(1691,101,'Zanjan',0,0),(1692,101,'Golestan',0,0),(1693,101,'Qazvin',0,0),(1694,101,'Qom',0,0),(1695,101,'Yazd',0,0),(1696,101,'Khorasan-e Janubi',0,0),(1697,101,'Khorasan-e Razavi',0,0),(1698,101,'Khorasan-e Shemali',0,0),(1699,101,'Alborz',0,0),(1700,98,'Arnessysla',0,0),(1701,98,'Austur-Hunavatnssysla',0,0),(1702,98,'Austur-Skaftafellssysla',0,0),(1703,98,'Borgarfjardarsysla',0,0),(1704,98,'Eyjafjardarsysla',0,0),(1705,98,'Gullbringusysla',0,0),(1706,98,'Kjosarsysla',0,0),(1707,98,'Myrasysla',0,0),(1708,98,'Nordur-Mulasysla',0,0),(1709,98,'Nordur-Tingeyjarsysla',0,0),(1710,98,'Rangarvallasysla',0,0),(1711,98,'Skagafjardarsysla',0,0),(1712,98,'Snafellsnes- og Hnappadalssysla',0,0),(1713,98,'Strandasysla',0,0),(1714,98,'Sudur-Mulasysla',0,0),(1715,98,'Sudur-Tingeyjarsysla',0,0),(1716,98,'Vestur-Bardastrandarsysla',0,0),(1717,98,'Vestur-Hunavatnssysla',0,0),(1718,98,'Vestur-Isafjardarsysla',0,0),(1719,98,'Vestur-Skaftafellssysla',0,0),(1720,98,'Austurland',0,0),(1721,98,'Hofuoborgarsvaoio',0,0),(1722,98,'Norourland Eystra',0,0),(1723,98,'Norourland Vestra',0,0),(1724,98,'Suourland',0,0),(1725,98,'Suournes',0,0),(1726,98,'Vestfiroir',0,0),(1727,98,'Vesturland',0,0),(1728,105,'Abruzzi',0,0),(1729,105,'Basilicata',0,0),(1730,105,'Calabria',0,0),(1731,105,'Campania',0,0),(1732,105,'Emilia-Romagna',0,0),(1733,105,'Friuli-Venezia Giulia',0,0),(1734,105,'Lazio',0,0),(1735,105,'Liguria',0,0),(1736,105,'Lombardia',0,0),(1737,105,'Marche',0,0),(1738,105,'Molise',0,0),(1739,105,'Piemonte',0,0),(1740,105,'Puglia',0,0),(1741,105,'Sardegna',0,0),(1742,105,'Sicilia',0,0),(1743,105,'Toscana',0,0),(1744,105,'Trentino-Alto Adige',0,0),(1745,105,'Umbria',0,0),(1746,105,'Valle d\'Aosta',0,0),(1747,105,'Veneto',0,0),(1748,106,'Clarendon',0,0),(1749,106,'Hanover',0,0),(1750,106,'Manchester',0,0),(1751,106,'Portland',0,0),(1752,106,'Saint Andrew',0,0),(1753,106,'Saint Ann',0,0),(1754,106,'Saint Catherine',0,0),(1755,106,'Saint Elizabeth',0,0),(1756,106,'Saint James',0,0),(1757,106,'Saint Mary',0,0),(1758,106,'Saint Thomas',0,0),(1759,106,'Trelawny',0,0),(1760,106,'Westmoreland',0,0),(1761,106,'Kingston',0,0),(1762,108,'Al Balqa\'',0,0),(1763,108,'Al Karak',0,0),(1764,108,'At Tafilah',0,0),(1765,108,'Al Mafraq',0,0),(1766,108,'Amman',0,0),(1767,108,'Az Zaraqa',0,0),(1768,108,'Irbid',0,0),(1769,108,'Ma\'an',0,0),(1770,108,'Ajlun',0,0),(1771,108,'Al Aqabah',0,0),(1772,108,'Jarash',0,0),(1773,108,'Madaba',0,0),(1774,107,'Aichi',0,0),(1775,107,'Akita',0,0),(1776,107,'Aomori',0,0),(1777,107,'Chiba',0,0),(1778,107,'Ehime',0,0),(1779,107,'Fukui',0,0),(1780,107,'Fukuoka',0,0),(1781,107,'Fukushima',0,0),(1782,107,'Gifu',0,0),(1783,107,'Gumma',0,0),(1784,107,'Hiroshima',0,0),(1785,107,'Hokkaido',0,0),(1786,107,'Hyogo',0,0),(1787,107,'Ibaraki',0,0),(1788,107,'Ishikawa',0,0),(1789,107,'Iwate',0,0),(1790,107,'Kagawa',0,0),(1791,107,'Kagoshima',0,0),(1792,107,'Kanagawa',0,0),(1793,107,'Kochi',0,0),(1794,107,'Kumamoto',0,0),(1795,107,'Kyoto',0,0),(1796,107,'Mie',0,0),(1797,107,'Miyagi',0,0),(1798,107,'Miyazaki',0,0),(1799,107,'Nagano',0,0),(1800,107,'Nagasaki',0,0),(1801,107,'Nara',0,0),(1802,107,'Niigata',0,0),(1803,107,'Oita',0,0),(1804,107,'Okayama',0,0),(1805,107,'Osaka',0,0),(1806,107,'Saga',0,0),(1807,107,'Saitama',0,0),(1808,107,'Shiga',0,0),(1809,107,'Shimane',0,0),(1810,107,'Shizuoka',0,0),(1811,107,'Tochigi',0,0),(1812,107,'Tokushima',0,0),(1813,107,'Tokyo',0,0),(1814,107,'Tottori',0,0),(1815,107,'Toyama',0,0),(1816,107,'Wakayama',0,0),(1817,107,'Yamagata',0,0),(1818,107,'Yamaguchi',0,0),(1819,107,'Yamanashi',0,0),(1820,107,'Okinawa',0,0),(1821,110,'Central',0,0),(1822,110,'Coast',0,0),(1823,110,'Eastern',0,0),(1824,110,'Nairobi Area',0,0),(1825,110,'North-Eastern',0,0),(1826,110,'Nyanza',0,0),(1827,110,'Rift Valley',0,0),(1828,110,'Western',0,0),(1829,115,'Bishkek',0,0),(1830,115,'Chuy',0,0),(1831,115,'Jalal-Abad',0,0),(1832,115,'Naryn',0,0),(1833,115,'Osh',0,0),(1834,115,'Talas',0,0),(1835,115,'Ysyk-Kol',0,0),(1836,115,'Osh',0,0),(1837,115,'Batken',0,0),(1838,36,'Batdambang',0,0),(1839,36,'Kampong Cham',0,0),(1840,36,'Kampong Chhnang',0,0),(1841,36,'Kampong Speu',0,0),(1842,36,'Kampong Thum',0,0),(1843,36,'Kampot',0,0),(1844,36,'Kandal',0,0),(1845,36,'Koh Kong',0,0),(1846,36,'Kracheh',0,0),(1847,36,'Mondulkiri',0,0),(1848,36,'Phnum Penh',0,0),(1849,36,'Pursat',0,0),(1850,36,'Preah Vihear',0,0),(1851,36,'Prey Veng',0,0),(1852,36,'Ratanakiri Kiri',0,0),(1853,36,'Siem Reap',0,0),(1854,36,'Stung Treng',0,0),(1855,36,'Svay Rieng',0,0),(1856,36,'Takeo',0,0),(1857,36,'Banteay Meanchey',0,0),(1858,36,'Batdambang',0,0),(1859,36,'Pailin',0,0),(1860,111,'Gilbert Islands',0,0),(1861,111,'Line Islands',0,0),(1862,111,'Phoenix Islands',0,0),(1863,48,'Anjouan',0,0),(1864,48,'Grande Comore',0,0),(1865,48,'Moheli',0,0),(1866,178,'Christ Church Nichola Town',0,0),(1867,178,'Saint Anne Sandy Point',0,0),(1868,178,'Saint George Basseterre',0,0),(1869,178,'Saint George Gingerland',0,0),(1870,178,'Saint James Windward',0,0),(1871,178,'Saint John Capisterre',0,0),(1872,178,'Saint John Figtree',0,0),(1873,178,'Saint Mary Cayon',0,0),(1874,178,'Saint Paul Capisterre',0,0),(1875,178,'Saint Paul Charlestown',0,0),(1876,178,'Saint Peter Basseterre',0,0),(1877,178,'Saint Thomas Lowland',0,0),(1878,178,'Saint Thomas Middle Island',0,0),(1879,178,'Trinity Palmetto Point',0,0),(1880,112,'Chagang-do',0,0),(1881,112,'Hamgyong-namdo',0,0),(1882,112,'Hwanghae-namdo',0,0),(1883,112,'Hwanghae-bukto',0,0),(1884,112,'Kaesong-si',0,0),(1885,112,'Kangwon-do',0,0),(1886,112,'P\'yongan-bukto',0,0),(1887,112,'P\'yongyang-si',0,0),(1888,112,'Yanggang-do',0,0),(1889,112,'Namp\'o-si',0,0),(1890,112,'P\'yongan-namdo',0,0),(1891,112,'Hamgyong-bukto',0,0),(1892,112,'Najin Sonbong-si',0,0),(1893,113,'Cheju-do',0,0),(1894,113,'Cholla-bukto',0,0),(1895,113,'Ch\'ungch\'ong-bukto',0,0),(1896,113,'Kangwon-do',0,0),(1897,113,'Pusan-jikhalsi',0,0),(1898,113,'Seoul-t\'ukpyolsi',0,0),(1899,113,'Inch\'on-jikhalsi',0,0),(1900,113,'Kyonggi-do',0,0),(1901,113,'Kyongsang-bukto',0,0),(1902,113,'Taegu-jikhalsi',0,0),(1903,113,'Cholla-namdo',0,0),(1904,113,'Ch\'ungch\'ong-namdo',0,0),(1905,113,'Kwangju-jikhalsi',0,0),(1906,113,'Taejon-jikhalsi',0,0),(1907,113,'Kyongsang-namdo',0,0),(1908,113,'Ulsan-gwangyoksi',0,0),(1909,114,'Al Ahmadi',0,0),(1910,114,'Al Kuwayt',0,0),(1911,114,'Al Jahra',0,0),(1912,114,'Al Farwaniyah',0,0),(1913,114,'Hawalli',0,0),(1914,114,'Mubarak al Kabir',0,0),(1915,40,'Creek',0,0),(1916,40,'Eastern',0,0),(1917,40,'Midland',0,0),(1918,40,'South Town',0,0),(1919,40,'Spot Bay',0,0),(1920,40,'Stake Bay',0,0),(1921,40,'West End',0,0),(1922,40,'Western',0,0),(1923,109,'Almaty',0,0),(1924,109,'Almaty City',0,0),(1925,109,'Aqmola',0,0),(1926,109,'Aqtobe',0,0),(1927,109,'Astana',0,0),(1928,109,'Atyrau',0,0),(1929,109,'West Kazakhstan',0,0),(1930,109,'Bayqonyr',0,0),(1931,109,'Mangghystau',0,0),(1932,109,'South Kazakhstan',0,0),(1933,109,'Pavlodar',0,0),(1934,109,'Qaraghandy',0,0),(1935,109,'Qostanay',0,0),(1936,109,'Qyzylorda',0,0),(1937,109,'East Kazakhstan',0,0),(1938,109,'North Kazakhstan',0,0),(1939,109,'Zhambyl',0,0),(1940,116,'Attapu',0,0),(1941,116,'Champasak',0,0),(1942,116,'Houaphan',0,0),(1943,116,'Khammouan',0,0),(1944,116,'Louang Namtha',0,0),(1945,116,'Oudomxai',0,0),(1946,116,'Phongsali',0,0),(1947,116,'Saravan',0,0),(1948,116,'Savannakhet',0,0),(1949,116,'Vientiane',0,0),(1950,116,'Xaignabouri',0,0),(1951,116,'Xiangkhoang',0,0),(1952,116,'Louangphrabang',0,0),(1953,118,'Beqaa',0,0),(1954,118,'Al Janub',0,0),(1955,118,'Liban-Nord',0,0),(1956,118,'Beyrouth',0,0),(1957,118,'Mont-Liban',0,0),(1958,118,'Liban-Sud',0,0),(1959,118,'Nabatiye',0,0),(1960,118,'Beqaa',0,0),(1961,118,'Liban-Nord',0,0),(1962,118,'Aakk,r',0,0),(1963,118,'Baalbek-Hermel',0,0),(1964,179,'Anse-la-Raye',0,0),(1965,179,'Dauphin',0,0),(1966,179,'Castries',0,0),(1967,179,'Choiseul',0,0),(1968,179,'Dennery',0,0),(1969,179,'Gros-Islet',0,0),(1970,179,'Laborie',0,0),(1971,179,'Micoud',0,0),(1972,179,'Soufriere',0,0),(1973,179,'Vieux-Fort',0,0),(1974,179,'Praslin',0,0),(1975,122,'Balzers',0,0),(1976,122,'Eschen',0,0),(1977,122,'Gamprin',0,0),(1978,122,'Mauren',0,0),(1979,122,'Planken',0,0),(1980,122,'Ruggell',0,0),(1981,122,'Schaan',0,0),(1982,122,'Schellenberg',0,0),(1983,122,'Triesen',0,0),(1984,122,'Triesenberg',0,0),(1985,122,'Vaduz',0,0),(1986,122,'Gbarpolu',0,0),(1987,122,'River Gee',0,0),(1988,196,'Central',0,0),(1989,196,'North Central',0,0),(1990,196,'North Western',0,0),(1991,196,'Sabaragamuwa',0,0),(1992,196,'Southern',0,0),(1993,196,'Uva',0,0),(1994,196,'Western',0,0),(1995,196,'Eastern',0,0),(1996,196,'Northern',0,0),(1997,120,'Bong',0,0),(1998,120,'Grand Cape Mount',0,0),(1999,120,'Lofa',0,0),(2000,120,'Maryland',0,0),(2001,120,'Monrovia',0,0),(2002,120,'Nimba',0,0),(2003,120,'Sino',0,0),(2004,120,'Grand Bassa',0,0),(2005,120,'Grand Cape Mount',0,0),(2006,120,'Maryland',0,0),(2007,120,'Montserrado',0,0),(2008,120,'Margibi',0,0),(2009,120,'River Cess',0,0),(2010,120,'Grand Gedeh',0,0),(2011,120,'Lofa',0,0),(2012,120,'Gbarpolu',0,0),(2013,120,'River Gee',0,0),(2014,119,'Berea',0,0),(2015,119,'Butha-Buthe',0,0),(2016,119,'Leribe',0,0),(2017,119,'Mafeteng',0,0),(2018,119,'Maseru',0,0),(2019,119,'Mohales Hoek',0,0),(2020,119,'Mokhotlong',0,0),(2021,119,'Qachas Nek',0,0),(2022,119,'Quthing',0,0),(2023,119,'Thaba-Tseka',0,0),(2024,123,'Alytaus Apskritis',0,0),(2025,123,'Kauno Apskritis',0,0),(2026,123,'Klaipedos Apskritis',0,0),(2027,123,'Marijampoles Apskritis',0,0),(2028,123,'Panevezio Apskritis',0,0),(2029,123,'Siauliu Apskritis',0,0),(2030,123,'Taurages Apskritis',0,0),(2031,123,'Telsiu Apskritis',0,0),(2032,123,'Utenos Apskritis',0,0),(2033,123,'Vilniaus Apskritis',0,0),(2034,124,'Diekirch',0,0),(2035,124,'Grevenmacher',0,0),(2036,124,'Luxembourg',0,0),(2037,117,'Aizkraukles',0,0),(2038,117,'Aluksnes',0,0),(2039,117,'Balvu',0,0),(2040,117,'Bauskas',0,0),(2041,117,'Cesu',0,0),(2042,117,'Daugavpils',0,0),(2043,117,'Daugavpils',0,0),(2044,117,'Dobeles',0,0),(2045,117,'Gulbenes',0,0),(2046,117,'Jekabpils',0,0),(2047,117,'Jelgava',0,0),(2048,117,'Jelgavas',0,0),(2049,117,'Jurmala',0,0),(2050,117,'Kraslavas',0,0),(2051,117,'Kuldigas',0,0),(2052,117,'Liepaja',0,0),(2053,117,'Liepajas',0,0),(2054,117,'Limbazu',0,0),(2055,117,'Ludzas',0,0),(2056,117,'Madonas',0,0),(2057,117,'Ogres',0,0),(2058,117,'Preilu',0,0),(2059,117,'Rezekne',0,0),(2060,117,'Rezeknes',0,0),(2061,117,'Riga',0,0),(2062,117,'Rigas',0,0),(2063,117,'Saldus',0,0),(2064,117,'Talsu',0,0),(2065,117,'Tukuma',0,0),(2066,117,'Valkas',0,0),(2067,117,'Valmieras',0,0),(2068,117,'Ventspils',0,0),(2069,117,'Ventspils',0,0),(2070,121,'Al Aziziyah',0,0),(2071,121,'Al Jufrah',0,0),(2072,121,'Al Kufrah',0,0),(2073,121,'Ash Shati\'',0,0),(2074,121,'Murzuq',0,0),(2075,121,'Sabha',0,0),(2076,121,'Tarhunah',0,0),(2077,121,'Tubruq',0,0),(2078,121,'Zlitan',0,0),(2079,121,'Ajdabiya',0,0),(2080,121,'Al Fatih',0,0),(2081,121,'Al Jabal al Akhdar',0,0),(2082,121,'Al Khums',0,0),(2083,121,'An Nuqat al Khams',0,0),(2084,121,'Awbari',0,0),(2085,121,'Az Zawiyah',0,0),(2086,121,'Banghazi',0,0),(2087,121,'Darnah',0,0),(2088,121,'Ghadamis',0,0),(2089,121,'Gharyan',0,0),(2090,121,'Misratah',0,0),(2091,121,'Sawfajjin',0,0),(2092,121,'Surt',0,0),(2093,121,'Tarabulus',0,0),(2094,121,'Yafran',0,0),(2095,144,'Grand Casablanca',0,0),(2096,144,'Fes-Boulemane',0,0),(2097,144,'Marrakech-Tensift-Al Haouz',0,0),(2098,144,'Meknes-Tafilalet',0,0),(2099,144,'Rabat-Sale-Zemmour-Zaer',0,0),(2100,144,'Chaouia-Ouardigha',0,0),(2101,144,'Doukkala-Abda',0,0),(2102,144,'Gharb-Chrarda-Beni Hssen',0,0),(2103,144,'Guelmim-Es Smara',0,0),(2104,144,'Oriental',0,0),(2105,144,'Souss-Massa-Dr,a',0,0),(2106,144,'Tadla-Azilal',0,0),(2107,144,'Tanger-Tetouan',0,0),(2108,144,'Taza-Al Hoceima-Taounate',0,0),(2109,144,'La,youne-Boujdour-Sakia El Hamra',0,0),(2110,141,'La Condamine',0,0),(2111,141,'Monaco',0,0),(2112,141,'Monte-Carlo',0,0),(2113,140,'Gagauzia',0,0),(2114,140,'Chisinau',0,0),(2115,140,'Stinga Nistrului',0,0),(2116,140,'Anenii Noi',0,0),(2117,140,'Balti',0,0),(2118,140,'Basarabeasca',0,0),(2119,140,'Bender',0,0),(2120,140,'Briceni',0,0),(2121,140,'Cahul',0,0),(2122,140,'Cantemir',0,0),(2123,140,'Calarasi',0,0),(2124,140,'Causeni',0,0),(2125,140,'Cimislia',0,0),(2126,140,'Criuleni',0,0),(2127,140,'Donduseni',0,0),(2128,140,'Drochia',0,0),(2129,140,'Dubasari',0,0),(2130,140,'Edinet',0,0),(2131,140,'Falesti',0,0),(2132,140,'Floresti',0,0),(2133,140,'Glodeni',0,0),(2134,140,'Hincesti',0,0),(2135,140,'Ialoveni',0,0),(2136,140,'Leova',0,0),(2137,140,'Nisporeni',0,0),(2138,140,'Ocnita',0,0),(2139,140,'Orhei',0,0),(2140,140,'Rezina',0,0),(2141,140,'Riscani',0,0),(2142,140,'Singerei',0,0),(2143,140,'Soldanesti',0,0),(2144,140,'Soroca',0,0),(2145,140,'Stefan-Voda',0,0),(2146,140,'Straseni',0,0),(2147,140,'Taraclia',0,0),(2148,140,'Telenesti',0,0),(2149,140,'Ungheni',0,0),(2150,127,'Antsiranana',0,0),(2151,127,'Fianarantsoa',0,0),(2152,127,'Mahajanga',0,0),(2153,127,'Toamasina',0,0),(2154,127,'Antananarivo',0,0),(2155,127,'Toliara',0,0),(2156,126,'Aracinovo',0,0),(2157,126,'Bac',0,0),(2158,126,'Belcista',0,0),(2159,126,'Berovo',0,0),(2160,126,'Bistrica',0,0),(2161,126,'Bitola',0,0),(2162,126,'Blatec',0,0),(2163,126,'Bogdanci',0,0),(2164,126,'Bogomila',0,0),(2165,126,'Bogovinje',0,0),(2166,126,'Bosilovo',0,0),(2167,126,'Brvenica',0,0),(2168,126,'Cair',0,0),(2169,126,'Capari',0,0),(2170,126,'Caska',0,0),(2171,126,'Cegrane',0,0),(2172,126,'Centar',0,0),(2173,126,'Centar Zupa',0,0),(2174,126,'Cesinovo',0,0),(2175,126,'Cucer-Sandevo',0,0),(2176,126,'Debar',0,0),(2177,126,'Delcevo',0,0),(2178,126,'Delogozdi',0,0),(2179,126,'Demir Hisar',0,0),(2180,126,'Demir Kapija',0,0),(2181,126,'Dobrusevo',0,0),(2182,126,'Dolna Banjica',0,0),(2183,126,'Dolneni',0,0),(2184,126,'Dorce Petrov',0,0),(2185,126,'Drugovo',0,0),(2186,126,'Dzepciste',0,0),(2187,126,'Gazi Baba',0,0),(2188,126,'Gevgelija',0,0),(2189,126,'Gostivar',0,0),(2190,126,'Gradsko',0,0),(2191,126,'Ilinden',0,0),(2192,126,'Izvor',0,0),(2193,126,'Jegunovce',0,0),(2194,126,'Kamenjane',0,0),(2195,126,'Karbinci',0,0),(2196,126,'Karpos',0,0),(2197,126,'Kavadarci',0,0),(2198,126,'Kicevo',0,0),(2199,126,'Kisela Voda',0,0),(2200,126,'Klecevce',0,0),(2201,126,'Kocani',0,0),(2202,126,'Konce',0,0),(2203,126,'Kondovo',0,0),(2204,126,'Konopiste',0,0),(2205,126,'Kosel',0,0),(2206,126,'Kratovo',0,0),(2207,126,'Kriva Palanka',0,0),(2208,126,'Krivogastani',0,0),(2209,126,'Krusevo',0,0),(2210,126,'Kuklis',0,0),(2211,126,'Kukurecani',0,0),(2212,126,'Kumanovo',0,0),(2213,126,'Labunista',0,0),(2214,126,'Lipkovo',0,0),(2215,126,'Lozovo',0,0),(2216,126,'Lukovo',0,0),(2217,126,'Makedonska Kamenica',0,0),(2218,126,'Makedonski Brod',0,0),(2219,126,'Mavrovi Anovi',0,0),(2220,126,'Meseista',0,0),(2221,126,'Miravci',0,0),(2222,126,'Mogila',0,0),(2223,126,'Murtino',0,0),(2224,126,'Negotino',0,0),(2225,126,'Negotino-Polosko',0,0),(2226,126,'Novaci',0,0),(2227,126,'Novo Selo',0,0),(2228,126,'Oblesevo',0,0),(2229,126,'Ohrid',0,0),(2230,126,'Orasac',0,0),(2231,126,'Orizari',0,0),(2232,126,'Oslomej',0,0),(2233,126,'Pehcevo',0,0),(2234,126,'Petrovec',0,0),(2235,126,'Plasnica',0,0),(2236,126,'Podares',0,0),(2237,126,'Prilep',0,0),(2238,126,'Probistip',0,0),(2239,126,'Radovis',0,0),(2240,126,'Rankovce',0,0),(2241,126,'Resen',0,0),(2242,126,'Rosoman',0,0),(2243,126,'Rostusa',0,0),(2244,126,'Samokov',0,0),(2245,126,'Saraj',0,0),(2246,126,'Sipkovica',0,0),(2247,126,'Sopiste',0,0),(2248,126,'Sopotnica',0,0),(2249,126,'Srbinovo',0,0),(2250,126,'Staravina',0,0),(2251,126,'Star Dojran',0,0),(2252,126,'Staro Nagoricane',0,0),(2253,126,'Stip',0,0),(2254,126,'Struga',0,0),(2255,126,'Strumica',0,0),(2256,126,'Studenicani',0,0),(2257,126,'Suto Orizari',0,0),(2258,126,'Sveti Nikole',0,0),(2259,126,'Tearce',0,0),(2260,126,'Tetovo',0,0),(2261,126,'Topolcani',0,0),(2262,126,'Valandovo',0,0),(2263,126,'Vasilevo',0,0),(2264,126,'Veles',0,0),(2265,126,'Velesta',0,0),(2266,126,'Vevcani',0,0),(2267,126,'Vinica',0,0),(2268,126,'Vitoliste',0,0),(2269,126,'Vranestica',0,0),(2270,126,'Vrapciste',0,0),(2271,126,'Vratnica',0,0),(2272,126,'Vrutok',0,0),(2273,126,'Zajas',0,0),(2274,126,'Zelenikovo',0,0),(2275,126,'Zelino',0,0),(2276,126,'Zitose',0,0),(2277,126,'Zletovo',0,0),(2278,126,'Zrnovci',0,0),(2279,131,'Bamako',0,0),(2280,131,'Kayes',0,0),(2281,131,'Mopti',0,0),(2282,131,'Segou',0,0),(2283,131,'Sikasso',0,0),(2284,131,'Koulikoro',0,0),(2285,131,'Tombouctou',0,0),(2286,131,'Gao',0,0),(2287,131,'Kidal',0,0),(2288,146,'Rakhine State',0,0),(2289,146,'Chin State',0,0),(2290,146,'Irrawaddy',0,0),(2291,146,'Kachin State',0,0),(2292,146,'Karan State',0,0),(2293,146,'Kayah State',0,0),(2294,146,'Magwe',0,0),(2295,146,'Mandalay',0,0),(2296,146,'Pegu',0,0),(2297,146,'Sagaing',0,0),(2298,146,'Shan State',0,0),(2299,146,'Tenasserim',0,0),(2300,146,'Mon State',0,0),(2301,146,'Rangoon',0,0),(2302,146,'Yangon',0,0),(2303,142,'Arhangay',0,0),(2304,142,'Bayanhongor',0,0),(2305,142,'Bayan-Olgiy',0,0),(2306,142,'Darhan',0,0),(2307,142,'Dornod',0,0),(2308,142,'Dornogovi',0,0),(2309,142,'Dundgovi',0,0),(2310,142,'Dzavhan',0,0),(2311,142,'Govi-Altay',0,0),(2312,142,'Hentiy',0,0),(2313,142,'Hovd',0,0),(2314,142,'Hovsgol',0,0),(2315,142,'Omnogovi',0,0),(2316,142,'Ovorhangay',0,0),(2317,142,'Selenge',0,0),(2318,142,'Suhbaatar',0,0),(2319,142,'Tov',0,0),(2320,142,'Uvs',0,0),(2321,142,'Ulaanbaatar',0,0),(2322,142,'Bulgan',0,0),(2323,142,'Erdenet',0,0),(2324,142,'Darhan-Uul',0,0),(2325,142,'Govisumber',0,0),(2326,142,'Orhon',0,0),(2327,125,'Ilhas',0,0),(2328,125,'Macau',0,0),(2329,135,'Hodh Ech Chargui',0,0),(2330,135,'Hodh El Gharbi',0,0),(2331,135,'Assaba',0,0),(2332,135,'Gorgol',0,0),(2333,135,'Brakna',0,0),(2334,135,'Trarza',0,0),(2335,135,'Adrar',0,0),(2336,135,'Dakhlet Nouadhibou',0,0),(2337,135,'Tagant',0,0),(2338,135,'Guidimaka',0,0),(2339,135,'Tiris Zemmour',0,0),(2340,135,'Inchiri',0,0),(2341,143,'Saint Anthony',0,0),(2342,143,'Saint Georges',0,0),(2343,143,'Saint Peter',0,0),(2344,136,'Black River',0,0),(2345,136,'Flacq',0,0),(2346,136,'Grand Port',0,0),(2347,136,'Moka',0,0),(2348,136,'Pamplemousses',0,0),(2349,136,'Plaines Wilhems',0,0),(2350,136,'Port Louis',0,0),(2351,136,'Riviere du Rempart',0,0),(2352,136,'Savanne',0,0),(2353,136,'Agalega Islands',0,0),(2354,136,'Cargados Carajos',0,0),(2355,136,'Rodrigues',0,0),(2356,130,'Seenu',0,0),(2357,130,'Laamu',0,0),(2358,130,'Alifu',0,0),(2359,130,'Baa',0,0),(2360,130,'Dhaalu',0,0),(2361,130,'Faafu ',0,0),(2362,130,'Gaafu Alifu',0,0),(2363,130,'Gaafu Dhaalu',0,0),(2364,130,'Haa Alifu',0,0),(2365,130,'Haa Dhaalu',0,0),(2366,130,'Kaafu',0,0),(2367,130,'Lhaviyani',0,0),(2368,130,'Maale',0,0),(2369,130,'Meemu',0,0),(2370,130,'Gnaviyani',0,0),(2371,130,'Noonu',0,0),(2372,130,'Raa',0,0),(2373,130,'Shaviyani',0,0),(2374,130,'Thaa',0,0),(2375,130,'Vaavu',0,0),(2376,128,'Chikwawa',0,0),(2377,128,'Chiradzulu',0,0),(2378,128,'Chitipa',0,0),(2379,128,'Thyolo',0,0),(2380,128,'Dedza',0,0),(2381,128,'Dowa',0,0),(2382,128,'Karonga',0,0),(2383,128,'Kasungu',0,0),(2384,128,'Lilongwe',0,0),(2385,128,'Mangochi',0,0),(2386,128,'Mchinji',0,0),(2387,128,'Mzimba',0,0),(2388,128,'Ntcheu',0,0),(2389,128,'Nkhata Bay',0,0),(2390,128,'Nkhotakota',0,0),(2391,128,'Nsanje',0,0),(2392,128,'Ntchisi',0,0),(2393,128,'Rumphi',0,0),(2394,128,'Salima',0,0),(2395,128,'Zomba',0,0),(2396,128,'Blantyre',0,0),(2397,128,'Mwanza',0,0),(2398,128,'Balaka',0,0),(2399,128,'Likoma',0,0),(2400,128,'Machinga',0,0),(2401,128,'Mulanje',0,0),(2402,128,'Phalombe',0,0),(2403,138,'Aguascalientes',0,0),(2404,138,'Baja California',0,0),(2405,138,'Baja California Sur',0,0),(2406,138,'Campeche',0,0),(2407,138,'Chiapas',0,0),(2408,138,'Chihuahua',0,0),(2409,138,'Coahuila de Zaragoza',0,0),(2410,138,'Colima',0,0),(2411,138,'Distrito Federal',0,0),(2412,138,'Durango',0,0),(2413,138,'Guanajuato',0,0),(2414,138,'Guerrero',0,0),(2415,138,'Hidalgo',0,0),(2416,138,'Jalisco',0,0),(2417,138,'Mexico',0,0),(2418,138,'Michoacan de Ocampo',0,0),(2419,138,'Morelos',0,0),(2420,138,'Nayarit',0,0),(2421,138,'Nuevo Leon',0,0),(2422,138,'Oaxaca',0,0),(2423,138,'Puebla',0,0),(2424,138,'Queretaro de Arteaga',0,0),(2425,138,'Quintana Roo',0,0),(2426,138,'San Luis Potosi',0,0),(2427,138,'Sinaloa',0,0),(2428,138,'Sonora',0,0),(2429,138,'Tabasco',0,0),(2430,138,'Tamaulipas',0,0),(2431,138,'Tlaxcala',0,0),(2432,138,'Veracruz-Llave',0,0),(2433,138,'Yucatan',0,0),(2434,138,'Zacatecas',0,0),(2435,129,'Johor',0,0),(2436,129,'Kedah',0,0),(2437,129,'Kelantan',0,0),(2438,129,'Melaka',0,0),(2439,129,'Negeri Sembilan',0,0),(2440,129,'Pahang',0,0),(2441,129,'Perak',0,0),(2442,129,'Perlis',0,0),(2443,129,'Pulau Pinang',0,0),(2444,129,'Sarawak',0,0),(2445,129,'Selangor',0,0),(2446,129,'Terengganu',0,0),(2447,129,'Kuala Lumpur',0,0),(2448,129,'Labuan',0,0),(2449,129,'Sabah',0,0),(2450,129,'Putrajaya',0,0),(2451,145,'Cabo Delgado',0,0),(2452,145,'Gaza',0,0),(2453,145,'Inhambane',0,0),(2454,145,'Maputo',0,0),(2455,145,'Sofala',0,0),(2456,145,'Nampula',0,0),(2457,145,'Niassa',0,0),(2458,145,'Tete',0,0),(2459,145,'Zambezia',0,0),(2460,145,'Manica',0,0),(2461,145,'Maputo',0,0),(2462,147,'Bethanien',0,0),(2463,147,'Caprivi Oos',0,0),(2464,147,'Boesmanland',0,0),(2465,147,'Gobabis',0,0),(2466,147,'Grootfontein',0,0),(2467,147,'Kaokoland',0,0),(2468,147,'Karibib',0,0),(2469,147,'Keetmanshoop',0,0),(2470,147,'Luderitz',0,0),(2471,147,'Maltahohe',0,0),(2472,147,'Okahandja',0,0),(2473,147,'Omaruru',0,0),(2474,147,'Otjiwarongo',0,0),(2475,147,'Outjo',0,0),(2476,147,'Owambo',0,0),(2477,147,'Rehoboth',0,0),(2478,147,'Swakopmund',0,0),(2479,147,'Tsumeb',0,0),(2480,147,'Karasburg',0,0),(2481,147,'Windhoek',0,0),(2482,147,'Damaraland',0,0),(2483,147,'Hereroland Oos',0,0),(2484,147,'Hereroland Wes',0,0),(2485,147,'Kavango',0,0),(2486,147,'Mariental',0,0),(2487,147,'Namaland',0,0),(2488,147,'Caprivi',0,0),(2489,147,'Erongo',0,0),(2490,147,'Hardap',0,0),(2491,147,'Karas',0,0),(2492,147,'Kunene',0,0),(2493,147,'Ohangwena',0,0),(2494,147,'Okavango',0,0),(2495,147,'Omaheke',0,0),(2496,147,'Omusati',0,0),(2497,147,'Oshana',0,0),(2498,147,'Oshikoto',0,0),(2499,147,'Otjozondjupa',0,0),(2500,155,'Agadez',0,0),(2501,155,'Diffa',0,0),(2502,155,'Dosso',0,0),(2503,155,'Maradi',0,0),(2504,155,'Niamey',0,0),(2505,155,'Tahoua',0,0),(2506,155,'Zinder',0,0),(2507,155,'Niamey',0,0),(2508,156,'Lagos',0,0),(2509,156,'Federal Capital Territory',0,0),(2510,156,'Ogun',0,0),(2511,156,'Akwa Ibom',0,0),(2512,156,'Cross River',0,0),(2513,156,'Kaduna',0,0),(2514,156,'Katsina',0,0),(2515,156,'Anambra',0,0),(2516,156,'Benue',0,0),(2517,156,'Borno',0,0),(2518,156,'Imo',0,0),(2519,156,'Kano',0,0),(2520,156,'Kwara',0,0),(2521,156,'Niger',0,0),(2522,156,'Oyo',0,0),(2523,156,'Adamawa',0,0),(2524,156,'Delta',0,0),(2525,156,'Edo',0,0),(2526,156,'Jigawa',0,0),(2527,156,'Kebbi',0,0),(2528,156,'Kogi',0,0),(2529,156,'Osun',0,0),(2530,156,'Taraba',0,0),(2531,156,'Yobe',0,0),(2532,156,'Abia',0,0),(2533,156,'Bauchi',0,0),(2534,156,'Enugu',0,0),(2535,156,'Ondo',0,0),(2536,156,'Plateau',0,0),(2537,156,'Rivers',0,0),(2538,156,'Sokoto',0,0),(2539,156,'Bayelsa',0,0),(2540,156,'Ebonyi',0,0),(2541,156,'Ekiti',0,0),(2542,156,'Gombe',0,0),(2543,156,'Nassarawa',0,0),(2544,156,'Zamfara',0,0),(2545,154,'Boaco',0,0),(2546,154,'Carazo',0,0),(2547,154,'Chinandega',0,0),(2548,154,'Chontales',0,0),(2549,154,'Esteli',0,0),(2550,154,'Granada',0,0),(2551,154,'Jinotega',0,0),(2552,154,'Leon',0,0),(2553,154,'Madriz',0,0),(2554,154,'Managua',0,0),(2555,154,'Masaya',0,0),(2556,154,'Matagalpa',0,0),(2557,154,'Nueva Segovia',0,0),(2558,154,'Rio San Juan',0,0),(2559,154,'Rivas',0,0),(2560,154,'Zelaya',0,0),(2561,154,'Autonoma Atlantico Norte',0,0),(2562,154,'Region Autonoma Atlantico Sur',0,0),(2563,150,'Drenthe',0,0),(2564,150,'Friesland',0,0),(2565,150,'Gelderland',0,0),(2566,150,'Groningen',0,0),(2567,150,'Limburg',0,0),(2568,150,'Noord-Brabant',0,0),(2569,150,'Noord-Holland',0,0),(2570,150,'Utrecht',0,0),(2571,150,'Zeeland',0,0),(2572,150,'Zuid-Holland',0,0),(2573,150,'Overijssel',0,0),(2574,150,'Flevoland',0,0),(2575,160,'Akershus',0,0),(2576,160,'Aust-Agder',0,0),(2577,160,'Buskerud',0,0),(2578,160,'Finnmark',0,0),(2579,160,'Hedmark',0,0),(2580,160,'Hordaland',0,0),(2581,160,'More og Romsdal',0,0),(2582,160,'Nordland',0,0),(2583,160,'Nord-Trondelag',0,0),(2584,160,'Oppland',0,0),(2585,160,'Oslo',0,0),(2586,160,'Ostfold',0,0),(2587,160,'Rogaland',0,0),(2588,160,'Sogn og Fjordane',0,0),(2589,160,'Sor-Trondelag',0,0),(2590,160,'Telemark',0,0),(2591,160,'Troms',0,0),(2592,160,'Vest-Agder',0,0),(2593,160,'Vestfold',0,0),(2594,149,'Bagmati',0,0),(2595,149,'Bheri',0,0),(2596,149,'Dhawalagiri',0,0),(2597,149,'Gandaki',0,0),(2598,149,'Janakpur',0,0),(2599,149,'Karnali',0,0),(2600,149,'Kosi',0,0),(2601,149,'Lumbini',0,0),(2602,149,'Mahakali',0,0),(2603,149,'Mechi',0,0),(2604,149,'Narayani',0,0),(2605,149,'Rapti',0,0),(2606,149,'Sagarmatha',0,0),(2607,149,'Seti',0,0),(2608,148,'Aiwo',0,0),(2609,148,'Anabar',0,0),(2610,148,'Anetan',0,0),(2611,148,'Anibare',0,0),(2612,148,'Baiti',0,0),(2613,148,'Boe',0,0),(2614,148,'Buada',0,0),(2615,148,'Denigomodu',0,0),(2616,148,'Ewa',0,0),(2617,148,'Ijuw',0,0),(2618,148,'Meneng',0,0),(2619,148,'Nibok',0,0),(2620,148,'Uaboe',0,0),(2621,148,'Yaren',0,0),(2622,153,'Chatham Islands',0,0),(2623,153,'Auckland',0,0),(2624,153,'Bay of Plenty',0,0),(2625,153,'Canterbury',0,0),(2626,153,'Gisborne',0,0),(2627,153,'Hawke\'s Bay',0,0),(2628,153,'Manawatu-Wanganui',0,0),(2629,153,'Marlborough',0,0),(2630,153,'Nelson',0,0),(2631,153,'Northland',0,0),(2632,153,'Otago',0,0),(2633,153,'Southland',0,0),(2634,153,'Taranaki',0,0),(2635,153,'Waikato',0,0),(2636,153,'Wellington',0,0),(2637,153,'West Coast',0,0),(2638,161,'Ad Dakhiliyah',0,0),(2639,161,'Al Batinah',0,0),(2640,161,'Al Wusta',0,0),(2641,161,'Ash Sharqiyah',0,0),(2642,161,'Az Zahirah',0,0),(2643,161,'Masqat',0,0),(2644,161,'Musandam',0,0),(2645,161,'Zufar',0,0),(2646,164,'Bocas del Toro',0,0),(2647,164,'Chiriqui',0,0),(2648,164,'Cocle',0,0),(2649,164,'Colon',0,0),(2650,164,'Darien',0,0),(2651,164,'Herrera',0,0),(2652,164,'Los Santos',0,0),(2653,164,'Panama',0,0),(2654,164,'San Blas',0,0),(2655,164,'Veraguas',0,0),(2656,167,'Amazonas',0,0),(2657,167,'Ancash',0,0),(2658,167,'Apurimac',0,0),(2659,167,'Arequipa',0,0),(2660,167,'Ayacucho',0,0),(2661,167,'Cajamarca',0,0),(2662,167,'Callao',0,0),(2663,167,'Cusco',0,0),(2664,167,'Huancavelica',0,0),(2665,167,'Huanuco',0,0),(2666,167,'Ica',0,0),(2667,167,'Junin',0,0),(2668,167,'La Libertad',0,0),(2669,167,'Lambayeque',0,0),(2670,167,'Lima',0,0),(2671,167,'Loreto',0,0),(2672,167,'Madre de Dios',0,0),(2673,167,'Moquegua',0,0),(2674,167,'Pasco',0,0),(2675,167,'Piura',0,0),(2676,167,'Puno',0,0),(2677,167,'San Martin',0,0),(2678,167,'Tacna',0,0),(2679,167,'Tumbes',0,0),(2680,167,'Ucayali',0,0),(2681,165,'Central',0,0),(2682,165,'Gulf',0,0),(2683,165,'Milne Bay',0,0),(2684,165,'Northern',0,0),(2685,165,'Southern Highlands',0,0),(2686,165,'Western',0,0),(2687,165,'North Solomons',0,0),(2688,165,'Chimbu',0,0),(2689,165,'Eastern Highlands',0,0),(2690,165,'East New Britain',0,0),(2691,165,'East Sepik',0,0),(2692,165,'Madang',0,0),(2693,165,'Manus',0,0),(2694,165,'Morobe',0,0),(2695,165,'New Ireland',0,0),(2696,165,'Western Highlands',0,0),(2697,165,'West New Britain',0,0),(2698,165,'Sandaun',0,0),(2699,165,'Enga',0,0),(2700,165,'National Capital',0,0),(2701,168,'Abra',0,0),(2702,168,'Agusan del Norte',0,0),(2703,168,'Agusan del Sur',0,0),(2704,168,'Aklan',0,0),(2705,168,'Albay',0,0),(2706,168,'Antique',0,0),(2707,168,'Bataan',0,0),(2708,168,'Batanes',0,0),(2709,168,'Batangas',0,0),(2710,168,'Benguet',0,0),(2711,168,'Bohol',0,0),(2712,168,'Bukidnon',0,0),(2713,168,'Bulacan',0,0),(2714,168,'Cagayan',0,0),(2715,168,'Camarines Norte',0,0),(2716,168,'Camarines Sur',0,0),(2717,168,'Camiguin',0,0),(2718,168,'Capiz',0,0),(2719,168,'Catanduanes',0,0),(2720,168,'Cavite',0,0),(2721,168,'Cebu',0,0),(2722,168,'Basilan',0,0),(2723,168,'Eastern Samar',0,0),(2724,168,'Davao',0,0),(2725,168,'Davao del Sur',0,0),(2726,168,'Davao Oriental',0,0),(2727,168,'Ifugao',0,0),(2728,168,'Ilocos Norte',0,0),(2729,168,'Ilocos Sur',0,0),(2730,168,'Iloilo',0,0),(2731,168,'Isabela',0,0),(2732,168,'Kalinga-Apayao',0,0),(2733,168,'Laguna',0,0),(2734,168,'Lanao del Norte',0,0),(2735,168,'Lanao del Sur',0,0),(2736,168,'La Union',0,0),(2737,168,'Leyte',0,0),(2738,168,'Marinduque',0,0),(2739,168,'Masbate',0,0),(2740,168,'Mindoro Occidental',0,0),(2741,168,'Mindoro Oriental',0,0),(2742,168,'Misamis Occidental',0,0),(2743,168,'Misamis Oriental',0,0),(2744,168,'Mountain',0,0),(2745,168,'Negros Occidental',0,0),(2746,168,'Negros Oriental',0,0),(2747,168,'Nueva Ecija',0,0),(2748,168,'Nueva Vizcaya',0,0),(2749,168,'Palawan',0,0),(2750,168,'Pampanga',0,0),(2751,168,'Pangasinan',0,0),(2752,168,'Rizal',0,0),(2753,168,'Romblon',0,0),(2754,168,'Samar',0,0),(2755,168,'Maguindanao',0,0),(2756,168,'North Cotabato',0,0),(2757,168,'Sorsogon',0,0),(2758,168,'Southern Leyte',0,0),(2759,168,'Sulu',0,0),(2760,168,'Surigao del Norte',0,0),(2761,168,'Surigao del Sur',0,0),(2762,168,'Tarlac',0,0),(2763,168,'Zambales',0,0),(2764,168,'Zamboanga del Norte',0,0),(2765,168,'Zamboanga del Sur',0,0),(2766,168,'Northern Samar',0,0),(2767,168,'Quirino',0,0),(2768,168,'Siquijor',0,0),(2769,168,'South Cotabato',0,0),(2770,168,'Sultan Kudarat',0,0),(2771,168,'Tawitawi',0,0),(2772,168,'Angeles',0,0),(2773,168,'Bacolod',0,0),(2774,168,'Bago',0,0),(2775,168,'Baguio',0,0),(2776,168,'Bais',0,0),(2777,168,'Basilan City',0,0),(2778,168,'Batangas City',0,0),(2779,168,'Butuan',0,0),(2780,168,'Cabanatuan',0,0),(2781,168,'Cadiz',0,0),(2782,168,'Cagayan de Oro',0,0),(2783,168,'Calbayog',0,0),(2784,168,'Caloocan',0,0),(2785,168,'Canlaon',0,0),(2786,168,'Cavite City',0,0),(2787,168,'Cebu City',0,0),(2788,168,'Cotabato',0,0),(2789,168,'Dagupan',0,0),(2790,168,'Danao',0,0),(2791,168,'Dapitan',0,0),(2792,168,'Davao City',0,0),(2793,168,'Dipolog',0,0),(2794,168,'Dumaguete',0,0),(2795,168,'General Santos',0,0),(2796,168,'Gingoog',0,0),(2797,168,'Iligan',0,0),(2798,168,'Iloilo City',0,0),(2799,168,'Iriga',0,0),(2800,168,'La Carlota',0,0),(2801,168,'Laoag',0,0),(2802,168,'Lapu-Lapu',0,0),(2803,168,'Legaspi',0,0),(2804,168,'Lipa',0,0),(2805,168,'Lucena',0,0),(2806,168,'Mandaue',0,0),(2807,168,'Manila',0,0),(2808,168,'Marawi',0,0),(2809,168,'Naga',0,0),(2810,168,'Olongapo',0,0),(2811,168,'Ormoc',0,0),(2812,168,'Oroquieta',0,0),(2813,168,'Ozamis',0,0),(2814,168,'Pagadian',0,0),(2815,168,'Palayan',0,0),(2816,168,'Pasay',0,0),(2817,168,'Puerto Princesa',0,0),(2818,168,'Quezon City',0,0),(2819,168,'Roxas',0,0),(2820,168,'San Carlos',0,0),(2821,168,'San Carlos',0,0),(2822,168,'San Jose',0,0),(2823,168,'San Pablo',0,0),(2824,168,'Silay',0,0),(2825,168,'Surigao',0,0),(2826,168,'Tacloban',0,0),(2827,168,'Tagaytay',0,0),(2828,168,'Tagbilaran',0,0),(2829,168,'Tangub',0,0),(2830,168,'Toledo',0,0),(2831,168,'Trece Martires',0,0),(2832,168,'Zamboanga',0,0),(2833,168,'Aurora',0,0),(2834,168,'Quezon',0,0),(2835,168,'Negros Occidental',0,0),(2836,168,'Compostela Valley',0,0),(2837,168,'Davao del Norte',0,0),(2838,168,'Himamaylan',0,0),(2839,168,'Kalinga',0,0),(2840,168,'Malaybalay',0,0),(2841,168,'Passi',0,0),(2842,168,'Zambales',0,0),(2843,168,'San Jose del Monte',0,0),(2844,168,'San Juan',0,0),(2845,168,'Santiago',0,0),(2846,168,'Sarangani',0,0),(2847,168,'Sipalay',0,0),(2848,168,'Surigao del Norte',0,0),(2849,168,'Zamboanga',0,0),(2850,162,'Federally Administered Tribal Areas',0,0),(2851,162,'Balochistan',0,0),(2852,162,'North-West Frontier',0,0),(2853,162,'Punjab',0,0),(2854,162,'Sindh',0,0),(2855,162,'Azad Kashmir',0,0),(2856,162,'Northern Areas',0,0),(2857,162,'Islamabad',0,0),(2858,170,'Dolnoslaskie',0,0),(2859,170,'Kujawsko-Pomorskie',0,0),(2860,170,'Lodzkie',0,0),(2861,170,'Lubelskie',0,0),(2862,170,'Lubuskie',0,0),(2863,170,'Malopolskie',0,0),(2864,170,'Mazowieckie',0,0),(2865,170,'Opolskie',0,0),(2866,170,'Podkarpackie',0,0),(2867,170,'Podlaskie',0,0),(2868,170,'Pomorskie',0,0),(2869,170,'Slaskie',0,0),(2870,170,'Swietokrzyskie',0,0),(2871,170,'Warminsko-Mazurskie',0,0),(2872,170,'Wielkopolskie',0,0),(2873,170,'Zachodniopomorskie',0,0),(2874,248,'Gaza',0,0),(2875,248,'West Bank',0,0),(2876,171,'Aveiro',0,0),(2877,171,'Beja',0,0),(2878,171,'Braga',0,0),(2879,171,'Braganca',0,0),(2880,171,'Castelo Branco',0,0),(2881,171,'Coimbra',0,0),(2882,171,'Evora',0,0),(2883,171,'Faro',0,0),(2884,171,'Madeira',0,0),(2885,171,'Guarda',0,0),(2886,171,'Leiria',0,0),(2887,171,'Lisboa',0,0),(2888,171,'Portalegre',0,0),(2889,171,'Porto',0,0),(2890,171,'Santarem',0,0),(2891,171,'Setubal',0,0),(2892,171,'Viana do Castelo',0,0),(2893,171,'Vila Real',0,0),(2894,171,'Viseu',0,0),(2895,171,'Azores',0,0),(2896,166,'Alto Parana',0,0),(2897,166,'Amambay',0,0),(2898,166,'Boqueron',0,0),(2899,166,'Caaguazu',0,0),(2900,166,'Caazapa',0,0),(2901,166,'Central',0,0),(2902,166,'Concepcion',0,0),(2903,166,'Cordillera',0,0),(2904,166,'Guaira',0,0),(2905,166,'Itapua',0,0),(2906,166,'Misiones',0,0),(2907,166,'Neembucu',0,0),(2908,166,'Paraguari',0,0),(2909,166,'Presidente Hayes',0,0),(2910,166,'San Pedro',0,0),(2911,166,'Canindeyu',0,0),(2912,166,'Chaco',0,0),(2913,166,'Nueva Asuncion',0,0),(2914,166,'Alto Paraguay',0,0),(2915,166,'Boqueron',0,0),(2916,173,'Ad Dawhah',0,0),(2917,173,'Al Ghuwariyah',0,0),(2918,173,'Al Jumaliyah',0,0),(2919,173,'Al Khawr',0,0),(2920,173,'Al Wakrah Municipality',0,0),(2921,173,'Ar Rayyan',0,0),(2922,173,'Madinat ach Shamal',0,0),(2923,173,'Umm Salal',0,0),(2924,173,'Al Wakrah',0,0),(2925,173,'Jariyan al Batnah',0,0),(2926,173,'Umm Sa\'id',0,0),(2927,175,'Alba',0,0),(2928,175,'Arad',0,0),(2929,175,'Arges',0,0),(2930,175,'Bacau',0,0),(2931,175,'Bihor',0,0),(2932,175,'Bistrita-Nasaud',0,0),(2933,175,'Botosani',0,0),(2934,175,'Braila',0,0),(2935,175,'Brasov',0,0),(2936,175,'Bucuresti',0,0),(2937,175,'Buzau',0,0),(2938,175,'Caras-Severin',0,0),(2939,175,'Cluj',0,0),(2940,175,'Constanta',0,0),(2941,175,'Covasna',0,0),(2942,175,'Dambovita',0,0),(2943,175,'Dolj',0,0),(2944,175,'Galati',0,0),(2945,175,'Gorj',0,0),(2946,175,'Harghita',0,0),(2947,175,'Hunedoara',0,0),(2948,175,'Ialomita',0,0),(2949,175,'Iasi',0,0),(2950,175,'Maramures',0,0),(2951,175,'Mehedinti',0,0),(2952,175,'Mures',0,0),(2953,175,'Neamt',0,0),(2954,175,'Olt',0,0),(2955,175,'Prahova',0,0),(2956,175,'Salaj',0,0),(2957,175,'Satu Mare',0,0),(2958,175,'Sibiu',0,0),(2959,175,'Suceava',0,0),(2960,175,'Teleorman',0,0),(2961,175,'Timis',0,0),(2962,175,'Tulcea',0,0),(2963,175,'Vaslui',0,0),(2964,175,'Valcea',0,0),(2965,175,'Vrancea',0,0),(2966,175,'Calarasi',0,0),(2967,175,'Giurgiu',0,0),(2968,175,'Ilfov',0,0),(2969,245,'Kosovo',0,0),(2970,245,'Vojvodina',0,0),(2971,176,'Adygeya, Republic of',0,0),(2972,176,'Aginsky Buryatsky AO',0,0),(2973,176,'Gorno-Altay',0,0),(2974,176,'Altaisky krai',0,0),(2975,176,'Amur',0,0),(2976,176,'Arkhangel\'sk',0,0),(2977,176,'Astrakhan\'',0,0),(2978,176,'Bashkortostan',0,0),(2979,176,'Belgorod',0,0),(2980,176,'Bryansk',0,0),(2981,176,'Buryat',0,0),(2982,176,'Chechnya',0,0),(2983,176,'Chelyabinsk',0,0),(2984,176,'Chita',0,0),(2985,176,'Chukot',0,0),(2986,176,'Chuvashia',0,0),(2987,176,'Dagestan',0,0),(2988,176,'Evenk',0,0),(2989,176,'Ingush',0,0),(2990,176,'Irkutsk',0,0),(2991,176,'Ivanovo',0,0),(2992,176,'Kabardin-Balkar',0,0),(2993,176,'Kaliningrad',0,0),(2994,176,'Kalmyk',0,0),(2995,176,'Kaluga',0,0),(2996,176,'Kamchatka',0,0),(2997,176,'Karachay-Cherkess',0,0),(2998,176,'Karelia',0,0),(2999,176,'Kemerovo',0,0),(3000,176,'Khabarovsk',0,0),(3001,176,'Khakass',0,0),(3002,176,'Khanty-Mansiy',0,0),(3003,176,'Kirov',0,0),(3004,176,'Komi',0,0),(3005,176,'Koryak',0,0),(3006,176,'Kostroma',0,0),(3007,176,'Krasnodar',0,0),(3008,176,'Krasnoyarsk',0,0),(3009,176,'Kurgan',0,0),(3010,176,'Kursk',0,0),(3011,176,'Leningrad',0,0),(3012,176,'Lipetsk',0,0),(3013,176,'Magadan',0,0),(3014,176,'Mariy-El',0,0),(3015,176,'Mordovia',0,0),(3016,176,'Moskva',0,0),(3017,176,'Moscow City',0,0),(3018,176,'Murmansk',0,0),(3019,176,'Nenets',0,0),(3020,176,'Nizhegorod',0,0),(3021,176,'Novgorod',0,0),(3022,176,'Novosibirsk',0,0),(3023,176,'Omsk',0,0),(3024,176,'Orenburg',0,0),(3025,176,'Orel',0,0),(3026,176,'Penza',0,0),(3027,176,'Perm\'',0,0),(3028,176,'Primor\'ye',0,0),(3029,176,'Pskov',0,0),(3030,176,'Rostov',0,0),(3031,176,'Ryazan\'',0,0),(3032,176,'Sakha',0,0),(3033,176,'Sakhalin',0,0),(3034,176,'Samara',0,0),(3035,176,'Saint Petersburg City',0,0),(3036,176,'Saratov',0,0),(3037,176,'North Ossetia',0,0),(3038,176,'Smolensk',0,0),(3039,176,'Stavropol\'',0,0),(3040,176,'Sverdlovsk',0,0),(3041,176,'Tambovskaya oblast',0,0),(3042,176,'Tatarstan',0,0),(3043,176,'Taymyr',0,0),(3044,176,'Tomsk',0,0),(3045,176,'Tula',0,0),(3046,176,'Tver\'',0,0),(3047,176,'Tyumen\'',0,0),(3048,176,'Tuva',0,0),(3049,176,'Udmurt',0,0),(3050,176,'Ul\'yanovsk',0,0),(3051,176,'Vladimir',0,0),(3052,176,'Volgograd',0,0),(3053,176,'Vologda',0,0),(3054,176,'Voronezh',0,0),(3055,176,'Yamal-Nenets',0,0),(3056,176,'Yaroslavl\'',0,0),(3057,176,'Yevrey',0,0),(3058,176,'Permskiy Kray',0,0),(3059,176,'Krasnoyarskiy Kray',0,0),(3060,176,'Kamchatskiy Kray',0,0),(3061,176,'Zabaykal\'skiy Kray',0,0),(3062,177,'Butare',0,0),(3063,177,'Gitarama',0,0),(3064,177,'Kibungo',0,0),(3065,177,'Kigali',0,0),(3066,177,'Est',0,0),(3067,177,'Kigali',0,0),(3068,177,'Nord',0,0),(3069,177,'Ouest',0,0),(3070,177,'Sud',0,0),(3071,184,'Al Bahah',0,0),(3072,184,'Al Madinah',0,0),(3073,184,'Ash Sharqiyah',0,0),(3074,184,'Al Qasim',0,0),(3075,184,'Ar Riyad',0,0),(3076,184,'Asir Province',0,0),(3077,184,'Ha\'il',0,0),(3078,184,'Makkah',0,0),(3079,184,'Al Hudud ash Shamaliyah',0,0),(3080,184,'Najran',0,0),(3081,184,'Jizan',0,0),(3082,184,'Tabuk',0,0),(3083,184,'Al Jawf',0,0),(3084,191,'Malaita',0,0),(3085,191,'Guadalcanal',0,0),(3086,191,'Isabel',0,0),(3087,191,'Makira',0,0),(3088,191,'Temotu',0,0),(3089,191,'Central',0,0),(3090,191,'Western',0,0),(3091,191,'Choiseul',0,0),(3092,191,'Rennell and Bellona',0,0),(3093,186,'Anse aux Pins',0,0),(3094,186,'Anse Boileau',0,0),(3095,186,'Anse Etoile',0,0),(3096,186,'Anse Louis',0,0),(3097,186,'Anse Royale',0,0),(3098,186,'Baie Lazare',0,0),(3099,186,'Baie Sainte Anne',0,0),(3100,186,'Beau Vallon',0,0),(3101,186,'Bel Air',0,0),(3102,186,'Bel Ombre',0,0),(3103,186,'Cascade',0,0),(3104,186,'Glacis',0,0),(3105,186,'Grand\' Anse',0,0),(3106,186,'Grand\' Anse',0,0),(3107,186,'La Digue',0,0),(3108,186,'La Riviere Anglaise',0,0),(3109,186,'Mont Buxton',0,0),(3110,186,'Mont Fleuri',0,0),(3111,186,'Plaisance',0,0),(3112,186,'Pointe La Rue',0,0),(3113,186,'Port Glaud',0,0),(3114,186,'Saint Louis',0,0),(3115,186,'Takamaka',0,0),(3116,199,'Al Wusta',0,0),(3117,199,'Al Istiwa\'iyah',0,0),(3118,199,'Al Khartum',0,0),(3119,199,'Ash Shamaliyah',0,0),(3120,199,'Ash Sharqiyah',0,0),(3121,199,'Bahr al Ghazal',0,0),(3122,199,'Darfur',0,0),(3123,199,'Kurdufan',0,0),(3124,199,'Upper Nile',0,0),(3125,199,'Al Wahadah State',0,0),(3126,199,'Central Equatoria State',0,0),(3127,199,'Southern Darfur',0,0),(3128,199,'Southern Kordofan',0,0),(3129,199,'Kassala',0,0),(3130,199,'Northern Darfur',0,0),(3131,203,'Blekinge Lan',0,0),(3132,203,'Gavleborgs Lan',0,0),(3133,203,'Gotlands Lan',0,0),(3134,203,'Hallands Lan',0,0),(3135,203,'Jamtlands Lan',0,0),(3136,203,'Jonkopings Lan',0,0),(3137,203,'Kalmar Lan',0,0),(3138,203,'Dalarnas Lan',0,0),(3139,203,'Kronobergs Lan',0,0),(3140,203,'Norrbottens Lan',0,0),(3141,203,'Orebro Lan',0,0),(3142,203,'Ostergotlands Lan',0,0),(3143,203,'Sodermanlands Lan',0,0),(3144,203,'Uppsala Lan',0,0),(3145,203,'Varmlands Lan',0,0),(3146,203,'Vasterbottens Lan',0,0),(3147,203,'Vasternorrlands Lan',0,0),(3148,203,'Vastmanlands Lan',0,0),(3149,203,'Stockholms Lan',0,0),(3150,203,'Skane Lan',0,0),(3151,203,'Vastra Gotaland',0,0),(3152,197,'Ascension',0,0),(3153,197,'Saint Helena',0,0),(3154,197,'Tristan da Cunha',0,0),(3155,190,'Ajdovscina Commune',0,0),(3156,190,'Beltinci Commune',0,0),(3157,190,'Bled Commune',0,0),(3158,190,'Bohinj Commune',0,0),(3159,190,'Borovnica Commune',0,0),(3160,190,'Bovec Commune',0,0),(3161,190,'Brda Commune',0,0),(3162,190,'Brezice Commune',0,0),(3163,190,'Brezovica Commune',0,0),(3164,190,'Celje Commune',0,0),(3165,190,'Cerklje na Gorenjskem Commune',0,0),(3166,190,'Cerknica Commune',0,0),(3167,190,'Cerkno Commune',0,0),(3168,190,'Crensovci Commune',0,0),(3169,190,'Crna na Koroskem Commune',0,0),(3170,190,'Crnomelj Commune',0,0),(3171,190,'Divaca Commune',0,0),(3172,190,'Dobrepolje Commune',0,0),(3173,190,'Dol pri Ljubljani Commune',0,0),(3174,190,'Dornava Commune',0,0),(3175,190,'Dravograd Commune',0,0),(3176,190,'Duplek Commune',0,0),(3177,190,'Gorenja vas-Poljane Commune',0,0),(3178,190,'Gorisnica Commune',0,0),(3179,190,'Gornja Radgona Commune',0,0),(3180,190,'Gornji Grad Commune',0,0),(3181,190,'Gornji Petrovci Commune',0,0),(3182,190,'Grosuplje Commune',0,0),(3183,190,'Hrastnik Commune',0,0),(3184,190,'Hrpelje-Kozina Commune',0,0),(3185,190,'Idrija Commune',0,0),(3186,190,'Ig Commune',0,0),(3187,190,'Ilirska Bistrica Commune',0,0),(3188,190,'Ivancna Gorica Commune',0,0),(3189,190,'Izola-Isola Commune',0,0),(3190,190,'Jursinci Commune',0,0),(3191,190,'Kanal Commune',0,0),(3192,190,'Kidricevo Commune',0,0),(3193,190,'Kobarid Commune',0,0),(3194,190,'Kobilje Commune',0,0),(3195,190,'Komen Commune',0,0),(3196,190,'Koper-Capodistria Urban Commune',0,0),(3197,190,'Kozje Commune',0,0),(3198,190,'Kranj Commune',0,0),(3199,190,'Kranjska Gora Commune',0,0),(3200,190,'Krsko Commune',0,0),(3201,190,'Kungota Commune',0,0),(3202,190,'Lasko Commune',0,0),(3203,190,'Ljubljana Urban Commune',0,0),(3204,190,'Ljubno Commune',0,0),(3205,190,'Logatec Commune',0,0),(3206,190,'Loski Potok Commune',0,0),(3207,190,'Lukovica Commune',0,0),(3208,190,'Medvode Commune',0,0),(3209,190,'Menges Commune',0,0),(3210,190,'Metlika Commune',0,0),(3211,190,'Mezica Commune',0,0),(3212,190,'Mislinja Commune',0,0),(3213,190,'Moravce Commune',0,0),(3214,190,'Moravske Toplice Commune',0,0),(3215,190,'Mozirje Commune',0,0),(3216,190,'Murska Sobota Urban Commune',0,0),(3217,190,'Muta Commune',0,0),(3218,190,'Naklo Commune',0,0),(3219,190,'Nazarje Commune',0,0),(3220,190,'Nova Gorica Urban Commune',0,0),(3221,190,'Odranci Commune',0,0),(3222,190,'Ormoz Commune',0,0),(3223,190,'Osilnica Commune',0,0),(3224,190,'Pesnica Commune',0,0),(3225,190,'Pivka Commune',0,0),(3226,190,'Podcetrtek Commune',0,0),(3227,190,'Postojna Commune',0,0),(3228,190,'Puconci Commune',0,0),(3229,190,'Race-Fram Commune',0,0),(3230,190,'Radece Commune',0,0),(3231,190,'Radenci Commune',0,0),(3232,190,'Radlje ob Dravi Commune',0,0),(3233,190,'Radovljica Commune',0,0),(3234,190,'Rogasovci Commune',0,0),(3235,190,'Rogaska Slatina Commune',0,0),(3236,190,'Rogatec Commune',0,0),(3237,190,'Semic Commune',0,0),(3238,190,'Sencur Commune',0,0),(3239,190,'Sentilj Commune',0,0),(3240,190,'Sentjernej Commune',0,0),(3241,190,'Sevnica Commune',0,0),(3242,190,'Sezana Commune',0,0),(3243,190,'Skocjan Commune',0,0),(3244,190,'Skofja Loka Commune',0,0),(3245,190,'Skofljica Commune',0,0),(3246,190,'Slovenj Gradec Urban Commune',0,0),(3247,190,'Slovenske Konjice Commune',0,0),(3248,190,'Smarje pri Jelsah Commune',0,0),(3249,190,'Smartno ob Paki Commune',0,0),(3250,190,'Sostanj Commune',0,0),(3251,190,'Starse Commune',0,0),(3252,190,'Store Commune',0,0),(3253,190,'Sveti Jurij Commune',0,0),(3254,190,'Tolmin Commune',0,0),(3255,190,'Trbovlje Commune',0,0),(3256,190,'Trebnje Commune',0,0),(3257,190,'Trzic Commune',0,0),(3258,190,'Turnisce Commune',0,0),(3259,190,'Velenje Urban Commune',0,0),(3260,190,'Velike Lasce Commune',0,0),(3261,190,'Vipava Commune',0,0),(3262,190,'Vitanje Commune',0,0),(3263,190,'Vodice Commune',0,0),(3264,190,'Vrhnika Commune',0,0),(3265,190,'Vuzenica Commune',0,0),(3266,190,'Zagorje ob Savi Commune',0,0),(3267,190,'Zavrc Commune',0,0),(3268,190,'Zelezniki Commune',0,0),(3269,190,'Ziri Commune',0,0),(3270,190,'Zrece Commune',0,0),(3271,190,'Benedikt Commune',0,0),(3272,190,'Bistrica ob Sotli Commune',0,0),(3273,190,'Bloke Commune',0,0),(3274,190,'Braslovce Commune',0,0),(3275,190,'Cankova Commune',0,0),(3276,190,'Cerkvenjak Commune',0,0),(3277,190,'Destrnik Commune',0,0),(3278,190,'Dobje Commune',0,0),(3279,190,'Dobrna Commune',0,0),(3280,190,'Dobrova-Horjul-Polhov Gradec Commune',0,0),(3281,190,'Dobrovnik-Dobronak Commune',0,0),(3282,190,'Dolenjske Toplice Commune',0,0),(3283,190,'Domzale Commune',0,0),(3284,190,'Grad Commune',0,0),(3285,190,'Hajdina Commune',0,0),(3286,190,'Hoce-Slivnica Commune',0,0),(3287,190,'Hodos-Hodos Commune',0,0),(3288,190,'Horjul Commune',0,0),(3289,190,'Jesenice Commune',0,0),(3290,190,'Jezersko Commune',0,0),(3291,190,'Kamnik Commune',0,0),(3292,190,'Kocevje Commune',0,0),(3293,190,'Komenda Commune',0,0),(3294,190,'Kostel Commune',0,0),(3295,190,'Krizevci Commune',0,0),(3296,190,'Kuzma Commune',0,0),(3297,190,'Lenart Commune',0,0),(3298,190,'Lendava-Lendva Commune',0,0),(3299,190,'Litija Commune',0,0),(3300,190,'Ljutomer Commune',0,0),(3301,190,'Loska Dolina Commune',0,0),(3302,190,'Lovrenc na Pohorju Commune',0,0),(3303,190,'Luce Commune',0,0),(3304,190,'Majsperk Commune',0,0),(3305,190,'Maribor Commune',0,0),(3306,190,'Markovci Commune',0,0),(3307,190,'Miklavz na Dravskem polju Commune',0,0),(3308,190,'Miren-Kostanjevica Commune',0,0),(3309,190,'Mirna Pec Commune',0,0),(3310,190,'Novo mesto Urban Commune',0,0),(3311,190,'Oplotnica Commune',0,0),(3312,190,'Piran-Pirano Commune',0,0),(3313,190,'Podlehnik Commune',0,0),(3314,190,'Podvelka Commune',0,0),(3315,190,'Polzela Commune',0,0),(3316,190,'Prebold Commune',0,0),(3317,190,'Preddvor Commune',0,0),(3318,190,'Prevalje Commune',0,0),(3319,190,'Ptuj Urban Commune',0,0),(3320,190,'Ravne na Koroskem Commune',0,0),(3321,190,'Razkrizje Commune',0,0),(3322,190,'Ribnica Commune',0,0),(3323,190,'Ribnica na Pohorju Commune',0,0),(3324,190,'Ruse Commune',0,0),(3325,190,'Salovci Commune',0,0),(3326,190,'Selnica ob Dravi Commune',0,0),(3327,190,'Sempeter-Vrtojba Commune',0,0),(3328,190,'Sentjur pri Celju Commune',0,0),(3329,190,'Slovenska Bistrica Commune',0,0),(3330,190,'Smartno pri Litiji Commune',0,0),(3331,190,'Sodrazica Commune',0,0),(3332,190,'Solcava Commune',0,0),(3333,190,'Sveta Ana Commune',0,0),(3334,190,'Sveti Andraz v Slovenskih goricah Commune',0,0),(3335,190,'Tabor Commune',0,0),(3336,190,'Tisina Commune',0,0),(3337,190,'Trnovska vas Commune',0,0),(3338,190,'Trzin Commune',0,0),(3339,190,'Velika Polana Commune',0,0),(3340,190,'Verzej Commune',0,0),(3341,190,'Videm Commune',0,0),(3342,190,'Vojnik Commune',0,0),(3343,190,'Vransko Commune',0,0),(3344,190,'Zalec Commune',0,0),(3345,190,'Zetale Commune',0,0),(3346,190,'Zirovnica Commune',0,0),(3347,190,'Zuzemberk Commune',0,0),(3348,190,'Apace Commune',0,0),(3349,190,'Cirkulane Commune',0,0),(3350,189,'Banska Bystrica',0,0),(3351,189,'Bratislava',0,0),(3352,189,'Kosice',0,0),(3353,189,'Nitra',0,0),(3354,189,'Presov',0,0),(3355,189,'Trencin',0,0),(3356,189,'Trnava',0,0),(3357,189,'Zilina',0,0),(3358,187,'Eastern',0,0),(3359,187,'Northern',0,0),(3360,187,'Southern',0,0),(3361,187,'Western Area',0,0),(3362,182,'Acquaviva',0,0),(3363,182,'Chiesanuova',0,0),(3364,182,'Domagnano',0,0),(3365,182,'Faetano',0,0),(3366,182,'Fiorentino',0,0),(3367,182,'Borgo Maggiore',0,0),(3368,182,'San Marino',0,0),(3369,182,'Monte Giardino',0,0),(3370,182,'Serravalle',0,0),(3371,185,'Dakar',0,0),(3372,185,'Diourbel',0,0),(3373,185,'Tambacounda',0,0),(3374,185,'Thies',0,0),(3375,185,'Fatick',0,0),(3376,185,'Kaolack',0,0),(3377,185,'Kolda',0,0),(3378,185,'Ziguinchor',0,0),(3379,185,'Louga',0,0),(3380,185,'Saint-Louis',0,0),(3381,185,'Matam',0,0),(3382,192,'Bakool',0,0),(3383,192,'Banaadir',0,0),(3384,192,'Bari',0,0),(3385,192,'Bay',0,0),(3386,192,'Galguduud',0,0),(3387,192,'Gedo',0,0),(3388,192,'Hiiraan',0,0),(3389,192,'Jubbada Dhexe',0,0),(3390,192,'Jubbada Hoose',0,0),(3391,192,'Mudug',0,0),(3392,192,'Nugaal',0,0),(3393,192,'Sanaag',0,0),(3394,192,'Shabeellaha Dhexe',0,0),(3395,192,'Shabeellaha Hoose',0,0),(3396,192,'Woqooyi Galbeed',0,0),(3397,192,'Nugaal',0,0),(3398,192,'Togdheer',0,0),(3399,192,'Woqooyi Galbeed',0,0),(3400,192,'Awdal',0,0),(3401,192,'Sool',0,0),(3402,200,'Brokopondo',0,0),(3403,200,'Commewijne',0,0),(3404,200,'Coronie',0,0),(3405,200,'Marowijne',0,0),(3406,200,'Nickerie',0,0),(3407,200,'Para',0,0),(3408,200,'Paramaribo',0,0),(3409,200,'Saramacca',0,0),(3410,200,'Sipaliwini',0,0),(3411,200,'Wanica',0,0),(3422,183,'Principe',0,0),(3423,183,'Sao Tome',0,0),(3424,64,'Ahuachapan',0,0),(3425,64,'Cabanas',0,0),(3426,64,'Chalatenango',0,0),(3427,64,'Cuscatlan',0,0),(3428,64,'La Libertad',0,0),(3429,64,'La Paz',0,0),(3430,64,'La Union',0,0),(3431,64,'Morazan',0,0),(3432,64,'San Miguel',0,0),(3433,64,'San Salvador',0,0),(3434,64,'Santa Ana',0,0),(3435,64,'San Vicente',0,0),(3436,64,'Sonsonate',0,0),(3437,64,'Usulutan',0,0),(3438,205,'Al Hasakah',0,0),(3439,205,'Al Ladhiqiyah',0,0),(3440,205,'Al Qunaytirah',0,0),(3441,205,'Ar Raqqah',0,0),(3442,205,'As Suwayda\'',0,0),(3443,205,'Dar',0,0),(3444,205,'Dayr az Zawr',0,0),(3445,205,'Rif Dimashq',0,0),(3446,205,'Halab',0,0),(3447,205,'Hamah',0,0),(3448,205,'Hims',0,0),(3449,205,'Idlib',0,0),(3450,205,'Dimashq',0,0),(3451,205,'Tartus',0,0),(3452,202,'Hhohho',0,0),(3453,202,'Lubombo',0,0),(3454,202,'Manzini',0,0),(3455,202,'Shiselweni',0,0),(3456,202,'Praslin',0,0),(3457,42,'Batha',0,0),(3458,42,'Biltine',0,0),(3459,42,'Borkou-Ennedi-Tibesti',0,0),(3460,42,'Chari-Baguirmi',0,0),(3461,42,'Guera',0,0),(3462,42,'Kanem',0,0),(3463,42,'Lac',0,0),(3464,42,'Logone Occidental',0,0),(3465,42,'Logone Oriental',0,0),(3466,42,'Mayo-Kebbi',0,0),(3467,42,'Moyen-Chari',0,0),(3468,42,'Ouaddai',0,0),(3469,42,'Salamat',0,0),(3470,42,'Tandjile',0,0),(3471,210,'Centrale',0,0),(3472,210,'Kara',0,0),(3473,210,'Maritime',0,0),(3474,210,'Plateaux',0,0),(3475,210,'Savanes',0,0),(3476,209,'Mae Hong Son',0,0),(3477,209,'Chiang Mai',0,0),(3478,209,'Chiang Rai',0,0),(3479,209,'Nan',0,0),(3480,209,'Lamphun',0,0),(3481,209,'Lampang',0,0),(3482,209,'Phrae',0,0),(3483,209,'Tak',0,0),(3484,209,'Sukhothai',0,0),(3485,209,'Uttaradit',0,0),(3486,209,'Kamphaeng Phet',0,0),(3487,209,'Phitsanulok',0,0),(3488,209,'Phichit',0,0),(3489,209,'Phetchabun',0,0),(3490,209,'Uthai Thani',0,0),(3491,209,'Nakhon Sawan',0,0),(3492,209,'Nong Khai',0,0),(3493,209,'Loei',0,0),(3494,209,'Sakon Nakhon',0,0),(3495,209,'Nakhon Phanom',0,0),(3496,209,'Khon Kaen',0,0),(3497,209,'Kalasin',0,0),(3498,209,'Maha Sarakham',0,0),(3499,209,'Roi Et',0,0),(3500,209,'Chaiyaphum',0,0),(3501,209,'Nakhon Ratchasima',0,0),(3502,209,'Buriram',0,0),(3503,209,'Surin',0,0),(3504,209,'Sisaket',0,0),(3505,209,'Narathiwat',0,0),(3506,209,'Chai Nat',0,0),(3507,209,'Sing Buri',0,0),(3508,209,'Lop Buri',0,0),(3509,209,'Ang Thong',0,0),(3510,209,'Phra Nakhon Si Ayutthaya',0,0),(3511,209,'Saraburi',0,0),(3512,209,'Nonthaburi',0,0),(3513,209,'Pathum Thani',0,0),(3514,209,'Krung Thep',0,0),(3515,209,'Phayao',0,0),(3516,209,'Samut Prakan',0,0),(3517,209,'Nakhon Nayok',0,0),(3518,209,'Chachoengsao',0,0),(3519,209,'Prachin Buri',0,0),(3520,209,'Chon Buri',0,0),(3521,209,'Rayong',0,0),(3522,209,'Chanthaburi',0,0),(3523,209,'Trat',0,0),(3524,209,'Kanchanaburi',0,0),(3525,209,'Suphan Buri',0,0),(3526,209,'Ratchaburi',0,0),(3527,209,'Nakhon Pathom',0,0),(3528,209,'Samut Songkhram',0,0),(3529,209,'Samut Sakhon',0,0),(3530,209,'Phetchaburi',0,0),(3531,209,'Prachuap Khiri Khan',0,0),(3532,209,'Chumphon',0,0),(3533,209,'Ranong',0,0),(3534,209,'Surat Thani',0,0),(3535,209,'Phangnga',0,0),(3536,209,'Phuket',0,0),(3537,209,'Krabi',0,0),(3538,209,'Nakhon Si Thammarat',0,0),(3539,209,'Trang',0,0),(3540,209,'Phatthalung',0,0),(3541,209,'Satun',0,0),(3542,209,'Songkhla',0,0),(3543,209,'Pattani',0,0),(3544,209,'Yala',0,0),(3545,209,'Ubon Ratchathani',0,0),(3546,209,'Yasothon',0,0),(3547,209,'Nakhon Phanom',0,0),(3548,209,'Prachin Buri',0,0),(3549,209,'Ubon Ratchathani',0,0),(3550,209,'Udon Thani',0,0),(3551,209,'Amnat Charoen',0,0),(3552,209,'Mukdahan',0,0),(3553,209,'Nong Bua Lamphu',0,0),(3554,209,'Sa Kaeo',0,0),(3555,209,'Bueng Kan',0,0),(3556,207,'Kuhistoni Badakhshon',0,0),(3557,207,'Khatlon',0,0),(3558,207,'Sughd',0,0),(3560,216,'Ahal',0,0),(3561,216,'Balkan',0,0),(3562,216,'Dashoguz',0,0),(3563,216,'Lebap',0,0),(3564,216,'Mary',0,0),(3565,214,'Kasserine',0,0),(3566,214,'Kairouan',0,0),(3567,214,'Jendouba',0,0),(3568,214,'Qafsah',0,0),(3569,214,'El Kef',0,0),(3570,214,'Al Mahdia',0,0),(3571,214,'Al Munastir',0,0),(3572,214,'Bajah',0,0),(3573,214,'Bizerte',0,0),(3574,214,'Nabeul',0,0),(3575,214,'Siliana',0,0),(3576,214,'Sousse',0,0),(3577,214,'Ben Arous',0,0),(3578,214,'Madanin',0,0),(3579,214,'Gabes',0,0),(3580,214,'Kebili',0,0),(3581,214,'Sfax',0,0),(3582,214,'Sidi Bou Zid',0,0),(3583,214,'Tataouine',0,0),(3584,214,'Tozeur',0,0),(3585,214,'Tunis',0,0),(3586,214,'Zaghouan',0,0),(3587,214,'Aiana',0,0),(3588,214,'Manouba',0,0),(3589,212,'Ha',0,0),(3590,212,'Tongatapu',0,0),(3591,212,'Vava',0,0),(3592,215,'Adiyaman',0,0),(3593,215,'Afyonkarahisar',0,0),(3594,215,'Agri',0,0),(3595,215,'Amasya',0,0),(3596,215,'Antalya',0,0),(3597,215,'Artvin',0,0),(3598,215,'Aydin',0,0),(3599,215,'Balikesir',0,0),(3600,215,'Bilecik',0,0),(3601,215,'Bingol',0,0),(3602,215,'Bitlis',0,0),(3603,215,'Bolu',0,0),(3604,215,'Burdur',0,0),(3605,215,'Bursa',0,0),(3606,215,'Canakkale',0,0),(3607,215,'Corum',0,0),(3608,215,'Denizli',0,0),(3609,215,'Diyarbakir',0,0),(3610,215,'Edirne',0,0),(3611,215,'Elazig',0,0),(3612,215,'Erzincan',0,0),(3613,215,'Erzurum',0,0),(3614,215,'Eskisehir',0,0),(3615,215,'Giresun',0,0),(3616,215,'Hatay',0,0),(3617,215,'Mersin',0,0),(3618,215,'Isparta',0,0),(3619,215,'Istanbul',0,0),(3620,215,'Izmir',0,0),(3621,215,'Kastamonu',0,0),(3622,215,'Kayseri',0,0),(3623,215,'Kirklareli',0,0),(3624,215,'Kirsehir',0,0),(3625,215,'Kocaeli',0,0),(3626,215,'Kutahya',0,0),(3627,215,'Malatya',0,0),(3628,215,'Manisa',0,0),(3629,215,'Kahramanmaras',0,0),(3630,215,'Mugla',0,0),(3631,215,'Mus',0,0),(3632,215,'Nevsehir',0,0),(3633,215,'Ordu',0,0),(3634,215,'Rize',0,0),(3635,215,'Sakarya',0,0),(3636,215,'Samsun',0,0),(3637,215,'Sinop',0,0),(3638,215,'Sivas',0,0),(3639,215,'Tekirdag',0,0),(3640,215,'Tokat',0,0),(3641,215,'Trabzon',0,0),(3642,215,'Tunceli',0,0),(3643,215,'Sanliurfa',0,0),(3644,215,'Usak',0,0),(3645,215,'Van',0,0),(3646,215,'Yozgat',0,0),(3647,215,'Ankara',0,0),(3648,215,'Gumushane',0,0),(3649,215,'Hakkari',0,0),(3650,215,'Konya',0,0),(3651,215,'Mardin',0,0),(3652,215,'Nigde',0,0),(3653,215,'Siirt',0,0),(3654,215,'Aksaray',0,0),(3655,215,'Batman',0,0),(3656,215,'Bayburt',0,0),(3657,215,'Karaman',0,0),(3658,215,'Kirikkale',0,0),(3659,215,'Sirnak',0,0),(3660,215,'Adana',0,0),(3661,215,'Cankiri',0,0),(3662,215,'Gaziantep',0,0),(3663,215,'Kars',0,0),(3664,215,'Zonguldak',0,0),(3665,215,'Ardahan',0,0),(3666,215,'Bartin',0,0),(3667,215,'Igdir',0,0),(3668,215,'Karabuk',0,0),(3669,215,'Kilis',0,0),(3670,215,'Osmaniye',0,0),(3671,215,'Yalova',0,0),(3672,215,'Duzce',0,0),(3673,213,'Arima',0,0),(3674,213,'Caroni',0,0),(3675,213,'Mayaro',0,0),(3676,213,'Nariva',0,0),(3677,213,'Port-of-Spain',0,0),(3678,213,'Saint Andrew',0,0),(3679,213,'Saint David',0,0),(3680,213,'Saint George',0,0),(3681,213,'Saint Patrick',0,0),(3682,213,'San Fernando',0,0),(3683,213,'Tobago',0,0),(3684,213,'Victoria',0,0),(3685,206,'Fu-chien',0,0),(3686,206,'Kao-hsiung',0,0),(3687,206,'T\'ai-pei',0,0),(3688,206,'T\'ai-wan',0,0),(3689,208,'Pwani',0,0),(3690,208,'Dodoma',0,0),(3691,208,'Iringa',0,0),(3692,208,'Kigoma',0,0),(3693,208,'Kilimanjaro',0,0),(3694,208,'Lindi',0,0),(3695,208,'Mara',0,0),(3696,208,'Mbeya',0,0),(3697,208,'Morogoro',0,0),(3698,208,'Mtwara',0,0),(3699,208,'Mwanza',0,0),(3700,208,'Pemba North',0,0),(3701,208,'Ruvuma',0,0),(3702,208,'Shinyanga',0,0),(3703,208,'Singida',0,0),(3704,208,'Tabora',0,0),(3705,208,'Tanga',0,0),(3706,208,'Kagera',0,0),(3707,208,'Pemba South',0,0),(3708,208,'Zanzibar Central',0,0),(3709,208,'Zanzibar North',0,0),(3710,208,'Dar es Salaam',0,0),(3711,208,'Rukwa',0,0),(3712,208,'Zanzibar Urban',0,0),(3713,208,'Arusha',0,0),(3714,208,'Manyara',0,0),(3715,220,'Cherkas\'ka Oblast\'',0,0),(3716,220,'Chernihivs\'ka Oblast\'',0,0),(3717,220,'Chernivets\'ka Oblast\'',0,0),(3718,220,'Dnipropetrovs\'ka Oblast\'',0,0),(3719,220,'Donets\'ka Oblast\'',0,0),(3720,220,'Ivano-Frankivs\'ka Oblast\'',0,0),(3721,220,'Kharkivs\'ka Oblast\'',0,0),(3722,220,'Khersons\'ka Oblast\'',0,0),(3723,220,'Khmel\'nyts\'ka Oblast\'',0,0),(3724,220,'Kirovohrads\'ka Oblast\'',0,0),(3725,220,'Krym',0,0),(3726,220,'Kyyiv',0,0),(3727,220,'Kyyivs\'ka Oblast\'',0,0),(3728,220,'Luhans\'ka Oblast\'',0,0),(3729,220,'L\'vivs\'ka Oblast\'',0,0),(3730,220,'Mykolayivs\'ka Oblast\'',0,0),(3731,220,'Odes\'ka Oblast\'',0,0),(3732,220,'Poltavs\'ka Oblast\'',0,0),(3733,220,'Rivnens\'ka Oblast\'',0,0),(3734,220,'Sevastopol\'',0,0),(3735,220,'Sums\'ka Oblast\'',0,0),(3736,220,'Ternopil\'s\'ka Oblast\'',0,0),(3737,220,'Vinnyts\'ka Oblast\'',0,0),(3738,220,'Volyns\'ka Oblast\'',0,0),(3739,220,'Zakarpats\'ka Oblast\'',0,0),(3740,220,'Zaporiz\'ka Oblast\'',0,0),(3741,220,'Zhytomyrs\'ka Oblast\'',0,0),(3742,219,'Apac',0,0),(3743,219,'Bundibugyo',0,0),(3744,219,'Bushenyi',0,0),(3745,219,'Gulu',0,0),(3746,219,'Hoima',0,0),(3747,219,'Jinja',0,0),(3748,219,'Kalangala',0,0),(3749,219,'Kampala',0,0),(3750,219,'Kamuli',0,0),(3751,219,'Kapchorwa',0,0),(3752,219,'Kasese',0,0),(3753,219,'Kibale',0,0),(3754,219,'Kiboga',0,0),(3755,219,'Kisoro',0,0),(3756,219,'Kotido',0,0),(3757,219,'Kumi',0,0),(3758,219,'Lira',0,0),(3759,219,'Masindi',0,0),(3760,219,'Mbarara',0,0),(3761,219,'Mubende',0,0),(3762,219,'Nebbi',0,0),(3763,219,'Ntungamo',0,0),(3764,219,'Pallisa',0,0),(3765,219,'Rakai',0,0),(3766,219,'Adjumani',0,0),(3767,219,'Bugiri',0,0),(3768,219,'Busia',0,0),(3769,219,'Katakwi',0,0),(3770,219,'Luwero',0,0),(3771,219,'Masaka',0,0),(3772,219,'Moyo',0,0),(3773,219,'Nakasongola',0,0),(3774,219,'Sembabule',0,0),(3775,219,'Tororo',0,0),(3776,219,'Arua',0,0),(3777,219,'Iganga',0,0),(3778,219,'Kabarole',0,0),(3779,219,'Kaberamaido',0,0),(3780,219,'Kamwenge',0,0),(3781,219,'Kanungu',0,0),(3782,219,'Kayunga',0,0),(3783,219,'Kitgum',0,0),(3784,219,'Kyenjojo',0,0),(3785,219,'Mayuge',0,0),(3786,219,'Mbale',0,0),(3787,219,'Moroto',0,0),(3788,219,'Mpigi',0,0),(3789,219,'Mukono',0,0),(3790,219,'Nakapiripirit',0,0),(3791,219,'Pader',0,0),(3792,219,'Rukungiri',0,0),(3793,219,'Sironko',0,0),(3794,219,'Soroti',0,0),(3795,219,'Wakiso',0,0),(3796,219,'Yumbe',0,0),(3797,223,'Armed Forces Americas',0,0),(3798,223,'Armed Forces Europe, Middle East, & Canada',0,0),(3799,223,'Alaska',0,0),(3800,223,'Alabama',0,0),(3801,223,'Armed Forces Pacific',0,0),(3802,223,'Arkansas',0,0),(3803,223,'American Samoa',0,0),(3804,223,'Arizona',0,0),(3805,223,'California',0,0),(3806,223,'Colorado',0,0),(3807,223,'Connecticut',0,0),(3808,223,'District of Columbia',0,0),(3809,223,'Delaware',0,0),(3810,223,'Florida',0,0),(3811,223,'Federated States of Micronesia',0,0),(3812,223,'Georgia',0,0),(3813,223,'Guam',0,0),(3814,223,'Hawaii',0,0),(3815,223,'Iowa',0,0),(3816,223,'Idaho',0,0),(3817,223,'Illinois',0,0),(3818,223,'Indiana',0,0),(3819,223,'Kansas',0,0),(3820,223,'Kentucky',0,0),(3821,223,'Louisiana',0,0),(3822,223,'Massachusetts',0,0),(3823,223,'Maryland',0,0),(3824,223,'Maine',0,0),(3825,223,'Marshall Islands',0,0),(3826,223,'Michigan',0,0),(3827,223,'Minnesota',0,0),(3828,223,'Missouri',0,0),(3829,223,'Northern Mariana Islands',0,0),(3830,223,'Mississippi',0,0),(3831,223,'Montana',0,0),(3832,223,'North Carolina',0,0),(3833,223,'North Dakota',0,0),(3834,223,'Nebraska',0,0),(3835,223,'New Hampshire',0,0),(3836,223,'New Jersey',0,0),(3837,223,'New Mexico',0,0),(3838,223,'Nevada',0,0),(3839,223,'New York',0,0),(3840,223,'Ohio',0,0),(3841,223,'Oklahoma',0,0),(3842,223,'Oregon',0,0),(3843,223,'Pennsylvania',0,0),(3844,223,'Palau',0,0),(3845,223,'Rhode Island',0,0),(3846,223,'South Carolina',0,0),(3847,223,'South Dakota',0,0),(3848,223,'Tennessee',0,0),(3849,223,'Texas',0,0),(3850,223,'Utah',0,0),(3851,223,'Virginia',0,0),(3852,223,'Virgin Islands',0,0),(3853,223,'Vermont',0,0),(3854,223,'Washington',0,0),(3855,223,'Wisconsin',0,0),(3856,223,'West Virginia',0,0),(3857,223,'Wyoming',0,0),(3858,225,'Artigas',0,0),(3859,225,'Canelones',0,0),(3860,225,'Cerro Largo',0,0),(3861,225,'Colonia',0,0),(3862,225,'Durazno',0,0),(3863,225,'Flores',0,0),(3864,225,'Florida',0,0),(3865,225,'Lavalleja',0,0),(3866,225,'Maldonado',0,0),(3867,225,'Montevideo',0,0),(3868,225,'Paysandu',0,0),(3869,225,'Rio Negro',0,0),(3870,225,'Rivera',0,0),(3871,225,'Rocha',0,0),(3872,225,'Salto',0,0),(3873,225,'San Jose',0,0),(3874,225,'Soriano',0,0),(3875,225,'Tacuarembo',0,0),(3876,225,'Treinta y Tres',0,0),(3877,226,'Andijon',0,0),(3878,226,'Bukhoro',0,0),(3879,226,'Farghona',0,0),(3880,226,'Jizzakh',0,0),(3881,226,'Khorazm',0,0),(3882,226,'Namangan',0,0),(3883,226,'Nawoiy',0,0),(3884,226,'Qashqadaryo',0,0),(3885,226,'Qoraqalpoghiston',0,0),(3886,226,'Samarqand',0,0),(3887,226,'Sirdaryo',0,0),(3888,226,'Surkhondaryo',0,0),(3889,226,'Toshkent',0,0),(3890,226,'Toshkent',0,0),(3891,180,'Charlotte',0,0),(3892,180,'Saint Andrew',0,0),(3893,180,'Saint David',0,0),(3894,180,'Saint George',0,0),(3895,180,'Saint Patrick',0,0),(3896,180,'Grenadines',0,0),(3897,229,'Amazonas',0,0),(3898,229,'Anzoategui',0,0),(3899,229,'Apure',0,0),(3900,229,'Aragua',0,0),(3901,229,'Barinas',0,0),(3902,229,'Bolivar',0,0),(3903,229,'Carabobo',0,0),(3904,229,'Cojedes',0,0),(3905,229,'Delta Amacuro',0,0),(3906,229,'Falcon',0,0),(3907,229,'Guarico',0,0),(3908,229,'Lara',0,0),(3909,229,'Merida',0,0),(3910,229,'Miranda',0,0),(3911,229,'Monagas',0,0),(3912,229,'Nueva Esparta',0,0),(3913,229,'Portuguesa',0,0),(3914,229,'Sucre',0,0),(3915,229,'Tachira',0,0),(3916,229,'Trujillo',0,0),(3917,229,'Yaracuy',0,0),(3918,229,'Zulia',0,0),(3919,229,'Dependencias Federales',0,0),(3920,229,'Distrito Federal',0,0),(3921,229,'Vargas',0,0),(3922,230,'An Giang',14.35,109.1),(3923,230,'B???n Tre',10.2333,106.3833),(3924,230,'Cao B???ng',22.6667,106.25),(3925,230,'?????ng Th??p',21.7667,104.7),(3926,230,'H???i Ph??ng',20.8561,106.6822),(3927,230,'H??? Ch?? Minh',10.8142,106.6438),(3928,230,'Ki??n Giang',0,0),(3929,230,'L??m ?????ng',0,0),(3930,230,'Long An',10.4,106.3333),(3931,230,'Qu???ng Ninh',17.4,106.65),(3932,230,'S??n La',21.3167,103.9),(3933,230,'T??y Ninh',11.3,106.1),(3934,230,'Thanh H??a',19.8,105.7667),(3935,230,'Th??i B??nh',20.45,106.3333),(3936,230,'Ti???n Giang',0,0),(3937,230,'L???ng S??n',21.8333,106.7333),(3938,230,'?????ng Nai',18.1,106.3333),(3939,230,'H?? N???i',21.0333,105.85),(3940,230,'B?? R???a',14.7,108.6833),(3941,230,'B??nh ?????nh',14.1333,108.7833),(3942,230,'B??nh Thu???n',0,0),(3943,230,'Gia Lai',13.9833,108),(3944,230,'H?? Giang',22.8333,104.9833),(3945,230,'H?? T??nh',18.3333,105.9),(3946,230,'H??a B??nh',20.8133,105.3383),(3947,230,'Kh??nh H??a',10.6833,105.1667),(3948,230,'Kon Tum',14.35,108),(3949,230,'Ngh??? An',0,0),(3950,230,'Ninh B??nh',20.2539,105.975),(3951,230,'Ninh Thu???n',0,0),(3952,230,'Ph?? Y??n',0,0),(3953,230,'Qu???ng B??nh',0,0),(3954,230,'Qu???ng Ng??i',15.1167,108.8),(3955,230,'Qu???ng Tr???',16.75,107.2),(3956,230,'S??c Tr??ng',9.6033,105.98),(3957,230,'Th???a Thi??n - Hu???',0,0),(3958,230,'Tr?? Vinh',9.9347,106.3453),(3959,230,'Tuy??n Quang',0,0),(3960,230,'V??nh Long',10.25,105.9667),(3961,230,'Y??n B??i',21.7,104.8667),(3962,230,'B???c Giang',21.2731,106.1946),(3963,230,'B???c K???n',0,0),(3964,230,'B???c Li??u',9.2941,105.7278),(3965,230,'B???c Ninh',21.1861,106.0763),(3966,230,'B??nh D????ng',15.85,108.3833),(3967,230,'B??nh Ph?????c',10.4927,105.2681),(3968,230,'C?? Mau',9.1769,105.15),(3969,230,'???? N???ng',16.0678,108.2208),(3970,230,'H???i D????ng',20.9333,106.3167),(3971,230,'H?? Nam',19.3167,105.8),(3972,230,'H??ng Y??n',20.65,106.0667),(3973,230,'Nam ?????nh',20.4167,106.1667),(3974,230,'Ph?? Th???',13.9,108.9167),(3975,230,'Qu???ng Nam',15.8858,108.2569),(3976,230,'Th??i Nguy??n',21.5928,105.8442),(3977,230,'V??nh Ph??c',14.1,108.8),(3978,230,'C???n Th??',10.0333,105.7833),(3979,230,'??ak Lak',0,0),(3980,230,'Lai Ch??u',22.0667,103.1667),(3981,230,'L??o Cai',22.4833,103.95),(3982,230,'??ak N??ng',0,0),(3983,230,'??i???n Bi??n',21.3833,103.0167),(3984,230,'H???u Giang',0,0),(3985,227,'Ambrym',0,0),(3986,227,'Aoba',0,0),(3987,227,'Torba',0,0),(3988,227,'Efate',0,0),(3989,227,'Epi',0,0),(3990,227,'Malakula',0,0),(3991,227,'Paama',0,0),(3992,227,'Pentecote',0,0),(3993,227,'Sanma',0,0),(3994,227,'Shepherd',0,0),(3995,227,'Tafea',0,0),(3996,227,'Malampa',0,0),(3997,227,'Penama',0,0),(3998,227,'Shefa',0,0),(3999,181,'Aiga-i-le-Tai',0,0),(4000,181,'Atua',0,0),(4001,181,'Fa',0,0),(4002,181,'Gaga',0,0),(4003,181,'Va',0,0),(4004,181,'Gagaifomauga',0,0),(4005,181,'Palauli',0,0),(4006,181,'Satupa',0,0),(4007,181,'Tuamasaga',0,0),(4008,181,'Vaisigano',0,0),(4009,235,'Abyan',0,0),(4010,235,'Adan',0,0),(4011,235,'Al Mahrah',0,0),(4012,235,'Hadramawt',0,0),(4013,235,'Shabwah',0,0),(4014,235,'Lahij',0,0),(4015,235,'Al Bayda\'',0,0),(4016,235,'Al Hudaydah',0,0),(4017,235,'Al Jawf',0,0),(4018,235,'Al Mahwit',0,0),(4019,235,'Dhamar',0,0),(4020,235,'Hajjah',0,0),(4021,235,'Ibb',0,0),(4022,235,'Ma\'rib',0,0),(4023,235,'Sa\'dah',0,0),(4024,235,'San\'a\'',0,0),(4025,235,'Taizz',0,0),(4026,235,'Ad Dali',0,0),(4027,235,'Amran',0,0),(4028,235,'Al Bayda\'',0,0),(4029,235,'Al Jawf',0,0),(4030,235,'Hajjah',0,0),(4031,235,'Ibb',0,0),(4032,235,'Lahij',0,0),(4033,235,'Taizz',0,0),(4034,193,'North-Western Province',0,0),(4035,193,'KwaZulu-Natal',0,0),(4036,193,'Free State',0,0),(4037,193,'Eastern Cape',0,0),(4038,193,'Gauteng',0,0),(4039,193,'Mpumalanga',0,0),(4040,193,'Northern Cape',0,0),(4041,193,'Limpopo',0,0),(4042,193,'North-West',0,0),(4043,193,'Western Cape',0,0),(4044,238,'Western',0,0),(4045,238,'Central',0,0),(4046,238,'Eastern',0,0),(4047,238,'Luapula',0,0),(4048,238,'Northern',0,0),(4049,238,'North-Western',0,0),(4050,238,'Southern',0,0),(4051,238,'Copperbelt',0,0),(4052,238,'Lusaka',0,0),(4053,239,'Manicaland',0,0),(4054,239,'Midlands',0,0),(4055,239,'Mashonaland Central',0,0),(4056,239,'Mashonaland East',0,0),(4057,239,'Mashonaland West',0,0),(4058,239,'Matabeleland North',0,0),(4059,239,'Matabeleland South',0,0),(4060,239,'Masvingo',0,0),(4061,239,'Bulawayo',0,0),(4062,239,'Harare',0,0),(4063,230,'V??ng T??u',10.35,107.0667);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) unsigned DEFAULT NULL,
  `rating_id` int(11) unsigned DEFAULT NULL,
  `related_id` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_to` varchar(255) NOT NULL DEFAULT 'post',
  `parent_id` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,NULL,NULL,1,'post',NULL,1,'Tedozi Manson','duyphan.developer@gmail.com','0915428202','Test','Lorem text','2016-06-03 17:27:30','2016-06-03 17:27:32'),(2,NULL,NULL,1,'post',1,1,'Duy Phan','duy@duy.com','0984848519','Test reply','Lorem text reply nek','2016-06-04 01:58:43','2016-06-05 15:36:30'),(5,NULL,NULL,1,'post',1,0,'Tedozi','duy@duy.com','0984848519','Here is the comment test','Here is the comment test','2016-06-05 16:20:57','2016-06-05 16:20:57');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_3_code` char(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_2_code` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_name` char(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_city` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AFG','AF','Afghanistan',34,0),(2,'ALB','AL','Albania',12,0),(3,'DZA','DZ','Algeria',48,0),(4,'ASM','AS','American Samoa',0,0),(5,'AND','AD','Andorra',7,0),(6,'AGO','AO','Angola',18,0),(7,'AIA','AI','Anguilla',0,0),(8,'ATA','AQ','Antarctica',0,0),(9,'ATG','AG','Antigua and Barbuda',8,0),(10,'ARG','AR','Argentina',24,0),(11,'ARM','AM','Armenia',11,0),(12,'ABW','AW','Aruba',0,0),(13,'AUS','AU','Australia',8,0),(14,'AUT','AT','Austria',9,0),(15,'AZE','AZ','Azerbaijan',71,0),(16,'BHS','BS','Bahamas',21,0),(17,'BHR','BH','Bahrain',16,0),(18,'BGD','BD','Bangladesh',6,0),(19,'BRB','BB','Barbados',11,0),(20,'BLR','BY','Belarus',7,0),(21,'BEL','BE','Belgium',13,0),(22,'BLZ','BZ','Belize',6,0),(23,'BEN','BJ','Benin',12,0),(24,'BMU','BM','Bermuda',11,0),(25,'BTN','BT','Bhutan',18,0),(26,'BOL','BO','Bolivia',9,0),(27,'BIH','BA','Bosnia and Herzegowina',3,0),(28,'BWA','BW','Botswana',9,0),(29,'BVT','BV','Bouvet Island',0,0),(30,'BRA','BR','Brazil',27,0),(31,'IOT','IO','British Indian Ocean Territory',0,0),(32,'BRN','BN','Brunei Darussalam',12,0),(33,'BGR','BG','Bulgaria',29,0),(34,'BFA','BF','Burkina Faso',45,0),(35,'BDI','BI','Burundi',16,0),(36,'KHM','KH','Cambodia',22,0),(37,'CMR','CM','Cameroon',10,0),(38,'CAN','CA','Canada',13,0),(39,'CPV','CV','Cape Verde',16,0),(40,'CYM','KY','Cayman Islands',8,0),(41,'CAF','CF','Central African Republic',17,0),(42,'TCD','TD','Chad',14,0),(43,'CHL','CL','Chile',17,0),(44,'CHN','CN','China',31,0),(45,'CXR','CX','Christmas Island',0,0),(46,'CCK','CC','Cocos (Keeling) Islands',0,0),(47,'COL','CO','Colombia',33,0),(48,'COM','KM','Comoros',3,0),(49,'COG','CG','Congo',11,0),(50,'COK','CK','Cook Islands',0,0),(51,'CRI','CR','Costa Rica',7,0),(52,'CIV','CI','Cote D\'Ivoire',19,0),(53,'HRV','HR','Croatia',21,0),(54,'CUB','CU','Cuba',15,0),(55,'CYP','CY','Cyprus',6,0),(56,'CZE','CZ','Czech Republic',14,0),(57,'DNK','DK','Denmark',5,0),(58,'DJI','DJ','Djibouti',6,0),(59,'DMA','DM','Dominica',10,0),(60,'DOM','DO','Dominican Republic',34,0),(61,'TMP','TP','East Timor',0,0),(62,'ECU','EC','Ecuador',22,0),(63,'EGY','EG','Egypt',26,0),(64,'SLV','SV','El Salvador',14,0),(65,'GNQ','GQ','Equatorial Guinea',7,0),(66,'ERI','ER','Eritrea',6,0),(67,'EST','EE','Estonia',21,0),(68,'ETH','ET','Ethiopia',11,0),(69,'FLK','FK','Falkland Islands (Malvinas)',0,0),(70,'FRO','FO','Faroe Islands',0,0),(71,'FJI','FJ','Fiji',5,0),(72,'FIN','FI','Finland',6,0),(73,'FRA','FR','France',22,0),(75,'GUF','GF','French Guiana',0,0),(76,'PYF','PF','French Polynesia',0,0),(77,'ATF','TF','French Southern Territories',0,0),(78,'GAB','GA','Gabon',9,0),(79,'GMB','GM','Gambia',6,0),(80,'GEO','GE','Georgia',64,0),(81,'DEU','DE','Germany',16,0),(82,'GHA','GH','Ghana',10,0),(83,'GIB','GI','Gibraltar',0,0),(84,'GRC','GR','Greece',51,0),(85,'GRL','GL','Greenland',3,0),(86,'GRD','GD','Grenada',6,0),(87,'GLP','GP','Guadeloupe',0,0),(88,'GUM','GU','Guam',0,0),(89,'GTM','GT','Guatemala',22,0),(90,'GIN','GN','Guinea',34,0),(91,'GNB','GW','Guinea-bissau',9,0),(92,'GUY','GY','Guyana',10,0),(93,'HTI','HT','Haiti',10,0),(94,'HMD','HM','Heard and Mc Donald Islands',0,0),(95,'HND','HN','Honduras',18,0),(96,'HKG','HK','Hong Kong',0,0),(97,'HUN','HU','Hungary',43,0),(98,'ISL','IS','Iceland',28,0),(99,'IND','IN','India',35,0),(100,'IDN','ID','Indonesia',33,0),(101,'IRN','IR','Iran (Islamic Republic of)',40,0),(102,'IRQ','IQ','Iraq',18,0),(103,'IRL','IE','Ireland',26,0),(104,'ISR','IL','Israel',6,0),(105,'ITA','IT','Italy',20,0),(106,'JAM','JM','Jamaica',14,0),(107,'JPN','JP','Japan',47,0),(108,'JOR','JO','Jordan',12,0),(109,'KAZ','KZ','Kazakhstan',17,0),(110,'KEN','KE','Kenya',8,0),(111,'KIR','KI','Kiribati',3,0),(112,'PRK','KP','Korea, Democratic People\'s Republic of',13,0),(113,'KOR','KR','Korea, Republic of',16,0),(114,'KWT','KW','Kuwait',6,0),(115,'KGZ','KG','Kyrgyzstan',9,0),(116,'LAO','LA','Lao People\'s Democratic Republic',13,0),(117,'LVA','LV','Latvia',33,0),(118,'LBN','LB','Lebanon',11,0),(119,'LSO','LS','Lesotho',10,0),(120,'LBR','LR','Liberia',17,0),(121,'LBY','LY','Libya',25,0),(122,'LIE','LI','Liechtenstein',13,0),(123,'LTU','LT','Lithuania',10,0),(124,'LUX','LU','Luxembourg',3,0),(125,'MAC','MO','Macau',2,0),(126,'MKD','MK','Macedonia, The Former Yugoslav Republic of',123,0),(127,'MDG','MG','Madagascar',6,0),(128,'MWI','MW','Malawi',27,0),(129,'MYS','MY','Malaysia',16,0),(130,'MDV','MV','Maldives',20,0),(131,'MLI','ML','Mali',9,0),(132,'MLT','MT','Malta',0,0),(133,'MHL','MH','Marshall Islands',0,0),(134,'MTQ','MQ','Martinique',0,0),(135,'MRT','MR','Mauritania',12,0),(136,'MUS','MU','Mauritius',12,0),(137,'MYT','YT','Mayotte',0,0),(138,'MEX','MX','Mexico',32,0),(139,'FSM','FM','Micronesia, Federated States of',4,0),(140,'MDA','MD','Moldova, Republic of',37,0),(141,'MCO','MC','Monaco',3,0),(142,'MNG','MN','Mongolia',24,0),(143,'MSR','MS','Montserrat',3,0),(144,'MAR','MA','Morocco',15,0),(145,'MOZ','MZ','Mozambique',11,0),(146,'MMR','MM','Myanmar',15,0),(147,'NAM','NA','Namibia',38,0),(148,'NRU','NR','Nauru',14,0),(149,'NPL','NP','Nepal',14,0),(150,'NLD','NL','Netherlands',12,0),(151,'ANT','AN','Netherlands Antilles',0,0),(152,'NCL','NC','New Caledonia',0,0),(153,'NZL','NZ','New Zealand',16,0),(154,'NIC','NI','Nicaragua',18,0),(155,'NER','NE','Niger',8,0),(156,'NGA','NG','Nigeria',37,0),(157,'NIU','NU','Niue',0,0),(158,'NFK','NF','Norfolk Island',0,0),(159,'MNP','MP','Northern Mariana Islands',0,0),(160,'NOR','NO','Norway',19,0),(161,'OMN','OM','Oman',8,0),(162,'PAK','PK','Pakistan',8,0),(163,'PLW','PW','Palau',0,0),(164,'PAN','PA','Panama',10,0),(165,'PNG','PG','Papua New Guinea',20,0),(166,'PRY','PY','Paraguay',20,0),(167,'PER','PE','Peru',25,0),(168,'PHL','PH','Philippines',149,0),(169,'PCN','PN','Pitcairn',0,0),(170,'POL','PL','Poland',16,0),(171,'PRT','PT','Portugal',20,0),(172,'PRI','PR','Puerto Rico',0,0),(173,'QAT','QA','Qatar',11,0),(174,'REU','RE','Reunion',0,0),(175,'ROM','RO','Romania',42,0),(176,'RUS','RU','Russian Federation',91,0),(177,'RWA','RW','Rwanda',9,0),(178,'KNA','KN','Saint Kitts and Nevis',14,0),(179,'LCA','LC','Saint Lucia',11,0),(180,'VCT','VC','Saint Vincent and the Grenadines',6,0),(181,'WSM','WS','Samoa',10,0),(182,'SMR','SM','San Marino',9,0),(183,'STP','ST','Sao Tome and Principe',2,0),(184,'SAU','SA','Saudi Arabia',13,0),(185,'SEN','SN','Senegal',11,0),(186,'SYC','SC','Seychelles',23,0),(187,'SLE','SL','Sierra Leone',4,0),(188,'SGP','SG','Singapore',0,0),(189,'SVK','SK','Slovakia',8,0),(190,'SVN','SI','Slovenia',195,0),(191,'SLB','SB','Solomon Islands',9,0),(192,'SOM','SO','Somalia',20,0),(193,'ZAF','ZA','South Africa',10,0),(194,'SGS','GS','South Georgia and the South Sandwich Islands',0,0),(195,'ESP','ES','Spain',17,0),(196,'LKA','LK','Sri Lanka',9,0),(197,'SHN','SH','St. Helena',3,0),(198,'SPM','PM','St. Pierre and Miquelon',0,0),(199,'SDN','SD','Sudan',15,0),(200,'SUR','SR','Suriname',10,0),(201,'SJM','SJ','Svalbard and Jan Mayen Islands',0,0),(202,'SWZ','SZ','Swaziland',5,0),(203,'SWE','SE','Sweden',21,0),(204,'CHE','CH','Switzerland',26,0),(205,'SYR','SY','Syrian Arab Republic',14,0),(206,'TWN','TW','Taiwan',4,0),(207,'TJK','TJ','Tajikistan',3,0),(208,'TZA','TZ','Tanzania, United Republic of',26,0),(209,'THA','TH','Thailand',80,0),(210,'TGO','TG','Togo',5,0),(211,'TKL','TK','Tokelau',0,0),(212,'TON','TO','Tonga',3,0),(213,'TTO','TT','Trinidad and Tobago',12,0),(214,'TUN','TN','Tunisia',24,0),(215,'TUR','TR','Turkey',81,0),(216,'TKM','TM','Turkmenistan',5,0),(217,'TCA','TC','Turks and Caicos Islands',0,0),(218,'TUV','TV','Tuvalu',0,0),(219,'UGA','UG','Uganda',55,0),(220,'UKR','UA','Ukraine',27,0),(221,'ARE','AE','United Arab Emirates',7,0),(222,'GBR','GB','United Kingdom',234,0),(223,'USA','US','United States',61,1),(224,'UMI','UM','United States Minor Outlying Islands',0,0),(225,'URY','UY','Uruguay',19,0),(226,'UZB','UZ','Uzbekistan',14,0),(227,'VUT','VU','Vanuatu',14,0),(228,'VAT','VA','Vatican City State (Holy See)',0,0),(229,'VEN','VE','Venezuela',25,0),(230,'VNM','VN','Vi???t Nam',65,1),(231,'VGB','VG','Virgin Islands (British)',0,0),(232,'VIR','VI','Virgin Islands (U.S.)',0,0),(233,'WLF','WF','Wallis and Futuna Islands',0,0),(234,'ESH','EH','Western Sahara',0,0),(235,'YEM','YE','Yemen',25,0),(237,'DRC','DC','The Democratic Republic of Congo',0,0),(238,'ZMB','ZM','Zambia',9,0),(239,'ZWE','ZW','Zimbabwe',10,0),(240,'XET','XE','East Timor',0,0),(241,'JEY','JE','Jersey',0,0),(242,'XSB','XB','St. Barthelemy',0,0),(243,'XSE','XU','St. Eustatius',0,0),(244,'XCA','XC','Canary Islands',0,0),(245,'SRB','RS','Serbia',2,0),(246,'MAF','MF','Sint Maarten (French Antilles)',0,0),(247,'SXM','SX','Sint Maarten (Netherlands Antilles)',0,0),(248,'PSE','FS','Palestinian Territory, occupied',2,0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_user_use`
--

DROP TABLE IF EXISTS `coupon_user_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_user_use` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_user_use`
--

LOCK TABLES `coupon_user_use` WRITE;
/*!40000 ALTER TABLE `coupon_user_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_user_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_user_use_with_tracked_times`
--

DROP TABLE IF EXISTS `coupon_user_use_with_tracked_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_user_use_with_tracked_times` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `total_used` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_user_use_with_tracked_times`
--

LOCK TABLES `coupon_user_use_with_tracked_times` WRITE;
/*!40000 ALTER TABLE `coupon_user_use_with_tracked_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_user_use_with_tracked_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) unsigned NOT NULL,
  `coupon_code` varchar(32) DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `value` double NOT NULL DEFAULT '0',
  `each_user_can_use` int(5) DEFAULT NULL,
  `total_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_used` int(10) unsigned NOT NULL DEFAULT '0',
  `apply_for_min_price` double unsigned NOT NULL DEFAULT '0',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_groups`
--

DROP TABLE IF EXISTS `field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_rules` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_groups`
--

LOCK TABLES `field_groups` WRITE;
/*!40000 ALTER TABLE `field_groups` DISABLE KEYS */;
INSERT INTO `field_groups` VALUES (5,NULL,'Product images','[{\"field_relation\":\"and\",\"field_options\":[{\"rel_name\":\"model_name\",\"rel_value\":\"Product\",\"rel_type\":\"==\"}]}]',1,'2016-07-10 06:14:50','2016-07-10 06:15:39');
/*!40000 ALTER TABLE `field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_items`
--

DROP TABLE IF EXISTS `field_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_group_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_items`
--

LOCK TABLES `field_items` WRITE;
/*!40000 ALTER TABLE `field_items` DISABLE KEYS */;
INSERT INTO `field_items` VALUES (21,5,19,2,'Title','21_title','text','','{\"defaultvalue\":\"\",\"placeholdertext\":\"\",\"defaultvaluetextarea\":\"\",\"wyswygtoolbar\":\"\",\"selectchoices\":\"\",\"buttonlabel\":\"\"}'),(20,5,19,1,'Image','20_image','image','','{\"defaultvalue\":\"\",\"placeholdertext\":\"\",\"defaultvaluetextarea\":\"\",\"wyswygtoolbar\":\"\",\"selectchoices\":\"\",\"buttonlabel\":\"\"}'),(19,5,0,1,'Images','19_images','repeater','','{\"defaultvalue\":\"\",\"placeholdertext\":\"\",\"defaultvaluetextarea\":\"\",\"wyswygtoolbar\":\"\",\"selectchoices\":\"\",\"buttonlabel\":\"Add image\"}');
/*!40000 ALTER TABLE `field_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(7) NOT NULL,
  `language_name` varchar(128) NOT NULL,
  `major` tinyint(4) NOT NULL DEFAULT '0',
  `default_locale` varchar(8) DEFAULT NULL,
  `tag` varchar(8) DEFAULT NULL,
  `currency` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`language_code`),
  UNIQUE KEY `english_name` (`language_name`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','English',1,'en_US','en-US','USD',1,'0000-00-00 00:00:00','2015-12-11 01:17:35'),(2,'es','Spanish',1,'es_ES','es-ES','',0,'0000-00-00 00:00:00','2016-01-22 10:06:58'),(3,'de','German',1,'de_DE','de-DE','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(4,'fr','French',1,'fr_FR','fr-FR','',0,'0000-00-00 00:00:00','2015-09-12 19:03:36'),(5,'ar','Arabic',0,'ar','ar','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(6,'bs','Bosnian',0,'bs','','',0,'0000-00-00 00:00:00','2016-01-20 21:39:39'),(7,'bg','Bulgarian',0,'bg_BG','bg-BG','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(8,'ca','Catalan',0,'ca','ca','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(9,'cs','Czech',0,'cs_CZ','cs-CZ','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(10,'sk','Slovak',0,'sk_SK','sk-SK','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(11,'cy','Welsh',0,'cy','cy','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(12,'da','Danish',1,'da_DK','da-DK','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(13,'el','Greek',0,'el','el','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(14,'eo','Esperanto',0,'eo','eo','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(15,'et','Estonian',0,'et','et','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(16,'eu','Basque',0,'eu','eu','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(17,'fa','Persian',0,'fa_IR','fa-IR','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(18,'fi','Finnish',0,'fi','fi','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(19,'ga','Irish',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(20,'he','Hebrew',0,'he_IL','he-IL','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(21,'hi','Hindi',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(22,'hr','Croatian',0,'hr','hr','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(23,'hu','Hungarian',0,'hu_HU','hu-HU','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(24,'hy','Armenian',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(25,'id','Indonesian',0,'id_ID','id-ID','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(26,'is','Icelandic',0,'is_IS','is-IS','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(27,'it','Italian',1,'it_IT','it-IT','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(28,'ja','Japanese',1,'ja','ja','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(29,'ko','Korean',0,'ko_KR','ko-KR','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(30,'ku','Kurdish',0,'ku','ku','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(31,'la','Latin',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(32,'lv','Latvian',0,'lv','lv','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(33,'lt','Lithuanian',0,'lt','lt','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(34,'mk','Macedonian',0,'mk_MK','mk-MK','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(35,'mt','Maltese',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(36,'mo','Moldavian',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(37,'mn','Mongolian',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(38,'ne','Nepali',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(39,'nl','Dutch',1,'nl_NL','nl-NL','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(40,'nb','Norwegian Bokm??l',0,'nb_NO','nb-NO','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(41,'pa','Punjabi',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(42,'pl','Polish',0,'pl_PL','pl-PL','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(43,'pt-pt','Portuguese, Portugal',0,'pt_PT','pt-PT','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(44,'pt-br','Portuguese, Brazil',0,'pt_BR','pt-BR','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(45,'qu','Quechua',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(46,'ro','Romanian',0,'ro_RO','ro-RO','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(47,'ru','Russian',1,'ru_RU','ru-RU','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(48,'sl','Slovenian',0,'sl_SI','sl-SI','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(49,'so','Somali',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(50,'sq','Albanian',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(51,'sr','Serbian',0,'sr_RS','sr-RS','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(52,'sv','Swedish',0,'sv_SE','sv-SE','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(53,'ta','Tamil',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(54,'th','Thai',0,'th','th','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(55,'tr','Turkish',0,'tr','tr','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(56,'uk','Ukrainian',0,'uk_UA','uk-UA','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(57,'ur','Urdu',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(58,'uz','Uzbek',0,'uz_UZ','uz-UZ','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(59,'vi','Vietnamese',0,'vi_VN','vi-vn','VND',0,'0000-00-00 00:00:00','2016-07-13 04:24:15'),(60,'yi','Yiddish',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(61,'zh-hans','Chinese (Simplified)',1,'zh_CN','zh-CN','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(62,'zu','Zulu',0,'','','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(63,'zh-hant','Chinese (Traditional)',1,'zh_TW','zh-TW','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00'),(64,'ms','Malay',0,'ms_MY','ms-MY','',0,'0000-00-00 00:00:00','2015-09-12 19:03:00');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_contents`
--

DROP TABLE IF EXISTS `menu_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_contents`
--

LOCK TABLES `menu_contents` WRITE;
/*!40000 ALTER TABLE `menu_contents` DISABLE KEYS */;
INSERT INTO `menu_contents` VALUES (2,2,1,'2014-10-24 18:26:30','2016-01-11 02:59:26'),(8,2,59,'2016-05-11 17:33:51','2016-05-11 17:33:51'),(9,3,59,'2016-05-26 16:21:28','2016-05-26 16:21:28'),(10,3,1,'2016-05-31 16:53:25','2016-05-31 16:53:25');
/*!40000 ALTER TABLE `menu_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_nodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_content_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_font` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_class` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (272,2,0,0,'custom-link','dashboard','fa fa-home',0,'Dashboard','start','2015-01-09 00:34:11','2015-01-26 08:08:30'),(280,2,403,0,'custom-link','custom-fields','fa fa-edit',2,'Custom fields','','2015-01-09 00:34:11','2016-01-20 21:16:51'),(283,2,0,0,'custom-link','pages','fa fa-tasks',2,'Pages','','2015-01-09 00:34:11','2016-07-13 09:35:32'),(291,2,403,0,'custom-link','settings','fa fa-gear',1,'Options','','2015-01-09 00:34:11','2016-01-20 02:45:17'),(297,2,403,0,'custom-link','menus','fa fa-bars',0,'Menus','','2015-01-09 00:34:11','2015-12-22 04:30:12'),(331,2,414,0,'custom-link','products','fa fa-cubes',0,'Products','','2015-04-02 08:54:31','2016-01-18 05:22:11'),(332,2,414,0,'custom-link','product-categories','fa fa-sitemap',1,'Product categories','','2015-04-02 08:54:31','2016-01-18 05:22:11'),(403,2,0,0,'custom-link','settings','fa fa-cogs',6,'Settings','','2015-09-12 18:22:25','2016-07-13 09:36:10'),(414,2,0,0,'custom-link','orders','fa fa-shopping-cart',1,'Listing','','2016-01-15 00:12:15','2016-07-13 09:35:32'),(415,2,438,0,'custom-link','admin-users','icon-users',1,'Admin users','','2016-01-18 23:50:46','2016-01-24 07:05:00'),(416,2,403,0,'custom-link','settings/languages','fa fa-language',3,'Languages','','2016-01-20 19:10:32','2016-01-20 21:16:51'),(437,2,403,0,'custom-link','countries-cities','fa fa-building',4,'Countries/Cities','','2016-01-23 23:24:54','2016-01-23 23:24:54'),(438,2,0,0,'custom-link','users','icon-users',4,'Users','','2016-01-24 07:05:00','2016-07-13 09:36:10'),(439,2,438,0,'custom-link','users','icon-users',0,'Users','','2016-01-24 07:05:00','2016-01-24 07:05:00'),(440,2,414,0,'custom-link','coupons','fa fa-code',3,'Coupons','','2016-01-27 02:23:56','2016-07-08 08:48:10'),(441,2,0,0,'custom-link','contacts','fa fa-suitcase',3,'Contacts','','2016-01-28 03:14:54','2016-07-13 09:36:10'),(462,8,0,0,'custom-link','dashboard','fa fa-home',0,'Dashboard','','2016-05-11 17:36:16','2016-05-11 17:36:16'),(463,8,0,0,'custom-link','posts','icon-layers',1,'Posts','','2016-05-11 17:36:16','2016-05-12 11:00:19'),(464,8,463,0,'custom-link','posts','icon-layers',0,'Posts','','2016-05-11 17:36:16','2016-05-12 11:00:19'),(465,8,463,0,'custom-link','categories','fa fa-sitemap',1,'Categories','','2016-05-11 17:36:16','2016-05-12 11:00:19'),(466,8,0,0,'custom-link','orders','fa fa-shopping-cart',2,'E-commerce','','2016-05-11 17:36:16','2016-05-12 11:00:19'),(467,8,466,0,'custom-link','products','fa fa-cubes',0,'Products','','2016-05-11 17:38:17','2016-05-12 11:00:19'),(468,8,466,0,'custom-link','product-categories','fa fa-sitemap',1,'Product categories','','2016-05-11 17:38:17','2016-05-12 11:00:19'),(469,8,466,0,'custom-link','coupons','fa fa-code',2,'Coupons','','2016-05-11 17:38:17','2016-05-12 11:00:19'),(470,8,0,0,'custom-link','pages','fa fa-tasks',3,'Pages','','2016-05-11 17:38:17','2016-05-12 11:00:19'),(471,8,0,0,'custom-link','users','icon-users',4,'Users','','2016-05-11 17:40:08','2016-05-12 11:00:19'),(472,8,471,0,'custom-link','users','icon-users',0,'Users','','2016-05-11 17:40:08','2016-05-12 11:00:19'),(473,8,471,0,'custom-link','admin-users','icon-users',1,'Admin users','','2016-05-11 17:40:08','2016-05-12 11:00:19'),(474,8,0,0,'custom-link','settings','fa fa-cogs',5,'Settings','','2016-05-11 17:40:08','2016-05-12 11:00:19'),(475,8,474,0,'custom-link','menus','fa fa-bars',0,'Menus','','2016-05-11 17:43:52','2016-05-12 11:00:19'),(476,8,474,0,'custom-link','settings','fa fa-gear',1,'Options','','2016-05-11 17:43:52','2016-05-12 11:00:19'),(477,8,474,0,'custom-link','custom-fields','fa fa-edit',2,'Custom fields','','2016-05-11 17:43:52','2016-05-11 17:43:52'),(478,8,474,0,'custom-link','settings/languages','fa fa-language',3,'Languages','','2016-05-11 17:43:52','2016-05-12 11:00:19'),(479,8,474,0,'custom-link','countries-cities','fa fa-building',4,'Countries/Cities','','2016-05-11 17:43:52','2016-05-11 17:43:52'),(480,8,0,0,'custom-link','contacts','fa fa-suitcase',7,'Contacts','','2016-05-11 17:43:52','2016-06-03 12:35:30'),(501,8,466,0,'custom-link','brands','',3,'Brands','icon-umbrella','2016-05-28 18:36:47','2016-05-28 18:36:47'),(502,8,0,0,'custom-link','subscribed-emails','',8,'Subscribed emails','icon-envelope','2016-05-28 18:36:47','2016-06-03 12:35:30'),(503,2,414,0,'custom-link','brands','icon-umbrella',4,'Brands','','2016-05-28 18:38:13','2016-07-08 08:48:10'),(504,2,0,0,'custom-link','subscribed-emails','icon-envelope',5,'Subscribed emails','','2016-05-28 18:38:13','2016-07-13 09:36:10'),(509,9,0,2,'page','','',0,'','','2016-05-31 13:24:38','2016-06-12 01:47:35'),(515,8,0,0,'custom-link','comments','icon-bubbles',6,'Comments','','2016-06-03 12:35:30','2016-06-03 12:35:30'),(517,2,414,0,'custom-link','product-attribute-sets','fa fa-bars',2,'Attributes','','2016-07-08 08:48:10','2016-07-08 08:48:10'),(518,10,0,2,'page','','',4,'','','2016-07-13 04:34:45','2016-07-15 11:00:52'),(519,10,0,1,'page','/','',0,'Home','','2016-07-13 04:35:54','2016-07-15 11:02:42'),(522,10,0,3,'page','','',3,'','','2016-07-15 10:58:29','2016-07-15 11:00:29'),(524,10,0,0,'custom-link','#','',5,'FAQ','','2016-07-15 10:58:29','2016-07-15 11:00:52'),(525,10,0,0,'custom-link','#','',1,'Upcoming Auction','','2016-07-15 10:58:53','2016-07-15 11:00:29'),(526,10,0,0,'custom-link','#','',2,'Closed auction','','2016-07-15 11:00:29','2016-07-15 11:00:29');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (2,'Admin menu','admin-menu',1,'2014-10-24 18:26:30','2016-01-11 02:59:26'),(3,'Main menu','main-menu',1,'2016-05-26 16:21:28','2016-05-26 16:21:28');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2016_05_17_113249_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_contents`
--

DROP TABLE IF EXISTS `page_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '59',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `thumbnail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_contents`
--

LOCK TABLES `page_contents` WRITE;
/*!40000 ALTER TABLE `page_contents` DISABLE KEYS */;
INSERT INTO `page_contents` VALUES (1,1,59,'Trang ch???','trang-chu','','<h3>Gi???i thi???u v??? c&ocirc;ng ty</h3>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui. Fusce feugiat malesuada odio. Morbi nunc odio, gravida at.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla dui. Fusce feugiat malesuada odio. Morbi nunc odio, gravida at.</p>\r\n',1,'','',0,'2016-05-31 13:21:02','2016-06-10 19:34:31'),(2,2,59,'Li??n h???','lien-he','Want to get in touch with me? Fill out the form below to send me a message and I will try to get back to you within 24 hours!','<p>Want to get in touch with me? Fill out the form below to send me a message and I will try to get back to you within 24 hours!</p>\r\n',1,'/uploads/contact-bg.jpg','',0,'2016-05-31 13:21:37','2016-05-31 16:52:58'),(3,1,1,'Home','homepage','','',1,'/uploads/home-bg.jpg','',1,'2016-05-31 16:49:27','2016-07-15 11:02:06'),(4,2,1,'Contact us','contact-us','Want to get in touch with me? Fill out the form below to send me a message and I will try to get back to you within 24 hours!','',1,'/uploads/about-bg.jpg','',1,'2016-05-31 16:49:59','2016-05-31 16:50:41'),(11,3,1,'Price','price','','',1,'','',0,'2016-07-15 08:25:01','2016-07-15 08:25:01');
/*!40000 ALTER TABLE `page_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_metas`
--

DROP TABLE IF EXISTS `page_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_metas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `meta_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_metas`
--

LOCK TABLES `page_metas` WRITE;
/*!40000 ALTER TABLE `page_metas` DISABLE KEYS */;
INSERT INTO `page_metas` VALUES (1,1,'4_jumbotron_text','LaraWebEd'),(2,1,'5_jumbotron_caption','A CMS built on Laravel'),(4,2,'4_jumbotron_text','LaraWebEd'),(5,2,'5_jumbotron_caption','Contact page template'),(6,3,'4_jumbotron_text','LaraWebEd'),(7,3,'5_jumbotron_caption','A CMS built on Laravel'),(8,4,'4_jumbotron_text','LaraWebEd'),(9,4,'5_jumbotron_caption','Contact page template');
/*!40000 ALTER TABLE `page_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `global_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','Homepage',1,0,0,'2016-05-31 13:21:02','2016-06-06 06:13:30'),(2,'Contact us','Contact Us',1,0,0,'2016-05-31 13:21:37','2016-06-06 06:13:30'),(3,'Price','Price',1,0,0,'2016-07-15 08:25:00','2016-07-15 08:26:18');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_contents`
--

DROP TABLE IF EXISTS `post_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '59',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `thumbnail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_contents`
--

LOCK TABLES `post_contents` WRITE;
/*!40000 ALTER TABLE `post_contents` DISABLE KEYS */;
INSERT INTO `post_contents` VALUES (4,4,59,'Thi???t k??? b???p ???? hoa c????ng - qu???n T??n Ph??','thiet-ke-bep-da-hoa-cuong-quan-tan-phu','','<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\r\n',1,'/uploads/projects/project1.jpg','',0,'2016-06-10 19:56:00','2016-06-10 21:36:47'),(5,5,59,'Thi c??ng c???u thang qu???n B??nh Th???nh','thi-cong-cau-thang-quan-binh-thanh','','',1,'/uploads/projects/project2.jpg','',0,'2016-06-10 21:39:06','2016-06-10 21:39:06'),(6,6,59,'Thi c??ng s???nh ??n nh?? h??ng Him Lam','thi-cong-sanh-an-nha-hang-him-lam','','',1,'/uploads/projects/project3.jpg','',0,'2016-06-10 21:42:54','2016-06-10 21:43:46'),(7,1,1,'t??t','tet','sdfsdfsdf','<p>sdfsdffffffdsfdfsf</p>\r\n',1,'/uploads/NewFolder/144565.jpg','sf',0,'2016-07-13 04:39:55','2016-07-13 04:39:55');
/*!40000 ALTER TABLE `post_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_metas`
--

DROP TABLE IF EXISTS `post_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_metas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `meta_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_metas`
--

LOCK TABLES `post_metas` WRITE;
/*!40000 ALTER TABLE `post_metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_popular` tinyint(1) DEFAULT '0',
  `global_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,'t??t','',1,0,1,'2016-07-13 04:39:55','2016-07-13 04:39:55');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_sets`
--

DROP TABLE IF EXISTS `product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_sets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_sets`
--

LOCK TABLES `product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `product_attribute_sets` DISABLE KEYS */;
INSERT INTO `product_attribute_sets` VALUES (1,'Colors','colors',1,0),(2,'Sizes','size',1,0);
/*!40000 ALTER TABLE `product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_sets_product_categories`
--

DROP TABLE IF EXISTS `product_attribute_sets_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_sets_product_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_sets_product_categories`
--

LOCK TABLES `product_attribute_sets_product_categories` WRITE;
/*!40000 ALTER TABLE `product_attribute_sets_product_categories` DISABLE KEYS */;
INSERT INTO `product_attribute_sets_product_categories` VALUES (1,1,6),(2,1,5),(3,1,1),(5,1,2),(6,1,4),(7,1,7),(8,2,5),(9,2,1),(10,2,3),(11,2,2),(12,2,4);
/*!40000 ALTER TABLE `product_attribute_sets_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
INSERT INTO `product_attributes` VALUES (1,1,'Black','black','#000000',0),(2,1,'White','white','#ffffff',0),(3,1,'Red','red','#ff0000',0),(4,2,'Size S','s','s',0),(5,2,'Size M','m','m',0),(6,2,'Size L','l','l',0),(7,2,'Size XL','xl','xl',0),(8,2,'Size XXL','xxl','xxl',0);
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attributes_products`
--

DROP TABLE IF EXISTS `product_attributes_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attributes_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `change_price` double NOT NULL DEFAULT '0',
  `is_percentage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes_products`
--

LOCK TABLES `product_attributes_products` WRITE;
/*!40000 ALTER TABLE `product_attributes_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `global_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (8,0,'Test category','',1,0,0,'2016-07-13 09:32:38','2016-07-13 09:32:38');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories_products`
--

DROP TABLE IF EXISTS `product_categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories_products`
--

LOCK TABLES `product_categories_products` WRITE;
/*!40000 ALTER TABLE `product_categories_products` DISABLE KEYS */;
INSERT INTO `product_categories_products` VALUES (6,2,8);
/*!40000 ALTER TABLE `product_categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_contents`
--

DROP TABLE IF EXISTS `product_category_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '59',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1',
  `thumbnail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `icon_font` varchar(100) NOT NULL,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_contents`
--

LOCK TABLES `product_category_contents` WRITE;
/*!40000 ALTER TABLE `product_category_contents` DISABLE KEYS */;
INSERT INTO `product_category_contents` VALUES (10,8,1,'Test category','test-category','ok','<p>ahi</p>\r\n','1','','','',0,'2016-07-13 09:32:38','2016-07-13 09:32:38');
/*!40000 ALTER TABLE `product_category_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_metas`
--

DROP TABLE IF EXISTS `product_category_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_metas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `meta_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_metas`
--

LOCK TABLES `product_category_metas` WRITE;
/*!40000 ALTER TABLE `product_category_metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_contents`
--

DROP TABLE IF EXISTS `product_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '59',
  `is_out_of_stock` tinyint(1) DEFAULT '0',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `thumbnail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `label` varchar(100) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `old_price` double NOT NULL DEFAULT '0',
  `sale_status` tinyint(1) DEFAULT '0',
  `sale_from` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `sale_to` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_contents`
--

LOCK TABLES `product_contents` WRITE;
/*!40000 ALTER TABLE `product_contents` DISABLE KEYS */;
INSERT INTO `product_contents` VALUES (3,2,1,0,'Product sample','product-sample','sdfdsf','<p>sdfdsfdfs</p>\r\n',1,'/uploads/NewFolder/144565.jpg','','',55,3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2016-07-13 09:28:49','2016-07-18 07:25:01');
/*!40000 ALTER TABLE `product_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_metas`
--

DROP TABLE IF EXISTS `product_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_metas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `meta_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_metas`
--

LOCK TABLES `product_metas` WRITE;
/*!40000 ALTER TABLE `product_metas` DISABLE KEYS */;
INSERT INTO `product_metas` VALUES (1,3,'19_images','[[{\"field_value\":\"\\/uploads\\/NewFolder\\/144565.jpg\",\"field_type\":\"image\",\"slug\":\"20_image\"},{\"field_value\":\"\",\"field_type\":\"text\",\"slug\":\"21_title\"}]]');
/*!40000 ALTER TABLE `product_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `brand_id` int(11) NOT NULL DEFAULT '0',
  `global_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,0,0,'Ahi2','23','Product',1,0,1,'2016-07-13 09:28:48','2016-07-18 07:25:01');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) DEFAULT NULL,
  `related_id` int(11) NOT NULL DEFAULT '0',
  `rating_to` varchar(255) DEFAULT 'post',
  `value` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'email_receives_feedback','duyphan.developer@gmail.com','2015-11-24 09:31:17','2015-11-24 09:31:20'),(2,'site_title','Auction','2015-12-17 00:51:37','2016-07-13 04:13:24'),(3,'site_logo','','2015-12-17 00:51:52','2016-01-20 23:06:24'),(4,'site_keywords','LaraWebEd,Laravel CMS,Laravel 5 CMS,Saigon Software,sgsoftware.net','2015-12-17 00:52:21','2016-05-31 15:34:11'),(5,'default_language','1','2015-12-17 00:53:12','2016-07-13 04:14:48'),(6,'google_analytics','<script></script>','2015-11-24 09:35:03','2015-11-24 17:07:38'),(7,'construction_mode','0','2015-11-24 09:36:20','2016-01-26 03:04:50'),(8,'site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2016-01-20 18:40:32','2016-01-20 18:52:35'),(9,'default_homepage','1','2016-01-21 07:11:32','2016-01-21 07:11:34'),(10,'show_admin_bar','1','2016-01-26 03:00:54','2016-06-10 17:10:23'),(13,'dashboard_language','1','2016-05-14 11:53:01','2016-05-14 11:53:01'),(14,'hot_line','098.4848.519 - 0915.42.82.02','2016-05-26 16:42:33','2016-05-26 16:42:45'),(15,'facebook','https://www.facebook.com/duyphan.developer','2016-05-28 16:12:24','2016-05-28 16:12:24'),(16,'twitter','https://www.facebook.com/duyphan.developer','2016-05-28 16:12:24','2016-06-10 21:56:16'),(17,'youtube','https://www.youtube.com/channel/UC5XqPLFs_eeBu6LU4LZLY6w','2016-05-28 16:12:24','2016-05-31 15:28:43'),(20,'github','','2016-05-31 15:25:07','2016-07-13 04:13:16'),(18,'instagram','','2016-05-28 16:12:24','2016-06-10 21:58:32'),(19,'pinterest','','2016-05-28 16:12:24','2016-06-10 21:58:32'),(21,'email','duyphan.developer@gmail.com','2016-06-10 21:55:49','2016-06-10 21:55:49'),(22,'google-plus','https://www.facebook.com/duyphan.developer','2016-06-10 21:57:52','2016-06-10 21:57:52');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribed_emails`
--

DROP TABLE IF EXISTS `subscribed_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribed_emails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribed_emails`
--

LOCK TABLES `subscribed_emails` WRITE;
/*!40000 ALTER TABLE `subscribed_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribed_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `sex` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `phone_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `phone_3` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `social_type` varchar(255) DEFAULT NULL,
  `social_id` varchar(100) DEFAULT NULL,
  `register_key` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) NOT NULL,
  `login_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token_expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'duyphan.developer@gmail.com','$2y$10$dhqYXJVbW8hMHV7oVynMeufd35Sg0tuQg32yEvpzNwqkV79lcKxWy','Tedozi','Manson',1,'Bad boy','1993-02-25 00:00:00',NULL,'','0915428202','','',0,NULL,NULL,NULL,'sgxUdCO5SUka4B8uhtWyAfMP5gQJqgX8q8U9YnxKxO1uJ2moiGncFLmwieQf','','0000-00-00 00:00:00','2016-05-29 11:19:21','2016-05-27 17:23:09','2016-05-29 11:23:02'),(2,'mrtaiw@gmail.com','$2y$10$T6FO2O/yyFlQBpEf6c.pT.bXg561rfoNtUfGYDZ.7BvecBm8NOnBS','tai','doan',0,'','0000-00-00 00:00:00',NULL,'','','','',1,NULL,NULL,NULL,'IEbOjU7n5NCRz0Iuowp20gktZUkTVusnTBGJMc8PqmyrfDx5rmwTzqrs8LV6','','0000-00-00 00:00:00','2016-07-18 04:50:50','2016-07-13 09:09:20','2016-07-18 04:50:50'),(3,'thucdem.mobi@gmail.com','$2y$10$B3/vjmbigCdhF4oLHJJNauIwr2IPok0Jx/d1ysmVdQu/CjN6YD9qm','taiw','doan',0,'','0000-00-00 00:00:00',NULL,'','','','',1,NULL,NULL,NULL,'AHXALdg1pjBDjmJv1Lf7X6z5LjlEGVv4YcqSi2KC5RMYWiRn5NfSK49MPJkj','','0000-00-00 00:00:00','2016-07-15 04:27:27','2016-07-15 04:27:27','2016-07-15 07:19:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-18 17:48:24
