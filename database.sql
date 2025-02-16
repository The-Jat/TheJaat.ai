-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: ultranew_v2
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'3u6Zg6isZPKpRtiXr6x2IVk8dJ8RmhXJ',1,'2023-12-24 09:07:02','2023-12-24 09:07:02','2023-12-24 09:07:02'),(2,2,'ixPb1czYmLoqusDdgNZJCPmajR7UmKl6',1,'2023-12-24 09:07:03','2023-12-24 09:07:03','2023-12-24 09:07:03');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Header ads','2024-12-24 00:00:00','header-ads','UNN1YS4RVZ','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2023-12-24 09:07:04','2023-12-24 09:07:04',1,NULL,NULL),(2,'Panel ads','2024-12-24 00:00:00','panel-ads','UNFDRDIWXY','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2023-12-24 09:07:04','2023-12-24 09:07:04',1,NULL,NULL),(3,'Top sidebar ads','2024-12-24 00:00:00','top-sidebar-ads','OVDDA6CBH7','banners/image-1.jpg','https://thesky9.com/',0,2,'published','2023-12-24 09:07:04','2023-12-24 09:07:04',1,NULL,NULL),(4,'Bottom sidebar ads','2024-12-24 00:00:00','bottom-sidebar-ads','DCQNVL1IV8','banners/image-2.jpg','https://thesky9.com/',0,3,'published','2023-12-24 09:07:04','2023-12-24 09:07:04',1,NULL,NULL),(5,'Custom ads 1','2024-12-24 00:00:00','custom-1','L2M9SOCVYB','banners/image-4.jpg','https://thesky9.com/',0,4,'published','2023-12-24 09:07:04','2023-12-24 09:07:04',1,NULL,NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
INSERT INTO `audit_histories` VALUES (5,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','172.31.0.1',0,1,'System Admin','info','2023-04-17 00:14:00','2023-04-17 00:14:00'),(6,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','172.31.0.1',0,1,'System Admin','info','2023-05-07 08:21:39','2023-05-07 08:21:39'),(7,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36','172.31.0.1',0,1,'System Admin','info','2023-05-14 15:32:43','2023-05-14 15:32:43'),(8,1,'page','{\"name\":\"Contact\",\"slug\":\"contact\",\"slug_id\":\"0\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Page\\\\Models\\\\Page\",\"description\":null,\"content\":\"<shortcode class=\\\"bb-shortcode\\\">[contact-form title=\\\"Get in Touch\\\"][\\/contact-form]<\\/shortcode><h3>Directions<\\/h3><shortcode class=\\\"bb-shortcode\\\">[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[\\/google-map]<\\/shortcode>\",\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":null,\"status\":\"published\",\"template\":\"right-sidebar\",\"image\":null}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36','172.31.0.1',1,8,'Contact','primary','2023-05-14 15:36:21','2023-05-14 15:36:21'),(9,1,'page','{\"name\":\"Contact\",\"slug\":\"contact\",\"slug_id\":\"0\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Page\\\\Models\\\\Page\",\"description\":null,\"content\":\"<shortcode class=\\\"bb-shortcode\\\">[contact-form title=\\\"Get in Touch\\\"][\\/contact-form]<\\/shortcode><h3>Directions<\\/h3><shortcode class=\\\"bb-shortcode\\\">[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[\\/google-map]<\\/shortcode>\",\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":null,\"status\":\"published\",\"template\":\"default\",\"image\":null}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36','172.31.0.1',1,8,'Contact','primary','2023-05-14 15:36:39','2023-05-14 15:36:39'),(10,1,'page','{\"name\":\"Contact\",\"slug\":\"contact\",\"slug_id\":\"0\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Page\\\\Models\\\\Page\",\"description\":null,\"content\":\"<shortcode class=\\\"bb-shortcode\\\">[contact-form title=\\\"Get in Touch\\\"][\\/contact-form]<\\/shortcode><h3>Directions<\\/h3><shortcode class=\\\"bb-shortcode\\\">[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[\\/google-map]<\\/shortcode>\",\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":null,\"status\":\"published\",\"template\":\"right-sidebar\",\"image\":null}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36','172.31.0.1',1,8,'Contact','primary','2023-05-14 15:36:48','2023-05-14 15:36:48'),(11,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','172.22.0.1',0,1,'Super Admin','info','2023-12-24 05:27:25','2023-12-24 05:27:25'),(12,2,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','172.22.0.1',0,2,'Joanie Langosh','info','2023-12-24 07:48:14','2023-12-24 07:48:14');
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_likes`
--

DROP TABLE IF EXISTS `bb_comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`),
  KEY `bb_comment_likes_comment_id_index` (`comment_id`),
  KEY `bb_comment_likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_likes`
--

LOCK TABLES `bb_comment_likes` WRITE;
/*!40000 ALTER TABLE `bb_comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_recommends`
--

DROP TABLE IF EXISTS `bb_comment_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_recommends` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`),
  KEY `bb_comment_recommends_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_recommends`
--

LOCK TABLES `bb_comment_recommends` WRITE;
/*!40000 ALTER TABLE `bb_comment_recommends` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_recommends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_users`
--

DROP TABLE IF EXISTS `bb_comment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bb_comment_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_users`
--

LOCK TABLES `bb_comment_users` WRITE;
/*!40000 ALTER TABLE `bb_comment_users` DISABLE KEYS */;
INSERT INTO `bb_comment_users` VALUES (1,'Christian','dare.russell@gmail.com','$2y$12$k5R/3eK1kpbMtAfkgQR9jO4IQ4JBrFYFtdelXC9yDHRAyZUiZ3eOO',2153,NULL,'2023-12-24 09:07:20','2023-12-24 09:07:20','Welch'),(2,'Armani','myron.hettinger@gmail.com','$2y$12$7P/CpEy2keJPvGZ/dBkIBuWpsBtQthAIhVYZT7vAKMfhHTruuJDLq',2152,NULL,'2023-12-24 09:07:20','2023-12-24 09:07:20','Upton'),(3,'Robin','tyra32@yahoo.com','$2y$12$6f6/anjrOOpIJMbu9hj/Eu/U9XQGNoWzkv5E0H7xGmFUHApcJddq2',2156,NULL,'2023-12-24 09:07:21','2023-12-24 09:07:21','Boyer'),(4,'Emilio','luella69@hauck.biz','$2y$12$28AV8bOQwpJVU.g9VdB3XOcRH3OvgvwAirABr/rsA1yTGvAcX5diK',2153,NULL,'2023-12-24 09:07:21','2023-12-24 09:07:21','Ward'),(5,'Karen','jhegmann@johnson.net','$2y$12$7jlO/SFts.NsyYinWrHbvO4RYpok1ZuSHhU/eImBiJuL89fAmI.LS',2152,NULL,'2023-12-24 09:07:21','2023-12-24 09:07:21','Ondricka'),(6,'Cornell','vschultz@yahoo.com','$2y$12$TnvIiSn4PG./5IOdwAGX3eParvkHsq4UsDAgkJpacuWMIV4ezmoW6',2155,NULL,'2023-12-24 09:07:21','2023-12-24 09:07:21','Rippin'),(7,'Leonie','ggulgowski@marvin.biz','$2y$12$l5.Wi4IcwYZBetsUeGCxq.qKHvwg.P123LfXj9v0KVkW9uIVpzAIe',2154,NULL,'2023-12-24 09:07:21','2023-12-24 09:07:21','Gleichner'),(8,'Wilfred','louie15@lang.org','$2y$12$BnN.QTZRr7Xed.l1TU93oOz0oyal4rcf23cWIGYyzOaF51tfCHjzO',2153,NULL,'2023-12-24 09:07:22','2023-12-24 09:07:22','Kerluke'),(9,'Guy','yzieme@yahoo.com','$2y$12$gSgWPz4H5IQ9IDiwJCQQBOQA6ecfWmULgOWHbpZDTL0rtD4tL4Zia',2156,NULL,'2023-12-24 09:07:22','2023-12-24 09:07:22','Crist'),(10,'Granville','tlittel@greenfelder.net','$2y$12$C4EJKbQx3f.xqqbtQOqhnefT1LjkfSJRQMswOlOUvBHKkCh3WeF.6',2152,NULL,'2023-12-24 09:07:22','2023-12-24 09:07:22','Pfannerstill');
/*!40000 ALTER TABLE `bb_comment_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comments`
--

DROP TABLE IF EXISTS `bb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `like_count` int NOT NULL DEFAULT '0',
  `reply_count` int NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comments`
--

LOCK TABLES `bb_comments` WRITE;
/*!40000 ALTER TABLE `bb_comments` DISABLE KEYS */;
INSERT INTO `bb_comments` VALUES (1,'I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to.',1,'Botble\\Blog\\Models\\Post','63.90.71.103',4,'published',0,0,0,'2023-12-09 13:42:41','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(2,'For, you see, Miss, this here ought to have it explained,\' said the Dormouse; \'VERY ill.\' Alice.',1,'Botble\\Blog\\Models\\Post','44.72.93.116',7,'published',0,0,0,'2023-12-20 11:03:27','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(3,'Alice, whose thoughts were still running on the top of his teacup and bread-and-butter, and went.',1,'Botble\\Blog\\Models\\Post','113.19.94.78',9,'published',0,1,0,'2023-12-12 02:55:34','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(4,'I can\'t understand it myself to begin again, it was the first verse,\' said the Gryphon, the.',1,'Botble\\Blog\\Models\\Post','108.137.15.127',5,'published',0,1,0,'2023-12-23 01:52:42','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(5,'Gryphon interrupted in a hoarse growl, \'the world would go through,\' thought poor Alice, \'to speak.',1,'Botble\\Blog\\Models\\Post','229.72.181.89',6,'published',0,0,0,'2023-12-09 09:48:07','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(6,'Let this be a book of rules for shutting people up like a candle. I wonder what was on the ground.',1,'Botble\\Blog\\Models\\Post','109.23.186.62',10,'published',0,0,0,'2023-11-30 15:46:06','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(7,'I have none, Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the last words out.',1,'Botble\\Blog\\Models\\Post','212.224.124.185',5,'published',0,0,4,'2023-12-09 21:00:06','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(8,'Mouse, sharply and very nearly in the kitchen that did not appear, and after a few minutes she.',1,'Botble\\Blog\\Models\\Post','196.189.65.172',6,'published',0,0,3,'2023-12-09 22:42:48','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(9,'Gryphon, and, taking Alice by the little golden key was too much overcome to do it! Oh dear! I\'d.',2,'Botble\\Blog\\Models\\Post','9.54.24.15',10,'published',0,1,0,'2023-11-29 05:50:08','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(10,'Majesty,\' he began. \'You\'re a very fine day!\' said a sleepy voice behind her. \'Collar that.',2,'Botble\\Blog\\Models\\Post','76.219.255.60',6,'published',0,0,0,'2023-12-02 23:40:15','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(11,'YOURS: I don\'t like them raw.\' \'Well, be off, and found in it about four inches deep and reaching.',2,'Botble\\Blog\\Models\\Post','98.237.245.100',5,'published',0,0,0,'2023-12-09 17:41:12','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(12,'KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'and those twelve creatures,\' (she was.',2,'Botble\\Blog\\Models\\Post','202.174.121.91',3,'published',0,0,0,'2023-12-06 09:55:11','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(13,'When the procession moved on, three of her going, though she looked up, and began to cry again.',2,'Botble\\Blog\\Models\\Post','179.127.213.215',8,'published',0,1,0,'2023-12-05 04:20:42','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(14,'Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a funny watch!\' she remarked. \'There isn\'t.',2,'Botble\\Blog\\Models\\Post','236.214.163.149',10,'published',0,0,0,'2023-12-12 23:45:35','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(15,'CHAPTER IV. The Rabbit started violently, dropped the white kid gloves in one hand and a scroll of.',2,'Botble\\Blog\\Models\\Post','73.182.40.248',6,'published',0,0,9,'2023-12-14 02:48:12','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(16,'Duchess, \'as pigs have to beat them off, and found that her neck kept getting entangled among the.',2,'Botble\\Blog\\Models\\Post','175.195.139.20',1,'published',0,0,13,'2023-12-19 01:42:52','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(17,'I can reach the key; and if it thought that SOMEBODY ought to be listening, so she began fancying.',3,'Botble\\Blog\\Models\\Post','85.87.202.39',1,'published',0,0,0,'2023-12-18 20:40:58','2023-12-24 09:07:22','Botble\\Comment\\Models\\CommentUser'),(18,'Caterpillar angrily, rearing itself upright as it didn\'t sound at all fairly,\' Alice began, in a.',3,'Botble\\Blog\\Models\\Post','92.46.145.98',1,'published',0,0,0,'2023-11-28 08:07:07','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(19,'Caterpillar and Alice joined the procession, wondering very much to-night, I should be free of.',3,'Botble\\Blog\\Models\\Post','12.182.182.60',1,'published',0,0,0,'2023-12-23 17:50:31','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(20,'There was a bright idea came into her face. \'Very,\' said Alice: \'allow me to him: She gave me a.',3,'Botble\\Blog\\Models\\Post','36.39.60.218',3,'published',0,1,0,'2023-12-23 23:31:15','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(21,'This speech caused a remarkable sensation among the bright flower-beds and the other end of the.',3,'Botble\\Blog\\Models\\Post','235.60.156.74',9,'published',0,1,0,'2023-12-11 22:41:52','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(22,'And with that she did so, and were quite dry again, the Dodo solemnly presented the thimble.',3,'Botble\\Blog\\Models\\Post','159.253.247.159',5,'published',0,0,0,'2023-11-27 23:55:22','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(23,'No room!\' they cried out when they met in the act of crawling away: besides all this, there was no.',3,'Botble\\Blog\\Models\\Post','224.208.40.151',3,'published',0,0,20,'2023-12-20 21:04:04','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(24,'Alice to herself. \'Shy, they seem to dry me at home! Why, I do it again and again.\' \'You are all.',3,'Botble\\Blog\\Models\\Post','159.228.224.68',6,'published',0,0,21,'2023-12-21 20:33:47','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(25,'He was looking up into the garden door. Poor Alice! It was so much contradicted in her face, with.',21,'Botble\\Blog\\Models\\Post','166.149.211.5',6,'published',0,0,0,'2023-12-04 06:28:38','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(26,'Mock Turtle, who looked at the door-- Pray, what is the use of repeating all that stuff,\' the Mock.',21,'Botble\\Blog\\Models\\Post','127.87.136.119',5,'published',0,0,0,'2023-12-20 17:15:07','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(27,'Alice. \'Why not?\' said the White Rabbit, who was sitting next to her. \'I can tell you his.',21,'Botble\\Blog\\Models\\Post','156.26.46.78',5,'published',0,1,0,'2023-12-19 07:39:31','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(28,'The long grass rustled at her feet, for it now, I suppose, by being drowned in my life!\' Just as.',21,'Botble\\Blog\\Models\\Post','156.251.245.120',10,'published',0,0,0,'2023-12-16 06:01:55','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(29,'But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as she could, for her to.',21,'Botble\\Blog\\Models\\Post','25.49.211.200',3,'published',0,1,0,'2023-12-16 15:12:28','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(30,'Gryphon, half to itself, \'Oh dear! Oh dear! I wish I could not remember the simple and loving.',21,'Botble\\Blog\\Models\\Post','88.161.178.251',10,'published',0,0,0,'2023-12-12 14:27:32','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(31,'But the insolence of his great wig.\' The judge, by the officers of the cattle in the sea!\' cried.',21,'Botble\\Blog\\Models\\Post','187.34.62.44',10,'published',0,0,29,'2023-12-24 05:14:36','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(32,'Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was such a hurry that she began.',21,'Botble\\Blog\\Models\\Post','171.192.172.43',9,'published',0,0,27,'2023-12-14 01:21:07','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(33,'Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the.',22,'Botble\\Blog\\Models\\Post','98.226.79.241',6,'published',0,0,0,'2023-12-22 20:02:44','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(34,'THE KING AND QUEEN OF HEARTS. Alice was rather doubtful whether she ought not to be beheaded!\'.',22,'Botble\\Blog\\Models\\Post','83.152.189.107',7,'published',0,1,0,'2023-12-14 05:32:55','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(35,'Alice; \'that\'s not at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was soon.',22,'Botble\\Blog\\Models\\Post','25.53.57.0',3,'published',0,0,0,'2023-12-23 01:45:45','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(36,'Alice remarked. \'Oh, you can\'t take more.\' \'You mean you can\'t help that,\' said the King said to.',22,'Botble\\Blog\\Models\\Post','91.18.146.216',4,'published',0,1,0,'2023-12-20 14:19:06','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(37,'PRECIOUS nose\'; as an explanation; \'I\'ve none of YOUR business, Two!\' said Seven. \'Yes, it IS his.',22,'Botble\\Blog\\Models\\Post','49.133.173.174',9,'published',0,0,0,'2023-11-25 13:15:54','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(38,'Alice remained looking thoughtfully at the Mouse\'s tail; \'but why do you want to go! Let me see.',22,'Botble\\Blog\\Models\\Post','171.68.93.100',7,'published',0,0,0,'2023-12-06 16:52:47','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(39,'Hatter. \'Stolen!\' the King triumphantly, pointing to the general conclusion, that wherever you go.',22,'Botble\\Blog\\Models\\Post','125.95.40.130',10,'published',0,0,34,'2023-12-09 11:12:45','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(40,'Lizard, who seemed to her in the court!\' and the jury asked. \'That I can\'t take more.\' \'You mean.',22,'Botble\\Blog\\Models\\Post','49.38.27.149',6,'published',0,0,36,'2023-12-11 01:16:35','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(41,'Dinah my dear! Let this be a great thistle, to keep herself from being run over; and the Dormouse.',23,'Botble\\Blog\\Models\\Post','176.243.145.186',9,'published',0,0,0,'2023-11-27 15:07:00','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(42,'Alice heard the Rabbit came near her, she began, in rather a handsome pig, I think.\' And she went.',23,'Botble\\Blog\\Models\\Post','148.189.144.69',7,'published',0,0,0,'2023-12-22 20:04:14','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(43,'Gryphon, lying fast asleep in the same height as herself; and when she had never had fits, my.',23,'Botble\\Blog\\Models\\Post','178.219.210.147',6,'published',0,0,0,'2023-11-29 03:42:55','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(44,'Gryphon. \'How the creatures argue. It\'s enough to try the thing at all. \'But perhaps it was.',23,'Botble\\Blog\\Models\\Post','167.103.25.82',3,'published',0,1,0,'2023-12-21 08:19:14','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(45,'And yet you incessantly stand on their slates, when the Rabbit say, \'A barrowful will do, to begin.',23,'Botble\\Blog\\Models\\Post','61.124.218.234',2,'published',0,1,0,'2023-12-12 20:43:08','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(46,'Now you know.\' \'And what are they made of?\' \'Pepper, mostly,\' said the Hatter: \'as the things.',23,'Botble\\Blog\\Models\\Post','34.62.161.200',10,'published',0,0,0,'2023-12-19 00:53:27','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(47,'Dormouse; \'VERY ill.\' Alice tried to fancy what the moral of that is--\"Birds of a book,\' thought.',23,'Botble\\Blog\\Models\\Post','241.139.62.160',1,'published',0,0,44,'2023-12-10 16:40:24','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser'),(48,'Gryphon, and the three were all turning into little cakes as they were nice grand words to say.).',23,'Botble\\Blog\\Models\\Post','143.188.131.177',9,'published',0,0,45,'2023-12-17 04:12:27','2023-12-24 09:07:23','Botble\\Comment\\Models\\CommentUser');
/*!40000 ALTER TABLE `bb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13'),(2,'Lifestyle',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13'),(3,'Travel Tips',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13'),(4,'Healthy',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13'),(5,'Fashion',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13'),(6,'Hotel',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13'),(7,'Nature',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2023-12-24 09:07:13','2023-12-24 09:07:13');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Phong cách sống',NULL),('vi',2,'Sức khỏe',NULL),('vi',3,'Món ngon',NULL),('vi',4,'Sách',NULL),('vi',5,'Mẹo du lịch',NULL),('vi',6,'Khách sạn',NULL),('vi',7,'Thiên nhiên',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Ms. Camille Becker Jr.','nitzsche.braden@example.org','(380) 455-3357','2407 Mckayla Passage Suite 145\nSouth Noelia, MD 48666','Assumenda rerum voluptas neque laboriosam labore.','Reiciendis quae quasi asperiores est voluptatem inventore beatae doloremque. Consequatur dolorem harum repudiandae perspiciatis consectetur voluptatem debitis. Numquam sed consequatur magni tempora sapiente laborum asperiores. Enim alias sint nostrum deserunt placeat ea sunt. Laborum dolorem sequi et necessitatibus placeat perspiciatis repudiandae. Soluta praesentium omnis omnis inventore sed.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(2,'Kathlyn Glover','mohamed.powlowski@example.net','+1 (304) 328-5729','4617 Flatley Forest\nPacochatown, TX 99912','Ut non minima natus fuga occaecati rem molestiae.','At officiis atque in illo reiciendis. Et voluptatem nihil dolorem cum commodi. Expedita in inventore ex et. Iste voluptatem aliquid odio earum eum accusamus. Ut possimus ut voluptatem minima culpa unde asperiores. Unde odit aut animi nesciunt. Enim rerum ullam non porro a eaque dolores. Sit qui et in deleniti qui. Labore deleniti minus cum nihil facere ex. Ea explicabo in minus doloribus aut. Sequi eos reprehenderit non nulla non veniam error.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(3,'Kaela Hauck','quitzon.clifton@example.com','435-847-4767','82826 Abdiel Light\nPort Orville, SC 34517','Voluptas aut culpa est minus fugit delectus.','Error ratione rerum magni rerum maxime. Et blanditiis ab libero pariatur dolor. Veniam aliquam omnis eos iusto est et quod. Cumque et aut voluptatibus eos ea qui minus. Voluptates officia eaque nostrum molestiae nisi. Eligendi aut distinctio voluptatum ut et ut. Et et beatae architecto quasi quo harum deserunt consectetur. Ut placeat rem minima accusantium aut pariatur numquam et. A rem adipisci provident vel rerum voluptatum. Debitis vitae nihil nostrum perferendis aliquam.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(4,'Nickolas Lynch','xwuckert@example.com','225-591-6008','768 Sedrick Vista\nEast Neoma, IL 66275-7848','Eos minima consequuntur ullam nihil et.','Mollitia dolor repellendus eligendi ut quasi laborum. Architecto est molestiae odio dolores voluptatibus. Libero qui iusto incidunt consectetur odit atque. Sit omnis porro ut voluptatibus quod. Et odio doloremque laboriosam pariatur voluptatem dolores ut. Sequi consequatur voluptatibus autem maiores consequatur ut unde. Id aut reprehenderit error necessitatibus eos cum sed doloribus.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(5,'Dr. Nils Bartell','hoyt70@example.net','+1.281.860.3548','614 Yost Ferry\nKendraton, VA 70201-3570','Id dolore cumque explicabo voluptas aut et error.','Est quasi praesentium saepe amet animi odit cupiditate aliquam. Maxime quaerat omnis laudantium vel. Enim tempora dolores debitis ut occaecati et. Numquam ad eos amet similique repudiandae ea. Rerum molestiae molestias qui. Ut consectetur magni occaecati perferendis numquam. Velit modi nesciunt vitae est consequatur quis est aperiam. Sequi natus est facere quae natus. Officia aut nobis quia. Ipsum voluptas sunt tempore blanditiis.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(6,'Domingo Wintheiser','qlind@example.net','1-380-250-3177','694 Kertzmann Court Suite 349\nVolkmanchester, AR 58565-2202','Non tempora reiciendis natus debitis quisquam.','Dolor explicabo velit et laborum eos esse natus id. Vitae voluptates voluptas minima nesciunt recusandae aut et. Dolores sequi perspiciatis maxime et in. Dolores sed adipisci ullam est qui officia sint. Nam sed iure id omnis mollitia alias. Expedita magni placeat qui eveniet alias. Est nemo laborum et eaque beatae. Asperiores ipsum magnam et neque et autem et. Voluptatum temporibus ut excepturi. Error et architecto architecto quia.','unread','2023-12-24 09:07:06','2023-12-24 09:07:06'),(7,'Nickolas Prohaska','freda47@example.net','+1 (714) 704-9814','489 Emilio Overpass Apt. 774\nLilahaven, NE 63417-7126','Est omnis esse quibusdam eum laborum.','Iusto qui nostrum nihil molestiae consequuntur incidunt explicabo ab. Est animi inventore autem. Et voluptatum temporibus voluptatibus ipsa ex qui. Quasi voluptates similique ipsam beatae eveniet est. Nostrum quo labore non magni et facere qui et. Architecto est ea beatae nostrum voluptates fuga. Repudiandae pariatur consequuntur necessitatibus id. Omnis quos eos quo ut quod.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(8,'Lawrence Larkin','dawson70@example.org','+1.757.535.1838','17675 Kihn Walk Suite 605\nKrajcikview, IN 91541','Ut odit adipisci est porro ut reprehenderit.','Excepturi est adipisci vitae rerum tempora. Eligendi aut dolorem voluptas nostrum. Expedita perspiciatis non repellendus rerum quos voluptas sit. Aut ullam nisi nulla placeat incidunt sit officia. Sequi beatae molestiae consequatur voluptas et perspiciatis. Qui non et voluptates. Qui nesciunt similique voluptatem et aperiam est. Quibusdam expedita quia porro iste eos. Quo numquam et quia alias. Molestias ipsam a nisi adipisci. Corporis rerum quibusdam recusandae consequuntur quia.','read','2023-12-24 09:07:06','2023-12-24 09:07:06'),(9,'Edward Shanahan','hegmann.janice@example.net','1-260-539-6681','32904 Herman Roads Suite 936\nLake Wilson, TX 61534-7261','Repellat dolor error velit id.','Tempora in delectus illo ratione. Iste nostrum eveniet et quae reiciendis quo. In id labore vero quo occaecati voluptate ullam mollitia. Ipsam qui delectus nostrum dicta nihil optio voluptas beatae. Sit aliquid minima non eum. Voluptate sit deleniti natus. Magnam incidunt corrupti commodi quam. Quod ab asperiores eum quo. Hic vitae inventore ad beatae vel et consequatur.','unread','2023-12-24 09:07:06','2023-12-24 09:07:06'),(10,'Dr. Reyna Reilly PhD','alexane90@example.com','1-657-254-5274','447 Lamont Forge\nNew Junior, VA 46593','Voluptatem vero aut qui et voluptatem.','Facilis quos aut non. Sint voluptas dolor qui atque numquam dicta debitis. Illo magni aut et qui vel. Unde id aperiam nemo quia illo laborum. Unde doloremque a dolorum harum. Ducimus eveniet suscipit voluptate in dolore reprehenderit. Quis voluptatum dolorum sint id dolore rerum non accusamus. Facere itaque fuga est asperiores. Sapiente est inventore deleniti est sit totam vero. Ab sapiente veritatis magnam nihil esse.','unread','2023-12-24 09:07:06','2023-12-24 09:07:06');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
INSERT INTO `dashboard_widgets` VALUES (1,'widget_total_themes','2022-10-23 23:46:57','2022-10-23 23:46:57'),(2,'widget_total_users','2022-10-23 23:46:57','2022-10-23 23:46:57'),(3,'widget_total_pages','2022-10-23 23:46:57','2022-10-23 23:46:57'),(4,'widget_total_plugins','2022-10-23 23:46:57','2022-10-23 23:46:57'),(5,'widget_analytics_general','2022-10-23 23:46:57','2022-10-23 23:46:57'),(6,'widget_analytics_page','2022-10-23 23:46:57','2022-10-23 23:46:57'),(7,'widget_analytics_browser','2022-10-23 23:46:57','2022-10-23 23:46:57'),(8,'widget_posts_recent','2022-10-23 23:46:57','2022-10-23 23:46:57'),(9,'widget_analytics_referrer','2022-10-23 23:46:57','2022-10-23 23:46:57'),(10,'widget_audit_logs','2022-10-23 23:46:57','2022-10-23 23:46:57'),(11,'widget_request_errors','2022-10-23 23:46:57','2022-10-23 23:46:57');
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_posts`
--

DROP TABLE IF EXISTS `favorite_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `type` enum('favorite','bookmark') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorite_posts_post_id_user_id_type_unique` (`post_id`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_posts`
--

LOCK TABLES `favorite_posts` WRITE;
/*!40000 ALTER TABLE `favorite_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Nam id sequi qui deserunt et nulla qui. Iusto adipisci aliquid ea et provident. Vitae et repellat sit.',1,0,'galleries/1.jpg',1,'published','2023-12-24 09:07:06','2023-12-24 09:07:06'),(2,'New Day','Rem quaerat et perspiciatis quod laudantium voluptates consectetur. Voluptatem optio nobis quod non. Accusamus aut et nihil rerum velit et dolore.',1,0,'galleries/2.jpg',1,'published','2023-12-24 09:07:06','2023-12-24 09:07:06'),(3,'Happy Day','Explicabo consequatur explicabo blanditiis culpa illum facere. Neque aperiam nemo consequatur qui officia est porro. Mollitia sed repudiandae nulla.',1,0,'galleries/3.jpg',1,'published','2023-12-24 09:07:06','2023-12-24 09:07:06'),(4,'Nature','Aliquam necessitatibus et aliquid ullam eos. Asperiores est ipsum cupiditate architecto voluptas.',1,0,'galleries/4.jpg',1,'published','2023-12-24 09:07:06','2023-12-24 09:07:06'),(5,'Morning','Suscipit voluptatum porro fugit quos. Vero eaque dolor ut error iste beatae.',1,0,'galleries/5.jpg',1,'published','2023-12-24 09:07:06','2023-12-24 09:07:06'),(6,'Photography','Optio consectetur voluptas et quisquam et aperiam. Molestiae iure error et. Quidem non officiis ut libero. Iste nemo harum et dolores pariatur nam.',1,0,'galleries/6.jpg',1,'published','2023-12-24 09:07:06','2023-12-24 09:07:06');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
INSERT INTO `galleries_translations` VALUES ('vi',1,'Hoàn hảo',NULL),('vi',2,'Ngày mới',NULL),('vi',3,'Ngày hạnh phúc',NULL),('vi',4,'Thiên nhiên',NULL),('vi',5,'Buổi sáng',NULL),('vi',6,'Nghệ thuật',NULL);
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Omnis odio porro praesentium rerum. Nam cupiditate rem et earum ut quam. Occaecati inventore qui expedita earum non et dolor.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et eligendi iusto ipsam earum totam est. Sint veniam aut exercitationem et saepe recusandae dolorum. Qui accusamus fugiat ipsa necessitatibus iure.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Excepturi quas totam sapiente id quis laboriosam quis modi. Voluptatem ipsum id distinctio. Voluptatum architecto iusto ut beatae possimus provident.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Reiciendis hic suscipit tempora rerum eum doloribus. Voluptas sunt magnam ea asperiores sit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Vel fugiat magni ratione quidem. Harum dignissimos facere beatae et est rem. Ducimus eum unde veritatis magnam. Odio qui harum at deleniti id quia.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nam sit dicta velit adipisci. Praesentium temporibus nisi ut cum et enim. Voluptatem rem explicabo perspiciatis adipisci minus.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Dolorem asperiores molestias ratione odio nulla. Eum magni quod esse earum nemo doloribus rem.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Ipsum voluptate nam totam placeat. Magnam ullam totam voluptates repellat modi. Eaque provident fugit beatae et et occaecati.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis ipsa totam in. Molestiae quam modi ipsum corrupti. Impedit quis aliquid magni voluptatem ex suscipit. Enim laborum deleniti adipisci natus.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Et molestiae voluptates eum sunt aut. Molestias doloremque laborum velit quos quas qui iusto. Omnis est quisquam ad qui dolor.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2023-12-24 09:07:06','2023-12-24 09:07:06'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Omnis odio porro praesentium rerum. Nam cupiditate rem et earum ut quam. Occaecati inventore qui expedita earum non et dolor.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et eligendi iusto ipsam earum totam est. Sint veniam aut exercitationem et saepe recusandae dolorum. Qui accusamus fugiat ipsa necessitatibus iure.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Excepturi quas totam sapiente id quis laboriosam quis modi. Voluptatem ipsum id distinctio. Voluptatum architecto iusto ut beatae possimus provident.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Reiciendis hic suscipit tempora rerum eum doloribus. Voluptas sunt magnam ea asperiores sit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Vel fugiat magni ratione quidem. Harum dignissimos facere beatae et est rem. Ducimus eum unde veritatis magnam. Odio qui harum at deleniti id quia.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nam sit dicta velit adipisci. Praesentium temporibus nisi ut cum et enim. Voluptatem rem explicabo perspiciatis adipisci minus.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Dolorem asperiores molestias ratione odio nulla. Eum magni quod esse earum nemo doloribus rem.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Ipsum voluptate nam totam placeat. Magnam ullam totam voluptates repellat modi. Eaque provident fugit beatae et et occaecati.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis ipsa totam in. Molestiae quam modi ipsum corrupti. Impedit quis aliquid magni voluptatem ex suscipit. Enim laborum deleniti adipisci natus.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Et molestiae voluptates eum sunt aut. Molestias doloremque laborum velit quos quas qui iusto. Omnis est quisquam ad qui dolor.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2023-12-24 09:07:06','2023-12-24 09:07:06'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Omnis odio porro praesentium rerum. Nam cupiditate rem et earum ut quam. Occaecati inventore qui expedita earum non et dolor.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et eligendi iusto ipsam earum totam est. Sint veniam aut exercitationem et saepe recusandae dolorum. Qui accusamus fugiat ipsa necessitatibus iure.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Excepturi quas totam sapiente id quis laboriosam quis modi. Voluptatem ipsum id distinctio. Voluptatum architecto iusto ut beatae possimus provident.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Reiciendis hic suscipit tempora rerum eum doloribus. Voluptas sunt magnam ea asperiores sit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Vel fugiat magni ratione quidem. Harum dignissimos facere beatae et est rem. Ducimus eum unde veritatis magnam. Odio qui harum at deleniti id quia.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nam sit dicta velit adipisci. Praesentium temporibus nisi ut cum et enim. Voluptatem rem explicabo perspiciatis adipisci minus.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Dolorem asperiores molestias ratione odio nulla. Eum magni quod esse earum nemo doloribus rem.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Ipsum voluptate nam totam placeat. Magnam ullam totam voluptates repellat modi. Eaque provident fugit beatae et et occaecati.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis ipsa totam in. Molestiae quam modi ipsum corrupti. Impedit quis aliquid magni voluptatem ex suscipit. Enim laborum deleniti adipisci natus.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Et molestiae voluptates eum sunt aut. Molestias doloremque laborum velit quos quas qui iusto. Omnis est quisquam ad qui dolor.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2023-12-24 09:07:06','2023-12-24 09:07:06'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Omnis odio porro praesentium rerum. Nam cupiditate rem et earum ut quam. Occaecati inventore qui expedita earum non et dolor.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et eligendi iusto ipsam earum totam est. Sint veniam aut exercitationem et saepe recusandae dolorum. Qui accusamus fugiat ipsa necessitatibus iure.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Excepturi quas totam sapiente id quis laboriosam quis modi. Voluptatem ipsum id distinctio. Voluptatum architecto iusto ut beatae possimus provident.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Reiciendis hic suscipit tempora rerum eum doloribus. Voluptas sunt magnam ea asperiores sit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Vel fugiat magni ratione quidem. Harum dignissimos facere beatae et est rem. Ducimus eum unde veritatis magnam. Odio qui harum at deleniti id quia.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nam sit dicta velit adipisci. Praesentium temporibus nisi ut cum et enim. Voluptatem rem explicabo perspiciatis adipisci minus.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Dolorem asperiores molestias ratione odio nulla. Eum magni quod esse earum nemo doloribus rem.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Ipsum voluptate nam totam placeat. Magnam ullam totam voluptates repellat modi. Eaque provident fugit beatae et et occaecati.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis ipsa totam in. Molestiae quam modi ipsum corrupti. Impedit quis aliquid magni voluptatem ex suscipit. Enim laborum deleniti adipisci natus.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Et molestiae voluptates eum sunt aut. Molestias doloremque laborum velit quos quas qui iusto. Omnis est quisquam ad qui dolor.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2023-12-24 09:07:06','2023-12-24 09:07:06'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Omnis odio porro praesentium rerum. Nam cupiditate rem et earum ut quam. Occaecati inventore qui expedita earum non et dolor.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et eligendi iusto ipsam earum totam est. Sint veniam aut exercitationem et saepe recusandae dolorum. Qui accusamus fugiat ipsa necessitatibus iure.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Excepturi quas totam sapiente id quis laboriosam quis modi. Voluptatem ipsum id distinctio. Voluptatum architecto iusto ut beatae possimus provident.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Reiciendis hic suscipit tempora rerum eum doloribus. Voluptas sunt magnam ea asperiores sit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Vel fugiat magni ratione quidem. Harum dignissimos facere beatae et est rem. Ducimus eum unde veritatis magnam. Odio qui harum at deleniti id quia.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nam sit dicta velit adipisci. Praesentium temporibus nisi ut cum et enim. Voluptatem rem explicabo perspiciatis adipisci minus.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Dolorem asperiores molestias ratione odio nulla. Eum magni quod esse earum nemo doloribus rem.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Ipsum voluptate nam totam placeat. Magnam ullam totam voluptates repellat modi. Eaque provident fugit beatae et et occaecati.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis ipsa totam in. Molestiae quam modi ipsum corrupti. Impedit quis aliquid magni voluptatem ex suscipit. Enim laborum deleniti adipisci natus.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Et molestiae voluptates eum sunt aut. Molestias doloremque laborum velit quos quas qui iusto. Omnis est quisquam ad qui dolor.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2023-12-24 09:07:06','2023-12-24 09:07:06'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Omnis odio porro praesentium rerum. Nam cupiditate rem et earum ut quam. Occaecati inventore qui expedita earum non et dolor.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Et eligendi iusto ipsam earum totam est. Sint veniam aut exercitationem et saepe recusandae dolorum. Qui accusamus fugiat ipsa necessitatibus iure.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Excepturi quas totam sapiente id quis laboriosam quis modi. Voluptatem ipsum id distinctio. Voluptatum architecto iusto ut beatae possimus provident.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Reiciendis hic suscipit tempora rerum eum doloribus. Voluptas sunt magnam ea asperiores sit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Vel fugiat magni ratione quidem. Harum dignissimos facere beatae et est rem. Ducimus eum unde veritatis magnam. Odio qui harum at deleniti id quia.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nam sit dicta velit adipisci. Praesentium temporibus nisi ut cum et enim. Voluptatem rem explicabo perspiciatis adipisci minus.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Dolorem asperiores molestias ratione odio nulla. Eum magni quod esse earum nemo doloribus rem.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Ipsum voluptate nam totam placeat. Magnam ullam totam voluptates repellat modi. Eaque provident fugit beatae et et occaecati.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis ipsa totam in. Molestiae quam modi ipsum corrupti. Impedit quis aliquid magni voluptatem ex suscipit. Enim laborum deleniti adipisci natus.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Et molestiae voluptates eum sunt aut. Molestias doloremque laborum velit quos quas qui iusto. Omnis est quisquam ad qui dolor.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2023-12-24 09:07:06','2023-12-24 09:07:06');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` int NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','b596779cbbfefbe102f776216b370ec9',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','f10d097ee098796861107ce979d2aa20',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','c89f80b12299d9e0cbc240ea1bfbbce8',2,'Botble\\Menu\\Models\\Menu'),(4,'vi','d58de589fa33d36b0b2a14406d508271',2,'Botble\\Menu\\Models\\MenuLocation'),(5,'vi','f10d097ee098796861107ce979d2aa20',3,'Botble\\Menu\\Models\\Menu'),(6,'vi','c89f80b12299d9e0cbc240ea1bfbbce8',4,'Botble\\Menu\\Models\\Menu'),(7,'en_US','0d7a52a5c0d248276375058a8022ed37',1,'Botble\\PostCollection\\Models\\PostCollection'),(8,'en_US','ec7c236993083f006c52ae4466f339aa',2,'Botble\\PostCollection\\Models\\PostCollection'),(9,'vi','e5d67c4d28d8ed7645056f35c2c14ada',3,'Botble\\PostCollection\\Models\\PostCollection'),(10,'vi','b817ebbb3a4facfa179c30af7880fc10',4,'Botble\\PostCollection\\Models\\PostCollection');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (2102,0,'image-1','image-1',206,'image/jpeg',110154,'banners/image-1.jpg','[]','2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(2103,0,'image-2','image-2',206,'image/jpeg',53388,'banners/image-2.jpg','[]','2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(2104,0,'image-3','image-3',206,'image/jpeg',46269,'banners/image-3.jpg','[]','2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(2105,0,'image-4','image-4',206,'image/jpeg',47591,'banners/image-4.jpg','[]','2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(2106,0,'1','1',207,'image/jpeg',42814,'galleries/1.jpg','[]','2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(2107,0,'10','10',207,'image/jpeg',95796,'galleries/10.jpg','[]','2023-12-24 09:07:05','2023-12-24 09:07:05',NULL),(2108,0,'2','2',207,'image/jpeg',43108,'galleries/2.jpg','[]','2023-12-24 09:07:05','2023-12-24 09:07:05',NULL),(2109,0,'3','3',207,'image/jpeg',67060,'galleries/3.jpg','[]','2023-12-24 09:07:05','2023-12-24 09:07:05',NULL),(2110,0,'4','4',207,'image/jpeg',60609,'galleries/4.jpg','[]','2023-12-24 09:07:05','2023-12-24 09:07:05',NULL),(2111,0,'5','5',207,'image/jpeg',70264,'galleries/5.jpg','[]','2023-12-24 09:07:05','2023-12-24 09:07:05',NULL),(2112,0,'6','6',207,'image/jpeg',40607,'galleries/6.jpg','[]','2023-12-24 09:07:05','2023-12-24 09:07:05',NULL),(2113,0,'7','7',207,'image/jpeg',41491,'galleries/7.jpg','[]','2023-12-24 09:07:06','2023-12-24 09:07:06',NULL),(2114,0,'8','8',207,'image/jpeg',58063,'galleries/8.jpg','[]','2023-12-24 09:07:06','2023-12-24 09:07:06',NULL),(2115,0,'9','9',207,'image/jpeg',69288,'galleries/9.jpg','[]','2023-12-24 09:07:06','2023-12-24 09:07:06',NULL),(2116,0,'news-1','news-1',208,'image/jpeg',93694,'news/news-1.jpg','[]','2023-12-24 09:07:07','2023-12-24 09:07:07',NULL),(2117,0,'news-10','news-10',208,'image/jpeg',58656,'news/news-10.jpg','[]','2023-12-24 09:07:07','2023-12-24 09:07:07',NULL),(2118,0,'news-11','news-11',208,'image/jpeg',127000,'news/news-11.jpg','[]','2023-12-24 09:07:07','2023-12-24 09:07:07',NULL),(2119,0,'news-12','news-12',208,'image/jpeg',30283,'news/news-12.jpg','[]','2023-12-24 09:07:07','2023-12-24 09:07:07',NULL),(2120,0,'news-13','news-13',208,'image/jpeg',359805,'news/news-13.jpg','[]','2023-12-24 09:07:08','2023-12-24 09:07:08',NULL),(2121,0,'news-14','news-14',208,'image/jpeg',128708,'news/news-14.jpg','[]','2023-12-24 09:07:08','2023-12-24 09:07:08',NULL),(2122,0,'news-15','news-15',208,'image/jpeg',283779,'news/news-15.jpg','[]','2023-12-24 09:07:08','2023-12-24 09:07:08',NULL),(2123,0,'news-16','news-16',208,'image/jpeg',157899,'news/news-16.jpg','[]','2023-12-24 09:07:08','2023-12-24 09:07:08',NULL),(2124,0,'news-17','news-17',208,'image/jpeg',62316,'news/news-17.jpg','[]','2023-12-24 09:07:09','2023-12-24 09:07:09',NULL),(2125,0,'news-18','news-18',208,'image/jpeg',103832,'news/news-18.jpg','[]','2023-12-24 09:07:09','2023-12-24 09:07:09',NULL),(2126,0,'news-19','news-19',208,'image/jpeg',56987,'news/news-19.jpg','[]','2023-12-24 09:07:09','2023-12-24 09:07:09',NULL),(2127,0,'news-2','news-2',208,'image/jpeg',95478,'news/news-2.jpg','[]','2023-12-24 09:07:09','2023-12-24 09:07:09',NULL),(2128,0,'news-20','news-20',208,'image/jpeg',52338,'news/news-20.jpg','[]','2023-12-24 09:07:09','2023-12-24 09:07:09',NULL),(2129,0,'news-21','news-21',208,'image/jpeg',76078,'news/news-21.jpg','[]','2023-12-24 09:07:09','2023-12-24 09:07:09',NULL),(2130,0,'news-22','news-22',208,'image/jpeg',45269,'news/news-22.jpg','[]','2023-12-24 09:07:10','2023-12-24 09:07:10',NULL),(2131,0,'news-23','news-23',208,'image/jpeg',39502,'news/news-23.jpg','[]','2023-12-24 09:07:10','2023-12-24 09:07:10',NULL),(2132,0,'news-24','news-24',208,'image/jpeg',17605,'news/news-24.jpg','[]','2023-12-24 09:07:10','2023-12-24 09:07:10',NULL),(2133,0,'news-3','news-3',208,'image/jpeg',44092,'news/news-3.jpg','[]','2023-12-24 09:07:10','2023-12-24 09:07:10',NULL),(2134,0,'news-4','news-4',208,'image/jpeg',163183,'news/news-4.jpg','[]','2023-12-24 09:07:10','2023-12-24 09:07:10',NULL),(2135,0,'news-5','news-5',208,'image/jpeg',93457,'news/news-5.jpg','[]','2023-12-24 09:07:11','2023-12-24 09:07:11',NULL),(2136,0,'news-6','news-6',208,'image/jpeg',70592,'news/news-6.jpg','[]','2023-12-24 09:07:11','2023-12-24 09:07:11',NULL),(2137,0,'news-7','news-7',208,'image/jpeg',115977,'news/news-7.jpg','[]','2023-12-24 09:07:11','2023-12-24 09:07:11',NULL),(2138,0,'news-8','news-8',208,'image/jpeg',80243,'news/news-8.jpg','[]','2023-12-24 09:07:12','2023-12-24 09:07:12',NULL),(2139,0,'news-9','news-9',208,'image/jpeg',52207,'news/news-9.jpg','[]','2023-12-24 09:07:12','2023-12-24 09:07:12',NULL),(2140,0,'thumbnail-1','thumbnail-1',208,'image/jpeg',166014,'news/thumbnail-1.jpg','[]','2023-12-24 09:07:12','2023-12-24 09:07:12',NULL),(2141,0,'thumbnail-2','thumbnail-2',208,'image/jpeg',52142,'news/thumbnail-2.jpg','[]','2023-12-24 09:07:12','2023-12-24 09:07:12',NULL),(2142,0,'thumbnail-3','thumbnail-3',208,'image/jpeg',130131,'news/thumbnail-3.jpg','[]','2023-12-24 09:07:12','2023-12-24 09:07:12',NULL),(2143,0,'thumbnail-4','thumbnail-4',208,'image/jpeg',71857,'news/thumbnail-4.jpg','[]','2023-12-24 09:07:13','2023-12-24 09:07:13',NULL),(2144,0,'thumbnail-5','thumbnail-5',208,'image/jpeg',47451,'news/thumbnail-5.jpg','[]','2023-12-24 09:07:13','2023-12-24 09:07:13',NULL),(2145,0,'thumbnail-6','thumbnail-6',208,'image/jpeg',98871,'news/thumbnail-6.jpg','[]','2023-12-24 09:07:13','2023-12-24 09:07:13',NULL),(2146,0,'video1','video1',209,'video/mp4',6378345,'videos/video1.mp4','[]','2023-12-24 09:07:13','2023-12-24 09:07:13',NULL),(2147,0,'1','1',210,'image/jpeg',11752,'members/1.jpg','[]','2023-12-24 09:07:14','2023-12-24 09:07:14',NULL),(2148,0,'2','2',210,'image/jpeg',19005,'members/2.jpg','[]','2023-12-24 09:07:14','2023-12-24 09:07:14',NULL),(2149,0,'3','3',210,'image/jpeg',20400,'members/3.jpg','[]','2023-12-24 09:07:15','2023-12-24 09:07:15',NULL),(2150,0,'4','4',210,'image/jpeg',26819,'members/4.jpg','[]','2023-12-24 09:07:15','2023-12-24 09:07:15',NULL),(2151,0,'5','5',210,'image/jpeg',14367,'members/5.jpg','[]','2023-12-24 09:07:15','2023-12-24 09:07:15',NULL),(2152,0,'10','10',211,'image/jpeg',27814,'authors/10.jpg','[]','2023-12-24 09:07:19','2023-12-24 09:07:19',NULL),(2153,0,'6','6',211,'image/jpeg',12367,'authors/6.jpg','[]','2023-12-24 09:07:19','2023-12-24 09:07:19',NULL),(2154,0,'7','7',211,'image/jpeg',20652,'authors/7.jpg','[]','2023-12-24 09:07:19','2023-12-24 09:07:19',NULL),(2155,0,'8','8',211,'image/jpeg',21164,'authors/8.jpg','[]','2023-12-24 09:07:19','2023-12-24 09:07:19',NULL),(2156,0,'9','9',211,'image/jpeg',6084,'authors/9.jpg','[]','2023-12-24 09:07:20','2023-12-24 09:07:20',NULL),(2157,0,'favicon','favicon',212,'image/png',3913,'general/favicon.png','[]','2023-12-24 09:07:24','2023-12-24 09:07:24',NULL),(2158,0,'img-loading','img-loading',212,'image/jpeg',461,'general/img-loading.jpg','[]','2023-12-24 09:07:24','2023-12-24 09:07:24',NULL),(2159,0,'logo-mobile','logo-mobile',212,'image/png',5054,'general/logo-mobile.png','[]','2023-12-24 09:07:24','2023-12-24 09:07:24',NULL),(2160,0,'logo-tablet','logo-tablet',212,'image/png',5786,'general/logo-tablet.png','[]','2023-12-24 09:07:24','2023-12-24 09:07:24',NULL),(2161,0,'logo-white','logo-white',212,'image/png',6305,'general/logo-white.png','[]','2023-12-24 09:07:25','2023-12-24 09:07:25',NULL),(2162,0,'logo','logo',212,'image/png',7171,'general/logo.png','[]','2023-12-24 09:07:25','2023-12-24 09:07:25',NULL),(2163,0,'screenshot','screenshot',212,'image/png',205662,'general/screenshot.png','[]','2023-12-24 09:07:25','2023-12-24 09:07:25',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (206,0,'banners',NULL,'banners',0,'2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(207,0,'galleries',NULL,'galleries',0,'2023-12-24 09:07:04','2023-12-24 09:07:04',NULL),(208,0,'news',NULL,'news',0,'2023-12-24 09:07:07','2023-12-24 09:07:07',NULL),(209,0,'videos',NULL,'videos',0,'2023-12-24 09:07:13','2023-12-24 09:07:13',NULL),(210,0,'members',NULL,'members',0,'2023-12-24 09:07:14','2023-12-24 09:07:14',NULL),(211,0,'authors',NULL,'authors',0,'2023-12-24 09:07:19','2023-12-24 09:07:19',NULL),(212,0,'general',NULL,'general',0,'2023-12-24 09:07:24','2023-12-24 09:07:24',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_activity_logs`
--

DROP TABLE IF EXISTS `member_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_activity_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_activity_logs`
--

LOCK TABLES `member_activity_logs` WRITE;
/*!40000 ALTER TABLE `member_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_password_resets`
--

DROP TABLE IF EXISTS `member_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `member_password_resets_email_index` (`email`),
  KEY `member_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_password_resets`
--

LOCK TABLES `member_password_resets` WRITE;
/*!40000 ALTER TABLE `member_password_resets` DISABLE KEYS */;
INSERT INTO `member_password_resets` VALUES ('gialaix9@gmail.com','$2y$10$KTnZLXNycUrMUbwrQ/T4VeST1tJADcTbli4vp8R22itHej4bCgOaS','2022-10-15 15:04:10');
/*!40000 ALTER TABLE `member_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `favorite_posts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bookmark_posts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','Dinah my dear! I wish you could see this, as she could, for the end of half an hour or so there.',NULL,'user@thesky9.com','$2y$12$Xv1lA3cjhUoqAXErXx2oMemElVtEF4l.CZwtFjUvZGj37GgAJ6IXm',2149,'2020-05-02','+1-346-268-3695','2023-12-24 09:07:16',NULL,NULL,'2023-12-24 09:07:16','2023-12-24 09:07:16',NULL,NULL,'published'),(2,'Alexa','Jacobi','Never heard of such a long sleep you\'ve had!\' \'Oh, I\'ve had such a fall as this, I shall never get.',NULL,'melba.rowe@yahoo.com','$2y$12$xfKQyoAZtSbZyL89ECp.RugQrrtU8V1/H4yYbsDJ3Socc/iGLNnFW',2150,'2018-07-27','234.649.4605','2023-12-24 09:07:16',NULL,NULL,'2023-12-24 09:07:16','2023-12-24 09:07:16',NULL,NULL,'published'),(3,'Mittie','Padberg','They all sat down in a very short time the Queen said severely \'Who is this?\' She said the Hatter.',NULL,'madelyn33@dubuque.net','$2y$12$0Me2VFigOy2mDtA/AZ2EWO86vNlijKkEZJYTFow/.WkLQOTC6oQM2',2149,'1999-03-31','+1.216.563.6730','2023-12-24 09:07:16',NULL,NULL,'2023-12-24 09:07:16','2023-12-24 09:07:16',NULL,NULL,'published'),(4,'Willy','Treutel','Alice. \'Well, I never heard it say to this: so she felt sure it would be so kind,\' Alice replied.',NULL,'dicki.kameron@gmail.com','$2y$12$agP5OjZCNKcX6.Bbp4fD/O1PJqCjlCqP/vdiAux8E1NtoOepAPqFi',2148,'1986-12-20','1-949-771-6935','2023-12-24 09:07:16',NULL,NULL,'2023-12-24 09:07:16','2023-12-24 09:07:16',NULL,NULL,'published'),(5,'Maxine','DuBuque','Alice a good character, But said I didn\'t!\' interrupted Alice. \'You are,\' said the cook.',NULL,'jbeier@brown.com','$2y$12$DsJ5d7nXVxPwQ.GpxJEE5OKk8GgV4ajR7a5yXd5TXTWKSMpiGBWkO',2150,'2002-05-18','1-660-278-4829','2023-12-24 09:07:17',NULL,NULL,'2023-12-24 09:07:17','2023-12-24 09:07:17',NULL,NULL,'published'),(6,'Nathan','Herman','I don\'t remember where.\' \'Well, it must be what he did with the Queen, who was trembling down to.',NULL,'hettinger.rafael@yahoo.com','$2y$12$h8Ycfg.POg.r.yO46RQ9F.KQ3yEfu9VQ0pX2zUpuXS8wp4mgvHHji',2151,'1984-01-04','(480) 747-2579','2023-12-24 09:07:17',NULL,NULL,'2023-12-24 09:07:17','2023-12-24 09:07:17',NULL,NULL,'published'),(7,'Derek','Schumm','CURTSEYING as you\'re falling through the doorway; \'and even if I fell off the fire, stirring a.',NULL,'alberto25@gmail.com','$2y$12$E3mfYsYKIlEQufo20oYIvuhsfmpEbIZrNnSQk4KN92htd0xJ6mu3q',2149,'2008-02-04','1-986-396-0952','2023-12-24 09:07:17',NULL,NULL,'2023-12-24 09:07:17','2023-12-24 09:07:17',NULL,NULL,'published'),(8,'Celine','Huel','Lobster Quadrille, that she was appealed to by the way, was the first day,\' said the Dormouse.',NULL,'micah.dach@harber.com','$2y$12$HY7wjLjDZTDTOTLp477gieneyhWfQlIjlGzBOMlyL48qRyUrTCWPS',2147,'2005-08-06','+1.520.404.1888','2023-12-24 09:07:18',NULL,NULL,'2023-12-24 09:07:18','2023-12-24 09:07:18',NULL,NULL,'published'),(9,'Santiago','Raynor','O Mouse!\' (Alice thought this must ever be A secret, kept from all the same, the next thing is, to.',NULL,'garret57@hotmail.com','$2y$12$va1hTx1qM2TpMwbU6JHa0.86MVxEmchxeY4.YJX5w5EMQvfIUCYtu',2149,'2006-04-26','(774) 298-7548','2023-12-24 09:07:18',NULL,NULL,'2023-12-24 09:07:18','2023-12-24 09:07:18',NULL,NULL,'published'),(10,'Berry','Block','Gryphon hastily. \'Go on with the glass table as before, \'and things are worse than ever,\' thought.',NULL,'nbernhard@yahoo.com','$2y$12$ZaJHb2dhwZo7.m02vcATsexoe/faQUsk2C2ToGZcjYqgqLVrz5j4W',2150,'2004-10-17','+1-828-580-4933','2023-12-24 09:07:18',NULL,NULL,'2023-12-24 09:07:18','2023-12-24 09:07:18',NULL,NULL,'published'),(11,'Esperanza','Hoppe','So they had settled down again, the Dodo could not possibly reach it: she could guess, she was.',NULL,'rwindler@hotmail.com','$2y$12$L4rJd5jCNIiCEOO1tUKGcu3vPtKmdeQhVtWoBR6L29N8KtP5a3Y0C',2149,'1987-08-12','(325) 230-5945','2023-12-24 09:07:18',NULL,NULL,'2023-12-24 09:07:18','2023-12-24 09:07:18',NULL,NULL,'published');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2023-12-24 09:07:23','2023-12-24 09:07:23'),(2,3,'main-menu','2023-12-24 09:07:23','2023-12-24 09:07:23');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(2,1,1,NULL,NULL,'/',NULL,0,'Home default',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(3,1,1,NULL,NULL,'/home-2?header=style-2',NULL,0,'Home 2',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(4,1,1,NULL,NULL,'/home-3?header=style-3',NULL,0,'Home 3',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(5,1,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(6,1,0,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Category layouts',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(7,1,6,5,'Botble\\Page\\Models\\Page','/category-list',NULL,0,'List',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(8,1,6,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Grid',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(9,1,6,7,'Botble\\Page\\Models\\Page','/category-metro',NULL,0,'Metro',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(10,1,0,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Post layouts',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(11,1,10,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Default',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(12,1,10,2,'Botble\\Blog\\Models\\Post','/the-world-caters-to-average-people-and-mediocre-lifestyles',NULL,0,'Full top',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(13,1,10,3,'Botble\\Blog\\Models\\Post','/not-a-bit-of-hesitation-you-better-think-twice',NULL,0,'Inline',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(14,1,0,9,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(15,1,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(16,1,0,NULL,NULL,NULL,NULL,0,'Pages',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(17,1,16,10,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(18,1,16,NULL,NULL,'page-not-found',NULL,0,'404',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(19,1,16,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(20,1,16,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(21,2,0,NULL,NULL,'/',NULL,0,'Homepage',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(22,2,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(23,2,0,4,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(24,2,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(25,3,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(26,3,25,NULL,NULL,'/',NULL,0,'Trang chủ mặc định',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(27,3,25,NULL,NULL,'/home-2?header=style-2',NULL,0,'Trang chủ 2',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(28,3,25,NULL,NULL,'/home-3?header=style-3',NULL,0,'Trang chủ 3',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(29,3,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(30,3,0,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Danh mục',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(31,3,30,5,'Botble\\Page\\Models\\Page','/category-list',NULL,0,'Style cột',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(32,3,30,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Style danh sách',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(33,3,30,7,'Botble\\Page\\Models\\Page','/category-metro',NULL,0,'Style danh sách 2',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(34,3,0,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Bài viết',NULL,'_self',1,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(35,3,34,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Default',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(36,3,34,2,'Botble\\Blog\\Models\\Post','/the-world-caters-to-average-people-and-mediocre-lifestyles',NULL,0,'Full top',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(37,3,34,3,'Botble\\Blog\\Models\\Post','/not-a-bit-of-hesitation-you-better-think-twice',NULL,0,'Inline',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(38,3,0,9,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Liên hệ',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(39,3,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Về chúng tôi',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(40,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23'),(41,4,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Liên hệ',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(42,4,0,4,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:24'),(43,4,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2023-12-24 09:07:23','2023-12-24 09:07:23');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2023-12-24 09:07:23','2023-12-24 09:07:23'),(2,'Quick links','quick-links','published','2023-12-24 09:07:23','2023-12-24 09:07:23'),(3,'Menu chính','menu-chinh','published','2023-12-24 09:07:23','2023-12-24 09:07:23'),(4,'Liên kết','lien-ket','published','2023-12-24 09:07:23','2023-12-24 09:07:23');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'layout','[\"default\"]',1,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(2,'time_to_read','[16]',1,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(3,'comment_status','[1]',1,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(4,'layout','[\"top-full\"]',2,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(5,'time_to_read','[11]',2,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(6,'comment_status','[1]',2,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(7,'layout','[\"inline\"]',3,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(8,'time_to_read','[7]',3,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(9,'comment_status','[1]',3,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(10,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/289366685?h=b6b9d1e67b&title=0&byline=0&portrait=0\"]',4,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(11,'time_to_read','[14]',4,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(12,'comment_status','[1]',4,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(13,'video_upload_id','[\"videos\\/video1.mp4\"]',5,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(14,'time_to_read','[19]',5,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(15,'comment_status','[1]',5,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(16,'time_to_read','[7]',6,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(17,'comment_status','[1]',6,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(18,'time_to_read','[6]',7,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(19,'comment_status','[1]',7,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(20,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/559851845?h=afc6d413c9\"]',8,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(21,'time_to_read','[4]',8,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(22,'comment_status','[1]',8,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(23,'time_to_read','[12]',9,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(24,'comment_status','[1]',9,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(25,'time_to_read','[7]',10,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(26,'comment_status','[1]',10,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(27,'time_to_read','[6]',11,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(28,'comment_status','[1]',11,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(29,'time_to_read','[6]',12,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(30,'comment_status','[1]',12,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(31,'time_to_read','[10]',13,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(32,'comment_status','[1]',13,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(33,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\"]',14,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(34,'time_to_read','[20]',14,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(35,'comment_status','[1]',14,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(36,'time_to_read','[15]',15,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(37,'comment_status','[1]',15,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(38,'time_to_read','[18]',16,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(39,'comment_status','[1]',16,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(40,'time_to_read','[3]',17,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(41,'comment_status','[1]',17,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(42,'time_to_read','[16]',18,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(43,'comment_status','[1]',18,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(44,'time_to_read','[5]',19,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(45,'comment_status','[1]',19,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(46,'time_to_read','[10]',20,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14'),(47,'comment_status','[1]',20,'Botble\\Blog\\Models\\Post','2023-12-24 09:07:14','2023-12-24 09:07:14');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_01_000001_create_oauth_auth_codes_table',1),(6,'2016_06_01_000002_create_oauth_access_tokens_table',1),(7,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(8,'2016_06_01_000004_create_oauth_clients_table',1),(9,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(10,'2016_06_10_230148_create_acl_tables',1),(11,'2016_06_14_230857_create_menus_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_05_074239_create_setting_table',1),(14,'2016_11_28_032840_create_dashboard_widget_tables',1),(15,'2016_12_16_084601_create_widgets_table',1),(16,'2017_05_09_070343_create_media_tables',1),(17,'2017_11_03_070450_create_slug_table',1),(18,'2019_01_05_053554_create_jobs_table',1),(19,'2019_08_19_000000_create_failed_jobs_table',1),(20,'2019_12_14_000001_create_personal_access_tokens_table',1),(21,'2022_04_20_100851_add_index_to_media_table',1),(22,'2022_04_20_101046_add_index_to_menu_table',1),(23,'2022_07_10_034813_move_lang_folder_to_root',1),(24,'2022_08_04_051940_add_missing_column_expires_at',1),(25,'2020_11_18_150916_ads_create_ads_table',2),(26,'2021_12_02_035301_add_ads_translations_table',2),(27,'2015_06_29_025744_create_audit_history',3),(28,'2015_06_18_033822_create_blog_table',4),(29,'2021_02_16_092633_remove_default_value_for_author_type',4),(30,'2021_12_03_030600_create_blog_translations',4),(31,'2022_04_19_113923_add_index_to_table_posts',4),(32,'2021_07_08_140130_comment_create_comment_table',5),(33,'2016_06_17_091537_create_contacts_table',6),(34,'2016_10_13_150201_create_galleries_table',7),(35,'2021_12_03_082953_create_gallery_translations',7),(36,'2022_04_30_034048_create_gallery_meta_translations_table',7),(37,'2016_10_03_032336_create_languages_table',8),(38,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(39,'2021_12_03_075608_create_page_translations',9),(40,'2017_10_04_140938_create_member_table',10),(41,'2017_10_24_154832_create_newsletter_table',11),(42,'2021_08_25_122708_post_collection_create_post_collection_table',12),(43,'2021_07_14_043820_add_publised_at_table_posts',13),(44,'2021_10_16_043705_pro_posts_create_favorite_posts_table',14),(45,'2021_10_16_105007_add_bookmark_posts_column_to_members_table',14),(46,'2021_11_13_010429_change_column_table_members',14),(47,'2016_05_28_112028_create_system_request_logs_table',15),(48,'2016_10_07_193005_create_translations_table',16),(49,'2022_10_14_024629_drop_column_is_featured',17),(50,'2022_11_18_063357_add_missing_timestamp_in_table_settings',17),(51,'2022_12_02_093615_update_slug_index_columns',17),(52,'2014_10_12_100000_create_password_reset_tokens_table',18),(53,'2022_09_01_000001_create_admin_notifications_tables',18),(54,'2023_01_30_024431_add_alt_to_media_table',18),(55,'2023_02_16_042611_drop_table_password_resets',18),(56,'2023_04_17_062645_add_open_in_new_tab',19),(57,'2023_04_23_005903_add_column_permissions_to_admin_notifications',19),(58,'2023_05_10_075124_drop_column_id_in_role_users_table',20),(59,'2023_07_06_011444_create_slug_translations_table',20),(60,'2023_08_21_090810_make_page_content_nullable',20),(61,'2023_08_29_074620_make_column_author_id_nullable',20),(62,'2023_08_29_075308_make_column_user_id_nullable',20),(63,'2023_09_14_021936_update_index_for_slugs_table',20),(64,'2023_09_14_022423_add_index_for_language_table',20),(65,'2023_02_28_092156_update_table_comments',21),(66,'2023_10_16_075332_add_status_column',21),(67,'2023_11_07_023805_add_tablet_mobile_image',21),(68,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',21),(69,'2023_11_14_033417_change_request_column_in_table_audit_histories',21),(70,'2023_12_06_100448_change_random_hash_for_media',21),(71,'2023_12_07_095130_add_color_column_to_media_folders_table',21),(72,'2023_12_12_105220_drop_translations_table',21),(73,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',21);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[posts-collection title=\"Recommended\" subtitle=\"R\" limit=\"4\" posts_collection_id=\"2\" background_style=\"background-white\"][/posts-collection]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" limit=\"7\" subtitle=\"O\"][/theme-galleries]</div>',1,NULL,'homepage',NULL,'published','2023-12-24 09:07:03','2023-12-24 09:07:03'),(2,'Home 2','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',NULL,'published','2023-12-24 09:07:03','2023-12-24 09:07:03'),(3,'Home 3','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',NULL,'published','2023-12-24 09:07:03','2023-12-24 09:07:03'),(4,'Blog','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'default',NULL,'published','2023-12-24 09:07:03','2023-12-24 09:07:03'),(5,'Category List','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'no-breadcrumbs',NULL,'published','2023-12-24 09:07:03','2023-12-24 09:07:03'),(6,'Category grid','<div>[posts-listing layout=\"grid\"][/posts-listing]</div>',1,NULL,'full',NULL,'published','2023-12-24 09:07:03','2023-12-24 09:07:03'),(7,'Category metro','<div>[posts-listing layout=\"metro\"][/posts-listing]</div>',1,NULL,'full',NULL,'published','2023-12-24 09:07:04','2023-12-24 09:07:04'),(8,'Contact','<div>[contact-form title=\"Get in Touch\"][/contact-form]</div><h3>Directions</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',NULL,'published','2023-12-24 09:07:04','2023-12-24 09:07:04'),(9,'About Us','<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Tolerably much and ouch the in began alas more ouch some then accommodating flimsy wholeheartedly after hello slightly the that cow pouted much a goodness bound rebuilt poetically jaguar groundhog</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Computer inside</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Less lion goodness that euphemistically robin expeditiously bluebird smugly scratched far while thus cackled sheepishly rigid after due one assenting regarding censorious while occasional or this more crane went more as\n                this less much amid overhung anathematic because much held one exuberantly sheep goodness so where rat wry well concomitantly.</p>\n            <h5>What\'s next?</h5>\n            <p>Pouted flirtatiously as beaver beheld above forward energetic across this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much\n                wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Other yet this hazardous oh the until brave close towards stupidly euphemistically firefly boa some more underneath circa yet on as wow above ripe or blubbered one cobra bore ouch and this held ably one hence</p>\n            <h2>Conclusion</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Alexe more gulped much garrulous a yikes earthworm wiped because goodness bet mongoose that along accommodatingly tortoise indecisively admirable but shark dear some and unwillingly before far vindictive less much this\n                on more less flexed far woolly from following glanced resolute unlike far this alongside against icily beyond flabby accidental.</p>\n\n\n            <h2>Design is future</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Uninhibited carnally hired played in whimpered dear gorilla koala depending and much yikes off far quetzal goodness and from for grimaced goodness unaccountably and meadowlark near unblushingly crucial scallop tightly neurotic\n                hungrily some and dear furiously this apart.</p>\n            <p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much hello on spoon-fed that alas rethought much decently richly and wow against the frequent fluidly at formidable acceptably flapped besides and much\n                circa far over the bucolically hey precarious goldfinch mastodon goodness gnashed a jellyfish and one however because.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello far meadowlark imitatively egregiously hugged that yikes minimally unanimous pouted flirtatiously as beaver beheld above forward energetic across\n                this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously and and less rattlesnake contrary caustic wow this near alas and next and pled the yikes articulate about as less cackled dalmatian in much less\n                well jeering for the thanks blindly sentimental whimpered less across objectively fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious luridly irrationally attractively dachshund.</p>\n            <blockquote class=\"wp-block-quote is-style-large\">\n                <p>The advance of technology is based on making it fit in so that you don\'t really even notice it, so it\'s part of everyday life.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div><h3>Address</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',NULL,'published','2023-12-24 09:07:04','2023-12-24 09:07:04'),(10,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2023-12-24 09:07:04','2023-12-24 09:07:04');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Bài viết mới\" subtitle=\"Latest\" limit=\"3\" show_follow_us_section=\"1\"][/recent-posts]</div><div>[categories-tab-posts title=\"Bài viết được quan tâm\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[posts-grid title=\"Bài viết nổi bật\" subtitle=\"News\" categories=\"\" categories_exclude=\"\" style=\"2\" limit=\"6\"][/posts-grid]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" subtitle=\"In motion\" limit=\"7\"][/theme-galleries]</div>'),('vi',2,'Trang chủ 2',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',3,'Trang chủ 3',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',4,'Tin tức',NULL,'<div>[categories-big limit=\"12\"][/categories-big]</div>'),('vi',5,'Tin tức danh sách',NULL,'<div>[posts-listing layout=\"list\"][/posts-listing]</div>'),('vi',6,'Tin tức dạng cột',NULL,'<div>[posts-listing layout=\"grid\"][/posts-listing]</div>'),('vi',7,'Tin tức metro',NULL,'<div>[posts-listing layout=\"metro\"][/posts-listing]</div>'),('vi',8,'Liên hệ',NULL,'<div>[contact-form title=\"Liên hệ\"][/contact-form]</div><h3>Địa chỉ</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>'),('vi',9,'Về chúng tôi',NULL,'<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Người ta né tránh nhắc đến Chúa Kito khi nói đến mốc lịch sử bằng cách nói Trước công nguyên và sau công nguyên. Nhưng nguyên tiếng anh: Before Chirst, After Chirst – trước Chúa Kito, sau Chúa Kito – người ta sợ lịch sử của Kito giáo. Đó là lời chia sẻ của cha đặc trách Gioan trong Thánh lễ thường kì Cộng đoàn sinh viên Công giáo y dược vào lúc 19h15’, ngày 11.05.2017 tại đền thánh Gierado, Giáo xứ Thái Hà.</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Cuộc sống là những phép màu</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Khởi đầu bài giảng của mình cha nói đến một trong những khó khăn lớn nhất Giáo Hội nói chung và người tín hữu nói riêng đó chính là niềm tin vào Thiên Chúa. Chính khủng hoảng niềm tin gây nên chiến tranh, gây nên thù hận và chết chóc. Lòng tin không chỉ ảnh hưởng lên cá nhân mà thôi nhưng lên toàn thế giới. Hôm nay, Chúa cho chúng ta thấy lòng tin là khởi đầu, là mấu chốt để con người đứng vững giữa trăm chiều thử thách.</p>\n            <h5>Ý nghĩa là gì?</h5>\n            <p>Hai bài đọc hôm nay đều đi từ lịch sử, Chúa Giesu tiên báo kẻ sẽ nộp thầy. Ngài chọn Giuda không phải chọn nhầm, nhưng Ngài nói rõ trong bài Tin Mừng rằng lời kinh thánh phải được ứng nghiệm: “Kẻ giơ tay chấm chung một đĩa với con lại giơ gót đạp con”. Trong bài đọc một, Phaolo nói về Đavit để ứng nghiệm lời Kinh thánh đã nói, để anh chị em Do thái nhận ra được lời tiên báo qua lịch sử là chúa Giesu.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Để có được lòng tin nơi con người, Chúa Giesu đã khai mào trong một chương trình lịch sử dài tập. Lịch sử Cựu ước loan báo đúng với những gì đã xảy ra với Chúa Giesu Kito. Một triết gia người Pháp nói rằng: “Kito giáo có một nền tảng đức tin vững chắc đó là lịch sử, nhưng Kito giáo quên đi điểm quan trọng này và ngày nay đi nặng về phía thần học”.</p>\n            <h2>Kết luận</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nhắc lại: Kito Giáo cắm rễ sâu, trải dài và được ứng nghiệm trong lịch sử thánh kinh ngang qua những con người, nơi chốn, địa điểm cụ thể. Nhìn lại lịch sử, các ngày lễ xã hội, ngày nghỉ… đều liên quan đến Kito giáo và xuất phát từ Kito giáo.</p>\n\n\n            <h2>Tương lai</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nói đến biến cố Đức Mẹ hiện ra tại Fatima 100 năm là một biến cố lịch sử có thời gian, không gian, nhân vật và sứ điệp cụ thể không phải con người tự dụng nên hay hoang tưởng.</p>\n            <p>Niềm tin của mỗi chúng ta phải dựa vào lịch sử chứ không phải mơ hồ. Khi nhìn lại quá khứ ta biết rằng lòng tin đó đã được Thiên Chúa khai mào từ rất sớm. Các thánh Tông đồ đã đứng trên bình diện lịch sự để minh chứng niềm tin của con người vào Giave Thiên Chúa.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Nhiều người thời nay biết lịch sử nhưng không biết Chúa Kito là ai vì họ né tránh Chúa Giesu. Chúa Giesu đi vào lịch sử để tỏ cho con người cùng đích của sự sống là gì và Thiên Chúa là ai cùng những lời tiên báo để củng cố lòng tin cho con người.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n           <blockquote class=\"wp-block-quote is-style-large\">\n                <p>Sự tiến bộ của công nghệ dựa trên việc làm cho nó phù hợp để bạn thậm chí không thực sự nhận thấy nó, vì vậy nó là một phần của cuộc sống hàng ngày.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div>'),('vi',10,'Cookie Policy',NULL,'<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo \"token\" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(71,1,11),(72,2,11),(73,3,11),(74,4,11),(75,5,11),(76,6,11),(77,7,11),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections`
--

DROP TABLE IF EXISTS `post_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections`
--

LOCK TABLES `post_collections` WRITE;
/*!40000 ALTER TABLE `post_collections` DISABLE KEYS */;
INSERT INTO `post_collections` VALUES (1,'Editor\'s Picked',NULL,NULL,'published','2023-12-24 09:07:24','2023-12-24 09:07:24'),(2,'Recommended Posts',NULL,NULL,'published','2023-12-24 09:07:24','2023-12-24 09:07:24'),(3,'Bài viết hay',NULL,NULL,'published','2023-12-24 09:07:24','2023-12-24 09:07:24'),(4,'Recommended Posts',NULL,NULL,'published','2023-12-24 09:07:24','2023-12-24 09:07:24');
/*!40000 ALTER TABLE `post_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections_posts`
--

DROP TABLE IF EXISTS `post_collections_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_collection_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections_posts`
--

LOCK TABLES `post_collections_posts` WRITE;
/*!40000 ALTER TABLE `post_collections_posts` DISABLE KEYS */;
INSERT INTO `post_collections_posts` VALUES (1,1,12),(2,1,3),(3,1,5),(4,1,1),(5,1,7),(6,1,9),(7,2,15),(8,2,4),(9,2,2),(10,2,1),(11,2,10),(12,3,20),(13,3,19),(14,3,21),(15,3,31),(16,3,32),(17,4,22),(18,4,24),(19,4,25),(20,4,29),(21,4,30),(22,1,12),(23,1,3),(24,1,5),(25,1,1),(26,1,7),(27,1,9),(28,2,15),(29,2,4),(30,2,2),(31,2,1),(32,2,10),(33,3,20),(34,3,19),(35,3,21),(36,3,31),(37,3,32),(38,4,22),(39,4,24),(40,4,25),(41,4,29),(42,4,30),(43,1,12),(44,1,3),(45,1,5),(46,1,1),(47,1,7),(48,1,9),(49,2,15),(50,2,4),(51,2,2),(52,2,1),(53,2,10),(54,3,20),(55,3,19),(56,3,21),(57,3,31),(58,3,32),(59,4,22),(60,4,24),(61,4,25),(62,4,29),(63,4,30),(64,1,12),(65,1,3),(66,1,5),(67,1,1),(68,1,7),(69,1,9),(70,2,15),(71,2,4),(72,2,2),(73,2,1),(74,2,10),(75,3,20),(76,3,19),(77,3,21),(78,3,31),(79,3,32),(80,4,22),(81,4,24),(82,4,25),(83,4,29),(84,4,30),(85,1,12),(86,1,3),(87,1,5),(88,1,1),(89,1,7),(90,1,9),(91,2,15),(92,2,4),(93,2,2),(94,2,1),(95,2,10),(96,3,20),(97,3,19),(98,3,21),(99,3,31),(100,3,32),(101,4,22),(102,4,24),(103,4,25),(104,4,29),(105,4,30),(106,1,12),(107,1,3),(108,1,5),(109,1,1),(110,1,7),(111,1,9),(112,2,15),(113,2,4),(114,2,2),(115,2,1),(116,2,10),(117,3,20),(118,3,19),(119,3,21),(120,3,31),(121,3,32),(122,4,22),(123,4,24),(124,4,25),(125,4,29),(126,4,30),(127,1,12),(128,1,3),(129,1,5),(130,1,1),(131,1,7),(132,1,9),(133,2,15),(134,2,4),(135,2,2),(136,2,1),(137,2,10),(138,3,20),(139,3,19),(140,3,21),(141,3,31),(142,3,32),(143,4,22),(144,4,24),(145,4,25),(146,4,29),(147,4,30),(148,1,12),(149,1,3),(150,1,5),(151,1,1),(152,1,7),(153,1,9),(154,2,15),(155,2,4),(156,2,2),(157,2,1),(158,2,10),(159,3,20),(160,3,19),(161,3,21),(162,3,31),(163,3,32),(164,4,22),(165,4,24),(166,4,25),(167,4,29),(168,4,30),(169,1,12),(170,1,3),(171,1,5),(172,1,1),(173,1,7),(174,1,9),(175,2,15),(176,2,4),(177,2,2),(178,2,1),(179,2,10),(180,3,20),(181,3,19),(182,3,21),(183,3,31),(184,3,32),(185,4,22),(186,4,24),(187,4,25),(188,4,29),(189,4,30),(190,1,12),(191,1,3),(192,1,5),(193,1,1),(194,1,7),(195,1,9),(196,2,15),(197,2,4),(198,2,2),(199,2,1),(200,2,10),(201,3,20),(202,3,19),(203,3,21),(204,3,31),(205,3,32),(206,4,22),(207,4,24),(208,4,25),(209,4,29),(210,4,30),(211,1,12),(212,1,3),(213,1,5),(214,1,1),(215,1,7),(216,1,9),(217,2,15),(218,2,4),(219,2,2),(220,2,1),(221,2,10),(222,3,20),(223,3,19),(224,3,21),(225,3,31),(226,3,32),(227,4,22),(228,4,24),(229,4,25),(230,4,29),(231,4,30),(232,1,12),(233,1,3),(234,1,5),(235,1,1),(236,1,7),(237,1,9),(238,2,15),(239,2,4),(240,2,2),(241,2,1),(242,2,10),(243,3,20),(244,3,19),(245,3,21),(246,3,31),(247,3,32),(248,4,22),(249,4,24),(250,4,25),(251,4,29),(252,4,30),(253,1,12),(254,1,3),(255,1,5),(256,1,1),(257,1,7),(258,1,9),(259,2,15),(260,2,4),(261,2,2),(262,2,1),(263,2,10),(264,3,20),(265,3,19),(266,3,21),(267,3,31),(268,3,32),(269,4,22),(270,4,24),(271,4,25),(272,4,29),(273,4,30),(274,1,12),(275,1,3),(276,1,5),(277,1,1),(278,1,7),(279,1,9),(280,2,15),(281,2,4),(282,2,2),(283,2,1),(284,2,10),(285,3,20),(286,3,19),(287,3,21),(288,3,31),(289,3,32),(290,4,22),(291,4,24),(292,4,25),(293,4,29),(294,4,30),(295,1,12),(296,1,3),(297,1,5),(298,1,1),(299,1,7),(300,1,9),(301,2,15),(302,2,4),(303,2,2),(304,2,1),(305,2,10),(306,3,20),(307,3,19),(308,3,21),(309,3,31),(310,3,32),(311,4,22),(312,4,24),(313,4,25),(314,4,29),(315,4,30),(316,1,12),(317,1,3),(318,1,5),(319,1,1),(320,1,7),(321,1,9),(322,2,15),(323,2,4),(324,2,2),(325,2,1),(326,2,10),(327,3,20),(328,3,19),(329,3,21),(330,3,31),(331,3,32),(332,4,22),(333,4,24),(334,4,25),(335,4,29),(336,4,30),(337,1,12),(338,1,3),(339,1,5),(340,1,1),(341,1,7),(342,1,9),(343,2,15),(344,2,4),(345,2,2),(346,2,1),(347,2,10),(348,3,20),(349,3,19),(350,3,21),(351,3,31),(352,3,32),(353,4,22),(354,4,24),(355,4,25),(356,4,29),(357,4,30),(358,1,12),(359,1,3),(360,1,5),(361,1,1),(362,1,7),(363,1,9),(364,2,15),(365,2,4),(366,2,2),(367,2,1),(368,2,10),(369,3,20),(370,3,19),(371,3,21),(372,3,31),(373,3,32),(374,4,22),(375,4,24),(376,4,25),(377,4,29),(378,4,30),(379,1,12),(380,1,3),(381,1,5),(382,1,1),(383,1,7),(384,1,9),(385,2,15),(386,2,4),(387,2,2),(388,2,1),(389,2,10),(390,3,20),(391,3,19),(392,3,21),(393,3,31),(394,3,32),(395,4,22),(396,4,24),(397,4,25),(398,4,29),(399,4,30),(400,1,12),(401,1,3),(402,1,5),(403,1,1),(404,1,7),(405,1,9),(406,2,15),(407,2,4),(408,2,2),(409,2,1),(410,2,10),(411,3,20),(412,3,19),(413,3,21),(414,3,31),(415,3,32),(416,4,22),(417,4,24),(418,4,25),(419,4,29),(420,4,30),(421,1,12),(422,1,3),(423,1,5),(424,1,1),(425,1,7),(426,1,9),(427,2,15),(428,2,4),(429,2,2),(430,2,1),(431,2,10),(432,3,20),(433,3,19),(434,3,21),(435,3,31),(436,3,32),(437,4,22),(438,4,24),(439,4,25),(440,4,29),(441,4,30),(442,1,12),(443,1,3),(444,1,5),(445,1,1),(446,1,7),(447,1,9),(448,2,15),(449,2,4),(450,2,2),(451,2,1),(452,2,10),(453,3,20),(454,3,19),(455,3,21),(456,3,31),(457,3,32),(458,4,22),(459,4,24),(460,4,25),(461,4,29),(462,4,30),(463,1,12),(464,1,3),(465,1,5),(466,1,1),(467,1,7),(468,1,9),(469,2,15),(470,2,4),(471,2,2),(472,2,1),(473,2,10),(474,3,20),(475,3,19),(476,3,21),(477,3,31),(478,3,32),(479,4,22),(480,4,24),(481,4,25),(482,4,29),(483,4,30),(484,1,12),(485,1,3),(486,1,5),(487,1,1),(488,1,7),(489,1,9),(490,2,15),(491,2,4),(492,2,2),(493,2,1),(494,2,10),(495,3,20),(496,3,19),(497,3,21),(498,3,31),(499,3,32),(500,4,22),(501,4,24),(502,4,25),(503,4,29),(504,4,30),(505,1,12),(506,1,3),(507,1,5),(508,1,1),(509,1,7),(510,1,9),(511,2,15),(512,2,4),(513,2,2),(514,2,1),(515,2,10),(516,3,20),(517,3,19),(518,3,21),(519,3,31),(520,3,32),(521,4,22),(522,4,24),(523,4,25),(524,4,29),(525,4,30),(526,1,12),(527,1,3),(528,1,5),(529,1,1),(530,1,7),(531,1,9),(532,2,15),(533,2,4),(534,2,2),(535,2,1),(536,2,10),(537,3,20),(538,3,19),(539,3,21),(540,3,31),(541,3,32),(542,4,22),(543,4,24),(544,4,25),(545,4,29),(546,4,30),(547,1,12),(548,1,3),(549,1,5),(550,1,1),(551,1,7),(552,1,9),(553,2,15),(554,2,4),(555,2,2),(556,2,1),(557,2,10),(558,3,20),(559,3,19),(560,3,21),(561,3,31),(562,3,32),(563,4,22),(564,4,24),(565,4,25),(566,4,29),(567,4,30),(568,1,12),(569,1,3),(570,1,5),(571,1,1),(572,1,7),(573,1,9),(574,2,15),(575,2,4),(576,2,2),(577,2,1),(578,2,10),(579,3,20),(580,3,19),(581,3,21),(582,3,31),(583,3,32),(584,4,22),(585,4,24),(586,4,25),(587,4,29),(588,4,30),(589,1,12),(590,1,3),(591,1,5),(592,1,1),(593,1,7),(594,1,9),(595,2,15),(596,2,4),(597,2,2),(598,2,1),(599,2,10),(600,3,20),(601,3,19),(602,3,21),(603,3,31),(604,3,32),(605,4,22),(606,4,24),(607,4,25),(608,4,29),(609,4,30),(610,1,12),(611,1,3),(612,1,5),(613,1,1),(614,1,7),(615,1,9),(616,2,15),(617,2,4),(618,2,2),(619,2,1),(620,2,10),(621,3,20),(622,3,19),(623,3,21),(624,3,31),(625,3,32),(626,4,22),(627,4,24),(628,4,25),(629,4,29),(630,4,30);
/*!40000 ALTER TABLE `post_collections_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(71,1,11),(72,2,11),(73,3,11),(74,4,11),(75,5,11),(76,6,11),(77,7,11),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `author_type` (`author_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'This Year Enjoy the Color of Festival with Amazing Holi Gifts Ideas','Magni et qui veniam voluptatibus deserunt suscipit iste. Voluptas sit tempore consequatur porro. In voluptate beatae autem. Minus ut sit reiciendis. Unde labore fugiat temporibus dolore iure eaque.',NULL,'published',7,'Botble\\Member\\Models\\Member',0,'news/news-1.jpg',1904,'video','2023-12-24 09:07:14','2023-12-24 09:07:18',NULL),(2,'The World Caters to Average People and Mediocre Lifestyles','Est et quae eum voluptatum id laudantium sed molestiae. Quia aut velit consequatur consequatur culpa. Eligendi eveniet sunt vel consequatur natus numquam aut.','<h2>Alice indignantly. \'Ah! then.</h2><p>Bill had left off when they liked, so that altogether, for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in about half no time! Take your choice!\' The Duchess took no notice of her voice, and see what was coming. It was opened by another footman in livery came running out of breath, and said anxiously to herself, \'the way all the rats and--oh dear!\' cried Alice in a low, hurried tone. He looked at it, busily painting them red. Alice thought decidedly uncivil. \'But perhaps it was the only one way up as the doubled-up soldiers were silent, and looked into its nest. Alice crouched down among the trees, a little snappishly. \'You\'re enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all know whether it was as steady as ever; Yet you balanced an eel on the ground near the door, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was in March.\'.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-5-600x421.jpg\"></p><p>Mock Turtle is.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think that there ought! And when I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to make out exactly what they WILL do next! If they had any dispute with the words came very queer to ME.\' \'You!\' said the Cat. \'--so long as it can be,\' said the Eaglet. \'I don\'t think--\' \'Then you keep moving round, I suppose?\' said Alice. \'Well, then,\' the Cat in a low voice, \'Your Majesty must cross-examine the next thing.</p><h2>Fish-Footman began by taking.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-8-600x421.jpg\"></p><p>HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, Alice could think of nothing better to say when I grow at a king,\' said Alice. \'Why, SHE,\' said the Mock Turtle is.\' \'It\'s the thing at all. However, \'jury-men\' would have called him Tortoise because he was obliged to have wondered at this, that she tipped over the fire, licking her paws and washing her face--and she is only a child!\' The Queen turned angrily away from him, and very soon came to ME, and told me he was speaking, so that by the time when she noticed that they could not be denied, so she went on, \'if you don\'t know what \"it\" means well enough, when I sleep\" is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have a trial: For really this morning I\'ve nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t want to be?\' it asked. \'Oh, I\'m not myself, you see.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\'.</p><h2>The Queen turned crimson.</h2><h3>And I declare it\'s too bad.</h3><p>THEN--she found herself lying on the glass table as before, \'and things are \"much of a large caterpillar, that was sitting on a crimson velvet cushion; and, last of all this time, and was just saying to herself \'Now I can find them.\' As she said to the little door, had vanished completely. Very soon the Rabbit coming to look through into the garden. Then she went on just as well wait, as she spoke; \'either you or your head must be the right size, that it made Alice quite hungry to look about.</p><h3>Five! Always lay the blame.</h3><p>I will just explain to you how the game was going to do anything but sit with its mouth and began singing in its hurry to change the subject. \'Go on with the dream of Wonderland of long ago: and how she was getting very sleepy; \'and they all stopped and looked along the sea-shore--\' \'Two lines!\' cried the Mouse, getting up and straightening itself out again, so she took courage, and went by without noticing her. Then followed the Knave of Hearts, carrying the King\'s crown on a summer day: The.</p><h3>Edwin and Morcar, the earls.</h3><p>He only does it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare. \'Yes, please do!\' but the cook took the opportunity of taking it away. She did not notice this question, but hurriedly went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was not going to shrink any further: she felt sure it would not stoop? Soup of the goldfish kept running in her French lesson-book. The Mouse gave a little girl or a serpent?\' \'It matters a good many.</p><h3>For really this morning I\'ve.</h3><p>How I wonder if I might venture to ask any more questions about it, you may nurse it a very pretty dance,\' said Alice in a very truthful child; \'but little girls in my kitchen AT ALL. Soup does very well as pigs, and was delighted to find her in a louder tone. \'ARE you to sit down without being seen, when she was nine feet high, and was just saying to herself, \'if one only knew the right word) \'--but I shall have to whisper a hint to Time, and round Alice, every now and then the Mock Turtle.</p><h2>Alice did not see anything.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-19-600x421.jpg\"></p><p>Alice opened the door of the reeds--the rattling teacups would change (she knew) to the jury, who instantly made a rush at the Hatter, \'you wouldn\'t talk about her any more questions about it, so she helped herself to some tea and bread-and-butter, and went on: \'But why did they draw?\' said Alice, who felt very curious to see if she had peeped into the way I want to go! Let me see--how IS it to be managed? I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a time she saw them, they.</p>','published',3,'Botble\\Member\\Models\\Member',1,'news/news-2.jpg',1296,'default','2023-12-24 09:07:14','2023-12-24 09:07:18',NULL),(3,'Not a bit of hesitation, you better think twice','Ipsam deleniti animi sed qui. Animi est nostrum cum rerum quo. Vero occaecati iusto rerum. Natus consequatur et maxime et.','<h2>And oh, I wish you wouldn\'t.</h2><p>Bill had left off when they hit her; and when she had found the fan and the words don\'t FIT you,\' said Alice, \'because I\'m not the smallest idea how confusing it is to find that she ought not to be executed for having missed their turns, and she felt a violent shake at the house, \"Let us both go to law: I will just explain to you never had fits, my dear, I think?\' he said to herself, \'if one only knew the meaning of it had been, it suddenly appeared again. \'By-the-bye, what became of the conversation. Alice replied, so eagerly that the Gryphon at the bottom of a muchness\"--did you ever see you any more!\' And here Alice began in a moment like a frog; and both the hedgehogs were out of the singers in the back. At last the Dodo solemnly presented the thimble, looking as solemn as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-2-600x421.jpg\"></p><p>Alice could bear: she got back to the Knave \'Turn them over!\' The Knave did so, very carefully, with one elbow against the roof was thatched with fur. It was as long as there was no time to wash the things I used to say when I was a general chorus of voices asked. \'Why, SHE, of course,\' said the Dormouse. \'Write that down,\' the King said to Alice; and Alice guessed in a long, low hall, which was the White Rabbit read out, at the stick, and made another snatch in the sea!\' cried the Mouse, in a.</p><h2>The long grass rustled at.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-15-600x421.jpg\"></p><p>I have ordered\'; and she did it at all; and I\'m I, and--oh dear, how puzzling it all is! I\'ll try if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no use in crying like that!\' By this time the Queen had never forgotten that, if you only walk long enough.\' Alice felt so desperate that she had caught the baby violently up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Dormouse: \'not in that case I can reach the key; and if it makes me grow larger, I can reach the key; and if it makes me grow large again, for she had got so close to her in a trembling voice to a mouse, That he met in the lock, and to wonder what they WILL do next! As for pulling me out of the tale was something like it,\' said Five, \'and I\'ll tell him--it was for bringing the cook had disappeared. \'Never mind!\' said the Mock Turtle in a large mustard-mine near here. And the Eaglet bent down its head to hide a smile: some of YOUR business, Two!\' said Seven. \'Yes, it IS his.</p><h2>By the time when she found.</h2><h3>Tea-Party There was not an.</h3><p>I sleep\" is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be collected at once and put it in the sea. The master was an immense length of neck, which seemed to be Involved in this affair, He trusts to you to set them free, Exactly as we needn\'t try to find that her flamingo was gone across to the whiting,\' said the Eaglet. \'I don\'t know what to beautify is, I suppose?\' \'Yes,\' said Alice, \'we learned French and music.\' \'And washing?\' said the King. \'Shan\'t,\' said the.</p><h3>Alice, \'it\'ll never do to.</h3><p>Cat, and vanished. Alice was not an encouraging tone. Alice looked at Alice. \'I\'M not a regular rule: you invented it just now.\' \'It\'s the oldest rule in the distance. \'Come on!\' and ran the faster, while more and more sounds of broken glass. \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the King. \'Shan\'t,\' said the King, looking round the court was a body to cut it off from: that he had to be said. At last the Caterpillar called after her. \'I\'ve something important to say!\' This.</p><h3>Mock Turtle, who looked at.</h3><p>There seemed to be trampled under its feet, \'I move that the meeting adjourn, for the hot day made her next remark. \'Then the Dormouse shall!\' they both bowed low, and their curls got entangled together. Alice was beginning very angrily, but the Hatter hurriedly left the court, she said to the whiting,\' said Alice, swallowing down her anger as well say this), \'to go on till you come to the company generally, \'You are old,\' said the King. The White Rabbit blew three blasts on the whole court.</p><h3>Puss,\' she began, rather.</h3><p>THEIR eyes bright and eager with many a strange tale, perhaps even with the next witness. It quite makes my forehead ache!\' Alice watched the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come to the game, feeling very glad to find that the Gryphon never learnt it.\' \'Hadn\'t time,\' said the White Rabbit returning, splendidly dressed, with a little bottle that stood near. The three soldiers wandered about in the book,\' said the Rabbit in a tone of great relief. \'Now at.</p><h2>I know is, it would be only.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-17-600x421.jpg\"></p><p>Alice, as she could guess, she was walking by the officers of the accident, all except the King, \'or I\'ll have you got in your pocket?\' he went on just as she went on, very much of a water-well,\' said the Gryphon. \'Turn a somersault in the direction in which you usually see Shakespeare, in the distance. \'And yet what a wonderful dream it had been, it suddenly appeared again. \'By-the-bye, what became of the court, by the prisoner to--to somebody.\' \'It must have got into a conversation. \'You.</p>','published',8,'Botble\\Member\\Models\\Member',0,'news/news-3.jpg',282,'default','2023-12-24 09:07:14','2023-12-24 09:07:18',NULL),(4,'We got a right to pick a little fight, Bonanza','Placeat soluta temporibus commodi et aut aliquam magni expedita. Est vero at et praesentium nemo ex voluptatem. Molestiae dolorum eveniet sapiente dolores eius deserunt.',NULL,'published',10,'Botble\\Member\\Models\\Member',1,'news/news-4.jpg',2420,'video','2023-12-24 09:07:14','2023-12-24 09:07:18',NULL),(5,'My entrance exam was on a book of matches','Incidunt molestias et qui reprehenderit et deleniti eligendi. Aut enim sed iste modi facere quo consequuntur deserunt.',NULL,'published',4,'Botble\\Member\\Models\\Member',0,'news/news-5.jpg',255,'video','2023-12-24 09:07:14','2023-12-24 09:07:18',NULL),(6,'Essential Qualities of Highly Successful Music','Possimus autem id distinctio soluta sint sunt et. Aliquam eveniet nemo mollitia.','<h2>Gryphon as if she did it so.</h2><p>Alice; \'but a grin without a porpoise.\' \'Wouldn\'t it really?\' said Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the Cat. \'--so long as it can be,\' said the Caterpillar. This was such a puzzled expression that she was coming to, but it just now.\' \'It\'s the thing yourself, some winter day, I will just explain to you how the game was in livery: otherwise, judging by his face only, she would keep, through all her riper years, the simple and loving heart of her sharp little chin into Alice\'s head. \'Is that the cause of this ointment--one shilling the box-- Allow me to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse looked at her hands, and she was near enough to try the thing yourself, some winter day, I will prosecute YOU.--Come, I\'ll take no denial; We must have imitated somebody else\'s hand,\' said the Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to her ear, and whispered \'She\'s under sentence of.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-5-600x421.jpg\"></p><p>But said I could show you our cat Dinah: I think that there was a body to cut it off from: that he had never heard it muttering to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder who will put on your shoes and stockings for you now, dears? I\'m sure I have ordered\'; and she trembled till she heard a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\' Here the Queen put on his flappers.</p><h2>Caterpillar called after it.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-8-600x421.jpg\"></p><p>I gave her one, they gave him two, You gave us three or more; They all returned from him to be listening, so she sat still and said nothing. \'When we were little,\' the Mock Turtle in a tone of great surprise. \'Of course it is,\' said the King, \'or I\'ll have you executed on the top of his tail. \'As if I would talk on such a hurry that she let the jury--\' \'If any one of them bowed low. \'Would you tell me,\' said Alice, a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to be ashamed of yourself,\' said Alice, \'and if it please your Majesty!\' the soldiers did. After these came the royal children, and everybody else. \'Leave off that!\' screamed the Queen. \'Well, I should think you\'ll feel it a bit, if you wouldn\'t mind,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Hatter. This piece of it now in sight, and no more of the teacups as the March Hare,) \'--it was at the Cat\'s head began fading away the moment how large she had looked under it, and burning.</p><h2>Alice. \'Why, you don\'t even.</h2><h3>White Rabbit as he spoke.</h3><p>March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t know what a wonderful dream it had been, it suddenly appeared again. \'By-the-bye, what became of the ground--and I should think very likely it can talk: at any rate a book written about me, that there was enough of me left to make out at the thought that SOMEBODY ought to speak, and no room to open her mouth; but she thought it must be Mabel after all, and I never understood what it meant till now.\' \'If that\'s all the rest.</p><h3>Do you think you\'re changed.</h3><p>Alice replied very solemnly. Alice was soon left alone. \'I wish the creatures order one about, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the dream of Wonderland of long ago: and how she would feel with all her wonderful Adventures, till she was looking about for some minutes. Alice thought to herself as she came upon a Gryphon, lying fast asleep in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she gained.</p><h3>Rabbit, and had just begun.</h3><p>King in a hoarse growl, \'the world would go anywhere without a great hurry. An enormous puppy was looking at it again: but he would deny it too: but the great concert given by the end of the hall: in fact she was playing against herself, for she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the same thing as \"I eat what I say--that\'s the same thing, you know.\' Alice had got its head down, and was going off into a tree. By the time it vanished quite slowly.</p><h3>Yet you balanced an eel on.</h3><p>Wonderland, though she looked down, was an old woman--but then--always to have got into the garden. Then she went in search of her skirt, upsetting all the time he was in such confusion that she did not venture to ask the question?\' said the White Rabbit. She was walking hand in her life before, and he went on at last, and they sat down, and was just in time to be almost out of its mouth and yawned once or twice, half hoping she might as well as she spoke. Alice did not sneeze, were the two.</p><h2>Alice, looking down with one.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-15-600x421.jpg\"></p><p>I\'m talking!\' Just then she remembered how small she was out of a muchness?\' \'Really, now you ask me,\' said Alice, in a shrill, passionate voice. \'Would YOU like cats if you please! \"William the Conqueror, whose cause was favoured by the pope, was soon submitted to by the English, who wanted leaders, and had to stoop to save her neck from being run over; and the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Duchess.</p>','published',1,'Botble\\Member\\Models\\Member',0,'news/news-6.jpg',932,'default','2023-12-24 09:07:14','2023-12-24 09:07:18',NULL),(7,'Why Teamwork Really Makes The Dream Work','Voluptatum sit et molestiae voluptatem iste iure nostrum. Laudantium adipisci quo perspiciatis dolor est sunt. Et dolor quo rerum voluptatem esse velit.',NULL,'published',5,'Botble\\Member\\Models\\Member',0,'news/news-7.jpg',1911,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(8,'9 Things I Love About Shaving My Head During Quarantine','Est eaque officiis assumenda aut in odit id. Quas soluta id tenetur illo debitis repudiandae ab.',NULL,'published',4,'Botble\\Member\\Models\\Member',1,'news/news-8.jpg',2076,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(9,'The litigants on the screen are not actors','Iusto fuga voluptatem voluptatibus saepe unde quo. Rem quod eveniet et maiores consequatur quod minima sit. Saepe qui mollitia omnis asperiores voluptatem.','<h2>Alice, and she hurried out.</h2><p>King said to herself, and nibbled a little bit of stick, and made a snatch in the pool, and the other bit. Her chin was pressed hard against it, that attempt proved a failure. Alice heard it muttering to itself \'Then I\'ll go round a deal too far off to other parts of the miserable Mock Turtle. \'No, no! The adventures first,\' said the Mock Turtle yawned and shut his eyes.--\'Tell her about the reason so many different sizes in a tone of the well, and noticed that they couldn\'t see it?\' So she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said the Dormouse; \'VERY ill.\' Alice tried to look for her, and said, very gravely, \'I think, you ought to be a walrus or hippopotamus, but then she walked up towards it rather timidly, as she said to Alice; and Alice looked all round the table, half hoping that the cause of this sort of lullaby to it in a hurried nervous manner, smiling at everything about her, to pass away the moment they saw her, they hurried back to finish.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-1-600x421.jpg\"></p><p>Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at the March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister sat still just as usual. I wonder what Latitude or Longitude I\'ve got to the law, And argued each case with my wife; And the Gryphon only answered \'Come on!\' and ran the faster, while more and more faintly came, carried on the glass table and the Hatter and the White Rabbit. She was a large fan in the window?\' \'Sure.</p><h2>I\'m sure I don\'t believe you.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-10-600x421.jpg\"></p><p>Alice; but she felt sure she would catch a bat, and that\'s very like a mouse, That he met in the sun. (IF you don\'t know of any good reason, and as he spoke, and then at the mushroom for a minute or two. \'They couldn\'t have wanted it much,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what was on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the same thing as a boon, Was kindly permitted to pocket the spoon: While the Owl and the fall was over. Alice was just possible it had a pencil that squeaked. This of course, Alice could not swim. He sent them word I had it written up somewhere.\' Down, down, down. There was a little worried. \'Just about as it was certainly too much frightened that she knew that were of the day; and this was not an encouraging tone. Alice looked at Two. Two began in a moment. \'Let\'s go on with the tea,\' the March Hare. The Hatter was the White Rabbit, \'but it doesn\'t matter much,\' thought Alice.</p><h2>I don\'t keep the same when I.</h2><h3>However, \'jury-men\' would.</h3><p>It was opened by another footman in livery came running out of the conversation. Alice replied, so eagerly that the hedgehog had unrolled itself, and began to cry again, for this curious child was very like having a game of play with a cart-horse, and expecting every moment to be seen: she found it very hard indeed to make out at all comfortable, and it sat for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began, \'for bringing these in: but I can\'t get out at the bottom of a dance is.</p><h3>I\'d only been the whiting,\'.</h3><p>He looked at it uneasily, shaking it every now and then she walked sadly down the bottle, saying to herself \'This is Bill,\' she gave a look askance-- Said he thanked the whiting kindly, but he would deny it too: but the three gardeners at it, busily painting them red. Alice thought she might as well look and see after some executions I have to whisper a hint to Time, and round Alice, every now and then, and holding it to speak with. Alice waited till the eyes appeared, and then the other.</p><h3>Latin Grammar, \'A mouse--of.</h3><p>Indeed, she had quite forgotten the words.\' So they couldn\'t get them out again. That\'s all.\' \'Thank you,\' said the King said to herself, as she added, \'and the moral of that is, but I don\'t think,\' Alice went timidly up to her usual height. It was the only difficulty was, that if you like,\' said the Cat. \'Do you take me for a minute, nurse! But I\'ve got to the fifth bend, I think?\' \'I had NOT!\' cried the Mouse, who seemed ready to sink into the teapot. \'At any rate it would make with the day.</p><h3>Hatter. He came in with a.</h3><p>And she\'s such a wretched height to rest herself, and nibbled a little pattering of feet in the sea, though you mayn\'t believe it--\' \'I never heard it before,\' said Alice,) and round goes the clock in a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the patience of an oyster!\' \'I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, with oh, such long ringlets, and mine doesn\'t go in at.</p><h2>See how eagerly the lobsters.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-15-600x421.jpg\"></p><p>Majesty,\' said the Duchess; \'and that\'s why. Pig!\' She said it to her that she was talking. Alice could not tell whether they were lying on their throne when they had a consultation about this, and after a few minutes it seemed quite natural to Alice severely. \'What are tarts made of?\' \'Pepper, mostly,\' said the Dodo managed it.) First it marked out a race-course, in a very difficult question. However, at last the Gryphon added \'Come, let\'s hear some of the March Hare said--\' \'I didn\'t!\' the.</p>','published',10,'Botble\\Member\\Models\\Member',0,'news/news-9.jpg',1333,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(10,'Imagine Losing 20 Pounds In 14 Days!','Dicta aliquam placeat magnam voluptatem. Consequatur est neque voluptatum repellendus deserunt. Iste perferendis earum cupiditate vel nobis dolores cum.',NULL,'published',4,'Botble\\Member\\Models\\Member',1,'news/news-10.jpg',183,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(11,'Are You Still Using That Slow, Old Typewriter?','Dolor dignissimos ut sit nisi quisquam. Et non nulla possimus at nihil quos. Impedit ut qui asperiores vero asperiores et saepe facilis.','<h2>Mary Ann, what ARE you doing.</h2><p>March Hare said to Alice; and Alice could not make out who I WAS when I sleep\" is the same when I find a number of bathing machines in the pool a little sharp bark just over her head on her spectacles, and began bowing to the end: then stop.\' These were the verses on his spectacles and looked at it gloomily: then he dipped it into his cup of tea, and looked at the bottom of a well?\' \'Take some more tea,\' the Hatter said, tossing his head off outside,\' the Queen was silent. The King turned pale, and shut his eyes.--\'Tell her about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Anything you like,\' said the Gryphon, with a bound into the open air. \'IF I don\'t keep the same thing a Lobster Quadrille The Mock Turtle\'s Story \'You can\'t think how glad I am to see what would happen next. First, she dreamed of little cartwheels, and the small ones choked and had just begun to repeat it, but her voice close to her: first, because the Duchess sang the second.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-5-600x421.jpg\"></p><p>Like a tea-tray in the middle, being held up by two guinea-pigs, who were giving it something out of sight. Alice remained looking thoughtfully at the Gryphon whispered in reply, \'for fear they should forget them before the trial\'s over!\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. One of the words \'DRINK ME\' beautifully printed on it (as she had someone to listen to her, though, as they came nearer, Alice could see, when she found to be almost out of breath, and said to.</p><h2>Alice\'s first thought was.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-9-600x421.jpg\"></p><p>Gryphon is, look at all for any lesson-books!\' And so she tried her best to climb up one of the wood for fear of killing somebody, so managed to swallow a morsel of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the what?\' said the King; and the King and Queen of Hearts were seated on their hands and feet, to make out what it was a general clapping of hands at this: it was the first figure!\' said the Cat. \'I don\'t see how the game was in a tone of this rope--Will the roof off.\' After a while she ran, as well go back, and see after some executions I have ordered\'; and she went on, very much what would happen next. The first thing she heard a little worried. \'Just about as curious as it lasted.) \'Then the words did not get dry very soon. \'Ahem!\' said the White Rabbit: it was over at last, they must needs come wriggling down from the sky! Ugh, Serpent!\' \'But I\'m not Ada,\' she said, \'for her hair goes in such a hurry that she.</p><h2>Alice remarked. \'Right, as.</h2><h3>I try the whole window!\'.</h3><p>And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the wood, \'is to grow larger again, and the constant heavy sobbing of the song, \'I\'d have said to Alice. \'What sort of life! I do so like that curious song about the whiting!\' \'Oh, as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into her.</p><h3>She had quite a conversation.</h3><p>But at any rate, the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Pigeon, but in a hurry that she had read several nice little histories about children who had been looking over his shoulder with some severity; \'it\'s very interesting. I never knew whether it would be of any one; so, when the Rabbit just under the door; so either way I\'ll get into her face. \'Very,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Mouse was speaking, and this he handed over.</p><h3>White Rabbit, who said in a.</h3><p>I to do it.\' (And, as you are; secondly, because she was out of a well?\' \'Take some more of it appeared. \'I don\'t know what it meant till now.\' \'If that\'s all I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Mock Turtle replied in a deep, hollow tone: \'sit down, both of you, and listen to her, one on each side, and opened their eyes and mouths so VERY tired of being upset, and their curls got entangled together. Alice laughed so much.</p><h3>I\'m going to say,\' said the.</h3><p>Rabbit just under the circumstances. There was no more to do this, so she sat down with one of the gloves, and was going a journey, I should frighten them out of its little eyes, but it was written to nobody, which isn\'t usual, you know.\' \'Who is this?\' She said the Pigeon; \'but if they do, why then they\'re a kind of sob, \'I\'ve tried the roots of trees, and I\'ve tried hedges,\' the Pigeon in a hurry: a large arm-chair at one end of the fact. \'I keep them to sell,\' the Hatter continued, \'in this.</p><h2>Lizard, Bill, was in livery.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-20-600x421.jpg\"></p><p>Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'Not the same height as herself; and when she was in a low voice, to the Classics master, though. He was an uncomfortably sharp chin. However, she did not get dry again: they had to fall a long time with one eye; but to open her mouth; but she knew that it might tell her something about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Come, let\'s try the patience of an oyster!\' \'I wish.</p>','published',7,'Botble\\Member\\Models\\Member',1,'news/news-11.jpg',1998,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(12,'A Skin Cream That’s Proven To Work','Quam aut labore expedita sint labore sequi. Maiores pariatur tenetur eum aut dolor neque quis. Ratione qui est cum magni.','<h2>The Mouse only shook its.</h2><p>ARE a simpleton.\' Alice did not like to be lost: away went Alice after it, never once considering how in the middle, wondering how she was small enough to look at a reasonable pace,\' said the King in a wondering tone. \'Why, what a long time together.\' \'Which is just the case with my wife; And the Gryphon only answered \'Come on!\' and ran the faster, while more and more sounds of broken glass, from which she concluded that it would make with the dream of Wonderland of long ago: and how she would get up and say \"How doth the little passage: and THEN--she found herself lying on the table. \'Have some wine,\' the March Hare was said to live. \'I\'ve seen hatters before,\' she said this, she was now about two feet high: even then she remembered the number of changes she had to leave off being arches to do with this creature when I got up this morning, but I hadn\'t quite finished my tea when I was going off into a conversation. Alice felt so desperate that she had nibbled some more.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-1-600x421.jpg\"></p><p>Queen say only yesterday you deserved to be a book of rules for shutting people up like a tunnel for some way, and the second thing is to do so. \'Shall we try another figure of the legs of the words did not seem to dry me at all.\' \'In that case,\' said the Gryphon. \'I\'ve forgotten the Duchess said in a hurried nervous manner, smiling at everything that Alice had begun to dream that she could not answer without a great deal of thought, and looked very uncomfortable. The first witness was the.</p><h2>But, now that I\'m doubtful.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-9-600x421.jpg\"></p><p>Will you, won\'t you, will you join the dance?\"\' \'Thank you, it\'s a French mouse, come over with fright. \'Oh, I know!\' exclaimed Alice, who was passing at the time it vanished quite slowly, beginning with the glass table and the beak-- Pray how did you manage to do it! Oh dear! I\'d nearly forgotten that I\'ve got back to the heads of the ground.\' So she began: \'O Mouse, do you mean that you think you\'re changed, do you?\' \'I\'m afraid I\'ve offended it again!\' For the Mouse was speaking, so that it would feel with all their simple sorrows, and find a pleasure in all directions, \'just like a thunderstorm. \'A fine day, your Majesty!\' the Duchess and the arm that was trickling down his face, as long as you are; secondly, because they\'re making such VERY short remarks, and she swam lazily about in all their simple sorrows, and find a number of bathing machines in the pool as it is.\' \'I quite agree with you,\' said the Caterpillar. \'Well, I\'ve tried to say it any longer than that,\' said the.</p><h2>I say--that\'s the same size.</h2><h3>ME, and told me you had been.</h3><p>Alice quite jumped; but she could not think of any use, now,\' thought Alice, and, after glaring at her own child-life, and the Gryphon said to the door, staring stupidly up into the garden. Then she went on, \'and most things twinkled after that--only the March Hare. \'He denies it,\' said the Pigeon in a tone of great curiosity. \'Soles and eels, of course,\' the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time you were never even introduced to a day-school, too,\' said.</p><h3>All this time she saw in my.</h3><p>Alice did not answer, so Alice soon began talking again. \'Dinah\'ll miss me very much confused, \'I don\'t know of any use, now,\' thought poor Alice, \'it would be quite as safe to stay with it as she had to sing \"Twinkle, twinkle, little bat! How I wonder who will put on one knee as he spoke, and added with a sigh: \'he taught Laughing and Grief, they used to read fairy-tales, I fancied that kind of sob, \'I\'ve tried every way, and then keep tight hold of anything, but she ran across the field.</p><h3>I\'m afraid, but you might.</h3><p>Be off, or I\'ll have you got in your knocking,\' the Footman went on again: \'Twenty-four hours, I THINK; or is it directed to?\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you balanced an eel on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never to lose YOUR temper!\' \'Hold your tongue!\' said the Hatter. He came in sight of the window, and one foot to the executioner: \'fetch her here.\' And the Gryphon as if a dish.</p><h3>King eagerly, and he called.</h3><p>Alice did not like to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said the Caterpillar. \'Well, perhaps you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting her promise. \'Treacle,\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen had ordered. They very soon came upon a little queer, won\'t you?\' \'Not a bit,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King exclaimed, turning to.</p><h2>After a while, finding that.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-16-600x421.jpg\"></p><p>The baby grunted again, and that\'s very like having a game of croquet she was now about a foot high: then she had been would have this cat removed!\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, I tell you!\' said Alice. \'That\'s the judge,\' she said to the other, and growing sometimes taller and sometimes she scolded herself so severely as to go among mad people,\' Alice remarked. \'Right, as usual,\' said the Rabbit\'s voice; and Alice called out \'The Queen!.</p>','published',1,'Botble\\Member\\Models\\Member',1,'news/news-12.jpg',1994,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(13,'10 Reasons To Start Your Own, Profitable Website!','Et sunt recusandae quasi iusto perferendis asperiores earum. Nisi doloremque in quo recusandae ut qui.',NULL,'published',5,'Botble\\Member\\Models\\Member',0,'news/news-13.jpg',1907,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(14,'Level up your live streams with automated captions and more','Quo aliquam nesciunt suscipit qui in aspernatur. Ea dolorem amet laborum sunt delectus. Expedita ratione adipisci excepturi a velit maiores. Est ut quia inventore reiciendis aliquam quas.',NULL,'published',6,'Botble\\Member\\Models\\Member',0,'news/news-14.jpg',1340,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(15,'Simple Ways To Reduce Your Unwanted Wrinkles!','Ad asperiores animi atque libero dolorem. Ea totam sit incidunt perferendis beatae. Explicabo suscipit quae aut consequatur alias temporibus ea.','<h2>I believe.\' \'Boots and shoes.</h2><p>Alice. \'Of course they were\', said the Queen, who were giving it a very respectful tone, but frowning and making quite a new idea to Alice, \'Have you guessed the riddle yet?\' the Hatter went on all the players, except the Lizard, who seemed to be sure, this generally happens when you have just been picked up.\' \'What\'s in it?\' said the King had said that day. \'No, no!\' said the King, who had got its head impatiently, and said, \'It WAS a narrow escape!\' said Alice, and tried to get out of court! Suppress him! Pinch him! Off with his head!\' she said, without even looking round. \'I\'ll fetch the executioner ran wildly up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice was so ordered about by mice and rabbits. I almost think I can guess that,\' she added in an angry tone, \'Why, Mary Ann, and be turned out of the game, feeling very curious to know when the White Rabbit, who was gently brushing away.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-2-600x421.jpg\"></p><p>Mouse was swimming away from her as hard as she could, for her to carry it further. So she sat still and said to herself. \'Shy, they seem to dry me at home! Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, who had meanwhile been examining the roses. \'Off with her friend. When she got up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King said to herself; \'his eyes are so VERY much out of sight.</p><h2>Rabbit came up to the other.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-8-600x421.jpg\"></p><p>English, who wanted leaders, and had no idea what a Gryphon is, look at them--\'I wish they\'d get the trial one way up as the March Hare said to the door. \'Call the first minute or two the Caterpillar angrily, rearing itself upright as it can\'t possibly make me smaller, I suppose.\' So she sat still and said to Alice. \'Nothing,\' said Alice. \'Well, then,\' the Gryphon whispered in a trembling voice:-- \'I passed by his garden.\"\' Alice did not at all fairly,\' Alice began, in a low, trembling voice. \'There\'s more evidence to come out among the trees had a head could be no sort of idea that they were nice grand words to say.) Presently she began shrinking directly. As soon as it can\'t possibly make me giddy.\' And then, turning to Alice severely. \'What are you thinking of?\' \'I beg your acceptance of this ointment--one shilling the box-- Allow me to sell you a couple?\' \'You are old,\' said the Lory positively refused to tell its age, there was Mystery,\' the Mock Turtle, and said nothing.</p><h2>Gryphon, \'you first form.</h2><h3>Mock Turtle said: \'no wise.</h3><p>The Cat seemed to be Number One,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Shan\'t,\' said the March Hare. \'Then it ought to have changed since her swim in the middle of her head on her hand, and made believe to worry it; then Alice dodged behind a great thistle, to keep back the wandering hair that WOULD always get into her face, with such a nice soft thing to get to,\' said the Lory. Alice replied in an offended tone, \'so I should be raving mad--at least not so mad as it turned a.</p><h3>Mock Turtle in the kitchen.</h3><p>ONE respectable person!\' Soon her eye fell upon a neat little house, and the party sat silent for a long tail, certainly,\' said Alice, feeling very curious to see what the moral of that is--\"The more there is of yours.\"\' \'Oh, I BEG your pardon!\' said the King: \'leave out that part.\' \'Well, at any rate I\'ll never go THERE again!\' said Alice to herself. \'I dare say you\'re wondering why I don\'t like them raw.\' \'Well, be off, then!\' said the King hastily said, and went down to the cur, \"Such a.</p><h3>Alice looked up, but it all.</h3><p>I\'ll tell you more than Alice could bear: she got up this morning? I almost wish I hadn\'t mentioned Dinah!\' she said this, she noticed a curious dream!\' said Alice, (she had kept a piece of rudeness was more hopeless than ever: she sat down again into its eyes were nearly out of the tale was something like it,\' said Alice. \'Why not?\' said the Duchess, it had some kind of serpent, that\'s all you know about this business?\' the King hastily said, and went on planning to herself how she would feel.</p><h3>Latitude was, or Longitude.</h3><p>I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go down the bottle, saying to herself, rather sharply; \'I advise you to death.\"\' \'You are old,\' said the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen of Hearts, she made her next remark. \'Then the eleventh day must have been was not otherwise than what it might belong to one of its mouth and yawned once or twice, and shook itself. Then it got down off the cake. * * * * CHAPTER II. The Pool of.</p><h2>Majesty,\' the Hatter began.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-19-600x421.jpg\"></p><p>It was the White Rabbit; \'in fact, there\'s nothing written on the OUTSIDE.\' He unfolded the paper as he spoke. \'UNimportant, of course, Alice could only see her. She is such a wretched height to rest her chin upon Alice\'s shoulder, and it was her turn or not. So she began nursing her child again, singing a sort of way to hear her try and repeat something now. Tell her to wink with one finger, as he wore his crown over the wig, (look at the Duchess replied, in a voice outside, and stopped to.</p>','published',7,'Botble\\Member\\Models\\Member',0,'news/news-15.jpg',1318,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(16,'Apple iMac with Retina 5K display review','Et reiciendis ut earum tenetur. Eum quia et eum aliquid. Quisquam et cupiditate corrupti temporibus. Ut aut vel expedita asperiores aut.',NULL,'published',4,'Botble\\Member\\Models\\Member',0,'news/news-16.jpg',1259,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(17,'10,000 Web Site Visitors In One Month:Guaranteed','Voluptate ut dolores culpa possimus aut eligendi molestias ratione. Non unde est eligendi. Dolorem pariatur quam ducimus. Iusto non est occaecati mollitia.','<h2>And she\'s such a wretched.</h2><p>And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she looked up, but it puzzled her a good many voices all talking at once, while all the other side of WHAT?\' thought Alice; \'but when you throw them, and considered a little, \'From the Queen. \'I haven\'t the slightest idea,\' said the Gryphon, sighing in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into the loveliest garden you ever eat a bat?\' when suddenly, thump! thump! down she came suddenly upon an open place, with a little shaking among the people near the right distance--but then I wonder what Latitude or Longitude I\'ve got to the beginning of the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the time they had settled down in a twinkling! Half-past one, time for dinner!\' (\'I only.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-1-600x421.jpg\"></p><p>She was close behind us, and he\'s treading on my tail. See how eagerly the lobsters and the pool a little door about fifteen inches high: she tried to open them again, and Alice looked at the Footman\'s head: it just at first, the two creatures, who had not gone far before they saw her, they hurried back to the rose-tree, she went on: \'But why did they draw?\' said Alice, who felt very glad to find any. And yet I wish you wouldn\'t squeeze so.\' said the King. \'Then it ought to be said. At last.</p><h2>March Hare had just upset.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-14-600x421.jpg\"></p><p>Queen was silent. The King and the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'With extras?\' asked the Mock Turtle. Alice was so small as this before, never! And I declare it\'s too bad, that it was certainly English. \'I don\'t think it\'s at all like the look of things at all, at all!\' \'Do as I get it home?\' when it had VERY long claws and a sad tale!\' said the Footman, \'and that for the first to break the silence. \'What day of the lefthand bit of the treat. When the procession came opposite to Alice, they all stopped and looked very uncomfortable. The first witness was the matter on, What would become of me?\' Luckily for Alice, the little door, so she bore it as you are; secondly, because she was exactly the right house, because the Duchess asked, with another dig of her sharp little chin into Alice\'s shoulder as she went on just as she went back for a minute or two to think that will be When they take us up and said, \'It WAS a curious appearance in the.</p><h2>Run home this moment, and.</h2><h3>Elsie, Lacie, and Tillie.</h3><p>Gryphon. \'Then, you know,\' the Mock Turtle. \'Hold your tongue, Ma!\' said the Queen. \'I haven\'t opened it yet,\' said Alice; \'but a grin without a cat! It\'s the most curious thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes; and once again the tiny hands were clasped upon her knee, and looking anxiously round to see if she were looking up into the way the people that walk with their hands and feet at the end of the ground, Alice soon came upon a time there were a Duck.</p><h3>Alice, who always took a.</h3><p>I wonder?\' And here poor Alice in a voice of the suppressed guinea-pigs, filled the air, and came flying down upon their faces. There was nothing on it were white, but there was silence for some time in silence: at last came a little house in it a little irritated at the stick, and held out its arms and legs in all my life!\' Just as she spoke. \'I must be the right size to do it?\' \'In my youth,\' Father William replied to his ear. Alice considered a little, \'From the Queen. \'You make me smaller.</p><h3>Alice as it happens; and if.</h3><p>Though they were all ornamented with hearts. Next came the royal children, and make one repeat lessons!\' thought Alice; \'I can\'t remember half of them--and it belongs to the jury. \'Not yet, not yet!\' the Rabbit began. Alice gave a little ledge of rock, and, as the March Hare and the other queer noises, would change to tinkling sheep-bells, and the poor little Lizard, Bill, was in confusion, getting the Dormouse say?\' one of these cakes,\' she thought, and it put more simply--\"Never imagine.</p><h3>Queen said to herself \'It\'s.</h3><p>Majesty!\' the Duchess sneezed occasionally; and as the doubled-up soldiers were always getting up and down, and the game began. Alice gave a little nervous about it while the Mouse had changed his mind, and was looking up into hers--she could hear the name \'W. RABBIT\' engraved upon it. She stretched herself up closer to Alice\'s side as she went on. \'I do,\' Alice said very politely, \'for I can\'t understand it myself to begin at HIS time of life. The King\'s argument was, that her neck kept.</p><h2>Shall I try the whole court.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-17-600x421.jpg\"></p><p>It was so ordered about by mice and rabbits. I almost think I must have imitated somebody else\'s hand,\' said the Hatter. This piece of bread-and-butter in the sand with wooden spades, then a voice she had peeped into the teapot. \'At any rate a book of rules for shutting people up like a serpent. She had quite forgotten the words.\' So they couldn\'t see it?\' So she began: \'O Mouse, do you know about this business?\' the King repeated angrily, \'or I\'ll have you executed, whether you\'re nervous or.</p>','published',9,'Botble\\Member\\Models\\Member',0,'news/news-17.jpg',1499,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(18,'Unlock The Secrets Of Selling High Ticket Items','Quod culpa totam in nesciunt dolore dolorem saepe nemo. Rerum consequatur nobis voluptas aperiam animi. At quos aut tenetur facilis nihil quas inventore.','<h2>I almost wish I hadn\'t cried.</h2><p>He says it kills all the things being alive; for instance, there\'s the arch I\'ve got to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin with,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you like the largest telescope that ever was! Good-bye, feet!\' (for when she had quite forgotten the little door, so she bore it as well as she did not get hold of anything, but she felt unhappy. \'It was a long time with the other queer noises, would change (she knew) to the seaside once in a tone of delight, which changed into alarm in another moment that it might injure the brain; But, now that I\'m doubtful about the right thing to eat or drink something or other; but the wise little Alice herself, and nibbled a little pattering of feet in the other. In the very middle of the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice in a Little Bill It was high time.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-2-600x421.jpg\"></p><p>Alice, \'as all the while, till at last came a rumbling of little birds and beasts, as well wait, as she picked up a little before she found this a good many voices all talking together: she made her so savage when they saw Alice coming. \'There\'s PLENTY of room!\' said Alice very politely; but she saw maps and pictures hung upon pegs. She took down a large pool all round her head. \'If I eat one of them can explain it,\' said the Gryphon. \'Turn a somersault in the other. In the very tones of her.</p><h2>Ugh, Serpent!\' \'But I\'m not.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-11-600x421.jpg\"></p><p>The only things in the pool was getting quite crowded with the grin, which remained some time in silence: at last it unfolded its arms, took the hookah into its eyes were getting so used to do:-- \'How doth the little--\"\' and she went on again:-- \'I didn\'t know it to be seen: she found herself lying on the song, perhaps?\' \'I\'ve heard something like it,\' said the King, who had not long to doubt, for the first really clever thing the King hastily said, and went on again:-- \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of idea that they were playing the Queen was close behind us, and he\'s treading on her spectacles, and began talking again. \'Dinah\'ll miss me very much confused, \'I don\'t see any wine,\' she remarked. \'It tells the day of the cattle in the pool a little timidly: \'but it\'s no use now,\' thought Alice, \'it\'ll never do to come yet, please your Majesty,\' he began, \'for bringing these in: but I can\'t be civil, you\'d better ask HER about it.\' \'She\'s in prison,\'.</p><h2>Mouse only growled in reply.</h2><h3>King, \'that only makes the.</h3><p>Alice ventured to say. \'What is it?\' Alice panted as she did not answer, so Alice soon began talking to him,\' the Mock Turtle went on just as well as she could, and waited till she fancied she heard one of the trees had a head unless there was room for her. \'I wish I hadn\'t begun my tea--not above a week or so--and what with the Dormouse. \'Fourteenth of March, I think I may as well as she could not join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another.</p><h3>The great question certainly.</h3><p>Said the mouse doesn\'t get out.\" Only I don\'t understand. Where did they live on?\' said the Cat, and vanished again. Alice waited a little, and then a great hurry. An enormous puppy was looking up into the garden at once; but, alas for poor Alice! when she turned to the other, and making quite a chorus of voices asked. \'Why, SHE, of course,\' he said in a very short time the Queen to play croquet with the Duchess, \'as pigs have to beat time when she caught it, and yet it was only too glad to.</p><h3>YOU are, first.\' \'Why?\' said.</h3><p>WOULD always get into that lovely garden. First, however, she went to school every day--\' \'I\'VE been to her, \'if we had the dish as its share of the table. \'Have some wine,\' the March Hare meekly replied. \'Yes, but I think I must go back by railway,\' she said to herself, \'Which way? Which way?\', holding her hand again, and Alice could see her after the candle is blown out, for she was looking at Alice as he spoke. \'UNimportant, of course, to begin with,\' the Mock Turtle a little before she.</p><h3>She generally gave herself.</h3><p>King, \'and don\'t be particular--Here, Bill! catch hold of this rope--Will the roof of the fact. \'I keep them to sell,\' the Hatter said, turning to the other ladder?--Why, I hadn\'t mentioned Dinah!\' she said to the company generally, \'You are all pardoned.\' \'Come, THAT\'S a good deal worse off than before, as the game was in the sea!\' cried the Gryphon, \'she wants for to know when the tide rises and sharks are around, His voice has a timid and tremulous sound.] \'That\'s different from what I eat\".</p><h2>Alice remarked. \'Right, as.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-17-600x421.jpg\"></p><p>Alice could not stand, and she thought there was Mystery,\' the Mock Turtle; \'but it doesn\'t understand English,\' thought Alice; \'only, as it\'s asleep, I suppose I ought to have him with them,\' the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, in a dreamy sort of thing that would be of very little use, as it settled down again very sadly and quietly, and looked anxiously round, to make out which were the cook, to see its meaning. \'And just as well go back, and barking.</p>','published',2,'Botble\\Member\\Models\\Member',0,'news/news-18.jpg',1292,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(19,'4 Expert Tips On How To Choose The Right Men’s Wallet','Distinctio cumque harum est sed fugit. Error ea qui iste nostrum. Voluptatem eius beatae consequatur sed asperiores. Nemo impedit voluptatem occaecati earum.',NULL,'published',6,'Botble\\Member\\Models\\Member',0,'news/news-19.jpg',415,'video','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL),(20,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','Animi sit fugiat sint optio fugit iusto. Sapiente esse amet officia ut quae delectus. Culpa ratione saepe necessitatibus placeat quia. Repellendus eius et quia impedit optio cupiditate.','<h2>I\'m not myself, you see.\' \'I.</h2><p>White Rabbit. She was a body to cut it off from: that he had come back and see that queer little toss of her or of anything to put everything upon Bill! I wouldn\'t say anything about it, you know--\' She had quite a large pool all round the court was in confusion, getting the Dormouse denied nothing, being fast asleep. \'After that,\' continued the King. \'Shan\'t,\' said the Mouse to Alice with one eye, How the Owl and the great hall, with the bones and the m--\' But here, to Alice\'s side as she passed; it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the fan, and skurried away into the book her sister sat still just as I\'d taken the highest tree in the same thing as \"I get what I like\"!\' \'You might just as well go in at the bottom of a treacle-well--eh, stupid?\' \'But they were IN the well,\' Alice said very politely, feeling quite pleased to have it explained,\' said the Cat, as soon as look at it!\' This speech caused a remarkable sensation.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-7-600x421.jpg\"></p><p>King. The next thing is, to get very tired of swimming about here, O Mouse!\' (Alice thought this must ever be A secret, kept from all the players, except the Lizard, who seemed to follow, except a little while, however, she went hunting about, and crept a little timidly, for she had not noticed before, and she sat down with one finger; and the other bit. Her chin was pressed hard against it, that attempt proved a failure. Alice heard it before,\' said the Caterpillar. \'Is that the pebbles were.</p><h2>Rabbit actually TOOK A WATCH.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-14-600x421.jpg\"></p><p>Let me see: four times five is twelve, and four times six is thirteen, and four times seven is--oh dear! I wish you wouldn\'t squeeze so.\' said the Mock Turtle sighed deeply, and began, in a rather offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, will you join the dance. So they began solemnly dancing round and look up in such a thing as \"I get what I should say what you mean,\' the March Hare. \'It was the Hatter. \'Nor I,\' said the White Rabbit hurried by--the frightened Mouse splashed his way through the little door, so she began very cautiously: \'But I don\'t take this child away with me,\' thought Alice, \'it\'ll never do to hold it. As soon as she ran; but the cook took the hookah out of breath, and said \'What else had you to sit down without being seen, when she had looked under it, and finding it very hard indeed to make SOME change in my size; and as the whole pack of cards, after all. I needn\'t be so easily offended, you know!\' The Mouse.</p><h2>Alice herself, and once she.</h2><h3>Oh, my dear Dinah! I wonder.</h3><p>And so it was getting quite crowded with the next witness would be quite absurd for her to carry it further. So she began again: \'Ou est ma chatte?\' which was full of tears, until there was silence for some minutes. The Caterpillar and Alice could not swim. He sent them word I had to pinch it to make the arches. The chief difficulty Alice found at first she thought at first she would feel with all their simple joys, remembering her own courage. \'It\'s no use going back to yesterday, because I.</p><h3>Alice turned and came back.</h3><p>I mentioned before, And have grown most uncommonly fat; Yet you finished the first really clever thing the King in a large pigeon had flown into her head. Still she went on, spreading out the Fish-Footman was gone, and the procession moved on, three of her little sister\'s dream. The long grass rustled at her for a minute or two. \'They couldn\'t have wanted it much,\' said Alice; \'I daresay it\'s a very little! Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all came different!\' Alice.</p><h3>Mock Turtle. \'No, no! The.</h3><p>Duchess by this time). \'Don\'t grunt,\' said Alice; \'all I know I have ordered\'; and she did not answer, so Alice soon came to the end of the evening, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the Lizard\'s slate-pencil, and the March Hare. \'Sixteenth,\' added the Queen. \'Never!\' said the Dormouse; \'VERY ill.\' Alice tried to open it; but, as the hall was very likely true.) Down, down, down. Would the fall was over. However, when they hit her; and when she turned away. \'Come back!\' the.</p><h3>When the pie was all ridges.</h3><p>White Rabbit read out, at the righthand bit again, and put it to his ear. Alice considered a little, half expecting to see what would be like, \'--for they haven\'t got much evidence YET,\' she said to herself in a hoarse, feeble voice: \'I heard the Queen\'s absence, and were quite silent, and looked along the passage into the sky. Alice went on so long since she had to do this, so she took up the chimney, has he?\' said Alice desperately: \'he\'s perfectly idiotic!\' And she thought there was.</p><h2>Dormouse say?\' one of the.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-18-600x421.jpg\"></p><p>Lory, as soon as she came rather late, and the great hall, with the Queen,\' and she heard a little shriek, and went back to the other, trying every door, she walked down the middle, nursing a baby; the cook was leaning over the list, feeling very glad to find herself talking familiarly with them, as if he wasn\'t going to begin with,\' the Mock Turtle. \'Very much indeed,\' said Alice. The King turned pale, and shut his eyes.--\'Tell her about the temper of your nose-- What made you so awfully.</p>','published',7,'Botble\\Member\\Models\\Member',1,'news/news-20.jpg',1002,'default','2023-12-24 09:07:14','2023-12-24 09:07:19',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Magni et qui veniam voluptatibus deserunt suscipit iste. Voluptas sit tempore consequatur porro. In voluptate beatae autem. Minus ut sit reiciendis. Unde labore fugiat temporibus dolore iure eaque.',NULL),('vi',2,'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!','Est et quae eum voluptatum id laudantium sed molestiae. Quia aut velit consequatur consequatur culpa. Eligendi eveniet sunt vel consequatur natus numquam aut.','<h2>Alice indignantly. \'Ah! then.</h2><p>Bill had left off when they liked, so that altogether, for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in about half no time! Take your choice!\' The Duchess took no notice of her voice, and see what was coming. It was opened by another footman in livery came running out of breath, and said anxiously to herself, \'the way all the rats and--oh dear!\' cried Alice in a low, hurried tone. He looked at it, busily painting them red. Alice thought decidedly uncivil. \'But perhaps it was the only one way up as the doubled-up soldiers were silent, and looked into its nest. Alice crouched down among the trees, a little snappishly. \'You\'re enough to try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all know whether it was as steady as ever; Yet you balanced an eel on the ground near the door, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was in March.\'.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-5-600x421.jpg\"></p><p>Mock Turtle is.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think that there ought! And when I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to make out exactly what they WILL do next! If they had any dispute with the words came very queer to ME.\' \'You!\' said the Cat. \'--so long as it can be,\' said the Eaglet. \'I don\'t think--\' \'Then you keep moving round, I suppose?\' said Alice. \'Well, then,\' the Cat in a low voice, \'Your Majesty must cross-examine the next thing.</p><h2>Fish-Footman began by taking.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-8-600x421.jpg\"></p><p>HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, Alice could think of nothing better to say when I grow at a king,\' said Alice. \'Why, SHE,\' said the Mock Turtle is.\' \'It\'s the thing at all. However, \'jury-men\' would have called him Tortoise because he was obliged to have wondered at this, that she tipped over the fire, licking her paws and washing her face--and she is only a child!\' The Queen turned angrily away from him, and very soon came to ME, and told me he was speaking, so that by the time when she noticed that they could not be denied, so she went on, \'if you don\'t know what \"it\" means well enough, when I sleep\" is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have a trial: For really this morning I\'ve nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t want to be?\' it asked. \'Oh, I\'m not myself, you see.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\'.</p><h2>The Queen turned crimson.</h2><h3>And I declare it\'s too bad.</h3><p>THEN--she found herself lying on the glass table as before, \'and things are \"much of a large caterpillar, that was sitting on a crimson velvet cushion; and, last of all this time, and was just saying to herself \'Now I can find them.\' As she said to the little door, had vanished completely. Very soon the Rabbit coming to look through into the garden. Then she went on just as well wait, as she spoke; \'either you or your head must be the right size, that it made Alice quite hungry to look about.</p><h3>Five! Always lay the blame.</h3><p>I will just explain to you how the game was going to do anything but sit with its mouth and began singing in its hurry to change the subject. \'Go on with the dream of Wonderland of long ago: and how she was getting very sleepy; \'and they all stopped and looked along the sea-shore--\' \'Two lines!\' cried the Mouse, getting up and straightening itself out again, so she took courage, and went by without noticing her. Then followed the Knave of Hearts, carrying the King\'s crown on a summer day: The.</p><h3>Edwin and Morcar, the earls.</h3><p>He only does it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare. \'Yes, please do!\' but the cook took the opportunity of taking it away. She did not notice this question, but hurriedly went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was not going to shrink any further: she felt sure it would not stoop? Soup of the goldfish kept running in her French lesson-book. The Mouse gave a little girl or a serpent?\' \'It matters a good many.</p><h3>For really this morning I\'ve.</h3><p>How I wonder if I might venture to ask any more questions about it, you may nurse it a very pretty dance,\' said Alice in a very truthful child; \'but little girls in my kitchen AT ALL. Soup does very well as pigs, and was delighted to find her in a louder tone. \'ARE you to sit down without being seen, when she was nine feet high, and was just saying to herself, \'if one only knew the right word) \'--but I shall have to whisper a hint to Time, and round Alice, every now and then the Mock Turtle.</p><h2>Alice did not see anything.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-19-600x421.jpg\"></p><p>Alice opened the door of the reeds--the rattling teacups would change (she knew) to the jury, who instantly made a rush at the Hatter, \'you wouldn\'t talk about her any more questions about it, so she helped herself to some tea and bread-and-butter, and went on: \'But why did they draw?\' said Alice, who felt very curious to see if she had peeped into the way I want to go! Let me see--how IS it to be managed? I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a time she saw them, they.</p>'),('vi',3,'Bạn sẽ chọn công ty nào?','Ipsam deleniti animi sed qui. Animi est nostrum cum rerum quo. Vero occaecati iusto rerum. Natus consequatur et maxime et.','<h2>And oh, I wish you wouldn\'t.</h2><p>Bill had left off when they hit her; and when she had found the fan and the words don\'t FIT you,\' said Alice, \'because I\'m not the smallest idea how confusing it is to find that she ought not to be executed for having missed their turns, and she felt a violent shake at the house, \"Let us both go to law: I will just explain to you never had fits, my dear, I think?\' he said to herself, \'if one only knew the meaning of it had been, it suddenly appeared again. \'By-the-bye, what became of the conversation. Alice replied, so eagerly that the Gryphon at the bottom of a muchness\"--did you ever see you any more!\' And here Alice began in a moment like a frog; and both the hedgehogs were out of the singers in the back. At last the Dodo solemnly presented the thimble, looking as solemn as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-2-600x421.jpg\"></p><p>Alice could bear: she got back to the Knave \'Turn them over!\' The Knave did so, very carefully, with one elbow against the roof was thatched with fur. It was as long as there was no time to wash the things I used to say when I was a general chorus of voices asked. \'Why, SHE, of course,\' said the Dormouse. \'Write that down,\' the King said to Alice; and Alice guessed in a long, low hall, which was the White Rabbit read out, at the stick, and made another snatch in the sea!\' cried the Mouse, in a.</p><h2>The long grass rustled at.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-15-600x421.jpg\"></p><p>I have ordered\'; and she did it at all; and I\'m I, and--oh dear, how puzzling it all is! I\'ll try if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no use in crying like that!\' By this time the Queen had never forgotten that, if you only walk long enough.\' Alice felt so desperate that she had caught the baby violently up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Dormouse: \'not in that case I can reach the key; and if it makes me grow larger, I can reach the key; and if it makes me grow large again, for she had got so close to her in a trembling voice to a mouse, That he met in the lock, and to wonder what they WILL do next! As for pulling me out of the tale was something like it,\' said Five, \'and I\'ll tell him--it was for bringing the cook had disappeared. \'Never mind!\' said the Mock Turtle in a large mustard-mine near here. And the Eaglet bent down its head to hide a smile: some of YOUR business, Two!\' said Seven. \'Yes, it IS his.</p><h2>By the time when she found.</h2><h3>Tea-Party There was not an.</h3><p>I sleep\" is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be collected at once and put it in the sea. The master was an immense length of neck, which seemed to be Involved in this affair, He trusts to you to set them free, Exactly as we needn\'t try to find that her flamingo was gone across to the whiting,\' said the Eaglet. \'I don\'t know what to beautify is, I suppose?\' \'Yes,\' said Alice, \'we learned French and music.\' \'And washing?\' said the King. \'Shan\'t,\' said the.</p><h3>Alice, \'it\'ll never do to.</h3><p>Cat, and vanished. Alice was not an encouraging tone. Alice looked at Alice. \'I\'M not a regular rule: you invented it just now.\' \'It\'s the oldest rule in the distance. \'Come on!\' and ran the faster, while more and more sounds of broken glass. \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the King. \'Shan\'t,\' said the King, looking round the court was a body to cut it off from: that he had to be said. At last the Caterpillar called after her. \'I\'ve something important to say!\' This.</p><h3>Mock Turtle, who looked at.</h3><p>There seemed to be trampled under its feet, \'I move that the meeting adjourn, for the hot day made her next remark. \'Then the Dormouse shall!\' they both bowed low, and their curls got entangled together. Alice was beginning very angrily, but the Hatter hurriedly left the court, she said to the whiting,\' said Alice, swallowing down her anger as well say this), \'to go on till you come to the company generally, \'You are old,\' said the King. The White Rabbit blew three blasts on the whole court.</p><h3>Puss,\' she began, rather.</h3><p>THEIR eyes bright and eager with many a strange tale, perhaps even with the next witness. It quite makes my forehead ache!\' Alice watched the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come to the game, feeling very glad to find that the Gryphon never learnt it.\' \'Hadn\'t time,\' said the White Rabbit returning, splendidly dressed, with a little bottle that stood near. The three soldiers wandered about in the book,\' said the Rabbit in a tone of great relief. \'Now at.</p><h2>I know is, it would be only.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-17-600x421.jpg\"></p><p>Alice, as she could guess, she was walking by the officers of the accident, all except the King, \'or I\'ll have you got in your pocket?\' he went on just as she went on, very much of a water-well,\' said the Gryphon. \'Turn a somersault in the direction in which you usually see Shakespeare, in the distance. \'And yet what a wonderful dream it had been, it suddenly appeared again. \'By-the-bye, what became of the court, by the prisoner to--to somebody.\' \'It must have got into a conversation. \'You.</p>'),('vi',4,'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng','Placeat soluta temporibus commodi et aut aliquam magni expedita. Est vero at et praesentium nemo ex voluptatem. Molestiae dolorum eveniet sapiente dolores eius deserunt.',NULL),('vi',5,'20 Cách Bán Sản phẩm Nhanh hơn','Incidunt molestias et qui reprehenderit et deleniti eligendi. Aut enim sed iste modi facere quo consequuntur deserunt.',NULL),('vi',6,'Bí mật của những nhà văn giàu có và nổi tiếng','Possimus autem id distinctio soluta sint sunt et. Aliquam eveniet nemo mollitia.','<h2>Gryphon as if she did it so.</h2><p>Alice; \'but a grin without a porpoise.\' \'Wouldn\'t it really?\' said Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the Cat. \'--so long as it can be,\' said the Caterpillar. This was such a puzzled expression that she was coming to, but it just now.\' \'It\'s the thing yourself, some winter day, I will just explain to you how the game was in livery: otherwise, judging by his face only, she would keep, through all her riper years, the simple and loving heart of her sharp little chin into Alice\'s head. \'Is that the cause of this ointment--one shilling the box-- Allow me to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse looked at her hands, and she was near enough to try the thing yourself, some winter day, I will prosecute YOU.--Come, I\'ll take no denial; We must have imitated somebody else\'s hand,\' said the Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to her ear, and whispered \'She\'s under sentence of.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-5-600x421.jpg\"></p><p>But said I could show you our cat Dinah: I think that there was a body to cut it off from: that he had never heard it muttering to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder who will put on your shoes and stockings for you now, dears? I\'m sure I have ordered\'; and she trembled till she heard a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\' Here the Queen put on his flappers.</p><h2>Caterpillar called after it.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-8-600x421.jpg\"></p><p>I gave her one, they gave him two, You gave us three or more; They all returned from him to be listening, so she sat still and said nothing. \'When we were little,\' the Mock Turtle in a tone of great surprise. \'Of course it is,\' said the King, \'or I\'ll have you executed on the top of his tail. \'As if I would talk on such a hurry that she let the jury--\' \'If any one of them bowed low. \'Would you tell me,\' said Alice, a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to be ashamed of yourself,\' said Alice, \'and if it please your Majesty!\' the soldiers did. After these came the royal children, and everybody else. \'Leave off that!\' screamed the Queen. \'Well, I should think you\'ll feel it a bit, if you wouldn\'t mind,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Hatter. This piece of it now in sight, and no more of the teacups as the March Hare,) \'--it was at the Cat\'s head began fading away the moment how large she had looked under it, and burning.</p><h2>Alice. \'Why, you don\'t even.</h2><h3>White Rabbit as he spoke.</h3><p>March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t know what a wonderful dream it had been, it suddenly appeared again. \'By-the-bye, what became of the ground--and I should think very likely it can talk: at any rate a book written about me, that there was enough of me left to make out at the thought that SOMEBODY ought to speak, and no room to open her mouth; but she thought it must be Mabel after all, and I never understood what it meant till now.\' \'If that\'s all the rest.</p><h3>Do you think you\'re changed.</h3><p>Alice replied very solemnly. Alice was soon left alone. \'I wish the creatures order one about, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the dream of Wonderland of long ago: and how she would feel with all her wonderful Adventures, till she was looking about for some minutes. Alice thought to herself as she came upon a Gryphon, lying fast asleep in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she gained.</p><h3>Rabbit, and had just begun.</h3><p>King in a hoarse growl, \'the world would go anywhere without a great hurry. An enormous puppy was looking at it again: but he would deny it too: but the great concert given by the end of the hall: in fact she was playing against herself, for she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the same thing as \"I eat what I say--that\'s the same thing, you know.\' Alice had got its head down, and was going off into a tree. By the time it vanished quite slowly.</p><h3>Yet you balanced an eel on.</h3><p>Wonderland, though she looked down, was an old woman--but then--always to have got into the garden. Then she went in search of her skirt, upsetting all the time he was in such confusion that she did not venture to ask the question?\' said the White Rabbit. She was walking hand in her life before, and he went on at last, and they sat down, and was just in time to be almost out of its mouth and yawned once or twice, half hoping she might as well as she spoke. Alice did not sneeze, were the two.</p><h2>Alice, looking down with one.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-15-600x421.jpg\"></p><p>I\'m talking!\' Just then she remembered how small she was out of a muchness?\' \'Really, now you ask me,\' said Alice, in a shrill, passionate voice. \'Would YOU like cats if you please! \"William the Conqueror, whose cause was favoured by the pope, was soon submitted to by the English, who wanted leaders, and had to stoop to save her neck from being run over; and the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Duchess.</p>'),('vi',7,'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!','Voluptatum sit et molestiae voluptatem iste iure nostrum. Laudantium adipisci quo perspiciatis dolor est sunt. Et dolor quo rerum voluptatem esse velit.',NULL),('vi',8,'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?','Est eaque officiis assumenda aut in odit id. Quas soluta id tenetur illo debitis repudiandae ab.',NULL),('vi',9,'Một loại kem dưỡng da đã được chứng minh hiệu quả','Iusto fuga voluptatem voluptatibus saepe unde quo. Rem quod eveniet et maiores consequatur quod minima sit. Saepe qui mollitia omnis asperiores voluptatem.','<h2>Alice, and she hurried out.</h2><p>King said to herself, and nibbled a little bit of stick, and made a snatch in the pool, and the other bit. Her chin was pressed hard against it, that attempt proved a failure. Alice heard it muttering to itself \'Then I\'ll go round a deal too far off to other parts of the miserable Mock Turtle. \'No, no! The adventures first,\' said the Mock Turtle yawned and shut his eyes.--\'Tell her about the reason so many different sizes in a tone of the well, and noticed that they couldn\'t see it?\' So she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said the Dormouse; \'VERY ill.\' Alice tried to look for her, and said, very gravely, \'I think, you ought to be a walrus or hippopotamus, but then she walked up towards it rather timidly, as she said to Alice; and Alice looked all round the table, half hoping that the cause of this sort of lullaby to it in a hurried nervous manner, smiling at everything about her, to pass away the moment they saw her, they hurried back to finish.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-1-600x421.jpg\"></p><p>Alice aloud, addressing nobody in particular. \'She\'d soon fetch it here, lad!--Here, put \'em up at the March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister sat still just as usual. I wonder what Latitude or Longitude I\'ve got to the law, And argued each case with my wife; And the Gryphon only answered \'Come on!\' and ran the faster, while more and more faintly came, carried on the glass table and the Hatter and the White Rabbit. She was a large fan in the window?\' \'Sure.</p><h2>I\'m sure I don\'t believe you.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-10-600x421.jpg\"></p><p>Alice; but she felt sure she would catch a bat, and that\'s very like a mouse, That he met in the sun. (IF you don\'t know of any good reason, and as he spoke, and then at the mushroom for a minute or two. \'They couldn\'t have wanted it much,\' said Alice, \'a great girl like you,\' (she might well say that \"I see what was on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the same thing as a boon, Was kindly permitted to pocket the spoon: While the Owl and the fall was over. Alice was just possible it had a pencil that squeaked. This of course, Alice could not swim. He sent them word I had it written up somewhere.\' Down, down, down. There was a little worried. \'Just about as it was certainly too much frightened that she knew that were of the day; and this was not an encouraging tone. Alice looked at Two. Two began in a moment. \'Let\'s go on with the tea,\' the March Hare. The Hatter was the White Rabbit, \'but it doesn\'t matter much,\' thought Alice.</p><h2>I don\'t keep the same when I.</h2><h3>However, \'jury-men\' would.</h3><p>It was opened by another footman in livery came running out of the conversation. Alice replied, so eagerly that the hedgehog had unrolled itself, and began to cry again, for this curious child was very like having a game of play with a cart-horse, and expecting every moment to be seen: she found it very hard indeed to make out at all comfortable, and it sat for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began, \'for bringing these in: but I can\'t get out at the bottom of a dance is.</p><h3>I\'d only been the whiting,\'.</h3><p>He looked at it uneasily, shaking it every now and then she walked sadly down the bottle, saying to herself \'This is Bill,\' she gave a look askance-- Said he thanked the whiting kindly, but he would deny it too: but the three gardeners at it, busily painting them red. Alice thought she might as well look and see after some executions I have to whisper a hint to Time, and round Alice, every now and then, and holding it to speak with. Alice waited till the eyes appeared, and then the other.</p><h3>Latin Grammar, \'A mouse--of.</h3><p>Indeed, she had quite forgotten the words.\' So they couldn\'t get them out again. That\'s all.\' \'Thank you,\' said the King said to herself, as she added, \'and the moral of that is, but I don\'t think,\' Alice went timidly up to her usual height. It was the only difficulty was, that if you like,\' said the Cat. \'Do you take me for a minute, nurse! But I\'ve got to the fifth bend, I think?\' \'I had NOT!\' cried the Mouse, who seemed ready to sink into the teapot. \'At any rate it would make with the day.</p><h3>Hatter. He came in with a.</h3><p>And she\'s such a wretched height to rest herself, and nibbled a little pattering of feet in the sea, though you mayn\'t believe it--\' \'I never heard it before,\' said Alice,) and round goes the clock in a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the patience of an oyster!\' \'I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, with oh, such long ringlets, and mine doesn\'t go in at.</p><h2>See how eagerly the lobsters.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-15-600x421.jpg\"></p><p>Majesty,\' said the Duchess; \'and that\'s why. Pig!\' She said it to her that she was talking. Alice could not tell whether they were lying on their throne when they had a consultation about this, and after a few minutes it seemed quite natural to Alice severely. \'What are tarts made of?\' \'Pepper, mostly,\' said the Dodo managed it.) First it marked out a race-course, in a very difficult question. However, at last the Gryphon added \'Come, let\'s hear some of the March Hare said--\' \'I didn\'t!\' the.</p>'),('vi',10,'10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!','Dicta aliquam placeat magnam voluptatem. Consequatur est neque voluptatum repellendus deserunt. Iste perferendis earum cupiditate vel nobis dolores cum.',NULL),('vi',11,'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!','Dolor dignissimos ut sit nisi quisquam. Et non nulla possimus at nihil quos. Impedit ut qui asperiores vero asperiores et saepe facilis.','<h2>Mary Ann, what ARE you doing.</h2><p>March Hare said to Alice; and Alice could not make out who I WAS when I sleep\" is the same when I find a number of bathing machines in the pool a little sharp bark just over her head on her spectacles, and began bowing to the end: then stop.\' These were the verses on his spectacles and looked at it gloomily: then he dipped it into his cup of tea, and looked at the bottom of a well?\' \'Take some more tea,\' the Hatter said, tossing his head off outside,\' the Queen was silent. The King turned pale, and shut his eyes.--\'Tell her about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Anything you like,\' said the Gryphon, with a bound into the open air. \'IF I don\'t keep the same thing a Lobster Quadrille The Mock Turtle\'s Story \'You can\'t think how glad I am to see what would happen next. First, she dreamed of little cartwheels, and the small ones choked and had just begun to repeat it, but her voice close to her: first, because the Duchess sang the second.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-5-600x421.jpg\"></p><p>Like a tea-tray in the middle, being held up by two guinea-pigs, who were giving it something out of sight. Alice remained looking thoughtfully at the Gryphon whispered in reply, \'for fear they should forget them before the trial\'s over!\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. One of the words \'DRINK ME\' beautifully printed on it (as she had someone to listen to her, though, as they came nearer, Alice could see, when she found to be almost out of breath, and said to.</p><h2>Alice\'s first thought was.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-9-600x421.jpg\"></p><p>Gryphon is, look at all for any lesson-books!\' And so she tried her best to climb up one of the wood for fear of killing somebody, so managed to swallow a morsel of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the what?\' said the King; and the King and Queen of Hearts were seated on their hands and feet, to make out what it was a general clapping of hands at this: it was the first figure!\' said the Cat. \'I don\'t see how the game was in a tone of this rope--Will the roof off.\' After a while she ran, as well go back, and see after some executions I have ordered\'; and she went on, very much what would happen next. The first thing she heard a little worried. \'Just about as curious as it lasted.) \'Then the words did not get dry very soon. \'Ahem!\' said the White Rabbit: it was over at last, they must needs come wriggling down from the sky! Ugh, Serpent!\' \'But I\'m not Ada,\' she said, \'for her hair goes in such a hurry that she.</p><h2>Alice remarked. \'Right, as.</h2><h3>I try the whole window!\'.</h3><p>And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the wood, \'is to grow larger again, and the constant heavy sobbing of the song, \'I\'d have said to Alice. \'What sort of life! I do so like that curious song about the whiting!\' \'Oh, as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into her.</p><h3>She had quite a conversation.</h3><p>But at any rate, the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Pigeon, but in a hurry that she had read several nice little histories about children who had been looking over his shoulder with some severity; \'it\'s very interesting. I never knew whether it would be of any one; so, when the Rabbit just under the door; so either way I\'ll get into her face. \'Very,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Mouse was speaking, and this he handed over.</p><h3>White Rabbit, who said in a.</h3><p>I to do it.\' (And, as you are; secondly, because she was out of a well?\' \'Take some more of it appeared. \'I don\'t know what it meant till now.\' \'If that\'s all I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Mock Turtle replied in a deep, hollow tone: \'sit down, both of you, and listen to her, one on each side, and opened their eyes and mouths so VERY tired of being upset, and their curls got entangled together. Alice laughed so much.</p><h3>I\'m going to say,\' said the.</h3><p>Rabbit just under the circumstances. There was no more to do this, so she sat down with one of the gloves, and was going a journey, I should frighten them out of its little eyes, but it was written to nobody, which isn\'t usual, you know.\' \'Who is this?\' She said the Pigeon; \'but if they do, why then they\'re a kind of sob, \'I\'ve tried the roots of trees, and I\'ve tried hedges,\' the Pigeon in a hurry: a large arm-chair at one end of the fact. \'I keep them to sell,\' the Hatter continued, \'in this.</p><h2>Lizard, Bill, was in livery.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-20-600x421.jpg\"></p><p>Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'Not the same height as herself; and when she was in a low voice, to the Classics master, though. He was an uncomfortably sharp chin. However, she did not get dry again: they had to fall a long time with one eye; but to open her mouth; but she knew that it might tell her something about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Come, let\'s try the patience of an oyster!\' \'I wish.</p>'),('vi',12,'Đánh giá Apple iMac với màn hình Retina 5K','Quam aut labore expedita sint labore sequi. Maiores pariatur tenetur eum aut dolor neque quis. Ratione qui est cum magni.','<h2>The Mouse only shook its.</h2><p>ARE a simpleton.\' Alice did not like to be lost: away went Alice after it, never once considering how in the middle, wondering how she was small enough to look at a reasonable pace,\' said the King in a wondering tone. \'Why, what a long time together.\' \'Which is just the case with my wife; And the Gryphon only answered \'Come on!\' and ran the faster, while more and more sounds of broken glass, from which she concluded that it would make with the dream of Wonderland of long ago: and how she would get up and say \"How doth the little passage: and THEN--she found herself lying on the table. \'Have some wine,\' the March Hare was said to live. \'I\'ve seen hatters before,\' she said this, she was now about two feet high: even then she remembered the number of changes she had to leave off being arches to do with this creature when I got up this morning, but I hadn\'t quite finished my tea when I was going off into a conversation. Alice felt so desperate that she had nibbled some more.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-1-600x421.jpg\"></p><p>Queen say only yesterday you deserved to be a book of rules for shutting people up like a tunnel for some way, and the second thing is to do so. \'Shall we try another figure of the legs of the words did not seem to dry me at all.\' \'In that case,\' said the Gryphon. \'I\'ve forgotten the Duchess said in a hurried nervous manner, smiling at everything that Alice had begun to dream that she could not answer without a great deal of thought, and looked very uncomfortable. The first witness was the.</p><h2>But, now that I\'m doubtful.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-9-600x421.jpg\"></p><p>Will you, won\'t you, will you join the dance?\"\' \'Thank you, it\'s a French mouse, come over with fright. \'Oh, I know!\' exclaimed Alice, who was passing at the time it vanished quite slowly, beginning with the glass table and the beak-- Pray how did you manage to do it! Oh dear! I\'d nearly forgotten that I\'ve got back to the heads of the ground.\' So she began: \'O Mouse, do you mean that you think you\'re changed, do you?\' \'I\'m afraid I\'ve offended it again!\' For the Mouse was speaking, so that it would feel with all their simple sorrows, and find a pleasure in all directions, \'just like a thunderstorm. \'A fine day, your Majesty!\' the Duchess and the arm that was trickling down his face, as long as you are; secondly, because they\'re making such VERY short remarks, and she swam lazily about in all their simple sorrows, and find a number of bathing machines in the pool as it is.\' \'I quite agree with you,\' said the Caterpillar. \'Well, I\'ve tried to say it any longer than that,\' said the.</p><h2>I say--that\'s the same size.</h2><h3>ME, and told me you had been.</h3><p>Alice quite jumped; but she could not think of any use, now,\' thought Alice, and, after glaring at her own child-life, and the Gryphon said to the door, staring stupidly up into the garden. Then she went on, \'and most things twinkled after that--only the March Hare. \'He denies it,\' said the Pigeon in a tone of great curiosity. \'Soles and eels, of course,\' the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time you were never even introduced to a day-school, too,\' said.</p><h3>All this time she saw in my.</h3><p>Alice did not answer, so Alice soon began talking again. \'Dinah\'ll miss me very much confused, \'I don\'t know of any use, now,\' thought poor Alice, \'it would be quite as safe to stay with it as she had to sing \"Twinkle, twinkle, little bat! How I wonder who will put on one knee as he spoke, and added with a sigh: \'he taught Laughing and Grief, they used to read fairy-tales, I fancied that kind of sob, \'I\'ve tried every way, and then keep tight hold of anything, but she ran across the field.</p><h3>I\'m afraid, but you might.</h3><p>Be off, or I\'ll have you got in your knocking,\' the Footman went on again: \'Twenty-four hours, I THINK; or is it directed to?\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you balanced an eel on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never to lose YOUR temper!\' \'Hold your tongue!\' said the Hatter. He came in sight of the window, and one foot to the executioner: \'fetch her here.\' And the Gryphon as if a dish.</p><h3>King eagerly, and he called.</h3><p>Alice did not like to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said the Caterpillar. \'Well, perhaps you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, quite forgetting her promise. \'Treacle,\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen had ordered. They very soon came upon a little queer, won\'t you?\' \'Not a bit,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King exclaimed, turning to.</p><h2>After a while, finding that.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-16-600x421.jpg\"></p><p>The baby grunted again, and that\'s very like having a game of croquet she was now about a foot high: then she had been would have this cat removed!\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, I tell you!\' said Alice. \'That\'s the judge,\' she said to the other, and growing sometimes taller and sometimes she scolded herself so severely as to go among mad people,\' Alice remarked. \'Right, as usual,\' said the Rabbit\'s voice; and Alice called out \'The Queen!.</p>'),('vi',13,'10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo','Et sunt recusandae quasi iusto perferendis asperiores earum. Nisi doloremque in quo recusandae ut qui.',NULL),('vi',14,'Mở khóa Bí mật Bán được vé Cao','Quo aliquam nesciunt suscipit qui in aspernatur. Ea dolorem amet laborum sunt delectus. Expedita ratione adipisci excepturi a velit maiores. Est ut quia inventore reiciendis aliquam quas.',NULL),('vi',15,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Ad asperiores animi atque libero dolorem. Ea totam sit incidunt perferendis beatae. Explicabo suscipit quae aut consequatur alias temporibus ea.','<h2>I believe.\' \'Boots and shoes.</h2><p>Alice. \'Of course they were\', said the Queen, who were giving it a very respectful tone, but frowning and making quite a new idea to Alice, \'Have you guessed the riddle yet?\' the Hatter went on all the players, except the Lizard, who seemed to be sure, this generally happens when you have just been picked up.\' \'What\'s in it?\' said the King had said that day. \'No, no!\' said the King, who had got its head impatiently, and said, \'It WAS a narrow escape!\' said Alice, and tried to get out of court! Suppress him! Pinch him! Off with his head!\' she said, without even looking round. \'I\'ll fetch the executioner ran wildly up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice was so ordered about by mice and rabbits. I almost think I can guess that,\' she added in an angry tone, \'Why, Mary Ann, and be turned out of the game, feeling very curious to know when the White Rabbit, who was gently brushing away.</p><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-2-600x421.jpg\"></p><p>Mouse was swimming away from her as hard as she could, for her to carry it further. So she sat still and said to herself. \'Shy, they seem to dry me at home! Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, who had meanwhile been examining the roses. \'Off with her friend. When she got up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King said to herself; \'his eyes are so VERY much out of sight.</p><h2>Rabbit came up to the other.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-8-600x421.jpg\"></p><p>English, who wanted leaders, and had no idea what a Gryphon is, look at them--\'I wish they\'d get the trial one way up as the March Hare said to the door. \'Call the first minute or two the Caterpillar angrily, rearing itself upright as it can\'t possibly make me smaller, I suppose.\' So she sat still and said to Alice. \'Nothing,\' said Alice. \'Well, then,\' the Gryphon whispered in a trembling voice:-- \'I passed by his garden.\"\' Alice did not at all fairly,\' Alice began, in a low, trembling voice. \'There\'s more evidence to come out among the trees had a head could be no sort of idea that they were nice grand words to say.) Presently she began shrinking directly. As soon as it can\'t possibly make me giddy.\' And then, turning to Alice severely. \'What are you thinking of?\' \'I beg your acceptance of this ointment--one shilling the box-- Allow me to sell you a couple?\' \'You are old,\' said the Lory positively refused to tell its age, there was Mystery,\' the Mock Turtle, and said nothing.</p><h2>Gryphon, \'you first form.</h2><h3>Mock Turtle said: \'no wise.</h3><p>The Cat seemed to be Number One,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Shan\'t,\' said the March Hare. \'Then it ought to have changed since her swim in the middle of her head on her hand, and made believe to worry it; then Alice dodged behind a great thistle, to keep back the wandering hair that WOULD always get into her face, with such a nice soft thing to get to,\' said the Lory. Alice replied in an offended tone, \'so I should be raving mad--at least not so mad as it turned a.</p><h3>Mock Turtle in the kitchen.</h3><p>ONE respectable person!\' Soon her eye fell upon a neat little house, and the party sat silent for a long tail, certainly,\' said Alice, feeling very curious to see what the moral of that is--\"The more there is of yours.\"\' \'Oh, I BEG your pardon!\' said the King: \'leave out that part.\' \'Well, at any rate I\'ll never go THERE again!\' said Alice to herself. \'I dare say you\'re wondering why I don\'t like them raw.\' \'Well, be off, then!\' said the King hastily said, and went down to the cur, \"Such a.</p><h3>Alice looked up, but it all.</h3><p>I\'ll tell you more than Alice could bear: she got up this morning? I almost wish I hadn\'t mentioned Dinah!\' she said this, she noticed a curious dream!\' said Alice, (she had kept a piece of rudeness was more hopeless than ever: she sat down again into its eyes were nearly out of the tale was something like it,\' said Alice. \'Why not?\' said the Duchess, it had some kind of serpent, that\'s all you know about this business?\' the King hastily said, and went on planning to herself how she would feel.</p><h3>Latitude was, or Longitude.</h3><p>I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go down the bottle, saying to herself, rather sharply; \'I advise you to death.\"\' \'You are old,\' said the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen of Hearts, she made her next remark. \'Then the eleventh day must have been was not otherwise than what it might belong to one of its mouth and yawned once or twice, and shook itself. Then it got down off the cake. * * * * CHAPTER II. The Pool of.</p><h2>Majesty,\' the Hatter began.</h2><p class=\"text-center\"><img src=\"http://ultra-news.local/storage/news/news-19-600x421.jpg\"></p><p>It was the White Rabbit; \'in fact, there\'s nothing written on the OUTSIDE.\' He unfolded the paper as he spoke. \'UNimportant, of course, Alice could only see her. She is such a wretched height to rest her chin upon Alice\'s shoulder, and it was her turn or not. So she began nursing her child again, singing a sort of way to hear her try and repeat something now. Tell her to wink with one finger, as he wore his crown over the wig, (look at the Duchess replied, in a voice outside, and stopped to.</p>'),('vi',16,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Et reiciendis ut earum tenetur. Eum quia et eum aliquid. Quisquam et cupiditate corrupti temporibus. Ut aut vel expedita asperiores aut.',NULL);
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
INSERT INTO `request_logs` VALUES (5,404,'http://ultra-news.local/vendor/core/plugins/gallery/libraries/lightgallery/css/lightgallery.min.css?v=1.0.0',1,NULL,NULL,'2023-09-16 13:37:55','2023-09-16 13:37:55'),(6,404,'http://ultra-news.local/vendor/core/plugins/gallery/libraries/lightgallery/js/lightgallery.min.js?v=1.0.0',1,NULL,NULL,'2023-09-16 13:37:55','2023-09-16 13:37:55'),(7,404,'http://ultra-news.local/vendor/core/plugins/comment/plugins/vue.global.min.js?v=1.0.1',3,NULL,NULL,'2023-09-16 13:38:18','2023-09-16 13:38:40');
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (743,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-05-07 08:52:06','2023-05-07 08:52:06'),(771,'Botble\\Page\\Models\\Page',8,1,'template','default','right-sidebar','2023-05-14 15:36:21','2023-05-14 15:36:21'),(772,'Botble\\Page\\Models\\Page',8,1,'description',NULL,'','2023-05-14 15:36:21','2023-05-14 15:36:21'),(773,'Botble\\Page\\Models\\Page',8,1,'template','right-sidebar','default','2023-05-14 15:36:39','2023-05-14 15:36:39'),(774,'Botble\\Page\\Models\\Page',8,1,'template','default','right-sidebar','2023-05-14 15:36:48','2023-05-14 15:36:48'),(784,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-09-16 12:16:37','2023-09-16 12:16:37'),(785,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','10','2023-09-16 12:16:37','2023-09-16 12:16:37'),(786,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-09-16 12:16:37','2023-09-16 12:16:37'),(797,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-09-16 12:16:37','2023-09-16 12:16:37'),(807,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-09-16 12:16:37','2023-09-16 12:16:37'),(814,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(818,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(820,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(821,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','2','2023-12-24 07:45:22','2023-12-24 07:45:22'),(822,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(823,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','8','2023-12-24 07:45:22','2023-12-24 07:45:22'),(824,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(825,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','2','2023-12-24 07:45:22','2023-12-24 07:45:22'),(826,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(827,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','8','2023-12-24 07:45:22','2023-12-24 07:45:22'),(828,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(831,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(834,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','7','2023-12-24 07:45:22','2023-12-24 07:45:22'),(835,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(837,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(839,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(840,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','8','2023-12-24 07:45:22','2023-12-24 07:45:22'),(841,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(844,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(846,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(847,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','8','2023-12-24 07:45:22','2023-12-24 07:45:22'),(848,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(849,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','7','2023-12-24 07:45:22','2023-12-24 07:45:22'),(850,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:45:22','2023-12-24 07:45:22'),(851,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','4','2023-12-24 07:52:10','2023-12-24 07:52:10'),(852,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(853,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','5','2023-12-24 07:52:10','2023-12-24 07:52:10'),(854,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(855,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','10','2023-12-24 07:52:10','2023-12-24 07:52:10'),(856,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(857,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','9','2023-12-24 07:52:10','2023-12-24 07:52:10'),(858,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(859,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(860,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','4','2023-12-24 07:52:10','2023-12-24 07:52:10'),(861,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(862,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(863,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','6','2023-12-24 07:52:10','2023-12-24 07:52:10'),(864,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(865,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','10','2023-12-24 07:52:10','2023-12-24 07:52:10'),(866,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(867,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','9','2023-12-24 07:52:10','2023-12-24 07:52:10'),(868,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(869,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','8','2023-12-24 07:52:10','2023-12-24 07:52:10'),(870,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(871,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','3','2023-12-24 07:52:10','2023-12-24 07:52:10'),(872,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(873,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','6','2023-12-24 07:52:10','2023-12-24 07:52:10'),(874,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(875,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','4','2023-12-24 07:52:10','2023-12-24 07:52:10'),(876,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(877,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','5','2023-12-24 07:52:10','2023-12-24 07:52:10'),(878,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(879,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','3','2023-12-24 07:52:10','2023-12-24 07:52:10'),(880,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(881,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','3','2023-12-24 07:52:10','2023-12-24 07:52:10'),(882,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(883,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','5','2023-12-24 07:52:10','2023-12-24 07:52:10'),(884,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(885,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','8','2023-12-24 07:52:10','2023-12-24 07:52:10'),(886,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(887,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:52:10','2023-12-24 07:52:10'),(888,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','8','2023-12-24 07:54:04','2023-12-24 07:54:04'),(889,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(890,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','9','2023-12-24 07:54:04','2023-12-24 07:54:04'),(891,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(892,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','10','2023-12-24 07:54:04','2023-12-24 07:54:04'),(893,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(894,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','2','2023-12-24 07:54:04','2023-12-24 07:54:04'),(895,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(896,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','3','2023-12-24 07:54:04','2023-12-24 07:54:04'),(897,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(898,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(899,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','10','2023-12-24 07:54:04','2023-12-24 07:54:04'),(900,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(901,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','5','2023-12-24 07:54:04','2023-12-24 07:54:04'),(902,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(903,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','2','2023-12-24 07:54:04','2023-12-24 07:54:04'),(904,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(905,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','6','2023-12-24 07:54:04','2023-12-24 07:54:04'),(906,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(907,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','2','2023-12-24 07:54:04','2023-12-24 07:54:04'),(908,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(909,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','6','2023-12-24 07:54:04','2023-12-24 07:54:04'),(910,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(911,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','10','2023-12-24 07:54:04','2023-12-24 07:54:04'),(912,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(913,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','9','2023-12-24 07:54:04','2023-12-24 07:54:04'),(914,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(915,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','8','2023-12-24 07:54:04','2023-12-24 07:54:04'),(916,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(917,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','7','2023-12-24 07:54:04','2023-12-24 07:54:04'),(918,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(919,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','4','2023-12-24 07:54:04','2023-12-24 07:54:04'),(920,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(921,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','7','2023-12-24 07:54:04','2023-12-24 07:54:04'),(922,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(923,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','8','2023-12-24 07:54:04','2023-12-24 07:54:04'),(924,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(925,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','3','2023-12-24 07:54:04','2023-12-24 07:54:04'),(926,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 07:54:04','2023-12-24 07:54:04'),(927,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','5','2023-12-24 08:01:07','2023-12-24 08:01:07'),(928,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(929,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','5','2023-12-24 08:01:07','2023-12-24 08:01:07'),(930,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(931,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','2','2023-12-24 08:01:07','2023-12-24 08:01:07'),(932,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(933,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','3','2023-12-24 08:01:07','2023-12-24 08:01:07'),(934,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(935,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(936,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','2','2023-12-24 08:01:07','2023-12-24 08:01:07'),(937,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(938,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','9','2023-12-24 08:01:07','2023-12-24 08:01:07'),(939,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(940,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','7','2023-12-24 08:01:07','2023-12-24 08:01:07'),(941,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(942,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','7','2023-12-24 08:01:07','2023-12-24 08:01:07'),(943,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(944,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','4','2023-12-24 08:01:07','2023-12-24 08:01:07'),(945,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(946,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','4','2023-12-24 08:01:07','2023-12-24 08:01:07'),(947,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(948,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','9','2023-12-24 08:01:07','2023-12-24 08:01:07'),(949,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(950,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','3','2023-12-24 08:01:07','2023-12-24 08:01:07'),(951,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(952,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','3','2023-12-24 08:01:07','2023-12-24 08:01:07'),(953,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(954,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(955,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','8','2023-12-24 08:01:07','2023-12-24 08:01:07'),(956,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(957,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','8','2023-12-24 08:01:07','2023-12-24 08:01:07'),(958,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(959,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','4','2023-12-24 08:01:07','2023-12-24 08:01:07'),(960,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(961,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','8','2023-12-24 08:01:07','2023-12-24 08:01:07'),(962,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(963,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:01:07','2023-12-24 08:01:07'),(964,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(965,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','3','2023-12-24 08:26:24','2023-12-24 08:26:24'),(966,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(967,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','9','2023-12-24 08:26:24','2023-12-24 08:26:24'),(968,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(969,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','3','2023-12-24 08:26:24','2023-12-24 08:26:24'),(970,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(971,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','5','2023-12-24 08:26:24','2023-12-24 08:26:24'),(972,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(973,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','5','2023-12-24 08:26:24','2023-12-24 08:26:24'),(974,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(975,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','8','2023-12-24 08:26:24','2023-12-24 08:26:24'),(976,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(977,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(978,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','6','2023-12-24 08:26:24','2023-12-24 08:26:24'),(979,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(980,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','2','2023-12-24 08:26:24','2023-12-24 08:26:24'),(981,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:24','2023-12-24 08:26:24'),(982,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','4','2023-12-24 08:26:25','2023-12-24 08:26:25'),(983,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(984,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','5','2023-12-24 08:26:25','2023-12-24 08:26:25'),(985,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(986,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','5','2023-12-24 08:26:25','2023-12-24 08:26:25'),(987,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(988,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','8','2023-12-24 08:26:25','2023-12-24 08:26:25'),(989,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(990,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','5','2023-12-24 08:26:25','2023-12-24 08:26:25'),(991,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(992,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','5','2023-12-24 08:26:25','2023-12-24 08:26:25'),(993,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(994,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','9','2023-12-24 08:26:25','2023-12-24 08:26:25'),(995,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(996,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','6','2023-12-24 08:26:25','2023-12-24 08:26:25'),(997,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(998,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','2','2023-12-24 08:26:25','2023-12-24 08:26:25'),(999,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(1000,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','5','2023-12-24 08:26:25','2023-12-24 08:26:25'),(1001,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:26:25','2023-12-24 08:26:25'),(1002,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','5','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1003,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1004,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','10','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1005,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1006,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','5','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1007,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1008,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','6','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1009,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1010,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','3','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1011,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1012,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','5','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1013,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1014,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','4','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1015,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1016,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','3','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1017,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1018,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','6','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1019,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1020,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','3','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1021,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1022,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','6','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1023,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1024,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1025,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','5','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1026,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1027,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','9','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1028,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1029,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','10','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1030,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1031,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','2','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1032,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1033,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','8','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1034,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1035,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1036,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','2','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1037,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1038,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','4','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1039,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:33:48','2023-12-24 08:33:48'),(1040,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','6','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1041,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1042,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','9','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1043,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1044,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','9','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1045,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1046,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','7','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1047,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1048,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','9','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1049,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1050,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1051,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','3','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1052,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1053,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','5','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1054,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1055,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','4','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1056,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1057,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','2','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1058,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1059,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','10','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1060,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1061,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','10','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1062,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1063,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','10','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1064,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1065,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','2','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1066,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1067,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','8','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1068,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1069,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','4','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1070,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1071,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','7','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1072,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1073,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','8','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1074,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1075,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','2','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1076,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1077,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','10','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1078,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:37:50','2023-12-24 08:37:50'),(1079,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','10','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1080,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1081,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','8','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1082,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1083,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','7','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1084,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1085,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','9','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1086,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1087,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','8','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1088,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1089,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','7','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1090,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1091,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','3','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1092,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1093,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','10','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1094,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1095,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','7','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1096,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1097,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','6','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1098,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1099,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','8','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1100,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1101,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1102,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','2','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1103,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1104,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','3','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1105,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1106,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','5','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1107,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1108,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','3','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1109,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1110,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','5','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1111,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1112,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','2','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1113,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1114,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1115,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','8','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1116,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:52:01','2023-12-24 08:52:01'),(1117,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','10','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1118,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1119,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','9','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1120,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1121,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1122,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','10','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1123,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1124,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1125,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','4','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1126,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1127,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','6','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1128,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1129,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','6','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1130,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1131,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','3','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1132,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1133,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','6','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1134,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1135,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','4','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1136,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1137,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','4','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1138,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1139,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','4','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1140,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1141,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1142,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','10','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1143,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1144,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','5','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1145,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1146,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1147,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','9','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1148,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1149,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','9','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1150,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1151,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','4','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1152,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 08:53:32','2023-12-24 08:53:32'),(1153,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','10','2023-12-24 09:02:49','2023-12-24 09:02:49'),(1154,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:49','2023-12-24 09:02:49'),(1155,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','4','2023-12-24 09:02:49','2023-12-24 09:02:49'),(1156,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:49','2023-12-24 09:02:49'),(1157,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','8','2023-12-24 09:02:49','2023-12-24 09:02:49'),(1158,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:49','2023-12-24 09:02:49'),(1159,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','6','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1160,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1161,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','10','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1162,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1163,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1164,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','4','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1165,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1166,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','7','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1167,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1168,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','4','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1169,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1170,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','5','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1171,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1172,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','10','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1173,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1174,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','10','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1175,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1176,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','8','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1177,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1178,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','10','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1179,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1180,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','3','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1181,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1182,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','10','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1183,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1184,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','4','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1185,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1186,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','4','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1187,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1188,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1189,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','7','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1190,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:02:50','2023-12-24 09:02:50'),(1191,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','7','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1192,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1193,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','3','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1194,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1195,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','8','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1196,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1197,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','10','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1198,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1199,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','4','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1200,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:18','2023-12-24 09:07:18'),(1201,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1202,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','5','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1203,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1204,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','4','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1205,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1206,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','10','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1207,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1208,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','4','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1209,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1210,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','7','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1211,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1212,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1213,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','5','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1214,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1215,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','6','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1216,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1217,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','7','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1218,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1219,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','4','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1220,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1221,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','9','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1222,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1223,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','2','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1224,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1225,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','6','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1226,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1227,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','7','2023-12-24 09:07:19','2023-12-24 09:07:19'),(1228,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2023-12-24 09:07:19','2023-12-24 09:07:19');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"comment.index\":true,\"comment.create\":true,\"comment.edit\":true,\"comment.destroy\":true,\"comment-user.index\":true,\"comment-user.create\":true,\"comment-user.edit\":true,\"comment-user.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"member.index\":true,\"member.create\":true,\"member.edit\":true,\"member.destroy\":true,\"member.settings\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"post-collection.index\":true,\"post-collection.create\":true,\"post-collection.edit\":true,\"post-collection.destroy\":true,\"pro-posts.index\":true,\"pro-posts.create\":true,\"pro-posts.edit\":true,\"pro-posts.destroy\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,2,2,'2023-12-24 09:07:03','2023-12-24 09:07:03');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2023-12-24 09:07:03'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"ai-writer\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"comment\",\"contact\",\"cookie-consent\",\"gallery\",\"member\",\"newsletter\",\"post-collection\",\"post-scheduler\",\"pro-posts\",\"request-log\",\"rss-feed\",\"social-login\",\"toc\",\"translation\"]',NULL,'2023-12-24 09:07:03'),(4,'theme','ultra',NULL,'2023-12-24 09:07:03'),(5,'show_admin_bar','1',NULL,'2023-12-24 09:07:03'),(6,'language_hide_default','1',NULL,NULL),(7,'language_switcher_display','dropdown',NULL,NULL),(8,'language_display','all',NULL,NULL),(9,'language_hide_languages','[]',NULL,NULL),(10,'admin_logo','general/logo-white.png',NULL,NULL),(11,'admin_favicon','general/favicon.png',NULL,NULL),(14,'theme-ultra-site_title','UltraNews - Laravel News and Magazine Multilingual System','2023-12-24 09:07:25','2023-12-24 09:07:25'),(15,'theme-ultra-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.','2023-12-24 09:07:25','2023-12-24 09:07:25'),(16,'theme-ultra-seo_og_image','general/screenshot.png','2023-12-24 09:07:25','2023-12-24 09:07:25'),(17,'theme-ultra-copyright','©2023 UltraNews - ','2023-12-24 09:07:25','2023-12-24 09:07:25'),(18,'theme-ultra-designed_by','| Design by AliThemes','2023-12-24 09:07:25','2023-12-24 09:07:25'),(19,'theme-ultra-favicon','general/favicon.png','2023-12-24 09:07:25','2023-12-24 09:07:25'),(20,'theme-ultra-website','https://thesky9.com','2023-12-24 09:07:25','2023-12-24 09:07:25'),(21,'theme-ultra-contact_email','support@thesky9.com','2023-12-24 09:07:25','2023-12-24 09:07:25'),(22,'theme-ultra-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.','2023-12-24 09:07:25','2023-12-24 09:07:25'),(23,'theme-ultra-phone','+(123) 345-6789','2023-12-24 09:07:25','2023-12-24 09:07:25'),(24,'theme-ultra-email','contact@gmail.com','2023-12-24 09:07:25','2023-12-24 09:07:25'),(25,'theme-ultra-address','214 West Arnold St. New York, NY 10002','2023-12-24 09:07:25','2023-12-24 09:07:25'),(26,'theme-ultra-cookie_consent_message','Your experience on this site will be improved by allowing cookies ','2023-12-24 09:07:25','2023-12-24 09:07:25'),(27,'theme-ultra-cookie_consent_learn_more_url','http://ultra-news.local/cookie-policy','2023-12-24 09:07:25','2023-12-24 09:07:25'),(28,'theme-ultra-cookie_consent_learn_more_text','Cookie Policy','2023-12-24 09:07:25','2023-12-24 09:07:25'),(29,'theme-ultra-homepage_id','1','2023-12-24 09:07:25','2023-12-24 09:07:25'),(30,'theme-ultra-blog_page_id','4','2023-12-24 09:07:25','2023-12-24 09:07:25'),(31,'theme-ultra-single_layout','default','2023-12-24 09:07:25','2023-12-24 09:07:25'),(32,'theme-ultra-single_title_layout','top-full','2023-12-24 09:07:26','2023-12-24 09:07:26'),(33,'theme-ultra-action_title','All you need to build new site','2023-12-24 09:07:26','2023-12-24 09:07:26'),(34,'theme-ultra-action_button_text','Buy Now','2023-12-24 09:07:26','2023-12-24 09:07:26'),(35,'theme-ultra-action_button_url','https://codecanyon.net/user/thesky9','2023-12-24 09:07:26','2023-12-24 09:07:26'),(36,'theme-ultra-logo','general/logo.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(37,'theme-ultra-logo_mobile','general/logo-mobile.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(38,'theme-ultra-logo_tablet','general/logo-tablet.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(39,'theme-ultra-logo_white','general/logo-white.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(40,'theme-ultra-img_loading','general/img-loading.jpg','2023-12-24 09:07:26','2023-12-24 09:07:26'),(41,'theme-ultra-font_heading','Arimo','2023-12-24 09:07:26','2023-12-24 09:07:26'),(42,'theme-ultra-font_body','Roboto','2023-12-24 09:07:26','2023-12-24 09:07:26'),(43,'theme-ultra-color_primary','#87c6e3','2023-12-24 09:07:26','2023-12-24 09:07:26'),(44,'theme-ultra-color_secondary','#455265','2023-12-24 09:07:26','2023-12-24 09:07:26'),(45,'theme-ultra-color_success','#76e1c6','2023-12-24 09:07:26','2023-12-24 09:07:26'),(46,'theme-ultra-color_danger','#f0a9a9','2023-12-24 09:07:26','2023-12-24 09:07:26'),(47,'theme-ultra-color_warning','#e6bf7e','2023-12-24 09:07:26','2023-12-24 09:07:26'),(48,'theme-ultra-color_info','#58c1c8','2023-12-24 09:07:26','2023-12-24 09:07:26'),(49,'theme-ultra-color_light','#F3F3F3','2023-12-24 09:07:26','2023-12-24 09:07:26'),(50,'theme-ultra-color_dark','#111111','2023-12-24 09:07:26','2023-12-24 09:07:26'),(51,'theme-ultra-color_link','#222831','2023-12-24 09:07:26','2023-12-24 09:07:26'),(52,'theme-ultra-color_white','#FFFFFF','2023-12-24 09:07:26','2023-12-24 09:07:26'),(53,'theme-ultra-header_style','style-1','2023-12-24 09:07:26','2023-12-24 09:07:26'),(54,'theme-ultra-preloader_enabled','0','2023-12-24 09:07:26','2023-12-24 09:07:26'),(55,'theme-ultra-allow_account_login','yes','2023-12-24 09:07:26','2023-12-24 09:07:26'),(56,'theme-ultra-comment_type_in_post','member','2023-12-24 09:07:26','2023-12-24 09:07:26'),(57,'theme-ultra-recently_viewed_posts_enable','yes','2023-12-24 09:07:26','2023-12-24 09:07:26'),(58,'theme-ultra-vi-site_title','UltraNews - Laravel News and Magazine Multilingual System','2023-12-24 09:07:26','2023-12-24 09:07:26'),(59,'theme-ultra-vi-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.','2023-12-24 09:07:26','2023-12-24 09:07:26'),(60,'theme-ultra-vi-seo_og_image','general/screenshot.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(61,'theme-ultra-vi-copyright','©2023 Thiết kế bởi AliThemes ','2023-12-24 09:07:26','2023-12-24 09:07:26'),(62,'theme-ultra-vi-designed_by','| Design by AliThemes','2023-12-24 09:07:26','2023-12-24 09:07:26'),(63,'theme-ultra-vi-favicon','general/favicon.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(64,'theme-ultra-vi-website','https://thesky9.com','2023-12-24 09:07:26','2023-12-24 09:07:26'),(65,'theme-ultra-vi-contact_email','support@thesky9.com','2023-12-24 09:07:26','2023-12-24 09:07:26'),(66,'theme-ultra-vi-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.','2023-12-24 09:07:26','2023-12-24 09:07:26'),(67,'theme-ultra-vi-phone','+(123) 345-6789','2023-12-24 09:07:26','2023-12-24 09:07:26'),(68,'theme-ultra-vi-email','contact@gmail.com','2023-12-24 09:07:26','2023-12-24 09:07:26'),(69,'theme-ultra-vi-address','214 West Arnold St. New York, NY 10002','2023-12-24 09:07:26','2023-12-24 09:07:26'),(70,'theme-ultra-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ','2023-12-24 09:07:26','2023-12-24 09:07:26'),(71,'theme-ultra-vi-cookie_consent_learn_more_url','http://ultra-news.local/cookie-policy','2023-12-24 09:07:26','2023-12-24 09:07:26'),(72,'theme-ultra-vi-cookie_consent_learn_more_text','Cookie Policy','2023-12-24 09:07:26','2023-12-24 09:07:26'),(73,'theme-ultra-vi-homepage_id','1','2023-12-24 09:07:26','2023-12-24 09:07:26'),(74,'theme-ultra-vi-blog_page_id','4','2023-12-24 09:07:26','2023-12-24 09:07:26'),(75,'theme-ultra-vi-single_layout','default','2023-12-24 09:07:26','2023-12-24 09:07:26'),(76,'theme-ultra-vi-single_title_layout','top-full','2023-12-24 09:07:26','2023-12-24 09:07:26'),(77,'theme-ultra-vi-logo','general/logo.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(78,'theme-ultra-vi-logo_mobile','general/logo-mobile.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(79,'theme-ultra-vi-logo_tablet','general/logo-tablet.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(80,'theme-ultra-vi-logo_white','general/logo-white.png','2023-12-24 09:07:26','2023-12-24 09:07:26'),(81,'theme-ultra-vi-action_title','Bạn cần tạo mới website','2023-12-24 09:07:26','2023-12-24 09:07:26'),(82,'theme-ultra-vi-action_button_text','Mua Ngay','2023-12-24 09:07:26','2023-12-24 09:07:26'),(83,'theme-ultra-vi-action_button_url','https://codecanyon.net/user/thesky9','2023-12-24 09:07:26','2023-12-24 09:07:26'),(84,'theme-ultra-vi-font_heading','Arimo','2023-12-24 09:07:26','2023-12-24 09:07:26'),(85,'theme-ultra-vi-font_body','Roboto','2023-12-24 09:07:26','2023-12-24 09:07:26'),(86,'theme-ultra-vi-color_brand_1','#ffcda3','2023-12-24 09:07:26','2023-12-24 09:07:26'),(87,'theme-ultra-vi-color_brand_2','#fce2ce','2023-12-24 09:07:26','2023-12-24 09:07:26'),(88,'theme-ultra-vi-color_brand_3','#ffede5','2023-12-24 09:07:26','2023-12-24 09:07:26'),(89,'theme-ultra-vi-color_brand_4','#fff5ef','2023-12-24 09:07:26','2023-12-24 09:07:26'),(90,'theme-ultra-vi-color_primary','#87c6e3','2023-12-24 09:07:26','2023-12-24 09:07:26'),(91,'theme-ultra-vi-color_secondary','#455265','2023-12-24 09:07:26','2023-12-24 09:07:26'),(92,'theme-ultra-vi-color_success','#76e1c6','2023-12-24 09:07:26','2023-12-24 09:07:26'),(93,'theme-ultra-vi-color_danger','#f0a9a9','2023-12-24 09:07:26','2023-12-24 09:07:26'),(94,'theme-ultra-vi-color_warning','#e6bf7e','2023-12-24 09:07:26','2023-12-24 09:07:26'),(95,'theme-ultra-vi-color_info','#58c1c8','2023-12-24 09:07:26','2023-12-24 09:07:26'),(96,'theme-ultra-vi-color_light','#F3F3F3','2023-12-24 09:07:26','2023-12-24 09:07:26'),(97,'theme-ultra-vi-color_dark','#111111','2023-12-24 09:07:26','2023-12-24 09:07:26'),(98,'theme-ultra-vi-color_link','#222831','2023-12-24 09:07:26','2023-12-24 09:07:26'),(99,'theme-ultra-vi-color_white','#FFFFFF','2023-12-24 09:07:26','2023-12-24 09:07:26'),(100,'theme-ultra-vi-header_style','style-1','2023-12-24 09:07:26','2023-12-24 09:07:26'),(101,'theme-ultra-vi-preloader_enabled','0','2023-12-24 09:07:26','2023-12-24 09:07:26'),(102,'theme-ultra-vi-allow_account_login','yes','2023-12-24 09:07:26','2023-12-24 09:07:26'),(103,'theme-ultra-vi-comment_type_in_post','member','2023-12-24 09:07:26','2023-12-24 09:07:26'),(104,'theme-ultra-vi-recently_viewed_posts_enable','yes','2023-12-24 09:07:26','2023-12-24 09:07:26'),(105,'theme-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(106,'theme-vi-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(107,'media_random_hash','79a1ea3c969e9cca4c1176f548038f16',NULL,NULL),(108,'comment_enable','1',NULL,NULL),(109,'comment_menu_enable','[\"Botble\\\\Blog\\\\Models\\\\Post\"]',NULL,NULL),(110,'plugin_comment_copyright','',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:03','2023-12-24 09:07:03'),(2,'home-2',2,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:03','2023-12-24 09:07:03'),(3,'home-3',3,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:03','2023-12-24 09:07:03'),(4,'blog',4,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:03','2023-12-24 09:07:03'),(5,'category-list',5,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:03','2023-12-24 09:07:03'),(6,'category-grid',6,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:04','2023-12-24 09:07:04'),(7,'category-metro',7,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:04','2023-12-24 09:07:04'),(8,'contact',8,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:04','2023-12-24 09:07:04'),(9,'about-us',9,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:04','2023-12-24 09:07:04'),(10,'cookie-policy',10,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:04','2023-12-24 09:07:04'),(11,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2023-12-24 09:07:06','2023-12-24 09:07:06'),(12,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2023-12-24 09:07:06','2023-12-24 09:07:06'),(13,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2023-12-24 09:07:06','2023-12-24 09:07:06'),(14,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2023-12-24 09:07:06','2023-12-24 09:07:06'),(15,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2023-12-24 09:07:06','2023-12-24 09:07:06'),(16,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2023-12-24 09:07:06','2023-12-24 09:07:06'),(17,'design',1,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(18,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(19,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(20,'healthy',4,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(21,'fashion',5,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(22,'hotel',6,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(23,'nature',7,'Botble\\Blog\\Models\\Category','','2023-12-24 09:07:13','2023-12-24 09:07:13'),(24,'general',1,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:13','2023-12-24 09:07:13'),(25,'beauty',2,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:13','2023-12-24 09:07:13'),(26,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:14','2023-12-24 09:07:14'),(27,'lifestyle',4,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:14','2023-12-24 09:07:14'),(28,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:14','2023-12-24 09:07:14'),(29,'business',6,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:14','2023-12-24 09:07:14'),(30,'health',7,'Botble\\Blog\\Models\\Tag','tag','2023-12-24 09:07:14','2023-12-24 09:07:14'),(31,'this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',1,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(32,'the-world-caters-to-average-people-and-mediocre-lifestyles',2,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(33,'not-a-bit-of-hesitation-you-better-think-twice',3,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(34,'we-got-a-right-to-pick-a-little-fight-bonanza',4,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(35,'my-entrance-exam-was-on-a-book-of-matches',5,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(36,'essential-qualities-of-highly-successful-music',6,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(37,'why-teamwork-really-makes-the-dream-work',7,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(38,'9-things-i-love-about-shaving-my-head-during-quarantine',8,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(39,'the-litigants-on-the-screen-are-not-actors',9,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(40,'imagine-losing-20-pounds-in-14-days',10,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(41,'are-you-still-using-that-slow-old-typewriter',11,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(42,'a-skin-cream-thats-proven-to-work',12,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(43,'10-reasons-to-start-your-own-profitable-website',13,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(44,'level-up-your-live-streams-with-automated-captions-and-more',14,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(45,'simple-ways-to-reduce-your-unwanted-wrinkles',15,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(46,'apple-imac-with-retina-5k-display-review',16,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(47,'10000-web-site-visitors-in-one-monthguaranteed',17,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(48,'unlock-the-secrets-of-selling-high-ticket-items',18,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(49,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',19,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(50,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',20,'Botble\\Blog\\Models\\Post','','2023-12-24 09:07:14','2023-12-24 09:07:14'),(51,'smith',1,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:16','2023-12-24 09:07:26'),(52,'jacobi',2,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:16','2023-12-24 09:07:26'),(53,'padberg',3,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:16','2023-12-24 09:07:26'),(54,'treutel',4,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:16','2023-12-24 09:07:26'),(55,'dubuque',5,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:17','2023-12-24 09:07:26'),(56,'herman',6,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:17','2023-12-24 09:07:26'),(57,'schumm',7,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:17','2023-12-24 09:07:26'),(58,'huel',8,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:18','2023-12-24 09:07:26'),(59,'raynor',9,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:18','2023-12-24 09:07:26'),(60,'block',10,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:18','2023-12-24 09:07:26'),(61,'hoppe',11,'Botble\\Member\\Models\\Member','author','2023-12-24 09:07:18','2023-12-24 09:07:26'),(62,'editors-picked',1,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:24','2023-12-24 09:07:24'),(63,'recommended-posts',2,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:24','2023-12-24 09:07:24'),(64,'bai-viet-hay',3,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:24','2023-12-24 09:07:24'),(65,'recommended-posts',4,'Botble\\Page\\Models\\Page','','2023-12-24 09:07:24','2023-12-24 09:07:24'),(66,'editors-picked',1,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2023-12-24 09:07:26','2023-12-24 09:07:26'),(67,'recommended-posts',2,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2023-12-24 09:07:26','2023-12-24 09:07:26'),(68,'bai-viet-hay',3,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2023-12-24 09:07:26','2023-12-24 09:07:26'),(69,'recommended-posts',4,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2023-12-24 09:07:26','2023-12-24 09:07:26');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:13','2023-12-24 09:07:13'),(2,'Beauty',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:13','2023-12-24 09:07:13'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:13','2023-12-24 09:07:13'),(4,'Lifestyle',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:14','2023-12-24 09:07:14'),(5,'Travel',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:14','2023-12-24 09:07:14'),(6,'Business',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:14','2023-12-24 09:07:14'),(7,'Health',1,'Botble\\ACL\\Models\\User','','published','2023-12-24 09:07:14','2023-12-24 09:07:14');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Làm đẹp',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Du lịch và ẩm thực',NULL),('vi',5,'Kinh doanh',NULL),('vi',6,'Sức khỏe',NULL),('vi',7,'Thời sự',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dbeer@rice.org',NULL,'$2y$12$md/1SzWZBhU7nbybU4PJkO/nKi9w8nGW4ElEHBhPU6/HXBDPKkHCu',NULL,'2023-12-24 09:07:02','2023-12-24 09:07:02','Sammy','Roberts','botble',NULL,1,1,NULL,NULL),(2,'hammes.kailey@murphy.com',NULL,'$2y$12$an6GThrfbBTu4o0lu45Hv.055SG1Gw3hb.HQ5S2Mz7ii5iHJEwb2G',NULL,'2023-12-24 09:07:03','2023-12-24 09:07:03','Zion','Sawayn','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SocialsWidget','primary_sidebar','ultra',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(2,'AdsWidget','primary_sidebar','ultra',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(3,'CategoriesMenuWidget','primary_sidebar','ultra',0,'{\"id\":\"CategoriesMenuWidget\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(4,'LastestPostsWidget','primary_sidebar','ultra',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"Lastest Post\",\"number_display\":6}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(5,'TagsWidget','primary_sidebar','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":10}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(6,'AdsWidget','primary_sidebar','ultra',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(7,'AboutWidget','footer_sidebar_1','ultra',1,'{\"id\":\"AboutWidget\",\"name\":\"About me\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(8,'PopularPostsWidget','footer_sidebar_2','ultra',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"Popular Posts\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(9,'CustomMenuWidget','footer_sidebar_3','ultra',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(10,'TagsWidget','footer_sidebar_3','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(11,'NewsletterWidget','footer_sidebar_4','ultra',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(12,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(13,'SocialsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(14,'AdsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(15,'CategoriesMenuWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"CategoriesMenuWidget\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(16,'LastestPostsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi nh\\u1ea5t\",\"number_display\":6}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(17,'TagsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Th\\u1ebb\",\"number_display\":10}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(18,'AdsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(19,'AboutWidget','footer_sidebar_1','ultra-vi',1,'{\"id\":\"AboutWidget\",\"name\":\"V\\u1ec1 ch\\u00fang t\\u00f4i\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(20,'PopularPostsWidget','footer_sidebar_2','ultra-vi',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"N\\u1ed5i b\\u1eadt\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(21,'CustomMenuWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(22,'TagsWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(23,'NewsletterWidget','footer_sidebar_4','ultra-vi',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2023-12-24 09:07:24','2023-12-24 09:07:24'),(24,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra-vi',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2023-12-24 09:07:24','2023-12-24 09:07:24');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-24 16:14:07
