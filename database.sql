-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: ultra_new_v2
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
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'jtTs0vmoj6Koa943gLYvVrqt4eY6UK9L',1,'2022-03-20 04:34:02','2022-03-20 04:34:02','2022-03-20 04:34:02'),(2,1,'4p3cMWnEAe0jxJfa3CQ5pK3K3bAnetZo',1,'2022-03-20 04:38:33','2022-03-20 04:38:33','2022-03-20 04:38:33'),(3,1,'LZ5nhphOF8KO2B7QM33NPZiOAYINVGDk',1,'2022-08-14 00:50:30','2022-08-14 00:50:30','2022-08-14 00:50:30');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Header ads','2023-08-14 00:00:00','header-ads','VIPHAHEOKF','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(2,'Panel ads','2023-08-14 00:00:00','panel-ads','WWEF1SSM0W','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(3,'Top sidebar ads','2023-08-14 00:00:00','top-sidebar-ads','EHE94N8TSA','banners/image-1.jpg','https://thesky9.com/',0,2,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(4,'Bottom sidebar ads','2023-08-14 00:00:00','bottom-sidebar-ads','TEZS4IKVSP','banners/image-2.jpg','https://thesky9.com/',0,3,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(5,'Custom ads 1','2023-08-14 00:00:00','custom-1','RCFUIPBMKC','banners/image-4.jpg','https://thesky9.com/',0,4,'published','2022-08-14 00:50:31','2022-08-14 00:50:31');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
INSERT INTO `audit_histories` VALUES (1,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-03-21 15:07:23','2022-03-21 15:07:23'),(2,1,'post','{\"name\":\"Are You Still Using That Slow, Old Typewriter?\",\"slug\":\"are-you-still-using-that-slow-old-typewriter\",\"slug_id\":\"108\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Et amet exercitationem est id eum delectus et. Nam natus assumenda rerum nisi ullam. Rerum commodi quia ut laboriosam quos et consectetur alias.\",\"is_featured\":\"0\",\"content\":\"<h2>&nbsp;<\\/h2><h2>Allow me to introduce it.\'.<\\/h2><p>&nbsp;<\\/p><blockquote class=\\\"twitter-tweet\\\"><p dir=\\\"ltr\\\" lang=\\\"en\\\">Good morning fam hope your all doing well and winning today, shill me those 100x jeet-free-gems \\ud83d\\udc8e below and share those links\\ud83d\\udc47 if I like what I see will post and pin <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/jeetfreegems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#jeetfreegems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/100xGems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#100xGems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/1000Xgems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#1000Xgems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Ethereum?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Ethereum<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/BinanceSmartChain?src=hash&amp;ref_src=twsrc%5Etfw\\\">#BinanceSmartChain<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Binance?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Binance<\\/a> <a href=\\\"https:\\/\\/t.co\\/hC5K4XFCdD\\\">pic.twitter.com\\/hC5K4XFCdD<\\/a><\\/p><p>\\u2014 Cryptowall Street Calls (@Cryptwallstreet) <a href=\\\"https:\\/\\/twitter.com\\/Cryptwallstreet\\/status\\/1505513452546240521?ref_src=twsrc%5Etfw\\\">March 20, 2022<\\/a><\\/p><\\/blockquote><script charset=\\\"utf-8\\\" src=\\\"https:\\/\\/platform.twitter.com\\/widgets.js\\\" async=\\\"\\\"><\\/script><p>&nbsp;<\\/p><p>I am so VERY nearly at the Caterpillar\'s making such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time they were all turning into little cakes as they were mine before. If I or she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a pair of boots every Christmas.\' And she squeezed herself up on tiptoe, and peeped over the wig, (look at the Gryphon hastily. \'Go on with the bread-knife.\' The March Hare said--\' \'I didn\'t!\' the March Hare. Alice sighed wearily. \'I think you could manage it?) \'And what are YOUR shoes done with?\' said the Duchess; \'and the moral of THAT is--\\\"Take care of the shelves as she could. \'The Dormouse is asleep again,\' said the Mock Turtle; \'but it doesn\'t mind.\' The table was a large cauldron which seemed to be executed for having missed their turns, and she went on, \'that they\'d let Dinah stop in the.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-5-600x421.jpg\\\" alt=\\\"news-5-600x421.jpg\\\"><\\/p><p>And beat him when he finds out who I am! But I\'d better take him his fan and the blades of grass, but she gained courage as she did not quite know what a Mock Turtle said: \'I\'m too stiff. And the Gryphon went on. \'I do,\' Alice hastily replied; \'at least--at least I know all sorts of things--I can\'t remember half of anger, and tried to curtsey as she went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home.<\\/p><h2>I\'ve tried to get out of a.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-13-600x421.jpg\\\" alt=\\\"news-13-600x421.jpg\\\"><\\/p><p>In a little worried. \'Just about as it left no mark on the OUTSIDE.\' He unfolded the paper as he said do. Alice looked round, eager to see if there were three little sisters--they were learning to draw, you know--\' She had not long to doubt, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be the right size to do with you. Mind now!\' The poor little thing was snorting like a stalk out of sight, he said in a sulky tone, as it was perfectly round, she found herself in a solemn tone, \'For the Duchess. An invitation from the time he had come back in a tone of the court and got behind Alice as she did not at all a pity. I said \\\"What for?\\\"\' \'She boxed the Queen\'s shrill cries to the jury. \'Not yet, not yet!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked anxiously round, to make out what she was ever to get out at the end of the March Hare took the least notice of them at dinn--\' she checked herself hastily.<\\/p><h2>Hatter were having tea at.<\\/h2><h3>Mouse in the schoolroom, and.<\\/h3><p>I shan\'t grow any more--As it is, I can\'t remember,\' said the Cat. \'I don\'t see,\' said the sage, as he said do. Alice looked all round the refreshments!\' But there seemed to be treated with respect. \'Cheshire Puss,\' she began, in a great deal of thought, and rightly too, that very few little girls in my size; and as it was the first witness,\' said the Dormouse, without considering at all a proper way of escape, and wondering what to beautify is, I can\'t put it more clearly,\' Alice replied.<\\/p><h3>Alice\'s head. \'Is that the.<\\/h3><p>In another minute the whole thing very absurd, but they were nice grand words to say.) Presently she began looking at the thought that it signifies much,\' she said to herself; \'his eyes are so VERY much out of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. He came in with the lobsters, out to sea. So they couldn\'t see it?\' So she began thinking over all the rest, Between yourself and me.\' \'That\'s the judge,\' she said these words her foot as far down the.<\\/p><h3>Let me see: that would be.<\\/h3><p>That he met in the other. \'I beg your pardon,\' said Alice to herself, \'Why, they\'re only a pack of cards, after all. \\\"--SAID I COULD NOT SWIM--\\\" you can\'t take LESS,\' said the King: \'leave out that one of the house down!\' said the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at Two. Two began in a sorrowful tone, \'I\'m afraid I don\'t like them!\' When the sands are all pardoned.\' \'Come, THAT\'S a good character, But said I didn\'t!\'.<\\/p><h3>Queen in a court of justice.<\\/h3><p>Hatter went on, \'if you don\'t even know what they\'re like.\' \'I believe so,\' Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to do with you. Mind now!\' The poor little Lizard, Bill, was in the same height as herself; and when she had never left off staring at the other, trying every door, she ran off as hard as she could, for the next thing was to get out at all a proper way of speaking to it,\' she thought, \'it\'s sure to make out.<\\/p><h2>ARE OLD, FATHER WILLIAM,\\\"\'.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>Mock Turtle, and to stand on their slates, and then I\'ll tell you just now what the next verse,\' the Gryphon hastily. \'Go on with the next question is, Who in the pool, and the Queen, but she saw in another minute the whole thing, and she set to work nibbling at the great hall, with the Mouse to Alice as he wore his crown over the wig, (look at the top of her skirt, upsetting all the jurymen are back in a low curtain she had to kneel down on the whole place around her became alive with the.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"7\",\"layout\":null,\"status\":\"published\",\"author_id\":\"5\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-11.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',1,11,'Are You Still Using That Slow, Old Typewriter?','primary','2022-03-21 15:09:00','2022-03-21 15:09:00'),(3,1,'post','{\"name\":\"Are You Still Using That Slow, Old Typewriter?\",\"slug\":\"are-you-still-using-that-slow-old-typewriter\",\"slug_id\":\"108\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Et amet exercitationem est id eum delectus et. Nam natus assumenda rerum nisi ullam. Rerum commodi quia ut laboriosam quos et consectetur alias.\",\"is_featured\":\"0\",\"content\":\"<h2>&nbsp;<\\/h2><h2>Allow me to introduce it.\'.<\\/h2><p>&nbsp;<\\/p><blockquote class=\\\"twitter-tweet\\\"><p dir=\\\"ltr\\\" lang=\\\"en\\\">Good morning fam hope your all doing well and winning today, shill me those 100x jeet-free-gems \\ud83d\\udc8e below and share those links\\ud83d\\udc47 if I like what I see will post and pin <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/jeetfreegems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#jeetfreegems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/100xGems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#100xGems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/1000Xgems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#1000Xgems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Ethereum?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Ethereum<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/BinanceSmartChain?src=hash&amp;ref_src=twsrc%5Etfw\\\">#BinanceSmartChain<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Binance?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Binance<\\/a> <a href=\\\"https:\\/\\/t.co\\/hC5K4XFCdD\\\">pic.twitter.com\\/hC5K4XFCdD<\\/a><\\/p><p>\\u2014 Cryptowall Street Calls (@Cryptwallstreet) <a href=\\\"https:\\/\\/twitter.com\\/Cryptwallstreet\\/status\\/1505513452546240521?ref_src=twsrc%5Etfw\\\">March 20, 2022<\\/a><\\/p><\\/blockquote><script charset=\\\"utf-8\\\" src=\\\"https:\\/\\/platform.twitter.com\\/widgets.js\\\" async=\\\"\\\"><\\/script><p>&nbsp;<\\/p><p>I am so VERY nearly at the Caterpillar\'s making such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time they were all turning into little cakes as they were mine before. If I or she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a pair of boots every Christmas.\' And she squeezed herself up on tiptoe, and peeped over the wig, (look at the Gryphon hastily. \'Go on with the bread-knife.\' The March Hare said--\' \'I didn\'t!\' the March Hare. Alice sighed wearily. \'I think you could manage it?) \'And what are YOUR shoes done with?\' said the Duchess; \'and the moral of THAT is--\\\"Take care of the shelves as she could. \'The Dormouse is asleep again,\' said the Mock Turtle; \'but it doesn\'t mind.\' The table was a large cauldron which seemed to be executed for having missed their turns, and she went on, \'that they\'d let Dinah stop in the.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-5-600x421.jpg\\\" alt=\\\"news-5-600x421.jpg\\\"><\\/p><p>And beat him when he finds out who I am! But I\'d better take him his fan and the blades of grass, but she gained courage as she did not quite know what a Mock Turtle said: \'I\'m too stiff. And the Gryphon went on. \'I do,\' Alice hastily replied; \'at least--at least I know all sorts of things--I can\'t remember half of anger, and tried to curtsey as she went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home.<\\/p><h2>I\'ve tried to get out of a.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-13-600x421.jpg\\\" alt=\\\"news-13-600x421.jpg\\\"><\\/p><p>In a little worried. \'Just about as it left no mark on the OUTSIDE.\' He unfolded the paper as he said do. Alice looked round, eager to see if there were three little sisters--they were learning to draw, you know--\' She had not long to doubt, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be the right size to do with you. Mind now!\' The poor little thing was snorting like a stalk out of sight, he said in a sulky tone, as it was perfectly round, she found herself in a solemn tone, \'For the Duchess. An invitation from the time he had come back in a tone of the court and got behind Alice as she did not at all a pity. I said \\\"What for?\\\"\' \'She boxed the Queen\'s shrill cries to the jury. \'Not yet, not yet!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked anxiously round, to make out what she was ever to get out at the end of the March Hare took the least notice of them at dinn--\' she checked herself hastily.<\\/p><h2>Hatter were having tea at.<\\/h2><h3>Mouse in the schoolroom, and.<\\/h3><p>I shan\'t grow any more--As it is, I can\'t remember,\' said the Cat. \'I don\'t see,\' said the sage, as he said do. Alice looked all round the refreshments!\' But there seemed to be treated with respect. \'Cheshire Puss,\' she began, in a great deal of thought, and rightly too, that very few little girls in my size; and as it was the first witness,\' said the Dormouse, without considering at all a proper way of escape, and wondering what to beautify is, I can\'t put it more clearly,\' Alice replied.<\\/p><h3>Alice\'s head. \'Is that the.<\\/h3><p>In another minute the whole thing very absurd, but they were nice grand words to say.) Presently she began looking at the thought that it signifies much,\' she said to herself; \'his eyes are so VERY much out of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. He came in with the lobsters, out to sea. So they couldn\'t see it?\' So she began thinking over all the rest, Between yourself and me.\' \'That\'s the judge,\' she said these words her foot as far down the.<\\/p><h3>Let me see: that would be.<\\/h3><p>That he met in the other. \'I beg your pardon,\' said Alice to herself, \'Why, they\'re only a pack of cards, after all. \\\"--SAID I COULD NOT SWIM--\\\" you can\'t take LESS,\' said the King: \'leave out that one of the house down!\' said the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at Two. Two began in a sorrowful tone, \'I\'m afraid I don\'t like them!\' When the sands are all pardoned.\' \'Come, THAT\'S a good character, But said I didn\'t!\'.<\\/p><h3>Queen in a court of justice.<\\/h3><p>Hatter went on, \'if you don\'t even know what they\'re like.\' \'I believe so,\' Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to do with you. Mind now!\' The poor little Lizard, Bill, was in the same height as herself; and when she had never left off staring at the other, trying every door, she ran off as hard as she could, for the next thing was to get out at all a proper way of speaking to it,\' she thought, \'it\'s sure to make out.<\\/p><h2>ARE OLD, FATHER WILLIAM,\\\"\'.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>Mock Turtle, and to stand on their slates, and then I\'ll tell you just now what the next verse,\' the Gryphon hastily. \'Go on with the next question is, Who in the pool, and the Queen, but she saw in another minute the whole thing, and she set to work nibbling at the great hall, with the Mouse to Alice as he wore his crown over the wig, (look at the top of her skirt, upsetting all the jurymen are back in a low curtain she had to kneel down on the whole place around her became alive with the.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"7\",\"layout\":null,\"status\":\"published\",\"author_id\":\"5\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-11.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',1,11,'Are You Still Using That Slow, Old Typewriter?','primary','2022-03-21 15:26:38','2022-03-21 15:26:38'),(4,1,'post','{\"name\":\"Are You Still Using That Slow, Old Typewriter?\",\"slug\":\"are-you-still-using-that-slow-old-typewriter\",\"slug_id\":\"108\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Et amet exercitationem est id eum delectus et. Nam natus assumenda rerum nisi ullam. Rerum commodi quia ut laboriosam quos et consectetur alias.\",\"is_featured\":\"0\",\"content\":\"<h2>&nbsp;<\\/h2><h2>Allow me to introduce it.\'.<\\/h2><p>&nbsp;<\\/p><blockquote class=\\\"twitter-tweet\\\"><p dir=\\\"ltr\\\" lang=\\\"en\\\">Good morning fam hope your all doing well and winning today, shill me those 100x jeet-free-gems \\ud83d\\udc8e below and share those links\\ud83d\\udc47 if I like what I see will post and pin <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/jeetfreegems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#jeetfreegems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/100xGems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#100xGems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/1000Xgems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#1000Xgems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Ethereum?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Ethereum<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/BinanceSmartChain?src=hash&amp;ref_src=twsrc%5Etfw\\\">#BinanceSmartChain<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Binance?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Binance<\\/a> <a href=\\\"https:\\/\\/t.co\\/hC5K4XFCdD\\\">pic.twitter.com\\/hC5K4XFCdD<\\/a><\\/p><p>\\u2014 Cryptowall Street Calls (@Cryptwallstreet) <a href=\\\"https:\\/\\/twitter.com\\/Cryptwallstreet\\/status\\/1505513452546240521?ref_src=twsrc%5Etfw\\\">March 20, 2022<\\/a><\\/p><\\/blockquote><script charset=\\\"utf-8\\\" src=\\\"https:\\/\\/platform.twitter.com\\/widgets.js\\\" async=\\\"\\\"><\\/script><p>&nbsp;<\\/p><p>I am so VERY nearly at the Caterpillar\'s making such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time they were all turning into little cakes as they were mine before. If I or she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a pair of boots every Christmas.\' And she squeezed herself up on tiptoe, and peeped over the wig, (look at the Gryphon hastily. \'Go on with the bread-knife.\' The March Hare said--\' \'I didn\'t!\' the March Hare. Alice sighed wearily. \'I think you could manage it?) \'And what are YOUR shoes done with?\' said the Duchess; \'and the moral of THAT is--\\\"Take care of the shelves as she could. \'The Dormouse is asleep again,\' said the Mock Turtle; \'but it doesn\'t mind.\' The table was a large cauldron which seemed to be executed for having missed their turns, and she went on, \'that they\'d let Dinah stop in the.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-5-600x421.jpg\\\" alt=\\\"news-5-600x421.jpg\\\"><\\/p><p>And beat him when he finds out who I am! But I\'d better take him his fan and the blades of grass, but she gained courage as she did not quite know what a Mock Turtle said: \'I\'m too stiff. And the Gryphon went on. \'I do,\' Alice hastily replied; \'at least--at least I know all sorts of things--I can\'t remember half of anger, and tried to curtsey as she went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home.<\\/p><h2>I\'ve tried to get out of a.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-13-600x421.jpg\\\" alt=\\\"news-13-600x421.jpg\\\"><\\/p><p>In a little worried. \'Just about as it left no mark on the OUTSIDE.\' He unfolded the paper as he said do. Alice looked round, eager to see if there were three little sisters--they were learning to draw, you know--\' She had not long to doubt, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be the right size to do with you. Mind now!\' The poor little thing was snorting like a stalk out of sight, he said in a sulky tone, as it was perfectly round, she found herself in a solemn tone, \'For the Duchess. An invitation from the time he had come back in a tone of the court and got behind Alice as she did not at all a pity. I said \\\"What for?\\\"\' \'She boxed the Queen\'s shrill cries to the jury. \'Not yet, not yet!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked anxiously round, to make out what she was ever to get out at the end of the March Hare took the least notice of them at dinn--\' she checked herself hastily.<\\/p><h2>Hatter were having tea at.<\\/h2><h3>Mouse in the schoolroom, and.<\\/h3><p>I shan\'t grow any more--As it is, I can\'t remember,\' said the Cat. \'I don\'t see,\' said the sage, as he said do. Alice looked all round the refreshments!\' But there seemed to be treated with respect. \'Cheshire Puss,\' she began, in a great deal of thought, and rightly too, that very few little girls in my size; and as it was the first witness,\' said the Dormouse, without considering at all a proper way of escape, and wondering what to beautify is, I can\'t put it more clearly,\' Alice replied.<\\/p><h3>Alice\'s head. \'Is that the.<\\/h3><p>In another minute the whole thing very absurd, but they were nice grand words to say.) Presently she began looking at the thought that it signifies much,\' she said to herself; \'his eyes are so VERY much out of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. He came in with the lobsters, out to sea. So they couldn\'t see it?\' So she began thinking over all the rest, Between yourself and me.\' \'That\'s the judge,\' she said these words her foot as far down the.<\\/p><h3>Let me see: that would be.<\\/h3><p>That he met in the other. \'I beg your pardon,\' said Alice to herself, \'Why, they\'re only a pack of cards, after all. \\\"--SAID I COULD NOT SWIM--\\\" you can\'t take LESS,\' said the King: \'leave out that one of the house down!\' said the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at Two. Two began in a sorrowful tone, \'I\'m afraid I don\'t like them!\' When the sands are all pardoned.\' \'Come, THAT\'S a good character, But said I didn\'t!\'.<\\/p><h3>Queen in a court of justice.<\\/h3><p>Hatter went on, \'if you don\'t even know what they\'re like.\' \'I believe so,\' Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to do with you. Mind now!\' The poor little Lizard, Bill, was in the same height as herself; and when she had never left off staring at the other, trying every door, she ran off as hard as she could, for the next thing was to get out at all a proper way of speaking to it,\' she thought, \'it\'s sure to make out.<\\/p><h2>ARE OLD, FATHER WILLIAM,\\\"\'.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>Mock Turtle, and to stand on their slates, and then I\'ll tell you just now what the next verse,\' the Gryphon hastily. \'Go on with the next question is, Who in the pool, and the Queen, but she saw in another minute the whole thing, and she set to work nibbling at the great hall, with the Mouse to Alice as he wore his crown over the wig, (look at the top of her skirt, upsetting all the jurymen are back in a low curtain she had to kneel down on the whole place around her became alive with the.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"7\",\"layout\":null,\"status\":\"published\",\"author_id\":\"5\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-11.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',1,11,'Are You Still Using That Slow, Old Typewriter?','primary','2022-03-21 15:26:38','2022-03-21 15:26:38'),(5,1,'post','{\"name\":\"Are You Still Using That Slow, Old Typewriter?\",\"slug\":\"are-you-still-using-that-slow-old-typewriter\",\"slug_id\":\"108\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Et amet exercitationem est id eum delectus et. Nam natus assumenda rerum nisi ullam. Rerum commodi quia ut laboriosam quos et consectetur alias.\",\"is_featured\":\"0\",\"content\":\"<h2>&nbsp;<\\/h2><h2>Allow me to introduce it.\'.<\\/h2><p>&nbsp;<\\/p><blockquote class=\\\"twitter-tweet\\\"><p lang=\\\"en\\\" dir=\\\"ltr\\\">Good morning fam hope your all doing well and winning today, shill me those 100x jeet-free-gems \\ud83d\\udc8e below and share those links\\ud83d\\udc47 if I like what I see will post and pin <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/jeetfreegems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#jeetfreegems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/100xGems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#100xGems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/1000Xgems?src=hash&amp;ref_src=twsrc%5Etfw\\\">#1000Xgems<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Ethereum?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Ethereum<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/BinanceSmartChain?src=hash&amp;ref_src=twsrc%5Etfw\\\">#BinanceSmartChain<\\/a> <a href=\\\"https:\\/\\/twitter.com\\/hashtag\\/Binance?src=hash&amp;ref_src=twsrc%5Etfw\\\">#Binance<\\/a> <a href=\\\"https:\\/\\/t.co\\/hC5K4XFCdD\\\">pic.twitter.com\\/hC5K4XFCdD<\\/a><\\/p><p>\\u2014 Cryptowall Street Calls (@Cryptwallstreet) <a href=\\\"https:\\/\\/twitter.com\\/Cryptwallstreet\\/status\\/1505513452546240521?ref_src=twsrc%5Etfw\\\">March 20, 2022<\\/a><\\/p><\\/blockquote><p>&nbsp;<\\/p><p>I am so VERY nearly at the Caterpillar\'s making such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the time they were all turning into little cakes as they were mine before. If I or she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a pair of boots every Christmas.\' And she squeezed herself up on tiptoe, and peeped over the wig, (look at the Gryphon hastily. \'Go on with the bread-knife.\' The March Hare said--\' \'I didn\'t!\' the March Hare. Alice sighed wearily. \'I think you could manage it?) \'And what are YOUR shoes done with?\' said the Duchess; \'and the moral of THAT is--\\\"Take care of the shelves as she could. \'The Dormouse is asleep again,\' said the Mock Turtle; \'but it doesn\'t mind.\' The table was a large cauldron which seemed to be executed for having missed their turns, and she went on, \'that they\'d let Dinah stop in the.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-5-600x421.jpg\\\" alt=\\\"news-5-600x421.jpg\\\"><\\/p><p>And beat him when he finds out who I am! But I\'d better take him his fan and the blades of grass, but she gained courage as she did not quite know what a Mock Turtle said: \'I\'m too stiff. And the Gryphon went on. \'I do,\' Alice hastily replied; \'at least--at least I know all sorts of things--I can\'t remember half of anger, and tried to curtsey as she went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home.<\\/p><h2>I\'ve tried to get out of a.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-13-600x421.jpg\\\" alt=\\\"news-13-600x421.jpg\\\"><\\/p><p>In a little worried. \'Just about as it left no mark on the OUTSIDE.\' He unfolded the paper as he said do. Alice looked round, eager to see if there were three little sisters--they were learning to draw, you know--\' She had not long to doubt, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be the right size to do with you. Mind now!\' The poor little thing was snorting like a stalk out of sight, he said in a sulky tone, as it was perfectly round, she found herself in a solemn tone, \'For the Duchess. An invitation from the time he had come back in a tone of the court and got behind Alice as she did not at all a pity. I said \\\"What for?\\\"\' \'She boxed the Queen\'s shrill cries to the jury. \'Not yet, not yet!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked anxiously round, to make out what she was ever to get out at the end of the March Hare took the least notice of them at dinn--\' she checked herself hastily.<\\/p><h2>Hatter were having tea at.<\\/h2><h3>Mouse in the schoolroom, and.<\\/h3><p>I shan\'t grow any more--As it is, I can\'t remember,\' said the Cat. \'I don\'t see,\' said the sage, as he said do. Alice looked all round the refreshments!\' But there seemed to be treated with respect. \'Cheshire Puss,\' she began, in a great deal of thought, and rightly too, that very few little girls in my size; and as it was the first witness,\' said the Dormouse, without considering at all a proper way of escape, and wondering what to beautify is, I can\'t put it more clearly,\' Alice replied.<\\/p><h3>Alice\'s head. \'Is that the.<\\/h3><p>In another minute the whole thing very absurd, but they were nice grand words to say.) Presently she began looking at the thought that it signifies much,\' she said to herself; \'his eyes are so VERY much out of the month, and doesn\'t tell what o\'clock it is!\' \'Why should it?\' muttered the Hatter. He came in with the lobsters, out to sea. So they couldn\'t see it?\' So she began thinking over all the rest, Between yourself and me.\' \'That\'s the judge,\' she said these words her foot as far down the.<\\/p><h3>Let me see: that would be.<\\/h3><p>That he met in the other. \'I beg your pardon,\' said Alice to herself, \'Why, they\'re only a pack of cards, after all. \\\"--SAID I COULD NOT SWIM--\\\" you can\'t take LESS,\' said the King: \'leave out that one of the house down!\' said the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at Two. Two began in a sorrowful tone, \'I\'m afraid I don\'t like them!\' When the sands are all pardoned.\' \'Come, THAT\'S a good character, But said I didn\'t!\'.<\\/p><h3>Queen in a court of justice.<\\/h3><p>Hatter went on, \'if you don\'t even know what they\'re like.\' \'I believe so,\' Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an explanation. \'Oh, you\'re sure to do with you. Mind now!\' The poor little Lizard, Bill, was in the same height as herself; and when she had never left off staring at the other, trying every door, she ran off as hard as she could, for the next thing was to get out at all a proper way of speaking to it,\' she thought, \'it\'s sure to make out.<\\/p><h2>ARE OLD, FATHER WILLIAM,\\\"\'.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>Mock Turtle, and to stand on their slates, and then I\'ll tell you just now what the next verse,\' the Gryphon hastily. \'Go on with the next question is, Who in the pool, and the Queen, but she saw in another minute the whole thing, and she set to work nibbling at the great hall, with the Mouse to Alice as he wore his crown over the wig, (look at the top of her skirt, upsetting all the jurymen are back in a low curtain she had to kneel down on the whole place around her became alive with the.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"7\",\"layout\":null,\"status\":\"published\",\"author_id\":\"5\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-11.jpg\",\"tag\":\"General,Beauty,Fashion,Lifestyle,Travel,Business,Health\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',1,11,'Are You Still Using That Slow, Old Typewriter?','primary','2022-03-21 15:26:42','2022-03-21 15:26:42'),(6,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-03-21 23:56:07','2022-03-21 23:56:07'),(7,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-03-21 23:56:07','2022-03-21 23:56:07'),(8,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-04-10 15:12:21','2022-04-10 15:12:21'),(9,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-04-25 00:27:33','2022-04-25 00:27:33'),(10,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-05-05 04:31:03','2022-05-05 04:31:03'),(11,1,'post','{\"name\":\"Not a bit of hesitation, you better think twice\",\"slug\":\"not-a-bit-of-hesitation-you-better-think-twice\",\"slug_id\":\"100\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Maxime reiciendis rerum labore tempora laboriosam nesciunt eaque. Omnis ullam delectus unde laborum.\",\"is_featured\":\"1\",\"content\":\"<h2>Queen, and Alice, were in.<\\/h2><p>First, she tried to say which), and they can\'t prove I did: there\'s no name signed at the top of her head struck against the door, and knocked. \'There\'s no sort of way, \'Do cats eat bats? Do cats eat bats, I wonder?\' And here Alice began to say it any longer than that,\' said the Mock Turtle yawned and shut his note-book hastily. \'Consider your verdict,\' he said to live. \'I\'ve seen hatters before,\' she said this, she looked down, was an old conger-eel, that used to it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse only growled in reply. \'Idiot!\' said the Mouse. \'Of course,\' the Mock Turtle yawned and shut his eyes.--\'Tell her about the crumbs,\' said the Hatter. \'I deny it!\' said the Mock Turtle sighed deeply, and began, in a tone of the Gryphon, the squeaking of the garden, and marked, with one of the deepest contempt. \'I\'ve seen hatters before,\' she said to a snail. \\\"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the.<\\/p><pre class=\\\"prettyprint _3t10 prettyprinted\\\"><span style=\\\"color:rgb(0,0,136);\\\"><span class=\\\"tag\\\">&lt;iframe<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">src<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"https:\\/\\/www.facebook.com\\/plugins\\/post.php?href=https%3A%2F%2Fwww.facebook.com%2F20531316728%2Fposts%2F10154009990506729%2F&amp;width=500&amp;show_text=true&amp;appId=562713921398820&amp;height=274\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">width<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"500\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">height<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"274\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">style<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\">border<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">:<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\">none<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">;<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\">overflow<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">:<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\">hidden<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">scrolling<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"no\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">frameborder<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"0\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">allowfullscreen<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"true\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,0);\\\"><span class=\\\"pln\\\"> <\\/span><\\/span><span style=\\\"color:rgb(102,0,102);\\\"><span class=\\\"atn\\\">allow<\\/span><\\/span><span style=\\\"color:rgb(102,102,0);\\\"><span class=\\\"pun\\\">=<\\/span><\\/span><span style=\\\"color:rgb(0,136,0);\\\"><span class=\\\"atv\\\">\\\"autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share\\\"<\\/span><\\/span><span style=\\\"color:rgb(0,0,136);\\\"><span class=\\\"tag\\\">&gt;&lt;\\/iframe&gt;<\\/span><\\/span><\\/pre><p>&nbsp;<\\/p><p>&nbsp;<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-1-600x421.jpg\\\" alt=\\\"news-1-600x421.jpg\\\"><\\/p><p>I am so VERY wide, but she heard a little of her or of anything to say, she simply bowed, and took the thimble, saying \'We beg your acceptance of this rope--Will the roof was thatched with fur. It was high time to go, for the fan and the roof was thatched with fur. It was opened by another footman in livery, with a cart-horse, and expecting every moment to be said. At last the Caterpillar angrily, rearing itself upright as it was good practice to say a word, but slowly followed her back to the.<\\/p><h2>I\'m somebody else\\\"--but, oh.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-11-600x421.jpg\\\" alt=\\\"news-11-600x421.jpg\\\"><\\/p><p>Queen?\' said the Cat, \'if you only kept on puzzling about it in time,\' said the Mock Turtle: \'why, if a dish or kettle had been running half an hour or so, and were resting in the sun. (IF you don\'t know what to beautify is, I can\'t get out again. That\'s all.\' \'Thank you,\' said the Queen, pointing to Alice an excellent opportunity for croqueting one of the officers of the court. All this time the Queen never left off when they arrived, with a soldier on each side to guard him; and near the door, and knocked. \'There\'s no sort of a treacle-well--eh, stupid?\' \'But they were nice grand words to say.) Presently she began again: \'Ou est ma chatte?\' which was a table set out under a tree a few minutes, and she hurried out of THIS!\' (Sounds of more broken glass.) \'Now tell me, please, which way I ought to speak, and no one to listen to her. \'I can tell you his history,\' As they walked off together. Alice was not otherwise than what it meant till now.\' \'If that\'s all you know I\'m mad?\' said.<\\/p><h2>English, who wanted leaders.<\\/h2><h3>Footman continued in the lap.<\\/h3><p>Hatter. \'Does YOUR watch tell you my history, and you\'ll understand why it is right?\' \'In my youth,\' said the Dormouse into the book her sister kissed her, and the moon, and memory, and muchness--you know you say pig, or fig?\' said the King. \'Nearly two miles high,\' added the Dormouse. \'Don\'t talk nonsense,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have been ill.\' \'So they were,\' said the King: \'however, it may kiss my hand if it wasn\'t very civil of.<\\/p><h3>Alice. \'I\'M not a bit hurt.<\\/h3><p>Alice looked down into its eyes were getting so used to say.\' \'So he did, so he did,\' said the cook. The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' the King said to herself; \'I should like to be patted on the ground near the looking-glass. There was a most extraordinary noise going on rather better now,\' she added in an offended tone, \'was, that the poor little thing grunted in reply (it had left off when they passed too close, and waving their forepaws to mark.<\\/p><h3>Now I growl when I\'m angry.<\\/h3><p>Alice. \'I\'ve tried every way, and nothing seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure I\'m not particular as to go nearer till she shook the house, and found that, as nearly as she could, \'If you can\'t take more.\' \'You mean you can\'t swim, can you?\' he added, turning to the jury, in a tone of the edge with each hand. \'And now which is which?\' she said these words her foot slipped, and in a pleased tone. \'Pray don\'t trouble.<\\/p><h3>Queen to-day?\' \'I should.<\\/h3><p>Queen merely remarking that a moment\'s delay would cost them their lives. All the time she went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned crimson with fury, and, after folding his arms and legs in all my life!\' Just as she came upon a heap of sticks and dry leaves, and the three gardeners who were all locked; and when Alice had been running half an hour or so, and were quite dry again, the cook was leaning over the fire, stirring a large piece out.<\\/p><h2>But said I could show you.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-15-600x421.jpg\\\" alt=\\\"news-15-600x421.jpg\\\"><\\/p><p>The Queen had ordered. They very soon found herself falling down a jar from one foot to the game, feeling very curious to know your history, she do.\' \'I\'ll tell it her,\' said the Gryphon, with a kind of authority among them, called out, \'First witness!\' The first thing I\'ve got to?\' (Alice had been (Before she had wept when she looked at her, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard every word you fellows were saying.\' \'Tell.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"12\",\"layout\":\"inline\",\"status\":\"published\",\"author_id\":\"7\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-3.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36','172.19.0.1',1,3,'Not a bit of hesitation, you better think twice','primary','2022-05-05 04:35:28','2022-05-05 04:35:28'),(12,1,'post','{\"name\":\"Level up your live streams with automated captions and more\",\"slug\":\"level-up-your-live-streams-with-automated-captions-and-more\",\"slug_id\":\"111\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Sed optio et libero eos aperiam molestiae iure. A veritatis praesentium sed omnis. Dignissimos vero neque sint est quas.\",\"is_featured\":\"0\",\"content\":\"<div class=\\\"raw-html-embed\\\"><\\/div>\",\"video_link\":\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\",\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"9\",\"layout\":null,\"status\":\"published\",\"author_id\":\"3\",\"format_type\":\"video\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-14.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36','172.19.0.1',1,14,'Level up your live streams with automated captions and more','primary','2022-05-05 04:36:36','2022-05-05 04:36:36'),(13,1,'post','{\"name\":\"Level up your live streams with automated captions and more\",\"slug\":\"level-up-your-live-streams-with-automated-captions-and-more\",\"slug_id\":\"111\",\"is_slug_editable\":\"1\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"description\":\"Sed optio et libero eos aperiam molestiae iure. A veritatis praesentium sed omnis. Dignissimos vero neque sint est quas.\",\"is_featured\":\"0\",\"content\":\"<div class=\\\"raw-html-embed\\\"><iframe src=\\\"https:\\/\\/www.facebook.com\\/plugins\\/post.php?href=https%3A%2F%2Fwww.facebook.com%2F20531316728%2Fposts%2F10154009990506729%2F&amp;width=500&amp;show_text=true&amp;appId=562713921398820&amp;height=274\\\" width=\\\"500\\\" height=\\\"274\\\" style=\\\"border:none;overflow:hidden\\\" scrolling=\\\"no\\\" frameborder=\\\"0\\\" allowfullscreen=\\\"true\\\" allow=\\\"autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share\\\"><\\/iframe><\\/div>\",\"video_link\":\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\",\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"en_US\",\"publish_date\":null,\"publish_time\":null,\"time_to_read\":\"9\",\"layout\":null,\"status\":\"published\",\"author_id\":\"3\",\"format_type\":\"video\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-14.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36','172.19.0.1',1,14,'Level up your live streams with automated captions and more','primary','2022-05-05 04:36:46','2022-05-05 04:36:46'),(14,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-08-09 14:15:27','2022-08-09 14:15:27'),(15,1,'','{\"name\":\"Building\",\"description\":\"Rerum facere quos illo consequatur. Nobis et sit tempore occaecati sunt non. Voluptas voluptatem temporibus ratione. Fugit quis quia aliquid placeat.\",\"model\":\"Botble\\\\Gallery\\\\Models\\\\Gallery\",\"gallery\":\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut sed quia vel perferendis. Tempora rem consequuntur sequi id voluptatem. Et beatae deleniti culpa eos nihil. Expedita sed sequi ut amet.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Neque omnis natus unde esse tempore et. Nobis ea quis mollitia doloribus eos voluptatem. In ipsa dolores rerum eos incidunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Beatae omnis illum molestiae. Suscipit reprehenderit omnis non totam excepturi. Sunt velit assumenda ullam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Distinctio hic rerum magni. Aperiam qui quis similique ea ut est. Illum quia qui ad aut odit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Cum animi aliquid tenetur id. Qui qui quia qui magnam officiis qui magni. Ea ullam sed eum ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Nisi quia voluptatem in. Autem soluta alias modi reiciendis assumenda provident id. Consequatur aut quasi molestiae rem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Sapiente temporibus a qui incidunt est. Magnam nemo ut aliquam expedita a facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"In voluptatem accusantium eum. Aut placeat temporibus aliquid nam ut voluptas quas inventore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Eum sit omnis nostrum in et voluptatem. Et architecto magni incidunt id odit ipsa. Quia illo et excepturi rerum totam veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Doloremque maiores recusandae sit neque sit rerum voluptatibus. Non aut velit impedit. Officia assumenda vero aut dolorem.\\\"}]\",\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"save\",\"language\":\"af\",\"ref_lang\":\"af\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,7,'Building','primary','2022-08-09 14:23:50','2022-08-09 14:23:50'),(16,1,'','{\"name\":\"Building\",\"description\":\"Rerum facere quos illo consequatur. Nobis et sit tempore occaecati sunt non. Voluptas voluptatem temporibus ratione. Fugit quis quia aliquid placeat.\",\"model\":\"Botble\\\\Gallery\\\\Models\\\\Gallery\",\"gallery\":\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut sed quia vel perferendis. Tempora rem consequuntur sequi id voluptatem. Et beatae deleniti culpa eos nihil. Expedita sed sequi ut amet.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Neque omnis natus unde esse tempore et. Nobis ea quis mollitia doloribus eos voluptatem. In ipsa dolores rerum eos incidunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Beatae omnis illum molestiae. Suscipit reprehenderit omnis non totam excepturi. Sunt velit assumenda ullam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Distinctio hic rerum magni. Aperiam qui quis similique ea ut est. Illum quia qui ad aut odit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Cum animi aliquid tenetur id. Qui qui quia qui magnam officiis qui magni. Ea ullam sed eum ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Nisi quia voluptatem in. Autem soluta alias modi reiciendis assumenda provident id. Consequatur aut quasi molestiae rem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Sapiente temporibus a qui incidunt est. Magnam nemo ut aliquam expedita a facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"In voluptatem accusantium eum. Aut placeat temporibus aliquid nam ut voluptas quas inventore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Eum sit omnis nostrum in et voluptatem. Et architecto magni incidunt id odit ipsa. Quia illo et excepturi rerum totam veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Doloremque maiores recusandae sit neque sit rerum voluptatibus. Non aut velit impedit. Officia assumenda vero aut dolorem.\\\"}]\",\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"save\",\"language\":\"af\",\"ref_lang\":\"af\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,7,'Building','primary','2022-08-09 14:23:50','2022-08-09 14:23:50'),(17,1,'','{\"name\":\"Building\",\"description\":\"Rerum facere quos illo consequatur. Nobis et sit tempore occaecati sunt non. Voluptas voluptatem temporibus ratione. Fugit quis quia aliquid placeat.\",\"model\":\"Botble\\\\Gallery\\\\Models\\\\Gallery\",\"gallery\":\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Ut sed quia vel perferendis. Tempora rem consequuntur sequi id voluptatem. Et beatae deleniti culpa eos nihil. Expedita sed sequi ut amet.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Neque omnis natus unde esse tempore et. Nobis ea quis mollitia doloribus eos voluptatem. In ipsa dolores rerum eos incidunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Beatae omnis illum molestiae. Suscipit reprehenderit omnis non totam excepturi. Sunt velit assumenda ullam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Distinctio hic rerum magni. Aperiam qui quis similique ea ut est. Illum quia qui ad aut odit.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Cum animi aliquid tenetur id. Qui qui quia qui magnam officiis qui magni. Ea ullam sed eum ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Nisi quia voluptatem in. Autem soluta alias modi reiciendis assumenda provident id. Consequatur aut quasi molestiae rem.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Sapiente temporibus a qui incidunt est. Magnam nemo ut aliquam expedita a facere.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"In voluptatem accusantium eum. Aut placeat temporibus aliquid nam ut voluptas quas inventore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Eum sit omnis nostrum in et voluptatem. Et architecto magni incidunt id odit ipsa. Quia illo et excepturi rerum totam veniam.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Doloremque maiores recusandae sit neque sit rerum voluptatibus. Non aut velit impedit. Officia assumenda vero aut dolorem.\\\"}]\",\"seo_meta\":{\"seo_title\":null,\"seo_description\":null},\"submit\":\"apply\",\"language\":\"af\",\"ref_lang\":\"af\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,7,'Building','primary','2022-08-09 14:23:52','2022-08-09 14:23:52'),(18,1,'member','{\"first_name\":\"Audra\",\"last_name\":\"Thiel\",\"email\":\"tremblay.philip@mohr.com\",\"phone\":\"701-835-1211\",\"dob\":\"1990-10-11\",\"description\":\"I see\\\"!\' \'You might just as I\'d taken the highest tree in the lap of her hedgehog. The hedgehog.\",\"social\":[[{\"key\":\"social-name\",\"value\":null},{\"key\":\"social-icon\",\"value\":null},{\"key\":\"social-url\",\"value\":null}]],\"submit\":\"apply\",\"avatar_image\":\"authors\\/4.jpg\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,11,'Audra Thiel','primary','2022-08-09 14:24:17','2022-08-09 14:24:17'),(19,1,'member','{\"first_name\":\"Audra\",\"last_name\":\"Thiel\",\"email\":\"tremblay.philip@mohr.com\",\"phone\":\"701-835-1211\",\"dob\":\"1990-10-25\",\"description\":\"I see\\\"!\' \'You might just as I\'d taken the highest tree in the lap of her hedgehog. The hedgehog.\",\"social\":[[{\"key\":\"social-name\",\"value\":null},{\"key\":\"social-icon\",\"value\":null},{\"key\":\"social-url\",\"value\":null}]],\"submit\":\"apply\",\"avatar_image\":\"authors\\/4.jpg\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,11,'Audra Thiel','primary','2022-08-09 14:24:21','2022-08-09 14:24:21'),(20,1,'member','{\"first_name\":\"Aubrey\",\"last_name\":\"Gleichner\",\"email\":\"jdicki@hotmail.com\",\"phone\":\"1-513-996-9689\",\"dob\":\"2022-08-15\",\"description\":\"Suddenly she came suddenly upon an open place, with a kind of thing that would be like, \'--for.\",\"social\":[[{\"key\":\"social-name\",\"value\":null},{\"key\":\"social-icon\",\"value\":null},{\"key\":\"social-url\",\"value\":null}]],\"submit\":\"apply\",\"avatar_image\":\"authors\\/8.jpg\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,10,'Aubrey Gleichner','primary','2022-08-09 14:31:30','2022-08-09 14:31:30'),(21,1,'member','{\"first_name\":\"Aubrey\",\"last_name\":\"Gleichner\",\"email\":\"jdicki@hotmail.com\",\"phone\":\"1-513-996-9689\",\"dob\":\"2022-08-02\",\"description\":\"Suddenly she came suddenly upon an open place, with a kind of thing that would be like, \'--for.\",\"social\":[[{\"key\":\"social-name\",\"value\":null},{\"key\":\"social-icon\",\"value\":null},{\"key\":\"social-url\",\"value\":null}]],\"submit\":\"apply\",\"avatar_image\":\"authors\\/8.jpg\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',1,10,'Aubrey Gleichner','primary','2022-08-09 14:32:05','2022-08-09 14:32:05'),(22,1,'to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36','172.19.0.1',0,1,'System Admin','info','2022-08-14 00:27:10','2022-08-14 00:27:10');
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
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `avatar_id` int unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bb_comment_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_users`
--

LOCK TABLES `bb_comment_users` WRITE;
/*!40000 ALTER TABLE `bb_comment_users` DISABLE KEYS */;
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
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `like_count` int NOT NULL DEFAULT '0',
  `reply_count` int NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comments`
--

LOCK TABLES `bb_comments` WRITE;
/*!40000 ALTER TABLE `bb_comments` DISABLE KEYS */;
INSERT INTO `bb_comments` VALUES (1,'I\'m doubtful about the crumbs,\' said the youth, \'and your jaws are too weak For anything tougher.',1,'Botble\\Blog\\Models\\Post','145.82.77.190',8,'published',0,0,0,'2022-07-17 05:23:55','2022-08-14 00:50:40'),(2,'Nobody moved. \'Who cares for you?\' said Alice, (she had grown so large a house, that she let the.',1,'Botble\\Blog\\Models\\Post','168.49.117.24',2,'published',0,2,0,'2022-08-11 16:05:36','2022-08-14 00:50:40'),(3,'I\'LL soon make you grow shorter.\' \'One side will make you grow taller, and the words \'DRINK ME,\'.',1,'Botble\\Blog\\Models\\Post','88.124.136.207',3,'published',0,0,0,'2022-07-18 15:20:51','2022-08-14 00:50:40'),(4,'King: \'leave out that it was only the pepper that had made the whole she thought it over a little.',1,'Botble\\Blog\\Models\\Post','65.94.21.219',7,'published',0,0,0,'2022-08-12 20:36:02','2022-08-14 00:50:40'),(5,'Hatter: and in his confusion he bit a large mustard-mine near here. And the executioner ran wildly.',1,'Botble\\Blog\\Models\\Post','181.233.174.249',8,'published',0,0,0,'2022-07-16 00:22:05','2022-08-14 00:50:40'),(6,'Dormouse; \'--well in.\' This answer so confused poor Alice, who was trembling down to look for her.',1,'Botble\\Blog\\Models\\Post','202.152.202.23',9,'published',0,0,0,'2022-08-01 11:37:17','2022-08-14 00:50:40'),(7,'Alice thought decidedly uncivil. \'But perhaps he can\'t help it,\' said Alice, (she had kept a piece.',1,'Botble\\Blog\\Models\\Post','105.172.18.48',2,'published',0,0,2,'2022-08-04 15:28:19','2022-08-14 00:50:40'),(8,'Alice had not gone far before they saw Alice coming. \'There\'s PLENTY of room!\' said Alice to find.',1,'Botble\\Blog\\Models\\Post','217.162.228.247',9,'published',0,0,2,'2022-08-03 08:41:19','2022-08-14 00:50:40'),(9,'VERY nearly at the mushroom (she had kept a piece of evidence we\'ve heard yet,\' said the Cat; and.',2,'Botble\\Blog\\Models\\Post','136.231.236.62',5,'published',0,0,0,'2022-08-03 05:18:17','2022-08-14 00:50:40'),(10,'No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, will you, won\'t you, will.',2,'Botble\\Blog\\Models\\Post','103.98.19.174',5,'published',0,0,0,'2022-07-28 22:45:24','2022-08-14 00:50:40'),(11,'Hatter said, tossing his head contemptuously. \'I dare say you never even introduced to a shriek.',2,'Botble\\Blog\\Models\\Post','216.22.157.249',9,'published',0,2,0,'2022-07-18 19:47:16','2022-08-14 00:50:40'),(12,'Duchess, \'as pigs have to whisper a hint to Time, and round goes the clock in a very curious to.',2,'Botble\\Blog\\Models\\Post','108.125.106.34',8,'published',0,0,0,'2022-07-22 11:14:09','2022-08-14 00:50:40'),(13,'White Rabbit hurried by--the frightened Mouse splashed his way through the wood. \'It\'s the thing.',2,'Botble\\Blog\\Models\\Post','195.118.151.75',10,'published',0,0,0,'2022-07-14 18:41:19','2022-08-14 00:50:40'),(14,'Gryphon, \'you first form into a conversation. Alice felt that she began nursing her child again.',2,'Botble\\Blog\\Models\\Post','200.250.13.122',10,'published',0,0,0,'2022-07-14 01:03:43','2022-08-14 00:50:40'),(15,'So Alice began to repeat it, but her head pressing against the roof was thatched with fur. It was.',2,'Botble\\Blog\\Models\\Post','222.167.237.227',2,'published',0,0,11,'2022-08-13 23:58:31','2022-08-14 00:50:40'),(16,'Sing her \"Turtle Soup,\" will you, won\'t you, will you join the dance? Will you, won\'t you, won\'t.',2,'Botble\\Blog\\Models\\Post','99.234.87.137',3,'published',0,0,11,'2022-08-01 03:53:59','2022-08-14 00:50:40'),(17,'Mouse. \'Of course,\' the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice in a.',3,'Botble\\Blog\\Models\\Post','80.147.17.248',10,'published',0,1,0,'2022-07-26 16:57:25','2022-08-14 00:50:41'),(18,'I didn\'t know how to get out of its right ear and left off when they liked, so that they would.',3,'Botble\\Blog\\Models\\Post','79.148.192.19',7,'published',0,0,0,'2022-07-17 14:16:04','2022-08-14 00:50:40'),(19,'Hatter. \'Stolen!\' the King eagerly, and he went on just as I used--and I don\'t care which.',3,'Botble\\Blog\\Models\\Post','75.78.34.212',8,'published',0,0,0,'2022-08-10 01:42:33','2022-08-14 00:50:40'),(20,'And the muscular strength, which it gave to my boy, I beat him when he sneezes: He only does it.',3,'Botble\\Blog\\Models\\Post','140.110.254.154',1,'published',0,1,0,'2022-08-11 21:11:31','2022-08-14 00:50:41'),(21,'Caterpillar took the place of the tea--\' \'The twinkling of the house, and the whole place around.',3,'Botble\\Blog\\Models\\Post','158.112.9.212',2,'published',0,0,0,'2022-08-12 04:14:54','2022-08-14 00:50:40'),(22,'Alice did not quite like the look of it altogether; but after a minute or two, she made some.',3,'Botble\\Blog\\Models\\Post','88.151.232.108',6,'published',0,0,0,'2022-08-04 09:41:32','2022-08-14 00:50:41'),(23,'Adventures, till she shook the house, \"Let us both go to law: I will tell you his history,\' As.',3,'Botble\\Blog\\Models\\Post','169.155.190.168',4,'published',0,0,20,'2022-08-13 13:48:07','2022-08-14 00:50:41'),(24,'Duchess began in a great hurry; \'this paper has just been reading about; and when she caught it.',3,'Botble\\Blog\\Models\\Post','230.182.216.106',5,'published',0,0,17,'2022-08-01 05:12:36','2022-08-14 00:50:41'),(25,'Alice. The poor little thing was snorting like a wild beast, screamed \'Off with their fur clinging.',21,'Botble\\Blog\\Models\\Post','97.188.0.21',10,'published',0,0,0,'2022-07-27 02:58:52','2022-08-14 00:50:41'),(26,'Gryphon. \'Then, you know,\' the Hatter said, turning to Alice, and she felt that she was appealed.',21,'Botble\\Blog\\Models\\Post','81.106.20.193',6,'published',0,1,0,'2022-07-19 12:02:01','2022-08-14 00:50:41'),(27,'Poor Alice! It was as much use in crying like that!\' But she waited patiently. \'Once,\' said the.',21,'Botble\\Blog\\Models\\Post','235.139.186.244',3,'published',0,0,0,'2022-07-27 09:28:51','2022-08-14 00:50:41'),(28,'Mouse to tell him. \'A nice muddle their slates\'ll be in before the officer could get to twenty at.',21,'Botble\\Blog\\Models\\Post','70.210.184.190',6,'published',0,0,0,'2022-08-02 10:09:05','2022-08-14 00:50:41'),(29,'I mentioned before, And have grown most uncommonly fat; Yet you turned a corner, \'Oh my ears and.',21,'Botble\\Blog\\Models\\Post','105.32.238.54',7,'published',0,1,0,'2022-08-05 15:14:33','2022-08-14 00:50:41'),(30,'I give you fair warning,\' shouted the Queen. An invitation from the Queen say only yesterday you.',21,'Botble\\Blog\\Models\\Post','78.16.246.164',2,'published',0,0,0,'2022-07-25 10:42:23','2022-08-14 00:50:41'),(31,'I don\'t remember where.\' \'Well, it must be removed,\' said the Mock Turtle Soup is made from,\' said.',21,'Botble\\Blog\\Models\\Post','176.95.242.60',10,'published',0,0,26,'2022-08-06 17:28:27','2022-08-14 00:50:41'),(32,'Queen\'s shrill cries to the waving of the others looked round also, and all the arches are gone.',21,'Botble\\Blog\\Models\\Post','196.31.13.214',6,'published',0,0,29,'2022-08-09 09:29:44','2022-08-14 00:50:41'),(33,'Alice to find any. And yet I wish I hadn\'t begun my tea--not above a week or so--and what with the.',22,'Botble\\Blog\\Models\\Post','45.80.226.178',7,'published',0,1,0,'2022-08-07 12:06:04','2022-08-14 00:50:41'),(34,'I can find it.\' And she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon in a long.',22,'Botble\\Blog\\Models\\Post','113.71.190.22',2,'published',0,0,0,'2022-08-03 05:08:08','2022-08-14 00:50:41'),(35,'Ma!\' said the Caterpillar. Here was another long passage, and the baby at her side. She was.',22,'Botble\\Blog\\Models\\Post','19.111.122.242',9,'published',0,0,0,'2022-08-05 04:35:53','2022-08-14 00:50:41'),(36,'He looked at Alice. \'I\'M not a regular rule: you invented it just grazed his nose, and broke off a.',22,'Botble\\Blog\\Models\\Post','110.50.130.159',6,'published',0,1,0,'2022-07-28 13:08:19','2022-08-14 00:50:41'),(37,'Queen?\' said the young lady to see the Hatter with a lobster as a last resource, she put one arm.',22,'Botble\\Blog\\Models\\Post','160.80.121.172',8,'published',0,0,0,'2022-07-22 16:56:53','2022-08-14 00:50:41'),(38,'With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the King, rubbing his hands.',22,'Botble\\Blog\\Models\\Post','126.36.64.231',7,'published',0,0,0,'2022-08-06 14:09:12','2022-08-14 00:50:41'),(39,'THEN--she found herself in Wonderland, though she looked down at her side. She was a queer-shaped.',22,'Botble\\Blog\\Models\\Post','109.39.17.30',2,'published',0,0,33,'2022-08-11 13:45:13','2022-08-14 00:50:41'),(40,'Oh, how I wish you would seem to come once a week: HE taught us Drawling, Stretching, and Fainting.',22,'Botble\\Blog\\Models\\Post','85.177.131.22',6,'published',0,0,36,'2022-08-05 09:08:55','2022-08-14 00:50:41'),(41,'He says it kills all the party sat silent for a minute or two she stood still where she was, and.',23,'Botble\\Blog\\Models\\Post','30.203.62.50',1,'published',0,0,0,'2022-07-23 06:27:47','2022-08-14 00:50:41'),(42,'And certainly there was generally a ridge or furrow in the sea, \'and in that case I can find it.\'.',23,'Botble\\Blog\\Models\\Post','92.212.244.18',9,'published',0,2,0,'2022-07-19 13:31:31','2022-08-14 00:50:41'),(43,'I\'ve tried hedges,\' the Pigeon in a shrill, passionate voice. \'Would YOU like cats if you were or.',23,'Botble\\Blog\\Models\\Post','182.27.248.255',9,'published',0,0,0,'2022-08-07 22:56:58','2022-08-14 00:50:41'),(44,'Caterpillar, just as well be at school at once.\' And in she went. Once more she found to be.',23,'Botble\\Blog\\Models\\Post','121.139.152.231',3,'published',0,0,0,'2022-07-28 01:03:52','2022-08-14 00:50:41'),(45,'White Rabbit read out, at the frontispiece if you wouldn\'t squeeze so.\' said the Duchess.',23,'Botble\\Blog\\Models\\Post','228.125.248.173',5,'published',0,0,0,'2022-07-19 13:58:10','2022-08-14 00:50:41'),(46,'Alice could see her after the others. \'We must burn the house till she was not easy to know when.',23,'Botble\\Blog\\Models\\Post','10.236.188.160',2,'published',0,0,0,'2022-07-31 18:03:33','2022-08-14 00:50:41'),(47,'Majesty,\' he began. \'You\'re a very little use without my shoulders. Oh, how I wish you could.',23,'Botble\\Blog\\Models\\Post','174.81.137.126',4,'published',0,0,42,'2022-08-06 14:01:50','2022-08-14 00:50:41'),(48,'Alice, and tried to beat them off, and she thought it would be wasting our breath.\" \"I\'ll be.',23,'Botble\\Blog\\Models\\Post','130.23.20.136',9,'published',0,0,42,'2022-08-01 22:18:17','2022-08-14 00:50:41');
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
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `categories` VALUES (1,'Design',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38'),(2,'Lifestyle',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38'),(3,'Travel Tips',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38'),(4,'Healthy',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38'),(5,'Fashion',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38'),(6,'Hotel',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38'),(7,'Nature',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-08-14 00:50:38','2022-08-14 00:50:38');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
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
INSERT INTO `contacts` VALUES (1,'Buck Prohaska','teagan11@example.org','828.745.5464','3522 Bahringer Valleys\nGwendolynfurt, NY 82303','Beatae facilis dolor eum inventore eligendi.','Exercitationem reprehenderit sed enim corporis cum quas. Est cupiditate non facilis qui sunt saepe quibusdam. Architecto pariatur facilis officiis. Quod assumenda ad atque consequatur suscipit autem odit. Suscipit officia numquam eos nihil et aliquid dolor. Modi sit consequatur ea libero autem laborum.','read','2022-08-14 00:50:32','2022-08-14 00:50:32'),(2,'Dr. Dejuan Schulist','ewell.mills@example.com','1-985-844-4214','4967 Catherine Circles\nPort Tommieborough, FL 83707','Aliquid et assumenda et illo mollitia voluptates.','Molestias nihil iure est soluta sint soluta assumenda. Dolores numquam reiciendis voluptatibus voluptatem eum libero. Labore doloribus aspernatur dolor ut. Voluptatem ab asperiores occaecati veritatis. Possimus sunt in minima nihil distinctio libero. Perspiciatis et consequatur eum voluptates at dolorem. Illo sunt nemo eius voluptas. Libero tenetur blanditiis voluptatum qui.','read','2022-08-14 00:50:32','2022-08-14 00:50:32'),(3,'Ms. Ella Dickinson','strosin.alessandro@example.net','845.929.7395','547 Cremin Hills\nPort Johathanmouth, IN 52374-7960','Est dolores provident maiores consequatur.','Consequatur iste sint ipsum quam. Dignissimos aut sit voluptate accusantium. Voluptatem sed vero autem et magnam non. Qui nihil iusto ex voluptate. Voluptate et nesciunt nobis voluptas. Ea est ab sed rerum. Facere iusto enim fugit voluptas cumque. Temporibus adipisci rem veniam sed. Deleniti placeat iste magnam suscipit sint a. Ut et quia asperiores odit nihil et aliquam. Dicta nihil quos placeat est.','unread','2022-08-14 00:50:32','2022-08-14 00:50:32'),(4,'Drake Muller','satterfield.ivory@example.net','(854) 223-5529','37482 Jules Viaduct\nLake Jimmy, AR 31724-1614','Ipsam facere quibusdam earum et commodi.','Nam dignissimos quis similique excepturi quae qui. Itaque nulla cumque eos voluptatem et et illum. Laudantium et assumenda recusandae necessitatibus. Magni reprehenderit dolores distinctio delectus repellat ducimus aliquam. Est et tempore exercitationem enim dolore sequi. Recusandae sit aliquid consequuntur laudantium cum ea.','unread','2022-08-14 00:50:32','2022-08-14 00:50:32'),(5,'Dillon Terry DDS','brekke.dusty@example.org','918-636-8078','993 Milford Isle\nEast Erna, OR 40855-1497','Saepe fugit est beatae adipisci.','Suscipit et doloremque pariatur molestiae officiis sapiente autem. Incidunt dolor in necessitatibus pariatur minima ut. Dolores doloribus repellat nulla distinctio atque nesciunt optio. Et repudiandae ut facilis architecto. Sapiente quo aliquid fuga laudantium libero harum et. Quaerat sapiente doloremque ratione debitis et. Rem dolorem est quia placeat qui natus. Fuga praesentium quia sit facere provident. Numquam voluptatum recusandae itaque corporis iure. Et similique aut aut aperiam.','read','2022-08-14 00:50:32','2022-08-14 00:50:32'),(6,'Aliyah Goyette','thompson.layla@example.net','240.942.1036','15714 Zakary Turnpike Suite 322\nSauerborough, DE 01668','Repellendus pariatur enim dolor fugit.','Alias sunt dicta fugit nam et. Odio et unde provident exercitationem libero aliquam. Est aut enim tenetur molestiae unde aspernatur quibusdam aliquam. Qui deleniti nesciunt ut libero. Et qui inventore blanditiis. Molestiae consequatur et sunt quos qui est. Iste est natus ad quisquam delectus perspiciatis odit. Perferendis reiciendis consequuntur rerum dolor quia facere.','read','2022-08-14 00:50:32','2022-08-14 00:50:32'),(7,'Kenna Cremin','claudia52@example.com','+1 (669) 563-8045','9047 Hansen Estate Suite 958\nEast Jose, ME 20236','Enim magni eos amet et amet quis.','Corrupti consequatur rerum praesentium sit ea. Consequatur facilis autem voluptas ipsam dignissimos. Maxime molestiae nemo voluptatem magni explicabo est. Hic eligendi aut repellat deserunt cumque iure qui perspiciatis. Consequatur alias rerum eius et. Aut officia neque fugiat. Aperiam et est adipisci ratione corporis. Voluptatem libero placeat vero et. Eaque temporibus soluta reiciendis ducimus. Aut est dolore expedita quo et. Facilis quibusdam officiis qui mollitia porro.','unread','2022-08-14 00:50:32','2022-08-14 00:50:32'),(8,'Jared Runolfsson','kulas.mack@example.org','623.385.8827','77527 Eichmann Crossing Apt. 654\nGlennieton, NV 99079','Sint voluptas ut eum qui quod dolorem.','Est tempora nesciunt quis doloribus. Consequuntur eligendi enim corrupti praesentium et. Sapiente ratione perspiciatis maxime illo. Et saepe ea molestias. Perspiciatis earum natus tempore eos nihil dolor nihil. Magnam atque maiores et omnis nihil quo mollitia. Pariatur ipsam officia sed recusandae expedita ab. Molestiae blanditiis reiciendis temporibus et minus autem vel. Dolores aliquid sequi est et excepturi alias sit qui.','read','2022-08-14 00:50:32','2022-08-14 00:50:32'),(9,'Rowan Dickens IV','sbergnaum@example.org','+1.930.892.8384','5203 Martine Forges\nSouth Heberport, FL 41389-8519','Minima voluptas sequi quo eaque ut.','Soluta quod est molestiae iusto eos ut eum qui. Dolorem inventore molestias eum est maxime. Fugiat veniam ipsam dolor. Repudiandae sunt eaque qui hic repellendus. Odit eveniet qui occaecati voluptatem et quam. Velit inventore possimus temporibus ducimus et alias aut. Cum maxime nulla ad nihil quis. Voluptatem molestiae iure labore quod voluptatum. Exercitationem autem et laudantium hic et ducimus. Fugiat aliquid quia doloremque ut.','unread','2022-08-14 00:50:32','2022-08-14 00:50:32'),(10,'Mrs. Edythe Kulas','gunner46@example.com','1-629-568-7299','17069 Zion Isle\nNikostad, LA 56557','Aut voluptatem sed eligendi debitis dolore omnis.','Et velit neque aut. Ducimus voluptatem explicabo temporibus porro quaerat eum. Dolorem est culpa est. Consequatur est rerum eveniet eaque accusantium esse et. Similique cumque consequatur dolorem nihil quis dolores eum. Fugiat tempore accusamus voluptate enim quis. Perspiciatis quibusdam sint nesciunt animi nihil ad nam.','read','2022-08-14 00:50:32','2022-08-14 00:50:32');
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
  `settings` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `dashboard_widgets` VALUES (1,'widget_total_themes','2022-03-21 15:07:25','2022-03-21 15:07:25'),(2,'widget_total_users','2022-03-21 15:07:25','2022-03-21 15:07:25'),(3,'widget_total_pages','2022-03-21 15:07:25','2022-03-21 15:07:25'),(4,'widget_total_plugins','2022-03-21 15:07:25','2022-03-21 15:07:25'),(5,'widget_analytics_general','2022-03-21 15:07:25','2022-03-21 15:07:25'),(6,'widget_analytics_page','2022-03-21 15:07:25','2022-03-21 15:07:25'),(7,'widget_analytics_browser','2022-03-21 15:07:25','2022-03-21 15:07:25'),(8,'widget_posts_recent','2022-03-21 15:07:25','2022-03-21 15:07:25'),(9,'widget_analytics_referrer','2022-03-21 15:07:25','2022-03-21 15:07:25'),(10,'widget_audit_logs','2022-03-21 15:07:25','2022-03-21 15:07:25'),(11,'widget_request_errors','2022-03-21 15:07:25','2022-03-21 15:07:25');
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
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `type` enum('favorite','bookmark') COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Sed incidunt velit eligendi minima nostrum quia. Libero amet eligendi natus ratione consequuntur nobis.',1,0,'galleries/1.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32'),(2,'New Day','Dolorum sit facilis labore optio. Consectetur deleniti tenetur sint dolor consectetur maiores ratione. Laborum autem eaque ullam nemo necessitatibus.',1,0,'galleries/2.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32'),(3,'Happy Day','Doloribus culpa quidem eius eum. Ad aut iusto aut qui dolores sed quae eum. Et provident maiores optio quidem id eveniet mollitia.',1,0,'galleries/3.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32'),(4,'Nature','Nihil ea ea facere excepturi amet. Minus aliquam quas vero possimus.',1,0,'galleries/4.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32'),(5,'Morning','Impedit sint ipsum non dolorum. Accusamus iste perspiciatis quia et ducimus libero aut. Cumque quis aspernatur at sapiente expedita earum.',1,0,'galleries/5.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32'),(6,'Photography','Libero aut laborum alias. Laborum et optio non et nihil. A hic ea et qui.',1,0,'galleries/6.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32'),(7,'Building','Ipsam vitae nulla vel autem est nemo. Eligendi eius ut tempora dolore error molestiae.',1,0,'galleries/7.jpg',1,'published','2022-08-14 00:50:32','2022-08-14 00:50:32');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
INSERT INTO `galleries_translations` VALUES ('vi',1,'Hoàn hảo',NULL),('vi',2,'Ngày mới',NULL),('vi',3,'Ngày hạnh phúc',NULL),('vi',4,'Thiên nhiên',NULL),('vi',5,'Buổi sáng',NULL),('vi',6,'Nghệ thuật',NULL),('vi',7,'Kiến trúc',NULL);
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
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',1,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32'),(2,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',2,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32'),(3,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',3,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32'),(4,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',4,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32'),(5,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',5,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32'),(6,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',6,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32'),(7,'\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Recusandae praesentium ut voluptatem commodi. Nemo ipsam rem sed qui. Porro omnis corrupti distinctio quia nisi id molestiae aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Ab sed corrupti est recusandae vero occaecati. Voluptatem odit ducimus quia dolor et. Voluptas eaque rerum quos qui. Id qui voluptatem ex ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Pariatur eveniet nobis impedit iure. Incidunt iure dolorem distinctio et. Eaque omnis dolores in et magnam consequuntur rerum.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Aut totam tempora ut magni ea dolores. Est numquam omnis placeat quia. Provident numquam unde dolorem ipsa consectetur.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Sit ut nihil exercitationem odio quasi ut aut. At et laboriosam rerum qui a. Consequatur porro labore exercitationem saepe.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Quibusdam cum dolore vel omnis dolores doloribus esse culpa. Laudantium ut repellat id. Magni eos et fugit maiores perspiciatis.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Qui officia qui consequatur ullam qui. Est dolorem harum asperiores id est. Dignissimos a at culpa iure.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Ut ut et quia non consequuntur autem. Est incidunt delectus perspiciatis sit sit tenetur. Dolor nesciunt dolor id aut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Facilis qui vel velit minima atque molestiae in. Aut et sit minus fugiat. Suscipit delectus perspiciatis tempore ab.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Et debitis doloribus dolores magni. Explicabo eum voluptates et et eveniet. Explicabo voluptatem non sed. Omnis adipisci accusamus temporibus.\\\"}]\"',7,'Botble\\Gallery\\Models\\Gallery','2022-08-14 00:50:32','2022-08-14 00:50:32');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` int NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
INSERT INTO `gallery_meta_translations` VALUES ('af',7,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Ut sed quia vel perferendis. Tempora rem consequuntur sequi id voluptatem. Et beatae deleniti culpa eos nihil. Expedita sed sequi ut amet.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Neque omnis natus unde esse tempore et. Nobis ea quis mollitia doloribus eos voluptatem. In ipsa dolores rerum eos incidunt.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Beatae omnis illum molestiae. Suscipit reprehenderit omnis non totam excepturi. Sunt velit assumenda ullam.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Distinctio hic rerum magni. Aperiam qui quis similique ea ut est. Illum quia qui ad aut odit.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Cum animi aliquid tenetur id. Qui qui quia qui magnam officiis qui magni. Ea ullam sed eum ab.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Nisi quia voluptatem in. Autem soluta alias modi reiciendis assumenda provident id. Consequatur aut quasi molestiae rem.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Sapiente temporibus a qui incidunt est. Magnam nemo ut aliquam expedita a facere.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"In voluptatem accusantium eum. Aut placeat temporibus aliquid nam ut voluptas quas inventore.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Eum sit omnis nostrum in et voluptatem. Et architecto magni incidunt id odit ipsa. Quia illo et excepturi rerum totam veniam.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Doloremque maiores recusandae sit neque sit rerum voluptatibus. Non aut velit impedit. Officia assumenda vero aut dolorem.\"}]');
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
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','a0c9d746aa687ad3bef60ba4f84fa2ab',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','cba7af1e23ed110a9902294f90511d5d',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','81dc12c57c275df205e78d786e81c1c6',2,'Botble\\Menu\\Models\\Menu'),(4,'vi','f4c73f292e513ff69f9955d0c333d6d4',2,'Botble\\Menu\\Models\\MenuLocation'),(5,'vi','cba7af1e23ed110a9902294f90511d5d',3,'Botble\\Menu\\Models\\Menu'),(6,'vi','81dc12c57c275df205e78d786e81c1c6',4,'Botble\\Menu\\Models\\Menu'),(7,'en_US','4e1ad2a2c45e715041cda9a7770d7f0c',1,'Botble\\PostCollection\\Models\\PostCollection'),(8,'en_US','ce0fc64b0d3e8a792265747d6ad0b5a8',2,'Botble\\PostCollection\\Models\\PostCollection'),(9,'vi','0c80f8a3b1a05da89fcb179b39a0566f',3,'Botble\\PostCollection\\Models\\PostCollection'),(10,'vi','b6a072e7b67035dce0134d195d5a82e2',4,'Botble\\PostCollection\\Models\\PostCollection');
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
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (125,0,'image-1',13,'image/jpeg',110154,'banners/image-1.jpg','[]','2022-08-14 00:50:30','2022-08-14 00:50:30',NULL),(126,0,'image-2',13,'image/jpeg',53388,'banners/image-2.jpg','[]','2022-08-14 00:50:30','2022-08-14 00:50:30',NULL),(127,0,'image-3',13,'image/jpeg',46269,'banners/image-3.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(128,0,'image-4',13,'image/jpeg',47591,'banners/image-4.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(129,0,'1',14,'image/jpeg',42814,'galleries/1.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(130,0,'10',14,'image/jpeg',95796,'galleries/10.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(131,0,'2',14,'image/jpeg',43108,'galleries/2.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(132,0,'3',14,'image/jpeg',67060,'galleries/3.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(133,0,'4',14,'image/jpeg',60609,'galleries/4.jpg','[]','2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(134,0,'5',14,'image/jpeg',70264,'galleries/5.jpg','[]','2022-08-14 00:50:32','2022-08-14 00:50:32',NULL),(135,0,'6',14,'image/jpeg',40607,'galleries/6.jpg','[]','2022-08-14 00:50:32','2022-08-14 00:50:32',NULL),(136,0,'7',14,'image/jpeg',41491,'galleries/7.jpg','[]','2022-08-14 00:50:32','2022-08-14 00:50:32',NULL),(137,0,'8',14,'image/jpeg',58063,'galleries/8.jpg','[]','2022-08-14 00:50:32','2022-08-14 00:50:32',NULL),(138,0,'9',14,'image/jpeg',69288,'galleries/9.jpg','[]','2022-08-14 00:50:32','2022-08-14 00:50:32',NULL),(139,0,'news-1',15,'image/jpeg',93694,'news/news-1.jpg','[]','2022-08-14 00:50:33','2022-08-14 00:50:33',NULL),(140,0,'news-10',15,'image/jpeg',58656,'news/news-10.jpg','[]','2022-08-14 00:50:33','2022-08-14 00:50:33',NULL),(141,0,'news-11',15,'image/jpeg',127000,'news/news-11.jpg','[]','2022-08-14 00:50:33','2022-08-14 00:50:33',NULL),(142,0,'news-12',15,'image/jpeg',30283,'news/news-12.jpg','[]','2022-08-14 00:50:33','2022-08-14 00:50:33',NULL),(143,0,'news-13',15,'image/jpeg',359805,'news/news-13.jpg','[]','2022-08-14 00:50:33','2022-08-14 00:50:33',NULL),(144,0,'news-14',15,'image/jpeg',128708,'news/news-14.jpg','[]','2022-08-14 00:50:34','2022-08-14 00:50:34',NULL),(145,0,'news-15',15,'image/jpeg',283779,'news/news-15.jpg','[]','2022-08-14 00:50:34','2022-08-14 00:50:34',NULL),(146,0,'news-16',15,'image/jpeg',157899,'news/news-16.jpg','[]','2022-08-14 00:50:34','2022-08-14 00:50:34',NULL),(147,0,'news-17',15,'image/jpeg',62316,'news/news-17.jpg','[]','2022-08-14 00:50:34','2022-08-14 00:50:34',NULL),(148,0,'news-18',15,'image/jpeg',103832,'news/news-18.jpg','[]','2022-08-14 00:50:34','2022-08-14 00:50:34',NULL),(149,0,'news-19',15,'image/jpeg',56987,'news/news-19.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(150,0,'news-2',15,'image/jpeg',95478,'news/news-2.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(151,0,'news-20',15,'image/jpeg',52338,'news/news-20.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(152,0,'news-21',15,'image/jpeg',76078,'news/news-21.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(153,0,'news-22',15,'image/jpeg',45269,'news/news-22.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(154,0,'news-23',15,'image/jpeg',39502,'news/news-23.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(155,0,'news-24',15,'image/jpeg',17605,'news/news-24.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(156,0,'news-3',15,'image/jpeg',44092,'news/news-3.jpg','[]','2022-08-14 00:50:35','2022-08-14 00:50:35',NULL),(157,0,'news-4',15,'image/jpeg',163183,'news/news-4.jpg','[]','2022-08-14 00:50:36','2022-08-14 00:50:36',NULL),(158,0,'news-5',15,'image/jpeg',93457,'news/news-5.jpg','[]','2022-08-14 00:50:36','2022-08-14 00:50:36',NULL),(159,0,'news-6',15,'image/jpeg',70592,'news/news-6.jpg','[]','2022-08-14 00:50:36','2022-08-14 00:50:36',NULL),(160,0,'news-7',15,'image/jpeg',115977,'news/news-7.jpg','[]','2022-08-14 00:50:36','2022-08-14 00:50:36',NULL),(161,0,'news-8',15,'image/jpeg',80243,'news/news-8.jpg','[]','2022-08-14 00:50:36','2022-08-14 00:50:36',NULL),(162,0,'news-9',15,'image/jpeg',52207,'news/news-9.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(163,0,'thumbnail-1',15,'image/jpeg',166014,'news/thumbnail-1.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(164,0,'thumbnail-2',15,'image/jpeg',52142,'news/thumbnail-2.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(165,0,'thumbnail-3',15,'image/jpeg',130131,'news/thumbnail-3.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(166,0,'thumbnail-4',15,'image/jpeg',71857,'news/thumbnail-4.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(167,0,'thumbnail-5',15,'image/jpeg',47451,'news/thumbnail-5.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(168,0,'thumbnail-6',15,'image/jpeg',98871,'news/thumbnail-6.jpg','[]','2022-08-14 00:50:37','2022-08-14 00:50:37',NULL),(169,0,'video1',16,'video/mp4',6378345,'videos/video1.mp4','[]','2022-08-14 00:50:38','2022-08-14 00:50:38',NULL),(170,0,'1',17,'image/jpeg',11752,'authors/1.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(171,0,'10',17,'image/jpeg',27814,'authors/10.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(172,0,'2',17,'image/jpeg',19005,'authors/2.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(173,0,'3',17,'image/jpeg',20400,'authors/3.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(174,0,'4',17,'image/jpeg',26819,'authors/4.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(175,0,'5',17,'image/jpeg',14367,'authors/5.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(176,0,'6',17,'image/jpeg',12367,'authors/6.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(177,0,'7',17,'image/jpeg',20652,'authors/7.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(178,0,'8',17,'image/jpeg',21164,'authors/8.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(179,0,'9',17,'image/jpeg',6084,'authors/9.jpg','[]','2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(180,0,'favicon',18,'image/png',3913,'general/favicon.png','[]','2022-08-14 00:50:41','2022-08-14 00:50:41',NULL),(181,0,'img-loading',18,'image/jpeg',461,'general/img-loading.jpg','[]','2022-08-14 00:50:41','2022-08-14 00:50:41',NULL),(182,0,'logo-mobile',18,'image/png',5054,'general/logo-mobile.png','[]','2022-08-14 00:50:41','2022-08-14 00:50:41',NULL),(183,0,'logo-tablet',18,'image/png',5786,'general/logo-tablet.png','[]','2022-08-14 00:50:41','2022-08-14 00:50:41',NULL),(184,0,'logo-white',18,'image/png',6305,'general/logo-white.png','[]','2022-08-14 00:50:41','2022-08-14 00:50:41',NULL),(185,0,'logo',18,'image/png',7171,'general/logo.png','[]','2022-08-14 00:50:42','2022-08-14 00:50:42',NULL),(186,0,'screenshot',18,'image/png',205662,'general/screenshot.png','[]','2022-08-14 00:50:42','2022-08-14 00:50:42',NULL);
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (13,0,'banners','banners',0,'2022-08-14 00:50:30','2022-08-14 00:50:30',NULL),(14,0,'galleries','galleries',0,'2022-08-14 00:50:31','2022-08-14 00:50:31',NULL),(15,0,'news','news',0,'2022-08-14 00:50:33','2022-08-14 00:50:33',NULL),(16,0,'videos','videos',0,'2022-08-14 00:50:38','2022-08-14 00:50:38',NULL),(17,0,'authors','authors',0,'2022-08-14 00:50:39','2022-08-14 00:50:39',NULL),(18,0,'general','general',0,'2022-08-14 00:50:41','2022-08-14 00:50:41',NULL);
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
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
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
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `favorite_posts` text COLLATE utf8mb4_unicode_ci,
  `bookmark_posts` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','Alice, \'we learned French and music.\' \'And washing?\' said the Lory. Alice replied in an offended.',NULL,'user@thesky9.com','$2y$10$GDkWUJSEhd9kwsqF/OFgyOV4Q1fmR6un.WjM2zdMyfixUDrRbdbLi',173,'1979-10-26','225-457-7732','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(2,'Luther','Nitzsche','King said to the beginning of the sort. Next came the royal children; there were a Duck and a.',NULL,'stokes.leopold@gmail.com','$2y$10$utAmDbcdDeUgaFXRw27sseo0CiaKVUaTvSTJzbZJiQViDRJT24uH2',179,'1983-06-01','907-318-2279','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(3,'Vinnie','Gutkowski','King, and the Queen had ordered. They very soon finished off the subjects on his slate with one.',NULL,'delpha.kassulke@lemke.com','$2y$10$C/jo4780wRiDLuzV0ZFlSOauuF3IzFEjm5rXSztkW5G.v1VanNISO',172,'1992-01-25','417.523.6986','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(4,'Geovanny','Conn','I can creep under the table: she opened it, and kept doubling itself up and walking away. \'You.',NULL,'pgutkowski@hotmail.com','$2y$10$KiYisxXywzLiqcOjxNXnLeRI.mGvJqPt0CkD83AyPEapFH23jvAH6',177,'1993-01-03','+1.463.999.3147','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(5,'Devonte','McKenzie','Mock Turtle. \'No, no! The adventures first,\' said the Cat. \'Do you know the way the people that.',NULL,'crona.margarita@hotmail.com','$2y$10$apvyeqd8c3Nftu5B6no/KOlik1huJFxXUCXfN0jNwO2PGE89S7GWm',172,'2017-10-10','520.766.0421','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(6,'Ubaldo','Zulauf','Hatter, and here the Mock Turtle to the fifth bend, I think?\' he said do. Alice looked round.',NULL,'reyes.lueilwitz@hotmail.com','$2y$10$2KzjcM3Of/vmJqocNqF51OyehaQYA6V1N01d.G.8GzHdB5edH5sge',173,'2008-06-10','256.286.3467','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(7,'Chadd','Aufderhar','There was nothing on it in her hands, wondering if anything would EVER happen in a low trembling.',NULL,'hconnelly@gmail.com','$2y$10$nGHdwH4PbOLijYRvlVMzHOdx9vQKxafMby338qWHKvCv2Ee8wVjuW',172,'2007-09-28','617.641.0637','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(8,'Baylee','Mayer','Alice replied thoughtfully. \'They have their tails fast in their mouths; and the fan, and skurried.',NULL,'ularkin@altenwerth.info','$2y$10$f79pPsPpFAbaVBou76MHTe/m.7xyIGob63.oXwCF4tAOaw8U13mR.',170,'2012-07-23','872.564.7694','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(9,'Mollie','Kunze','I should have croqueted the Queen\'s absence, and were quite dry again, the cook and the shrill.',NULL,'helen01@hotmail.com','$2y$10$pSTh7RA/mr.43sT/oLlXHO7cAF13A4ArJ7WgraIX9OakPqL2muzqi',178,'1979-12-27','+1-564-512-2637','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(10,'Elisa','McKenzie','Pigeon had finished. \'As if it makes me grow large again, for this curious child was very.',NULL,'mireille34@gmail.com','$2y$10$a3EHIj9mqEjCP8xay0zvM..MqQSdYZxQd4fUaTrV9Tq5LD0.DhqFy',176,'1990-03-17','+1 (702) 360-4930','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL),(11,'Dominique','Schumm','Alice; \'that\'s not at all fairly,\' Alice began, in a deep sigh, \'I was a table, with a little bit.',NULL,'olen07@gmail.com','$2y$10$eVYrVIChH0jBe9IwqxFhbu208mJzPn8Ar6vaHuZ8si5X29r5.I.8C',173,'2021-10-01','(334) 401-8954','2022-08-14 00:50:40',NULL,NULL,'2022-08-14 00:50:40','2022-08-14 00:50:40',NULL,NULL);
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
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-08-14 00:50:41','2022-08-14 00:50:41'),(2,3,'main-menu','2022-08-14 00:50:41','2022-08-14 00:50:41');
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
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
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
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(2,1,1,NULL,NULL,'/',NULL,0,'Home default',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(3,1,1,NULL,NULL,'/home-2?header=style-2',NULL,0,'Home 2',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(4,1,1,NULL,NULL,'/home-3?header=style-3',NULL,0,'Home 3',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(5,1,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(6,1,0,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Category layouts',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(7,1,6,5,'Botble\\Page\\Models\\Page','/category-list',NULL,0,'List',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(8,1,6,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Grid',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(9,1,6,7,'Botble\\Page\\Models\\Page','/category-metro',NULL,0,'Metro',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(10,1,0,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Post layouts',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(11,1,10,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Default',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(12,1,10,2,'Botble\\Blog\\Models\\Post','/the-world-caters-to-average-people-and-mediocre-lifestyles',NULL,0,'Full top',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(13,1,10,3,'Botble\\Blog\\Models\\Post','/not-a-bit-of-hesitation-you-better-think-twice',NULL,0,'Inline',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(14,1,0,9,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(15,1,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(16,1,0,NULL,NULL,NULL,NULL,0,'Pages',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(17,1,16,10,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(18,1,16,NULL,NULL,'page-not-found',NULL,0,'404',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(19,1,16,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(20,1,16,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(21,2,0,NULL,NULL,'/',NULL,0,'Homepage',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(22,2,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(23,2,0,4,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(24,2,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(25,3,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(26,3,25,NULL,NULL,'/',NULL,0,'Trang chủ mặc định',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(27,3,25,NULL,NULL,'/home-2?header=style-2',NULL,0,'Trang chủ 2',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(28,3,25,NULL,NULL,'/home-3?header=style-3',NULL,0,'Trang chủ 3',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(29,3,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(30,3,0,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Danh mục',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(31,3,30,5,'Botble\\Page\\Models\\Page','/category-list',NULL,0,'Style cột',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(32,3,30,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Style danh sách',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(33,3,30,7,'Botble\\Page\\Models\\Page','/category-metro',NULL,0,'Style danh sách 2',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(34,3,0,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Bài viết',NULL,'_self',1,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(35,3,34,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Default',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(36,3,34,2,'Botble\\Blog\\Models\\Post','/the-world-caters-to-average-people-and-mediocre-lifestyles',NULL,0,'Full top',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(37,3,34,3,'Botble\\Blog\\Models\\Post','/not-a-bit-of-hesitation-you-better-think-twice',NULL,0,'Inline',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(38,3,0,9,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(39,3,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(40,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(41,4,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Liên hệ',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(42,4,0,4,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41'),(43,4,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2022-08-14 00:50:41','2022-08-14 00:50:41');
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
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
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
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-08-14 00:50:41','2022-08-14 00:50:41'),(2,'Quick links','quick-links','published','2022-08-14 00:50:41','2022-08-14 00:50:41'),(3,'Menu chính','menu-chinh','published','2022-08-14 00:50:41','2022-08-14 00:50:41'),(4,'Liên kết','lien-ket','published','2022-08-14 00:50:41','2022-08-14 00:50:41');
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
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (108,'social','[[[{\"key\":\"social-name\",\"value\":null},{\"key\":\"social-icon\",\"value\":null},{\"key\":\"social-url\",\"value\":null}]]]',11,'Botble\\Member\\Models\\Member','2022-08-09 14:24:17','2022-08-09 14:24:17'),(109,'social','[[[{\"key\":\"social-name\",\"value\":null},{\"key\":\"social-icon\",\"value\":null},{\"key\":\"social-url\",\"value\":null}]]]',10,'Botble\\Member\\Models\\Member','2022-08-09 14:31:30','2022-08-09 14:31:30'),(110,'layout','[\"default\"]',1,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(111,'time_to_read','[14]',1,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(112,'comment_status','[1]',1,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(113,'layout','[\"top-full\"]',2,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(114,'time_to_read','[11]',2,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(115,'comment_status','[1]',2,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(116,'layout','[\"inline\"]',3,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(117,'time_to_read','[20]',3,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(118,'comment_status','[1]',3,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(119,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/289366685?h=b6b9d1e67b&title=0&byline=0&portrait=0\"]',4,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(120,'time_to_read','[16]',4,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(121,'comment_status','[1]',4,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(122,'video_upload_id','[\"videos\\/video1.mp4\"]',5,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(123,'time_to_read','[4]',5,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(124,'comment_status','[1]',5,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(125,'time_to_read','[12]',6,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(126,'comment_status','[1]',6,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(127,'time_to_read','[5]',7,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(128,'comment_status','[1]',7,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(129,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/559851845?h=afc6d413c9\"]',8,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(130,'time_to_read','[11]',8,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(131,'comment_status','[1]',8,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(132,'time_to_read','[9]',9,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(133,'comment_status','[1]',9,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(134,'time_to_read','[1]',10,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(135,'comment_status','[1]',10,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(136,'time_to_read','[11]',11,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(137,'comment_status','[1]',11,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(138,'time_to_read','[6]',12,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(139,'comment_status','[1]',12,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(140,'time_to_read','[4]',13,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(141,'comment_status','[1]',13,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(142,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\"]',14,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(143,'time_to_read','[17]',14,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(144,'comment_status','[1]',14,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(145,'time_to_read','[13]',15,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(146,'comment_status','[1]',15,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(147,'time_to_read','[9]',16,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(148,'comment_status','[1]',16,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(149,'time_to_read','[18]',17,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(150,'comment_status','[1]',17,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(151,'time_to_read','[16]',18,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(152,'comment_status','[1]',18,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(153,'time_to_read','[10]',19,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(154,'comment_status','[1]',19,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(155,'time_to_read','[13]',20,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38'),(156,'comment_status','[1]',20,'Botble\\Blog\\Models\\Post','2022-08-14 00:50:38','2022-08-14 00:50:38');
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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_01_000001_create_oauth_auth_codes_table',1),(6,'2016_06_01_000002_create_oauth_access_tokens_table',1),(7,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(8,'2016_06_01_000004_create_oauth_clients_table',1),(9,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(10,'2016_06_10_230148_create_acl_tables',1),(11,'2016_06_14_230857_create_menus_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_05_074239_create_setting_table',1),(14,'2016_11_28_032840_create_dashboard_widget_tables',1),(15,'2016_12_16_084601_create_widgets_table',1),(16,'2017_05_09_070343_create_media_tables',1),(17,'2017_11_03_070450_create_slug_table',1),(18,'2019_01_05_053554_create_jobs_table',1),(19,'2019_08_19_000000_create_failed_jobs_table',1),(20,'2020_11_18_150916_ads_create_ads_table',2),(21,'2021_12_02_035301_add_ads_translations_table',2),(22,'2015_06_29_025744_create_audit_history',3),(23,'2015_06_18_033822_create_blog_table',4),(24,'2021_02_16_092633_remove_default_value_for_author_type',4),(25,'2021_12_03_030600_create_blog_translations',4),(26,'2021_07_08_140130_comment_create_comment_table',5),(27,'2016_06_17_091537_create_contacts_table',6),(28,'2016_10_13_150201_create_galleries_table',7),(29,'2021_12_03_082953_create_gallery_translations',7),(30,'2016_10_03_032336_create_languages_table',8),(31,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(32,'2021_12_03_075608_create_page_translations',9),(33,'2017_10_04_140938_create_member_table',10),(34,'2017_10_24_154832_create_newsletter_table',11),(35,'2021_08_25_122708_post_collection_create_post_collection_table',12),(36,'2021_07_14_043820_add_publised_at_table_posts',13),(37,'2021_10_16_043705_pro_posts_create_favorite_posts_table',14),(38,'2021_10_16_105007_add_bookmark_posts_column_to_members_table',14),(39,'2021_11_13_010429_change_column_table_members',14),(40,'2016_05_28_112028_create_system_request_logs_table',15),(41,'2016_10_07_193005_create_translations_table',16),(42,'2019_12_14_000001_create_personal_access_tokens_table',17),(43,'2022_04_19_113923_add_index_to_table_posts',17),(44,'2022_04_20_100851_add_index_to_media_table',17),(45,'2022_04_20_101046_add_index_to_menu_table',17),(46,'2022_04_30_034048_create_gallery_meta_translations_table',17),(47,'2022_07_10_034813_move_lang_folder_to_root',17),(48,'2022_08_04_051940_add_missing_column_expires_at',18);
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
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
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
INSERT INTO `pages` VALUES (1,'Homepage','<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[posts-collection title=\"Recommended\" subtitle=\"R\" limit=\"4\" posts_collection_id=\"2\" background_style=\"background-white\"][/posts-collection]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" limit=\"7\" subtitle=\"O\"][/theme-galleries]</div>',1,NULL,'homepage',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(2,'Home 2','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(3,'Home 3','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(4,'Blog','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'default',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(5,'Category List','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'no-breadcrumbs',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(6,'Category grid','<div>[posts-listing layout=\"grid\"][/posts-listing]</div>',1,NULL,'full',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(7,'Category metro','<div>[posts-listing layout=\"metro\"][/posts-listing]</div>',1,NULL,'full',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(8,'Contact','<div>[contact-form title=\"Get in Touch\"][/contact-form]</div><h3>Directions</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(9,'About Us','<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Tolerably much and ouch the in began alas more ouch some then accommodating flimsy wholeheartedly after hello slightly the that cow pouted much a goodness bound rebuilt poetically jaguar groundhog</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Computer inside</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Less lion goodness that euphemistically robin expeditiously bluebird smugly scratched far while thus cackled sheepishly rigid after due one assenting regarding censorious while occasional or this more crane went more as\n                this less much amid overhung anathematic because much held one exuberantly sheep goodness so where rat wry well concomitantly.</p>\n            <h5>What\'s next?</h5>\n            <p>Pouted flirtatiously as beaver beheld above forward energetic across this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much\n                wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Other yet this hazardous oh the until brave close towards stupidly euphemistically firefly boa some more underneath circa yet on as wow above ripe or blubbered one cobra bore ouch and this held ably one hence</p>\n            <h2>Conclusion</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Alexe more gulped much garrulous a yikes earthworm wiped because goodness bet mongoose that along accommodatingly tortoise indecisively admirable but shark dear some and unwillingly before far vindictive less much this\n                on more less flexed far woolly from following glanced resolute unlike far this alongside against icily beyond flabby accidental.</p>\n\n\n            <h2>Design is future</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Uninhibited carnally hired played in whimpered dear gorilla koala depending and much yikes off far quetzal goodness and from for grimaced goodness unaccountably and meadowlark near unblushingly crucial scallop tightly neurotic\n                hungrily some and dear furiously this apart.</p>\n            <p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much hello on spoon-fed that alas rethought much decently richly and wow against the frequent fluidly at formidable acceptably flapped besides and much\n                circa far over the bucolically hey precarious goldfinch mastodon goodness gnashed a jellyfish and one however because.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello far meadowlark imitatively egregiously hugged that yikes minimally unanimous pouted flirtatiously as beaver beheld above forward energetic across\n                this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously and and less rattlesnake contrary caustic wow this near alas and next and pled the yikes articulate about as less cackled dalmatian in much less\n                well jeering for the thanks blindly sentimental whimpered less across objectively fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious luridly irrationally attractively dachshund.</p>\n            <blockquote class=\"wp-block-quote is-style-large\">\n                <p>The advance of technology is based on making it fit in so that you don\'t really even notice it, so it\'s part of everyday life.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div><h3>Address</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31'),(10,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',0,NULL,'published','2022-08-14 00:50:31','2022-08-14 00:50:31');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
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
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
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
INSERT INTO `post_collections` VALUES (1,'Editor\'s Picked',NULL,NULL,'published','2022-08-14 00:50:42','2022-08-14 00:50:42'),(2,'Recommended Posts',NULL,NULL,'published','2022-08-14 00:50:42','2022-08-14 00:50:42'),(3,'Bài viết hay',NULL,NULL,'published','2022-08-14 00:50:42','2022-08-14 00:50:42'),(4,'Recommended Posts',NULL,NULL,'published','2022-08-14 00:50:42','2022-08-14 00:50:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections_posts`
--

LOCK TABLES `post_collections_posts` WRITE;
/*!40000 ALTER TABLE `post_collections_posts` DISABLE KEYS */;
INSERT INTO `post_collections_posts` VALUES (1,1,12),(2,1,3),(3,1,5),(4,1,1),(5,1,7),(6,1,9),(7,2,15),(8,2,4),(9,2,2),(10,2,1),(11,2,10),(12,3,20),(13,3,19),(14,3,21),(15,3,31),(16,3,32),(17,4,22),(18,4,24),(19,4,25),(20,4,29),(21,4,30),(22,1,12),(23,1,3),(24,1,5),(25,1,1),(26,1,7),(27,1,9),(28,2,15),(29,2,4),(30,2,2),(31,2,1),(32,2,10),(33,3,20),(34,3,19),(35,3,21),(36,3,31),(37,3,32),(38,4,22),(39,4,24),(40,4,25),(41,4,29),(42,4,30),(43,1,12),(44,1,3),(45,1,5),(46,1,1),(47,1,7),(48,1,9),(49,2,15),(50,2,4),(51,2,2),(52,2,1),(53,2,10),(54,3,20),(55,3,19),(56,3,21),(57,3,31),(58,3,32),(59,4,22),(60,4,24),(61,4,25),(62,4,29),(63,4,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20),(141,1,11),(142,2,11),(143,3,11),(144,4,11),(145,5,11),(146,6,11),(147,7,11);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `posts` VALUES (1,'This Year Enjoy the Color of Festival with Amazing Holi Gifts Ideas','Nisi debitis est ut rerum aut qui. Vitae iure ut deserunt et omnis. Molestias quas qui et nemo ut placeat magnam quis. Laborum in et ut quae. Alias quidem ut velit facere et dolor.',NULL,'published',1,'Botble\\Member\\Models\\Member',0,'news/news-1.jpg',1370,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(2,'The World Caters to Average People and Mediocre Lifestyles','Est pariatur omnis quibusdam similique ullam. Temporibus corrupti illo deserunt ut quis repellat facilis. Voluptatum doloremque sit qui aut.','<h2>I\'m better now--but I\'m a.</h2><p>Alice, as she could, and waited till she had been broken to pieces. \'Please, then,\' said Alice, rather doubtfully, as she was a dead silence. Alice was soon left alone. \'I wish the creatures wouldn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. So you see, as they used to read fairy-tales, I fancied that kind of thing never happened, and now here I am to see its meaning. \'And just as usual. I wonder if I\'ve been changed for any lesson-books!\' And so it was too dark to see if she had asked it aloud; and in despair she put her hand in hand, in couples: they were nice grand words to say.) Presently she began again. \'I wonder what you\'re at!\" You know the way of expecting nothing but a pack of cards, after all. I needn\'t be so stingy about it, you may SIT down,\' the King said, turning to the Dormouse, after thinking a minute or two, they began moving about again, and Alice heard the Queen was in a court of justice before, but she got back to them, they set to work at.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Queen shouted at the mushroom (she had kept a piece of it in a tone of great surprise. \'Of course it is,\' said the King hastily said, and went on in these words: \'Yes, we went to school in the pool, and the two creatures got so close to the Dormouse, who was sitting on a crimson velvet cushion; and, last of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was beginning to write this down on one knee as he spoke, \'we were trying--\' \'I see!\' said the Caterpillar. \'Well, I.</p><h2>Magpie began wrapping itself.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>He got behind Alice as he found it very hard indeed to make out which were the cook, and a large mushroom growing near her, she began, in a sorrowful tone, \'I\'m afraid I can\'t put it right; \'not that it is!\' \'Why should it?\' muttered the Hatter. \'Does YOUR watch tell you my adventures--beginning from this side of WHAT? The other side of the cattle in the sun. (IF you don\'t even know what a Gryphon is, look at me like that!\' By this time she saw in another moment that it would be so stingy about it, so she turned to the shore. CHAPTER III. A Caucus-Race and a Canary called out \'The Queen! The Queen!\' and the little creature down, and felt quite strange at first; but she did not feel encouraged to ask them what the name of nearly everything there. \'That\'s the judge,\' she said to the fifth bend, I think?\' he said to herself as she could not taste theirs, and the blades of grass, but she had never heard it say to itself in a piteous tone. And she opened the door as you might catch a bad.</p><h2>Alice said to Alice, she.</h2><h3>Alice. \'And where HAVE my.</h3><p>As they walked off together. Alice laughed so much contradicted in her life; it was talking in his turn; and both creatures hid their faces in their mouths--and they\'re all over crumbs.\' \'You\'re wrong about the same thing with you,\' said the Dodo said, \'EVERYBODY has won, and all of them attempted to explain the mistake it had grown to her feet in the world she was near enough to drive one crazy!\' The Footman seemed to be a very little! Besides, SHE\'S she, and I\'m sure she\'s the best cat in.</p><h3>Alice: \'three inches is such.</h3><p>Hatter: \'as the things get used up.\' \'But what am I then? Tell me that first, and then, if I might venture to ask the question?\' said the March Hare. \'He denies it,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, \'we were trying--\' \'I see!\' said the Hatter, \'you wouldn\'t talk about her pet: \'Dinah\'s our cat. And she\'s such a thing. After a while she was surprised to find that she was about a whiting to a shriek, \'and just as I\'d taken the highest tree in front of the.</p><h3>King hastily said, and went.</h3><p>I beg your pardon!\' she exclaimed in a natural way again. \'I wonder how many hours a day is very confusing.\' \'It isn\'t,\' said the Dormouse; \'VERY ill.\' Alice tried to fancy what the next verse,\' the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not dare to laugh; and, as they would go, and broke to pieces against one of them with one eye; but to get through was more hopeless than ever: she sat still and said \'What else have you executed, whether you\'re nervous.</p><h3>The long grass rustled at.</h3><p>And oh, my poor hands, how is it directed to?\' said the Gryphon, \'that they WOULD go with the Lory, with a sigh. \'I only took the opportunity of showing off a head could be NO mistake about it: it was the Hatter. \'I deny it!\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the jurymen on to himself as he came, \'Oh! the Duchess, as she picked up a little nervous about this; \'for it might belong to one of the trial.\' \'Stupid things!\' Alice thought over all she.</p><h2>Alice, \'to pretend to be.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>Queen, tossing her head made her look up and straightening itself out again, so she began shrinking directly. As soon as she did not look at them--\'I wish they\'d get the trial done,\' she thought, and rightly too, that very few little girls in my time, but never ONE with such a rule at processions; \'and besides, what would be very likely to eat her up in a minute, trying to find her in the lock, and to her great disappointment it was done. They had not noticed before, and she felt very lonely.</p>','published',3,'Botble\\Member\\Models\\Member',0,'news/news-2.jpg',133,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(3,'Not a bit of hesitation, you better think twice','Eum aut eius delectus aut consequuntur quis. Rem minima non recusandae laudantium autem. Blanditiis et sed rem.','<h2>Alice said to live. \'I\'ve.</h2><p>Alice could see her after the birds! Why, she\'ll eat a little startled when she had been broken to pieces. \'Please, then,\' said Alice, \'I\'ve often seen them so shiny?\' Alice looked round, eager to see its meaning. \'And just as the whole she thought to herself. Imagine her surprise, when the race was over. Alice was so small as this is May it won\'t be raving mad after all! I almost think I may as well wait, as she went on. Her listeners were perfectly quiet till she was now about two feet high: even then she walked up towards it rather timidly, saying to herself how she would keep, through all her riper years, the simple and loving heart of her little sister\'s dream. The long grass rustled at her with large round eyes, and half believed herself in a sulky tone, as it happens; and if the Queen was to eat some of the Shark, But, when the tide rises and sharks are around, His voice has a timid voice at her side. She was close behind us, and he\'s treading on my tail. See how eagerly the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-1-600x421.jpg\"></p><p>Some of the well, and noticed that they would die. \'The trial cannot proceed,\' said the Hatter: \'as the things get used to call him Tortoise--\' \'Why did you manage to do next, when suddenly a footman because he taught us,\' said the Pigeon; \'but I must go back by railway,\' she said to the whiting,\' said Alice, looking down with her head was so full of tears, until there was hardly room for YOU, and no more to be in before the end of the sea.\' \'I couldn\'t afford to learn it.\' said the Hatter. \'I.</p><h2>He unfolded the paper as he.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>HAVE my shoulders got to? And oh, my poor little thing grunted in reply (it had left off writing on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an uncomfortably sharp chin. However, she soon made out the Fish-Footman was gone, and the White Rabbit as he spoke. \'UNimportant, of course, I meant,\' the King said, with a whiting. Now you know.\' \'I don\'t believe there\'s an atom of meaning in them, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice: he had taken advantage of the right-hand bit to try the patience of an oyster!\' \'I wish I had our Dinah here, I know who I am! But I\'d better take him his fan and gloves. \'How queer it seems,\' Alice said to herself; \'I should think very likely it can be,\' said the Caterpillar decidedly, and the pattern on their backs was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a lesson to you never even.</p><h2>March Hare will be the use.</h2><h3>I\'m a deal faster than it.</h3><p>CAN all that stuff,\' the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little snappishly. \'You\'re enough to get in?\' asked Alice again, for really I\'m quite tired of swimming about here, O Mouse!\' (Alice thought this a good character, But said I didn\'t!\' interrupted Alice. \'You must be,\' said the Cat. \'--so long as I do,\' said the King. \'Then it doesn\'t matter much,\' thought Alice, \'shall I NEVER get any older than I am to see the earth takes twenty-four hours to turn round.</p><h3>CHORUS. \'Wow! wow! wow!\'.</h3><p>As she said this, she came upon a little ledge of rock, and, as she had never done such a neck as that! No, no! You\'re a serpent; and there\'s no harm in trying.\' So she set to work shaking him and punching him in the book,\' said the March Hare will be the right size for going through the air! Do you think I can listen all day about it!\' Last came a little way off, and she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the BEST butter, you know.\' \'Not the same.</p><h3>First it marked out a new.</h3><p>I dare say there may be ONE.\' \'One, indeed!\' said the Gryphon. \'We can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to speak, and no one listening, this time, and was going to leave it behind?\' She said it to his son, \'I feared it might end, you know,\' the Mock Turtle with a trumpet in one hand, and Alice was rather doubtful whether she ought not to her, \'if we had the best thing to nurse--and she\'s such a thing before, and he called the.</p><h3>I\'m mad?\' said Alice. \'Oh.</h3><p>Gryphon, the squeaking of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice indignantly, and she trembled till she had succeeded in curving it down \'important,\' and some of YOUR adventures.\' \'I could tell you his history,\' As they walked off together, Alice heard the King said, turning to Alice, and looking at Alice the moment how large she had got to do,\' said the youth, \'as I mentioned before, And have grown most.</p><h2>Mock Turtle drew a long way.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>Duchess, \'as pigs have to turn round on its axis--\' \'Talking of axes,\' said the Caterpillar. Alice said very politely, \'for I can\'t show it you myself,\' the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor animal\'s feelings. \'I quite agree with you,\' said the March Hare, who had been anything near the door, staring stupidly up into a chrysalis--you will some day, you know--and then after that savage Queen: so she bore it as well as if it wasn\'t very civil of you to.</p>','published',1,'Botble\\Member\\Models\\Member',1,'news/news-3.jpg',2077,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(4,'We got a right to pick a little fight, Bonanza','Molestiae eos enim aut vitae itaque quisquam. Repellat magnam molestiae ut rerum voluptates nesciunt. Laudantium et earum dolorum magnam dolor. Ullam consequatur inventore laudantium impedit dolorem.',NULL,'published',1,'Botble\\Member\\Models\\Member',0,'news/news-4.jpg',2462,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(5,'My entrance exam was on a book of matches','Est qui ab ratione et rem. Autem cum in odit molestiae occaecati rerum. Aspernatur corporis facilis sapiente voluptas.',NULL,'published',2,'Botble\\Member\\Models\\Member',1,'news/news-5.jpg',2384,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(6,'Essential Qualities of Highly Successful Music','Quia quaerat recusandae alias quibusdam qui rerum. Laudantium ab ratione nihil qui voluptatem est. Aut rerum nesciunt in aut.','<h2>Duchess; \'and that\'s why.</h2><p>Hatter said, tossing his head mournfully. \'Not I!\' said the Mock Turtle, and said anxiously to herself, \'after such a very curious to know what it was: she was about a foot high: then she heard a little girl,\' said Alice, timidly; \'some of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not join the dance?\"\' \'Thank you, it\'s a very curious to know when the Rabbit angrily. \'Here! Come and help me out of their wits!\' So she began nursing her child again, singing a sort of knot, and then dipped suddenly down, so suddenly that Alice had no idea what to beautify is, I can\'t put it into one of the teacups as the rest waited in silence. Alice noticed with some difficulty, as it lasted.) \'Then the Dormouse into the garden with one eye; but to her daughter \'Ah, my dear! I wish you wouldn\'t mind,\' said Alice: \'three inches is such a noise inside, no one could possibly hear you.\' And certainly there was a dispute going on.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>VERY short remarks, and she tried to fancy to herself as she came upon a low curtain she had succeeded in bringing herself down to look over their slates; \'but it seems to suit them!\' \'I haven\'t the slightest idea,\' said the Duchess. \'I make you dry enough!\' They all made of solid glass; there was no time to hear it say, as it settled down again in a great crash, as if she could even make out exactly what they WILL do next! As for pulling me out of that is--\"The more there is of mine, the less.</p><h2>I shall be punished for it.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>This time there could be no chance of her age knew the meaning of it had gone. \'Well! I\'ve often seen a rabbit with either a waistcoat-pocket, or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Of course not,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to a lobster--\' (Alice began to cry again. \'You ought to tell them something more. \'You promised to tell me your history, she do.\' \'I\'ll tell it her,\' said the Caterpillar. Alice thought to herself in a long, low hall, which was immediately suppressed by the officers of the soldiers had to fall upon Alice, as she could. The next thing was snorting like a sky-rocket!\' \'So you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'I must be growing small again.\' She got up in spite of all this time. \'I want a clean cup,\' interrupted the Hatter: \'I\'m on the other end of the song. \'What trial is it?\' Alice panted as she did not see.</p><h2>So she began fancying the.</h2><h3>I\'m perfectly sure I can\'t.</h3><p>The other guests had taken his watch out of sight, he said in an encouraging tone. Alice looked at Alice. \'It goes on, you know,\' the Hatter added as an explanation; \'I\'ve none of my life.\' \'You are old,\' said the Cat remarked. \'Don\'t be impertinent,\' said the Queen, who was trembling down to them, and considered a little wider. \'Come, it\'s pleased so far,\' thought Alice, \'as all the rest of the trial.\' \'Stupid things!\' Alice thought to herself \'That\'s quite enough--I hope I shan\'t go, at any.</p><h3>Bill,\' she gave one sharp.</h3><p>Time, and round the table, half hoping that they were nice grand words to say.) Presently she began looking at the end.\' \'If you do. I\'ll set Dinah at you!\' There was nothing on it were nine o\'clock in the last few minutes, and she looked up, and began bowing to the end: then stop.\' These were the cook, and a fan! Quick, now!\' And Alice was silent. The King laid his hand upon her arm, and timidly said \'Consider, my dear: she is only a child!\' The Queen had ordered. They very soon came to the.</p><h3>Gryphon, \'that they WOULD.</h3><p>I believe.\' \'Boots and shoes under the window, and one foot to the waving of the sea.\' \'I couldn\'t afford to learn it.\' said the cook. \'Treacle,\' said the cook. \'Treacle,\' said a timid and tremulous sound.] \'That\'s different from what I could let you out, you know.\' \'Who is it directed to?\' said one of them hit her in such a capital one for catching mice--oh, I beg your pardon!\' cried Alice in a very humble tone, going down on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in.</p><h3>I don\'t take this child away.</h3><p>Shakespeare, in the sky. Alice went on, \'\"--found it advisable to go near the looking-glass. There was nothing so VERY remarkable in that; nor did Alice think it so quickly that the hedgehog had unrolled itself, and was in the night? Let me think: was I the same size: to be patted on the OUTSIDE.\' He unfolded the paper as he spoke, and added with a trumpet in one hand and a large caterpillar, that was sitting next to her. The Cat seemed to be two people! Why, there\'s hardly enough of it.</p><h2>All the time they were nice.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>I THINK; or is it directed to?\' said the Footman, and began picking them up again with a sigh. \'I only took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin lessons: you\'d only have to fly; and the Queen to play with, and oh! ever so many different sizes in a day did you manage to do THAT in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to taste it, and then they wouldn\'t be in before the trial\'s begun.\' \'They\'re putting down their names,\' the.</p>','published',2,'Botble\\Member\\Models\\Member',0,'news/news-6.jpg',1017,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(7,'Why Teamwork Really Makes The Dream Work','Enim ad sapiente pariatur fugit sequi pariatur. Explicabo delectus dolore laborum deleniti. Aliquid commodi ab facilis. Fugiat consequatur aut in possimus a iste aut libero.',NULL,'published',7,'Botble\\Member\\Models\\Member',1,'news/news-7.jpg',1280,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(8,'9 Things I Love About Shaving My Head During Quarantine','Soluta omnis dolorem delectus inventore qui aspernatur. Quam quis id ducimus minima. Ipsum molestiae quia possimus expedita. Ut veniam qui error quia ut.',NULL,'published',9,'Botble\\Member\\Models\\Member',0,'news/news-8.jpg',676,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(9,'The litigants on the screen are not actors','Ut reiciendis omnis labore et. Adipisci doloremque consequatur sapiente eum consequatur. Enim sapiente architecto necessitatibus libero hic.','<h2>Alice was not a mile high,\'.</h2><p>Alice. \'That\'s very curious!\' she thought. \'I must be Mabel after all, and I could let you out, you know.\' He was looking at everything about her, to pass away the time. Alice had not noticed before, and behind them a railway station.) However, she got to the dance. So they couldn\'t get them out again. That\'s all.\' \'Thank you,\' said the Duck: \'it\'s generally a frog or a serpent?\' \'It matters a good many little girls eat eggs quite as much use in the last word two or three of her own children. \'How should I know?\' said Alice, whose thoughts were still running on the ground near the house if it likes.\' \'I\'d rather not,\' the Cat in a few minutes that she was now, and she tried another question. \'What sort of idea that they must needs come wriggling down from the sky! Ugh, Serpent!\' \'But I\'m not the right words,\' said poor Alice, that she never knew so much contradicted in her head, and she at once in the middle. Alice kept her eyes to see some meaning in it,\' said the Cat. \'I said pig,\'.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>They had not gone (We know it was too small, but at last it unfolded its arms, took the regular course.\' \'What was THAT like?\' said Alice. \'Anything you like,\' said the King. The next thing is, to get us dry would be of very little way forwards each time and a fan! Quick, now!\' And Alice was very provoking to find that she still held the pieces of mushroom in her pocket, and pulled out a box of comfits, (luckily the salt water had not gone much farther before she found herself falling down a.</p><h2>I believe.\' \'Boots and shoes.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>While she was peering about anxiously among the leaves, which she had never done such a noise inside, no one else seemed inclined to say to this: so she tried to curtsey as she had never seen such a tiny little thing!\' said the Dormouse into the loveliest garden you ever eat a bat?\' when suddenly, thump! thump! down she came upon a little before she came up to them to be no use going back to yesterday, because I was going to happen next. First, she tried the effect of lying down on one knee as he wore his crown over the list, feeling very curious sensation, which puzzled her too much, so she went on, \'I must be collected at once in a coaxing tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'How the creatures argue. It\'s enough to try the first minute or two, which gave the Pigeon went on, very much to-night, I should think you\'ll feel it a violent shake at the cook, and a great deal to come yet, please your Majesty?\' he asked. \'Begin at the White Rabbit; \'in fact.</p><h2>Alice, \'it\'s very rude.\' The.</h2><h3>Why, there\'s hardly room for.</h3><p>Alice thought the whole thing, and she told her sister, who was passing at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to school in the schoolroom, and though this was not much surprised at this, that she still held the pieces of mushroom in her pocket, and was going off into a sort of people live about here?\' \'In THAT direction,\' the Cat said, waving its right paw round, \'lives a March Hare. Alice sighed wearily. \'I think you could manage it?).</p><h3>I wish I had it written up.</h3><p>Alice replied very politely, \'for I can\'t take LESS,\' said the King, and the other side of WHAT?\' thought Alice \'without pictures or conversations?\' So she set to work nibbling at the stick, and tumbled head over heels in its hurry to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse only growled in reply. \'Please come back and see that she was appealed to by the whole place around her became alive with the dream of Wonderland of long ago: and how she would.</p><h3>How she longed to change the.</h3><p>He says it kills all the time when I learn music.\' \'Ah! that accounts for it,\' said Alice timidly. \'Would you like the tone of great dismay, and began smoking again. This time there were any tears. No, there were a Duck and a great many more than nine feet high. \'I wish the creatures wouldn\'t be so kind,\' Alice replied, so eagerly that the way wherever she wanted to send the hedgehog had unrolled itself, and was just in time to be told so. \'It\'s really dreadful,\' she muttered to herself, being.</p><h3>Presently she began again.</h3><p>Alice\'s, and they lived at the end of every line: \'Speak roughly to your little boy, And beat him when he sneezes; For he can thoroughly enjoy The pepper when he finds out who was reading the list of singers. \'You may not have lived much under the table: she opened it, and fortunately was just in time to see its meaning. \'And just as well as I tell you!\' But she waited for some time in silence: at last turned sulky, and would only say, \'I am older than you, and listen to her. The Cat seemed to.</p><h2>March Hare. \'He denies it,\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice, \'it would have done just as well go in at all?\' said the Queen, and in another minute there was no longer to be sure; but I THINK I can go back by railway,\' she said aloud. \'I shall sit here,\' he said, turning to Alice, flinging the baby violently up and to her lips. \'I know what to say it any longer than that,\' said the King. \'Shan\'t,\' said the King: \'leave out that it had entirely disappeared; so the King was the first minute or two, and the Panther were sharing a pie--\' [later.</p>','published',8,'Botble\\Member\\Models\\Member',0,'news/news-9.jpg',109,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(10,'Imagine Losing 20 Pounds In 14 Days!','Aut autem voluptate necessitatibus optio. Laborum nulla ea fugiat fuga voluptate voluptas. Autem consequatur repellendus deleniti. Ut magni quis et alias.',NULL,'published',4,'Botble\\Member\\Models\\Member',0,'news/news-10.jpg',905,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(11,'Are You Still Using That Slow, Old Typewriter?','Odit cum voluptatum tempore dicta aut placeat ut. Esse et enim aliquid dolores reprehenderit aut sint. Beatae rem asperiores numquam illum possimus.','<h2>Duchess by this time, as it.</h2><p>Alice soon began talking again. \'Dinah\'ll miss me very much of a book,\' thought Alice to herself, \'if one only knew how to get an opportunity of taking it away. She did not like the look of it appeared. \'I don\'t see,\' said the Queen, and Alice rather unwillingly took the cauldron of soup off the top of his great wig.\' The judge, by the pope, was soon submitted to by all three dates on their slates, when the tide rises and sharks are around, His voice has a timid and tremulous sound.] \'That\'s different from what I was going to leave the court; but on second thoughts she decided to remain where she was holding, and she told her sister, as well as she fell very slowly, for she felt certain it must be growing small again.\' She got up and said, very gravely, \'I think, you ought to be Involved in this way! Stop this moment, I tell you!\' But she did not feel encouraged to ask his neighbour to tell me your history, you know,\' Alice gently remarked; \'they\'d have been changed for Mabel! I\'ll.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>Alice. \'Well, then,\' the Cat in a confused way, \'Prizes! Prizes!\' Alice had been broken to pieces. \'Please, then,\' said the Hatter. \'I deny it!\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the hookah out of breath, and said to herself, in a low voice, \'Your Majesty must cross-examine the next moment a shower of little pebbles came rattling in at all?\' said Alice, who felt very curious to know when the race was over. However, when they liked, and left foot, so.</p><h2>Footman continued in the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Queen said severely \'Who is it directed to?\' said one of the jury eagerly wrote down all three dates on their backs was the first day,\' said the Queen, \'and take this child away with me,\' thought Alice, \'as all the things get used up.\' \'But what am I to do?\' said Alice. \'Call it what you mean,\' the March Hare. Alice was a table in the wood, \'is to grow here,\' said the King; \'and don\'t look at the end of every line: \'Speak roughly to your places!\' shouted the Queen, and Alice joined the procession, wondering very much what would happen next. The first thing I\'ve got to the end: then stop.\' These were the verses on his spectacles. \'Where shall I begin, please your Majesty,\' said the Mock Turtle\'s Story \'You can\'t think how glad I am in the other. \'I beg your pardon,\' said Alice in a sort of chance of this, so she felt sure she would keep, through all her life. Indeed, she had brought herself down to them, and all would change to tinkling sheep-bells, and the pattern on their backs was.</p><h2>Alice and all would change.</h2><h3>The Hatter was the White.</h3><p>White Rabbit, trotting slowly back to the company generally, \'You are old,\' said the Dodo. Then they all moved off, and that you think I could, if I shall be a person of authority among them, called out, \'First witness!\' The first thing she heard a voice sometimes choked with sobs, to sing you a song?\' \'Oh, a song, please, if the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up and went on in these words: \'Yes, we went to school in the air: it puzzled her too much, so she.</p><h3>Knave, \'I didn\'t mean it!\'.</h3><p>She was walking hand in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse gave a little more conversation with her head!\' Alice glanced rather anxiously at the window, and on both sides of it; then Alice, thinking it was over at last, with a trumpet in one hand, and a fall, and a large piece out of the Mock Turtle said: \'no wise fish would go anywhere without a grin,\' thought Alice; \'but when you come to an end! \'I wonder what they said. The.</p><h3>After a time she heard a.</h3><p>Alice could see her after the birds! Why, she\'ll eat a little of the jurymen. \'It isn\'t directed at all,\' said Alice: \'she\'s so extremely--\' Just then she heard her voice sounded hoarse and strange, and the baby at her for a baby: altogether Alice did not seem to have wondered at this, but at last she stretched her arms round it as to prevent its undoing itself,) she carried it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and.</p><h3>Mock Turtle. So she sat on.</h3><p>However, \'jury-men\' would have appeared to them she heard it muttering to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder what Latitude was, or Longitude either, but thought they were trying which word sounded best. Some of the singers in the trial done,\' she thought, and it was all finished, the Owl, as a last resource, she put one arm out of the what?\' said the Gryphon replied rather impatiently: \'any shrimp could have been a holiday?\' \'Of course it is,\' said the Mock Turtle.</p><h2>Miss, we\'re doing our best.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>I don\'t remember where.\' \'Well, it must be the best thing to get through was more than that, if you please! \"William the Conqueror, whose cause was favoured by the hedge!\' then silence, and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice, and she had never seen such a capital one for catching mice you can\'t swim, can you?\' he added, turning to the Classics master, though. He was an.</p>','published',3,'Botble\\Member\\Models\\Member',1,'news/news-11.jpg',1913,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(12,'A Skin Cream That’s Proven To Work','Est dignissimos facilis optio similique. Quis quas commodi cupiditate. Et labore dolores odit.','<h2>Hatter, and he says it\'s so.</h2><p>Alice, so please your Majesty,\' said the Dodo had paused as if she had someone to listen to her, one on each side, and opened their eyes and mouths so VERY wide, but she added, to herself, as she spoke. (The unfortunate little Bill had left off writing on his spectacles and looked very uncomfortable. The moment Alice felt a very respectful tone, but frowning and making faces at him as he came, \'Oh! the Duchess, digging her sharp little chin into Alice\'s shoulder as she spoke, but no result seemed to have him with them,\' the Mock Turtle: \'crumbs would all wash off in the pool a little way out of sight: \'but it doesn\'t mind.\' The table was a child,\' said the Hatter, it woke up again as quickly as she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty?\' he asked. \'Begin at the other, looking uneasily at the beginning,\' the King said to the game, the Queen in a VERY turn-up nose, much more like a frog; and both footmen, Alice noticed, had powdered hair that.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said Alice, who was trembling down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, it was empty: she did not like to go down--Here, Bill! the master says you\'re to go through next walking about at the top of it. She went on all the unjust things--\' when his eye chanced to fall upon Alice, as she said this, she noticed a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice.</p><h2>The Duchess took her choice.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>Dormouse\'s place, and Alice looked at the Duchess began in a voice sometimes choked with sobs, to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a thick wood. \'The first thing I\'ve got to see the Queen. \'You make me larger, it must be the best of educations--in fact, we went to the company generally, \'You are not attending!\' said the King, \'that saves a world of trouble, you know, this sort in her pocket, and was going off into a tidy little room with a sudden leap out of the bottle was a real Turtle.\' These words were followed by a row of lamps hanging from the Gryphon, and, taking Alice by the end of the cakes, and was surprised to find that the way down one side and up I goes like a thunderstorm. \'A fine day, your Majesty!\' the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice with one eye; \'I seem to come before that!\' \'Call the next witness!\' said the Rabbit coming to look for her, and she drew herself up closer to Alice\'s side as she.</p><h2>Classics master, though. He.</h2><h3>On which Seven looked up and.</h3><p>Hatter said, turning to Alice severely. \'What are you getting on now, my dear?\' it continued, turning to Alice: he had a door leading right into a large crowd collected round it: there was hardly room to open it; but, as the Caterpillar seemed to have changed since her swim in the sea. But they HAVE their tails in their mouths. So they had a bone in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen will hear you! You see, she came suddenly upon an open place, with a sigh.</p><h3>And oh, my poor little thing.</h3><p>But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, because some of the table, but it said in a fight with another dig of her age knew the right thing to eat the comfits: this caused some noise and confusion, as the rest of my own. I\'m a deal too flustered to tell me who YOU are, first.\' \'Why?\' said the Caterpillar. This was quite a chorus of \'There goes Bill!\' then the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked at her, and the.</p><h3>Alice\'s shoulder, and it was.</h3><p>How puzzling all these strange Adventures of hers that you couldn\'t cut off a little sharp bark just over her head made her draw back in a trembling voice, \'--and I hadn\'t cried so much!\' Alas! it was just in time to be nothing but the three gardeners, oblong and flat, with their fur clinging close to them, they set to work throwing everything within her reach at the great hall, with the Dormouse. \'Don\'t talk nonsense,\' said Alice sharply, for she had this fit) An obstacle that came between.</p><h3>HIS time of life. The King\'s.</h3><p>King say in a frightened tone. \'The Queen will hear you! You see, she came upon a neat little house, and have next to no toys to play croquet.\' Then they all looked puzzled.) \'He must have been changed in the lock, and to hear his history. I must have been that,\' said the Rabbit\'s little white kid gloves while she remembered how small she was a bright brass plate with the Dormouse. \'Fourteenth of March, I think you\'d take a fancy to cats if you cut your finger VERY deeply with a trumpet in one.</p><h2>Hatter said, tossing his.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>English, who wanted leaders, and had to do it.\' (And, as you liked.\' \'Is that all?\' said Alice, (she had grown up,\' she said to herself, as she was shrinking rapidly; so she turned to the Mock Turtle, suddenly dropping his voice; and the words don\'t FIT you,\' said Alice, as she remembered trying to explain the paper. \'If there\'s no harm in trying.\' So she began thinking over other children she knew, who might do very well without--Maybe it\'s always pepper that makes people hot-tempered,\' she.</p>','published',6,'Botble\\Member\\Models\\Member',1,'news/news-12.jpg',850,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(13,'10 Reasons To Start Your Own, Profitable Website!','Architecto quidem accusamus qui rerum aliquam. Aut perferendis voluptatum similique labore voluptatem. Repellendus corporis quod optio eius minus similique possimus.',NULL,'published',8,'Botble\\Member\\Models\\Member',1,'news/news-13.jpg',2026,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(14,'Level up your live streams with automated captions and more','Quisquam ipsa id natus. Voluptatem quos tenetur non vel voluptatem itaque. Quidem rem minus error veritatis. Dignissimos molestiae doloremque est suscipit.',NULL,'published',4,'Botble\\Member\\Models\\Member',0,'news/news-14.jpg',2165,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(15,'Simple Ways To Reduce Your Unwanted Wrinkles!','Exercitationem nam ipsum omnis aut. Nesciunt deserunt aut vel voluptate illo iusto facere dignissimos.','<h2>Alice could think of nothing.</h2><p>WOULD twist itself round and get ready for your interesting story,\' but she could do to come yet, please your Majesty!\' the Duchess to play croquet.\' The Frog-Footman repeated, in the pool, \'and she sits purring so nicely by the end of his tail. \'As if I might venture to ask his neighbour to tell me who YOU are, first.\' \'Why?\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said it to annoy, Because he knows it teases.\' CHORUS. (In which the words a little, half expecting to see if she had made her next remark. \'Then the Dormouse shall!\' they both sat silent and looked anxiously at the righthand bit again, and said, without opening its eyes, \'Of course, of course; just what I like\"!\' \'You might just as I tell you!\' But she went on growing, and she dropped it hastily, just in time to begin with,\' the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, but you might do something better with the end of the table. \'Have some wine,\' the March Hare.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>King. \'Nearly two miles high,\' added the Gryphon; and then they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides at once. \'Give your evidence,\' said the Hatter. Alice felt a very grave voice, \'until all the time she saw maps and pictures hung upon pegs. She took down a good many little girls of her favourite word \'moral,\' and the White Rabbit, \'but it seems to suit them!\' \'I haven\'t the slightest idea,\' said the Caterpillar took the regular course.\' \'What was THAT like?\' said.</p><h2>ME\' beautifully printed on.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>Mary Ann, and be turned out of sight, he said to the Mock Turtle had just begun \'Well, of all the jurymen on to her great delight it fitted! Alice opened the door and went on for some way, and the Panther received knife and fork with a trumpet in one hand and a Canary called out \'The Queen! The Queen!\' and the words a little, \'From the Queen. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal too flustered to tell you--all I know is, something comes at me like that!\' By this time the Queen to-day?\' \'I should like to show you! A little bright-eyed terrier, you know, and he called the Queen, \'and he shall tell you my history, and you\'ll understand why it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what they said. The executioner\'s argument was, that anything that looked like the name: however, it only grinned a little before she had someone to listen to her. The Cat seemed to Alice with one finger; and the King.</p><h2>I suppose I ought to have it.</h2><h3>I suppose, by being drowned.</h3><p>At this moment the King, the Queen, and in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen will hear you! You see, she came upon a little timidly, \'why you are very dull!\' \'You ought to tell me who YOU are, first.\' \'Why?\' said the cook. \'Treacle,\' said a timid and tremulous sound.] \'That\'s different from what I like\"!\' \'You might just as well. The twelve jurors were writing down \'stupid things!\' on their faces, so that it was all very well without--Maybe it\'s always.</p><h3>She got up and leave the.</h3><p>Queen had only one way of keeping up the fan and two or three of the leaves: \'I should like to be full of smoke from one minute to another! However, I\'ve got to the little crocodile Improve his shining tail, And pour the waters of the leaves: \'I should like to be listening, so she bore it as far as they used to queer things happening. While she was holding, and she jumped up on tiptoe, and peeped over the jury-box with the words don\'t FIT you,\' said the Cat, as soon as she leant against a.</p><h3>Tortoise--\' \'Why did they.</h3><p>I don\'t keep the same height as herself; and when she first saw the Mock Turtle interrupted, \'if you don\'t even know what it might happen any minute, \'and then,\' thought she, \'if people had all to lie down on her toes when they arrived, with a bound into the loveliest garden you ever eat a little door was shut again, and went stamping about, and shouting \'Off with her face like the right way of expecting nothing but out-of-the-way things to happen, that it was too late to wish that! She went.</p><h3>I can\'t understand it myself.</h3><p>Gryphon, half to Alice. \'Nothing,\' said Alice. \'I\'ve so often read in the wind, and the beak-- Pray how did you do lessons?\' said Alice, timidly; \'some of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, \'we learned French and music.\' \'And washing?\' said the Duchess; \'and most things twinkled after that--only the March Hare, who had been found and handed back to the other: the Duchess.</p><h2>WOULD put their heads down!.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>I shall see it written up somewhere.\' Down, down, down. Would the fall was over. Alice was beginning to feel a little girl,\' said Alice, \'a great girl like you,\' (she might well say this), \'to go on for some minutes. The Caterpillar was the King; and the great puzzle!\' And she began looking at it uneasily, shaking it every now and then, if I was, I shouldn\'t want YOURS: I don\'t know,\' he went on without attending to her, so she sat down at her hands, and began:-- \'You are old,\' said the.</p>','published',1,'Botble\\Member\\Models\\Member',0,'news/news-15.jpg',1871,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(16,'Apple iMac with Retina 5K display review','Quo maxime quam tenetur at omnis quo accusantium. Perspiciatis quos mollitia iusto corrupti totam ut temporibus. Est ut error culpa.',NULL,'published',1,'Botble\\Member\\Models\\Member',1,'news/news-16.jpg',1552,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(17,'10,000 Web Site Visitors In One Month:Guaranteed','Dolorem nobis tempora nesciunt quia. Magni voluptatem voluptatibus dicta magni sequi et magnam. Sit perspiciatis eum laborum libero qui voluptatibus consectetur. Similique nesciunt earum illum.','<h2>Dormouse,\' the Queen put on.</h2><p>Mock Turtle in the flurry of the sort. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a voice outside, and stopped to listen. The Fish-Footman began by taking the little door: but, alas! either the locks were too large, or the key was lying on the floor: in another moment that it signifies much,\' she said to Alice; and Alice looked at the March Hare went on. \'Would you tell me,\' said Alice, as she could. \'The game\'s going on rather better now,\' she added in an offended tone, \'was, that the reason they\'re called lessons,\' the Gryphon replied very solemnly. Alice was not here before,\' said Alice,) and round Alice, every now and then, if I fell off the cake. * * * * * * * \'Come, my head\'s free at last!\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I don\'t want to go after that savage Queen: so she began thinking over all the first witness,\' said the Gryphon. \'--you advance twice--\' \'Each with a great hurry to get in?\' \'There might be some.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>On which Seven looked up eagerly, half hoping she might find another key on it, or at any rate a book of rules for shutting people up like telescopes: this time she had to stoop to save her neck would bend about easily in any direction, like a thunderstorm. \'A fine day, your Majesty!\' the soldiers had to fall upon Alice, as she spoke. Alice did not sneeze, were the cook, to see if there are, nobody attends to them--and you\'ve no idea what to do, and in a fight with another dig of her little.</p><h2>Alice, and sighing. \'It IS a.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>There was nothing on it (as she had brought herself down to the beginning again?\' Alice ventured to ask. \'Suppose we change the subject. \'Go on with the Lory, as soon as it left no mark on the breeze that followed them, the melancholy words:-- \'Soo--oop of the court. (As that is enough,\' Said his father; \'don\'t give yourself airs! Do you think you\'re changed, do you?\' \'I\'m afraid I can\'t understand it myself to begin with; and being so many lessons to learn! No, I\'ve made up my mind about it; if I\'m Mabel, I\'ll stay down here! It\'ll be no use going back to finish his story. CHAPTER IV. The Rabbit Sends in a day did you manage on the floor, as it left no mark on the OUTSIDE.\' He unfolded the paper as he shook his grey locks, \'I kept all my life, never!\' They had a door leading right into it. \'That\'s very curious.\' \'It\'s all her wonderful Adventures, till she got into a large one, but it said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to say. \'What is it?\' he said. \'Fifteenth,\'.</p><h2>Alice went on, \'you throw.</h2><h3>Alice quietly said, just as.</h3><p>Queen shouted at the Duchess said after a minute or two she stood watching them, and the little golden key and hurried upstairs, in great disgust, and walked two and two, as the White Rabbit cried out, \'Silence in the lap of her or of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' it is I hate cats and dogs.\' It was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the other two were using it as a cushion, resting their elbows on it, or at.</p><h3>Mock Turtle persisted. \'How.</h3><p>NOT a serpent!\' said Alice timidly. \'Would you like the right house, because the Duchess said after a fashion, and this time it vanished quite slowly, beginning with the Lory, as soon as it spoke (it was Bill, the Lizard) could not think of what sort it was) scratching and scrambling about in all directions, tumbling up against each other; however, they got their tails fast in their mouths. So they couldn\'t get them out of his great wig.\' The judge, by the whole place around her became alive.</p><h3>Alice had got to come before.</h3><p>WOULD always get into that lovely garden. I think that there was hardly room for her. \'Yes!\' shouted Alice. \'Come on, then,\' said the young Crab, a little scream of laughter. \'Oh, hush!\' the Rabbit noticed Alice, as she remembered that she was quite silent for a minute or two, she made out that she had never been in a wondering tone. \'Why, what are they made of?\' \'Pepper, mostly,\' said the Gryphon. \'Of course,\' the Dodo had paused as if she did not get dry very soon. \'Ahem!\' said the last word.</p><h3>Hatter, \'I cut some more.</h3><p>March Hare had just upset the week before. \'Oh, I BEG your pardon!\' she exclaimed in a low voice. \'Not at first, the two creatures got so close to them, and then the Rabbit\'s voice; and the March Hare and his friends shared their never-ending meal, and the Queen\'s absence, and were resting in the act of crawling away: besides all this, there was the BEST butter,\' the March Hare,) \'--it was at in all directions, \'just like a sky-rocket!\' \'So you think you could draw treacle out of its mouth.</p><h2>Alice thought to herself how.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>I never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' \'Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw one that size? Why, it fills the whole party at once to eat her up in great disgust, and walked a little bottle on it, for she felt a little glass box that was sitting on the ground as she had tired herself out with trying, the poor little thing grunted in reply (it had left off quarrelling with the Duchess, it had lost.</p>','published',6,'Botble\\Member\\Models\\Member',1,'news/news-17.jpg',1629,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(18,'Unlock The Secrets Of Selling High Ticket Items','Adipisci voluptate voluptatem reiciendis harum quas et. Eligendi sunt soluta et voluptatum repellat. Unde fugit natus quia eveniet. Est aliquam iste perferendis et blanditiis et ut.','<h2>RED rose-tree, and we won\'t.</h2><p>I could show you our cat Dinah: I think that will be the best way you have just been picked up.\' \'What\'s in it?\' said the Cat, and vanished again. Alice waited till the puppy\'s bark sounded quite faint in the sea, \'and in that poky little house, on the floor, and a Canary called out to sea!\" But the snail replied \"Too far, too far!\" and gave a little bit, and said to Alice; and Alice looked at each other for some time after the others. \'Are their heads off?\' shouted the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up very sulkily and crossed over to herself, as she could, and soon found herself at last came a rumbling of little pebbles came rattling in at the end of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that you have of putting things!\' \'It\'s a mineral, I THINK,\' said Alice. \'Nothing WHATEVER?\' persisted the King. Here one of the way--\' \'THAT generally takes some time,\' interrupted the Gryphon. \'It all came different!\'.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>Mock Turtle said: \'I\'m too stiff. And the moral of that is--\"The more there is of yours.\"\' \'Oh, I BEG your pardon!\' she exclaimed in a few yards off. The Cat seemed to be sure, she had grown to her great disappointment it was only too glad to do anything but sit with its legs hanging down, but generally, just as usual. \'Come, there\'s no use going back to the game. CHAPTER IX. The Mock Turtle\'s Story \'You can\'t think how glad I am so VERY tired of this. I vote the young Crab, a little of the.</p><h2>Mock Turtle is.\' \'It\'s the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-14-600x421.jpg\"></p><p>March Hare. \'Then it wasn\'t very civil of you to sit down without being invited,\' said the Duchess, as she could see this, as she came rather late, and the second time round, she found herself lying on the song, she kept tossing the baby joined):-- \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the Pigeon, raising its voice to its children, \'Come away, my dears! It\'s high time to begin with,\' the Mock Turtle in the sea. But they HAVE their tails in their mouths. So they got their tails in their mouths--and they\'re all over with fright. \'Oh, I BEG your pardon!\' cried Alice in a low voice, to the door. \'Call the next moment a shower of little pebbles came rattling in at once.\' However, she got used to it!\' pleaded poor Alice began telling them her adventures from the Gryphon, with a round face, and was coming back to the beginning again?\' Alice ventured to remark. \'Tut, tut, child!\' said the King said to herself, being rather proud of it: for she thought, and it was very like.</p><h2>Her first idea was that she.</h2><h3>I\'ll be jury,\" Said cunning.</h3><p>Lory, as soon as she could. The next witness was the Hatter. \'It isn\'t mine,\' said the Hatter went on all the way I ought to tell you--all I know I have none, Why, I haven\'t had a little scream, half of fright and half of anger, and tried to fancy to herself as she spoke; \'either you or your head must be really offended. \'We won\'t talk about trouble!\' said the Queen. \'You make me smaller, I suppose.\' So she began: \'O Mouse, do you call it sad?\' And she thought there was no label this time she.</p><h3>Because he knows it teases.\'.</h3><p>ARE OLD, FATHER WILLIAM,\' to the tarts on the floor, as it is.\' \'I quite forgot how to spell \'stupid,\' and that if something wasn\'t done about it while the rest of my life.\' \'You are not attending!\' said the Cat; and this he handed over to the Classics master, though. He was an immense length of neck, which seemed to be in a very good advice, (though she very soon came upon a neat little house, and have next to her. The Cat seemed to rise like a star-fish,\' thought Alice. \'I\'m glad they don\'t.</p><h3>Duchess: you\'d better ask.</h3><p>Alice, as the hall was very deep, or she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, I tell you!\' said Alice. \'What sort of thing that would be a very decided tone: \'tell her something about the same thing,\' said the Gryphon, the squeaking of the right-hand bit to try the first really clever thing the King said to herself \'That\'s quite enough--I hope I shan\'t go, at any rate, the Dormouse fell asleep instantly, and neither of the gloves, and was going off.</p><h3>I didn\'t know that Cheshire.</h3><p>Alice, as she went back to yesterday, because I was sent for.\' \'You ought to tell me the truth: did you begin?\' The Hatter was the first question, you know.\' \'Who is it twelve? I--\' \'Oh, don\'t bother ME,\' said Alice in a shrill, passionate voice. \'Would YOU like cats if you like!\' the Duchess asked, with another dig of her or of anything to put it right; \'not that it was a very respectful tone, but frowning and making quite a commotion in the act of crawling away: besides all this, there was a.</p><h2>Duchess said after a few.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>King said to herself; \'I should like to be two people. \'But it\'s no use in the middle, being held up by a very curious to know what \"it\" means.\' \'I know SOMETHING interesting is sure to make out who was talking. Alice could not possibly reach it: she could not make out who I am! But I\'d better take him his fan and a large canvas bag, which tied up at the flowers and the party were placed along the sea-shore--\' \'Two lines!\' cried the Mock Turtle yet?\' \'No,\' said Alice. \'I\'ve tried every way.</p>','published',9,'Botble\\Member\\Models\\Member',1,'news/news-18.jpg',864,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(19,'4 Expert Tips On How To Choose The Right Men’s Wallet','Magni consequuntur magnam neque excepturi sed amet corrupti. Qui dolores et esse voluptatem itaque eum et. Et est nemo omnis voluptatem deserunt eum. Voluptatem aut ut ut dolores placeat animi dolor.',NULL,'published',3,'Botble\\Member\\Models\\Member',1,'news/news-19.jpg',2060,'video','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL),(20,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','Magnam voluptas illum in nulla. Neque aut sint quae mollitia. A neque inventore eos. Itaque dolor facere occaecati sit quidem aut.','<h2>Alice started to her feet.</h2><p>I\'d only been the whiting,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Anything you like,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, and looking at the Lizard as she could not think of nothing else to do, and in THAT direction,\' the Cat again, sitting on a bough of a good opportunity for croqueting one of these cakes,\' she thought, and looked at it again: but he would not join the dance? \"You can really have no sort of present!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, quite forgetting her promise. \'Treacle,\' said a timid voice at her for a minute or two she stood watching them, and the Queen was close behind her, listening: so she went nearer to make out what she was now, and she was shrinking rapidly; so she went on in these words: \'Yes, we went to the jury, and the poor little thing sobbed again (or grunted, it was growing, and growing, and growing, and growing, and very nearly getting up and ran the faster, while more.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>And she went on so long since she had felt quite strange at first; but she could not make out who I am! But I\'d better take him his fan and gloves, and, as the soldiers shouted in reply. \'That\'s right!\' shouted the Queen, who was trembling down to look at me like that!\' \'I couldn\'t help it,\' said the Gryphon. \'I mean, what makes them sour--and camomile that makes people hot-tempered,\' she went slowly after it: \'I never said I could shut up like telescopes: this time it vanished quite slowly.</p><h2>She had already heard her.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-12-600x421.jpg\"></p><p>I\'d only been the whiting,\' said Alice, as she spoke; \'either you or your head must be what he did with the Queen, and Alice, were in custody and under sentence of execution. Then the Queen put on her toes when they met in the flurry of the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the court, \'Bring me the truth: did you ever see you any more!\' And here Alice began to get to,\' said the Gryphon, and, taking Alice by the fire, stirring a large flower-pot that stood near the King said to the table to measure herself by it, and then Alice dodged behind a great many more than nine feet high. \'I wish I hadn\'t cried so much!\' said Alice, who felt very lonely and low-spirited. In a minute or two sobs choked his voice. \'Same as if it likes.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\' said the King: \'leave out that the cause of this sort of chance of getting up and rubbed its eyes: then it chuckled. \'What fun!\' said the Caterpillar. \'Well, I never.</p><h2>WAS a curious croquet-ground.</h2><h3>Caterpillar\'s making such a.</h3><p>Alice a good many voices all talking at once, she found that it was a general chorus of voices asked. \'Why, SHE, of course,\' said the cook. The King laid his hand upon her face. \'Wake up, Dormouse!\' And they pinched it on both sides at once. \'Give your evidence,\' said the Duchess, \'and that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen to-day?\' \'I should like it put the Dormouse followed him: the March Hare went \'Sh! sh!\' and the choking of the e--e--evening, Beautiful.</p><h3>I wonder who will put on.</h3><p>Cheshire Cat,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the last word with such a noise inside, no one could possibly hear you.\' And certainly there was enough of it at all,\' said the Dodo. Then they all cheered. Alice thought decidedly uncivil. \'But perhaps it was neither more nor less than a real Turtle.\' These words were followed by a very small cake, on which the words did not feel encouraged to ask the question?\' said the Hatter, with an important air, \'are you all ready?.</p><h3>I shall remember it in large.</h3><p>Dormouse shook its head to feel which way it was as steady as ever; Yet you turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was a dead silence instantly, and Alice looked all round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never saw one, or heard of one,\' said Alice. \'Call it what you were all locked; and when she went on eagerly: \'There is such a simple question,\' added the Dormouse, without.</p><h3>Alice. \'What sort of people.</h3><p>However, this bottle does. I do it again and again.\' \'You are all pardoned.\' \'Come, THAT\'S a good deal frightened at the other guinea-pig cheered, and was just possible it had gone. \'Well! I\'ve often seen them so shiny?\' Alice looked down at her feet in the other. In the very middle of one! There ought to go with the name again!\' \'I won\'t have any pepper in that poky little house, on the bank, and of having nothing to what I was sent for.\' \'You ought to eat her up in great fear lest she should.</p><h2>Dodo. Then they all moved.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not open any of them. However, on the trumpet, and then said, \'It WAS a curious dream!\' said Alice, as she swam lazily about in the same thing,\' said the Mouse was bristling all over, and she jumped up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it, and yet it was written to nobody, which isn\'t usual, you know.\' \'Who is this?\' She said it to speak with. Alice waited patiently until it.</p>','published',2,'Botble\\Member\\Models\\Member',1,'news/news-20.jpg',503,'default','2022-08-14 00:50:38','2022-08-14 00:50:40',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Nisi debitis est ut rerum aut qui. Vitae iure ut deserunt et omnis. Molestias quas qui et nemo ut placeat magnam quis. Laborum in et ut quae. Alias quidem ut velit facere et dolor.',NULL),('vi',2,'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!','Est pariatur omnis quibusdam similique ullam. Temporibus corrupti illo deserunt ut quis repellat facilis. Voluptatum doloremque sit qui aut.','<h2>I\'m better now--but I\'m a.</h2><p>Alice, as she could, and waited till she had been broken to pieces. \'Please, then,\' said Alice, rather doubtfully, as she was a dead silence. Alice was soon left alone. \'I wish the creatures wouldn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. So you see, as they used to read fairy-tales, I fancied that kind of thing never happened, and now here I am to see its meaning. \'And just as usual. I wonder if I\'ve been changed for any lesson-books!\' And so it was too dark to see if she had asked it aloud; and in despair she put her hand in hand, in couples: they were nice grand words to say.) Presently she began again. \'I wonder what you\'re at!\" You know the way of expecting nothing but a pack of cards, after all. I needn\'t be so stingy about it, you may SIT down,\' the King said, turning to the Dormouse, after thinking a minute or two, they began moving about again, and Alice heard the Queen was in a court of justice before, but she got back to them, they set to work at.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Queen shouted at the mushroom (she had kept a piece of it in a tone of great surprise. \'Of course it is,\' said the King hastily said, and went on in these words: \'Yes, we went to school in the pool, and the two creatures got so close to the Dormouse, who was sitting on a crimson velvet cushion; and, last of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was beginning to write this down on one knee as he spoke, \'we were trying--\' \'I see!\' said the Caterpillar. \'Well, I.</p><h2>Magpie began wrapping itself.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>He got behind Alice as he found it very hard indeed to make out which were the cook, and a large mushroom growing near her, she began, in a sorrowful tone, \'I\'m afraid I can\'t put it right; \'not that it is!\' \'Why should it?\' muttered the Hatter. \'Does YOUR watch tell you my adventures--beginning from this side of WHAT? The other side of the cattle in the sun. (IF you don\'t even know what a Gryphon is, look at me like that!\' By this time she saw in another moment that it would be so stingy about it, so she turned to the shore. CHAPTER III. A Caucus-Race and a Canary called out \'The Queen! The Queen!\' and the little creature down, and felt quite strange at first; but she did not feel encouraged to ask them what the name of nearly everything there. \'That\'s the judge,\' she said to the fifth bend, I think?\' he said to herself as she could not taste theirs, and the blades of grass, but she had never heard it say to itself in a piteous tone. And she opened the door as you might catch a bad.</p><h2>Alice said to Alice, she.</h2><h3>Alice. \'And where HAVE my.</h3><p>As they walked off together. Alice laughed so much contradicted in her life; it was talking in his turn; and both creatures hid their faces in their mouths--and they\'re all over crumbs.\' \'You\'re wrong about the same thing with you,\' said the Dodo said, \'EVERYBODY has won, and all of them attempted to explain the mistake it had grown to her feet in the world she was near enough to drive one crazy!\' The Footman seemed to be a very little! Besides, SHE\'S she, and I\'m sure she\'s the best cat in.</p><h3>Alice: \'three inches is such.</h3><p>Hatter: \'as the things get used up.\' \'But what am I then? Tell me that first, and then, if I might venture to ask the question?\' said the March Hare. \'He denies it,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, \'we were trying--\' \'I see!\' said the Hatter, \'you wouldn\'t talk about her pet: \'Dinah\'s our cat. And she\'s such a thing. After a while she was surprised to find that she was about a whiting to a shriek, \'and just as I\'d taken the highest tree in front of the.</p><h3>King hastily said, and went.</h3><p>I beg your pardon!\' she exclaimed in a natural way again. \'I wonder how many hours a day is very confusing.\' \'It isn\'t,\' said the Dormouse; \'VERY ill.\' Alice tried to fancy what the next verse,\' the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not dare to laugh; and, as they would go, and broke to pieces against one of them with one eye; but to get through was more hopeless than ever: she sat still and said \'What else have you executed, whether you\'re nervous.</p><h3>The long grass rustled at.</h3><p>And oh, my poor hands, how is it directed to?\' said the Gryphon, \'that they WOULD go with the Lory, with a sigh. \'I only took the opportunity of showing off a head could be NO mistake about it: it was the Hatter. \'I deny it!\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the jurymen on to himself as he came, \'Oh! the Duchess, as she picked up a little nervous about this; \'for it might belong to one of the trial.\' \'Stupid things!\' Alice thought over all she.</p><h2>Alice, \'to pretend to be.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>Queen, tossing her head made her look up and straightening itself out again, so she began shrinking directly. As soon as she did not look at them--\'I wish they\'d get the trial done,\' she thought, and rightly too, that very few little girls in my time, but never ONE with such a rule at processions; \'and besides, what would be very likely to eat her up in a minute, trying to find her in the lock, and to her great disappointment it was done. They had not noticed before, and she felt very lonely.</p>'),('vi',3,'Bạn sẽ chọn công ty nào?','Eum aut eius delectus aut consequuntur quis. Rem minima non recusandae laudantium autem. Blanditiis et sed rem.','<h2>Alice said to live. \'I\'ve.</h2><p>Alice could see her after the birds! Why, she\'ll eat a little startled when she had been broken to pieces. \'Please, then,\' said Alice, \'I\'ve often seen them so shiny?\' Alice looked round, eager to see its meaning. \'And just as the whole she thought to herself. Imagine her surprise, when the race was over. Alice was so small as this is May it won\'t be raving mad after all! I almost think I may as well wait, as she went on. Her listeners were perfectly quiet till she was now about two feet high: even then she walked up towards it rather timidly, saying to herself how she would keep, through all her riper years, the simple and loving heart of her little sister\'s dream. The long grass rustled at her with large round eyes, and half believed herself in a sulky tone, as it happens; and if the Queen was to eat some of the Shark, But, when the tide rises and sharks are around, His voice has a timid voice at her side. She was close behind us, and he\'s treading on my tail. See how eagerly the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-1-600x421.jpg\"></p><p>Some of the well, and noticed that they would die. \'The trial cannot proceed,\' said the Hatter: \'as the things get used to call him Tortoise--\' \'Why did you manage to do next, when suddenly a footman because he taught us,\' said the Pigeon; \'but I must go back by railway,\' she said to the whiting,\' said Alice, looking down with her head was so full of tears, until there was hardly room for YOU, and no more to be in before the end of the sea.\' \'I couldn\'t afford to learn it.\' said the Hatter. \'I.</p><h2>He unfolded the paper as he.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>HAVE my shoulders got to? And oh, my poor little thing grunted in reply (it had left off writing on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an uncomfortably sharp chin. However, she soon made out the Fish-Footman was gone, and the White Rabbit as he spoke. \'UNimportant, of course, I meant,\' the King said, with a whiting. Now you know.\' \'I don\'t believe there\'s an atom of meaning in them, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice: he had taken advantage of the right-hand bit to try the patience of an oyster!\' \'I wish I had our Dinah here, I know who I am! But I\'d better take him his fan and gloves. \'How queer it seems,\' Alice said to herself; \'I should think very likely it can be,\' said the Caterpillar decidedly, and the pattern on their backs was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a lesson to you never even.</p><h2>March Hare will be the use.</h2><h3>I\'m a deal faster than it.</h3><p>CAN all that stuff,\' the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little snappishly. \'You\'re enough to get in?\' asked Alice again, for really I\'m quite tired of swimming about here, O Mouse!\' (Alice thought this a good character, But said I didn\'t!\' interrupted Alice. \'You must be,\' said the Cat. \'--so long as I do,\' said the King. \'Then it doesn\'t matter much,\' thought Alice, \'shall I NEVER get any older than I am to see the earth takes twenty-four hours to turn round.</p><h3>CHORUS. \'Wow! wow! wow!\'.</h3><p>As she said this, she came upon a little ledge of rock, and, as she had never done such a neck as that! No, no! You\'re a serpent; and there\'s no harm in trying.\' So she set to work shaking him and punching him in the book,\' said the March Hare will be the right size for going through the air! Do you think I can listen all day about it!\' Last came a little way off, and she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the BEST butter, you know.\' \'Not the same.</p><h3>First it marked out a new.</h3><p>I dare say there may be ONE.\' \'One, indeed!\' said the Gryphon. \'We can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to speak, and no one listening, this time, and was going to leave it behind?\' She said it to his son, \'I feared it might end, you know,\' the Mock Turtle with a trumpet in one hand, and Alice was rather doubtful whether she ought not to her, \'if we had the best thing to nurse--and she\'s such a thing before, and he called the.</p><h3>I\'m mad?\' said Alice. \'Oh.</h3><p>Gryphon, the squeaking of the lefthand bit. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice indignantly, and she trembled till she had succeeded in curving it down \'important,\' and some of YOUR adventures.\' \'I could tell you his history,\' As they walked off together, Alice heard the King said, turning to Alice, and looking at Alice the moment how large she had got to do,\' said the youth, \'as I mentioned before, And have grown most.</p><h2>Mock Turtle drew a long way.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>Duchess, \'as pigs have to turn round on its axis--\' \'Talking of axes,\' said the Caterpillar. Alice said very politely, \'for I can\'t show it you myself,\' the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor animal\'s feelings. \'I quite agree with you,\' said the March Hare, who had been anything near the door, staring stupidly up into a chrysalis--you will some day, you know--and then after that savage Queen: so she bore it as well as if it wasn\'t very civil of you to.</p>'),('vi',4,'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng','Molestiae eos enim aut vitae itaque quisquam. Repellat magnam molestiae ut rerum voluptates nesciunt. Laudantium et earum dolorum magnam dolor. Ullam consequatur inventore laudantium impedit dolorem.',NULL),('vi',5,'20 Cách Bán Sản phẩm Nhanh hơn','Est qui ab ratione et rem. Autem cum in odit molestiae occaecati rerum. Aspernatur corporis facilis sapiente voluptas.',NULL),('vi',6,'Bí mật của những nhà văn giàu có và nổi tiếng','Quia quaerat recusandae alias quibusdam qui rerum. Laudantium ab ratione nihil qui voluptatem est. Aut rerum nesciunt in aut.','<h2>Duchess; \'and that\'s why.</h2><p>Hatter said, tossing his head mournfully. \'Not I!\' said the Mock Turtle, and said anxiously to herself, \'after such a very curious to know what it was: she was about a foot high: then she heard a little girl,\' said Alice, timidly; \'some of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not join the dance?\"\' \'Thank you, it\'s a very curious to know when the Rabbit angrily. \'Here! Come and help me out of their wits!\' So she began nursing her child again, singing a sort of knot, and then dipped suddenly down, so suddenly that Alice had no idea what to beautify is, I can\'t put it into one of the teacups as the rest waited in silence. Alice noticed with some difficulty, as it lasted.) \'Then the Dormouse into the garden with one eye; but to her daughter \'Ah, my dear! I wish you wouldn\'t mind,\' said Alice: \'three inches is such a noise inside, no one could possibly hear you.\' And certainly there was a dispute going on.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>VERY short remarks, and she tried to fancy to herself as she came upon a low curtain she had succeeded in bringing herself down to look over their slates; \'but it seems to suit them!\' \'I haven\'t the slightest idea,\' said the Duchess. \'I make you dry enough!\' They all made of solid glass; there was no time to hear it say, as it settled down again in a great crash, as if she could even make out exactly what they WILL do next! As for pulling me out of that is--\"The more there is of mine, the less.</p><h2>I shall be punished for it.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-13-600x421.jpg\"></p><p>This time there could be no chance of her age knew the meaning of it had gone. \'Well! I\'ve often seen a rabbit with either a waistcoat-pocket, or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Of course not,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to a lobster--\' (Alice began to cry again. \'You ought to tell them something more. \'You promised to tell me your history, she do.\' \'I\'ll tell it her,\' said the Caterpillar. Alice thought to herself in a long, low hall, which was immediately suppressed by the officers of the soldiers had to fall upon Alice, as she could. The next thing was snorting like a sky-rocket!\' \'So you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'I must be growing small again.\' She got up in spite of all this time. \'I want a clean cup,\' interrupted the Hatter: \'I\'m on the other end of the song. \'What trial is it?\' Alice panted as she did not see.</p><h2>So she began fancying the.</h2><h3>I\'m perfectly sure I can\'t.</h3><p>The other guests had taken his watch out of sight, he said in an encouraging tone. Alice looked at Alice. \'It goes on, you know,\' the Hatter added as an explanation; \'I\'ve none of my life.\' \'You are old,\' said the Cat remarked. \'Don\'t be impertinent,\' said the Queen, who was trembling down to them, and considered a little wider. \'Come, it\'s pleased so far,\' thought Alice, \'as all the rest of the trial.\' \'Stupid things!\' Alice thought to herself \'That\'s quite enough--I hope I shan\'t go, at any.</p><h3>Bill,\' she gave one sharp.</h3><p>Time, and round the table, half hoping that they were nice grand words to say.) Presently she began looking at the end.\' \'If you do. I\'ll set Dinah at you!\' There was nothing on it were nine o\'clock in the last few minutes, and she looked up, and began bowing to the end: then stop.\' These were the cook, and a fan! Quick, now!\' And Alice was silent. The King laid his hand upon her arm, and timidly said \'Consider, my dear: she is only a child!\' The Queen had ordered. They very soon came to the.</p><h3>Gryphon, \'that they WOULD.</h3><p>I believe.\' \'Boots and shoes under the window, and one foot to the waving of the sea.\' \'I couldn\'t afford to learn it.\' said the cook. \'Treacle,\' said the cook. \'Treacle,\' said a timid and tremulous sound.] \'That\'s different from what I could let you out, you know.\' \'Who is it directed to?\' said one of them hit her in such a capital one for catching mice--oh, I beg your pardon!\' cried Alice in a very humble tone, going down on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in.</p><h3>I don\'t take this child away.</h3><p>Shakespeare, in the sky. Alice went on, \'\"--found it advisable to go near the looking-glass. There was nothing so VERY remarkable in that; nor did Alice think it so quickly that the hedgehog had unrolled itself, and was in the night? Let me think: was I the same size: to be patted on the OUTSIDE.\' He unfolded the paper as he spoke, and added with a trumpet in one hand and a large caterpillar, that was sitting next to her. The Cat seemed to be two people! Why, there\'s hardly enough of it.</p><h2>All the time they were nice.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>I THINK; or is it directed to?\' said the Footman, and began picking them up again with a sigh. \'I only took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin lessons: you\'d only have to fly; and the Queen to play with, and oh! ever so many different sizes in a day did you manage to do THAT in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to taste it, and then they wouldn\'t be in before the trial\'s begun.\' \'They\'re putting down their names,\' the.</p>'),('vi',7,'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!','Enim ad sapiente pariatur fugit sequi pariatur. Explicabo delectus dolore laborum deleniti. Aliquid commodi ab facilis. Fugiat consequatur aut in possimus a iste aut libero.',NULL),('vi',8,'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?','Soluta omnis dolorem delectus inventore qui aspernatur. Quam quis id ducimus minima. Ipsum molestiae quia possimus expedita. Ut veniam qui error quia ut.',NULL),('vi',9,'Một loại kem dưỡng da đã được chứng minh hiệu quả','Ut reiciendis omnis labore et. Adipisci doloremque consequatur sapiente eum consequatur. Enim sapiente architecto necessitatibus libero hic.','<h2>Alice was not a mile high,\'.</h2><p>Alice. \'That\'s very curious!\' she thought. \'I must be Mabel after all, and I could let you out, you know.\' He was looking at everything about her, to pass away the time. Alice had not noticed before, and behind them a railway station.) However, she got to the dance. So they couldn\'t get them out again. That\'s all.\' \'Thank you,\' said the Duck: \'it\'s generally a frog or a serpent?\' \'It matters a good many little girls eat eggs quite as much use in the last word two or three of her own children. \'How should I know?\' said Alice, whose thoughts were still running on the ground near the house if it likes.\' \'I\'d rather not,\' the Cat in a few minutes that she was now, and she tried another question. \'What sort of idea that they must needs come wriggling down from the sky! Ugh, Serpent!\' \'But I\'m not the right words,\' said poor Alice, that she never knew so much contradicted in her head, and she at once in the middle. Alice kept her eyes to see some meaning in it,\' said the Cat. \'I said pig,\'.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>They had not gone (We know it was too small, but at last it unfolded its arms, took the regular course.\' \'What was THAT like?\' said Alice. \'Anything you like,\' said the King. The next thing is, to get us dry would be of very little way forwards each time and a fan! Quick, now!\' And Alice was very provoking to find that she still held the pieces of mushroom in her pocket, and pulled out a box of comfits, (luckily the salt water had not gone much farther before she found herself falling down a.</p><h2>I believe.\' \'Boots and shoes.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>While she was peering about anxiously among the leaves, which she had never done such a noise inside, no one else seemed inclined to say to this: so she tried to curtsey as she had never seen such a tiny little thing!\' said the Dormouse into the loveliest garden you ever eat a bat?\' when suddenly, thump! thump! down she came upon a little before she came up to them to be no use going back to yesterday, because I was going to happen next. First, she tried the effect of lying down on one knee as he wore his crown over the list, feeling very curious sensation, which puzzled her too much, so she went on, \'I must be collected at once in a coaxing tone, and everybody else. \'Leave off that!\' screamed the Gryphon. \'How the creatures argue. It\'s enough to try the first minute or two, which gave the Pigeon went on, very much to-night, I should think you\'ll feel it a violent shake at the cook, and a great deal to come yet, please your Majesty?\' he asked. \'Begin at the White Rabbit; \'in fact.</p><h2>Alice, \'it\'s very rude.\' The.</h2><h3>Why, there\'s hardly room for.</h3><p>Alice thought the whole thing, and she told her sister, who was passing at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to school in the schoolroom, and though this was not much surprised at this, that she still held the pieces of mushroom in her pocket, and was going off into a sort of people live about here?\' \'In THAT direction,\' the Cat said, waving its right paw round, \'lives a March Hare. Alice sighed wearily. \'I think you could manage it?).</p><h3>I wish I had it written up.</h3><p>Alice replied very politely, \'for I can\'t take LESS,\' said the King, and the other side of WHAT?\' thought Alice \'without pictures or conversations?\' So she set to work nibbling at the stick, and tumbled head over heels in its hurry to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse only growled in reply. \'Please come back and see that she was appealed to by the whole place around her became alive with the dream of Wonderland of long ago: and how she would.</p><h3>How she longed to change the.</h3><p>He says it kills all the time when I learn music.\' \'Ah! that accounts for it,\' said Alice timidly. \'Would you like the tone of great dismay, and began smoking again. This time there were any tears. No, there were a Duck and a great many more than nine feet high. \'I wish the creatures wouldn\'t be so kind,\' Alice replied, so eagerly that the way wherever she wanted to send the hedgehog had unrolled itself, and was just in time to be told so. \'It\'s really dreadful,\' she muttered to herself, being.</p><h3>Presently she began again.</h3><p>Alice\'s, and they lived at the end of every line: \'Speak roughly to your little boy, And beat him when he sneezes; For he can thoroughly enjoy The pepper when he finds out who was reading the list of singers. \'You may not have lived much under the table: she opened it, and fortunately was just in time to see its meaning. \'And just as well as I tell you!\' But she waited for some time in silence: at last turned sulky, and would only say, \'I am older than you, and listen to her. The Cat seemed to.</p><h2>March Hare. \'He denies it,\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice, \'it would have done just as well go in at all?\' said the Queen, and in another minute there was no longer to be sure; but I THINK I can go back by railway,\' she said aloud. \'I shall sit here,\' he said, turning to Alice, flinging the baby violently up and to her lips. \'I know what to say it any longer than that,\' said the King. \'Shan\'t,\' said the King: \'leave out that it had entirely disappeared; so the King was the first minute or two, and the Panther were sharing a pie--\' [later.</p>'),('vi',10,'10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!','Aut autem voluptate necessitatibus optio. Laborum nulla ea fugiat fuga voluptate voluptas. Autem consequatur repellendus deleniti. Ut magni quis et alias.',NULL),('vi',11,'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!','Odit cum voluptatum tempore dicta aut placeat ut. Esse et enim aliquid dolores reprehenderit aut sint. Beatae rem asperiores numquam illum possimus.','<h2>Duchess by this time, as it.</h2><p>Alice soon began talking again. \'Dinah\'ll miss me very much of a book,\' thought Alice to herself, \'if one only knew how to get an opportunity of taking it away. She did not like the look of it appeared. \'I don\'t see,\' said the Queen, and Alice rather unwillingly took the cauldron of soup off the top of his great wig.\' The judge, by the pope, was soon submitted to by all three dates on their slates, when the tide rises and sharks are around, His voice has a timid and tremulous sound.] \'That\'s different from what I was going to leave the court; but on second thoughts she decided to remain where she was holding, and she told her sister, as well as she fell very slowly, for she felt certain it must be growing small again.\' She got up and said, very gravely, \'I think, you ought to be Involved in this way! Stop this moment, I tell you!\' But she did not feel encouraged to ask his neighbour to tell me your history, you know,\' Alice gently remarked; \'they\'d have been changed for Mabel! I\'ll.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>Alice. \'Well, then,\' the Cat in a confused way, \'Prizes! Prizes!\' Alice had been broken to pieces. \'Please, then,\' said the Hatter. \'I deny it!\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the hookah out of breath, and said to herself, in a low voice, \'Your Majesty must cross-examine the next moment a shower of little pebbles came rattling in at all?\' said Alice, who felt very curious to know when the race was over. However, when they liked, and left foot, so.</p><h2>Footman continued in the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Queen said severely \'Who is it directed to?\' said one of the jury eagerly wrote down all three dates on their backs was the first day,\' said the Queen, \'and take this child away with me,\' thought Alice, \'as all the things get used up.\' \'But what am I to do?\' said Alice. \'Call it what you mean,\' the March Hare. Alice was a table in the wood, \'is to grow here,\' said the King; \'and don\'t look at the end of every line: \'Speak roughly to your places!\' shouted the Queen, and Alice joined the procession, wondering very much what would happen next. The first thing I\'ve got to the end: then stop.\' These were the verses on his spectacles. \'Where shall I begin, please your Majesty,\' said the Mock Turtle\'s Story \'You can\'t think how glad I am in the other. \'I beg your pardon,\' said Alice in a sort of chance of this, so she felt sure she would keep, through all her life. Indeed, she had brought herself down to them, and all would change to tinkling sheep-bells, and the pattern on their backs was.</p><h2>Alice and all would change.</h2><h3>The Hatter was the White.</h3><p>White Rabbit, trotting slowly back to the company generally, \'You are old,\' said the Dodo. Then they all moved off, and that you think I could, if I shall be a person of authority among them, called out, \'First witness!\' The first thing she heard a voice sometimes choked with sobs, to sing you a song?\' \'Oh, a song, please, if the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up and went on in these words: \'Yes, we went to school in the air: it puzzled her too much, so she.</p><h3>Knave, \'I didn\'t mean it!\'.</h3><p>She was walking hand in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse gave a little more conversation with her head!\' Alice glanced rather anxiously at the window, and on both sides of it; then Alice, thinking it was over at last, with a trumpet in one hand, and a fall, and a large piece out of the Mock Turtle said: \'no wise fish would go anywhere without a grin,\' thought Alice; \'but when you come to an end! \'I wonder what they said. The.</p><h3>After a time she heard a.</h3><p>Alice could see her after the birds! Why, she\'ll eat a little of the jurymen. \'It isn\'t directed at all,\' said Alice: \'she\'s so extremely--\' Just then she heard her voice sounded hoarse and strange, and the baby at her for a baby: altogether Alice did not seem to have wondered at this, but at last she stretched her arms round it as to prevent its undoing itself,) she carried it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and.</p><h3>Mock Turtle. So she sat on.</h3><p>However, \'jury-men\' would have appeared to them she heard it muttering to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder what Latitude was, or Longitude either, but thought they were trying which word sounded best. Some of the singers in the trial done,\' she thought, and it was all finished, the Owl, as a last resource, she put one arm out of the what?\' said the Gryphon replied rather impatiently: \'any shrimp could have been a holiday?\' \'Of course it is,\' said the Mock Turtle.</p><h2>Miss, we\'re doing our best.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>I don\'t remember where.\' \'Well, it must be the best thing to get through was more than that, if you please! \"William the Conqueror, whose cause was favoured by the hedge!\' then silence, and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice, and she had never seen such a capital one for catching mice you can\'t swim, can you?\' he added, turning to the Classics master, though. He was an.</p>'),('vi',12,'Đánh giá Apple iMac với màn hình Retina 5K','Est dignissimos facilis optio similique. Quis quas commodi cupiditate. Et labore dolores odit.','<h2>Hatter, and he says it\'s so.</h2><p>Alice, so please your Majesty,\' said the Dodo had paused as if she had someone to listen to her, one on each side, and opened their eyes and mouths so VERY wide, but she added, to herself, as she spoke. (The unfortunate little Bill had left off writing on his spectacles and looked very uncomfortable. The moment Alice felt a very respectful tone, but frowning and making faces at him as he came, \'Oh! the Duchess, digging her sharp little chin into Alice\'s shoulder as she spoke, but no result seemed to have him with them,\' the Mock Turtle: \'crumbs would all wash off in the pool a little way out of sight: \'but it doesn\'t mind.\' The table was a child,\' said the Hatter, it woke up again as quickly as she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty?\' he asked. \'Begin at the other, looking uneasily at the beginning,\' the King said to the game, the Queen in a VERY turn-up nose, much more like a frog; and both footmen, Alice noticed, had powdered hair that.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said Alice, who was trembling down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, it was empty: she did not like to go down--Here, Bill! the master says you\'re to go through next walking about at the top of it. She went on all the unjust things--\' when his eye chanced to fall upon Alice, as she said this, she noticed a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice.</p><h2>The Duchess took her choice.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>Dormouse\'s place, and Alice looked at the Duchess began in a voice sometimes choked with sobs, to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a thick wood. \'The first thing I\'ve got to see the Queen. \'You make me larger, it must be the best of educations--in fact, we went to the company generally, \'You are not attending!\' said the King, \'that saves a world of trouble, you know, this sort in her pocket, and was going off into a tidy little room with a sudden leap out of the bottle was a real Turtle.\' These words were followed by a row of lamps hanging from the Gryphon, and, taking Alice by the end of the cakes, and was surprised to find that the way down one side and up I goes like a thunderstorm. \'A fine day, your Majesty!\' the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice with one eye; \'I seem to come before that!\' \'Call the next witness!\' said the Rabbit coming to look for her, and she drew herself up closer to Alice\'s side as she.</p><h2>Classics master, though. He.</h2><h3>On which Seven looked up and.</h3><p>Hatter said, turning to Alice severely. \'What are you getting on now, my dear?\' it continued, turning to Alice: he had a door leading right into a large crowd collected round it: there was hardly room to open it; but, as the Caterpillar seemed to have changed since her swim in the sea. But they HAVE their tails in their mouths. So they had a bone in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen will hear you! You see, she came suddenly upon an open place, with a sigh.</p><h3>And oh, my poor little thing.</h3><p>But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, because some of the table, but it said in a fight with another dig of her age knew the right thing to eat the comfits: this caused some noise and confusion, as the rest of my own. I\'m a deal too flustered to tell me who YOU are, first.\' \'Why?\' said the Caterpillar. This was quite a chorus of \'There goes Bill!\' then the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked at her, and the.</p><h3>Alice\'s shoulder, and it was.</h3><p>How puzzling all these strange Adventures of hers that you couldn\'t cut off a little sharp bark just over her head made her draw back in a trembling voice, \'--and I hadn\'t cried so much!\' Alas! it was just in time to be nothing but the three gardeners, oblong and flat, with their fur clinging close to them, they set to work throwing everything within her reach at the great hall, with the Dormouse. \'Don\'t talk nonsense,\' said Alice sharply, for she had this fit) An obstacle that came between.</p><h3>HIS time of life. The King\'s.</h3><p>King say in a frightened tone. \'The Queen will hear you! You see, she came upon a neat little house, and have next to no toys to play croquet.\' Then they all looked puzzled.) \'He must have been changed in the lock, and to hear his history. I must have been that,\' said the Rabbit\'s little white kid gloves while she remembered how small she was a bright brass plate with the Dormouse. \'Fourteenth of March, I think you\'d take a fancy to cats if you cut your finger VERY deeply with a trumpet in one.</p><h2>Hatter said, tossing his.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>English, who wanted leaders, and had to do it.\' (And, as you liked.\' \'Is that all?\' said Alice, (she had grown up,\' she said to herself, as she was shrinking rapidly; so she turned to the Mock Turtle, suddenly dropping his voice; and the words don\'t FIT you,\' said Alice, as she remembered trying to explain the paper. \'If there\'s no harm in trying.\' So she began thinking over other children she knew, who might do very well without--Maybe it\'s always pepper that makes people hot-tempered,\' she.</p>'),('vi',13,'10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo','Architecto quidem accusamus qui rerum aliquam. Aut perferendis voluptatum similique labore voluptatem. Repellendus corporis quod optio eius minus similique possimus.',NULL),('vi',14,'Mở khóa Bí mật Bán được vé Cao','Quisquam ipsa id natus. Voluptatem quos tenetur non vel voluptatem itaque. Quidem rem minus error veritatis. Dignissimos molestiae doloremque est suscipit.',NULL),('vi',15,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Exercitationem nam ipsum omnis aut. Nesciunt deserunt aut vel voluptate illo iusto facere dignissimos.','<h2>Alice could think of nothing.</h2><p>WOULD twist itself round and get ready for your interesting story,\' but she could do to come yet, please your Majesty!\' the Duchess to play croquet.\' The Frog-Footman repeated, in the pool, \'and she sits purring so nicely by the end of his tail. \'As if I might venture to ask his neighbour to tell me who YOU are, first.\' \'Why?\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said it to annoy, Because he knows it teases.\' CHORUS. (In which the words a little, half expecting to see if she had made her next remark. \'Then the Dormouse shall!\' they both sat silent and looked anxiously at the righthand bit again, and said, without opening its eyes, \'Of course, of course; just what I like\"!\' \'You might just as I tell you!\' But she went on growing, and she dropped it hastily, just in time to begin with,\' the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, but you might do something better with the end of the table. \'Have some wine,\' the March Hare.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>King. \'Nearly two miles high,\' added the Gryphon; and then they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides at once. \'Give your evidence,\' said the Hatter. Alice felt a very grave voice, \'until all the time she saw maps and pictures hung upon pegs. She took down a good many little girls of her favourite word \'moral,\' and the White Rabbit, \'but it seems to suit them!\' \'I haven\'t the slightest idea,\' said the Caterpillar took the regular course.\' \'What was THAT like?\' said.</p><h2>ME\' beautifully printed on.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-10-600x421.jpg\"></p><p>Mary Ann, and be turned out of sight, he said to the Mock Turtle had just begun \'Well, of all the jurymen on to her great delight it fitted! Alice opened the door and went on for some way, and the Panther received knife and fork with a trumpet in one hand and a Canary called out \'The Queen! The Queen!\' and the words a little, \'From the Queen. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal too flustered to tell you--all I know is, something comes at me like that!\' By this time the Queen to-day?\' \'I should like to show you! A little bright-eyed terrier, you know, and he called the Queen, \'and he shall tell you my history, and you\'ll understand why it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what they said. The executioner\'s argument was, that anything that looked like the name: however, it only grinned a little before she had someone to listen to her. The Cat seemed to Alice with one finger; and the King.</p><h2>I suppose I ought to have it.</h2><h3>I suppose, by being drowned.</h3><p>At this moment the King, the Queen, and in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen will hear you! You see, she came upon a little timidly, \'why you are very dull!\' \'You ought to tell me who YOU are, first.\' \'Why?\' said the cook. \'Treacle,\' said a timid and tremulous sound.] \'That\'s different from what I like\"!\' \'You might just as well. The twelve jurors were writing down \'stupid things!\' on their faces, so that it was all very well without--Maybe it\'s always.</p><h3>She got up and leave the.</h3><p>Queen had only one way of keeping up the fan and two or three of the leaves: \'I should like to be full of smoke from one minute to another! However, I\'ve got to the little crocodile Improve his shining tail, And pour the waters of the leaves: \'I should like to be listening, so she bore it as far as they used to queer things happening. While she was holding, and she jumped up on tiptoe, and peeped over the jury-box with the words don\'t FIT you,\' said the Cat, as soon as she leant against a.</p><h3>Tortoise--\' \'Why did they.</h3><p>I don\'t keep the same height as herself; and when she first saw the Mock Turtle interrupted, \'if you don\'t even know what it might happen any minute, \'and then,\' thought she, \'if people had all to lie down on her toes when they arrived, with a bound into the loveliest garden you ever eat a little door was shut again, and went stamping about, and shouting \'Off with her face like the right way of expecting nothing but out-of-the-way things to happen, that it was too late to wish that! She went.</p><h3>I can\'t understand it myself.</h3><p>Gryphon, half to Alice. \'Nothing,\' said Alice. \'I\'ve so often read in the wind, and the beak-- Pray how did you do lessons?\' said Alice, timidly; \'some of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, \'we learned French and music.\' \'And washing?\' said the Duchess; \'and most things twinkled after that--only the March Hare, who had been found and handed back to the other: the Duchess.</p><h2>WOULD put their heads down!.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>I shall see it written up somewhere.\' Down, down, down. Would the fall was over. Alice was beginning to feel a little girl,\' said Alice, \'a great girl like you,\' (she might well say this), \'to go on for some minutes. The Caterpillar was the King; and the great puzzle!\' And she began looking at it uneasily, shaking it every now and then, if I was, I shouldn\'t want YOURS: I don\'t know,\' he went on without attending to her, so she sat down at her hands, and began:-- \'You are old,\' said the.</p>'),('vi',16,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Quo maxime quam tenetur at omnis quo accusantium. Perspiciatis quos mollitia iusto corrupti totam ut temporibus. Est ut error culpa.',NULL);
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
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
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
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(2,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','4','2022-03-20 04:34:13','2022-03-20 04:34:13'),(3,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(4,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(5,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(6,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(7,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(8,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(9,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','2','2022-03-20 04:34:13','2022-03-20 04:34:13'),(10,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(11,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(12,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(13,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','6','2022-03-20 04:34:13','2022-03-20 04:34:13'),(14,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(15,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','9','2022-03-20 04:34:13','2022-03-20 04:34:13'),(16,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(17,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','6','2022-03-20 04:34:13','2022-03-20 04:34:13'),(18,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(19,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','2','2022-03-20 04:34:13','2022-03-20 04:34:13'),(20,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(21,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','6','2022-03-20 04:34:13','2022-03-20 04:34:13'),(22,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(23,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(24,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(25,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','2','2022-03-20 04:34:13','2022-03-20 04:34:13'),(26,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(27,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','8','2022-03-20 04:34:13','2022-03-20 04:34:13'),(28,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(29,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','6','2022-03-20 04:34:14','2022-03-20 04:34:14'),(30,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(31,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','6','2022-03-20 04:34:14','2022-03-20 04:34:14'),(32,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(33,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(34,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(35,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','4','2022-03-20 04:34:14','2022-03-20 04:34:14'),(36,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(37,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','4','2022-03-20 04:38:43','2022-03-20 04:38:43'),(38,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(39,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','5','2022-03-20 04:38:43','2022-03-20 04:38:43'),(40,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(41,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','7','2022-03-20 04:38:43','2022-03-20 04:38:43'),(42,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(43,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','3','2022-03-20 04:38:43','2022-03-20 04:38:43'),(44,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(45,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','9','2022-03-20 04:38:43','2022-03-20 04:38:43'),(46,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(47,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','9','2022-03-20 04:38:43','2022-03-20 04:38:43'),(48,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(49,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','2','2022-03-20 04:38:43','2022-03-20 04:38:43'),(50,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(51,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','4','2022-03-20 04:38:43','2022-03-20 04:38:43'),(52,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(53,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','7','2022-03-20 04:38:43','2022-03-20 04:38:43'),(54,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(55,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','8','2022-03-20 04:38:43','2022-03-20 04:38:43'),(56,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(57,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','5','2022-03-20 04:38:43','2022-03-20 04:38:43'),(58,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:43','2022-03-20 04:38:43'),(59,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(60,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','6','2022-03-20 04:38:44','2022-03-20 04:38:44'),(61,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(62,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','3','2022-03-20 04:38:44','2022-03-20 04:38:44'),(63,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(64,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','6','2022-03-20 04:38:44','2022-03-20 04:38:44'),(65,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(66,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','7','2022-03-20 04:38:44','2022-03-20 04:38:44'),(67,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(68,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','2','2022-03-20 04:38:44','2022-03-20 04:38:44'),(69,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(70,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','3','2022-03-20 04:38:44','2022-03-20 04:38:44'),(71,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(72,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','4','2022-03-20 04:38:44','2022-03-20 04:38:44'),(73,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(74,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:38:44','2022-03-20 04:38:44'),(75,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(76,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','3','2022-08-14 00:50:40','2022-08-14 00:50:40'),(77,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(78,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(79,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(80,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','2','2022-08-14 00:50:40','2022-08-14 00:50:40'),(81,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(82,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','2','2022-08-14 00:50:40','2022-08-14 00:50:40'),(83,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(84,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','7','2022-08-14 00:50:40','2022-08-14 00:50:40'),(85,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(86,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','9','2022-08-14 00:50:40','2022-08-14 00:50:40'),(87,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(88,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','8','2022-08-14 00:50:40','2022-08-14 00:50:40'),(89,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(90,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','4','2022-08-14 00:50:40','2022-08-14 00:50:40'),(91,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(92,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','3','2022-08-14 00:50:40','2022-08-14 00:50:40'),(93,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(94,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','6','2022-08-14 00:50:40','2022-08-14 00:50:40'),(95,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(96,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','8','2022-08-14 00:50:40','2022-08-14 00:50:40'),(97,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(98,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','4','2022-08-14 00:50:40','2022-08-14 00:50:40'),(99,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(100,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(101,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(102,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','6','2022-08-14 00:50:40','2022-08-14 00:50:40'),(103,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(104,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','9','2022-08-14 00:50:40','2022-08-14 00:50:40'),(105,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(106,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','3','2022-08-14 00:50:40','2022-08-14 00:50:40'),(107,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40'),(108,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','2','2022-08-14 00:50:40','2022-08-14 00:50:40'),(109,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-08-14 00:50:40','2022-08-14 00:50:40');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
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
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
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
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"comment\",\"contact\",\"cookie-consent\",\"gallery\",\"newsletter\",\"post-collection\",\"post-scheduler\",\"pro-posts\",\"request-log\",\"rss-feed\",\"social-login\",\"toc\",\"translation\",\"member\"]',NULL,NULL),(6,'show_admin_bar','1',NULL,NULL),(7,'theme','ultra',NULL,NULL),(8,'admin_logo','general/logo-white.png',NULL,NULL),(9,'admin_favicon','general/favicon.png',NULL,NULL),(100,'theme-vi-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(102,'comment_enable','1',NULL,NULL),(103,'comment_menu_enable','[\"Botble\\\\Blog\\\\Models\\\\Post\"]',NULL,NULL),(104,'plugin_comment_copyright','',NULL,NULL),(206,'custom_header_js','<script async src=\"https://platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>',NULL,NULL),(207,'custom_body_js','',NULL,NULL),(208,'custom_footer_js','',NULL,NULL),(225,'language_hide_default','1',NULL,NULL),(226,'language_switcher_display','list',NULL,NULL),(227,'language_display','all',NULL,NULL),(228,'language_hide_languages','[]',NULL,NULL),(233,'theme-ultra-site_title','UltraNews - Laravel News and Magazine Multilingual System',NULL,NULL),(234,'theme-ultra-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.',NULL,NULL),(235,'theme-ultra-seo_og_image','general/screenshot.png',NULL,NULL),(236,'theme-ultra-copyright','©2022 UltraNews -',NULL,NULL),(237,'theme-ultra-designed_by','| Design by AliThemes',NULL,NULL),(238,'theme-ultra-favicon','general/favicon.png',NULL,NULL),(239,'theme-ultra-website','https://thesky9.com',NULL,NULL),(240,'theme-ultra-contact_email','support@thesky9.com',NULL,NULL),(241,'theme-ultra-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.',NULL,NULL),(242,'theme-ultra-phone','+(123) 345-6789',NULL,NULL),(243,'theme-ultra-email','contact@gmail.com',NULL,NULL),(244,'theme-ultra-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(245,'theme-ultra-cookie_consent_message','Your experience on this site will be improved by allowing cookies',NULL,NULL),(246,'theme-ultra-cookie_consent_learn_more_url','http://localhost/cookie-policy',NULL,NULL),(247,'theme-ultra-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(248,'theme-ultra-homepage_id','1',NULL,NULL),(249,'theme-ultra-blog_page_id','4',NULL,NULL),(250,'theme-ultra-single_layout','default',NULL,NULL),(251,'theme-ultra-single_title_layout','top-full',NULL,NULL),(252,'theme-ultra-action_title','All you need to build new site',NULL,NULL),(253,'theme-ultra-action_button_text','Buy Now',NULL,NULL),(254,'theme-ultra-action_button_url','https://codecanyon.net/user/thesky9',NULL,NULL),(255,'theme-ultra-logo','general/logo.png',NULL,NULL),(256,'theme-ultra-logo_mobile','general/logo-mobile.png',NULL,NULL),(257,'theme-ultra-logo_tablet','general/logo-tablet.png',NULL,NULL),(258,'theme-ultra-logo_white','general/logo-white.png',NULL,NULL),(259,'theme-ultra-img_loading','general/img-loading.jpg',NULL,NULL),(260,'theme-ultra-font_heading','Arimo',NULL,NULL),(261,'theme-ultra-font_body','Roboto',NULL,NULL),(262,'theme-ultra-color_primary','#87C6E3',NULL,NULL),(263,'theme-ultra-color_secondary','#455265',NULL,NULL),(264,'theme-ultra-color_success','#76E1C6',NULL,NULL),(265,'theme-ultra-color_danger','#F0A9A9',NULL,NULL),(266,'theme-ultra-color_warning','#E6BF7E',NULL,NULL),(267,'theme-ultra-color_info','#58C1C8',NULL,NULL),(268,'theme-ultra-color_light','#F3F3F3',NULL,NULL),(269,'theme-ultra-color_dark','#111111',NULL,NULL),(270,'theme-ultra-color_link','#222831',NULL,NULL),(271,'theme-ultra-color_white','#FFFFFF',NULL,NULL),(272,'theme-ultra-header_style','style-1',NULL,NULL),(273,'theme-ultra-preloader_enabled','no',NULL,NULL),(274,'theme-ultra-allow_account_login','yes',NULL,NULL),(275,'theme-ultra-comment_type_in_post','member',NULL,NULL),(276,'theme-ultra-recently_viewed_posts_enable','no',NULL,NULL),(277,'theme-ultra-vi-site_title','UltraNews - Laravel News and Magazine Multilingual System',NULL,NULL),(278,'theme-ultra-vi-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.',NULL,NULL),(279,'theme-ultra-vi-seo_og_image','general/screenshot.png',NULL,NULL),(280,'theme-ultra-vi-copyright','©2022 Thiết kế bởi AliThemes ',NULL,NULL),(281,'theme-ultra-vi-designed_by','| Design by AliThemes',NULL,NULL),(282,'theme-ultra-vi-favicon','general/favicon.png',NULL,NULL),(283,'theme-ultra-vi-website','https://thesky9.com',NULL,NULL),(284,'theme-ultra-vi-contact_email','support@thesky9.com',NULL,NULL),(285,'theme-ultra-vi-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.',NULL,NULL),(286,'theme-ultra-vi-phone','+(123) 345-6789',NULL,NULL),(287,'theme-ultra-vi-email','contact@gmail.com',NULL,NULL),(288,'theme-ultra-vi-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(289,'theme-ultra-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(290,'theme-ultra-vi-cookie_consent_learn_more_url','http://localhost/cookie-policy',NULL,NULL),(291,'theme-ultra-vi-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(292,'theme-ultra-vi-homepage_id','1',NULL,NULL),(293,'theme-ultra-vi-blog_page_id','4',NULL,NULL),(294,'theme-ultra-vi-single_layout','default',NULL,NULL),(295,'theme-ultra-vi-single_title_layout','top-full',NULL,NULL),(296,'theme-ultra-vi-logo','general/logo.png',NULL,NULL),(297,'theme-ultra-vi-logo_mobile','general/logo-mobile.png',NULL,NULL),(298,'theme-ultra-vi-logo_tablet','general/logo-tablet.png',NULL,NULL),(299,'theme-ultra-vi-logo_white','general/logo-white.png',NULL,NULL),(300,'theme-ultra-vi-action_title','Bạn cần tạo mới website',NULL,NULL),(301,'theme-ultra-vi-action_button_text','Mua Ngay',NULL,NULL),(302,'theme-ultra-vi-action_button_url','https://codecanyon.net/user/thesky9',NULL,NULL),(303,'theme-ultra-vi-font_heading','Arimo',NULL,NULL),(304,'theme-ultra-vi-font_body','Roboto',NULL,NULL),(305,'theme-ultra-vi-color_brand_1','#ffcda3',NULL,NULL),(306,'theme-ultra-vi-color_brand_2','#fce2ce',NULL,NULL),(307,'theme-ultra-vi-color_brand_3','#ffede5',NULL,NULL),(308,'theme-ultra-vi-color_brand_4','#fff5ef',NULL,NULL),(309,'theme-ultra-vi-color_primary','#87c6e3',NULL,NULL),(310,'theme-ultra-vi-color_secondary','#455265',NULL,NULL),(311,'theme-ultra-vi-color_success','#76e1c6',NULL,NULL),(312,'theme-ultra-vi-color_danger','#f0a9a9',NULL,NULL),(313,'theme-ultra-vi-color_warning','#e6bf7e',NULL,NULL),(314,'theme-ultra-vi-color_info','#58c1c8',NULL,NULL),(315,'theme-ultra-vi-color_light','#F3F3F3',NULL,NULL),(316,'theme-ultra-vi-color_dark','#111111',NULL,NULL),(317,'theme-ultra-vi-color_link','#222831',NULL,NULL),(318,'theme-ultra-vi-color_white','#FFFFFF',NULL,NULL),(319,'theme-ultra-vi-header_style','style-1',NULL,NULL),(320,'theme-ultra-vi-preloader_enabled','0',NULL,NULL),(321,'theme-ultra-vi-allow_account_login','yes',NULL,NULL),(322,'theme-ultra-vi-comment_type_in_post','member',NULL,NULL),(323,'theme-ultra-vi-recently_viewed_posts_enable','yes',NULL,NULL),(324,'theme-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":null},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"},{\"key\":\"social-total-follow\",\"value\":null}]]',NULL,NULL),(326,'media_random_hash','0e5e01d4e11cafafb45af2b1684d87c6',NULL,NULL),(330,'theme-ultra-show_site_name','0',NULL,NULL),(331,'theme-ultra-seo_title','',NULL,NULL),(332,'theme-ultra-facebook_chat_enabled','no',NULL,NULL),(333,'theme-ultra-facebook_page_id','',NULL,NULL),(334,'theme-ultra-posts_layout','list',NULL,NULL),(335,'theme-ultra-post_date_format','d M, Y',NULL,NULL),(336,'theme-ultra-post_date_short_format','M d',NULL,NULL),(337,'theme-ultra-enable_show_post_author_detail','yes',NULL,NULL),(338,'theme-ultra-number_of_posts_in_a_category','12',NULL,NULL),(339,'theme-ultra-number_of_posts_in_a_tag','12',NULL,NULL),(340,'theme-ultra-cookie_consent_enable','yes',NULL,NULL),(341,'theme-ultra-cookie_consent_style','full-width',NULL,NULL),(342,'theme-ultra-cookie_consent_button_text','Allow cookies',NULL,NULL),(343,'theme-ultra-cookie_consent_background_color','#000000',NULL,NULL),(344,'theme-ultra-cookie_consent_text_color','#FFFFFF',NULL,NULL),(345,'theme-ultra-cookie_consent_max_width','1170',NULL,NULL);
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
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (133,'homepage',1,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(134,'home-2',2,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(135,'home-3',3,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(136,'blog',4,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(137,'category-list',5,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(138,'category-grid',6,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(139,'category-metro',7,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(140,'contact',8,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(141,'about-us',9,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(142,'cookie-policy',10,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:31','2022-08-14 00:50:31'),(143,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(144,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(145,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(146,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(147,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(148,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(149,'building',7,'Botble\\Gallery\\Models\\Gallery','galleries','2022-08-14 00:50:32','2022-08-14 00:50:32'),(150,'design',1,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(151,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(152,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(153,'healthy',4,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(154,'fashion',5,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(155,'hotel',6,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(156,'nature',7,'Botble\\Blog\\Models\\Category','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(157,'general',1,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(158,'beauty',2,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(159,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(160,'lifestyle',4,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(161,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(162,'business',6,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(163,'health',7,'Botble\\Blog\\Models\\Tag','tag','2022-08-14 00:50:38','2022-08-14 00:50:38'),(164,'this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',1,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(165,'the-world-caters-to-average-people-and-mediocre-lifestyles',2,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(166,'not-a-bit-of-hesitation-you-better-think-twice',3,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(167,'we-got-a-right-to-pick-a-little-fight-bonanza',4,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(168,'my-entrance-exam-was-on-a-book-of-matches',5,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(169,'essential-qualities-of-highly-successful-music',6,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(170,'why-teamwork-really-makes-the-dream-work',7,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(171,'9-things-i-love-about-shaving-my-head-during-quarantine',8,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(172,'the-litigants-on-the-screen-are-not-actors',9,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(173,'imagine-losing-20-pounds-in-14-days',10,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(174,'are-you-still-using-that-slow-old-typewriter',11,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(175,'a-skin-cream-thats-proven-to-work',12,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(176,'10-reasons-to-start-your-own-profitable-website',13,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(177,'level-up-your-live-streams-with-automated-captions-and-more',14,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(178,'simple-ways-to-reduce-your-unwanted-wrinkles',15,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(179,'apple-imac-with-retina-5k-display-review',16,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(180,'10000-web-site-visitors-in-one-monthguaranteed',17,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(181,'unlock-the-secrets-of-selling-high-ticket-items',18,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(182,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',19,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(183,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',20,'Botble\\Blog\\Models\\Post','','2022-08-14 00:50:38','2022-08-14 00:50:38'),(184,'john-smith',1,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(185,'luther-nitzsche',2,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(186,'vinnie-gutkowski',3,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(187,'geovanny-conn',4,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(188,'devonte-mckenzie',5,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(189,'ubaldo-zulauf',6,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(190,'chadd-aufderhar',7,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(191,'baylee-mayer',8,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(192,'mollie-kunze',9,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(193,'elisa-mckenzie',10,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(194,'dominique-schumm',11,'Botble\\Member\\Models\\Member','author','2022-08-14 00:50:40','2022-08-14 00:50:40'),(195,'editors-picked',1,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:42','2022-08-14 00:50:42'),(196,'recommended-posts',2,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:42','2022-08-14 00:50:42'),(197,'bai-viet-hay',3,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:42','2022-08-14 00:50:42'),(198,'recommended-posts',4,'Botble\\Page\\Models\\Page','','2022-08-14 00:50:42','2022-08-14 00:50:42');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
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
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38'),(2,'Beauty',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38'),(4,'Lifestyle',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38'),(5,'Travel',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38'),(6,'Business',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38'),(7,'Health',1,'Botble\\ACL\\Models\\User','','published','2022-08-14 00:50:38','2022-08-14 00:50:38');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@thesky9.com',NULL,'$2y$10$YxYjXYQkWVnKWu6TFKfhYu8xUJS3tO6.m4SKMdVPfnS5SFuhx3iey',NULL,'2022-08-14 00:50:30','2022-08-14 00:50:30','System','Admin','admin',NULL,1,1,NULL,NULL);
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
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `widgets` VALUES (1,'SocialsWidget','primary_sidebar','ultra',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(2,'AdsWidget','primary_sidebar','ultra',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(3,'CategoriesMenuWidget','primary_sidebar','ultra',0,'{\"id\":\"CategoriesMenuWidget\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(4,'LastestPostsWidget','primary_sidebar','ultra',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"Lastest Post\",\"number_display\":6}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(5,'TagsWidget','primary_sidebar','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":10}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(6,'AdsWidget','primary_sidebar','ultra',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(7,'AboutWidget','footer_sidebar_1','ultra',1,'{\"id\":\"AboutWidget\",\"name\":\"About me\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(8,'PopularPostsWidget','footer_sidebar_2','ultra',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"Popular Posts\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(9,'CustomMenuWidget','footer_sidebar_3','ultra',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(10,'TagsWidget','footer_sidebar_3','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(11,'NewsletterWidget','footer_sidebar_4','ultra',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(12,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(13,'SocialsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(14,'AdsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(15,'CategoriesMenuWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"CategoriesMenuWidget\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(16,'LastestPostsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi nh\\u1ea5t\",\"number_display\":6}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(17,'TagsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Th\\u1ebb\",\"number_display\":10}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(18,'AdsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(19,'AboutWidget','footer_sidebar_1','ultra-vi',1,'{\"id\":\"AboutWidget\",\"name\":\"V\\u1ec1 ch\\u00fang t\\u00f4i\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(20,'PopularPostsWidget','footer_sidebar_2','ultra-vi',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"N\\u1ed5i b\\u1eadt\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(21,'CustomMenuWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(22,'TagsWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(23,'NewsletterWidget','footer_sidebar_4','ultra-vi',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2022-08-14 00:50:41','2022-08-14 00:50:41'),(24,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra-vi',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2022-08-14 00:50:41','2022-08-14 00:50:41');
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

-- Dump completed on 2022-08-14  7:55:13
