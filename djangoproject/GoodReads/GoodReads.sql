-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: GoodReads
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

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
-- Current Database: `GoodReads`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `GoodReads` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `GoodReads`;

--
-- Table structure for table `Books_author`
--

DROP TABLE IF EXISTS `Books_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `date_of_birth` varchar(250) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_author`
--

LOCK TABLES `Books_author` WRITE;
/*!40000 ALTER TABLE `Books_author` DISABLE KEYS */;
INSERT INTO `Books_author` VALUES (1,'William Shakespeare','1564','British','male','authors/william-shakespeare-194895-1-402.jpg'),(2,'Agatha Christie','1890','British','female','authors/agatha-christie---mysterious-author.jpg'),(3,'Charles Dickens','1812','British','male','authors/charles-dickens-9274087-2-raw_gszgKR0.jpg'),(4,'Joanne Rowling','1965','British','female','authors/founder_V6zZDtt.jpg');
/*!40000 ALTER TABLE `Books_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_book_user`
--

DROP TABLE IF EXISTS `Books_book_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_book_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review` varchar(500) NOT NULL,
  `rate` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Books_book_user_Book_id_49eee4ca_fk_Books_books_id` (`Book_id`),
  KEY `Books_book_user_user_id_3596697f_fk_Books_profile_id` (`user_id`),
  CONSTRAINT `Books_book_user_Book_id_49eee4ca_fk_Books_books_id` FOREIGN KEY (`Book_id`) REFERENCES `Books_books` (`id`),
  CONSTRAINT `Books_book_user_user_id_3596697f_fk_Books_profile_id` FOREIGN KEY (`user_id`) REFERENCES `Books_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_book_user`
--

LOCK TABLES `Books_book_user` WRITE;
/*!40000 ALTER TABLE `Books_book_user` DISABLE KEYS */;
INSERT INTO `Books_book_user` VALUES (1,'excellent','4','read',1,1),(2,'good','3','wishlist',3,1);
/*!40000 ALTER TABLE `Books_book_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_books`
--

DROP TABLE IF EXISTS `Books_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `summary` varchar(500) NOT NULL,
  `author_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Books_books_author_id_id_b3443e1c_fk_Books_author_id` (`author_id_id`),
  CONSTRAINT `Books_books_author_id_id_b3443e1c_fk_Books_author_id` FOREIGN KEY (`author_id_id`) REFERENCES `Books_author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_books`
--

LOCK TABLES `Books_books` WRITE;
/*!40000 ALTER TABLE `Books_books` DISABLE KEYS */;
INSERT INTO `Books_books` VALUES (1,'King Lear','Drama','books/51ePrzFXLL._SX319_BO1204203200_.jpg','King Lear is a tragedy written by William Shakespeare. It depicts the gradual descent into madness of the title character, after he disposes of his kingdom giving bequests to two of his three daughters',1),(2,'Hamlet','Tragedy','books/images_1.jpeg','The Tragedy of Hamlet, Prince of Denmark, often shortened to Hamlet, is a tragedy written by William Shakespeare at an uncertain date between 1599 and 1602. Wikipedia',1),(3,'Murder on the Orient Express','Crime Fiction','books/images.jpeg','Murder on the Orient Express is a detective novel by Agatha Christie featuring the Belgian detective Hercule Poirot. It was first published in the United Kingdom by the Collins Crime Club on 1 January 1934.',2),(4,'Oliver Twist','Novel','books/oliver_Wdg8XbA.jpeg','Oliver Twist; or, the Parish Boy\'s Progress is author Charles Dickens\'s second novel, and was first published as a serial 1837–39. The story centres on orphan Oliver Twist, born in a workhouse and sold into apprenticeship with an undertaker. Wikipedia',3),(5,'Harry Potter and the Philosopher\'s Stone','Fantasy Fiction','books/harry_E4NULSA.jpeg','Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. It is the first novel in the Harry Potter series and Rowling\'s debut novel, first published in 1997 by Bloomsbury. Wikipedia',4);
/*!40000 ALTER TABLE `Books_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_category`
--

DROP TABLE IF EXISTS `Books_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_category`
--

LOCK TABLES `Books_category` WRITE;
/*!40000 ALTER TABLE `Books_category` DISABLE KEYS */;
INSERT INTO `Books_category` VALUES (1,'Drama'),(2,'Tragedy'),(3,'Crime Fiction'),(4,'Novel'),(5,'Fantasy Fiction');
/*!40000 ALTER TABLE `Books_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_category_Books`
--

DROP TABLE IF EXISTS `Books_category_Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_category_Books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Books_category_Books_category_id_books_id_76a47044_uniq` (`category_id`,`books_id`),
  KEY `Books_category_Books_books_id_0ec4f85a_fk_Books_books_id` (`books_id`),
  CONSTRAINT `Books_category_Books_books_id_0ec4f85a_fk_Books_books_id` FOREIGN KEY (`books_id`) REFERENCES `Books_books` (`id`),
  CONSTRAINT `Books_category_Books_category_id_45e96e8e_fk_Books_category_id` FOREIGN KEY (`category_id`) REFERENCES `Books_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_category_Books`
--

LOCK TABLES `Books_category_Books` WRITE;
/*!40000 ALTER TABLE `Books_category_Books` DISABLE KEYS */;
INSERT INTO `Books_category_Books` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `Books_category_Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_profile`
--

DROP TABLE IF EXISTS `Books_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Books_profile_user_id_16ae0570_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_profile`
--

LOCK TABLES `Books_profile` WRITE;
/*!40000 ALTER TABLE `Books_profile` DISABLE KEYS */;
INSERT INTO `Books_profile` VALUES (1,'users/27720691_1416203468485359_1486791678_n.jpg',1),(2,'users/20376108_1303727399755878_1008197757579655835_n_rwxzeKI.jpg',2),(3,'users/25446129_10214563452546410_4755706134124369721_n_E533Tpb.jpg',3);
/*!40000 ALTER TABLE `Books_profile` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add category',1,'add_category'),(2,'Can change category',1,'change_category'),(3,'Can delete category',1,'delete_category'),(4,'Can add books',2,'add_books'),(5,'Can change books',2,'change_books'),(6,'Can delete books',2,'delete_books'),(7,'Can add author',3,'add_author'),(8,'Can change author',3,'change_author'),(9,'Can delete author',3,'delete_author'),(10,'Can add profile',4,'add_profile'),(11,'Can change profile',4,'change_profile'),(12,'Can delete profile',4,'delete_profile'),(13,'Can add book_user',5,'add_book_user'),(14,'Can change book_user',5,'change_book_user'),(15,'Can delete book_user',5,'delete_book_user'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add permission',7,'add_permission'),(20,'Can change permission',7,'change_permission'),(21,'Can delete permission',7,'delete_permission'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add group',9,'add_group'),(26,'Can change group',9,'change_group'),(27,'Can delete group',9,'delete_group'),(28,'Can add content type',10,'add_contenttype'),(29,'Can change content type',10,'change_contenttype'),(30,'Can delete content type',10,'delete_contenttype'),(31,'Can add session',11,'add_session'),(32,'Can change session',11,'change_session'),(33,'Can delete session',11,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$aFqyVf4ybmTc$z87cuMizSwug/Q2kS3iCvyKJk/0MGJ9dAyC6HvmyVv0=','2018-02-14 19:06:25',1,'admin','Dina','Elgamal','',1,1,'2018-02-14 19:06:03'),(2,'pbkdf2_sha256$100000$z0z8med9BiLs$/+bYWeiRaAaHQtFuszIPlhhTiaXaIfl8/VTp3JW+EzI=',NULL,0,'rania@mohamed','','','',0,1,'2018-02-21 12:18:25'),(3,'pbkdf2_sha256$100000$Jrzos7COZd4t$azk3u5XiJku4/Ef5R8f7JsIXd/nBye1ytnbOyP3WlBs=',NULL,0,'enas@maher','','','',0,1,'2018-02-21 12:37:37');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-14 19:06:59','1','author object (1)',1,'[{\"added\": {}}]',3,1),(2,'2018-02-14 19:07:30','1','books object (1)',1,'[{\"added\": {}}]',2,1),(3,'2018-02-14 19:07:43','1','category object (1)',1,'[{\"added\": {}}]',1,1),(4,'2018-02-14 19:09:59','2','books object (2)',1,'[{\"added\": {}}]',2,1),(5,'2018-02-14 19:10:14','2','category object (2)',1,'[{\"added\": {}}]',1,1),(6,'2018-02-14 19:11:59','2','author object (2)',1,'[{\"added\": {}}]',3,1),(7,'2018-02-14 19:12:33','3','books object (3)',1,'[{\"added\": {}}]',2,1),(8,'2018-02-14 19:12:45','3','category object (3)',1,'[{\"added\": {}}]',1,1),(9,'2018-02-14 19:27:11','1','Profile object (1)',1,'[{\"added\": {}}]',4,1),(10,'2018-02-14 20:19:44','1','book_user object (1)',1,'[{\"added\": {}}]',5,1),(11,'2018-02-14 20:20:27','2','book_user object (2)',1,'[{\"added\": {}}]',5,1),(12,'2018-02-15 18:17:08','1','admin',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',8,1),(13,'2018-02-15 18:21:54','1','Profile object (1)',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',4,1),(14,'2018-02-21 11:59:19','3','author object (3)',1,'[{\"added\": {}}]',3,1),(15,'2018-02-21 12:03:44','4','books object (4)',1,'[{\"added\": {}}]',2,1),(16,'2018-02-21 12:09:01','4','author object (4)',1,'[{\"added\": {}}]',3,1),(17,'2018-02-21 12:13:07','5','books object (5)',1,'[{\"added\": {}}]',2,1),(18,'2018-02-21 12:14:17','4','category object (4)',1,'[{\"added\": {}}]',1,1),(19,'2018-02-21 12:14:29','5','category object (5)',1,'[{\"added\": {}}]',1,1),(20,'2018-02-21 12:18:25','2','rania@mohamed',1,'[{\"added\": {}}]',8,1),(21,'2018-02-21 12:37:07','2','Profile object (2)',1,'[{\"added\": {}}]',4,1),(22,'2018-02-21 12:37:38','3','enas@maher',1,'[{\"added\": {}}]',8,1),(23,'2018-02-21 12:40:31','3','Profile object (3)',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(9,'auth','group'),(7,'auth','permission'),(8,'auth','user'),(3,'Books','author'),(2,'Books','books'),(5,'Books','book_user'),(1,'Books','category'),(4,'Books','profile'),(10,'contenttypes','contenttype'),(11,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-14 19:05:29'),(2,'auth','0001_initial','2018-02-14 19:05:32'),(3,'Books','0001_initial','2018-02-14 19:05:35'),(4,'admin','0001_initial','2018-02-14 19:05:36'),(5,'admin','0002_logentry_remove_auto_add','2018-02-14 19:05:36'),(6,'contenttypes','0002_remove_content_type_name','2018-02-14 19:05:37'),(7,'auth','0002_alter_permission_name_max_length','2018-02-14 19:05:37'),(8,'auth','0003_alter_user_email_max_length','2018-02-14 19:05:37'),(9,'auth','0004_alter_user_username_opts','2018-02-14 19:05:37'),(10,'auth','0005_alter_user_last_login_null','2018-02-14 19:05:37'),(11,'auth','0006_require_contenttypes_0002','2018-02-14 19:05:37'),(12,'auth','0007_alter_validators_add_error_messages','2018-02-14 19:05:37'),(13,'auth','0008_alter_user_username_max_length','2018-02-14 19:05:39'),(14,'auth','0009_alter_user_last_name_max_length','2018-02-14 19:05:39'),(15,'sessions','0001_initial','2018-02-14 19:05:39');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ua8lv2l2pvxoaepdre45c029zo1yer1j','OTc3ZTA5OGI3ZDUxMDhkYTMxMjM1YTRiZThiNjdjOGZlODNmMDEyODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIzYWMxYWQ3Y2MxMDQ1ZjlkY2ZmYTdhYWEwYThiOWE3OWJiZWVjYTYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-02-28 19:06:25');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-21 16:28:37
