-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: vendure
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `fullName` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `streetLine1` varchar(255) NOT NULL,
  `streetLine2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `postalCode` varchar(255) NOT NULL DEFAULT '',
  `phoneNumber` varchar(255) NOT NULL DEFAULT '',
  `defaultShippingAddress` tinyint(4) NOT NULL DEFAULT 0,
  `defaultBillingAddress` tinyint(4) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_dc34d382b493ade1f70e834c4d` (`customerId`),
  KEY `IDX_d87215343c3a3a67e6a0b7f3ea` (`countryId`),
  CONSTRAINT `FK_d87215343c3a3a67e6a0b7f3ea9` FOREIGN KEY (`countryId`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dc34d382b493ade1f70e834c4d3` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_154f5c538b1576ccc277b1ed63` (`emailAddress`),
  UNIQUE KEY `REL_1966e18ce6a39a82b19204704d` (`userId`),
  CONSTRAINT `FK_1966e18ce6a39a82b19204704d7` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('2023-07-22 16:43:47.607443','2023-07-22 16:43:47.607443',NULL,'Super','Admin','superadmin',1,1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `fileSize` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `focalPoint` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES ('2023-07-23 00:03:12.341063','2023-07-23 00:03:12.341063','2520120032_2_1_1.jpg','IMAGE','image/jpeg',1024,1536,51657,'source/0b/2520120032_2_1_1.jpg','preview/d3/2520120032_2_1_1__preview.jpg',NULL,1);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_channels_channel`
--

DROP TABLE IF EXISTS `asset_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_channels_channel` (
  `assetId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`assetId`,`channelId`),
  KEY `IDX_dc4e7435f9f5e9e6436bebd33b` (`assetId`),
  KEY `IDX_16ca9151a5153f1169da5b7b7e` (`channelId`),
  CONSTRAINT `FK_16ca9151a5153f1169da5b7b7e3` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dc4e7435f9f5e9e6436bebd33bb` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_channels_channel`
--

LOCK TABLES `asset_channels_channel` WRITE;
/*!40000 ALTER TABLE `asset_channels_channel` DISABLE KEYS */;
INSERT INTO `asset_channels_channel` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `asset_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_tags_tag`
--

DROP TABLE IF EXISTS `asset_tags_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_tags_tag` (
  `assetId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`assetId`,`tagId`),
  KEY `IDX_9e412b00d4c6cee1a4b3d92071` (`assetId`),
  KEY `IDX_fb5e800171ffbe9823f2cc727f` (`tagId`),
  CONSTRAINT `FK_9e412b00d4c6cee1a4b3d920716` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fb5e800171ffbe9823f2cc727fd` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_tags_tag`
--

LOCK TABLES `asset_tags_tag` WRITE;
/*!40000 ALTER TABLE `asset_tags_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_tags_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_method`
--

DROP TABLE IF EXISTS `authentication_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_method` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `identifier` varchar(255) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `verificationToken` varchar(255) DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `identifierChangeToken` varchar(255) DEFAULT NULL,
  `pendingIdentifier` varchar(255) DEFAULT NULL,
  `strategy` varchar(255) DEFAULT NULL,
  `externalIdentifier` varchar(255) DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_00cbe87bc0d4e36758d61bd31d` (`userId`),
  KEY `IDX_a23445b2c942d8dfcae15b8de2` (`type`),
  CONSTRAINT `FK_00cbe87bc0d4e36758d61bd31d6` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_method`
--

LOCK TABLES `authentication_method` WRITE;
/*!40000 ALTER TABLE `authentication_method` DISABLE KEYS */;
INSERT INTO `authentication_method` VALUES ('2023-07-22 16:43:47.555818','2023-07-22 16:43:47.000000','superadmin','$2b$12$D7bYwEXCnHVs9Ifcm3eObeOxtTbQgUP1cSasvzZwLUetG3CDEfF3q',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'NativeAuthenticationMethod',1),('2023-07-22 16:44:21.770354','2023-07-22 23:49:33.000000','june@zara.com','$2b$12$j3BVQm4/Vppot6FThf0JWOb0oorkogqu/JgW4LoUpPKiaWD7C792m','MjAyMy0wNy0yMlQxNTo0OTozMy44NTJa_2FZQA25HZV5TR42K',NULL,NULL,NULL,NULL,NULL,NULL,2,'NativeAuthenticationMethod',2);
/*!40000 ALTER TABLE `authentication_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `code` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `defaultLanguageCode` varchar(255) NOT NULL,
  `availableLanguageCodes` text DEFAULT NULL,
  `defaultCurrencyCode` varchar(255) NOT NULL,
  `availableCurrencyCodes` text DEFAULT NULL,
  `trackInventory` tinyint(4) NOT NULL DEFAULT 1,
  `outOfStockThreshold` int(11) NOT NULL DEFAULT 0,
  `pricesIncludeTax` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellerId` int(11) DEFAULT NULL,
  `defaultTaxZoneId` int(11) DEFAULT NULL,
  `defaultShippingZoneId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_06127ac6c6d913f4320759971d` (`code`),
  UNIQUE KEY `IDX_842699fce4f3470a7d06d89de8` (`token`),
  KEY `IDX_af2116c7e176b6b88dceceeb74` (`sellerId`),
  KEY `IDX_afe9f917a1c82b9e9e69f7c612` (`defaultTaxZoneId`),
  KEY `IDX_c9ca2f58d4517460435cbd8b4c` (`defaultShippingZoneId`),
  CONSTRAINT `FK_af2116c7e176b6b88dceceeb74b` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_afe9f917a1c82b9e9e69f7c6129` FOREIGN KEY (`defaultTaxZoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c9ca2f58d4517460435cbd8b4c9` FOREIGN KEY (`defaultShippingZoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES ('2023-07-22 16:43:45.431707','2023-07-23 00:30:22.000000','__default_channel__','lwlkavfkln1s4m5zovq','','en','en','NGN','NGN',1,0,1,1,1,1,1),('2023-07-23 00:22:46.719012','2023-07-23 00:22:58.000000','NGN','ngn','','en','en','NGN','NGN',1,0,1,2,1,1,1);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `isRoot` tinyint(4) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL,
  `isPrivate` tinyint(4) NOT NULL DEFAULT 0,
  `filters` text NOT NULL,
  `inheritFilters` tinyint(4) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `featuredAssetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7256fef1bb42f1b38156b7449f` (`featuredAssetId`),
  KEY `FK_4257b61275144db89fa0f5dc059` (`parentId`),
  CONSTRAINT `FK_4257b61275144db89fa0f5dc059` FOREIGN KEY (`parentId`) REFERENCES `collection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7256fef1bb42f1b38156b7449f5` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_asset`
--

DROP TABLE IF EXISTS `collection_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `assetId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `collectionId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `IDX_51da53b26522dc0525762d2de8` (`assetId`),
  KEY `IDX_1ed9e48dfbf74b5fcbb35d3d68` (`collectionId`),
  CONSTRAINT `FK_1ed9e48dfbf74b5fcbb35d3d686` FOREIGN KEY (`collectionId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_51da53b26522dc0525762d2de8e` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_asset`
--

LOCK TABLES `collection_asset` WRITE;
/*!40000 ALTER TABLE `collection_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_channels_channel`
--

DROP TABLE IF EXISTS `collection_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_channels_channel` (
  `collectionId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`,`channelId`),
  KEY `IDX_cdbf33ffb5d451916125152008` (`collectionId`),
  KEY `IDX_7216ab24077cf5cbece7857dbb` (`channelId`),
  CONSTRAINT `FK_7216ab24077cf5cbece7857dbbd` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cdbf33ffb5d4519161251520083` FOREIGN KEY (`collectionId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_channels_channel`
--

LOCK TABLES `collection_channels_channel` WRITE;
/*!40000 ALTER TABLE `collection_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_closure`
--

DROP TABLE IF EXISTS `collection_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_closure` (
  `id_ancestor` int(11) NOT NULL,
  `id_descendant` int(11) NOT NULL,
  PRIMARY KEY (`id_ancestor`,`id_descendant`),
  KEY `IDX_c309f8cd152bbeaea08491e0c6` (`id_ancestor`),
  KEY `IDX_457784c710f8ac9396010441f6` (`id_descendant`),
  CONSTRAINT `FK_457784c710f8ac9396010441f6c` FOREIGN KEY (`id_descendant`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_c309f8cd152bbeaea08491e0c66` FOREIGN KEY (`id_ancestor`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_closure`
--

LOCK TABLES `collection_closure` WRITE;
/*!40000 ALTER TABLE `collection_closure` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_product_variants_product_variant`
--

DROP TABLE IF EXISTS `collection_product_variants_product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_product_variants_product_variant` (
  `collectionId` int(11) NOT NULL,
  `productVariantId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`,`productVariantId`),
  KEY `IDX_6faa7b72422d9c4679e2f186ad` (`collectionId`),
  KEY `IDX_fb05887e2867365f236d7dd95e` (`productVariantId`),
  CONSTRAINT `FK_6faa7b72422d9c4679e2f186ad1` FOREIGN KEY (`collectionId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fb05887e2867365f236d7dd95ee` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_product_variants_product_variant`
--

LOCK TABLES `collection_product_variants_product_variant` WRITE;
/*!40000 ALTER TABLE `collection_product_variants_product_variant` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_product_variants_product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_translation`
--

DROP TABLE IF EXISTS `collection_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9f9da7d94b0278ea0f7831e1fc` (`slug`),
  KEY `IDX_e329f9036210d75caa1d8f2154` (`baseId`),
  CONSTRAINT `FK_e329f9036210d75caa1d8f2154a` FOREIGN KEY (`baseId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_translation`
--

LOCK TABLES `collection_translation` WRITE;
/*!40000 ALTER TABLE `collection_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_3f62b42ed23958b120c235f74d` (`userId`),
  CONSTRAINT `FK_3f62b42ed23958b120c235f74df` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('2023-07-22 16:44:20.784088','2023-07-22 16:44:21.000000',NULL,'june baby','june','baby','+2348078699','june@zara.com',1,2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_channels_channel`
--

DROP TABLE IF EXISTS `customer_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_channels_channel` (
  `customerId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`,`channelId`),
  KEY `IDX_a842c9fe8cd4c8ff31402d172d` (`customerId`),
  KEY `IDX_dc9f69207a8867f83b0fd257e3` (`channelId`),
  CONSTRAINT `FK_a842c9fe8cd4c8ff31402d172d7` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dc9f69207a8867f83b0fd257e30` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_channels_channel`
--

LOCK TABLES `customer_channels_channel` WRITE;
/*!40000 ALTER TABLE `customer_channels_channel` DISABLE KEYS */;
INSERT INTO `customer_channels_channel` VALUES (1,1);
/*!40000 ALTER TABLE `customer_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups_customer_group`
--

DROP TABLE IF EXISTS `customer_groups_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups_customer_group` (
  `customerId` int(11) NOT NULL,
  `customerGroupId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`,`customerGroupId`),
  KEY `IDX_b823a3c8bf3b78d3ed68736485` (`customerId`),
  KEY `IDX_85feea3f0e5e82133605f78db0` (`customerGroupId`),
  CONSTRAINT `FK_85feea3f0e5e82133605f78db02` FOREIGN KEY (`customerGroupId`) REFERENCES `customer_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_b823a3c8bf3b78d3ed68736485c` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups_customer_group`
--

LOCK TABLES `customer_groups_customer_group` WRITE;
/*!40000 ALTER TABLE `customer_groups_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_groups_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facet`
--

DROP TABLE IF EXISTS `facet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facet` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `isPrivate` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0c9a5d053fdf4ebb5f0490b40f` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facet`
--

LOCK TABLES `facet` WRITE;
/*!40000 ALTER TABLE `facet` DISABLE KEYS */;
/*!40000 ALTER TABLE `facet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facet_channels_channel`
--

DROP TABLE IF EXISTS `facet_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facet_channels_channel` (
  `facetId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`facetId`,`channelId`),
  KEY `IDX_ca796020c6d097e251e5d6d2b0` (`facetId`),
  KEY `IDX_2a8ea404d05bf682516184db7d` (`channelId`),
  CONSTRAINT `FK_2a8ea404d05bf682516184db7d3` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ca796020c6d097e251e5d6d2b02` FOREIGN KEY (`facetId`) REFERENCES `facet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facet_channels_channel`
--

LOCK TABLES `facet_channels_channel` WRITE;
/*!40000 ALTER TABLE `facet_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `facet_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facet_translation`
--

DROP TABLE IF EXISTS `facet_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facet_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_eaea53f44bf9e97790d38a3d68` (`baseId`),
  CONSTRAINT `FK_eaea53f44bf9e97790d38a3d68f` FOREIGN KEY (`baseId`) REFERENCES `facet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facet_translation`
--

LOCK TABLES `facet_translation` WRITE;
/*!40000 ALTER TABLE `facet_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `facet_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facet_value`
--

DROP TABLE IF EXISTS `facet_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facet_value` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `code` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_d101dc2265a7341be3d94968c5` (`facetId`),
  CONSTRAINT `FK_d101dc2265a7341be3d94968c5b` FOREIGN KEY (`facetId`) REFERENCES `facet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facet_value`
--

LOCK TABLES `facet_value` WRITE;
/*!40000 ALTER TABLE `facet_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `facet_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facet_value_channels_channel`
--

DROP TABLE IF EXISTS `facet_value_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facet_value_channels_channel` (
  `facetValueId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`facetValueId`,`channelId`),
  KEY `IDX_ad690c1b05596d7f52e52ffeed` (`facetValueId`),
  KEY `IDX_e1d54c0b9db3e2eb17faaf5919` (`channelId`),
  CONSTRAINT `FK_ad690c1b05596d7f52e52ffeedd` FOREIGN KEY (`facetValueId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_e1d54c0b9db3e2eb17faaf5919c` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facet_value_channels_channel`
--

LOCK TABLES `facet_value_channels_channel` WRITE;
/*!40000 ALTER TABLE `facet_value_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `facet_value_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facet_value_translation`
--

DROP TABLE IF EXISTS `facet_value_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facet_value_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3d6e45823b65de808a66cb1423` (`baseId`),
  CONSTRAINT `FK_3d6e45823b65de808a66cb1423b` FOREIGN KEY (`baseId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facet_value_translation`
--

LOCK TABLES `facet_value_translation` WRITE;
/*!40000 ALTER TABLE `facet_value_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `facet_value_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fulfillment`
--

DROP TABLE IF EXISTS `fulfillment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fulfillment` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `state` varchar(255) NOT NULL,
  `trackingCode` varchar(255) NOT NULL DEFAULT '',
  `method` varchar(255) NOT NULL,
  `handlerCode` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fulfillment`
--

LOCK TABLES `fulfillment` WRITE;
/*!40000 ALTER TABLE `fulfillment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fulfillment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_settings`
--

DROP TABLE IF EXISTS `global_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_settings` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `availableLanguages` text NOT NULL,
  `trackInventory` tinyint(4) NOT NULL DEFAULT 1,
  `outOfStockThreshold` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_settings`
--

LOCK TABLES `global_settings` WRITE;
/*!40000 ALTER TABLE `global_settings` DISABLE KEYS */;
INSERT INTO `global_settings` VALUES ('2023-07-22 16:43:45.261151','2023-07-23 00:16:42.000000','en',1,10,1);
/*!40000 ALTER TABLE `global_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_entry`
--

DROP TABLE IF EXISTS `history_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_entry` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `type` varchar(255) NOT NULL,
  `isPublic` tinyint(4) NOT NULL,
  `data` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(255) NOT NULL,
  `administratorId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92f8c334ef06275f9586fd0183` (`administratorId`),
  KEY `IDX_43ac602f839847fdb91101f30e` (`customerId`),
  KEY `IDX_3a05127e67435b4d2332ded7c9` (`orderId`),
  KEY `IDX_f3a761f6bcfabb474b11e1e51f` (`discriminator`),
  CONSTRAINT `FK_3a05127e67435b4d2332ded7c9e` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_43ac602f839847fdb91101f30ec` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_92f8c334ef06275f9586fd01832` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_entry`
--

LOCK TABLES `history_entry` WRITE;
/*!40000 ALTER TABLE `history_entry` DISABLE KEYS */;
INSERT INTO `history_entry` VALUES ('2023-07-22 08:44:20.813000','2023-07-22 16:44:20.817859','CUSTOMER_REGISTERED',0,'{\"strategy\":\"native\"}',1,'CustomerHistoryEntry',NULL,1,NULL),('2023-07-22 15:49:33.814000','2023-07-22 23:49:33.834801','CUSTOMER_REGISTERED',0,'{\"strategy\":\"native\"}',2,'CustomerHistoryEntry',NULL,1,NULL);
/*!40000 ALTER TABLE `history_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_record`
--

DROP TABLE IF EXISTS `job_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_record` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `queueName` varchar(255) NOT NULL,
  `data` text DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `progress` int(11) NOT NULL,
  `result` text DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `startedAt` datetime(6) DEFAULT NULL,
  `settledAt` datetime(6) DEFAULT NULL,
  `isSettled` tinyint(4) NOT NULL,
  `retries` int(11) NOT NULL,
  `attempts` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_record`
--

LOCK TABLES `job_record` WRITE;
/*!40000 ALTER TABLE `job_record` DISABLE KEYS */;
INSERT INTO `job_record` VALUES ('2023-07-22 16:44:22.017959','2023-07-22 16:44:22.000000','send-email','{\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_sockname\":null,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":7688,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50706,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":989666,\"bytesWritten\":989666},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"613\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/shop-api\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":7688,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50706,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":989666,\"bytesWritten\":989666},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/shop-api\",\"originalUrl\":\"/shop-api\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":null,\"query\":null,\"pathname\":\"/shop-api\",\"path\":\"/shop-api\",\"href\":\"/shop-api\",\"_raw\":\"/shop-api\"},\"params\":{},\"query\":{},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"77\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en-GB\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 77\\r\\nETag: W/\\\"4d-pji/p6Bv5xmTuX75e3Euut6qSPw\\\"\\r\\nDate: Sat, 22 Jul 2023 08:44:21 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{},\"body\":{\"operationName\":\"RegisterCustomerAccount\",\"query\":\"mutation RegisterCustomerAccount($emailAddress: String!, $title: String, $firstName: String!, $lastName: String, $phoneNumber: String, $password: String) {\\n  registerCustomerAccount(\\n    input: {emailAddress: $emailAddress, title: $title, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password}\\n  ) {\\n    __typename\\n    ... on Success {\\n      success\\n    }\\n  }\\n}\\n\"},\"_body\":true,\"i18nextLookupName\":\"header\",\"lng\":\"en-GB\",\"locale\":\"en-GB\",\"language\":\"en-GB\",\"languages\":[\"en-GB\",\"en\"],\"i18n\":{\"language\":\"en-GB\",\"languages\":[\"en-GB\",\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"shop\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":false,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"shop\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":false,\"_authorizedAsOwnerOnly\":false},\"type\":\"email-verification\",\"recipient\":\"june@zara.com\",\"from\":\"{{ fromAddress }}\",\"templateVars\":{\"fromAddress\":\"\\\"example\\\" <noreply@example.com>\",\"verifyEmailAddressUrl\":\"http://localhost:8080/verify\",\"passwordResetUrl\":\"http://localhost:8080/password-reset\",\"changeEmailAddressUrl\":\"http://localhost:8080/verify-email-address-change\",\"verificationToken\":\"MjAyMy0wNy0yMlQwODo0NDoyMS44NjVa_A3UQN6UYPDEQSXP6\"},\"subject\":\"Please verify your email address\",\"templateFile\":\"body.hbs\",\"attachments\":[]}','COMPLETED',100,'true',NULL,'2023-07-22 08:44:22.186000','2023-07-22 08:44:22.584000',1,5,1,1),('2023-07-22 23:49:34.035343','2023-07-22 23:49:34.000000','send-email','{\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_sockname\":null,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":11988,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50413,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":1649114,\"bytesWritten\":1649114},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"613\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/shop-api\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":11988,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50413,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":1649114,\"bytesWritten\":1649114},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/shop-api\",\"originalUrl\":\"/shop-api\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":null,\"query\":null,\"pathname\":\"/shop-api\",\"path\":\"/shop-api\",\"href\":\"/shop-api\",\"_raw\":\"/shop-api\"},\"params\":{},\"query\":{},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"77\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en-GB\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 77\\r\\nETag: W/\\\"4d-pji/p6Bv5xmTuX75e3Euut6qSPw\\\"\\r\\nDate: Sat, 22 Jul 2023 15:49:33 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{},\"body\":{\"operationName\":\"RegisterCustomerAccount\",\"query\":\"mutation RegisterCustomerAccount($emailAddress: String!, $title: String, $firstName: String!, $lastName: String, $phoneNumber: String, $password: String) {\\n  registerCustomerAccount(\\n    input: {emailAddress: $emailAddress, title: $title, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, password: $password}\\n  ) {\\n    __typename\\n    ... on Success {\\n      success\\n    }\\n  }\\n}\\n\"},\"_body\":true,\"i18nextLookupName\":\"header\",\"lng\":\"en-GB\",\"locale\":\"en-GB\",\"language\":\"en-GB\",\"languages\":[\"en-GB\",\"en\"],\"i18n\":{\"language\":\"en-GB\",\"languages\":[\"en-GB\",\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"shop\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":false,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"shop\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":false,\"_authorizedAsOwnerOnly\":false},\"type\":\"email-verification\",\"recipient\":\"june@zara.com\",\"from\":\"{{ fromAddress }}\",\"templateVars\":{\"fromAddress\":\"\\\"example\\\" <noreply@example.com>\",\"verifyEmailAddressUrl\":\"http://localhost:8080/verify\",\"passwordResetUrl\":\"http://localhost:8080/password-reset\",\"changeEmailAddressUrl\":\"http://localhost:8080/verify-email-address-change\",\"verificationToken\":\"MjAyMy0wNy0yMlQxNTo0OTozMy44NTJa_2FZQA25HZV5TR42K\"},\"subject\":\"Please verify your email address\",\"templateFile\":\"body.hbs\",\"attachments\":[]}','COMPLETED',100,'true',NULL,'2023-07-22 15:49:34.218000','2023-07-22 15:49:34.432000',1,5,1,2),('2023-07-23 00:03:19.012459','2023-07-23 00:03:19.000000','update-search-index','{\"type\":\"update-product\",\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_sockname\":null,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":60370,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":2926,\"bytesWritten\":2926},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"2682\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory/create\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":60370,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":2926,\"bytesWritten\":2926},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/admin-api\",\"path\":\"/admin-api?languageCode=en\",\"href\":\"/admin-api?languageCode=en\",\"_raw\":\"/admin-api?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":false,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":null,\"_hasBody\":true,\"_trailer\":\"\",\"finished\":false,\"_headerSent\":false,\"_closed\":false,\"_header\":null,\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"headersSent\":false},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"CreateProduct\",\"query\":\"mutation CreateProduct($input: CreateProductInput!, $variantListOptions: ProductVariantListOptions) {\\n  createProduct(input: $input) {\\n    ...ProductDetail\\n    variantList(options: $variantListOptions) {\\n      items {\\n        ...ProductVariant\\n        __typename\\n      }\\n      totalItems\\n      __typename\\n    }\\n    __typename\\n  }\\n}\\n\\nfragment ProductDetail on Product {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  slug\\n  description\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    slug\\n    description\\n    __typename\\n  }\\n  optionGroups {\\n    ...ProductOptionGroup\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOptionGroup on ProductOptionGroup {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Asset on Asset {\\n  id\\n  createdAt\\n  updatedAt\\n  name\\n  fileSize\\n  mimeType\\n  type\\n  preview\\n  source\\n  width\\n  height\\n  focalPoint {\\n    x\\n    y\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductVariant on ProductVariant {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  price\\n  currencyCode\\n  priceWithTax\\n  stockOnHand\\n  stockAllocated\\n  trackInventory\\n  outOfStockThreshold\\n  useGlobalOutOfStockThreshold\\n  taxRateApplied {\\n    id\\n    name\\n    value\\n    __typename\\n  }\\n  taxCategory {\\n    id\\n    name\\n    __typename\\n  }\\n  sku\\n  options {\\n    ...ProductOption\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOption on ProductOption {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  groupId\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_session\":{\"cacheExpiry\":1690041973,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"productId\":1}','COMPLETED',100,'true',NULL,'2023-07-22 16:03:19.090000','2023-07-22 16:03:19.441000',1,0,1,3),('2023-07-23 00:03:19.366386','2023-07-23 00:03:19.000000','apply-collection-filters','{\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":60370,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":4749,\"bytesWritten\":4749},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"2682\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory/create\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":60370,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":4749,\"bytesWritten\":4749},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/\",\"path\":\"/?languageCode=en\",\"href\":\"/?languageCode=en\",\"_raw\":\"/?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"1406\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 1406\\r\\nETag: W/\\\"57e-cbRt/sRQDqweWAwcj05Cau14JXs\\\"\\r\\nDate: Sat, 22 Jul 2023 16:03:19 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"CreateProduct\",\"query\":\"mutation CreateProduct($input: CreateProductInput!, $variantListOptions: ProductVariantListOptions) {\\n  createProduct(input: $input) {\\n    ...ProductDetail\\n    variantList(options: $variantListOptions) {\\n      items {\\n        ...ProductVariant\\n        __typename\\n      }\\n      totalItems\\n      __typename\\n    }\\n    __typename\\n  }\\n}\\n\\nfragment ProductDetail on Product {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  slug\\n  description\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    slug\\n    description\\n    __typename\\n  }\\n  optionGroups {\\n    ...ProductOptionGroup\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOptionGroup on ProductOptionGroup {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Asset on Asset {\\n  id\\n  createdAt\\n  updatedAt\\n  name\\n  fileSize\\n  mimeType\\n  type\\n  preview\\n  source\\n  width\\n  height\\n  focalPoint {\\n    x\\n    y\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductVariant on ProductVariant {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  price\\n  currencyCode\\n  priceWithTax\\n  stockOnHand\\n  stockAllocated\\n  trackInventory\\n  outOfStockThreshold\\n  useGlobalOutOfStockThreshold\\n  taxRateApplied {\\n    id\\n    name\\n    value\\n    __typename\\n  }\\n  taxCategory {\\n    id\\n    name\\n    __typename\\n  }\\n  sku\\n  options {\\n    ...ProductOption\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOption on ProductOption {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  groupId\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_session\":{\"cacheExpiry\":1690041973,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"collectionIds\":[]}','COMPLETED',100,NULL,NULL,'2023-07-22 16:03:19.561000','2023-07-22 16:03:19.581000',1,0,1,4),('2023-07-23 00:03:19.440807','2023-07-23 00:03:19.000000','update-search-index','{\"type\":\"update-variants\",\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":62924,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":5201,\"bytesWritten\":5201},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"1480\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory/create\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":62924,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":5201,\"bytesWritten\":5201},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/admin-api\",\"path\":\"/admin-api?languageCode=en\",\"href\":\"/admin-api?languageCode=en\",\"_raw\":\"/admin-api?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"38\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 38\\r\\nETag: W/\\\"26-Swng84mvaAJ8JLarZ4A0lVFf6Aw\\\"\\r\\nDate: Sat, 22 Jul 2023 16:03:19 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"CreateProductVariants\",\"query\":\"mutation CreateProductVariants($input: [CreateProductVariantInput!]!) {\\n  createProductVariants(input: $input) {\\n    ...ProductVariant\\n    __typename\\n  }\\n}\\n\\nfragment ProductVariant on ProductVariant {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  price\\n  currencyCode\\n  priceWithTax\\n  stockOnHand\\n  stockAllocated\\n  trackInventory\\n  outOfStockThreshold\\n  useGlobalOutOfStockThreshold\\n  taxRateApplied {\\n    id\\n    name\\n    value\\n    __typename\\n  }\\n  taxCategory {\\n    id\\n    name\\n    __typename\\n  }\\n  sku\\n  options {\\n    ...ProductOption\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOption on ProductOption {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  groupId\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Asset on Asset {\\n  id\\n  createdAt\\n  updatedAt\\n  name\\n  fileSize\\n  mimeType\\n  type\\n  preview\\n  source\\n  width\\n  height\\n  focalPoint {\\n    x\\n    y\\n    __typename\\n  }\\n  __typename\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_session\":{\"cacheExpiry\":1690041973,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"variantIds\":[]}','COMPLETED',100,'true',NULL,'2023-07-22 16:03:19.678000','2023-07-22 16:03:19.896000',1,0,1,5),('2023-07-23 00:03:19.562363','2023-07-23 00:03:19.000000','apply-collection-filters','{\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":65184,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":5201,\"bytesWritten\":5201},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"1480\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory/create\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":65184,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":50936,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":5201,\"bytesWritten\":5201},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/\",\"path\":\"/?languageCode=en\",\"href\":\"/?languageCode=en\",\"_raw\":\"/?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"38\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 38\\r\\nETag: W/\\\"26-Swng84mvaAJ8JLarZ4A0lVFf6Aw\\\"\\r\\nDate: Sat, 22 Jul 2023 16:03:19 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"CreateProductVariants\",\"query\":\"mutation CreateProductVariants($input: [CreateProductVariantInput!]!) {\\n  createProductVariants(input: $input) {\\n    ...ProductVariant\\n    __typename\\n  }\\n}\\n\\nfragment ProductVariant on ProductVariant {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  price\\n  currencyCode\\n  priceWithTax\\n  stockOnHand\\n  stockAllocated\\n  trackInventory\\n  outOfStockThreshold\\n  useGlobalOutOfStockThreshold\\n  taxRateApplied {\\n    id\\n    name\\n    value\\n    __typename\\n  }\\n  taxCategory {\\n    id\\n    name\\n    __typename\\n  }\\n  sku\\n  options {\\n    ...ProductOption\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOption on ProductOption {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  groupId\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Asset on Asset {\\n  id\\n  createdAt\\n  updatedAt\\n  name\\n  fileSize\\n  mimeType\\n  type\\n  preview\\n  source\\n  width\\n  height\\n  focalPoint {\\n    x\\n    y\\n    __typename\\n  }\\n  __typename\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_session\":{\"cacheExpiry\":1690041973,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"collectionIds\":[]}','COMPLETED',100,NULL,NULL,'2023-07-22 16:03:19.903000','2023-07-22 16:03:19.942000',1,0,1,6),('2023-07-23 00:25:42.070502','2023-07-23 00:25:42.000000','update-search-index','{\"type\":\"assign-product-to-channel\",\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_sockname\":null,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":4319,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51767,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":2418,\"bytesWritten\":2418},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"341\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":4319,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51767,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":2418,\"bytesWritten\":2418},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/admin-api\",\"path\":\"/admin-api?languageCode=en\",\"href\":\"/admin-api?languageCode=en\",\"_raw\":\"/admin-api?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"149\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 149\\r\\nETag: W/\\\"95-KlFEpbB6eLY3mUR9CxJDTHtKBLk\\\"\\r\\nDate: Sat, 22 Jul 2023 16:25:42 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"AssignProductsToChannel\",\"query\":\"mutation AssignProductsToChannel($input: AssignProductsToChannelInput!) {\\n  assignProductsToChannel(input: $input) {\\n    id\\n    channels {\\n      id\\n      code\\n      __typename\\n    }\\n    __typename\\n  }\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_session\":{\"cacheExpiry\":1690043410,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]},{\"id\":2,\"token\":\"ngn\",\"code\":\"NGN\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"productId\":1,\"channelId\":2}','COMPLETED',100,'true',NULL,'2023-07-22 16:25:42.149000','2023-07-22 16:25:42.257000',1,0,1,7),('2023-07-23 00:27:57.943288','2023-07-23 00:27:58.000000','update-search-index','{\"type\":\"assign-product-to-channel\",\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_sockname\":null,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":3111,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51876,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":1963,\"bytesWritten\":1963},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"341\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"_httpMessage\":null,\"timeout\":5000,\"bytesRead\":3111,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51876,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":1963,\"bytesWritten\":1963},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/admin-api\",\"path\":\"/admin-api?languageCode=en\",\"href\":\"/admin-api?languageCode=en\",\"_raw\":\"/admin-api?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"149\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 149\\r\\nETag: W/\\\"95-KlFEpbB6eLY3mUR9CxJDTHtKBLk\\\"\\r\\nDate: Sat, 22 Jul 2023 16:27:57 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"AssignProductsToChannel\",\"query\":\"mutation AssignProductsToChannel($input: AssignProductsToChannelInput!) {\\n  assignProductsToChannel(input: $input) {\\n    id\\n    channels {\\n      id\\n      code\\n      __typename\\n    }\\n    __typename\\n  }\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-22T16:43:45.431Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"USD\",\"availableCurrencyCodes\":[\"USD\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":false,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":null,\"defaultTaxZone\":null},\"_session\":{\"cacheExpiry\":1690043558,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]},{\"id\":2,\"token\":\"ngn\",\"code\":\"NGN\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"USD\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"productId\":1,\"channelId\":2}','COMPLETED',100,'true',NULL,'2023-07-22 16:27:58.092000','2023-07-22 16:27:58.127000',1,0,1,8),('2023-07-23 00:30:39.786085','2023-07-23 00:30:40.000000','update-search-index','{\"type\":\"update-variants\",\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_sockname\":null,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":3902,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51992,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":455,\"bytesWritten\":455},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"1591\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory/1/manage-variants\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":3902,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51992,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":455,\"bytesWritten\":455},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/admin-api\",\"path\":\"/admin-api?languageCode=en\",\"href\":\"/admin-api?languageCode=en\",\"_raw\":\"/admin-api?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":false,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":null,\"_hasBody\":true,\"_trailer\":\"\",\"finished\":false,\"_headerSent\":false,\"_closed\":false,\"_header\":null,\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"headersSent\":false},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"CreateProductVariants\",\"query\":\"mutation CreateProductVariants($input: [CreateProductVariantInput!]!) {\\n  createProductVariants(input: $input) {\\n    ...ProductVariant\\n    __typename\\n  }\\n}\\n\\nfragment ProductVariant on ProductVariant {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  price\\n  currencyCode\\n  priceWithTax\\n  stockOnHand\\n  stockAllocated\\n  trackInventory\\n  outOfStockThreshold\\n  useGlobalOutOfStockThreshold\\n  taxRateApplied {\\n    id\\n    name\\n    value\\n    __typename\\n  }\\n  taxCategory {\\n    id\\n    name\\n    __typename\\n  }\\n  sku\\n  options {\\n    ...ProductOption\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOption on ProductOption {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  groupId\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Asset on Asset {\\n  id\\n  createdAt\\n  updatedAt\\n  name\\n  fileSize\\n  mimeType\\n  type\\n  preview\\n  source\\n  width\\n  height\\n  focalPoint {\\n    x\\n    y\\n    __typename\\n  }\\n  __typename\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"NGN\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-23T00:30:22.000Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"NGN\",\"availableCurrencyCodes\":[\"NGN\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":true,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":{\"createdAt\":\"2023-07-23T00:14:48.430Z\",\"updatedAt\":\"2023-07-23T00:14:48.430Z\",\"name\":\"NGN\",\"id\":1},\"defaultTaxZone\":{\"createdAt\":\"2023-07-23T00:14:48.430Z\",\"updatedAt\":\"2023-07-23T00:14:48.430Z\",\"name\":\"NGN\",\"id\":1}},\"_session\":{\"cacheExpiry\":1690043723,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]},{\"id\":2,\"token\":\"ngn\",\"code\":\"NGN\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"NGN\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"variantIds\":[7]}','COMPLETED',100,'true',NULL,'2023-07-22 16:30:39.921000','2023-07-22 16:30:40.237000',1,0,1,9),('2023-07-23 00:30:39.861765','2023-07-23 00:30:39.000000','apply-collection-filters','{\"ctx\":{\"_req\":{\"_readableState\":{\"objectMode\":false,\"highWaterMark\":16384,\"length\":0,\"pipes\":[],\"flowing\":true,\"ended\":true,\"endEmitted\":true,\"reading\":false,\"constructed\":true,\"sync\":false,\"needReadable\":false,\"emittedReadable\":false,\"readableListening\":false,\"resumeScheduled\":false,\"errorEmitted\":false,\"emitClose\":true,\"autoDestroy\":true,\"destroyed\":true,\"errored\":null,\"closed\":true,\"closeEmitted\":true,\"defaultEncoding\":\"utf8\",\"awaitDrainWriters\":null,\"multiAwaitDrain\":false,\"readingMore\":false,\"dataEmitted\":true,\"decoder\":null,\"encoding\":null},\"_events\":{},\"_eventsCount\":1,\"socket\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":6139,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51992,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":1935,\"bytesWritten\":1935},\"httpVersionMajor\":1,\"httpVersionMinor\":1,\"httpVersion\":\"1.1\",\"complete\":true,\"rawHeaders\":[\"Host\",\"localhost:3000\",\"Connection\",\"keep-alive\",\"Content-Length\",\"1591\",\"sec-ch-ua\",\"\\\"Not.A/Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"114\\\", \\\"Google Chrome\\\";v=\\\"114\\\"\",\"accept\",\"*/*\",\"content-type\",\"application/json\",\"vendure-token\",\"lwlkavfkln1s4m5zovq\",\"sec-ch-ua-mobile\",\"?0\",\"User-Agent\",\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\",\"sec-ch-ua-platform\",\"\\\"macOS\\\"\",\"Origin\",\"http://localhost:3000\",\"Sec-Fetch-Site\",\"same-origin\",\"Sec-Fetch-Mode\",\"cors\",\"Sec-Fetch-Dest\",\"empty\",\"Referer\",\"http://localhost:3000/admin/catalog/inventory/1/manage-variants\",\"Accept-Encoding\",\"gzip, deflate, br\",\"Accept-Language\",\"en-GB,en-US;q=0.9,en;q=0.8\",\"Cookie\",\"i18n_redirected=en; vsf-currency=USD; vsf-country=US; ajs_anonymous_id=e4178b2f-11bf-4922-9214-5b84f81857cb; ajs_user_id=usr_01H5NBYND1DXZRW42DMAW9V1H4; __stripe_mid=1e6920e0-5f92-4bc2-94cf-57332822bbd16f5fbe; session=eyJ0b2tlbiI6ImFmZDM5ODQ5ZThkN2U5NTBlNzgxNTE3Yjk2MGM4MTViZWZjMTQxMmFlYTk1MWIzOTRhNTMxYzE1N2JjZTRmYzEifQ==; session.sig=eJ5GpMVNjXGrh0fDKWOB0hx7FKk\"],\"rawTrailers\":[],\"aborted\":false,\"upgrade\":false,\"url\":\"/?languageCode=en\",\"method\":\"POST\",\"statusCode\":null,\"statusMessage\":null,\"client\":{\"connecting\":false,\"_hadError\":false,\"_parent\":null,\"_host\":null,\"_closeAfterHandlingError\":false,\"_eventsCount\":8,\"allowHalfOpen\":true,\"_pendingData\":null,\"_pendingEncoding\":\"\",\"_paused\":false,\"timeout\":0,\"bytesRead\":6139,\"remoteAddress\":\"::1\",\"remoteFamily\":\"IPv6\",\"remotePort\":51992,\"localAddress\":\"::1\",\"localPort\":3000,\"localFamily\":\"IPv6\",\"_bytesDispatched\":1935,\"bytesWritten\":1935},\"_consuming\":true,\"_dumped\":false,\"next\":{},\"baseUrl\":\"/admin-api\",\"originalUrl\":\"/admin-api?languageCode=en\",\"_parsedUrl\":{\"protocol\":null,\"slashes\":null,\"auth\":null,\"host\":null,\"port\":null,\"hostname\":null,\"hash\":null,\"search\":\"?languageCode=en\",\"query\":\"languageCode=en\",\"pathname\":\"/\",\"path\":\"/?languageCode=en\",\"href\":\"/?languageCode=en\",\"_raw\":\"/?languageCode=en\"},\"params\":{},\"query\":{\"languageCode\":\"en\"},\"res\":{\"_eventsCount\":1,\"outputData\":[],\"outputSize\":0,\"writable\":true,\"destroyed\":true,\"_last\":false,\"chunkedEncoding\":false,\"shouldKeepAlive\":true,\"maxRequestsOnConnectionReached\":false,\"_defaultKeepAlive\":true,\"useChunkedEncodingByDefault\":true,\"sendDate\":true,\"_removedConnection\":false,\"_removedContLen\":false,\"_removedTE\":false,\"strictContentLength\":false,\"_contentLength\":\"1063\",\"_hasBody\":true,\"_trailer\":\"\",\"finished\":true,\"_headerSent\":true,\"_closed\":true,\"socket\":null,\"_header\":\"HTTP/1.1 200 OK\\r\\nX-Powered-By: Express\\r\\nAccess-Control-Allow-Origin: http://localhost:3000\\r\\nVary: Origin\\r\\nAccess-Control-Allow-Credentials: true\\r\\nAccess-Control-Expose-Headers: vendure-auth-token\\r\\nContent-Language: en\\r\\nContent-Type: application/json; charset=utf-8\\r\\nContent-Length: 1063\\r\\nETag: W/\\\"427-buJGEVEXZ+78O7egCJKx4uH0LF0\\\"\\r\\nDate: Sat, 22 Jul 2023 16:30:39 GMT\\r\\nConnection: keep-alive\\r\\nKeep-Alive: timeout=5\\r\\n\\r\\n\",\"_keepAliveTimeout\":5000,\"_sent100\":false,\"_expect_continue\":false,\"_maxRequestsPerSocket\":0,\"statusCode\":200,\"statusMessage\":\"OK\",\"headersSent\":true},\"sessionOptions\":{\"secret\":\"rb14lrv7wa\",\"httpOnly\":true,\"sameSite\":\"lax\",\"overwrite\":true,\"signed\":true},\"session\":{\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\"},\"body\":{\"operationName\":\"CreateProductVariants\",\"query\":\"mutation CreateProductVariants($input: [CreateProductVariantInput!]!) {\\n  createProductVariants(input: $input) {\\n    ...ProductVariant\\n    __typename\\n  }\\n}\\n\\nfragment ProductVariant on ProductVariant {\\n  id\\n  createdAt\\n  updatedAt\\n  enabled\\n  languageCode\\n  name\\n  price\\n  currencyCode\\n  priceWithTax\\n  stockOnHand\\n  stockAllocated\\n  trackInventory\\n  outOfStockThreshold\\n  useGlobalOutOfStockThreshold\\n  taxRateApplied {\\n    id\\n    name\\n    value\\n    __typename\\n  }\\n  taxCategory {\\n    id\\n    name\\n    __typename\\n  }\\n  sku\\n  options {\\n    ...ProductOption\\n    __typename\\n  }\\n  facetValues {\\n    id\\n    code\\n    name\\n    facet {\\n      id\\n      name\\n      __typename\\n    }\\n    __typename\\n  }\\n  featuredAsset {\\n    ...Asset\\n    __typename\\n  }\\n  assets {\\n    ...Asset\\n    __typename\\n  }\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  channels {\\n    id\\n    code\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment ProductOption on ProductOption {\\n  id\\n  createdAt\\n  updatedAt\\n  code\\n  languageCode\\n  name\\n  groupId\\n  translations {\\n    id\\n    languageCode\\n    name\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Asset on Asset {\\n  id\\n  createdAt\\n  updatedAt\\n  name\\n  fileSize\\n  mimeType\\n  type\\n  preview\\n  source\\n  width\\n  height\\n  focalPoint {\\n    x\\n    y\\n    __typename\\n  }\\n  __typename\\n}\"},\"_body\":true,\"i18nextLookupName\":\"querystring\",\"lng\":\"en\",\"locale\":\"en\",\"language\":\"en\",\"languages\":[\"en\"],\"i18n\":{\"language\":\"en\",\"languages\":[\"en\"],\"resolvedLanguage\":\"en\",\"isInitialized\":true},\"t\":{},\"vendureRequestContext\":{\"_apiType\":\"admin\",\"_languageCode\":\"en\",\"_currencyCode\":\"NGN\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"vendureRequestContextMap\":{},\"app\":{\"_eventsCount\":1,\"mountpath\":\"/\"},\"header\":{},\"get\":{},\"accepts\":{},\"acceptsEncodings\":{},\"acceptsEncoding\":{},\"acceptsCharsets\":{},\"acceptsCharset\":{},\"acceptsLanguages\":{},\"acceptsLanguage\":{},\"range\":{},\"param\":{},\"is\":{},\"protocol\":\"http\",\"secure\":false,\"ip\":\"::1\",\"ips\":[],\"subdomains\":[],\"path\":\"/\",\"hostname\":\"localhost\",\"fresh\":false,\"stale\":true,\"xhr\":false,\"setTimeout\":{},\"_read\":{},\"_destroy\":{},\"_addHeaderLines\":{},\"_addHeaderLine\":{},\"_addHeaderLineDistinct\":{},\"_dump\":{},\"destroy\":{},\"_undestroy\":{},\"push\":{},\"unshift\":{},\"isPaused\":{},\"setEncoding\":{},\"read\":{},\"pipe\":{},\"unpipe\":{},\"on\":{},\"addListener\":{},\"removeListener\":{},\"off\":{},\"removeAllListeners\":{},\"resume\":{},\"pause\":{},\"wrap\":{},\"iterator\":{},\"setMaxListeners\":{},\"getMaxListeners\":{},\"emit\":{},\"prependListener\":{},\"once\":{},\"prependOnceListener\":{},\"listeners\":{},\"rawListeners\":{},\"listenerCount\":{},\"eventNames\":{}},\"_apiType\":\"admin\",\"_channel\":{\"token\":\"lwlkavfkln1s4m5zovq\",\"createdAt\":\"2023-07-22T16:43:45.431Z\",\"updatedAt\":\"2023-07-23T00:30:22.000Z\",\"code\":\"__default_channel__\",\"description\":\"\",\"defaultLanguageCode\":\"en\",\"availableLanguageCodes\":[\"en\"],\"defaultCurrencyCode\":\"NGN\",\"availableCurrencyCodes\":[\"NGN\"],\"trackInventory\":true,\"outOfStockThreshold\":0,\"pricesIncludeTax\":true,\"id\":1,\"sellerId\":1,\"defaultShippingZone\":{\"createdAt\":\"2023-07-23T00:14:48.430Z\",\"updatedAt\":\"2023-07-23T00:14:48.430Z\",\"name\":\"NGN\",\"id\":1},\"defaultTaxZone\":{\"createdAt\":\"2023-07-23T00:14:48.430Z\",\"updatedAt\":\"2023-07-23T00:14:48.430Z\",\"name\":\"NGN\",\"id\":1}},\"_session\":{\"cacheExpiry\":1690043723,\"id\":2,\"token\":\"afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1\",\"expires\":\"2024-07-21T21:39:55.000Z\",\"activeOrderId\":null,\"activeChannelId\":1,\"authenticationStrategy\":\"native\",\"user\":{\"id\":1,\"identifier\":\"superadmin\",\"verified\":true,\"channelPermissions\":[{\"id\":1,\"token\":\"lwlkavfkln1s4m5zovq\",\"code\":\"__default_channel__\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]},{\"id\":2,\"token\":\"ngn\",\"code\":\"NGN\",\"permissions\":[\"Authenticated\",\"SuperAdmin\",\"UpdateGlobalSettings\",\"CreateCatalog\",\"ReadCatalog\",\"UpdateCatalog\",\"DeleteCatalog\",\"CreateSettings\",\"ReadSettings\",\"UpdateSettings\",\"DeleteSettings\",\"CreateAdministrator\",\"ReadAdministrator\",\"UpdateAdministrator\",\"DeleteAdministrator\",\"CreateAsset\",\"ReadAsset\",\"UpdateAsset\",\"DeleteAsset\",\"CreateChannel\",\"ReadChannel\",\"UpdateChannel\",\"DeleteChannel\",\"CreateCollection\",\"ReadCollection\",\"UpdateCollection\",\"DeleteCollection\",\"CreateCountry\",\"ReadCountry\",\"UpdateCountry\",\"DeleteCountry\",\"CreateCustomer\",\"ReadCustomer\",\"UpdateCustomer\",\"DeleteCustomer\",\"CreateCustomerGroup\",\"ReadCustomerGroup\",\"UpdateCustomerGroup\",\"DeleteCustomerGroup\",\"CreateFacet\",\"ReadFacet\",\"UpdateFacet\",\"DeleteFacet\",\"CreateOrder\",\"ReadOrder\",\"UpdateOrder\",\"DeleteOrder\",\"CreatePaymentMethod\",\"ReadPaymentMethod\",\"UpdatePaymentMethod\",\"DeletePaymentMethod\",\"CreateProduct\",\"ReadProduct\",\"UpdateProduct\",\"DeleteProduct\",\"CreatePromotion\",\"ReadPromotion\",\"UpdatePromotion\",\"DeletePromotion\",\"CreateShippingMethod\",\"ReadShippingMethod\",\"UpdateShippingMethod\",\"DeleteShippingMethod\",\"CreateTag\",\"ReadTag\",\"UpdateTag\",\"DeleteTag\",\"CreateTaxCategory\",\"ReadTaxCategory\",\"UpdateTaxCategory\",\"DeleteTaxCategory\",\"CreateTaxRate\",\"ReadTaxRate\",\"UpdateTaxRate\",\"DeleteTaxRate\",\"CreateSeller\",\"ReadSeller\",\"UpdateSeller\",\"DeleteSeller\",\"CreateStockLocation\",\"ReadStockLocation\",\"UpdateStockLocation\",\"DeleteStockLocation\",\"CreateSystem\",\"ReadSystem\",\"UpdateSystem\",\"DeleteSystem\",\"CreateZone\",\"ReadZone\",\"UpdateZone\",\"DeleteZone\"]}]}},\"_languageCode\":\"en\",\"_currencyCode\":\"NGN\",\"_isAuthorized\":true,\"_authorizedAsOwnerOnly\":false},\"collectionIds\":[]}','COMPLETED',100,NULL,NULL,'2023-07-22 16:30:39.929000','2023-07-22 16:30:39.946000',1,0,1,10);
/*!40000 ALTER TABLE `job_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_record_buffer`
--

DROP TABLE IF EXISTS `job_record_buffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_record_buffer` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `bufferId` varchar(255) NOT NULL,
  `job` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_record_buffer`
--

LOCK TABLES `job_record_buffer` WRITE;
/*!40000 ALTER TABLE `job_record_buffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_record_buffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,1689922611858,'vendure1689922611858'),(2,1690015322697,'vendure1690015322697');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `type` varchar(255) NOT NULL DEFAULT 'Regular',
  `code` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `orderPlacedAt` datetime DEFAULT NULL,
  `couponCodes` text NOT NULL,
  `shippingAddress` text NOT NULL,
  `billingAddress` text NOT NULL,
  `currencyCode` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aggregateOrderId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `taxZoneId` int(11) DEFAULT NULL,
  `subTotal` int(11) NOT NULL,
  `subTotalWithTax` int(11) NOT NULL,
  `shipping` int(11) NOT NULL DEFAULT 0,
  `shippingWithTax` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_729b3eea7ce540930dbb706949` (`code`),
  KEY `IDX_73a78d7df09541ac5eba620d18` (`aggregateOrderId`),
  KEY `IDX_124456e637cca7a415897dce65` (`customerId`),
  CONSTRAINT `FK_124456e637cca7a415897dce659` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_73a78d7df09541ac5eba620d181` FOREIGN KEY (`aggregateOrderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_channels_channel`
--

DROP TABLE IF EXISTS `order_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_channels_channel` (
  `orderId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`channelId`),
  KEY `IDX_0d8e5c204480204a60e151e485` (`orderId`),
  KEY `IDX_d0d16db872499e83b15999f8c7` (`channelId`),
  CONSTRAINT `FK_0d8e5c204480204a60e151e4853` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_d0d16db872499e83b15999f8c7a` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_channels_channel`
--

LOCK TABLES `order_channels_channel` WRITE;
/*!40000 ALTER TABLE `order_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_fulfillments_fulfillment`
--

DROP TABLE IF EXISTS `order_fulfillments_fulfillment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_fulfillments_fulfillment` (
  `orderId` int(11) NOT NULL,
  `fulfillmentId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`fulfillmentId`),
  KEY `IDX_f80d84d525af2ffe974e7e8ca2` (`orderId`),
  KEY `IDX_4add5a5796e1582dec2877b289` (`fulfillmentId`),
  CONSTRAINT `FK_4add5a5796e1582dec2877b2898` FOREIGN KEY (`fulfillmentId`) REFERENCES `fulfillment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f80d84d525af2ffe974e7e8ca29` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_fulfillments_fulfillment`
--

LOCK TABLES `order_fulfillments_fulfillment` WRITE;
/*!40000 ALTER TABLE `order_fulfillments_fulfillment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_fulfillments_fulfillment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `quantity` int(11) NOT NULL,
  `orderPlacedQuantity` int(11) NOT NULL DEFAULT 0,
  `listPriceIncludesTax` tinyint(4) NOT NULL,
  `adjustments` text NOT NULL,
  `taxLines` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellerChannelId` int(11) DEFAULT NULL,
  `shippingLineId` int(11) DEFAULT NULL,
  `productVariantId` int(11) NOT NULL,
  `initialListPrice` int(11) DEFAULT NULL,
  `listPrice` int(11) NOT NULL,
  `taxCategoryId` int(11) DEFAULT NULL,
  `featuredAssetId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6901d8715f5ebadd764466f7bd` (`sellerChannelId`),
  KEY `IDX_dc9ac68b47da7b62249886affb` (`shippingLineId`),
  KEY `IDX_cbcd22193eda94668e84d33f18` (`productVariantId`),
  KEY `IDX_77be94ce9ec650446617946227` (`taxCategoryId`),
  KEY `IDX_9f065453910ea77d4be8e92618` (`featuredAssetId`),
  KEY `IDX_239cfca2a55b98b90b6bef2e44` (`orderId`),
  CONSTRAINT `FK_239cfca2a55b98b90b6bef2e44f` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_6901d8715f5ebadd764466f7bde` FOREIGN KEY (`sellerChannelId`) REFERENCES `channel` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_77be94ce9ec6504466179462275` FOREIGN KEY (`taxCategoryId`) REFERENCES `tax_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9f065453910ea77d4be8e92618f` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cbcd22193eda94668e84d33f185` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dc9ac68b47da7b62249886affba` FOREIGN KEY (`shippingLineId`) REFERENCES `shipping_line` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_reference`
--

DROP TABLE IF EXISTS `order_line_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_reference` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `quantity` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fulfillmentId` int(11) DEFAULT NULL,
  `modificationId` int(11) DEFAULT NULL,
  `orderLineId` int(11) NOT NULL,
  `refundId` int(11) DEFAULT NULL,
  `discriminator` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7d57857922dfc7303604697dbe` (`orderLineId`),
  KEY `IDX_06b02fb482b188823e419d37bd` (`fulfillmentId`),
  KEY `IDX_22b818af8722746fb9f206068c` (`modificationId`),
  KEY `IDX_30019aa65b17fe9ee962893199` (`refundId`),
  KEY `IDX_49a8632be8cef48b076446b8b9` (`discriminator`),
  CONSTRAINT `FK_06b02fb482b188823e419d37bd4` FOREIGN KEY (`fulfillmentId`) REFERENCES `fulfillment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_22b818af8722746fb9f206068c2` FOREIGN KEY (`modificationId`) REFERENCES `order_modification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_30019aa65b17fe9ee9628931991` FOREIGN KEY (`refundId`) REFERENCES `refund` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7d57857922dfc7303604697dbe9` FOREIGN KEY (`orderLineId`) REFERENCES `order_line` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_reference`
--

LOCK TABLES `order_line_reference` WRITE;
/*!40000 ALTER TABLE `order_line_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_modification`
--

DROP TABLE IF EXISTS `order_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_modification` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `note` varchar(255) NOT NULL,
  `shippingAddressChange` text DEFAULT NULL,
  `billingAddressChange` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priceChange` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `refundId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_ad2991fa2933ed8b7f86a71633` (`paymentId`),
  UNIQUE KEY `REL_cb66b63b6e97613013795eadbd` (`refundId`),
  KEY `IDX_1df5bc14a47ef24d2e681f4559` (`orderId`),
  CONSTRAINT `FK_1df5bc14a47ef24d2e681f45598` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_ad2991fa2933ed8b7f86a716338` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cb66b63b6e97613013795eadbd5` FOREIGN KEY (`refundId`) REFERENCES `refund` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_modification`
--

LOCK TABLES `order_modification` WRITE;
/*!40000 ALTER TABLE `order_modification` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_promotions_promotion`
--

DROP TABLE IF EXISTS `order_promotions_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_promotions_promotion` (
  `orderId` int(11) NOT NULL,
  `promotionId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`promotionId`),
  KEY `IDX_67be0e40122ab30a62a9817efe` (`orderId`),
  KEY `IDX_2c26b988769c0e3b0120bdef31` (`promotionId`),
  CONSTRAINT `FK_2c26b988769c0e3b0120bdef31b` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_67be0e40122ab30a62a9817efe0` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_promotions_promotion`
--

LOCK TABLES `order_promotions_promotion` WRITE;
/*!40000 ALTER TABLE `order_promotions_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_promotions_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `method` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `errorMessage` varchar(255) DEFAULT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `metadata` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_d09d285fe1645cd2f0db811e29` (`orderId`),
  CONSTRAINT `FK_d09d285fe1645cd2f0db811e293` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `code` varchar(255) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL,
  `checker` text DEFAULT NULL,
  `handler` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_channels_channel`
--

DROP TABLE IF EXISTS `payment_method_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method_channels_channel` (
  `paymentMethodId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`paymentMethodId`,`channelId`),
  KEY `IDX_5bcb569635ce5407eb3f264487` (`paymentMethodId`),
  KEY `IDX_c00e36f667d35031087b382e61` (`channelId`),
  CONSTRAINT `FK_5bcb569635ce5407eb3f264487d` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_c00e36f667d35031087b382e61b` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_channels_channel`
--

LOCK TABLES `payment_method_channels_channel` WRITE;
/*!40000 ALTER TABLE `payment_method_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_translation`
--

DROP TABLE IF EXISTS `payment_method_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66187f782a3e71b9e0f5b50b68` (`baseId`),
  CONSTRAINT `FK_66187f782a3e71b9e0f5b50b68b` FOREIGN KEY (`baseId`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_translation`
--

LOCK TABLES `payment_method_translation` WRITE;
/*!40000 ALTER TABLE `payment_method_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `featuredAssetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_91a19e6613534949a4ce6e76ff` (`featuredAssetId`),
  CONSTRAINT `FK_91a19e6613534949a4ce6e76ff8` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('2023-07-23 00:03:18.821042','2023-07-23 00:03:18.821042',NULL,1,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_asset`
--

DROP TABLE IF EXISTS `product_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `assetId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `IDX_5888ac17b317b93378494a1062` (`assetId`),
  KEY `IDX_0d1294f5c22a56da7845ebab72` (`productId`),
  CONSTRAINT `FK_0d1294f5c22a56da7845ebab72c` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_5888ac17b317b93378494a10620` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_asset`
--

LOCK TABLES `product_asset` WRITE;
/*!40000 ALTER TABLE `product_asset` DISABLE KEYS */;
INSERT INTO `product_asset` VALUES ('2023-07-23 00:03:18.851852','2023-07-23 00:03:18.851852',1,0,1,1);
/*!40000 ALTER TABLE `product_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels_channel`
--

DROP TABLE IF EXISTS `product_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_channels_channel` (
  `productId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`channelId`),
  KEY `IDX_26d12be3b5fec6c4adb1d79284` (`productId`),
  KEY `IDX_a51dfbd87c330c075c39832b6e` (`channelId`),
  CONSTRAINT `FK_26d12be3b5fec6c4adb1d792844` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_a51dfbd87c330c075c39832b6e7` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels_channel`
--

LOCK TABLES `product_channels_channel` WRITE;
/*!40000 ALTER TABLE `product_channels_channel` DISABLE KEYS */;
INSERT INTO `product_channels_channel` VALUES (1,1);
/*!40000 ALTER TABLE `product_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_facet_values_facet_value`
--

DROP TABLE IF EXISTS `product_facet_values_facet_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_facet_values_facet_value` (
  `productId` int(11) NOT NULL,
  `facetValueId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`facetValueId`),
  KEY `IDX_6a0558e650d75ae639ff38e413` (`productId`),
  KEY `IDX_06e7d73673ee630e8ec50d0b29` (`facetValueId`),
  CONSTRAINT `FK_06e7d73673ee630e8ec50d0b29f` FOREIGN KEY (`facetValueId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6a0558e650d75ae639ff38e413a` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_facet_values_facet_value`
--

LOCK TABLES `product_facet_values_facet_value` WRITE;
/*!40000 ALTER TABLE `product_facet_values_facet_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_facet_values_facet_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_a6debf9198e2fbfa006aa10d71` (`groupId`),
  CONSTRAINT `FK_a6debf9198e2fbfa006aa10d710` FOREIGN KEY (`groupId`) REFERENCES `product_option_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT INTO `product_option` VALUES ('2023-07-23 00:13:44.953729','2023-07-23 00:13:44.953729',NULL,'35',1,1),('2023-07-23 00:13:50.882698','2023-07-23 00:13:50.882698',NULL,'36',2,1),('2023-07-23 00:13:54.800234','2023-07-23 00:13:54.800234',NULL,'37',3,1);
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_group`
--

DROP TABLE IF EXISTS `product_option_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option_group` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_a6e91739227bf4d442f23c52c7` (`productId`),
  CONSTRAINT `FK_a6e91739227bf4d442f23c52c75` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_group`
--

LOCK TABLES `product_option_group` WRITE;
/*!40000 ALTER TABLE `product_option_group` DISABLE KEYS */;
INSERT INTO `product_option_group` VALUES ('2023-07-23 00:13:15.221810','2023-07-23 00:13:15.000000',NULL,'size',1,1),('2023-07-23 00:27:06.516330','2023-07-23 00:27:06.516330',NULL,'size',2,NULL),('2023-07-23 00:27:30.796039','2023-07-23 00:27:30.796039',NULL,'size',3,NULL);
/*!40000 ALTER TABLE `product_option_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_group_translation`
--

DROP TABLE IF EXISTS `product_option_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option_group_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_93751abc1451972c02e033b766` (`baseId`),
  CONSTRAINT `FK_93751abc1451972c02e033b766c` FOREIGN KEY (`baseId`) REFERENCES `product_option_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_group_translation`
--

LOCK TABLES `product_option_group_translation` WRITE;
/*!40000 ALTER TABLE `product_option_group_translation` DISABLE KEYS */;
INSERT INTO `product_option_group_translation` VALUES ('2023-07-23 00:13:15.206172','2023-07-23 00:13:15.000000','en','SIZE',1,1),('2023-07-23 00:27:06.501834','2023-07-23 00:27:06.000000','en','SIZE',2,2),('2023-07-23 00:27:30.788572','2023-07-23 00:27:30.000000','en','SIZE',3,3);
/*!40000 ALTER TABLE `product_option_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_translation`
--

DROP TABLE IF EXISTS `product_option_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_a79a443c1f7841f3851767faa6` (`baseId`),
  CONSTRAINT `FK_a79a443c1f7841f3851767faa6d` FOREIGN KEY (`baseId`) REFERENCES `product_option` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_translation`
--

LOCK TABLES `product_option_translation` WRITE;
/*!40000 ALTER TABLE `product_option_translation` DISABLE KEYS */;
INSERT INTO `product_option_translation` VALUES ('2023-07-23 00:13:44.943373','2023-07-23 00:13:44.000000','en','35',1,1),('2023-07-23 00:13:50.872805','2023-07-23 00:13:50.000000','en','36',2,2),('2023-07-23 00:13:54.785999','2023-07-23 00:13:54.000000','en','37',3,3);
/*!40000 ALTER TABLE `product_option_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_translation`
--

DROP TABLE IF EXISTS `product_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_f4a2ec16ba86d277b6faa0b67b` (`slug`),
  KEY `IDX_7dbc75cb4e8b002620c4dbfdac` (`baseId`),
  CONSTRAINT `FK_7dbc75cb4e8b002620c4dbfdac5` FOREIGN KEY (`baseId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translation`
--

LOCK TABLES `product_translation` WRITE;
/*!40000 ALTER TABLE `product_translation` DISABLE KEYS */;
INSERT INTO `product_translation` VALUES ('2023-07-23 00:03:18.810789','2023-07-23 00:03:18.000000','en','Zara shoes','zara-shoes','<p>Zara shoes</p>',1,1);
/*!40000 ALTER TABLE `product_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `sku` varchar(255) NOT NULL,
  `outOfStockThreshold` int(11) NOT NULL DEFAULT 0,
  `useGlobalOutOfStockThreshold` tinyint(4) NOT NULL DEFAULT 1,
  `trackInventory` varchar(255) NOT NULL DEFAULT 'INHERIT',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `featuredAssetId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_0e6f516053cf982b537836e21c` (`featuredAssetId`),
  KEY `IDX_e38dca0d82fd64c7cf8aac8b8e` (`taxCategoryId`),
  KEY `IDX_6e420052844edf3a5506d863ce` (`productId`),
  CONSTRAINT `FK_0e6f516053cf982b537836e21cf` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_6e420052844edf3a5506d863ce6` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e38dca0d82fd64c7cf8aac8b8ef` FOREIGN KEY (`taxCategoryId`) REFERENCES `tax_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES ('2023-07-23 00:30:39.671553','2023-07-23 00:30:39.671553',NULL,1,'SK-66',0,1,'INHERIT',7,1,NULL,2);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_asset`
--

DROP TABLE IF EXISTS `product_variant_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant_asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `assetId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `productVariantId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `IDX_10b5a2e3dee0e30b1e26c32f5c` (`assetId`),
  KEY `IDX_fa21412afac15a2304f3eb35fe` (`productVariantId`),
  CONSTRAINT `FK_10b5a2e3dee0e30b1e26c32f5c7` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_fa21412afac15a2304f3eb35feb` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_asset`
--

LOCK TABLES `product_variant_asset` WRITE;
/*!40000 ALTER TABLE `product_variant_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variant_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_channels_channel`
--

DROP TABLE IF EXISTS `product_variant_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant_channels_channel` (
  `productVariantId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`productVariantId`,`channelId`),
  KEY `IDX_beeb2b3cd800e589f2213ae99d` (`productVariantId`),
  KEY `IDX_d194bff171b62357688a5d0f55` (`channelId`),
  CONSTRAINT `FK_beeb2b3cd800e589f2213ae99d6` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_d194bff171b62357688a5d0f559` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_channels_channel`
--

LOCK TABLES `product_variant_channels_channel` WRITE;
/*!40000 ALTER TABLE `product_variant_channels_channel` DISABLE KEYS */;
INSERT INTO `product_variant_channels_channel` VALUES (7,1);
/*!40000 ALTER TABLE `product_variant_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_facet_values_facet_value`
--

DROP TABLE IF EXISTS `product_variant_facet_values_facet_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant_facet_values_facet_value` (
  `productVariantId` int(11) NOT NULL,
  `facetValueId` int(11) NOT NULL,
  PRIMARY KEY (`productVariantId`,`facetValueId`),
  KEY `IDX_69567bc225b6bbbd732d6c5455` (`productVariantId`),
  KEY `IDX_0d641b761ed1dce4ef3cd33d55` (`facetValueId`),
  CONSTRAINT `FK_0d641b761ed1dce4ef3cd33d559` FOREIGN KEY (`facetValueId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_69567bc225b6bbbd732d6c5455b` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_facet_values_facet_value`
--

LOCK TABLES `product_variant_facet_values_facet_value` WRITE;
/*!40000 ALTER TABLE `product_variant_facet_values_facet_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variant_facet_values_facet_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_options_product_option`
--

DROP TABLE IF EXISTS `product_variant_options_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant_options_product_option` (
  `productVariantId` int(11) NOT NULL,
  `productOptionId` int(11) NOT NULL,
  PRIMARY KEY (`productVariantId`,`productOptionId`),
  KEY `IDX_526f0131260eec308a3bd2b61b` (`productVariantId`),
  KEY `IDX_e96a71affe63c97f7fa2f076da` (`productOptionId`),
  CONSTRAINT `FK_526f0131260eec308a3bd2b61b6` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_e96a71affe63c97f7fa2f076dac` FOREIGN KEY (`productOptionId`) REFERENCES `product_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_options_product_option`
--

LOCK TABLES `product_variant_options_product_option` WRITE;
/*!40000 ALTER TABLE `product_variant_options_product_option` DISABLE KEYS */;
INSERT INTO `product_variant_options_product_option` VALUES (7,1);
/*!40000 ALTER TABLE `product_variant_options_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_price`
--

DROP TABLE IF EXISTS `product_variant_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant_price` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `currencyCode` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelId` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `variantId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_e6126cd268aea6e9b31d89af9a` (`variantId`),
  CONSTRAINT `FK_e6126cd268aea6e9b31d89af9ab` FOREIGN KEY (`variantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_price`
--

LOCK TABLES `product_variant_price` WRITE;
/*!40000 ALTER TABLE `product_variant_price` DISABLE KEYS */;
INSERT INTO `product_variant_price` VALUES ('2023-07-23 00:30:39.696398','2023-07-23 00:30:39.696398','NGN',7,1,0,7);
/*!40000 ALTER TABLE `product_variant_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant_translation`
--

DROP TABLE IF EXISTS `product_variant_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variant_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_420f4d6fb75d38b9dca79bc43b` (`baseId`),
  CONSTRAINT `FK_420f4d6fb75d38b9dca79bc43b4` FOREIGN KEY (`baseId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant_translation`
--

LOCK TABLES `product_variant_translation` WRITE;
/*!40000 ALTER TABLE `product_variant_translation` DISABLE KEYS */;
INSERT INTO `product_variant_translation` VALUES ('2023-07-23 00:30:39.661764','2023-07-23 00:30:39.000000','en','Zara shoes 35',7,7);
/*!40000 ALTER TABLE `product_variant_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `startsAt` datetime DEFAULT NULL,
  `endsAt` datetime DEFAULT NULL,
  `couponCode` varchar(255) DEFAULT NULL,
  `perCustomerUsageLimit` int(11) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL,
  `conditions` text NOT NULL,
  `actions` text NOT NULL,
  `priorityScore` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_channels_channel`
--

DROP TABLE IF EXISTS `promotion_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_channels_channel` (
  `promotionId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`promotionId`,`channelId`),
  KEY `IDX_6d9e2c39ab12391aaa374bcdaa` (`promotionId`),
  KEY `IDX_0eaaf0f4b6c69afde1e88ffb52` (`channelId`),
  CONSTRAINT `FK_0eaaf0f4b6c69afde1e88ffb52d` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6d9e2c39ab12391aaa374bcdaa4` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_channels_channel`
--

LOCK TABLES `promotion_channels_channel` WRITE;
/*!40000 ALTER TABLE `promotion_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_translation`
--

DROP TABLE IF EXISTS `promotion_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1cc009e9ab2263a35544064561` (`baseId`),
  CONSTRAINT `FK_1cc009e9ab2263a35544064561b` FOREIGN KEY (`baseId`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_translation`
--

LOCK TABLES `promotion_translation` WRITE;
/*!40000 ALTER TABLE `promotion_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `method` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `metadata` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentId` int(11) NOT NULL,
  `items` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `adjustment` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1c6932a756108788a361e7d440` (`paymentId`),
  CONSTRAINT `FK_1c6932a756108788a361e7d4404` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `discriminator` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ed0c8098ce6809925a437f42ae` (`parentId`),
  CONSTRAINT `FK_ed0c8098ce6809925a437f42aec` FOREIGN KEY (`parentId`) REFERENCES `region` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('2023-07-23 00:15:01.449596','2023-07-23 00:15:01.449596','NGN','country',1,1,NULL,'Country');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_translation`
--

DROP TABLE IF EXISTS `region_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1afd722b943c81310705fc3e61` (`baseId`),
  CONSTRAINT `FK_1afd722b943c81310705fc3e612` FOREIGN KEY (`baseId`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_translation`
--

LOCK TABLES `region_translation` WRITE;
/*!40000 ALTER TABLE `region_translation` DISABLE KEYS */;
INSERT INTO `region_translation` VALUES ('2023-07-23 00:15:01.437505','2023-07-23 00:15:01.000000','en','NIGERIA',1,1);
/*!40000 ALTER TABLE `region_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('2023-07-22 16:43:45.490842','2023-07-22 16:43:45.490842','__super_admin_role__','SuperAdmin','Authenticated,SuperAdmin,UpdateGlobalSettings,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateAdministrator,ReadAdministrator,UpdateAdministrator,DeleteAdministrator,CreateAsset,ReadAsset,UpdateAsset,DeleteAsset,CreateChannel,ReadChannel,UpdateChannel,DeleteChannel,CreateCollection,ReadCollection,UpdateCollection,DeleteCollection,CreateCountry,ReadCountry,UpdateCountry,DeleteCountry,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateFacet,ReadFacet,UpdateFacet,DeleteFacet,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreatePaymentMethod,ReadPaymentMethod,UpdatePaymentMethod,DeletePaymentMethod,CreateProduct,ReadProduct,UpdateProduct,DeleteProduct,CreatePromotion,ReadPromotion,UpdatePromotion,DeletePromotion,CreateShippingMethod,ReadShippingMethod,UpdateShippingMethod,DeleteShippingMethod,CreateTag,ReadTag,UpdateTag,DeleteTag,CreateTaxCategory,ReadTaxCategory,UpdateTaxCategory,DeleteTaxCategory,CreateTaxRate,ReadTaxRate,UpdateTaxRate,DeleteTaxRate,CreateSeller,ReadSeller,UpdateSeller,DeleteSeller,CreateStockLocation,ReadStockLocation,UpdateStockLocation,DeleteStockLocation,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem,CreateZone,ReadZone,UpdateZone,DeleteZone',1),('2023-07-22 16:43:45.506304','2023-07-22 16:43:45.506304','__customer_role__','Customer','Authenticated',2);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_channels_channel`
--

DROP TABLE IF EXISTS `role_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_channels_channel` (
  `roleId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`channelId`),
  KEY `IDX_bfd2a03e9988eda6a9d1176011` (`roleId`),
  KEY `IDX_e09dfee62b158307404202b43a` (`channelId`),
  CONSTRAINT `FK_bfd2a03e9988eda6a9d11760119` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_e09dfee62b158307404202b43a5` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_channels_channel`
--

LOCK TABLES `role_channels_channel` WRITE;
/*!40000 ALTER TABLE `role_channels_channel` DISABLE KEYS */;
INSERT INTO `role_channels_channel` VALUES (1,1),(1,2),(2,1),(2,2);
/*!40000 ALTER TABLE `role_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_index_item`
--

DROP TABLE IF EXISTS `search_index_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index_item` (
  `languageCode` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productVariantName` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `facetIds` text NOT NULL,
  `facetValueIds` text NOT NULL,
  `collectionIds` text NOT NULL,
  `collectionSlugs` text NOT NULL,
  `channelIds` text NOT NULL,
  `productPreview` varchar(255) NOT NULL,
  `productPreviewFocalPoint` text DEFAULT NULL,
  `productVariantPreview` varchar(255) NOT NULL,
  `productVariantPreviewFocalPoint` text DEFAULT NULL,
  `inStock` tinyint(4) NOT NULL DEFAULT 1,
  `productInStock` tinyint(4) NOT NULL DEFAULT 1,
  `productVariantId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productAssetId` int(11) DEFAULT NULL,
  `productVariantAssetId` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `priceWithTax` int(11) NOT NULL,
  PRIMARY KEY (`languageCode`,`productVariantId`,`channelId`),
  FULLTEXT KEY `IDX_6fb55742e13e8082954d0436dc` (`productName`),
  FULLTEXT KEY `IDX_d8791f444a8bf23fe4c1bc020c` (`productVariantName`),
  FULLTEXT KEY `IDX_9a5a6a556f75c4ac7bfdd03410` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_index_item`
--

LOCK TABLES `search_index_item` WRITE;
/*!40000 ALTER TABLE `search_index_item` DISABLE KEYS */;
INSERT INTO `search_index_item` VALUES ('en',1,'Zara shoes','Zara shoes 35','<p>Zara shoes</p>','zara-shoes','SK-66','','','','','1','preview/d3/2520120032_2_1_1__preview.jpg',NULL,'',NULL,0,0,7,1,1,1,NULL,0,0);
/*!40000 ALTER TABLE `search_index_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('2023-07-22 16:43:45.390023','2023-07-22 16:43:45.390023',NULL,'Default Seller',1);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `invalidated` tinyint(4) NOT NULL,
  `authenticationStrategy` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeOrderId` int(11) DEFAULT NULL,
  `activeChannelId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_232f8e85d7633bd6ddfad42169` (`token`),
  KEY `IDX_7a75399a4f4ffa48ee02e98c05` (`activeOrderId`),
  KEY `IDX_eb87ef1e234444728138302263` (`activeChannelId`),
  KEY `IDX_3d2f174ef04fb312fdebd0ddc5` (`userId`),
  KEY `IDX_e5598363000cab9d9116bd5835` (`type`),
  CONSTRAINT `FK_3d2f174ef04fb312fdebd0ddc53` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_7a75399a4f4ffa48ee02e98c059` FOREIGN KEY (`activeOrderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eb87ef1e234444728138302263b` FOREIGN KEY (`activeChannelId`) REFERENCES `channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('2023-07-22 23:39:51.365126','2023-07-22 23:39:51.000000','3e089a00bf65cb5f03ba815ece9fd786c1119e47300e27d81e06511fcbe25900','2024-07-21 21:39:51',0,NULL,1,NULL,1,'AnonymousSession',NULL),('2023-07-22 23:39:55.267469','2023-07-23 00:29:31.000000','afd39849e8d7e950e781517b960c815befc1412aea951b394a531c157bce4fc1','2024-07-21 21:39:55',0,'native',2,NULL,1,'AuthenticatedSession',1),('2023-07-22 23:49:40.874540','2023-07-22 23:49:40.874540','ed25c58a757f0e8bcc4364947b71c244167342d924cba3e865ff1ff910418709','2024-07-21 21:49:40',0,'native',3,NULL,NULL,'AuthenticatedSession',2),('2023-07-22 23:51:32.297615','2023-07-22 23:51:32.297615','8525efdc621d642c890d38d895e7ae68cb75fcebe96409f7153e1de8e0ce8670','2024-07-21 21:51:32',0,'native',4,NULL,NULL,'AuthenticatedSession',2);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_line`
--

DROP TABLE IF EXISTS `shipping_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_line` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `listPriceIncludesTax` tinyint(4) NOT NULL,
  `adjustments` text NOT NULL,
  `taxLines` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingMethodId` int(11) NOT NULL,
  `listPrice` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_e2e7642e1e88167c1dfc827fdf` (`shippingMethodId`),
  KEY `IDX_c9f34a440d490d1b66f6829b86` (`orderId`),
  CONSTRAINT `FK_c9f34a440d490d1b66f6829b86c` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_e2e7642e1e88167c1dfc827fdf3` FOREIGN KEY (`shippingMethodId`) REFERENCES `shipping_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_line`
--

LOCK TABLES `shipping_line` WRITE;
/*!40000 ALTER TABLE `shipping_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `checker` text NOT NULL,
  `calculator` text NOT NULL,
  `fulfillmentHandlerCode` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method_channels_channel`
--

DROP TABLE IF EXISTS `shipping_method_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method_channels_channel` (
  `shippingMethodId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`shippingMethodId`,`channelId`),
  KEY `IDX_f0a17b94aa5a162f0d422920eb` (`shippingMethodId`),
  KEY `IDX_f2b98dfb56685147bed509acc3` (`channelId`),
  CONSTRAINT `FK_f0a17b94aa5a162f0d422920eb2` FOREIGN KEY (`shippingMethodId`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_f2b98dfb56685147bed509acc3d` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method_channels_channel`
--

LOCK TABLES `shipping_method_channels_channel` WRITE;
/*!40000 ALTER TABLE `shipping_method_channels_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_method_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method_translation`
--

DROP TABLE IF EXISTS `shipping_method_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `languageCode` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_85ec26c71067ebc84adcd98d1a` (`baseId`),
  CONSTRAINT `FK_85ec26c71067ebc84adcd98d1a5` FOREIGN KEY (`baseId`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method_translation`
--

LOCK TABLES `shipping_method_translation` WRITE;
/*!40000 ALTER TABLE `shipping_method_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_method_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_level`
--

DROP TABLE IF EXISTS `stock_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_level` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `stockOnHand` int(11) NOT NULL,
  `stockAllocated` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productVariantId` int(11) NOT NULL,
  `stockLocationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_7fc20486b8cfd33dc84c96e168` (`productVariantId`,`stockLocationId`),
  KEY `IDX_9950eae3180f39c71978748bd0` (`productVariantId`),
  KEY `IDX_984c48572468c69661a0b7b049` (`stockLocationId`),
  CONSTRAINT `FK_984c48572468c69661a0b7b0494` FOREIGN KEY (`stockLocationId`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_9950eae3180f39c71978748bd08` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_level`
--

LOCK TABLES `stock_level` WRITE;
/*!40000 ALTER TABLE `stock_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_location`
--

DROP TABLE IF EXISTS `stock_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_location`
--

LOCK TABLES `stock_location` WRITE;
/*!40000 ALTER TABLE `stock_location` DISABLE KEYS */;
INSERT INTO `stock_location` VALUES ('2023-07-22 16:43:47.678969','2023-07-22 16:43:47.678969','Default Stock Location','The default stock location',1);
/*!40000 ALTER TABLE `stock_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_location_channels_channel`
--

DROP TABLE IF EXISTS `stock_location_channels_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location_channels_channel` (
  `stockLocationId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`stockLocationId`,`channelId`),
  KEY `IDX_39513fd02a573c848d23bee587` (`stockLocationId`),
  KEY `IDX_ff8150fe54e56a900d5712671a` (`channelId`),
  CONSTRAINT `FK_39513fd02a573c848d23bee587d` FOREIGN KEY (`stockLocationId`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ff8150fe54e56a900d5712671a0` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_location_channels_channel`
--

LOCK TABLES `stock_location_channels_channel` WRITE;
/*!40000 ALTER TABLE `stock_location_channels_channel` DISABLE KEYS */;
INSERT INTO `stock_location_channels_channel` VALUES (1,1);
/*!40000 ALTER TABLE `stock_location_channels_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movement`
--

DROP TABLE IF EXISTS `stock_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movement` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `type` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockLocationId` int(11) NOT NULL,
  `discriminator` varchar(255) NOT NULL,
  `productVariantId` int(11) DEFAULT NULL,
  `orderLineId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_e65ba3882557cab4febb54809b` (`productVariantId`),
  KEY `IDX_a2fe7172eeae9f1cca86f8f573` (`stockLocationId`),
  KEY `IDX_d2c8d5fca981cc820131f81aa8` (`orderLineId`),
  KEY `IDX_94e15d5f12d355d117390131ac` (`discriminator`),
  CONSTRAINT `FK_a2fe7172eeae9f1cca86f8f573a` FOREIGN KEY (`stockLocationId`) REFERENCES `stock_location` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_d2c8d5fca981cc820131f81aa83` FOREIGN KEY (`orderLineId`) REFERENCES `order_line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e65ba3882557cab4febb54809bb` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movement`
--

LOCK TABLES `stock_movement` WRITE;
/*!40000 ALTER TABLE `stock_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surcharge`
--

DROP TABLE IF EXISTS `surcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surcharge` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `description` varchar(255) NOT NULL,
  `listPriceIncludesTax` tinyint(4) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `taxLines` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listPrice` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `orderModificationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_154eb685f9b629033bd266df7f` (`orderId`),
  KEY `IDX_a49c5271c39cc8174a0535c808` (`orderModificationId`),
  CONSTRAINT `FK_154eb685f9b629033bd266df7fa` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_a49c5271c39cc8174a0535c8088` FOREIGN KEY (`orderModificationId`) REFERENCES `order_modification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surcharge`
--

LOCK TABLES `surcharge` WRITE;
/*!40000 ALTER TABLE `surcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `surcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `value` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_category`
--

DROP TABLE IF EXISTS `tax_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_category` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `isDefault` tinyint(4) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_category`
--

LOCK TABLES `tax_category` WRITE;
/*!40000 ALTER TABLE `tax_category` DISABLE KEYS */;
INSERT INTO `tax_category` VALUES ('2023-07-23 00:14:27.207938','2023-07-23 00:29:21.000000','NGN',0,2);
/*!40000 ALTER TABLE `tax_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rate` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `customerGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7ee3306d7638aa85ca90d67219` (`categoryId`),
  KEY `IDX_9872fc7de2f4e532fd3230d191` (`zoneId`),
  KEY `IDX_8b5ab52fc8887c1a769b9276ca` (`customerGroupId`),
  CONSTRAINT `FK_7ee3306d7638aa85ca90d672198` FOREIGN KEY (`categoryId`) REFERENCES `tax_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8b5ab52fc8887c1a769b9276caf` FOREIGN KEY (`customerGroupId`) REFERENCES `customer_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_9872fc7de2f4e532fd3230d1915` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate`
--

LOCK TABLES `tax_rate` WRITE;
/*!40000 ALTER TABLE `tax_rate` DISABLE KEYS */;
INSERT INTO `tax_rate` VALUES ('2023-07-23 00:23:22.161417','2023-07-23 00:23:25.000000','NGN',1,0.00,1,2,1,NULL);
/*!40000 ALTER TABLE `tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` datetime DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  `lastLogin` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2023-07-22 16:43:47.577478','2023-07-22 23:39:55.000000',NULL,'superadmin',1,'2023-07-22 15:39:55',1),('2023-07-22 16:44:21.795222','2023-07-22 23:51:32.000000',NULL,'june@zara.com',0,'2023-07-22 15:51:32',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles_role`
--

DROP TABLE IF EXISTS `user_roles_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `IDX_5f9286e6c25594c6b88c108db7` (`userId`),
  KEY `IDX_4be2f7adf862634f5f803d246b` (`roleId`),
  CONSTRAINT `FK_4be2f7adf862634f5f803d246b8` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_5f9286e6c25594c6b88c108db77` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles_role`
--

LOCK TABLES `user_roles_role` WRITE;
/*!40000 ALTER TABLE `user_roles_role` DISABLE KEYS */;
INSERT INTO `user_roles_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `user_roles_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES ('2023-07-23 00:14:48.430480','2023-07-23 00:14:48.430480','NGN',1);
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_members_region`
--

DROP TABLE IF EXISTS `zone_members_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_members_region` (
  `zoneId` int(11) NOT NULL,
  `regionId` int(11) NOT NULL,
  PRIMARY KEY (`zoneId`,`regionId`),
  KEY `IDX_433f45158e4e2b2a2f344714b2` (`zoneId`),
  KEY `IDX_b45b65256486a15a104e17d495` (`regionId`),
  CONSTRAINT `FK_433f45158e4e2b2a2f344714b22` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_b45b65256486a15a104e17d495c` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_members_region`
--

LOCK TABLES `zone_members_region` WRITE;
/*!40000 ALTER TABLE `zone_members_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_members_region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-23  0:41:33
