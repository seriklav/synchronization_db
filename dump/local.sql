-- Created at 27.6.2019 11:42 using David Grudl MySQL Dump Utility
-- MySQL Server: 5.7.25
-- Database: oval

SET NAMES utf8;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET FOREIGN_KEY_CHECKS=0;
SET UNIQUE_CHECKS=0;
SET AUTOCOMMIT=0;
-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_address`;

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_address` DISABLE KEYS;

ALTER TABLE `oc_address` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_affiliate`;

CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_affiliate` DISABLE KEYS;

ALTER TABLE `oc_affiliate` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_affiliate_activity`;

CREATE TABLE `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_affiliate_activity` DISABLE KEYS;

ALTER TABLE `oc_affiliate_activity` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_affiliate_login`;

CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_affiliate_login` DISABLE KEYS;

ALTER TABLE `oc_affiliate_login` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_affiliate_transaction`;

CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_affiliate_transaction` DISABLE KEYS;

ALTER TABLE `oc_affiliate_transaction` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_api`;

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_api` DISABLE KEYS;

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1,	'Default',	'U6HFMLbUrUgd8nNi3plb8apIo5O21MOegZeHNeiCOmknqsZtxVR3cwGsooiNB8T96dv1AEYwGCEzZCrytGBIiASt2zRrlAPhJCTxZASb0bZgz8OnmVTt80LeJhPEOUBemhDOpEIaH9pJqjcdrOIKSyeVm7jjUQMLFbYl8MzYWDobLmwN78lr53pqYLnH4qswBbssc95LhCHIaU5iH6z1mKnhn4qLnwALTosDySKPM2a8TesRExKCVKeRInUBaGmx',	1,	'2019-06-13 22:11:16',	'2019-06-13 22:11:16');
ALTER TABLE `oc_api` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_api_ip`;

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_api_ip` DISABLE KEYS;

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1,	1,	'::1');
ALTER TABLE `oc_api_ip` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_api_session`;

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_api_session` DISABLE KEYS;

ALTER TABLE `oc_api_session` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute`;

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_attribute` DISABLE KEYS;

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(13,	8,	1);
ALTER TABLE `oc_attribute` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute_description`;

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_attribute_description` DISABLE KEYS;

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(13,	1,	'Цвет'),
(13,	3,	'Цвет');
ALTER TABLE `oc_attribute_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute_group`;

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_attribute_group` DISABLE KEYS;

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(8,	0);
ALTER TABLE `oc_attribute_group` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_attribute_group_description`;

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_attribute_group_description` DISABLE KEYS;

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(8,	3,	'Описание'),
(8,	1,	'Описание');
ALTER TABLE `oc_attribute_group_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_banner`;

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_banner` DISABLE KEYS;

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6,	'Продукция HP',	1),
(7,	'Слайдшоу на главной',	1),
(8,	'Производители',	1);
ALTER TABLE `oc_banner` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_banner_image`;

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_banner_image` DISABLE KEYS;

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79,	7,	1,	'iPhone 6',	'index.php?route=product/product&amp;path=57&amp;product_id=49',	'catalog/demo/banners/iPhone6.jpg',	0),
(87,	6,	1,	'HP Banner',	'index.php?route=product/manufacturer/info&amp;manufacturer_id=7',	'catalog/demo/compaq_presario.jpg',	0),
(94,	8,	1,	'NFL',	'',	'catalog/demo/manufacturer/nfl.png',	0),
(95,	8,	1,	'RedBull',	'',	'catalog/demo/manufacturer/redbull.png',	0),
(96,	8,	1,	'Sony',	'',	'catalog/demo/manufacturer/sony.png',	0),
(91,	8,	1,	'Coca Cola',	'',	'catalog/demo/manufacturer/cocacola.png',	0),
(92,	8,	1,	'Burger King',	'',	'catalog/demo/manufacturer/burgerking.png',	0),
(93,	8,	1,	'Canon',	'',	'catalog/demo/manufacturer/canon.png',	0),
(88,	8,	1,	'Harley Davidson',	'',	'catalog/demo/manufacturer/harley.png',	0),
(89,	8,	1,	'Dell',	'',	'catalog/demo/manufacturer/dell.png',	0),
(90,	8,	1,	'Disney',	'',	'catalog/demo/manufacturer/disney.png',	0),
(80,	7,	1,	'MacBookAir',	'',	'catalog/demo/banners/MacBookAir.jpg',	0),
(97,	8,	1,	'Starbucks',	'',	'catalog/demo/manufacturer/starbucks.png',	0),
(98,	8,	1,	'Nintendo',	'',	'catalog/demo/manufacturer/nintendo.png',	0),
(121,	8,	3,	'Harley Davidson',	'',	'catalog/demo/manufacturer/harley.png',	0),
(122,	8,	3,	'Dell',	'',	'catalog/demo/manufacturer/dell.png',	0),
(120,	8,	3,	'Canon',	'',	'catalog/demo/manufacturer/canon.png',	0),
(119,	8,	3,	'Burger King',	'',	'catalog/demo/manufacturer/burgerking.png',	0),
(118,	8,	3,	'Coca Cola',	'',	'catalog/demo/manufacturer/cocacola.png',	0),
(117,	8,	3,	'Sony',	'',	'catalog/demo/manufacturer/sony.png',	0),
(116,	8,	3,	'RedBull',	'',	'catalog/demo/manufacturer/redbull.png',	0),
(115,	8,	3,	'NFL',	'',	'catalog/demo/manufacturer/nfl.png',	0),
(114,	6,	3,	'HP Banner',	'index.php?route=product/manufacturer/info&amp;manufacturer_id=7',	'catalog/demo/compaq_presario.jpg',	0),
(113,	7,	3,	'iPhone 6',	'index.php?route=product/product&amp;path=57&amp;product_id=49',	'catalog/demo/banners/iPhone6.jpg',	0),
(123,	8,	3,	'Disney',	'',	'catalog/demo/manufacturer/disney.png',	0),
(124,	7,	3,	'MacBookAir',	'',	'catalog/demo/banners/MacBookAir.jpg',	0),
(125,	8,	3,	'Starbucks',	'',	'catalog/demo/manufacturer/starbucks.png',	0),
(126,	8,	3,	'Nintendo',	'',	'catalog/demo/manufacturer/nintendo.png',	0);
ALTER TABLE `oc_banner_image` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_cart`;

CREATE TABLE `oc_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_cart` DISABLE KEYS;

INSERT INTO `oc_cart` (`cart_id`, `api_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(11,	0,	2,	'qkegjb5knrehftf2jmqh9jrl2e',	45,	0,	'{\"227\":\"21\"}',	1,	'2019-06-23 23:04:20'),
(12,	0,	2,	'qkegjb5knrehftf2jmqh9jrl2e',	42,	0,	'{\"228\":\"24\"}',	2,	'2019-06-26 10:19:43');
ALTER TABLE `oc_cart` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category`;

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_category` DISABLE KEYS;

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25,	'',	0,	1,	1,	3,	1,	'2009-01-31 01:04:25',	'2019-06-25 18:36:57'),
(27,	'',	20,	0,	0,	2,	1,	'2009-01-31 01:55:34',	'2010-08-22 06:32:15'),
(20,	'catalog/demo/compaq_presario.jpg',	0,	1,	1,	1,	1,	'2009-01-05 21:49:43',	'2019-06-27 11:28:03'),
(18,	'catalog/demo/hp_2.jpg',	0,	1,	0,	2,	1,	'2009-01-05 21:49:15',	'2019-06-25 18:36:50'),
(28,	'',	25,	0,	0,	1,	1,	'2009-02-02 13:11:12',	'2010-08-22 06:32:46'),
(26,	'',	20,	0,	0,	1,	1,	'2009-01-31 01:55:14',	'2010-08-22 06:31:45'),
(29,	'',	25,	0,	0,	1,	1,	'2009-02-02 13:11:37',	'2010-08-22 06:32:39'),
(30,	'',	25,	0,	0,	1,	1,	'2009-02-02 13:11:59',	'2010-08-22 06:33:00'),
(31,	'',	25,	0,	0,	1,	1,	'2009-02-03 14:17:24',	'2010-08-22 06:33:06'),
(32,	'',	25,	0,	0,	1,	1,	'2009-02-03 14:17:34',	'2010-08-22 06:33:12'),
(34,	'catalog/demo/ipod_touch_4.jpg',	0,	1,	4,	7,	1,	'2009-02-03 14:18:11',	'2019-06-25 18:37:10'),
(35,	'',	28,	0,	0,	0,	1,	'2010-09-17 10:06:48',	'2010-09-18 14:02:42'),
(36,	'',	28,	0,	0,	0,	1,	'2010-09-17 10:07:13',	'2010-09-18 14:02:55'),
(37,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:03:39',	'2011-04-22 01:55:08'),
(38,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:03:51',	'2010-09-18 14:03:51'),
(39,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:04:17',	'2011-04-22 01:55:20'),
(40,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:05:36',	'2010-09-18 14:05:36'),
(41,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:05:49',	'2011-04-22 01:55:30'),
(42,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:06:34',	'2010-11-07 20:31:04'),
(43,	'',	34,	0,	0,	0,	1,	'2010-09-18 14:06:49',	'2011-04-22 01:55:40'),
(44,	'',	34,	0,	0,	0,	1,	'2010-09-21 15:39:21',	'2010-11-07 20:30:55'),
(45,	'',	18,	0,	0,	0,	1,	'2010-09-24 18:29:16',	'2011-04-26 08:52:11'),
(46,	'',	18,	0,	0,	0,	1,	'2010-09-24 18:29:31',	'2011-04-26 08:52:23'),
(47,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:13:16',	'2010-11-07 11:13:16'),
(48,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:13:33',	'2010-11-07 11:13:33'),
(49,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:14:04',	'2010-11-07 11:14:04'),
(50,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:14:23',	'2011-04-22 01:16:01'),
(51,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:14:38',	'2011-04-22 01:16:13'),
(52,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:16:09',	'2011-04-22 01:54:57'),
(53,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:28:53',	'2011-04-22 01:14:36'),
(54,	'',	34,	0,	0,	0,	1,	'2010-11-07 11:29:16',	'2011-04-22 01:16:50'),
(55,	'',	34,	0,	0,	0,	1,	'2010-11-08 10:31:32',	'2010-11-08 10:31:32'),
(56,	'',	34,	0,	0,	0,	1,	'2010-11-08 10:31:50',	'2011-04-22 01:16:37'),
(58,	'',	52,	0,	0,	0,	1,	'2011-05-08 13:44:16',	'2011-05-08 13:44:16');
ALTER TABLE `oc_category` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_description`;

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_category_description` DISABLE KEYS;

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(28,	1,	'Мониторы',	'',	'',	'',	'',	''),
(32,	3,	'Веб-камеры',	'',	'',	'',	'',	''),
(32,	1,	'Веб-камеры',	'',	'',	'',	'',	''),
(31,	1,	'Сканеры',	'',	'',	'',	'',	''),
(30,	1,	'Принтеры',	'',	'',	'',	'',	''),
(29,	1,	'Мышки',	'',	'',	'',	'',	''),
(27,	1,	'Mac',	'',	'',	'',	'',	''),
(26,	1,	'PC',	'',	'',	'',	'',	''),
(25,	3,	'Дітям',	'',	'',	'',	'',	''),
(28,	3,	'Мониторы',	'',	'',	'',	'',	''),
(35,	1,	'test 1',	'',	'',	'',	'',	''),
(36,	1,	'test 2',	'',	'',	'',	'',	''),
(37,	1,	'test 5',	'',	'',	'',	'',	''),
(38,	1,	'test 4',	'',	'',	'',	'',	''),
(39,	1,	'test 6',	'',	'',	'',	'',	''),
(40,	1,	'test 7',	'',	'',	'',	'',	''),
(41,	1,	'test 8',	'',	'',	'',	'',	''),
(42,	1,	'test 9',	'',	'',	'',	'',	''),
(43,	1,	'test 11',	'',	'',	'',	'',	''),
(34,	3,	'Для будинку',	'&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n',	'',	'',	'',	''),
(44,	1,	'test 12',	'',	'',	'',	'',	''),
(45,	1,	'Windows',	'',	'',	'',	'',	''),
(46,	1,	'Macs',	'',	'',	'',	'',	''),
(47,	1,	'test 15',	'',	'',	'',	'',	''),
(48,	1,	'test 16',	'',	'',	'',	'',	''),
(49,	1,	'test 17',	'',	'',	'',	'',	''),
(50,	1,	'test 18',	'',	'',	'',	'',	''),
(51,	1,	'test 19',	'',	'',	'',	'',	''),
(52,	1,	'test 20',	'',	'',	'',	'',	''),
(53,	1,	'test 21',	'',	'',	'',	'',	''),
(54,	1,	'test 22',	'',	'',	'',	'',	''),
(55,	1,	'test 23',	'',	'',	'',	'',	''),
(56,	1,	'test 24',	'',	'',	'',	'',	''),
(31,	3,	'Сканеры',	'',	'',	'',	'',	''),
(58,	1,	'test 25',	'',	'',	'',	'',	''),
(18,	3,	'Чоловікам',	'&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n',	'',	'',	'',	''),
(34,	1,	'Для дома',	'&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n',	'',	'',	'',	''),
(20,	3,	'Жінкам',	'&lt;p&gt;\r\n	Пример текста в описания категории&lt;/p&gt;\r\n',	'H1 заголовок Комьпютеров',	'',	'',	''),
(35,	3,	'test 1',	'',	'',	'',	'',	''),
(36,	3,	'test 2',	'',	'',	'',	'',	''),
(37,	3,	'test 5',	'',	'',	'',	'',	''),
(38,	3,	'test 4',	'',	'',	'',	'',	''),
(39,	3,	'test 6',	'',	'',	'',	'',	''),
(40,	3,	'test 7',	'',	'',	'',	'',	''),
(41,	3,	'test 8',	'',	'',	'',	'',	''),
(42,	3,	'test 9',	'',	'',	'',	'',	''),
(43,	3,	'test 11',	'',	'',	'',	'',	''),
(25,	1,	'Детям',	'',	'',	'',	'',	''),
(26,	3,	'PC',	'',	'',	'',	'',	''),
(27,	3,	'Mac',	'',	'',	'',	'',	''),
(29,	3,	'Мышки',	'',	'',	'',	'',	''),
(30,	3,	'Принтеры',	'',	'',	'',	'',	''),
(18,	1,	'Мужчинам',	'&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n',	'',	'',	'',	''),
(44,	3,	'test 12',	'',	'',	'',	'',	''),
(45,	3,	'Windows',	'',	'',	'',	'',	''),
(46,	3,	'Macs',	'',	'',	'',	'',	''),
(47,	3,	'test 15',	'',	'',	'',	'',	''),
(48,	3,	'test 16',	'',	'',	'',	'',	''),
(49,	3,	'test 17',	'',	'',	'',	'',	''),
(50,	3,	'test 18',	'',	'',	'',	'',	''),
(51,	3,	'test 19',	'',	'',	'',	'',	''),
(52,	3,	'test 20',	'',	'',	'',	'',	''),
(53,	3,	'test 21',	'',	'',	'',	'',	''),
(54,	3,	'test 22',	'',	'',	'',	'',	''),
(55,	3,	'test 23',	'',	'',	'',	'',	''),
(56,	3,	'test 24',	'',	'',	'',	'',	''),
(58,	3,	'test 25',	'',	'',	'',	'',	''),
(20,	1,	'Женщинам',	'&lt;p&gt;\r\n	Пример текста в описания категории&lt;/p&gt;\r\n',	'H1 заголовок Комьпютеров',	'',	'',	'');
ALTER TABLE `oc_category_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_filter`;

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_category_filter` DISABLE KEYS;

ALTER TABLE `oc_category_filter` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_path`;

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_category_path` DISABLE KEYS;

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25,	25,	0),
(28,	25,	0),
(28,	28,	1),
(35,	25,	0),
(35,	28,	1),
(35,	35,	2),
(36,	25,	0),
(36,	28,	1),
(36,	36,	2),
(29,	25,	0),
(29,	29,	1),
(30,	25,	0),
(30,	30,	1),
(31,	25,	0),
(31,	31,	1),
(32,	25,	0),
(32,	32,	1),
(20,	20,	0),
(27,	20,	0),
(27,	27,	1),
(26,	20,	0),
(26,	26,	1),
(18,	18,	0),
(45,	18,	0),
(45,	45,	1),
(46,	18,	0),
(46,	46,	1),
(34,	34,	0),
(37,	34,	0),
(37,	37,	1),
(38,	34,	0),
(38,	38,	1),
(39,	34,	0),
(39,	39,	1),
(40,	34,	0),
(40,	40,	1),
(41,	34,	0),
(41,	41,	1),
(42,	34,	0),
(42,	42,	1),
(43,	34,	0),
(43,	43,	1),
(44,	34,	0),
(44,	44,	1),
(47,	34,	0),
(47,	47,	1),
(48,	34,	0),
(48,	48,	1),
(49,	34,	0),
(49,	49,	1),
(50,	34,	0),
(50,	50,	1),
(51,	34,	0),
(51,	51,	1),
(52,	34,	0),
(52,	52,	1),
(58,	34,	0),
(58,	52,	1),
(58,	58,	2),
(53,	34,	0),
(53,	53,	1),
(54,	34,	0),
(54,	54,	1),
(55,	34,	0),
(55,	55,	1),
(56,	34,	0),
(56,	56,	1);
ALTER TABLE `oc_category_path` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_to_layout`;

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_category_to_layout` DISABLE KEYS;

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(20,	0,	0),
(18,	0,	0),
(25,	0,	0),
(34,	0,	0);
ALTER TABLE `oc_category_to_layout` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_category_to_store`;

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_category_to_store` DISABLE KEYS;

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(18,	0),
(20,	0),
(25,	0),
(26,	0),
(27,	0),
(28,	0),
(29,	0),
(30,	0),
(31,	0),
(32,	0),
(34,	0),
(35,	0),
(36,	0),
(37,	0),
(38,	0),
(39,	0),
(40,	0),
(41,	0),
(42,	0),
(43,	0),
(44,	0),
(45,	0),
(46,	0),
(47,	0),
(48,	0),
(49,	0),
(50,	0),
(51,	0),
(52,	0),
(53,	0),
(54,	0),
(55,	0),
(56,	0),
(58,	0);
ALTER TABLE `oc_category_to_store` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_country`;

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_country` DISABLE KEYS;

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1,	'Афганистан',	'AF',	'AFG',	'',	0,	0),
(2,	'Албания',	'AL',	'ALB',	'',	0,	0),
(3,	'Алжир',	'DZ',	'DZA',	'',	0,	0),
(4,	'Восточное Самоа',	'AS',	'ASM',	'',	0,	0),
(5,	'Андорра',	'AD',	'AND',	'',	0,	0),
(6,	'Ангола',	'AO',	'AGO',	'',	0,	0),
(7,	'Ангилья',	'AI',	'AIA',	'',	0,	0),
(8,	'Антарктида',	'AQ',	'ATA',	'',	0,	0),
(9,	'Антигуа и Барбуда',	'AG',	'ATG',	'',	0,	0),
(10,	'Аргентина',	'AR',	'ARG',	'',	0,	0),
(11,	'Армения',	'AM',	'ARM',	'',	0,	1),
(12,	'Аруба',	'AW',	'ABW',	'',	0,	0),
(13,	'Австралия',	'AU',	'AUS',	'',	0,	0),
(14,	'Австрия',	'AT',	'AUT',	'',	0,	0),
(15,	'Азербайджан',	'AZ',	'AZE',	'',	0,	1),
(16,	'Багамские острова',	'BS',	'BHS',	'',	0,	0),
(17,	'Бахрейн',	'BH',	'BHR',	'',	0,	0),
(18,	'Бангладеш',	'BD',	'BGD',	'',	0,	0),
(19,	'Барбадос',	'BB',	'BRB',	'',	0,	0),
(20,	'Белоруссия (Беларусь)',	'BY',	'BLR',	'',	0,	1),
(21,	'Бельгия',	'BE',	'BEL',	'',	0,	0),
(22,	'Белиз',	'BZ',	'BLZ',	'',	0,	0),
(23,	'Бенин',	'BJ',	'BEN',	'',	0,	0),
(24,	'Бермудские острова',	'BM',	'BMU',	'',	0,	0),
(25,	'Бутан',	'BT',	'BTN',	'',	0,	0),
(26,	'Боливия',	'BO',	'BOL',	'',	0,	0),
(27,	'Босния и Герцеговина',	'BA',	'BIH',	'',	0,	0),
(28,	'Ботсвана',	'BW',	'BWA',	'',	0,	0),
(29,	'Остров Буве',	'BV',	'BVT',	'',	0,	0),
(30,	'Бразилия',	'BR',	'BRA',	'',	0,	0),
(31,	'Британская территория в Индийском океане',	'IO',	'IOT',	'',	0,	0),
(32,	'Бруней',	'BN',	'BRN',	'',	0,	0),
(33,	'Болгария',	'BG',	'BGR',	'',	0,	0),
(34,	'Буркина-Фасо',	'BF',	'BFA',	'',	0,	0),
(35,	'Бурунди',	'BI',	'BDI',	'',	0,	0),
(36,	'Камбоджа',	'KH',	'KHM',	'',	0,	0),
(37,	'Камерун',	'CM',	'CMR',	'',	0,	0),
(38,	'Канада',	'CA',	'CAN',	'',	0,	0),
(39,	'Кабо-Верде',	'CV',	'CPV',	'',	0,	0),
(40,	'Каймановы острова',	'KY',	'CYM',	'',	0,	0),
(41,	'Центрально-Африканская Республика',	'CF',	'CAF',	'',	0,	0),
(42,	'Чад',	'TD',	'TCD',	'',	0,	0),
(43,	'Чили',	'CL',	'CHL',	'',	0,	0),
(44,	'Китайская Народная Республика',	'CN',	'CHN',	'',	0,	0),
(45,	'Остров Рождества',	'CX',	'CXR',	'',	0,	0),
(46,	'Кокосовые острова',	'CC',	'CCK',	'',	0,	0),
(47,	'Колумбия',	'CO',	'COL',	'',	0,	0),
(48,	'Коморские острова',	'KM',	'COM',	'',	0,	0),
(49,	'Конго',	'CG',	'COG',	'',	0,	0),
(50,	'Острова Кука',	'CK',	'COK',	'',	0,	0),
(51,	'Коста-Рика',	'CR',	'CRI',	'',	0,	0),
(52,	'Кот д\'Ивуар',	'CI',	'CIV',	'',	0,	0),
(53,	'Хорватия',	'HR',	'HRV',	'',	0,	0),
(54,	'Куба',	'CU',	'CUB',	'',	0,	0),
(55,	'Кипр',	'CY',	'CYP',	'',	0,	0),
(56,	'Чехия',	'CZ',	'CZE',	'',	0,	0),
(57,	'Дания',	'DK',	'DNK',	'',	0,	0),
(58,	'Джибути',	'DJ',	'DJI',	'',	0,	0),
(59,	'Доминика',	'DM',	'DMA',	'',	0,	0),
(60,	'Доминиканская Республика',	'DO',	'DOM',	'',	0,	0),
(61,	'Восточный Тимор',	'TP',	'TMP',	'',	0,	0),
(62,	'Эквадор',	'EC',	'ECU',	'',	0,	0),
(63,	'Египет',	'EG',	'EGY',	'',	0,	0),
(64,	'Сальвадор',	'SV',	'SLV',	'',	0,	0),
(65,	'Экваториальная Гвинея',	'GQ',	'GNQ',	'',	0,	0),
(66,	'Эритрея',	'ER',	'ERI',	'',	0,	0),
(67,	'Эстония',	'EE',	'EST',	'',	0,	1),
(68,	'Эфиопия',	'ET',	'ETH',	'',	0,	0),
(69,	'Фолклендские (Мальвинские) острова',	'FK',	'FLK',	'',	0,	0),
(70,	'Фарерские острова',	'FO',	'FRO',	'',	0,	0),
(71,	'Фиджи',	'FJ',	'FJI',	'',	0,	0),
(72,	'Финляндия',	'FI',	'FIN',	'',	0,	0),
(73,	'Франция',	'FR',	'FRA',	'',	0,	0),
(74,	'Франция, Метрополия',	'FX',	'FXX',	'',	0,	0),
(75,	'Французская Гвиана',	'GF',	'GUF',	'',	0,	0),
(76,	'Французская Полинезия',	'PF',	'PYF',	'',	0,	0),
(77,	'Французские Южные территории',	'TF',	'ATF',	'',	0,	0),
(78,	'Габон',	'GA',	'GAB',	'',	0,	0),
(79,	'Гамбия',	'GM',	'GMB',	'',	0,	0),
(80,	'Грузия',	'GE',	'GEO',	'',	0,	1),
(81,	'Германия',	'DE',	'DEU',	'{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',	0,	0),
(82,	'Гана',	'GH',	'GHA',	'',	0,	0),
(83,	'Гибралтар',	'GI',	'GIB',	'',	0,	0),
(84,	'Греция',	'GR',	'GRC',	'',	0,	0),
(85,	'Гренландия',	'GL',	'GRL',	'',	0,	0),
(86,	'Гренада',	'GD',	'GRD',	'',	0,	0),
(87,	'Гваделупа',	'GP',	'GLP',	'',	0,	0),
(88,	'Гуам',	'GU',	'GUM',	'',	0,	0),
(89,	'Гватемала',	'GT',	'GTM',	'',	0,	0),
(90,	'Гвинея',	'GN',	'GIN',	'',	0,	0),
(91,	'Гвинея-Бисау',	'GW',	'GNB',	'',	0,	0),
(92,	'Гайана',	'GY',	'GUY',	'',	0,	0),
(93,	'Гаити',	'HT',	'HTI',	'',	0,	0),
(94,	'Херд и Макдональд, острова',	'HM',	'HMD',	'',	0,	0),
(95,	'Гондурас',	'HN',	'HND',	'',	0,	0),
(96,	'Гонконг',	'HK',	'HKG',	'',	0,	0),
(97,	'Венгрия',	'HU',	'HUN',	'',	0,	0),
(98,	'Исландия',	'IS',	'ISL',	'',	0,	0),
(99,	'Индия',	'IN',	'IND',	'',	0,	0),
(100,	'Индонезия',	'ID',	'IDN',	'',	0,	0),
(101,	'Иран',	'IR',	'IRN',	'',	0,	0),
(102,	'Ирак',	'IQ',	'IRQ',	'',	0,	0),
(103,	'Ирландия',	'IE',	'IRL',	'',	0,	0),
(104,	'Израиль',	'IL',	'ISR',	'',	0,	0),
(105,	'Италия',	'IT',	'ITA',	'',	0,	0),
(106,	'Ямайка',	'JM',	'JAM',	'',	0,	0),
(107,	'Япония',	'JP',	'JPN',	'',	0,	0),
(108,	'Иордания',	'JO',	'JOR',	'',	0,	0),
(109,	'Казахстан',	'KZ',	'KAZ',	'',	0,	1),
(110,	'Кения',	'KE',	'KEN',	'',	0,	0),
(111,	'Кирибати',	'KI',	'KIR',	'',	0,	0),
(112,	'Корейская Народно-Демократическая Республика',	'KP',	'PRK',	'',	0,	0),
(113,	'Республика Корея',	'KR',	'KOR',	'',	0,	0),
(114,	'Кувейт',	'KW',	'KWT',	'',	0,	0),
(115,	'Киргизия (Кыргызстан)',	'KG',	'KGZ',	'',	0,	1),
(116,	'Лаос',	'LA',	'LAO',	'',	0,	0),
(117,	'Латвия',	'LV',	'LVA',	'',	0,	1),
(118,	'Ливан',	'LB',	'LBN',	'',	0,	0),
(119,	'Лесото',	'LS',	'LSO',	'',	0,	0),
(120,	'Либерия',	'LR',	'LBR',	'',	0,	0),
(121,	'Ливия',	'LY',	'LBY',	'',	0,	0),
(122,	'Лихтенштейн',	'LI',	'LIE',	'',	0,	0),
(123,	'Литва',	'LT',	'LTU',	'',	0,	1),
(124,	'Люксембург',	'LU',	'LUX',	'',	0,	0),
(125,	'Макао',	'MO',	'MAC',	'',	0,	0),
(126,	'Македония',	'MK',	'MKD',	'',	0,	0),
(127,	'Мадагаскар',	'MG',	'MDG',	'',	0,	0),
(128,	'Малави',	'MW',	'MWI',	'',	0,	0),
(129,	'Малайзия',	'MY',	'MYS',	'',	0,	0),
(130,	'Мальдивы',	'MV',	'MDV',	'',	0,	0),
(131,	'Мали',	'ML',	'MLI',	'',	0,	0),
(132,	'Мальта',	'MT',	'MLT',	'',	0,	0),
(133,	'Маршалловы острова',	'MH',	'MHL',	'',	0,	0),
(134,	'Мартиника',	'MQ',	'MTQ',	'',	0,	0),
(135,	'Мавритания',	'MR',	'MRT',	'',	0,	0),
(136,	'Маврикий',	'MU',	'MUS',	'',	0,	0),
(137,	'Майотта',	'YT',	'MYT',	'',	0,	0),
(138,	'Мексика',	'MX',	'MEX',	'',	0,	0),
(139,	'Микронезия',	'FM',	'FSM',	'',	0,	0),
(140,	'Молдова',	'MD',	'MDA',	'',	0,	1),
(141,	'Монако',	'MC',	'MCO',	'',	0,	0),
(142,	'Монголия',	'MN',	'MNG',	'',	0,	0),
(143,	'Монтсеррат',	'MS',	'MSR',	'',	0,	0),
(144,	'Марокко',	'MA',	'MAR',	'',	0,	0),
(145,	'Мозамбик',	'MZ',	'MOZ',	'',	0,	0),
(146,	'Мьянма',	'MM',	'MMR',	'',	0,	0),
(147,	'Намибия',	'NA',	'NAM',	'',	0,	0),
(148,	'Науру',	'NR',	'NRU',	'',	0,	0),
(149,	'Непал',	'NP',	'NPL',	'',	0,	0),
(150,	'Нидерланды',	'NL',	'NLD',	'',	0,	0),
(151,	'Антильские (Нидерландские) острова',	'AN',	'ANT',	'',	0,	0),
(152,	'Новая Каледония',	'NC',	'NCL',	'',	0,	0),
(153,	'Новая Зеландия',	'NZ',	'NZL',	'',	0,	0),
(154,	'Никарагуа',	'NI',	'NIC',	'',	0,	0),
(155,	'Нигер',	'NE',	'NER',	'',	0,	0),
(156,	'Нигерия',	'NG',	'NGA',	'',	0,	0),
(157,	'Ниуэ',	'NU',	'NIU',	'',	0,	0),
(158,	'Остров Норфолк',	'NF',	'NFK',	'',	0,	0),
(159,	'Северные Марианские острова',	'MP',	'MNP',	'',	0,	0),
(160,	'Норвегия',	'NO',	'NOR',	'',	0,	0),
(161,	'Оман',	'OM',	'OMN',	'',	0,	0),
(162,	'Пакистан',	'PK',	'PAK',	'',	0,	0),
(163,	'Палау',	'PW',	'PLW',	'',	0,	0),
(164,	'Панама',	'PA',	'PAN',	'',	0,	0),
(165,	'Папуа - Новая Гвинея',	'PG',	'PNG',	'',	0,	0),
(166,	'Парагвай',	'PY',	'PRY',	'',	0,	0),
(167,	'Перу',	'PE',	'PER',	'',	0,	0),
(168,	'Филиппины',	'PH',	'PHL',	'',	0,	0),
(169,	'Острова Питкэрн',	'PN',	'PCN',	'',	0,	0),
(170,	'Польша',	'PL',	'POL',	'',	0,	0),
(171,	'Португалия',	'PT',	'PRT',	'',	0,	0),
(172,	'Пуэрто-Рико',	'PR',	'PRI',	'',	0,	0),
(173,	'Катар',	'QA',	'QAT',	'',	0,	0),
(174,	'Реюньон',	'RE',	'REU',	'',	0,	0),
(175,	'Румыния',	'RO',	'ROM',	'',	0,	0),
(176,	'Российская Федерация',	'RU',	'RUS',	'',	0,	1),
(177,	'Руанда',	'RW',	'RWA',	'',	0,	0),
(178,	'Сент-Китс и Невис',	'KN',	'KNA',	'',	0,	0),
(179,	'Сент-Люсия',	'LC',	'LCA',	'',	0,	0),
(180,	'Сент-Винсент и Гренадины',	'VC',	'VCT',	'',	0,	0),
(181,	'Западное Самоа',	'WS',	'WSM',	'',	0,	0),
(182,	'Сан-Марино',	'SM',	'SMR',	'',	0,	0),
(183,	'Сан-Томе и Принсипи',	'ST',	'STP',	'',	0,	0),
(184,	'Саудовская Аравия',	'SA',	'SAU',	'',	0,	0),
(185,	'Сенегал',	'SN',	'SEN',	'',	0,	0),
(186,	'Сейшельские острова',	'SC',	'SYC',	'',	0,	0),
(187,	'Сьерра-Леоне',	'SL',	'SLE',	'',	0,	0),
(188,	'Сингапур',	'SG',	'SGP',	'',	0,	0),
(189,	'Словакия',	'SK',	'SVK',	'{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}',	0,	0),
(190,	'Словения',	'SI',	'SVN',	'',	0,	0),
(191,	'Соломоновы острова',	'SB',	'SLB',	'',	0,	0),
(192,	'Сомали',	'SO',	'SOM',	'',	0,	0),
(193,	'Южно-Африканская Республика',	'ZA',	'ZAF',	'',	0,	0),
(194,	'Южная Джорджия и Южные Сандвичевы острова',	'GS',	'SGS',	'',	0,	0),
(195,	'Испания',	'ES',	'ESP',	'',	0,	0),
(196,	'Шри-Ланка',	'LK',	'LKA',	'',	0,	0),
(197,	'Остров Святой Елены',	'SH',	'SHN',	'',	0,	0),
(198,	'Сен-Пьер и Микелон',	'PM',	'SPM',	'',	0,	0),
(199,	'Судан',	'SD',	'SDN',	'',	0,	0),
(200,	'Суринам',	'SR',	'SUR',	'',	0,	0),
(201,	'Шпицберген и Ян Майен',	'SJ',	'SJM',	'',	0,	0),
(202,	'Свазиленд',	'SZ',	'SWZ',	'',	0,	0),
(203,	'Швеция',	'SE',	'SWE',	'',	0,	0),
(204,	'Швейцария',	'CH',	'CHE',	'',	0,	0),
(205,	'Сирия',	'SY',	'SYR',	'',	0,	0),
(206,	'Тайвань (провинция Китая)',	'TW',	'TWN',	'',	0,	0),
(207,	'Таджикистан',	'TJ',	'TJK',	'',	0,	1),
(208,	'Танзания',	'TZ',	'TZA',	'',	0,	0),
(209,	'Таиланд',	'TH',	'THA',	'',	0,	0),
(210,	'Того',	'TG',	'TGO',	'',	0,	0),
(211,	'Токелау',	'TK',	'TKL',	'',	0,	0),
(212,	'Тонга',	'TO',	'TON',	'',	0,	0),
(213,	'Тринидад и Тобаго',	'TT',	'TTO',	'',	0,	0),
(214,	'Тунис',	'TN',	'TUN',	'',	0,	0),
(215,	'Турция',	'TR',	'TUR',	'',	0,	0),
(216,	'Туркменистан',	'TM',	'TKM',	'',	0,	1),
(217,	'Острова Теркс и Кайкос',	'TC',	'TCA',	'',	0,	0),
(218,	'Тувалу',	'TV',	'TUV',	'',	0,	0),
(219,	'Уганда',	'UG',	'UGA',	'',	0,	0),
(220,	'Украина',	'UA',	'UKR',	'',	0,	1),
(221,	'Объединенные Арабские Эмираты',	'AE',	'ARE',	'',	0,	0),
(222,	'Великобритания',	'GB',	'GBR',	'',	1,	0),
(223,	'Соединенные Штаты Америки',	'US',	'USA',	'{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}',	0,	0),
(224,	'Мелкие отдаленные острова США',	'UM',	'UMI',	'',	0,	0),
(225,	'Уругвай',	'UY',	'URY',	'',	0,	0),
(226,	'Узбекистан',	'UZ',	'UZB',	'',	0,	1),
(227,	'Вануату',	'VU',	'VUT',	'',	0,	0),
(228,	'Ватикан',	'VA',	'VAT',	'',	0,	0),
(229,	'Венесуэла',	'VE',	'VEN',	'',	0,	0),
(230,	'Вьетнам',	'VN',	'VNM',	'',	0,	0),
(231,	'Виргинские острова (Британские)',	'VG',	'VGB',	'',	0,	0),
(232,	'Виргинские острова (США)',	'VI',	'VIR',	'',	0,	0),
(233,	'Уоллис и Футуна',	'WF',	'WLF',	'',	0,	0),
(234,	'Западная Сахара',	'EH',	'ESH',	'',	0,	0),
(235,	'Йемен',	'YE',	'YEM',	'',	0,	0),
(236,	'Сербия и Черногория',	'CS',	'SCG',	'',	0,	0),
(237,	'Заир',	'ZR',	'ZAR',	'',	0,	0),
(238,	'Замбия',	'ZM',	'ZMB',	'',	0,	0),
(239,	'Зимбабве',	'ZW',	'ZWE',	'',	0,	0),
(242,	'Черногория',	'ME',	'MNE',	'',	0,	0),
(243,	'Сербия',	'RS',	'SRB',	'',	0,	0),
(244,	'Аландские острова',	'AX',	'ALA',	'',	0,	0),
(245,	'Бонайре, Синт-Эстатиус и Саба',	'BQ',	'BES',	'',	0,	0),
(246,	'Кюрасао',	'CW',	'CUW',	'',	0,	0),
(247,	'Палестинская территория, оккупированная',	'PS',	'PSE',	'',	0,	0),
(248,	'Южный Судан',	'SS',	'SSD',	'',	0,	0),
(249,	'Санкт-Бартелеми',	'BL',	'BLM',	'',	0,	0),
(250,	'Санкт-Мартин (французская часть)',	'MF',	'MAF',	'',	0,	0),
(251,	'Канарские Острова',	'IC',	'ICA',	'',	0,	0),
(252,	'Остров Вознесения (Великобритания)',	'AC',	'ASC',	'',	0,	0),
(253,	'Косово, Республика',	'XK',	'UNK',	'',	0,	0),
(254,	'Остров Мэн',	'IM',	'IMN',	'',	0,	0),
(255,	'Тристан-да-Кунья',	'TA',	'SHN',	'',	0,	0),
(256,	'Остров Гернси',	'GG',	'GGY',	'',	0,	0),
(257,	'Остров Джерси',	'JE',	'JEY',	'',	0,	0);
ALTER TABLE `oc_country` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon`;

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_coupon` DISABLE KEYS;

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4,	'-10% скидка',	'2222',	'P',	10.0000,	0,	0,	0.0000,	'2011-01-01',	'2012-01-01',	10,	'10',	1,	'2009-01-27 13:55:03'),
(5,	'Бесплатная доставка',	'3333',	'P',	0.0000,	0,	1,	100.0000,	'2009-03-01',	'2009-08-31',	10,	'10',	1,	'2009-03-14 21:13:53'),
(6,	'-10.00 скидка',	'1111',	'F',	10.0000,	0,	0,	10.0000,	'1970-11-01',	'2020-11-01',	100000,	'10000',	1,	'2009-03-14 21:15:18');
ALTER TABLE `oc_coupon` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon_category`;

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_coupon_category` DISABLE KEYS;

ALTER TABLE `oc_coupon_category` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon_history`;

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_coupon_history` DISABLE KEYS;

ALTER TABLE `oc_coupon_history` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_coupon_product`;

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_coupon_product` DISABLE KEYS;

ALTER TABLE `oc_coupon_product` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_currency`;

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_currency` DISABLE KEYS;

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4,	'Гривна',	'UAH',	'',	'грн.',	'2',	1.00000000,	1,	'2019-06-27 11:24:47');
ALTER TABLE `oc_currency` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field`;

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_custom_field` DISABLE KEYS;

ALTER TABLE `oc_custom_field` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_custom_field_customer_group` DISABLE KEYS;

ALTER TABLE `oc_custom_field_customer_group` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_description`;

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_custom_field_description` DISABLE KEYS;

ALTER TABLE `oc_custom_field_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_value`;

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_custom_field_value` DISABLE KEYS;

ALTER TABLE `oc_custom_field_value` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_custom_field_value_description`;

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_custom_field_value_description` DISABLE KEYS;

ALTER TABLE `oc_custom_field_value_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer`;

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer` DISABLE KEYS;

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `code`, `date_added`) VALUES
(2,	1,	0,	3,	'Сергей',	'Лавринюк',	'lavrinyuk.serik@gmail.com',	'+38 (098) 018-34-56',	'',	'71cae17b9641373bc03dad0006124387e9e90b82',	'BRL70kIKQ',	NULL,	NULL,	1,	0,	'',	'::1',	1,	1,	0,	'',	'',	'2019-06-21 02:34:33');
ALTER TABLE `oc_customer` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_activity`;

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_activity` DISABLE KEYS;

ALTER TABLE `oc_customer_activity` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_group`;

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_group` DISABLE KEYS;

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1,	0,	1);
ALTER TABLE `oc_customer_group` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_group_description`;

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_group_description` DISABLE KEYS;

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1,	1,	'Default',	'test'),
(1,	3,	'Default',	'test');
ALTER TABLE `oc_customer_group_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_history`;

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_history` DISABLE KEYS;

ALTER TABLE `oc_customer_history` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_ip`;

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_ip` DISABLE KEYS;

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(2,	2,	'::1',	'2019-06-21 02:34:35');
ALTER TABLE `oc_customer_ip` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_login`;

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_login` DISABLE KEYS;

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1,	'',	'::1',	1,	'2019-06-21 02:35:35',	'2019-06-21 02:35:35');
ALTER TABLE `oc_customer_login` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_online`;

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_online` DISABLE KEYS;

ALTER TABLE `oc_customer_online` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_reward`;

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_reward` DISABLE KEYS;

ALTER TABLE `oc_customer_reward` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_search`;

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_search` DISABLE KEYS;

ALTER TABLE `oc_customer_search` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_transaction`;

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_transaction` DISABLE KEYS;

ALTER TABLE `oc_customer_transaction` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_customer_wishlist`;

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer_wishlist` DISABLE KEYS;

INSERT INTO `oc_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(2,	43,	'2019-06-23 22:07:56'),
(2,	45,	'2019-06-23 23:15:21'),
(2,	44,	'2019-06-23 22:58:12');
ALTER TABLE `oc_customer_wishlist` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_download`;

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_download` DISABLE KEYS;

ALTER TABLE `oc_download` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_download_description`;

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_download_description` DISABLE KEYS;

ALTER TABLE `oc_download_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_event`;

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_event` DISABLE KEYS;

ALTER TABLE `oc_event` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_extension`;

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_extension` DISABLE KEYS;

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1,	'payment',	'cod'),
(3,	'total',	'sub_total'),
(5,	'total',	'total'),
(32,	'module',	'filterpro'),
(31,	'module',	'account'),
(9,	'shipping',	'flat'),
(12,	'total',	'coupon'),
(15,	'total',	'reward'),
(17,	'payment',	'free_checkout'),
(30,	'module',	'information'),
(29,	'module',	'category'),
(20,	'theme',	'theme_default'),
(21,	'dashboard',	'activity'),
(22,	'dashboard',	'sale'),
(23,	'dashboard',	'recent'),
(24,	'dashboard',	'order'),
(25,	'dashboard',	'online'),
(26,	'dashboard',	'map'),
(27,	'dashboard',	'customer'),
(28,	'dashboard',	'chart'),
(33,	'module',	'neat_countdown'),
(34,	'module',	'carousel');
ALTER TABLE `oc_extension` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter`;

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_filter` DISABLE KEYS;

ALTER TABLE `oc_filter` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter_description`;

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_filter_description` DISABLE KEYS;

ALTER TABLE `oc_filter_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter_group`;

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_filter_group` DISABLE KEYS;

ALTER TABLE `oc_filter_group` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_filter_group_description`;

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_filter_group_description` DISABLE KEYS;

ALTER TABLE `oc_filter_group_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_geo_zone`;

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_geo_zone` DISABLE KEYS;

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3,	'НДС',	'Облагаемые НДС',	'2010-02-26 22:33:24',	'2009-01-06 23:26:25');
ALTER TABLE `oc_geo_zone` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_information`;

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `top` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_information` DISABLE KEYS;

INSERT INTO `oc_information` (`information_id`, `bottom`, `top`, `sort_order`, `status`) VALUES
(3,	1,	1,	3,	1),
(4,	1,	0,	1,	1),
(5,	1,	1,	4,	1),
(6,	1,	0,	2,	1),
(7,	0,	1,	3,	1),
(8,	0,	1,	1,	1),
(9,	0,	1,	2,	1),
(10,	0,	1,	3,	1);
ALTER TABLE `oc_information` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_information_description`;

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_information_description` DISABLE KEYS;

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(4,	3,	'Про нас',	'&lt;p&gt;\r\n	О нас&lt;/p&gt;\r\n',	'',	'',	'',	''),
(6,	3,	'Інформація про доставку',	'&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n',	'',	'',	'',	''),
(8,	1,	'Доставка',	'&lt;p&gt;Доставка&lt;br&gt;&lt;/p&gt;',	'',	'',	'',	''),
(7,	3,	'Таблиця розмірів',	'&lt;h1 style=&quot;margin-bottom: 0.7rem; font-size: 2rem; font-weight: bold; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Как определить размер одежды и&amp;nbsp;обуви&lt;/h1&gt;&lt;div class=&quot;description&quot; style=&quot;caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Как правильно выбрать вещь при покупке онлайн, когда нет возможности примерить ее&amp;nbsp;и&amp;nbsp;убедиться, что выбранный товар сидит как вы&amp;nbsp;ожидали? Ответ один&amp;nbsp;— знать размеры одежды и&amp;nbsp;обуви. Воспользуйтесь нашими подсказками, чтобы определить необходимые параметры, и&amp;nbsp;тогда приобретенная новинка обязательно порадует вас.&lt;/p&gt;&lt;ul class=&quot;list-dash&quot; style=&quot;margin-bottom: 2rem; padding: 0px 0px 0px 20px; list-style: none;&quot;&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Чтобы снять с&amp;nbsp;себя мерки, воспользуйтесь сантиметром. Удобно делать это перед зеркалом, так мерки. Или попросите о&amp;nbsp;помощи близких.&lt;/li&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Сантиметр должен плотно облегать вас. Не&amp;nbsp;давайте ему провисать, но&amp;nbsp;и&amp;nbsp;затягивайте не&amp;nbsp;слишком туго&amp;nbsp;— это приведет к&amp;nbsp;искажению замеров. При заказе учитывайте фасон и&amp;nbsp;материал изделия (состав ткани указан на&amp;nbsp;карточке товара). Если вещь должна плотно облегать вас, выбирайте размер в&amp;nbsp;размер. Если хотите свободный силуэт, закажите товар на&amp;nbsp;размер больше.&lt;/li&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Каждый бренд при пошиве изделия использует собственные лекала, поэтому проще определиться с&amp;nbsp;размером, когда в&amp;nbsp;гардеробе уже есть вещь этой марки. Читайте карточку выбранного вами товара на&amp;nbsp;сайте. Обычно бренды указывают размер изделия и&amp;nbsp;подробные параметры. Это поможет вам легче определить нужный размер.&lt;/li&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Главный параметр для платьев, блуз, жакетов, пальто&amp;nbsp;— обхват груди; для брюк важны обхваты талии и&amp;nbsp;бедер.&lt;/li&gt;&lt;/ul&gt;&lt;h2 style=&quot;margin-bottom: 0.7rem; font-size: 1.7rem; font-weight: bold;&quot;&gt;Как измерить свои параметры&lt;/h2&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Чтобы правильно измерить параметры, воспользуйтесь подсказками.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Так мы&amp;nbsp;измеряем вещи:&lt;/p&gt;&lt;dl style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 1.5rem;&quot;&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Обхват груди&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;сантиметровая лента проходит по&amp;nbsp;наиболее выступающим точкам груди, далее&amp;nbsp;— под подмышечными впадинами, на&amp;nbsp;спине&amp;nbsp;— немного выше.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Обхват талии&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;расстояние на&amp;nbsp;уровне линии талии в&amp;nbsp;плечевых изделиях, и&amp;nbsp;расстояние на&amp;nbsp;уровне верхнего среза в&amp;nbsp;поясных изделиях.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Обхват бедер&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;расстояние на&amp;nbsp;уровне линии бедер, измерительная лента должна обхватывать ягодицы в&amp;nbsp;самом широком месте.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина спереди&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;самой высокой точки плеча через выступающую точку груди до&amp;nbsp;низа изделия.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина по&amp;nbsp;спинке&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;седьмого шейного позвонка вдоль линии середины спины до&amp;nbsp;низа изделия.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина рукава&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется по&amp;nbsp;внешней стороне рукава от&amp;nbsp;его плечевого шва до&amp;nbsp;низа.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина рукава от&amp;nbsp;горловины&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;середины горловины или воротника до&amp;nbsp;низа рукава.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина внутреннего шва брючин&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется по&amp;nbsp;внутреннему шву брючин от&amp;nbsp;промежности до&amp;nbsp;низа.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина юбок и&amp;nbsp;шорт&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;верхнего шва до&amp;nbsp;низа изделия. Также при выборе одежды стоит учитывать расхождения в&amp;nbsp;женских и&amp;nbsp;мужских размерах. Ниже приведена таблица с&amp;nbsp;указанием международного размера.&lt;/dd&gt;&lt;/dl&gt;&lt;h2 style=&quot;margin-bottom: 0.7rem; font-size: 1.7rem; font-weight: bold;&quot;&gt;Основные размеры&lt;/h2&gt;&lt;table class=&quot;common-sizes&quot; style=&quot;margin: 1.5rem 0px; position: relative;&quot;&gt;&lt;tbody&gt;&lt;tr style=&quot;cursor: pointer;&quot;&gt;&lt;th class=&quot;sticky&quot; style=&quot;text-align: inherit; padding: 3px 2rem 3px 3px; position: -webkit-sticky; left: 0px; top: auto; z-index: 3;&quot;&gt;Международный&lt;/th&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border-right-width: 1px; border-right-style: solid; border-right-color: lightgrey; border-top-style: none !important; border-bottom-style: none !important; border-left-style: none !important;&quot;&gt;XS&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;S&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;M&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;L&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;XL&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;XXL&lt;/td&gt;&lt;td style=&quot;padding: 3px 15px 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;XXXL&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;cursor: pointer;&quot;&gt;&lt;th class=&quot;sticky&quot; style=&quot;text-align: inherit; padding: 3px 2rem 3px 3px; position: -webkit-sticky; left: 0px; top: auto; z-index: 3;&quot;&gt;Мужские&lt;/th&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border-right-width: 1px; border-right-style: solid; border-right-color: lightgrey; border-top-style: none !important; border-bottom-style: none !important; border-left-style: none !important;&quot;&gt;40-42&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;42-44&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;44-48&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;48-50&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;52-54&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;54-56&lt;/td&gt;&lt;td style=&quot;padding: 3px 15px 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;56-58&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;cursor: pointer;&quot;&gt;&lt;th class=&quot;sticky&quot; style=&quot;text-align: inherit; padding: 3px 2rem 3px 3px; position: -webkit-sticky; left: 0px; top: auto; z-index: 3;&quot;&gt;Женские&lt;/th&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border-right-width: 1px; border-right-style: solid; border-right-color: lightgrey; border-top-style: none !important; border-bottom-style: none !important; border-left-style: none !important;&quot;&gt;38-40&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;40-42&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;42-44&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;44-48&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;48-50&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;52-54&lt;/td&gt;&lt;td style=&quot;padding: 3px 15px 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;54-56&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;div class=&quot;table-sizes&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Не&amp;nbsp;забывайте, что размеры изделий сильно отличаются в&amp;nbsp;зависимости от&amp;nbsp;страны-изготовителя. Подробные таблицы размеров одежды по&amp;nbsp;странам вы&amp;nbsp;найдете в&amp;nbsp;специальных разделах.&lt;/p&gt;&lt;h2 style=&quot;margin-bottom: 0.7rem; font-size: 1.7rem; font-weight: bold;&quot;&gt;Как правильно выбрать обувь&lt;/h2&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Размеры обуви зависят от&amp;nbsp;размера вашей стопы. Простой способ определить размер&amp;nbsp;— обрисовать контур стопы на&amp;nbsp;бумаге и&amp;nbsp;измерив линейкой или сантиметром расстояние от&amp;nbsp;самых выступающих ее&amp;nbsp;частей. При этом лучше обрисовать обе ступни, так как часто они имеют разную длину, и&amp;nbsp;выбрать большую. Не&amp;nbsp;забывайте о&amp;nbsp;сезоне: при выборе зимней или осенней обуви учитывайте, что вы&amp;nbsp;будете носить ее&amp;nbsp;с&amp;nbsp;носком.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;В&amp;nbsp;разных странах приняты свои размеры обуви, это стоит учитывать при покупке. В&amp;nbsp;карточке товара вы&amp;nbsp;найдете информацию о&amp;nbsp;стране-производителе, а&amp;nbsp;таблица размеров обуви поможет вам окончательно определиться с&amp;nbsp;выбором.&lt;/p&gt;&lt;/div&gt;',	'',	'',	'',	''),
(4,	1,	'О нас',	'&lt;p&gt;\r\n	О нас&lt;/p&gt;\r\n',	'',	'',	'',	''),
(9,	1,	'Оплата',	'&lt;p&gt;Оплата&lt;br&gt;&lt;/p&gt;',	'',	'',	'',	''),
(10,	3,	'Повернення',	'&lt;p&gt;Возврат&lt;br&gt;&lt;/p&gt;',	'',	'',	'',	''),
(3,	3,	'Політика конфіденційності',	'&lt;div class=&quot;h1&quot; style=&quot;margin-top: 0px; margin-bottom: 0.7rem; font-size: 2rem; font-weight: bold; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;ООО «Приват Трэйд».&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Юридический адрес: Российская Федерация,&amp;nbsp; 109029, г. Москва, Михайловский проезд &amp;nbsp;д. 1, стр. 1.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Адрес для корреспонденции: 109029, г. Москва, ул. Михайловский проезд, д. 1, стр. 1.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Общество с ограниченной ответственностью «Приват Трэйд» (далее –&amp;nbsp;компания) Приказом Федеральной службы по надзору в сфере связи, информационных технологий и массовых коммуникаций (Роскомнадзор) Министерства связи и массовых коммуникаций Российской Федерации от 24.04.2015 № 136 включено в реестр операторов обработки персональных данных, регистрационный номер&amp;nbsp;&lt;a href=&quot;https://rkn.gov.ru/personal-data/register/?id=77-15-003527&quot; target=&quot;_blank&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;77-15-003527&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Политика конфиденциальности (далее &amp;nbsp;–&amp;nbsp;политика) действует в отношении всей информации, которую компания может получить о посетителе сайта&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;&amp;nbsp;(далее –&amp;nbsp;сайт).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Некоторые объекты, размещённые на сайте, являются интеллектуальной собственностью компании. Их использование установлено действующим законодательством Российской Федерации (далее –&amp;nbsp;законодательство).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сведения на сайте имеют информативный характер, в них могут быть внесены любые изменения без предварительного уведомления.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Общие положения&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания исходит из того, что посетитель сайта (далее –&amp;nbsp;пользователь) самостоятельно, свободно, своей волей и в своём интересе принимает решение о предоставлении своей персональной информации и даёт согласие на её обработку.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания исходит из того, что пользователь предоставляет о себе достоверную персональную информацию и поддерживает её в актуальном состоянии.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Обязательная персональная информация о пользователе, которая необходима для предоставления ему услуг компании, помечена на сайте специальным образом. Иные сведения предоставляются пользователем на его усмотрение.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сайт не обладает возможностью оценивать дееспособность пользователя и не проверяет достоверность персональной информации предоставляемой им.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Использование сайта означает согласие пользователя с настоящей политикой и условиями обработки его персональной информации. При несогласии с ними &amp;nbsp;пользователь должен воздержаться от использования сайта, в том числе и в целях приобретения товара.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Персональная информация пользователя и её безопасность&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Под персональной информацией пользователя понимаются:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;информация, которую пользователь самостоятельно предоставляет о себе при регистрации на сайте или в процессе его использования, включая персональные данные.&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;данные, которые автоматически передаются сайту в процессе его использования программным обеспечением, установленным на устройстве пользователя, в том числе: IP-адрес, данные файлов cookie, сведения о браузере или программе, с помощью которой осуществляется доступ к сайту, технические характеристики используемого оборудования и программного обеспечения, дата и время доступа, адреса запрашиваемых страниц и иная подобная информация.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует организационные и технические меры защиты персональной информации пользователя от неправомерного или случайного доступа, уничтожения, изменения, блокирования, копирования, распространения, а также от иных неправомерных действий с ней третьих лиц.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует, что никакая полученная от пользователя персональная информация никогда и ни при каких условиях не будет предоставлена третьим лицам, за исключением случаев, предусмотренных законодательством.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;В отношении персональной информации пользователя сохраняется конфиденциальность.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;В случае добровольного предоставления информации о себе для общего доступа неограниченному кругу лиц пользователь соглашается с тем, что определённая часть его персональной информации становится общедоступной.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Цели обработки персональной информации&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сайт обрабатывает персональную информацию пользователя в следующих целях:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;идентификация пользователя и предоставление ему личного кабинета на сайте;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;связь с пользователем, в том числе направление уведомлений, запросов и информации, касающихся использования сайта, исполнения соглашений и договоров с компанией, а также обработка его запросов и заявок.&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;улучшение качества сайта, удобства его использования, разработка новых услуг и сервисов;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;целевой подбор рекламных материалов;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;проведение статистических и иных исследований на основе обезличенных данных.&lt;/li&gt;&lt;/ul&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Обработка персональных данных пользователя&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания обрабатывает персональные данные следующими способами:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;неавтоматизированная обработка&amp;nbsp; (на бумажных носителях);&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;автоматизированная обработка;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;смешанная обработка.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания самостоятельно выбирает способы обработки&amp;nbsp; персональных данных в зависимости от целей и&amp;nbsp;&amp;nbsp;собственных материально-технических возможностей.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует, что обработка персональных данных пользователя производится в соответствии с законодательством и осуществляется в целях выполнения её обязательств по договорам купли-продажи заключённых с ним.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Под обработкой персональных данных в целях компании понимается сбор, систематизация, накопление, хранение, уточнение (обновление или изменение), использование (в том числе передача), обезличивание, блокирование и &amp;nbsp;уничтожение персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При обработке персональных данных компания руководствуется принципами:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;законность целей и способов их обработки, добросовестность;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;соответствие целей обработки персональных данных целям, заранее определённым и заявленным при их сборе, а также полномочиям оператора;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;соответствие объёма, характера и способов обработки персональных данных целям им обработки;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;недопустимость обработки персональных данных, избыточных по отношению к целям, заявленным при их сборе;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;недопустимость объединения созданных для несовместимых между собой целей баз данных информационных систем персональных данных.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует конфиденциальность сведений полученных в рамках персональных данных. Компания вправе передать персональные данные третьим лицам только в случае:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;когда этого требует законодательство;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;если без этого пользователю невозможно воспользоваться услугами и товарами компании;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;проведения исследований, выполнения работ или оказания услуг по поручению компании на обезличенных статистических данных, полученных в результате обработки персональной информации пользователя, которые передаются третьему лицу;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;защиты своих прав и законных интересов или третьих лиц при нарушении пользователем настоящей политики;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;по желанию пользователя.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Возможные персональные данные пользователя, подлежащие обработке: имя, пол, год рождения, электронный адрес, контактный телефон, адрес доставки.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Изменение и удаление персональной информации, хранение данных.&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь может изменять (обновлять, дополнять) персональную информацию в личном кабинете самостоятельно или обратившись за помощью в&amp;nbsp;&lt;a href=&quot;mailto:info@kupivip.ru&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;службу поддержки&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь может удалить свою персональную информацию с помощью функции «Удалить аккаунт» находящейся в личном кабинете. Удалив аккаунт, пользователь автоматически отзывает своё согласие на обработку персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь может отозвать своё согласие на обработку персональных данных посредством письменного уведомления компании. Уведомление направляется не менее чем за 1 (один) месяц до момента отзыва согласия. Права пользователя на изменение или удаление его персональной информации могут быть ограничены в соответствии с требованиями законодательства. Данные ограничения могут предусматривать обязанность компании сохранить изменённую или удалённую пользователем информацию на срок, установленный законодательством, и передать такую информацию государственному органу в соответствии с законодательно установленной процедурой.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Рассылки на электронную почту и антиспам&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При создании личного кабинета на сайте пользователь получает подтверждение на указанный им адрес электронной почты (далее –&amp;nbsp;личная почта).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При совершении пользователем покупки на сайте на его личную почту отправляется подтверждение.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При желании и согласии пользователя он может получать на личную почту периодические рассылки от компании, информирующие его о проходящих акциях, &amp;nbsp;знакомящих с её новостями. Периодические информационные рассылки проводятся еженедельно.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь добровольно выбирает, получать ему рассылку или нет. Компания уважает личную свободу пользователя на получение только тех электронных сообщений, которые он хочет.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Отписаться от рассылки пользователь может по специальной ссылке, размещённой в нижней части электронного сообщения, либо в личном кабинете в разделе «Рассылка новостей» сняв соответствующие галочки.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует, что личная почта пользователя не будет использоваться для рассылки спама.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Заключительные положения&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сайт использует технологию cookie, с помощью которой он настраивается на работу с пользователем. Для отключения данной функции, пользователю необходимо изменить &amp;nbsp;настройки своего браузера. Информацию о настройке браузера можно найти на сайте его производителя или производителей расширений и плагинов для браузеров.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;На сайте имеются ссылки, позволяющие перейти на другие сайты. Компания не несёт ответственности за сведения, публикуемые на этих сайтах, и предоставляет ссылки на них для удобства пользователя.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания может менять политику и условия конфиденциальности с уведомлением пользователя путём размещения соответствующей информации на сайте.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Обратная связь. Вопросы и предложения&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Все предложения или вопросы по поводу настоящей политики и работы сайта пользователь может направлять на электронный адрес&amp;nbsp;&lt;a href=&quot;mailto:info@kupivip.ru&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;info@kupivip.ru&lt;/a&gt;.&lt;/p&gt;\r\n',	'Политикой Конфиденциальности',	'',	'Политикой Конфиденциальности',	'Политикой Конфиденциальности'),
(5,	3,	'Обробка персональних данних',	'&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Я, своей волей и в своём интересе даю согласие на обработку, в том числе на сбор, систематизацию, накопление, хранение (уточнение, обновление, изменение), использование, передачу третьим лицам, обезличивание, блокирование и уничтожение моих персональных данных – фамилии, имени, отчества, даты рождения, пола, адреса регистрации или пребывания, номера контактного телефона, адреса электронной почты, Обществу с ограниченной ответственностью «Приват Трэйд», расположенному по адресу: 109029, г. Москва, Михайловский проезд 1 стр. 1 (далее – «Продавец»), с целью предоставления мне товаров и услуг (продуктов), включая, но не ограничиваясь: идентификацией участника в программе лояльности&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/info/t/bonus&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;«KUPIVIP BONUS»&lt;/a&gt;, обеспечения процедуры начисления, учёта и расходования бонусов, осуществление доставки, предоставление сервисных услуг, распространения информационных и рекламных сообщений (по SMS, электронной почте, телефону, иным средствам связи), получения обратной связи.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Настоящим, я также даю своё согласие на трансграничную передачу моих персональных данных, в том числе на территории иностранных государств, не включённых в перечень, утверждённый Приказом Роскомнадзора от 15.03.2013 №274 (ред. от 29.10.2014) &quot;Об утверждении перечня иностранных государств, не являющихся сторонами Конвенции Совета Европы о защите физических лиц при автоматизированной обработке персональных данных и обеспечивающих адекватную защиту прав субъектов персональных данных&quot;, для выполнения вышеуказанных целей обработки персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Подтверждаю, что персональные данные и иные сведения, относящиеся ко мне (фамилия, имя, отчество, дата рождения, пол, паспортные данные, адрес регистрации или пребывания, номер контактного телефона, адрес электронной почты) предоставлены мною Продавцу путём внесения их при регистрации на сайте&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;&amp;nbsp;добровольно и являются достоверными. Я извещён о том, что в случае недостоверности предоставленных мною персональных данных и иных сведений Продавец оставляет за собой право прекратить моё обслуживание посредством сайта&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Я согласен, что мои персональные данные будут обрабатываться способами, соответствующими целям обработки персональных данных, без возможности принятия решения, на основании исключительно автоматизированной обработки моих персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Настоящим подтверждаю, что я ознакомлен и согласен с условиями политики конфиденциальности Продавца.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Согласие даётся мной на 10 (десять) лет с момента регистрации на сайте&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;До моего сведения доведено, что в том случае если я являюсь участником программы лояльности&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/info/t/bonus&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;«KUPIVIP BONUS»&lt;/a&gt;&amp;nbsp;моё согласие автоматически продлевается на срок моего участия в данной программе или на срок её действия, а отзыв настоящего согласия будет автоматически прекращать моё участие в ней.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Настоящее согласие может быть отозвано мной в любой момент путём направления письменного требования в адрес Продавца. Адрес электронной почты Продавца:&amp;nbsp;&lt;a href=&quot;mailto:service@email.kupivip.ru&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;service@email.kupivip.ru&lt;/a&gt;.&lt;/p&gt;\r\n',	'Обработка персональных данных',	'',	'Обработка персональных данных',	'Обработка персональных данных'),
(5,	1,	'Обработка персональных данных',	'&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Я, своей волей и в своём интересе даю согласие на обработку, в том числе на сбор, систематизацию, накопление, хранение (уточнение, обновление, изменение), использование, передачу третьим лицам, обезличивание, блокирование и уничтожение моих персональных данных – фамилии, имени, отчества, даты рождения, пола, адреса регистрации или пребывания, номера контактного телефона, адреса электронной почты, Обществу с ограниченной ответственностью «Приват Трэйд», расположенному по адресу: 109029, г. Москва, Михайловский проезд 1 стр. 1 (далее – «Продавец»), с целью предоставления мне товаров и услуг (продуктов), включая, но не ограничиваясь: идентификацией участника в программе лояльности&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/info/t/bonus&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;«KUPIVIP BONUS»&lt;/a&gt;, обеспечения процедуры начисления, учёта и расходования бонусов, осуществление доставки, предоставление сервисных услуг, распространения информационных и рекламных сообщений (по SMS, электронной почте, телефону, иным средствам связи), получения обратной связи.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Настоящим, я также даю своё согласие на трансграничную передачу моих персональных данных, в том числе на территории иностранных государств, не включённых в перечень, утверждённый Приказом Роскомнадзора от 15.03.2013 №274 (ред. от 29.10.2014) &quot;Об утверждении перечня иностранных государств, не являющихся сторонами Конвенции Совета Европы о защите физических лиц при автоматизированной обработке персональных данных и обеспечивающих адекватную защиту прав субъектов персональных данных&quot;, для выполнения вышеуказанных целей обработки персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Подтверждаю, что персональные данные и иные сведения, относящиеся ко мне (фамилия, имя, отчество, дата рождения, пол, паспортные данные, адрес регистрации или пребывания, номер контактного телефона, адрес электронной почты) предоставлены мною Продавцу путём внесения их при регистрации на сайте&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;&amp;nbsp;добровольно и являются достоверными. Я извещён о том, что в случае недостоверности предоставленных мною персональных данных и иных сведений Продавец оставляет за собой право прекратить моё обслуживание посредством сайта&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Я согласен, что мои персональные данные будут обрабатываться способами, соответствующими целям обработки персональных данных, без возможности принятия решения, на основании исключительно автоматизированной обработки моих персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Настоящим подтверждаю, что я ознакомлен и согласен с условиями политики конфиденциальности Продавца.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Согласие даётся мной на 10 (десять) лет с момента регистрации на сайте&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;До моего сведения доведено, что в том случае если я являюсь участником программы лояльности&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/info/t/bonus&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;«KUPIVIP BONUS»&lt;/a&gt;&amp;nbsp;моё согласие автоматически продлевается на срок моего участия в данной программе или на срок её действия, а отзыв настоящего согласия будет автоматически прекращать моё участие в ней.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Настоящее согласие может быть отозвано мной в любой момент путём направления письменного требования в адрес Продавца. Адрес электронной почты Продавца:&amp;nbsp;&lt;a href=&quot;mailto:service@email.kupivip.ru&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;service@email.kupivip.ru&lt;/a&gt;.&lt;/p&gt;\r\n',	'Обработка персональных данных',	'Обработка персональных данных',	'Обработка персональных данных',	'Обработка персональных данных'),
(3,	1,	'Политикой Конфиденциальности',	'&lt;div class=&quot;h1&quot; style=&quot;margin-top: 0px; margin-bottom: 0.7rem; font-size: 2rem; font-weight: bold; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;ООО «Приват Трэйд».&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Юридический адрес: Российская Федерация,&amp;nbsp; 109029, г. Москва, Михайловский проезд &amp;nbsp;д. 1, стр. 1.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Адрес для корреспонденции: 109029, г. Москва, ул. Михайловский проезд, д. 1, стр. 1.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Общество с ограниченной ответственностью «Приват Трэйд» (далее –&amp;nbsp;компания) Приказом Федеральной службы по надзору в сфере связи, информационных технологий и массовых коммуникаций (Роскомнадзор) Министерства связи и массовых коммуникаций Российской Федерации от 24.04.2015 № 136 включено в реестр операторов обработки персональных данных, регистрационный номер&amp;nbsp;&lt;a href=&quot;https://rkn.gov.ru/personal-data/register/?id=77-15-003527&quot; target=&quot;_blank&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;77-15-003527&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Политика конфиденциальности (далее &amp;nbsp;–&amp;nbsp;политика) действует в отношении всей информации, которую компания может получить о посетителе сайта&amp;nbsp;&lt;a href=&quot;https://www.kupivip.ru/&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;www.kupivip.ru&lt;/a&gt;&amp;nbsp;(далее –&amp;nbsp;сайт).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Некоторые объекты, размещённые на сайте, являются интеллектуальной собственностью компании. Их использование установлено действующим законодательством Российской Федерации (далее –&amp;nbsp;законодательство).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сведения на сайте имеют информативный характер, в них могут быть внесены любые изменения без предварительного уведомления.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Общие положения&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания исходит из того, что посетитель сайта (далее –&amp;nbsp;пользователь) самостоятельно, свободно, своей волей и в своём интересе принимает решение о предоставлении своей персональной информации и даёт согласие на её обработку.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания исходит из того, что пользователь предоставляет о себе достоверную персональную информацию и поддерживает её в актуальном состоянии.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Обязательная персональная информация о пользователе, которая необходима для предоставления ему услуг компании, помечена на сайте специальным образом. Иные сведения предоставляются пользователем на его усмотрение.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сайт не обладает возможностью оценивать дееспособность пользователя и не проверяет достоверность персональной информации предоставляемой им.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Использование сайта означает согласие пользователя с настоящей политикой и условиями обработки его персональной информации. При несогласии с ними &amp;nbsp;пользователь должен воздержаться от использования сайта, в том числе и в целях приобретения товара.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Персональная информация пользователя и её безопасность&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Под персональной информацией пользователя понимаются:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;информация, которую пользователь самостоятельно предоставляет о себе при регистрации на сайте или в процессе его использования, включая персональные данные.&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;данные, которые автоматически передаются сайту в процессе его использования программным обеспечением, установленным на устройстве пользователя, в том числе: IP-адрес, данные файлов cookie, сведения о браузере или программе, с помощью которой осуществляется доступ к сайту, технические характеристики используемого оборудования и программного обеспечения, дата и время доступа, адреса запрашиваемых страниц и иная подобная информация.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует организационные и технические меры защиты персональной информации пользователя от неправомерного или случайного доступа, уничтожения, изменения, блокирования, копирования, распространения, а также от иных неправомерных действий с ней третьих лиц.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует, что никакая полученная от пользователя персональная информация никогда и ни при каких условиях не будет предоставлена третьим лицам, за исключением случаев, предусмотренных законодательством.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;В отношении персональной информации пользователя сохраняется конфиденциальность.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;В случае добровольного предоставления информации о себе для общего доступа неограниченному кругу лиц пользователь соглашается с тем, что определённая часть его персональной информации становится общедоступной.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Цели обработки персональной информации&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сайт обрабатывает персональную информацию пользователя в следующих целях:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;идентификация пользователя и предоставление ему личного кабинета на сайте;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;связь с пользователем, в том числе направление уведомлений, запросов и информации, касающихся использования сайта, исполнения соглашений и договоров с компанией, а также обработка его запросов и заявок.&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;улучшение качества сайта, удобства его использования, разработка новых услуг и сервисов;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;целевой подбор рекламных материалов;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;проведение статистических и иных исследований на основе обезличенных данных.&lt;/li&gt;&lt;/ul&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Обработка персональных данных пользователя&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания обрабатывает персональные данные следующими способами:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;неавтоматизированная обработка&amp;nbsp; (на бумажных носителях);&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;автоматизированная обработка;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;смешанная обработка.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания самостоятельно выбирает способы обработки&amp;nbsp; персональных данных в зависимости от целей и&amp;nbsp;&amp;nbsp;собственных материально-технических возможностей.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует, что обработка персональных данных пользователя производится в соответствии с законодательством и осуществляется в целях выполнения её обязательств по договорам купли-продажи заключённых с ним.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Под обработкой персональных данных в целях компании понимается сбор, систематизация, накопление, хранение, уточнение (обновление или изменение), использование (в том числе передача), обезличивание, блокирование и &amp;nbsp;уничтожение персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При обработке персональных данных компания руководствуется принципами:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;законность целей и способов их обработки, добросовестность;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;соответствие целей обработки персональных данных целям, заранее определённым и заявленным при их сборе, а также полномочиям оператора;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;соответствие объёма, характера и способов обработки персональных данных целям им обработки;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;недопустимость обработки персональных данных, избыточных по отношению к целям, заявленным при их сборе;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;недопустимость объединения созданных для несовместимых между собой целей баз данных информационных систем персональных данных.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует конфиденциальность сведений полученных в рамках персональных данных. Компания вправе передать персональные данные третьим лицам только в случае:&lt;/p&gt;&lt;ul style=&quot;margin-bottom: 1rem; width: 765px; position: relative; border-top-width: 0px; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;когда этого требует законодательство;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;если без этого пользователю невозможно воспользоваться услугами и товарами компании;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;проведения исследований, выполнения работ или оказания услуг по поручению компании на обезличенных статистических данных, полученных в результате обработки персональной информации пользователя, которые передаются третьему лицу;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;защиты своих прав и законных интересов или третьих лиц при нарушении пользователем настоящей политики;&lt;/li&gt;&lt;li style=&quot;list-style: disc;&quot;&gt;по желанию пользователя.&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Возможные персональные данные пользователя, подлежащие обработке: имя, пол, год рождения, электронный адрес, контактный телефон, адрес доставки.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Изменение и удаление персональной информации, хранение данных.&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь может изменять (обновлять, дополнять) персональную информацию в личном кабинете самостоятельно или обратившись за помощью в&amp;nbsp;&lt;a href=&quot;mailto:info@kupivip.ru&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;службу поддержки&lt;/a&gt;.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь может удалить свою персональную информацию с помощью функции «Удалить аккаунт» находящейся в личном кабинете. Удалив аккаунт, пользователь автоматически отзывает своё согласие на обработку персональных данных.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь может отозвать своё согласие на обработку персональных данных посредством письменного уведомления компании. Уведомление направляется не менее чем за 1 (один) месяц до момента отзыва согласия. Права пользователя на изменение или удаление его персональной информации могут быть ограничены в соответствии с требованиями законодательства. Данные ограничения могут предусматривать обязанность компании сохранить изменённую или удалённую пользователем информацию на срок, установленный законодательством, и передать такую информацию государственному органу в соответствии с законодательно установленной процедурой.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Рассылки на электронную почту и антиспам&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При создании личного кабинета на сайте пользователь получает подтверждение на указанный им адрес электронной почты (далее –&amp;nbsp;личная почта).&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При совершении пользователем покупки на сайте на его личную почту отправляется подтверждение.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;При желании и согласии пользователя он может получать на личную почту периодические рассылки от компании, информирующие его о проходящих акциях, &amp;nbsp;знакомящих с её новостями. Периодические информационные рассылки проводятся еженедельно.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Пользователь добровольно выбирает, получать ему рассылку или нет. Компания уважает личную свободу пользователя на получение только тех электронных сообщений, которые он хочет.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Отписаться от рассылки пользователь может по специальной ссылке, размещённой в нижней части электронного сообщения, либо в личном кабинете в разделе «Рассылка новостей» сняв соответствующие галочки.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания гарантирует, что личная почта пользователя не будет использоваться для рассылки спама.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Заключительные положения&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Сайт использует технологию cookie, с помощью которой он настраивается на работу с пользователем. Для отключения данной функции, пользователю необходимо изменить &amp;nbsp;настройки своего браузера. Информацию о настройке браузера можно найти на сайте его производителя или производителей расширений и плагинов для браузеров.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;На сайте имеются ссылки, позволяющие перейти на другие сайты. Компания не несёт ответственности за сведения, публикуемые на этих сайтах, и предоставляет ссылки на них для удобства пользователя.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Компания может менять политику и условия конфиденциальности с уведомлением пользователя путём размещения соответствующей информации на сайте.&lt;/p&gt;&lt;h3 style=&quot;margin-bottom: 0.5rem; font-size: 1.5rem; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Обратная связь. Вопросы и предложения&lt;/h3&gt;&lt;p style=&quot;margin-bottom: 1.3em; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;Все предложения или вопросы по поводу настоящей политики и работы сайта пользователь может направлять на электронный адрес&amp;nbsp;&lt;a href=&quot;mailto:info@kupivip.ru&quot; style=&quot;cursor: pointer; color: inherit; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); transition: border-bottom 0.2s ease-out;&quot;&gt;info@kupivip.ru&lt;/a&gt;.&lt;/p&gt;\r\n',	'Политикой Конфиденциальности',	'Политикой Конфиденциальности',	'Политикой Конфиденциальности',	'Политикой Конфиденциальности'),
(6,	1,	'Информация о доставке',	'&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n',	'',	'',	'',	''),
(8,	3,	'Доставка',	'&lt;p&gt;Доставка&lt;br&gt;&lt;/p&gt;',	'',	'',	'',	''),
(9,	3,	'Оплата',	'&lt;p&gt;Оплата&lt;br&gt;&lt;/p&gt;',	'',	'',	'',	''),
(10,	1,	'Возврат',	'&lt;p&gt;Возврат&lt;br&gt;&lt;/p&gt;',	'',	'',	'',	''),
(7,	1,	'Таблица размеров',	'&lt;h1 style=&quot;margin-bottom: 0.7rem; font-size: 2rem; font-weight: bold; caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif;&quot;&gt;Как определить размер одежды и&amp;nbsp;обуви&lt;/h1&gt;&lt;div class=&quot;description&quot; style=&quot;caret-color: rgb(51, 51, 51); color: rgb(51, 51, 51); font-family: Gerbera, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Как правильно выбрать вещь при покупке онлайн, когда нет возможности примерить ее&amp;nbsp;и&amp;nbsp;убедиться, что выбранный товар сидит как вы&amp;nbsp;ожидали? Ответ один&amp;nbsp;— знать размеры одежды и&amp;nbsp;обуви. Воспользуйтесь нашими подсказками, чтобы определить необходимые параметры, и&amp;nbsp;тогда приобретенная новинка обязательно порадует вас.&lt;/p&gt;&lt;ul class=&quot;list-dash&quot; style=&quot;margin-bottom: 2rem; padding: 0px 0px 0px 20px; list-style: none;&quot;&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Чтобы снять с&amp;nbsp;себя мерки, воспользуйтесь сантиметром. Удобно делать это перед зеркалом, так мерки. Или попросите о&amp;nbsp;помощи близких.&lt;/li&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Сантиметр должен плотно облегать вас. Не&amp;nbsp;давайте ему провисать, но&amp;nbsp;и&amp;nbsp;затягивайте не&amp;nbsp;слишком туго&amp;nbsp;— это приведет к&amp;nbsp;искажению замеров. При заказе учитывайте фасон и&amp;nbsp;материал изделия (состав ткани указан на&amp;nbsp;карточке товара). Если вещь должна плотно облегать вас, выбирайте размер в&amp;nbsp;размер. Если хотите свободный силуэт, закажите товар на&amp;nbsp;размер больше.&lt;/li&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Каждый бренд при пошиве изделия использует собственные лекала, поэтому проще определиться с&amp;nbsp;размером, когда в&amp;nbsp;гардеробе уже есть вещь этой марки. Читайте карточку выбранного вами товара на&amp;nbsp;сайте. Обычно бренды указывают размер изделия и&amp;nbsp;подробные параметры. Это поможет вам легче определить нужный размер.&lt;/li&gt;&lt;li style=&quot;position: relative; margin-bottom: 1rem;&quot;&gt;Главный параметр для платьев, блуз, жакетов, пальто&amp;nbsp;— обхват груди; для брюк важны обхваты талии и&amp;nbsp;бедер.&lt;/li&gt;&lt;/ul&gt;&lt;h2 style=&quot;margin-bottom: 0.7rem; font-size: 1.7rem; font-weight: bold;&quot;&gt;Как измерить свои параметры&lt;/h2&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Чтобы правильно измерить параметры, воспользуйтесь подсказками.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Так мы&amp;nbsp;измеряем вещи:&lt;/p&gt;&lt;dl style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 1.5rem;&quot;&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Обхват груди&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;сантиметровая лента проходит по&amp;nbsp;наиболее выступающим точкам груди, далее&amp;nbsp;— под подмышечными впадинами, на&amp;nbsp;спине&amp;nbsp;— немного выше.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Обхват талии&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;расстояние на&amp;nbsp;уровне линии талии в&amp;nbsp;плечевых изделиях, и&amp;nbsp;расстояние на&amp;nbsp;уровне верхнего среза в&amp;nbsp;поясных изделиях.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Обхват бедер&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;расстояние на&amp;nbsp;уровне линии бедер, измерительная лента должна обхватывать ягодицы в&amp;nbsp;самом широком месте.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина спереди&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;самой высокой точки плеча через выступающую точку груди до&amp;nbsp;низа изделия.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина по&amp;nbsp;спинке&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;седьмого шейного позвонка вдоль линии середины спины до&amp;nbsp;низа изделия.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина рукава&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется по&amp;nbsp;внешней стороне рукава от&amp;nbsp;его плечевого шва до&amp;nbsp;низа.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина рукава от&amp;nbsp;горловины&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;середины горловины или воротника до&amp;nbsp;низа рукава.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина внутреннего шва брючин&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется по&amp;nbsp;внутреннему шву брючин от&amp;nbsp;промежности до&amp;nbsp;низа.&lt;/dd&gt;&lt;dt style=&quot;float: left; margin: 0px 6px 0px 0px;&quot;&gt;Длина юбок и&amp;nbsp;шорт&lt;/dt&gt;&lt;dd style=&quot;margin-top: 0px; margin-right: 0px; margin-bottom: 1rem;&quot;&gt;—&amp;nbsp;измеряется от&amp;nbsp;верхнего шва до&amp;nbsp;низа изделия. Также при выборе одежды стоит учитывать расхождения в&amp;nbsp;женских и&amp;nbsp;мужских размерах. Ниже приведена таблица с&amp;nbsp;указанием международного размера.&lt;/dd&gt;&lt;/dl&gt;&lt;h2 style=&quot;margin-bottom: 0.7rem; font-size: 1.7rem; font-weight: bold;&quot;&gt;Основные размеры&lt;/h2&gt;&lt;table class=&quot;common-sizes&quot; style=&quot;margin: 1.5rem 0px; position: relative;&quot;&gt;&lt;tbody&gt;&lt;tr style=&quot;cursor: pointer;&quot;&gt;&lt;th class=&quot;sticky&quot; style=&quot;text-align: inherit; padding: 3px 2rem 3px 3px; position: -webkit-sticky; left: 0px; top: auto; z-index: 3;&quot;&gt;Международный&lt;/th&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border-right-width: 1px; border-right-style: solid; border-right-color: lightgrey; border-top-style: none !important; border-bottom-style: none !important; border-left-style: none !important;&quot;&gt;XS&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;S&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;M&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;L&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;XL&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;XXL&lt;/td&gt;&lt;td style=&quot;padding: 3px 15px 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;XXXL&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;cursor: pointer;&quot;&gt;&lt;th class=&quot;sticky&quot; style=&quot;text-align: inherit; padding: 3px 2rem 3px 3px; position: -webkit-sticky; left: 0px; top: auto; z-index: 3;&quot;&gt;Мужские&lt;/th&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border-right-width: 1px; border-right-style: solid; border-right-color: lightgrey; border-top-style: none !important; border-bottom-style: none !important; border-left-style: none !important;&quot;&gt;40-42&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;42-44&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;44-48&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;48-50&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;52-54&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;54-56&lt;/td&gt;&lt;td style=&quot;padding: 3px 15px 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;56-58&lt;/td&gt;&lt;/tr&gt;&lt;tr style=&quot;cursor: pointer;&quot;&gt;&lt;th class=&quot;sticky&quot; style=&quot;text-align: inherit; padding: 3px 2rem 3px 3px; position: -webkit-sticky; left: 0px; top: auto; z-index: 3;&quot;&gt;Женские&lt;/th&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border-right-width: 1px; border-right-style: solid; border-right-color: lightgrey; border-top-style: none !important; border-bottom-style: none !important; border-left-style: none !important;&quot;&gt;38-40&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;40-42&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;42-44&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;44-48&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;48-50&lt;/td&gt;&lt;td style=&quot;padding: 3px 1rem 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;52-54&lt;/td&gt;&lt;td style=&quot;padding: 3px 15px 3px 3px; white-space: nowrap; border: none !important;&quot;&gt;54-56&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;div class=&quot;table-sizes&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Не&amp;nbsp;забывайте, что размеры изделий сильно отличаются в&amp;nbsp;зависимости от&amp;nbsp;страны-изготовителя. Подробные таблицы размеров одежды по&amp;nbsp;странам вы&amp;nbsp;найдете в&amp;nbsp;специальных разделах.&lt;/p&gt;&lt;h2 style=&quot;margin-bottom: 0.7rem; font-size: 1.7rem; font-weight: bold;&quot;&gt;Как правильно выбрать обувь&lt;/h2&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;Размеры обуви зависят от&amp;nbsp;размера вашей стопы. Простой способ определить размер&amp;nbsp;— обрисовать контур стопы на&amp;nbsp;бумаге и&amp;nbsp;измерив линейкой или сантиметром расстояние от&amp;nbsp;самых выступающих ее&amp;nbsp;частей. При этом лучше обрисовать обе ступни, так как часто они имеют разную длину, и&amp;nbsp;выбрать большую. Не&amp;nbsp;забывайте о&amp;nbsp;сезоне: при выборе зимней или осенней обуви учитывайте, что вы&amp;nbsp;будете носить ее&amp;nbsp;с&amp;nbsp;носком.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1.3em;&quot;&gt;В&amp;nbsp;разных странах приняты свои размеры обуви, это стоит учитывать при покупке. В&amp;nbsp;карточке товара вы&amp;nbsp;найдете информацию о&amp;nbsp;стране-производителе, а&amp;nbsp;таблица размеров обуви поможет вам окончательно определиться с&amp;nbsp;выбором.&lt;/p&gt;&lt;/div&gt;',	'',	'',	'',	'');
ALTER TABLE `oc_information_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_information_to_layout`;

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_information_to_layout` DISABLE KEYS;

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(7,	0,	0),
(8,	0,	0),
(9,	0,	0),
(10,	0,	0),
(3,	0,	0),
(5,	0,	0),
(4,	0,	0),
(6,	0,	0);
ALTER TABLE `oc_information_to_layout` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_information_to_store`;

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_information_to_store` DISABLE KEYS;

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3,	0),
(4,	0),
(5,	0),
(6,	0),
(7,	0),
(8,	0),
(9,	0),
(10,	0);
ALTER TABLE `oc_information_to_store` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_language`;

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_language` DISABLE KEYS;

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1,	'Руский',	'ru-ru',	'ru_RU.UTF-8,ru_RU,russian',	'ru.png',	'russian',	1,	1),
(3,	'Український',	'ua-uk',	'ua_UA.UTF-8,ua_UA,ua_UA,ua',	'',	'',	1,	1);
ALTER TABLE `oc_language` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_layout`;

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_layout` DISABLE KEYS;

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1,	'Главная'),
(2,	'Продукт'),
(3,	'Категория'),
(4,	'По умолчанию'),
(5,	'Производитель'),
(6,	'Аккаунт'),
(7,	'Оформление заказ'),
(8,	'Контакты'),
(9,	'Карта сайта'),
(10,	'Партнерская программа'),
(11,	'Информация'),
(12,	'Сравнение'),
(13,	'Поиск'),
(14,	'Логин'),
(15,	'FilterPro'),
(16,	'Товары со скидкой'),
(17,	'Производитель товары');
ALTER TABLE `oc_layout` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_layout_module`;

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_layout_module` DISABLE KEYS;

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(86,	4,	'category',	'column_left',	0),
(83,	5,	'account',	'column_left',	2),
(69,	10,	'affiliate',	'column_right',	1),
(78,	8,	'information',	'column_left',	0),
(77,	11,	'information',	'column_left',	0),
(74,	3,	'category',	'column_left',	0),
(75,	13,	'category',	'column_left',	0),
(80,	14,	'category',	'column_left',	0),
(79,	9,	'information',	'column_left',	0),
(81,	6,	'account',	'column_left',	0),
(82,	16,	'category',	'column_left',	0),
(84,	5,	'carousel.33',	'content_top',	0),
(85,	17,	'category',	'column_left',	0),
(87,	7,	'category',	'column_left',	0);
ALTER TABLE `oc_layout_module` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_layout_route`;

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_layout_route` DISABLE KEYS;

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(62,	6,	0,	'account/%'),
(17,	10,	0,	'affiliate/%'),
(54,	3,	0,	'product/category'),
(42,	1,	0,	'common/home'),
(20,	2,	0,	'product/product'),
(57,	11,	0,	'information/information'),
(68,	7,	0,	'checkout/%'),
(58,	8,	0,	'information/contact'),
(59,	9,	0,	'information/sitemap'),
(67,	4,	0,	''),
(65,	5,	0,	'product/manufacturer'),
(52,	12,	0,	'product/compare'),
(55,	13,	0,	'product/search'),
(61,	14,	0,	'account/login'),
(63,	15,	0,	'product/filter'),
(64,	16,	0,	'product/special'),
(66,	17,	0,	'product/manufacturer/info');
ALTER TABLE `oc_layout_route` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_length_class`;

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,2) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_length_class` DISABLE KEYS;

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1,	1.00),
(2,	10.00),
(3,	0.39);
ALTER TABLE `oc_length_class` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_length_class_description`;

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_length_class_description` DISABLE KEYS;

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1,	1,	'Сантиметр',	'см'),
(2,	1,	'Миллиметр',	'мм'),
(1,	3,	'Сантиметр',	'см'),
(2,	3,	'Миллиметр',	'мм');
ALTER TABLE `oc_length_class_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_location`;

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_location` DISABLE KEYS;

ALTER TABLE `oc_location` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_manufacturer`;

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_manufacturer` DISABLE KEYS;

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5,	'HTC',	'catalog/demo/htc_logo.jpg',	0),
(6,	'Palm',	'catalog/demo/palm_logo.jpg',	0),
(7,	'Hewlett-Packard',	'catalog/demo/hp_logo.jpg',	0),
(8,	'Apple',	'catalog/demo/apple_logo.jpg',	0),
(9,	'Canon',	'catalog/demo/canon_logo.jpg',	0),
(10,	'Sony',	'catalog/demo/sony_logo.jpg',	0);
ALTER TABLE `oc_manufacturer` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_manufacturer_description`;

CREATE TABLE `oc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_manufacturer_description` DISABLE KEYS;

INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `name`, `description`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(5,	1,	'HTC',	'',	'HTC',	'',	'',	''),
(6,	1,	'Palm',	'',	'Palm',	'',	'',	''),
(9,	3,	'Canon',	'Пример текста в описания производителя',	'Canon',	'',	'',	''),
(7,	1,	'Hewlett-Packard',	'',	'Hewlett-Packard',	'',	'',	''),
(8,	3,	'Apple',	'',	'Apple',	'',	'',	''),
(8,	1,	'Apple',	'',	'Apple',	'',	'',	''),
(9,	1,	'Canon',	'Пример текста в описания производителя',	'Canon',	'',	'',	''),
(6,	3,	'Palm',	'',	'Palm',	'',	'',	''),
(7,	3,	'Hewlett-Packard',	'',	'Hewlett-Packard',	'',	'',	''),
(10,	1,	'Sony',	'',	'Sony',	'',	'',	''),
(5,	3,	'HTC',	'',	'HTC',	'',	'',	''),
(10,	3,	'Sony',	'',	'Sony',	'',	'',	'');
ALTER TABLE `oc_manufacturer_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_manufacturer_to_store` DISABLE KEYS;

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5,	0),
(6,	0),
(7,	0),
(8,	0),
(9,	0),
(10,	0);
ALTER TABLE `oc_manufacturer_to_store` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_marketing`;

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_marketing` DISABLE KEYS;

ALTER TABLE `oc_marketing` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_menu`;

CREATE TABLE `oc_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_menu` DISABLE KEYS;

ALTER TABLE `oc_menu` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_menu_description`;

CREATE TABLE `oc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`menu_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_menu_description` DISABLE KEYS;

ALTER TABLE `oc_menu_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_menu_module`;

CREATE TABLE `oc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`menu_module_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_menu_module` DISABLE KEYS;

ALTER TABLE `oc_menu_module` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_modification`;

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_modification` DISABLE KEYS;

ALTER TABLE `oc_modification` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_module`;

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_module` DISABLE KEYS;

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(32,	'Окончание акции',	'neat_countdown',	'{\"name\":\"\\u041e\\u043a\\u043e\\u043d\\u0447\\u0430\\u043d\\u0438\\u0435 \\u0430\\u043a\\u0446\\u0438\\u0438\",\"view\":\"textual\",\"status\":\"1\",\"clock\":\"combo\",\"clock--critdiff\":\"300\",\"layouts\":[3,4,13,2,17,16,-1]}'),
(33,	'Производители',	'carousel',	'{\"name\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0438\",\"banner_id\":\"8\",\"width\":\"162\",\"height\":\"62\",\"status\":\"1\"}');
ALTER TABLE `oc_module` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_option`;

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_option` DISABLE KEYS;

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(11,	'radio',	10);
ALTER TABLE `oc_option` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_option_description`;

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_option_description` DISABLE KEYS;

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(11,	3,	'Размер'),
(11,	1,	'Размер');
ALTER TABLE `oc_option_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_option_value`;

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_option_value` DISABLE KEYS;

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(48,	11,	'',	3),
(47,	11,	'',	2),
(46,	11,	'',	1),
(51,	11,	'',	0),
(50,	11,	'',	0),
(49,	11,	'',	0);
ALTER TABLE `oc_option_value` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_option_value_description`;

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_option_value_description` DISABLE KEYS;

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(49,	3,	11,	'44 RU'),
(50,	3,	11,	'45 RU'),
(51,	3,	11,	'46 RU'),
(47,	3,	11,	'42 RU'),
(46,	3,	11,	'41 RU'),
(48,	3,	11,	'43 RU'),
(48,	1,	11,	'43 RU'),
(46,	1,	11,	'41 RU'),
(47,	1,	11,	'42 RU'),
(51,	1,	11,	'46 RU'),
(50,	1,	11,	'45 RU'),
(49,	1,	11,	'44 RU');
ALTER TABLE `oc_option_value_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order`;

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order` DISABLE KEYS;

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1,	0,	'INV-2013-00',	0,	'TheOval',	'http://oval.loc/',	0,	1,	'Sergey',	'Lavrinyuk',	'serik.lavrinyuk@gmail.com',	'380980183456',	'',	'[]',	'Sergey',	'Lavrinyuk',	'',	'тест',	'',	'Харьков',	'',	'Украина',	220,	'Харьковская область',	4224,	'',	'[]',	'Оплата при получении',	'cod',	'Sergey',	'Lavrinyuk',	'',	'тест',	'',	'Харьков',	'',	'Украина',	220,	'Харьковская область',	4224,	'',	'[]',	'Фиксированная стоимость доставки',	'flat.flat',	'',	3000.0000,	0,	0,	0.0000,	0,	'',	1,	4,	'UAH',	1.00000000,	'::1',	'',	'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15',	'ru',	'2019-06-24 19:23:57',	'2019-06-24 19:23:57'),
(2,	0,	'INV-2013-00',	0,	'TheOval',	'http://oval.loc/',	0,	1,	'Sergey',	'Lavrinyuk',	'serik.lavrinyuk@gmail.com',	'380980183456',	'',	'[]',	'Sergey',	'Lavrinyuk',	'',	'тест',	'',	'Харьков',	'',	'Украина',	220,	'Харьковская область',	4224,	'',	'[]',	'Оплата при получении',	'cod',	'Sergey',	'Lavrinyuk',	'',	'тест',	'',	'Харьков',	'',	'Украина',	220,	'Харьковская область',	4224,	'',	'[]',	'Фиксированная стоимость доставки',	'flat.flat',	'',	1500.0000,	1,	0,	0.0000,	0,	'',	1,	4,	'UAH',	1.00000000,	'::1',	'',	'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15',	'ru',	'2019-06-24 19:31:16',	'2019-06-24 19:31:20');
ALTER TABLE `oc_order` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_custom_field`;

CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_custom_field` DISABLE KEYS;

ALTER TABLE `oc_order_custom_field` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_history`;

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_history` DISABLE KEYS;

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1,	2,	1,	0,	'',	'2019-06-24 19:31:20');
ALTER TABLE `oc_order_history` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_option`;

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_option` DISABLE KEYS;

INSERT INTO `oc_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1,	1,	2,	227,	19,	'Размер',	'43 RU',	'radio');
ALTER TABLE `oc_order_option` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_product`;

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_product` DISABLE KEYS;

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1,	1,	43,	'MacBook',	'Товар 16',	2,	500.0000,	1000.0000,	0.0000,	1200),
(2,	1,	45,	'MacBook Pro',	'Товар 18',	1,	2000.0000,	2000.0000,	0.0000,	800),
(3,	2,	43,	'MacBook',	'Товар 16',	1,	500.0000,	500.0000,	0.0000,	600),
(4,	2,	44,	'MacBook Air',	'Товар 17',	1,	1000.0000,	1000.0000,	0.0000,	700);
ALTER TABLE `oc_order_product` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_recurring`;

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_recurring` DISABLE KEYS;

ALTER TABLE `oc_order_recurring` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_recurring_transaction` DISABLE KEYS;

ALTER TABLE `oc_order_recurring_transaction` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_status`;

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_status` DISABLE KEYS;

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1,	1,	'Ожидание'),
(2,	1,	'В обработке'),
(3,	1,	'Доставлено'),
(7,	1,	'Отменено'),
(5,	1,	'Сделка завершена'),
(8,	1,	'Возврат'),
(9,	1,	'Отмена и аннулирование'),
(10,	1,	'Неудавшийся'),
(11,	1,	'Возмещенный'),
(12,	1,	'Полностью измененный'),
(13,	1,	'Полный возврат'),
(5,	3,	'Сделка завершена'),
(7,	3,	'Отменено'),
(3,	3,	'Доставлено'),
(2,	3,	'В обработке'),
(1,	3,	'Ожидание'),
(8,	3,	'Возврат'),
(9,	3,	'Отмена и аннулирование'),
(10,	3,	'Неудавшийся'),
(11,	3,	'Возмещенный'),
(12,	3,	'Полностью измененный'),
(13,	3,	'Полный возврат');
ALTER TABLE `oc_order_status` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_total`;

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_total` DISABLE KEYS;

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1,	1,	'sub_total',	'Предварительная стоимость',	3000.0000,	1),
(2,	1,	'total',	'Итого',	3000.0000,	9),
(3,	2,	'sub_total',	'Предварительная стоимость',	1500.0000,	1),
(4,	2,	'total',	'Итого',	1500.0000,	9);
ALTER TABLE `oc_order_total` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_order_voucher`;

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_order_voucher` DISABLE KEYS;

ALTER TABLE `oc_order_voucher` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product`;

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,2) NOT NULL DEFAULT '0.00',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,2) NOT NULL DEFAULT '0.00',
  `width` decimal(15,2) NOT NULL DEFAULT '0.00',
  `height` decimal(15,2) NOT NULL DEFAULT '0.00',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product` DISABLE KEYS;

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28,	'Товар 1',	'',	'',	'',	'',	'',	'',	'',	939,	7,	'catalog/demo/htc_touch_hd_1.jpg',	5,	1,	100.0000,	200,	9,	'2009-02-03',	146.40,	2,	0.00,	0.00,	0.00,	1,	1,	1,	0,	1,	0,	'2009-02-03 16:06:50',	'2019-06-23 23:58:57'),
(29,	'Товар 2',	'',	'',	'',	'',	'',	'',	'',	999,	6,	'catalog/demo/palm_treo_pro_1.jpg',	6,	1,	279.9900,	0,	9,	'2009-02-03',	133.00,	2,	0.00,	0.00,	0.00,	3,	1,	1,	0,	1,	0,	'2009-02-03 16:42:17',	'2011-09-30 01:06:08'),
(30,	'Товар 3',	'',	'',	'',	'',	'',	'',	'',	7,	6,	'catalog/demo/canon_eos_5d_1.jpg',	9,	1,	100.0000,	0,	9,	'2009-02-03',	0.00,	1,	0.00,	0.00,	0.00,	1,	1,	1,	0,	1,	0,	'2009-02-03 16:59:00',	'2019-06-23 23:58:35'),
(31,	'Товар 4',	'',	'',	'',	'',	'',	'',	'',	1000,	6,	'catalog/demo/nikon_d300_1.jpg',	0,	1,	80.0000,	0,	9,	'2009-02-03',	0.00,	1,	0.00,	0.00,	0.00,	3,	1,	1,	0,	1,	0,	'2009-02-03 17:00:10',	'2011-09-30 01:06:00'),
(32,	'Товар 5',	'',	'',	'',	'',	'',	'',	'',	999,	6,	'catalog/demo/ipod_touch_1.jpg',	8,	1,	100.0000,	0,	9,	'2009-02-03',	5.00,	1,	0.00,	0.00,	0.00,	1,	1,	1,	0,	1,	0,	'2009-02-03 17:07:26',	'2019-06-24 02:01:43'),
(33,	'Товар 6',	'',	'',	'',	'',	'',	'',	'',	1000,	6,	'catalog/demo/samsung_syncmaster_941bw.jpg',	0,	1,	200.0000,	0,	9,	'2009-02-03',	5.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	0,	'2009-02-03 17:08:31',	'2011-09-30 01:06:29'),
(34,	'Товар 7',	'',	'',	'',	'',	'',	'',	'',	1000,	6,	'catalog/demo/ipod_shuffle_1.jpg',	8,	1,	100.0000,	0,	9,	'2009-02-03',	5.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	0,	'2009-02-03 18:07:54',	'2011-09-30 01:07:17'),
(35,	'Товар 8',	'',	'',	'',	'',	'',	'',	'',	1000,	5,	'',	0,	0,	100.0000,	0,	9,	'2009-02-03',	5.00,	1,	0.00,	0.00,	0.00,	1,	1,	1,	0,	1,	0,	'2009-02-03 18:08:31',	'2011-09-30 01:06:17'),
(36,	'Товар 9',	'',	'',	'',	'',	'',	'',	'',	994,	6,	'catalog/demo/ipod_nano_1.jpg',	8,	0,	100.0000,	100,	9,	'2009-02-03',	5.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	1,	'2009-02-03 18:09:19',	'2019-06-24 02:01:13'),
(40,	'Товар 11',	'',	'',	'',	'',	'',	'',	'',	970,	5,	'catalog/demo/iphone_1.jpg',	8,	1,	101.0000,	0,	9,	'2009-02-03',	10.00,	1,	0.00,	0.00,	0.00,	1,	1,	1,	0,	1,	0,	'2009-02-03 21:07:12',	'2019-06-23 23:59:56'),
(41,	'Товар 14',	'',	'',	'',	'',	'',	'',	'',	977,	5,	'catalog/demo/imac_1.jpg',	8,	1,	100.0000,	0,	9,	'2009-02-03',	5.00,	1,	0.00,	0.00,	0.00,	1,	1,	1,	0,	1,	1,	'2009-02-03 21:07:26',	'2019-06-23 23:59:50'),
(42,	'Товар 15',	'',	'',	'',	'',	'',	'',	'',	990,	5,	'catalog/demo/apple_cinema_30.jpg',	8,	1,	100.0000,	400,	9,	'2009-02-04',	12.50,	1,	1.00,	2.00,	3.00,	1,	1,	2,	0,	1,	63,	'2009-02-03 21:07:37',	'2019-06-24 04:22:37'),
(43,	'Товар 16',	'',	'',	'',	'',	'',	'',	'',	928,	5,	'catalog/demo/macbook_1.jpg',	8,	0,	500.0000,	0,	9,	'2009-02-03',	0.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	40,	'2009-02-03 21:07:49',	'2019-06-23 23:42:34'),
(44,	'Товар 17',	'',	'',	'',	'',	'',	'',	'',	999,	5,	'catalog/demo/macbook_air_1.jpg',	8,	1,	1000.0000,	0,	9,	'2009-02-03',	0.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	1,	'2009-02-03 21:08:00',	'2011-09-30 01:05:53'),
(45,	'Товар 18',	'',	'',	'',	'',	'',	'',	'',	998,	5,	'catalog/demo/macbook_pro_1.jpg',	8,	1,	2000.0000,	0,	0,	'2009-02-03',	0.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	83,	'2009-02-03 21:08:17',	'2019-06-24 00:00:40'),
(46,	'Товар 19',	'Товар 19',	'',	'',	'',	'',	'',	'',	1000,	5,	'catalog/demo/sony_vaio_1.jpg',	10,	1,	1000.0000,	0,	9,	'2009-02-03',	0.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	0,	'2009-02-03 21:08:29',	'2019-06-24 20:29:45'),
(47,	'Товар 21',	'',	'',	'',	'',	'',	'',	'',	100,	5,	'catalog/demo/hp_1.jpg',	7,	1,	100.0000,	400,	9,	'2009-02-03',	1.00,	1,	0.00,	0.00,	0.00,	1,	0,	1,	0,	1,	138,	'2009-02-03 21:08:40',	'2019-06-24 03:13:52'),
(48,	'Товар 20',	'test 1',	'',	'',	'',	'',	'',	'test 2',	995,	5,	'catalog/demo/ipod_classic_1.jpg',	8,	1,	100.0000,	0,	9,	'2009-02-08',	1.00,	1,	0.00,	0.00,	0.00,	2,	1,	1,	0,	1,	1,	'2009-02-08 17:21:51',	'2019-06-24 00:00:15'),
(49,	'SAM1',	'',	'',	'',	'',	'',	'',	'',	0,	8,	'catalog/demo/samsung_tab_1.jpg',	0,	1,	199.9900,	0,	9,	'2011-04-25',	0.00,	1,	0.00,	0.00,	0.00,	1,	1,	1,	1,	1,	0,	'2011-04-26 08:57:34',	'2011-09-30 01:06:23');
ALTER TABLE `oc_product` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_attribute`;

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_attribute` DISABLE KEYS;

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(42,	13,	1,	'Красный'),
(30,	13,	1,	'Черный'),
(47,	13,	1,	'Белый'),
(28,	13,	1,	'Синий'),
(41,	13,	1,	'Зеленый'),
(40,	13,	1,	'Розовый'),
(48,	13,	1,	'коричневый'),
(36,	13,	1,	'фиолетовый'),
(45,	13,	1,	'желтый'),
(42,	13,	3,	'Красный'),
(30,	13,	3,	'Черный'),
(47,	13,	3,	'Белый'),
(28,	13,	3,	'Синий'),
(41,	13,	3,	'Зеленый'),
(40,	13,	3,	'Розовый'),
(48,	13,	3,	'коричневый'),
(36,	13,	3,	'фиолетовый'),
(45,	13,	3,	'желтый');
ALTER TABLE `oc_product_attribute` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_description`;

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_description` DISABLE KEYS;

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_h1`, `meta_description`, `meta_keyword`) VALUES
(42,	1,	'Apple Cinema 30&quot;',	'&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n',	'Apple, компьютеры,  гибкие',	'Apple Cinema 30&quot;',	'',	'',	''),
(45,	1,	'MacBook Pro',	'&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;',	'Apple, компьютеры,  гибкие',	'MacBook Pro',	'MacBook Pro',	'MacBook Pro',	'MacBook Pro'),
(42,	3,	'Apple Cinema 30&quot;',	'&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n',	'Apple, компьютеры,  гибкие',	'Apple Cinema 30&quot;',	'',	'',	''),
(30,	1,	'Canon EOS 5D',	'&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n',	'',	'Canon EOS 5D',	'',	'',	''),
(49,	1,	'Samsung Galaxy Tab 10.1',	'&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n',	'',	'Samsung Galaxy Tab 10.1',	'',	'',	''),
(31,	1,	'Nikon D300',	'&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;',	'',	'Nikon D300',	'',	'',	''),
(44,	1,	'MacBook Air',	'&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n',	'',	'MacBook Air',	'',	'',	''),
(35,	3,	'Product 8',	'&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n',	'',	'Product 8',	'',	'',	''),
(48,	3,	'iPod Classic',	'&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;',	'',	'iPod Classic',	'',	'',	''),
(40,	3,	'iPhone',	'&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n',	'',	'iPhone',	'',	'',	''),
(29,	1,	'Palm Treo Pro',	'&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n',	'',	'Palm Treo Pro',	'',	'',	''),
(36,	1,	'iPod Nano',	'&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n',	'',	'iPod Nano',	'',	'',	''),
(46,	1,	'Sony VAIO',	'&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n',	'',	'Sony VAIO',	'',	'',	''),
(47,	1,	'HP LP3065',	'&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n',	'',	'HP LP3065',	'',	'',	''),
(32,	1,	'iPod Touch',	'&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n',	'',	'iPod Touch',	'',	'',	''),
(41,	1,	'iMac',	'&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n',	'',	'iMac',	'',	'',	''),
(33,	1,	'Samsung SyncMaster 941BW',	'&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n',	'',	'Samsung SyncMaster 941BW',	'',	'',	''),
(34,	1,	'iPod Shuffle',	'&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n',	'',	'iPod Shuffle',	'',	'',	''),
(43,	1,	'MacBook',	'&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n',	'',	'MacBook',	'',	'',	''),
(35,	1,	'Product 8',	'&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n',	'',	'Product 8',	'',	'',	''),
(48,	1,	'iPod Classic',	'&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;',	'',	'iPod Classic',	'',	'',	''),
(40,	1,	'iPhone',	'&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n',	'',	'iPhone',	'',	'',	''),
(28,	1,	'HTC Touch HD',	'&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n',	'',	'HTC Touch HD',	'',	'',	''),
(45,	3,	'MacBook Pro',	'&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;',	'Apple, компьютеры,  гибкие',	'MacBook Pro',	'',	'MacBook Pro',	'MacBook Pro'),
(30,	3,	'Canon EOS 5D',	'&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n',	'',	'Canon EOS 5D',	'',	'',	''),
(49,	3,	'Samsung Galaxy Tab 10.1',	'&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n',	'',	'Samsung Galaxy Tab 10.1',	'',	'',	''),
(31,	3,	'Nikon D300',	'&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;',	'',	'Nikon D300',	'',	'',	''),
(44,	3,	'MacBook Air',	'&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n',	'',	'MacBook Air',	'',	'',	''),
(29,	3,	'Palm Treo Pro',	'&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n',	'',	'Palm Treo Pro',	'',	'',	''),
(36,	3,	'iPod Nano',	'&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n',	'',	'iPod Nano',	'',	'',	''),
(46,	3,	'Sony VAIO',	'&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n',	'',	'Sony VAIO',	'',	'',	''),
(47,	3,	'HP LP3065',	'&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n',	'',	'HP LP3065',	'',	'',	''),
(32,	3,	'iPod Touch',	'&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n',	'',	'iPod Touch',	'',	'',	''),
(41,	3,	'iMac',	'&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n',	'',	'iMac',	'',	'',	''),
(33,	3,	'Samsung SyncMaster 941BW',	'&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n',	'',	'Samsung SyncMaster 941BW',	'',	'',	''),
(34,	3,	'iPod Shuffle',	'&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n',	'',	'iPod Shuffle',	'',	'',	''),
(43,	3,	'MacBook',	'&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n',	'',	'MacBook',	'',	'',	''),
(28,	3,	'HTC Touch HD',	'&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n',	'',	'HTC Touch HD',	'',	'',	'');
ALTER TABLE `oc_product_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_discount`;

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_discount` DISABLE KEYS;

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(467,	42,	1,	30,	1,	66.0000,	'0000-00-00',	'0000-00-00'),
(466,	42,	1,	20,	1,	77.0000,	'0000-00-00',	'0000-00-00'),
(465,	42,	1,	10,	1,	88.0000,	'0000-00-00',	'0000-00-00');
ALTER TABLE `oc_product_discount` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_filter`;

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_filter` DISABLE KEYS;

ALTER TABLE `oc_product_filter` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_image`;

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2479 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_image` DISABLE KEYS;

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2416,	30,	'catalog/demo/canon_eos_5d_2.jpg',	0),
(2464,	47,	'catalog/demo/hp_2.jpg',	0),
(2420,	28,	'catalog/demo/htc_touch_hd_3.jpg',	0),
(2429,	41,	'catalog/demo/imac_3.jpg',	0),
(2434,	40,	'catalog/demo/iphone_6.jpg',	0),
(2448,	36,	'catalog/demo/ipod_nano_5.jpg',	0),
(2447,	36,	'catalog/demo/ipod_nano_4.jpg',	0),
(2005,	34,	'catalog/demo/ipod_shuffle_5.jpg',	0),
(2004,	34,	'catalog/demo/ipod_shuffle_4.jpg',	0),
(2454,	32,	'catalog/demo/ipod_touch_4.jpg',	0),
(2453,	32,	'catalog/demo/ipod_touch_3.jpg',	0),
(2452,	32,	'catalog/demo/ipod_touch_2.jpg',	0),
(2384,	43,	'catalog/demo/macbook_3.jpg',	0),
(2383,	43,	'catalog/demo/macbook_2.jpg',	0),
(1974,	44,	'catalog/demo/macbook_air_4.jpg',	0),
(1973,	44,	'catalog/demo/macbook_air_2.jpg',	0),
(2444,	45,	'catalog/demo/macbook_pro_4.jpg',	0),
(2443,	45,	'catalog/demo/macbook_pro_3.jpg',	0),
(1986,	31,	'catalog/demo/nikon_d300_3.jpg',	0),
(1985,	31,	'catalog/demo/nikon_d300_2.jpg',	0),
(1988,	29,	'catalog/demo/palm_treo_pro_3.jpg',	0),
(2478,	46,	'catalog/demo/sony_vaio_5.jpg',	0),
(2477,	46,	'catalog/demo/sony_vaio_4.jpg',	0),
(2437,	48,	'catalog/demo/ipod_classic_2.jpg',	0),
(2436,	48,	'catalog/demo/ipod_classic_3.jpg',	0),
(2433,	40,	'catalog/demo/iphone_2.jpg',	0),
(2432,	40,	'catalog/demo/iphone_5.jpg',	0),
(2415,	30,	'catalog/demo/canon_eos_5d_3.jpg',	0),
(2463,	47,	'catalog/demo/hp_3.jpg',	0),
(2419,	28,	'catalog/demo/htc_touch_hd_2.jpg',	0),
(2428,	41,	'catalog/demo/imac_2.jpg',	0),
(2431,	40,	'catalog/demo/iphone_3.jpg',	0),
(2430,	40,	'catalog/demo/iphone_4.jpg',	0),
(2435,	48,	'catalog/demo/ipod_classic_4.jpg',	0),
(2446,	36,	'catalog/demo/ipod_nano_2.jpg',	0),
(2445,	36,	'catalog/demo/ipod_nano_3.jpg',	0),
(2003,	34,	'catalog/demo/ipod_shuffle_2.jpg',	0),
(2002,	34,	'catalog/demo/ipod_shuffle_3.jpg',	0),
(2451,	32,	'catalog/demo/ipod_touch_5.jpg',	0),
(2450,	32,	'catalog/demo/ipod_touch_6.jpg',	0),
(2449,	32,	'catalog/demo/ipod_touch_7.jpg',	0),
(2382,	43,	'catalog/demo/macbook_4.jpg',	0),
(2381,	43,	'catalog/demo/macbook_5.jpg',	0),
(1972,	44,	'catalog/demo/macbook_air_3.jpg',	0),
(2442,	45,	'catalog/demo/macbook_pro_2.jpg',	0),
(1984,	31,	'catalog/demo/nikon_d300_4.jpg',	0),
(1983,	31,	'catalog/demo/nikon_d300_5.jpg',	0),
(1987,	29,	'catalog/demo/palm_treo_pro_2.jpg',	0),
(2476,	46,	'catalog/demo/sony_vaio_2.jpg',	0),
(2475,	46,	'catalog/demo/sony_vaio_3.jpg',	0),
(2327,	49,	'catalog/demo/samsung_tab_7.jpg',	0),
(2326,	49,	'catalog/demo/samsung_tab_6.jpg',	0),
(2325,	49,	'catalog/demo/samsung_tab_5.jpg',	0),
(2324,	49,	'catalog/demo/samsung_tab_4.jpg',	0),
(2323,	49,	'catalog/demo/samsung_tab_3.jpg',	0),
(2322,	49,	'catalog/demo/samsung_tab_2.jpg',	0),
(2474,	42,	'catalog/demo/canon_logo.jpg',	0),
(2473,	42,	'catalog/demo/hp_1.jpg',	0),
(2472,	42,	'catalog/demo/compaq_presario.jpg',	0),
(2471,	42,	'catalog/demo/canon_eos_5d_1.jpg',	0),
(2470,	42,	'catalog/demo/canon_eos_5d_2.jpg',	0);
ALTER TABLE `oc_product_image` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_option`;

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_option` DISABLE KEYS;

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224,	35,	11,	'',	1),
(232,	47,	11,	'',	1),
(228,	42,	11,	'',	1),
(233,	36,	11,	'',	1),
(234,	32,	11,	'',	1),
(230,	30,	11,	'',	1),
(227,	45,	11,	'',	1);
ALTER TABLE `oc_product_option` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_option_value`;

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,2) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`),
  KEY `option_value_id` (`option_value_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_option_value` DISABLE KEYS;

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(30,	232,	47,	11,	49,	100,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(27,	230,	30,	11,	51,	6,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(28,	230,	30,	11,	50,	3,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(12,	224,	35,	11,	46,	0,	1,	5.0000,	'+',	0,	'+',	0.00,	'+'),
(13,	224,	35,	11,	47,	10,	1,	10.0000,	'+',	0,	'+',	0.00,	'+'),
(14,	224,	35,	11,	48,	15,	1,	15.0000,	'+',	0,	'+',	0.00,	'+'),
(24,	228,	42,	11,	47,	3,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(19,	227,	45,	11,	48,	4,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(18,	227,	45,	11,	47,	3,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(17,	227,	45,	11,	46,	2,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(20,	227,	45,	11,	49,	5,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(22,	227,	45,	11,	51,	4,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(21,	227,	45,	11,	50,	6,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(23,	228,	42,	11,	46,	4,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(31,	233,	36,	11,	49,	3,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(32,	233,	36,	11,	49,	5,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(33,	234,	32,	11,	49,	5,	1,	0.0000,	'+',	0,	'+',	0.00,	'+'),
(34,	234,	32,	11,	51,	6,	1,	0.0000,	'+',	0,	'+',	0.00,	'+');
ALTER TABLE `oc_product_option_value` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_recurring`;

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_recurring` DISABLE KEYS;

ALTER TABLE `oc_product_recurring` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_related`;

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_related` DISABLE KEYS;

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(28,	45),
(30,	45),
(40,	42),
(41,	42),
(41,	45),
(42,	40),
(42,	41),
(42,	45),
(45,	28),
(45,	30),
(45,	41),
(45,	42),
(45,	47),
(47,	45);
ALTER TABLE `oc_product_related` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_reward`;

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=573 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_reward` DISABLE KEYS;

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(572,	42,	1,	100),
(570,	47,	1,	300),
(566,	28,	1,	400),
(554,	43,	1,	600),
(339,	29,	1,	0),
(564,	30,	1,	200),
(331,	44,	1,	700),
(567,	45,	1,	800),
(337,	31,	1,	0),
(425,	35,	1,	0),
(345,	33,	1,	0),
(353,	34,	1,	0),
(521,	49,	1,	1000);
ALTER TABLE `oc_product_reward` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_special`;

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_special` DISABLE KEYS;

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(456,	42,	1,	1,	90.0000,	'2019-06-24',	'2019-06-27'),
(454,	30,	1,	2,	90.0000,	'0000-00-00',	'0000-00-00'),
(453,	30,	1,	1,	80.0000,	'0000-00-00',	'0000-00-00');
ALTER TABLE `oc_product_special` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_category`;

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_to_category` DISABLE KEYS;

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(28,	20,	1),
(29,	20,	1),
(30,	20,	1),
(46,	55,	1),
(32,	34,	1),
(33,	20,	1),
(33,	28,	0),
(34,	34,	1),
(35,	20,	1),
(36,	34,	1),
(40,	20,	1),
(41,	27,	1),
(42,	20,	1),
(42,	28,	0),
(43,	18,	1),
(43,	20,	0),
(44,	18,	1),
(44,	20,	0),
(45,	18,	1),
(46,	18,	0),
(46,	20,	0),
(47,	18,	1),
(47,	20,	0),
(48,	20,	1),
(48,	34,	0);
ALTER TABLE `oc_product_to_category` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_download`;

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_to_download` DISABLE KEYS;

ALTER TABLE `oc_product_to_download` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_layout`;

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_to_layout` DISABLE KEYS;

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(45,	0,	0),
(42,	0,	0),
(47,	0,	0),
(43,	0,	0),
(30,	0,	0),
(28,	0,	0),
(41,	0,	0),
(40,	0,	0),
(48,	0,	0),
(36,	0,	0),
(32,	0,	0),
(46,	0,	0);
ALTER TABLE `oc_product_to_layout` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_product_to_store`;

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_product_to_store` DISABLE KEYS;

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28,	0),
(29,	0),
(30,	0),
(31,	0),
(32,	0),
(33,	0),
(34,	0),
(35,	0),
(36,	0),
(40,	0),
(41,	0),
(42,	0),
(43,	0),
(44,	0),
(45,	0),
(46,	0),
(47,	0),
(48,	0),
(49,	0);
ALTER TABLE `oc_product_to_store` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_recurring`;

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_recurring` DISABLE KEYS;

ALTER TABLE `oc_recurring` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_recurring_description`;

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_recurring_description` DISABLE KEYS;

ALTER TABLE `oc_recurring_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_return`;

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_return` DISABLE KEYS;

ALTER TABLE `oc_return` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_action`;

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_return_action` DISABLE KEYS;

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1,	1,	'Возвращены средства'),
(2,	1,	'Выдан в кредит'),
(3,	1,	'Отправлена замена (отправлен другой товар для замены)'),
(1,	3,	'Возвращены средства'),
(2,	3,	'Выдан в кредит'),
(3,	3,	'Отправлена замена (отправлен другой товар для замены)');
ALTER TABLE `oc_return_action` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_history`;

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_return_history` DISABLE KEYS;

ALTER TABLE `oc_return_history` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_reason`;

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_return_reason` DISABLE KEYS;

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1,	1,	'Получен/доставлен неисправным (сломанным)'),
(2,	1,	'Получен не тот (ошибочный) товар'),
(4,	1,	'Ошибочный, пожалуйста, укажите/приложите подробности'),
(5,	1,	'Другое (другая причина), пожалуйста, укажите/приложите подробности'),
(2,	3,	'Получен не тот (ошибочный) товар'),
(1,	3,	'Получен/доставлен неисправным (сломанным)'),
(4,	3,	'Ошибочный, пожалуйста, укажите/приложите подробности'),
(5,	3,	'Другое (другая причина), пожалуйста, укажите/приложите подробности');
ALTER TABLE `oc_return_reason` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_return_status`;

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_return_status` DISABLE KEYS;

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1,	1,	'В обработке'),
(3,	1,	'Готов (к отправке) / или Завершен'),
(2,	1,	'В ожидании'),
(3,	3,	'Готов (к отправке) / или Завершен'),
(1,	3,	'В обработке'),
(2,	3,	'В ожидании');
ALTER TABLE `oc_return_status` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_review`;

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_review` DISABLE KEYS;

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1,	45,	0,	'Сергей',	'MacBook сел хорошо, на узкую ногу, поскольку заходят достаточно плотно. В общем доволен. С момента покупки до доставки почти месяц',	4,	1,	'2019-06-21 22:43:13',	'0000-00-00 00:00:00'),
(2,	45,	2,	'Сергей Лавринюк',	'Тестовый проверочный отзыв!',	5,	1,	'2019-06-22 23:42:34',	'2019-06-22 23:42:59'),
(3,	45,	2,	'Сергей Лавринюк',	'Тестовый 1 Тестовый 1 Тестовый 1',	3,	1,	'2019-06-22 23:43:41',	'2019-06-22 23:45:00'),
(4,	45,	2,	'Сергей Лавринюк',	'Тестовый 1 Тестовый 1 Тестовый 2',	3,	1,	'2019-06-22 23:43:51',	'2019-06-22 23:45:05'),
(5,	45,	2,	'Сергей Лавринюк',	'Тестовый 1 Тестовый 1 Тестовый 3',	2,	1,	'2019-06-22 23:43:55',	'2019-06-22 23:45:10'),
(6,	45,	2,	'Сергей Лавринюк',	'Тестовый 1 Тестовый 1 Тестовый 4',	5,	1,	'2019-06-22 23:43:59',	'2019-06-22 23:45:15'),
(7,	45,	2,	'Сергей Лавринюк',	'Тестовый 1 Тестовый 1 Тестовый 6',	5,	1,	'2019-06-22 23:44:04',	'2019-06-22 23:44:53');
ALTER TABLE `oc_review` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_setting`;

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=887 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_setting` DISABLE KEYS;

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(864,	0,	'config',	'config_password',	'1',	0),
(865,	0,	'config',	'config_shared',	'0',	0),
(866,	0,	'config',	'config_encryption',	'bWv1NfLkC3gcwhn5fA0HfTsL4AmswzzbkeACZue9GkGmmWuF9zOTAJ6KJo4uCx1K00HwGPDMjRKpY82La2OEqi3Gy0LMvWQAr0ESueIiNAhXhysgaVuH3sjrEyZVWVohzSvKu5TEb4GHfSYXH0SoAL7DHAi1vp2d8bw3FjCIhBQCkcfDAnph8URRCrdkZE6Wv9cahHCLNe7Bp5ElzNWs5jxVPjYvAtGZ9DPIpoiN7Fc4Qnp3KIhkgL6fmsWH5e5GzA6zVPAMrVljsDQCa9TjfDc4aLdmXjDsIjrVPeiFO0MKhckvgJlDTKhw5UqZRXszd25V4LTMKHAbRj9LNYQ71n2jmMlI5RNgbUz1ivPBWM2iZEWb5QWdMyRg03ywb0dej4MFeBwJRHmY7fu043X3YfyKBVYiQWrfInRuziWvYPqWS7o60ZfqfByGfXIb6Nk9kzW8GCVbC2UZJKUDomQEMC4ejAG6m6Nq0DjY4esGcVuluYVHCuxMjuL1n88k3D94HsuqlaR2mxJw1Gcf6yQAxsXBFkze8rbN3P0EzgAygxoj51H32lnQydkxWgZE5zwxuTXhuramYFIObfOyKpdmnnYCy4a68kE2t4c4JhFGiHvIX7JrgNPvAuz8i61VcYqBHxnRNxu6GzRwmjjZF0XDBklCsLE3UkGdL8Q0zsH08e40OMeGbg6jM6MfbJcxMmaVPuSyj2Mb5fXJun2lJoNtkqHjll3RsapmoCfOzopZ8OzXxQzATwz8THHfTLMqCO5OLfi96zVCNN5cJqa9Bdm0LSHdlACgXRkx4XJXW2vQ0j0Pq4G123mR2aLnK8gBclsJePSbYLbxjYvqWQuccz9y5b2uoG7BMcHz4gohOhjCrg3c3luTcE4nzNPmw3FSwiLEXmaW4AdNIaBMAd94cyggrmC3el36B3ex8F9h482wV5LDfCd6zZ7rtaDHrHTF0XYKKavpqJGiRgG2soQNHT19gMoNEqurQ2SIhBEAbH6SJGGy3LA5MgpQlGJfXuWhq6ku',	0),
(867,	0,	'config',	'config_file_max_size',	'300000',	0),
(868,	0,	'config',	'config_file_ext_allowed',	'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',	0),
(869,	0,	'config',	'config_file_mime_allowed',	'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf',	0),
(870,	0,	'config',	'config_error_display',	'1',	0),
(871,	0,	'config',	'config_error_log',	'1',	0),
(872,	0,	'config',	'config_error_filename',	'error.log',	0),
(873,	0,	'config',	'config_sms_alert',	'0',	0),
(874,	0,	'config',	'config_sms_gatename',	'testsms',	0),
(875,	0,	'config',	'config_sms_from',	'',	0),
(876,	0,	'config',	'config_sms_to',	'',	0),
(877,	0,	'config',	'config_sms_copy',	'',	0),
(878,	0,	'config',	'config_sms_message',	'',	0),
(879,	0,	'config',	'config_sms_gate_username',	'',	0),
(880,	0,	'config',	'config_sms_gate_password',	'',	0),
(881,	0,	'config',	'config_meta_title',	'TheOval',	0),
(882,	0,	'config',	'config_meta_description',	'TheOval',	0),
(665,	0,	'neat_countdown',	'neat_countdown_show_timezone_warning',	'1',	0),
(885,	0,	'config',	'config_owner',	'Ігорь Коваль',	0),
(884,	0,	'config',	'config_name',	'TheOval',	0),
(803,	0,	'config',	'config_voucher_min',	'1',	0),
(804,	0,	'config',	'config_voucher_max',	'1000',	0),
(805,	0,	'config',	'config_tax',	'1',	0),
(806,	0,	'config',	'config_tax_default',	'shipping',	0),
(807,	0,	'config',	'config_tax_customer',	'shipping',	0),
(808,	0,	'config',	'config_customer_online',	'0',	0),
(809,	0,	'config',	'config_customer_activity',	'0',	0),
(810,	0,	'config',	'config_customer_search',	'0',	0),
(811,	0,	'config',	'config_customer_group_id',	'1',	0),
(812,	0,	'config',	'config_customer_group_display',	'[\"1\"]',	1),
(813,	0,	'config',	'config_customer_price',	'0',	0),
(814,	0,	'config',	'config_login_attempts',	'5',	0),
(815,	0,	'config',	'config_account_id',	'3',	0),
(816,	0,	'config',	'config_invoice_prefix',	'INV-2013-00',	0),
(817,	0,	'config',	'config_cart_weight',	'1',	0),
(818,	0,	'config',	'config_checkout_guest',	'1',	0),
(819,	0,	'config',	'config_checkout_id',	'5',	0),
(820,	0,	'config',	'config_order_status_id',	'1',	0),
(821,	0,	'config',	'config_processing_status',	'[\"2\",\"3\",\"1\",\"12\",\"5\"]',	1),
(822,	0,	'config',	'config_complete_status',	'[\"3\",\"5\"]',	1),
(823,	0,	'config',	'config_fraud_status_id',	'2',	0),
(824,	0,	'config',	'config_api_id',	'1',	0),
(825,	0,	'config',	'config_stock_display',	'0',	0),
(826,	0,	'config',	'config_stock_warning',	'0',	0),
(827,	0,	'config',	'config_stock_checkout',	'0',	0),
(828,	0,	'config',	'config_affiliate_approval',	'0',	0),
(829,	0,	'config',	'config_affiliate_auto',	'0',	0),
(830,	0,	'config',	'config_affiliate_commission',	'5',	0),
(831,	0,	'config',	'config_affiliate_id',	'4',	0),
(832,	0,	'config',	'config_return_id',	'0',	0),
(833,	0,	'config',	'config_return_status_id',	'2',	0),
(834,	0,	'config',	'config_captcha',	'',	0),
(835,	0,	'config',	'config_captcha_page',	'[\"review\",\"return\",\"contact\"]',	1),
(836,	0,	'config',	'config_logo',	'catalog/logo.png',	0),
(837,	0,	'config',	'config_icon',	'catalog/cart.png',	0),
(838,	0,	'config',	'config_ftp_hostname',	'oval.loc',	0),
(839,	0,	'config',	'config_ftp_port',	'21',	0),
(840,	0,	'config',	'config_ftp_username',	'',	0),
(841,	0,	'config',	'config_ftp_password',	'',	0),
(842,	0,	'config',	'config_ftp_root',	'',	0),
(843,	0,	'config',	'config_ftp_status',	'0',	0),
(844,	0,	'config',	'config_mail_protocol',	'mail',	0),
(845,	0,	'config',	'config_mail_parameter',	'',	0),
(846,	0,	'config',	'config_mail_smtp_hostname',	'',	0),
(847,	0,	'config',	'config_mail_smtp_username',	'',	0),
(848,	0,	'config',	'config_mail_smtp_password',	'',	0),
(849,	0,	'config',	'config_mail_smtp_port',	'25',	0),
(850,	0,	'config',	'config_mail_smtp_timeout',	'5',	0),
(851,	0,	'config',	'config_mail_alert',	'[\"account\",\"order\",\"review\"]',	1),
(852,	0,	'config',	'config_alert_email',	'',	0),
(853,	0,	'config',	'config_maintenance',	'0',	0),
(854,	0,	'config',	'config_seo_url',	'1',	0),
(855,	0,	'config',	'config_seo_url_type',	'seo_pro',	0),
(856,	0,	'config',	'config_seo_url_include_path',	'1',	0),
(857,	0,	'config',	'config_seo_url_postfix',	'',	0),
(858,	0,	'config',	'config_seo_pro_utm',	'block\r\nfrommarket\r\ngclid\r\nkeyword\r\nlist_type\r\nopenstat\r\nopenstat_service\r\nopenstat_campaign\r\nopenstat_ad\r\nopenstat_source\r\nposition\r\nsource\r\ntracking\r\ntype\r\nyclid\r\nymclid\r\nuri\r\nurltype\r\nutm_source\r\nutm_medium\r\nutm_campaign\r\nutm_term\r\nutm_content',	0),
(859,	0,	'config',	'config_robots',	'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',	0),
(96,	0,	'free_checkout',	'free_checkout_status',	'1',	0),
(97,	0,	'free_checkout',	'free_checkout_order_status_id',	'1',	0),
(99,	0,	'sub_total',	'sub_total_sort_order',	'1',	0),
(100,	0,	'sub_total',	'sub_total_status',	'1',	0),
(863,	0,	'config',	'config_secure',	'0',	0),
(102,	0,	'total',	'total_sort_order',	'9',	0),
(103,	0,	'total',	'total_status',	'1',	0),
(883,	0,	'config',	'config_meta_keyword',	'TheOval',	0),
(105,	0,	'free_checkout',	'free_checkout_sort_order',	'1',	0),
(106,	0,	'cod',	'cod_sort_order',	'5',	0),
(107,	0,	'cod',	'cod_total',	'0.01',	0),
(108,	0,	'cod',	'cod_order_status_id',	'1',	0),
(109,	0,	'cod',	'cod_geo_zone_id',	'0',	0),
(110,	0,	'cod',	'cod_status',	'1',	0),
(862,	0,	'config',	'config_editor_default',	'0',	0),
(113,	0,	'coupon',	'coupon_sort_order',	'4',	0),
(114,	0,	'coupon',	'coupon_status',	'1',	0),
(115,	0,	'flat',	'flat_sort_order',	'1',	0),
(116,	0,	'flat',	'flat_status',	'1',	0),
(117,	0,	'flat',	'flat_geo_zone_id',	'0',	0),
(118,	0,	'flat',	'flat_tax_class_id',	'9',	0),
(119,	0,	'flat',	'flat_cost',	'5.00',	0),
(861,	0,	'config',	'config_mail_regexp',	'/^[^@]+@.*.[a-z]{2,15}$/i',	0),
(122,	0,	'reward',	'reward_sort_order',	'2',	0),
(123,	0,	'reward',	'reward_status',	'1',	0),
(205,	0,	'category',	'category_status',	'1',	0),
(126,	0,	'affiliate',	'affiliate_status',	'1',	0),
(435,	0,	'theme_default',	'theme_default_image_location_width',	'268',	0),
(436,	0,	'theme_default',	'theme_default_image_location_height',	'50',	0),
(434,	0,	'theme_default',	'theme_default_image_cart_height',	'144',	0),
(433,	0,	'theme_default',	'theme_default_image_cart_width',	'96',	0),
(432,	0,	'theme_default',	'theme_default_image_wishlist_height',	'47',	0),
(431,	0,	'theme_default',	'theme_default_image_wishlist_width',	'47',	0),
(430,	0,	'theme_default',	'theme_default_image_compare_height',	'90',	0),
(429,	0,	'theme_default',	'theme_default_image_compare_width',	'90',	0),
(428,	0,	'theme_default',	'theme_default_image_related_height',	'360',	0),
(427,	0,	'theme_default',	'theme_default_image_related_width',	'240',	0),
(426,	0,	'theme_default',	'theme_default_image_additional_height',	'360',	0),
(425,	0,	'theme_default',	'theme_default_image_additional_width',	'240',	0),
(424,	0,	'theme_default',	'theme_default_image_product_height',	'360',	0),
(423,	0,	'theme_default',	'theme_default_image_product_width',	'240',	0),
(422,	0,	'theme_default',	'theme_default_image_popup_height',	'1400',	0),
(421,	0,	'theme_default',	'theme_default_image_popup_width',	'933',	0),
(420,	0,	'theme_default',	'theme_default_image_thumb_height',	'360',	0),
(419,	0,	'theme_default',	'theme_default_image_thumb_width',	'240',	0),
(418,	0,	'theme_default',	'theme_default_image_category_height',	'70',	0),
(151,	0,	'dashboard_activity',	'dashboard_activity_status',	'1',	0),
(152,	0,	'dashboard_activity',	'dashboard_activity_sort_order',	'7',	0),
(153,	0,	'dashboard_sale',	'dashboard_sale_status',	'1',	0),
(154,	0,	'dashboard_sale',	'dashboard_sale_width',	'3',	0),
(155,	0,	'dashboard_chart',	'dashboard_chart_status',	'1',	0),
(156,	0,	'dashboard_chart',	'dashboard_chart_width',	'6',	0),
(157,	0,	'dashboard_customer',	'dashboard_customer_status',	'1',	0),
(158,	0,	'dashboard_customer',	'dashboard_customer_width',	'3',	0),
(159,	0,	'dashboard_map',	'dashboard_map_status',	'1',	0),
(160,	0,	'dashboard_map',	'dashboard_map_width',	'6',	0),
(161,	0,	'dashboard_online',	'dashboard_online_status',	'1',	0),
(162,	0,	'dashboard_online',	'dashboard_online_width',	'3',	0),
(163,	0,	'dashboard_order',	'dashboard_order_sort_order',	'1',	0),
(164,	0,	'dashboard_order',	'dashboard_order_status',	'1',	0),
(165,	0,	'dashboard_order',	'dashboard_order_width',	'3',	0),
(166,	0,	'dashboard_sale',	'dashboard_sale_sort_order',	'2',	0),
(167,	0,	'dashboard_customer',	'dashboard_customer_sort_order',	'3',	0),
(168,	0,	'dashboard_online',	'dashboard_online_sort_order',	'4',	0),
(169,	0,	'dashboard_map',	'dashboard_map_sort_order',	'5',	0),
(170,	0,	'dashboard_chart',	'dashboard_chart_sort_order',	'6',	0),
(171,	0,	'dashboard_recent',	'dashboard_recent_status',	'1',	0),
(172,	0,	'dashboard_recent',	'dashboard_recent_sort_order',	'8',	0),
(173,	0,	'dashboard_activity',	'dashboard_activity_width',	'4',	0),
(174,	0,	'dashboard_recent',	'dashboard_recent_width',	'8',	0),
(860,	0,	'config',	'config_compression',	'0',	0),
(417,	0,	'theme_default',	'theme_default_image_category_width',	'70',	0),
(416,	0,	'theme_default',	'theme_default_product_description_length',	'100',	0),
(415,	0,	'theme_default',	'theme_default_product_limit',	'4',	0),
(414,	0,	'theme_default',	'theme_default_status',	'1',	0),
(413,	0,	'theme_default',	'theme_default_directory',	'theoval',	0),
(278,	0,	'information',	'information_status',	'1',	0),
(279,	0,	'account',	'account_status',	'1',	0),
(802,	0,	'config',	'config_review_guest',	'0',	0),
(801,	0,	'config',	'config_review_status',	'1',	0),
(800,	0,	'config',	'config_product_mpn_hide',	'0',	0),
(799,	0,	'config',	'config_product_isbn_hide',	'0',	0),
(798,	0,	'config',	'config_product_jan_hide',	'0',	0),
(797,	0,	'config',	'config_product_ean_hide',	'0',	0),
(796,	0,	'config',	'config_product_upc_hide',	'0',	0),
(795,	0,	'config',	'config_limit_admin',	'20',	0),
(794,	0,	'config',	'config_product_count',	'0',	0),
(793,	0,	'config',	'config_ds_save',	'0',	0),
(792,	0,	'config',	'config_weight_class_id',	'1',	0),
(791,	0,	'config',	'config_length_class_id',	'1',	0),
(790,	0,	'config',	'config_currency_auto',	'1',	0),
(789,	0,	'config',	'config_currency',	'UAH',	0),
(788,	0,	'config',	'config_admin_language',	'ru-ru',	0),
(787,	0,	'config',	'config_language',	'ua-uk',	0),
(786,	0,	'config',	'config_zone_id',	'3490',	0),
(785,	0,	'config',	'config_country_id',	'220',	0),
(784,	0,	'config',	'config_image',	'',	0),
(783,	0,	'config',	'config_fax',	'',	0),
(782,	0,	'config',	'config_telephone',	'123456789',	0),
(781,	0,	'config',	'config_email',	'Lavrinyuk.serik@gmail.com',	0),
(779,	0,	'config',	'config_layout_id',	'4',	0),
(780,	0,	'config',	'config_geocode',	'54.718681,20.499113',	0),
(445,	0,	'filterpro',	'filterpro_status',	'1',	0),
(446,	0,	'filterpro',	'filterpro_setting',	'{\"price_slider\":\"1\",\"display_manufacturer\":\"checkbox\",\"display_categories\":\"checkbox\",\"display_tags\":\"checkbox\",\"display_option_11\":\"checkbox\",\"display_attribute_13\":\"checkbox\",\"attr_delimeter\":\":\",\"tax\":\"0\",\"option_mode\":\"and\",\"attribute_mode\":\"and\",\"attribute_value_mode\":\"and\",\"attr_group\":\"0\",\"filterpro_container\":\".product-{view}\",\"filterpro_afterload\":\"\"}',	1),
(778,	0,	'config',	'config_theme',	'theme_default',	0),
(666,	0,	'neat_countdown',	'neat_countdown_notification_request',	'',	0),
(777,	0,	'config',	'config_langdata',	'{\"1\":{\"meta_title\":\"TheOval\",\"meta_description\":\"TheOval\",\"meta_keyword\":\"TheOval\",\"name\":\"TheOval\",\"owner\":\"\\u0418\\u0433\\u043e\\u0440\\u044c \\u041a\\u043e\\u0432\\u0430\\u043b\\u044c\",\"address\":\"\\u0410\\u0434\\u0440\\u0435\\u0441\",\"open\":\"\\u0441 10\\u0447 \\u0434\\u043e 18\\u0447\\r\\n\\u043e\\u0431\\u0435\\u0434 \\u0441 14\\u0447 \\u0434\\u043e 15\\u0447\\r\\n\\u0432\\u043e\\u0441\\u043a\\u0440\\u0435\\u0441\\u0435\\u043d\\u044c\\u0435 - \\u0432\\u044b\\u0445\\u043e\\u0434\\u043d\\u043e\\u0439\",\"comment\":\"\"},\"3\":{\"meta_title\":\"TheOval\",\"meta_description\":\"TheOval\",\"meta_keyword\":\"TheOval\",\"name\":\"TheOval\",\"owner\":\"\\u0406\\u0433\\u043e\\u0440\\u044c \\u041a\\u043e\\u0432\\u0430\\u043b\\u044c\",\"address\":\"\\u0410\\u0434\\u0440\\u0435\\u0441\\u0441\\u0430\",\"open\":\"\\u0437 10\\u0433 \\u0434\\u043e 18\\u0433\\r\\n\\u043e\\u0431\\u0456\\u0434 \\u0437 14\\u0433 \\u0434\\u043e 15\\u0433\\r\\n\\u043d\\u0435\\u0434\\u0456\\u043b\\u044f - \\u0432\\u0438\\u0445\\u0456\\u0434\\u043d\\u0438\\u0439\",\"comment\":\"\"}}',	1),
(886,	0,	'config',	'config_address',	'',	0);
ALTER TABLE `oc_setting` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_stock_status`;

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_stock_status` DISABLE KEYS;

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7,	1,	'В наличии'),
(8,	1,	'Предзаказ'),
(5,	1,	'Нет в наличии'),
(6,	1,	'Ожидание 2-3 дня'),
(8,	3,	'Предзаказ'),
(7,	3,	'В наличии'),
(5,	3,	'Нет в наличии'),
(6,	3,	'Ожидание 2-3 дня');
ALTER TABLE `oc_stock_status` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_store`;

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_store` DISABLE KEYS;

ALTER TABLE `oc_store` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_class`;

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_tax_class` DISABLE KEYS;

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9,	'Налоги',	'Облагаемые налогом',	'2009-01-06 23:21:53',	'2011-03-09 21:17:10'),
(10,	'Цифровые товары',	'Цифровые',	'2011-09-21 22:19:39',	'2011-09-22 10:27:36');
ALTER TABLE `oc_tax_class` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_rate`;

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_tax_rate` DISABLE KEYS;

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86,	3,	'НДС (20%)',	20.0000,	'P',	'2011-03-09 21:17:10',	'2011-09-22 22:24:29'),
(87,	3,	'Экологический налог (-2.00)',	2.0000,	'F',	'2011-09-21 21:49:23',	'2011-09-23 00:40:19');
ALTER TABLE `oc_tax_rate` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_tax_rate_to_customer_group` DISABLE KEYS;

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86,	1),
(87,	1);
ALTER TABLE `oc_tax_rate_to_customer_group` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_tax_rule`;

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_tax_rule` DISABLE KEYS;

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121,	10,	86,	'payment',	1),
(120,	10,	87,	'store',	0),
(128,	9,	86,	'shipping',	1),
(127,	9,	87,	'shipping',	2);
ALTER TABLE `oc_tax_rule` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_theme`;

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_theme` DISABLE KEYS;

ALTER TABLE `oc_theme` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_translation`;

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_translation` DISABLE KEYS;

ALTER TABLE `oc_translation` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_upload`;

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_upload` DISABLE KEYS;

ALTER TABLE `oc_upload` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_url_alias`;

CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=907 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_url_alias` DISABLE KEYS;

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(601,	'account/voucher',	'vouchers'),
(602,	'account/wishlist',	'wishlist'),
(603,	'account/account',	'my-account'),
(604,	'checkout/cart',	'cart'),
(605,	'checkout/checkout',	'checkout'),
(606,	'account/login',	'login'),
(607,	'account/logout',	'logout'),
(608,	'account/order',	'order-history'),
(609,	'account/newsletter',	'newsletter'),
(610,	'product/special',	'specials'),
(611,	'affiliate/account',	'affiliates'),
(612,	'checkout/voucher',	'gift-vouchers'),
(613,	'product/manufacturer',	'brands'),
(614,	'information/contact',	'contact-us'),
(615,	'account/return/insert',	'request-return'),
(616,	'information/sitemap',	'sitemap'),
(617,	'account/forgotten',	'forgot-password'),
(618,	'account/download',	'downloads'),
(619,	'account/return',	'returns'),
(620,	'account/transaction',	'transactions'),
(621,	'account/register',	'create-account'),
(622,	'product/compare',	'compare-products'),
(623,	'product/search',	'search'),
(624,	'account/edit',	'edit-account'),
(625,	'account/password',	'change-password'),
(626,	'account/address',	'address-book'),
(627,	'account/reward',	'reward-points'),
(628,	'affiliate/edit',	'edit-affiliate-account'),
(629,	'affiliate/password',	'change-affiliate-password'),
(630,	'affiliate/payment',	'affiliate-payment-options'),
(631,	'affiliate/tracking',	'affiliate-tracking-code'),
(632,	'affiliate/transaction',	'affiliate-transactions'),
(633,	'affiliate/logout',	'affiliate-logout'),
(634,	'affiliate/forgotten',	'affiliate-forgot-password'),
(635,	'affiliate/register',	'create-affiliate-account'),
(636,	'affiliate/login',	'affiliate-login'),
(637,	'account/return/add',	'add-return'),
(638,	'common/home',	''),
(881,	'product_id=48',	'ipod-classic'),
(906,	'category_id=20',	'desktops'),
(834,	'category_id=26',	'pc'),
(835,	'category_id=27',	'mac'),
(730,	'manufacturer_id=8',	'apple'),
(895,	'information_id=4',	'about_us'),
(891,	'product_id=42',	'test'),
(900,	'category_id=34',	'mp3-players'),
(781,	'category_id=36',	'test2'),
(898,	'category_id=18',	'laptop-notebook'),
(775,	'category_id=46',	'macs'),
(776,	'category_id=45',	'windows'),
(899,	'category_id=25',	'component'),
(778,	'category_id=29',	'mouse'),
(779,	'category_id=28',	'monitor'),
(780,	'category_id=35',	'test1'),
(782,	'category_id=30',	'printer'),
(783,	'category_id=31',	'scanner'),
(784,	'category_id=32',	'web-camera'),
(790,	'category_id=43',	'test11'),
(791,	'category_id=44',	'test12'),
(792,	'category_id=47',	'test15'),
(793,	'category_id=48',	'test16'),
(794,	'category_id=49',	'test17'),
(795,	'category_id=50',	'test18'),
(796,	'category_id=51',	'test19'),
(797,	'category_id=52',	'test20'),
(798,	'category_id=58',	'test25'),
(799,	'category_id=53',	'test21'),
(800,	'category_id=54',	'test22'),
(801,	'category_id=55',	'test23'),
(802,	'category_id=56',	'test24'),
(803,	'category_id=38',	'test4'),
(804,	'category_id=37',	'test5'),
(805,	'category_id=39',	'test6'),
(806,	'category_id=40',	'test7'),
(807,	'category_id=41',	'test8'),
(808,	'category_id=42',	'test9'),
(874,	'product_id=30',	'canon-eos-5d'),
(889,	'product_id=47',	'hp-lp3065'),
(876,	'product_id=28',	'htc-touch-hd'),
(864,	'product_id=43',	'macbook'),
(813,	'product_id=44',	'macbook-air'),
(883,	'product_id=45',	'macbook-pro'),
(816,	'product_id=31',	'nikon-d300'),
(817,	'product_id=29',	'palm-treo-pro'),
(818,	'product_id=35',	'product-8'),
(819,	'product_id=49',	'samsung-galaxy-tab-10-1'),
(820,	'product_id=33',	'samsung-syncmaster-941bw'),
(892,	'product_id=46',	'sony-vaio'),
(879,	'product_id=41',	'imac'),
(880,	'product_id=40',	'iphone'),
(884,	'product_id=36',	'ipod-nano'),
(826,	'product_id=34',	'ipod-shuffle'),
(885,	'product_id=32',	'ipod-touch'),
(828,	'manufacturer_id=9',	'canon'),
(829,	'manufacturer_id=5',	'htc'),
(830,	'manufacturer_id=7',	'hewlett-packard'),
(831,	'manufacturer_id=6',	'palm'),
(832,	'manufacturer_id=10',	'sony'),
(896,	'information_id=6',	'delivery'),
(893,	'information_id=3',	'privacy'),
(894,	'information_id=5',	'terms');
ALTER TABLE `oc_url_alias` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_user`;

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_user` DISABLE KEYS;

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1,	1,	'admin',	'4b3a8168967842df1022b30ae00fd751e4ad4d80',	'fw7MX15RL',	'John',	'Doe',	'Lavrinyuk.serik@gmail.com',	'',	'',	'::1',	1,	'2019-06-13 22:11:16');
ALTER TABLE `oc_user` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_user_group`;

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_user_group` DISABLE KEYS;

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1,	'Administrator',	'{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/feed\\/unisender\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_payeer\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/ocstore_yk\",\"extension\\/payment\\/ocstore_yk_company_AB\",\"extension\\/payment\\/ocstore_yk_company_AC\",\"extension\\/payment\\/ocstore_yk_company_EP\",\"extension\\/payment\\/ocstore_yk_company_GP\",\"extension\\/payment\\/ocstore_yk_company_MA\",\"extension\\/payment\\/ocstore_yk_company_MC\",\"extension\\/payment\\/ocstore_yk_company_MP\",\"extension\\/payment\\/ocstore_yk_company_PB\",\"extension\\/payment\\/ocstore_yk_company_PC\",\"extension\\/payment\\/ocstore_yk_company_QW\",\"extension\\/payment\\/ocstore_yk_company_SB\",\"extension\\/payment\\/ocstore_yk_company_WM\",\"extension\\/payment\\/ocstore_yk_physical_AC\",\"extension\\/payment\\/ocstore_yk_physical_PC\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/qiwi_rest\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/sberbank_transfer\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/shoputils_w1\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/by_total\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/track_no\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"octeam\\/toolset\",\"octeam_tools\\/cache\",\"octeam_tools\\/seo_manager\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/category\",\"extension\\/module\\/information\",\"extension\\/module\\/account\",\"extension\\/module\\/filterpro\",\"extension\\/module\\/neat_countdown\",\"extension\\/module\\/carousel\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/feed\\/unisender\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_payeer\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/ocstore_yk\",\"extension\\/payment\\/ocstore_yk_company_AB\",\"extension\\/payment\\/ocstore_yk_company_AC\",\"extension\\/payment\\/ocstore_yk_company_EP\",\"extension\\/payment\\/ocstore_yk_company_GP\",\"extension\\/payment\\/ocstore_yk_company_MA\",\"extension\\/payment\\/ocstore_yk_company_MC\",\"extension\\/payment\\/ocstore_yk_company_MP\",\"extension\\/payment\\/ocstore_yk_company_PB\",\"extension\\/payment\\/ocstore_yk_company_PC\",\"extension\\/payment\\/ocstore_yk_company_QW\",\"extension\\/payment\\/ocstore_yk_company_SB\",\"extension\\/payment\\/ocstore_yk_company_WM\",\"extension\\/payment\\/ocstore_yk_physical_AC\",\"extension\\/payment\\/ocstore_yk_physical_PC\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/qiwi_rest\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/sberbank_transfer\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/shoputils_w1\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/by_total\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/track_no\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"octeam\\/toolset\",\"octeam_tools\\/cache\",\"octeam_tools\\/seo_manager\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/category\",\"extension\\/module\\/information\",\"extension\\/module\\/account\",\"extension\\/module\\/filterpro\",\"extension\\/module\\/neat_countdown\",\"extension\\/module\\/carousel\"],\"hiden\":[\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_yk_company_AB\",\"extension\\/payment\\/ocstore_yk_company_AC\",\"extension\\/payment\\/ocstore_yk_company_EP\",\"extension\\/payment\\/ocstore_yk_company_GP\",\"extension\\/payment\\/ocstore_yk_company_MA\",\"extension\\/payment\\/ocstore_yk_company_MC\",\"extension\\/payment\\/ocstore_yk_company_MP\",\"extension\\/payment\\/ocstore_yk_company_PB\",\"extension\\/payment\\/ocstore_yk_company_PC\",\"extension\\/payment\\/ocstore_yk_company_QW\",\"extension\\/payment\\/ocstore_yk_company_SB\",\"extension\\/payment\\/ocstore_yk_company_WM\",\"extension\\/payment\\/ocstore_yk_physical_AC\",\"extension\\/payment\\/ocstore_yk_physical_PC\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\"]}'),
(10,	'Demonstration',	'');
ALTER TABLE `oc_user_group` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher`;

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_voucher` DISABLE KEYS;

ALTER TABLE `oc_voucher` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher_history`;

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_voucher_history` DISABLE KEYS;

ALTER TABLE `oc_voucher_history` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher_theme`;

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_voucher_theme` DISABLE KEYS;

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8,	'catalog/demo/canon_eos_5d_2.jpg'),
(7,	'catalog/demo/gift-voucher-birthday.jpg'),
(6,	'catalog/demo/apple_logo.jpg');
ALTER TABLE `oc_voucher_theme` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_voucher_theme_description`;

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `oc_voucher_theme_description` DISABLE KEYS;

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6,	1,	'Рождество'),
(7,	1,	'День рождения'),
(8,	1,	'Основной'),
(7,	3,	'День рождения'),
(6,	3,	'Рождество'),
(8,	3,	'Основной');
ALTER TABLE `oc_voucher_theme_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_weight_class`;

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_weight_class` DISABLE KEYS;

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1,	1.00),
(2,	1000.00),
(5,	2.20),
(6,	35.27);
ALTER TABLE `oc_weight_class` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_weight_class_description`;

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_weight_class_description` DISABLE KEYS;

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1,	1,	'Килограммы',	'кг'),
(2,	1,	'Граммы',	'г'),
(1,	3,	'Килограммы',	'кг'),
(2,	3,	'Граммы',	'г');
ALTER TABLE `oc_weight_class_description` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_zone`;

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4236 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_zone` DISABLE KEYS;

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1,	1,	'Бадахшан',	'BDS',	1),
(2,	1,	'Бадгис',	'BDG',	1),
(3,	1,	'Баглан',	'BGL',	1),
(4,	1,	'Балх',	'BAL',	1),
(5,	1,	'Бамиан',	'BAM',	1),
(6,	1,	'Фарах',	'FRA',	1),
(7,	1,	'Фарьяб',	'FYB',	1),
(8,	1,	'Газни',	'GHA',	1),
(9,	1,	'Гор',	'GHO',	1),
(10,	1,	'Гильменд',	'HEL',	1),
(11,	1,	'Герат',	'HER',	1),
(12,	1,	'Джаузджан',	'JOW',	1),
(13,	1,	'Кабул',	'KAB',	1),
(14,	1,	'Кандагар',	'KAN',	1),
(15,	1,	'Каписа',	'KAP',	1),
(16,	1,	'Хост',	'KHO',	1),
(17,	1,	'Кунар',	'KNR',	1),
(18,	1,	'Кундуз',	'KDZ',	1),
(19,	1,	'Лагман',	'LAG',	1),
(20,	1,	'Логар',	'LOW',	1),
(21,	1,	'Нангархар',	'NAN',	1),
(22,	1,	'Нимроз',	'NIM',	1),
(23,	1,	'Нуристан',	'NUR',	1),
(24,	1,	'Урузган',	'ORU',	1),
(25,	1,	'Пактия',	'PIA',	1),
(26,	1,	'Пактика',	'PKA',	1),
(27,	1,	'Парван',	'PAR',	1),
(28,	1,	'Саманган',	'SAM',	1),
(29,	1,	'Сари-Пуль',	'SAR',	1),
(30,	1,	'Тахар',	'TAK',	1),
(31,	1,	'Вардак',	'WAR',	1),
(32,	1,	'Забуль',	'ZAB',	1),
(33,	2,	'Берат',	'BR',	1),
(34,	2,	'Булькиза',	'BU',	1),
(35,	2,	'Дельвина',	'DL',	1),
(36,	2,	'Девол',	'DV',	1),
(37,	2,	'Дибра',	'DI',	1),
(38,	2,	'Дуррес',	'DR',	1),
(39,	2,	'Эльбасан',	'EL',	1),
(40,	2,	'Колёня',	'ER',	1),
(41,	2,	'Фиери',	'FR',	1),
(42,	2,	'Гирокастра',	'GJ',	1),
(43,	2,	'Грамши',	'GR',	1),
(44,	2,	'Хас',	'HA',	1),
(45,	2,	'Кавая',	'KA',	1),
(46,	2,	'Курбин',	'KB',	1),
(47,	2,	'Кучова',	'KC',	1),
(48,	2,	'Корча',	'KO',	1),
(49,	2,	'Круя',	'KR',	1),
(50,	2,	'Кукес',	'KU',	1),
(51,	2,	'Либражди',	'LB',	1),
(52,	2,	'Лежа',	'LE',	1),
(53,	2,	'Люшня',	'LU',	1),
(54,	2,	'Мальси-э-Мади',	'MM',	1),
(55,	2,	'Малакастра',	'MK',	1),
(56,	2,	'Мати',	'MT',	1),
(57,	2,	'Мирдита',	'MR',	1),
(58,	2,	'Пекини',	'PQ',	1),
(59,	2,	'Пермети',	'PR',	1),
(60,	2,	'Поградец',	'PG',	1),
(61,	2,	'Пука',	'PU',	1),
(62,	2,	'Шкодер',	'SH',	1),
(63,	2,	'Скрапари',	'SK',	1),
(64,	2,	'Саранда',	'SR',	1),
(65,	2,	'Тепелена',	'TE',	1),
(66,	2,	'Тропоя',	'TP',	1),
(67,	2,	'Тирана',	'TR',	1),
(68,	2,	'Влёра',	'VL',	1),
(69,	3,	'Адрар',	'ADR',	1),
(70,	3,	'Айн-Дефла',	'ADE',	1),
(71,	3,	'Айн-Темухент',	'ATE',	1),
(72,	3,	'Алжир',	'ALG',	1),
(73,	3,	'Аннаба',	'ANN',	1),
(74,	3,	'Батна',	'BAT',	1),
(75,	3,	'Бешар',	'BEC',	1),
(76,	3,	'Беджая',	'BEJ',	1),
(77,	3,	'Бискра',	'BIS',	1),
(78,	3,	'Блида',	'BLI',	1),
(79,	3,	'Бордж-Бу-Арреридж',	'BBA',	1),
(80,	3,	'Буйра',	'BOA',	1),
(81,	3,	'Бумердес',	'BMD',	1),
(82,	3,	'Шлеф',	'CHL',	1),
(83,	3,	'Константина',	'CON',	1),
(84,	3,	'Джельфа',	'DJE',	1),
(85,	3,	'Эль-Баяд',	'EBA',	1),
(86,	3,	'Эль-Уэд',	'EOU',	1),
(87,	3,	'Эль-Тарф',	'ETA',	1),
(88,	3,	'Гардая',	'GHA',	1),
(89,	3,	'Гуэльма',	'GUE',	1),
(90,	3,	'Иллизи',	'ILL',	1),
(91,	3,	'Джиджель',	'JIJ',	1),
(92,	3,	'Хеншела',	'KHE',	1),
(93,	3,	'Лагуат',	'LAG',	1),
(94,	3,	'Маскара',	'MUA',	1),
(95,	3,	'Медеа',	'MED',	1),
(96,	3,	'Мила',	'MIL',	1),
(97,	3,	'Мостаганем',	'MOS',	1),
(98,	3,	'Мсила',	'MSI',	1),
(99,	3,	'Наама',	'NAA',	1),
(100,	3,	'Оран',	'ORA',	1),
(101,	3,	'Уаргла',	'OUA',	1),
(102,	3,	'Ум Эль-Буахи',	'OEB',	1),
(103,	3,	'Релизан',	'REL',	1),
(104,	3,	'Саида',	'SAI',	1),
(105,	3,	'Сетиф',	'SET',	1),
(106,	3,	'Сиди-Бель-Аббес',	'SBA',	1),
(107,	3,	'Скикда',	'SKI',	1),
(108,	3,	'Сук-Ахрас',	'SAH',	1),
(109,	3,	'Таменрассет',	'TAM',	1),
(110,	3,	'Тебесса',	'TEB',	1),
(111,	3,	'Тиарет',	'TIA',	1),
(112,	3,	'Тиндуф',	'TIN',	1),
(113,	3,	'Типаза',	'TIP',	1),
(114,	3,	'Тиссемсилт',	'TIS',	1),
(115,	3,	'Тизи-Узу',	'TOU',	1),
(116,	3,	'Тлемсен',	'TLE',	1),
(117,	4,	'Восточный округ',	'E',	1),
(118,	4,	'Мануа',	'M',	1),
(119,	4,	'Остров Роз',	'R',	1),
(120,	4,	'Остров Суэйнс',	'S',	1),
(121,	4,	'Западный округ',	'W',	1),
(122,	5,	'Андорра-ла-Велья',	'ALV',	1),
(123,	5,	'Канильо',	'CAN',	1),
(124,	5,	'Энкамп',	'ENC',	1),
(125,	5,	'Эскальдес-Энгордань',	'ESE',	1),
(126,	5,	'Ла-Массана',	'LMA',	1),
(127,	5,	'Ордино',	'ORD',	1),
(128,	5,	'Сант-Жулия-де-Лория',	'SJL',	1),
(129,	6,	'Бенго',	'BGO',	1),
(130,	6,	'Бенгела',	'BGU',	1),
(131,	6,	'Бие',	'BIE',	1),
(132,	6,	'Кабинда',	'CAB',	1),
(133,	6,	'Квандо-Кубанго',	'CCU',	1),
(134,	6,	'Северная Кванза',	'CNO',	1),
(135,	6,	'Южная Кванза',	'CUS',	1),
(136,	6,	'Кунене',	'CNN',	1),
(137,	6,	'Уамбо',	'HUA',	1),
(138,	6,	'Уила',	'HUI',	1),
(139,	6,	'Луанда',	'LUA',	1),
(140,	6,	'Северная Лунда',	'LNO',	1),
(141,	6,	'Южная Лунда',	'LSU',	1),
(142,	6,	'Маланже',	'MAL',	1),
(143,	6,	'Мошико',	'MOX',	1),
(144,	6,	'Намибе',	'NAM',	1),
(145,	6,	'Уиже',	'UIG',	1),
(146,	6,	'Заире',	'ZAI',	1),
(147,	9,	'Сент-Джордж',	'ASG',	1),
(148,	9,	'Сент-Джон',	'ASJ',	1),
(149,	9,	'Сент-Мери',	'ASM',	1),
(150,	9,	'Сент-Пол',	'ASL',	1),
(151,	9,	'Сент-Петер',	'ASR',	1),
(152,	9,	'Сент-Филип',	'ASH',	1),
(153,	9,	'Барбуда',	'BAR',	1),
(154,	9,	'Редонда',	'RED',	1),
(155,	10,	'Антарктида и острова Южной Атлантики',	'AN',	1),
(156,	10,	'Буэнос-Айрес',	'BA',	1),
(157,	10,	'Катамарка',	'CA',	1),
(158,	10,	'Чако',	'CH',	1),
(159,	10,	'Чубут',	'CU',	1),
(160,	10,	'Кордова',	'CO',	1),
(161,	10,	'Корриентес',	'CR',	1),
(162,	10,	'Федеральный округ',	'DF',	1),
(163,	10,	'Энтре-Риос',	'ER',	1),
(164,	10,	'Формоса',	'FO',	1),
(165,	10,	'Жужуй',	'JU',	1),
(166,	10,	'Ла-Пампа',	'LP',	1),
(167,	10,	'Ла-Риоха',	'LR',	1),
(168,	10,	'Мендоса',	'ME',	1),
(169,	10,	'Мисьонес',	'MI',	1),
(170,	10,	'Неукен',	'NE',	1),
(171,	10,	'Рио-Негро',	'RN',	1),
(172,	10,	'Сальта',	'SA',	1),
(173,	10,	'Сан-Хуан',	'SJ',	1),
(174,	10,	'Сан-Луис',	'SL',	1),
(175,	10,	'Санта-Крус',	'SC',	1),
(176,	10,	'Санта-Фе',	'SF',	1),
(177,	10,	'Сантьяго-дель-Эстеро',	'SD',	1),
(178,	10,	'Тьерра-дель-Фуэго',	'TF',	1),
(179,	10,	'Тукуман',	'TU',	1),
(180,	11,	'Арагацотн',	'AGT',	1),
(181,	11,	'Арарат',	'ARR',	1),
(182,	11,	'Армавир',	'ARM',	1),
(183,	11,	'Гегаркуник',	'GEG',	1),
(184,	11,	'Котайк',	'KOT',	1),
(185,	11,	'Лори',	'LOR',	1),
(186,	11,	'Ширак',	'SHI',	1),
(187,	11,	'Сюник',	'SYU',	1),
(188,	11,	'Тавуш',	'TAV',	1),
(189,	11,	'Вайоц Дзор',	'VAY',	1),
(190,	11,	'Ереван',	'YER',	1),
(191,	13,	'Австралийская столичная территория',	'ACT',	1),
(192,	13,	'Новый Южный Уэльс',	'NSW',	1),
(193,	13,	'Северная территория',	'NT',	1),
(194,	13,	'Квинсленд',	'QLD',	1),
(195,	13,	'Южная Австралия',	'SA',	1),
(196,	13,	'Тасмания',	'TAS',	1),
(197,	13,	'Виктория',	'VIC',	1),
(198,	13,	'Западная Австралия',	'WA',	1),
(199,	14,	'Бургенланд',	'BUR',	1),
(200,	14,	'Каринтия',	'KAR',	1),
(201,	14,	'Нижняя Австрия',	'NOS',	1),
(202,	14,	'Верхняя Австрия',	'OOS',	1),
(203,	14,	'Зальцбург',	'SAL',	1),
(204,	14,	'Штирия',	'STE',	1),
(205,	14,	'Тироль',	'TIR',	1),
(206,	14,	'Форарльберг',	'VOR',	1),
(207,	14,	'Вена',	'WIE',	1),
(208,	15,	'Ali Bayramli',	'AB',	1),
(209,	15,	'Abseron',	'ABS',	1),
(210,	15,	'AgcabAdi',	'AGC',	1),
(211,	15,	'Agdam',	'AGM',	1),
(212,	15,	'Agdas',	'AGS',	1),
(213,	15,	'Agstafa',	'AGA',	1),
(214,	15,	'Agsu',	'AGU',	1),
(215,	15,	'Astara',	'AST',	1),
(216,	15,	'Baki',	'BA',	1),
(217,	15,	'BabAk',	'BAB',	1),
(218,	15,	'BalakAn',	'BAL',	1),
(219,	15,	'BArdA',	'BAR',	1),
(220,	15,	'Beylaqan',	'BEY',	1),
(221,	15,	'Bilasuvar',	'BIL',	1),
(222,	15,	'Cabrayil',	'CAB',	1),
(223,	15,	'Calilabab',	'CAL',	1),
(224,	15,	'Culfa',	'CUL',	1),
(225,	15,	'Daskasan',	'DAS',	1),
(226,	15,	'Davaci',	'DAV',	1),
(227,	15,	'Fuzuli',	'FUZ',	1),
(228,	15,	'Ganca',	'GA',	1),
(229,	15,	'Gadabay',	'GAD',	1),
(230,	15,	'Goranboy',	'GOR',	1),
(231,	15,	'Goycay',	'GOY',	1),
(232,	15,	'Haciqabul',	'HAC',	1),
(233,	15,	'Imisli',	'IMI',	1),
(234,	15,	'Ismayilli',	'ISM',	1),
(235,	15,	'Kalbacar',	'KAL',	1),
(236,	15,	'Kurdamir',	'KUR',	1),
(237,	15,	'Lankaran',	'LA',	1),
(238,	15,	'Lacin',	'LAC',	1),
(239,	15,	'Lankaran',	'LAN',	1),
(240,	15,	'Lerik',	'LER',	1),
(241,	15,	'Masalli',	'MAS',	1),
(242,	15,	'Mingacevir',	'MI',	1),
(243,	15,	'Naftalan',	'NA',	1),
(244,	15,	'Neftcala',	'NEF',	1),
(245,	15,	'Oguz',	'OGU',	1),
(246,	15,	'Ordubad',	'ORD',	1),
(247,	15,	'Qabala',	'QAB',	1),
(248,	15,	'Qax',	'QAX',	1),
(249,	15,	'Qazax',	'QAZ',	1),
(250,	15,	'Qobustan',	'QOB',	1),
(251,	15,	'Quba',	'QBA',	1),
(252,	15,	'Qubadli',	'QBI',	1),
(253,	15,	'Qusar',	'QUS',	1),
(254,	15,	'Saki',	'SA',	1),
(255,	15,	'Saatli',	'SAT',	1),
(256,	15,	'Sabirabad',	'SAB',	1),
(257,	15,	'Sadarak',	'SAD',	1),
(258,	15,	'Sahbuz',	'SAH',	1),
(259,	15,	'Saki',	'SAK',	1),
(260,	15,	'Salyan',	'SAL',	1),
(261,	15,	'Sumqayit',	'SM',	1),
(262,	15,	'Samaxi',	'SMI',	1),
(263,	15,	'Samkir',	'SKR',	1),
(264,	15,	'Samux',	'SMX',	1),
(265,	15,	'Sarur',	'SAR',	1),
(266,	15,	'Siyazan',	'SIY',	1),
(267,	15,	'Susa',	'SS',	1),
(268,	15,	'Susa',	'SUS',	1),
(269,	15,	'Tartar',	'TAR',	1),
(270,	15,	'Tovuz',	'TOV',	1),
(271,	15,	'Ucar',	'UCA',	1),
(272,	15,	'Xankandi',	'XA',	1),
(273,	15,	'Xacmaz',	'XAC',	1),
(274,	15,	'Xanlar',	'XAN',	1),
(275,	15,	'Xizi',	'XIZ',	1),
(276,	15,	'Xocali',	'XCI',	1),
(277,	15,	'Xocavand',	'XVD',	1),
(278,	15,	'Yardimli',	'YAR',	1),
(279,	15,	'Yevlax',	'YEV',	1),
(280,	15,	'Zangilan',	'ZAN',	1),
(281,	15,	'Zaqatala',	'ZAQ',	1),
(282,	15,	'Zardab',	'ZAR',	1),
(283,	15,	'Naxcivan',	'NX',	1),
(284,	16,	'Acklins',	'ACK',	1),
(285,	16,	'Berry Islands',	'BER',	1),
(286,	16,	'Bimini',	'BIM',	1),
(287,	16,	'Black Point',	'BLK',	1),
(288,	16,	'Cat Island',	'CAT',	1),
(289,	16,	'Central Abaco',	'CAB',	1),
(290,	16,	'Central Andros',	'CAN',	1),
(291,	16,	'Central Eleuthera',	'CEL',	1),
(292,	16,	'City of Freeport',	'FRE',	1),
(293,	16,	'Crooked Island',	'CRO',	1),
(294,	16,	'East Grand Bahama',	'EGB',	1),
(295,	16,	'Exuma',	'EXU',	1),
(296,	16,	'Grand Cay',	'GRD',	1),
(297,	16,	'Harbour Island',	'HAR',	1),
(298,	16,	'Hope Town',	'HOP',	1),
(299,	16,	'Inagua',	'INA',	1),
(300,	16,	'Long Island',	'LNG',	1),
(301,	16,	'Mangrove Cay',	'MAN',	1),
(302,	16,	'Mayaguana',	'MAY',	1),
(303,	16,	'Moore\'s Island',	'MOO',	1),
(304,	16,	'North Abaco',	'NAB',	1),
(305,	16,	'North Andros',	'NAN',	1),
(306,	16,	'North Eleuthera',	'NEL',	1),
(307,	16,	'Ragged Island',	'RAG',	1),
(308,	16,	'Rum Cay',	'RUM',	1),
(309,	16,	'San Salvador',	'SAL',	1),
(310,	16,	'South Abaco',	'SAB',	1),
(311,	16,	'South Andros',	'SAN',	1),
(312,	16,	'South Eleuthera',	'SEL',	1),
(313,	16,	'Spanish Wells',	'SWE',	1),
(314,	16,	'West Grand Bahama',	'WGB',	1),
(315,	17,	'Capital',	'CAP',	1),
(316,	17,	'Central',	'CEN',	1),
(317,	17,	'Muharraq',	'MUH',	1),
(318,	17,	'Northern',	'NOR',	1),
(319,	17,	'Southern',	'SOU',	1),
(320,	18,	'Barisal',	'BAR',	1),
(321,	18,	'Chittagong',	'CHI',	1),
(322,	18,	'Dhaka',	'DHA',	1),
(323,	18,	'Khulna',	'KHU',	1),
(324,	18,	'Rajshahi',	'RAJ',	1),
(325,	18,	'Sylhet',	'SYL',	1),
(326,	19,	'Christ Church',	'CC',	1),
(327,	19,	'Saint Andrew',	'AND',	1),
(328,	19,	'Saint George',	'GEO',	1),
(329,	19,	'Saint James',	'JAM',	1),
(330,	19,	'Saint John',	'JOH',	1),
(331,	19,	'Saint Joseph',	'JOS',	1),
(332,	19,	'Saint Lucy',	'LUC',	1),
(333,	19,	'Saint Michael',	'MIC',	1),
(334,	19,	'Saint Peter',	'PET',	1),
(335,	19,	'Saint Philip',	'PHI',	1),
(336,	19,	'Saint Thomas',	'THO',	1),
(337,	20,	'Брест',	'BR',	1),
(338,	20,	'Гомель',	'HO',	1),
(339,	20,	'Минск',	'HM',	1),
(340,	20,	'Гродно',	'HR',	1),
(341,	20,	'Могилев',	'MA',	1),
(342,	20,	'Минская область',	'MI',	1),
(343,	20,	'Витебск',	'VI',	1),
(344,	21,	'Antwerpen',	'VAN',	1),
(345,	21,	'Brabant Wallon',	'WBR',	1),
(346,	21,	'Hainaut',	'WHT',	1),
(347,	21,	'Liege',	'WLG',	1),
(348,	21,	'Limburg',	'VLI',	1),
(349,	21,	'Luxembourg',	'WLX',	1),
(350,	21,	'Namur',	'WNA',	1),
(351,	21,	'Oost-Vlaanderen',	'VOV',	1),
(352,	21,	'Vlaams Brabant',	'VBR',	1),
(353,	21,	'West-Vlaanderen',	'VWV',	1),
(354,	22,	'Belize',	'BZ',	1),
(355,	22,	'Cayo',	'CY',	1),
(356,	22,	'Corozal',	'CR',	1),
(357,	22,	'Orange Walk',	'OW',	1),
(358,	22,	'Stann Creek',	'SC',	1),
(359,	22,	'Toledo',	'TO',	1),
(360,	23,	'Alibori',	'AL',	1),
(361,	23,	'Atakora',	'AK',	1),
(362,	23,	'Atlantique',	'AQ',	1),
(363,	23,	'Borgou',	'BO',	1),
(364,	23,	'Collines',	'CO',	1),
(365,	23,	'Donga',	'DO',	1),
(366,	23,	'Kouffo',	'KO',	1),
(367,	23,	'Littoral',	'LI',	1),
(368,	23,	'Mono',	'MO',	1),
(369,	23,	'Oueme',	'OU',	1),
(370,	23,	'Plateau',	'PL',	1),
(371,	23,	'Zou',	'ZO',	1),
(372,	24,	'Devonshire',	'DS',	1),
(373,	24,	'Hamilton City',	'HC',	1),
(374,	24,	'Hamilton',	'HA',	1),
(375,	24,	'Paget',	'PG',	1),
(376,	24,	'Pembroke',	'PB',	1),
(377,	24,	'Saint George City',	'GC',	1),
(378,	24,	'Saint George\'s',	'SG',	1),
(379,	24,	'Sandys',	'SA',	1),
(380,	24,	'Smith\'s',	'SM',	1),
(381,	24,	'Southampton',	'SH',	1),
(382,	24,	'Warwick',	'WA',	1),
(383,	25,	'Bumthang',	'BUM',	1),
(384,	25,	'Chukha',	'CHU',	1),
(385,	25,	'Dagana',	'DAG',	1),
(386,	25,	'Gasa',	'GAS',	1),
(387,	25,	'Haa',	'HAA',	1),
(388,	25,	'Lhuntse',	'LHU',	1),
(389,	25,	'Mongar',	'MON',	1),
(390,	25,	'Paro',	'PAR',	1),
(391,	25,	'Pemagatshel',	'PEM',	1),
(392,	25,	'Punakha',	'PUN',	1),
(393,	25,	'Samdrup Jongkhar',	'SJO',	1),
(394,	25,	'Samtse',	'SAT',	1),
(395,	25,	'Sarpang',	'SAR',	1),
(396,	25,	'Thimphu',	'THI',	1),
(397,	25,	'Trashigang',	'TRG',	1),
(398,	25,	'Trashiyangste',	'TRY',	1),
(399,	25,	'Trongsa',	'TRO',	1),
(400,	25,	'Tsirang',	'TSI',	1),
(401,	25,	'Wangdue Phodrang',	'WPH',	1),
(402,	25,	'Zhemgang',	'ZHE',	1),
(403,	26,	'Beni',	'BEN',	1),
(404,	26,	'Chuquisaca',	'CHU',	1),
(405,	26,	'Cochabamba',	'COC',	1),
(406,	26,	'La Paz',	'LPZ',	1),
(407,	26,	'Oruro',	'ORU',	1),
(408,	26,	'Pando',	'PAN',	1),
(409,	26,	'Potosi',	'POT',	1),
(410,	26,	'Santa Cruz',	'SCZ',	1),
(411,	26,	'Tarija',	'TAR',	1),
(412,	27,	'Brcko district',	'BRO',	1),
(413,	27,	'Unsko-Sanski Kanton',	'FUS',	1),
(414,	27,	'Posavski Kanton',	'FPO',	1),
(415,	27,	'Tuzlanski Kanton',	'FTU',	1),
(416,	27,	'Zenicko-Dobojski Kanton',	'FZE',	1),
(417,	27,	'Bosanskopodrinjski Kanton',	'FBP',	1),
(418,	27,	'Srednjebosanski Kanton',	'FSB',	1),
(419,	27,	'Hercegovacko-neretvanski Kanton',	'FHN',	1),
(420,	27,	'Zapadnohercegovacka Zupanija',	'FZH',	1),
(421,	27,	'Kanton Sarajevo',	'FSA',	1),
(422,	27,	'Zapadnobosanska',	'FZA',	1),
(423,	27,	'Banja Luka',	'SBL',	1),
(424,	27,	'Doboj',	'SDO',	1),
(425,	27,	'Bijeljina',	'SBI',	1),
(426,	27,	'Vlasenica',	'SVL',	1),
(427,	27,	'Sarajevo-Romanija or Sokolac',	'SSR',	1),
(428,	27,	'Foca',	'SFO',	1),
(429,	27,	'Trebinje',	'STR',	1),
(430,	28,	'Central',	'CE',	1),
(431,	28,	'Ghanzi',	'GH',	1),
(432,	28,	'Kgalagadi',	'KD',	1),
(433,	28,	'Kgatleng',	'KT',	1),
(434,	28,	'Kweneng',	'KW',	1),
(435,	28,	'Ngamiland',	'NG',	1),
(436,	28,	'North East',	'NE',	1),
(437,	28,	'North West',	'NW',	1),
(438,	28,	'South East',	'SE',	1),
(439,	28,	'Southern',	'SO',	1),
(440,	30,	'Acre',	'AC',	1),
(441,	30,	'Alagoas',	'AL',	1),
(442,	30,	'Amapa',	'AP',	1),
(443,	30,	'Amazonas',	'AM',	1),
(444,	30,	'Bahia',	'BA',	1),
(445,	30,	'Ceara',	'CE',	1),
(446,	30,	'Distrito Federal',	'DF',	1),
(447,	30,	'Espirito Santo',	'ES',	1),
(448,	30,	'Goias',	'GO',	1),
(449,	30,	'Maranhao',	'MA',	1),
(450,	30,	'Mato Grosso',	'MT',	1),
(451,	30,	'Mato Grosso do Sul',	'MS',	1),
(452,	30,	'Minas Gerais',	'MG',	1),
(453,	30,	'Para',	'PA',	1),
(454,	30,	'Paraiba',	'PB',	1),
(455,	30,	'Parana',	'PR',	1),
(456,	30,	'Pernambuco',	'PE',	1),
(457,	30,	'Piaui',	'PI',	1),
(458,	30,	'Rio de Janeiro',	'RJ',	1),
(459,	30,	'Rio Grande do Norte',	'RN',	1),
(460,	30,	'Rio Grande do Sul',	'RS',	1),
(461,	30,	'Rondonia',	'RO',	1),
(462,	30,	'Roraima',	'RR',	1),
(463,	30,	'Santa Catarina',	'SC',	1),
(464,	30,	'Sao Paulo',	'SP',	1),
(465,	30,	'Sergipe',	'SE',	1),
(466,	30,	'Tocantins',	'TO',	1),
(467,	31,	'Peros Banhos',	'PB',	1),
(468,	31,	'Salomon Islands',	'SI',	1),
(469,	31,	'Nelsons Island',	'NI',	1),
(470,	31,	'Three Brothers',	'TB',	1),
(471,	31,	'Eagle Islands',	'EA',	1),
(472,	31,	'Danger Island',	'DI',	1),
(473,	31,	'Egmont Islands',	'EG',	1),
(474,	31,	'Diego Garcia',	'DG',	1),
(475,	32,	'Belait',	'BEL',	1),
(476,	32,	'Brunei and Muara',	'BRM',	1),
(477,	32,	'Temburong',	'TEM',	1),
(478,	32,	'Tutong',	'TUT',	1),
(479,	33,	'Blagoevgrad',	'',	1),
(480,	33,	'Burgas',	'',	1),
(481,	33,	'Dobrich',	'',	1),
(482,	33,	'Gabrovo',	'',	1),
(483,	33,	'Haskovo',	'',	1),
(484,	33,	'Kardjali',	'',	1),
(485,	33,	'Kyustendil',	'',	1),
(486,	33,	'Lovech',	'',	1),
(487,	33,	'Montana',	'',	1),
(488,	33,	'Pazardjik',	'',	1),
(489,	33,	'Pernik',	'',	1),
(490,	33,	'Pleven',	'',	1),
(491,	33,	'Plovdiv',	'',	1),
(492,	33,	'Razgrad',	'',	1),
(493,	33,	'Shumen',	'',	1),
(494,	33,	'Silistra',	'',	1),
(495,	33,	'Sliven',	'',	1),
(496,	33,	'Smolyan',	'',	1),
(497,	33,	'Sofia',	'',	1),
(498,	33,	'Sofia - town',	'',	1),
(499,	33,	'Stara Zagora',	'',	1),
(500,	33,	'Targovishte',	'',	1),
(501,	33,	'Varna',	'',	1),
(502,	33,	'Veliko Tarnovo',	'',	1),
(503,	33,	'Vidin',	'',	1),
(504,	33,	'Vratza',	'',	1),
(505,	33,	'Yambol',	'',	1),
(506,	34,	'Bale',	'BAL',	1),
(507,	34,	'Bam',	'BAM',	1),
(508,	34,	'Banwa',	'BAN',	1),
(509,	34,	'Bazega',	'BAZ',	1),
(510,	34,	'Bougouriba',	'BOR',	1),
(511,	34,	'Boulgou',	'BLG',	1),
(512,	34,	'Boulkiemde',	'BOK',	1),
(513,	34,	'Comoe',	'COM',	1),
(514,	34,	'Ganzourgou',	'GAN',	1),
(515,	34,	'Gnagna',	'GNA',	1),
(516,	34,	'Gourma',	'GOU',	1),
(517,	34,	'Houet',	'HOU',	1),
(518,	34,	'Ioba',	'IOA',	1),
(519,	34,	'Kadiogo',	'KAD',	1),
(520,	34,	'Kenedougou',	'KEN',	1),
(521,	34,	'Komondjari',	'KOD',	1),
(522,	34,	'Kompienga',	'KOP',	1),
(523,	34,	'Kossi',	'KOS',	1),
(524,	34,	'Koulpelogo',	'KOL',	1),
(525,	34,	'Kouritenga',	'KOT',	1),
(526,	34,	'Kourweogo',	'KOW',	1),
(527,	34,	'Leraba',	'LER',	1),
(528,	34,	'Loroum',	'LOR',	1),
(529,	34,	'Mouhoun',	'MOU',	1),
(530,	34,	'Nahouri',	'NAH',	1),
(531,	34,	'Namentenga',	'NAM',	1),
(532,	34,	'Nayala',	'NAY',	1),
(533,	34,	'Noumbiel',	'NOU',	1),
(534,	34,	'Oubritenga',	'OUB',	1),
(535,	34,	'Oudalan',	'OUD',	1),
(536,	34,	'Passore',	'PAS',	1),
(537,	34,	'Poni',	'PON',	1),
(538,	34,	'Sanguie',	'SAG',	1),
(539,	34,	'Sanmatenga',	'SAM',	1),
(540,	34,	'Seno',	'SEN',	1),
(541,	34,	'Sissili',	'SIS',	1),
(542,	34,	'Soum',	'SOM',	1),
(543,	34,	'Sourou',	'SOR',	1),
(544,	34,	'Tapoa',	'TAP',	1),
(545,	34,	'Tuy',	'TUY',	1),
(546,	34,	'Yagha',	'YAG',	1),
(547,	34,	'Yatenga',	'YAT',	1),
(548,	34,	'Ziro',	'ZIR',	1),
(549,	34,	'Zondoma',	'ZOD',	1),
(550,	34,	'Zoundweogo',	'ZOW',	1),
(551,	35,	'Bubanza',	'BB',	1),
(552,	35,	'Bujumbura',	'BJ',	1),
(553,	35,	'Bururi',	'BR',	1),
(554,	35,	'Cankuzo',	'CA',	1),
(555,	35,	'Cibitoke',	'CI',	1),
(556,	35,	'Gitega',	'GI',	1),
(557,	35,	'Karuzi',	'KR',	1),
(558,	35,	'Kayanza',	'KY',	1),
(559,	35,	'Kirundo',	'KI',	1),
(560,	35,	'Makamba',	'MA',	1),
(561,	35,	'Muramvya',	'MU',	1),
(562,	35,	'Muyinga',	'MY',	1),
(563,	35,	'Mwaro',	'MW',	1),
(564,	35,	'Ngozi',	'NG',	1),
(565,	35,	'Rutana',	'RT',	1),
(566,	35,	'Ruyigi',	'RY',	1),
(567,	36,	'Phnom Penh',	'PP',	1),
(568,	36,	'Preah Seihanu (Kompong Som or Sihanoukville)',	'PS',	1),
(569,	36,	'Pailin',	'PA',	1),
(570,	36,	'Keb',	'KB',	1),
(571,	36,	'Banteay Meanchey',	'BM',	1),
(572,	36,	'Battambang',	'BA',	1),
(573,	36,	'Kampong Cham',	'KM',	1),
(574,	36,	'Kampong Chhnang',	'KN',	1),
(575,	36,	'Kampong Speu',	'KU',	1),
(576,	36,	'Kampong Som',	'KO',	1),
(577,	36,	'Kampong Thom',	'KT',	1),
(578,	36,	'Kampot',	'KP',	1),
(579,	36,	'Kandal',	'KL',	1),
(580,	36,	'Kaoh Kong',	'KK',	1),
(581,	36,	'Kratie',	'KR',	1),
(582,	36,	'Mondul Kiri',	'MK',	1),
(583,	36,	'Oddar Meancheay',	'OM',	1),
(584,	36,	'Pursat',	'PU',	1),
(585,	36,	'Preah Vihear',	'PR',	1),
(586,	36,	'Prey Veng',	'PG',	1),
(587,	36,	'Ratanak Kiri',	'RK',	1),
(588,	36,	'Siemreap',	'SI',	1),
(589,	36,	'Stung Treng',	'ST',	1),
(590,	36,	'Svay Rieng',	'SR',	1),
(591,	36,	'Takeo',	'TK',	1),
(592,	37,	'Adamawa (Adamaoua)',	'ADA',	1),
(593,	37,	'Centre',	'CEN',	1),
(594,	37,	'East (Est)',	'EST',	1),
(595,	37,	'Extreme North (Extreme-Nord)',	'EXN',	1),
(596,	37,	'Littoral',	'LIT',	1),
(597,	37,	'North (Nord)',	'NOR',	1),
(598,	37,	'Northwest (Nord-Ouest)',	'NOT',	1),
(599,	37,	'West (Ouest)',	'OUE',	1),
(600,	37,	'South (Sud)',	'SUD',	1),
(601,	37,	'Southwest (Sud-Ouest).',	'SOU',	1),
(602,	38,	'Alberta',	'AB',	1),
(603,	38,	'British Columbia',	'BC',	1),
(604,	38,	'Manitoba',	'MB',	1),
(605,	38,	'New Brunswick',	'NB',	1),
(606,	38,	'Newfoundland and Labrador',	'NL',	1),
(607,	38,	'Northwest Territories',	'NT',	1),
(608,	38,	'Nova Scotia',	'NS',	1),
(609,	38,	'Nunavut',	'NU',	1),
(610,	38,	'Ontario',	'ON',	1),
(611,	38,	'Prince Edward Island',	'PE',	1),
(612,	38,	'Qu&eacute;bec',	'QC',	1),
(613,	38,	'Saskatchewan',	'SK',	1),
(614,	38,	'Yukon Territory',	'YT',	1),
(615,	39,	'Boa Vista',	'BV',	1),
(616,	39,	'Brava',	'BR',	1),
(617,	39,	'Calheta de Sao Miguel',	'CS',	1),
(618,	39,	'Maio',	'MA',	1),
(619,	39,	'Mosteiros',	'MO',	1),
(620,	39,	'Paul',	'PA',	1),
(621,	39,	'Porto Novo',	'PN',	1),
(622,	39,	'Praia',	'PR',	1),
(623,	39,	'Ribeira Grande',	'RG',	1),
(624,	39,	'Sal',	'SL',	1),
(625,	39,	'Santa Catarina',	'CA',	1),
(626,	39,	'Santa Cruz',	'CR',	1),
(627,	39,	'Sao Domingos',	'SD',	1),
(628,	39,	'Sao Filipe',	'SF',	1),
(629,	39,	'Sao Nicolau',	'SN',	1),
(630,	39,	'Sao Vicente',	'SV',	1),
(631,	39,	'Tarrafal',	'TA',	1),
(632,	40,	'Creek',	'CR',	1),
(633,	40,	'Eastern',	'EA',	1),
(634,	40,	'Midland',	'ML',	1),
(635,	40,	'South Town',	'ST',	1),
(636,	40,	'Spot Bay',	'SP',	1),
(637,	40,	'Stake Bay',	'SK',	1),
(638,	40,	'West End',	'WD',	1),
(639,	40,	'Western',	'WN',	1),
(640,	41,	'Bamingui-Bangoran',	'BBA',	1),
(641,	41,	'Basse-Kotto',	'BKO',	1),
(642,	41,	'Haute-Kotto',	'HKO',	1),
(643,	41,	'Haut-Mbomou',	'HMB',	1),
(644,	41,	'Kemo',	'KEM',	1),
(645,	41,	'Lobaye',	'LOB',	1),
(646,	41,	'Mambere-KadeÔ',	'MKD',	1),
(647,	41,	'Mbomou',	'MBO',	1),
(648,	41,	'Nana-Mambere',	'NMM',	1),
(649,	41,	'Ombella-M\'Poko',	'OMP',	1),
(650,	41,	'Ouaka',	'OUK',	1),
(651,	41,	'Ouham',	'OUH',	1),
(652,	41,	'Ouham-Pende',	'OPE',	1),
(653,	41,	'Vakaga',	'VAK',	1),
(654,	41,	'Nana-Grebizi',	'NGR',	1),
(655,	41,	'Sangha-Mbaere',	'SMB',	1),
(656,	41,	'Bangui',	'BAN',	1),
(657,	42,	'Batha',	'BA',	1),
(658,	42,	'Biltine',	'BI',	1),
(659,	42,	'Borkou-Ennedi-Tibesti',	'BE',	1),
(660,	42,	'Chari-Baguirmi',	'CB',	1),
(661,	42,	'Guera',	'GU',	1),
(662,	42,	'Kanem',	'KA',	1),
(663,	42,	'Lac',	'LA',	1),
(664,	42,	'Logone Occidental',	'LC',	1),
(665,	42,	'Logone Oriental',	'LR',	1),
(666,	42,	'Mayo-Kebbi',	'MK',	1),
(667,	42,	'Moyen-Chari',	'MC',	1),
(668,	42,	'Ouaddai',	'OU',	1),
(669,	42,	'Salamat',	'SA',	1),
(670,	42,	'Tandjile',	'TA',	1),
(671,	43,	'Aisen del General Carlos Ibanez',	'AI',	1),
(672,	43,	'Antofagasta',	'AN',	1),
(673,	43,	'Araucania',	'AR',	1),
(674,	43,	'Atacama',	'AT',	1),
(675,	43,	'Bio-Bio',	'BI',	1),
(676,	43,	'Coquimbo',	'CO',	1),
(677,	43,	'Libertador General Bernardo O\'Hi',	'LI',	1),
(678,	43,	'Los Lagos',	'LL',	1),
(679,	43,	'Magallanes y de la Antartica Chi',	'MA',	1),
(680,	43,	'Maule',	'ML',	1),
(681,	43,	'Region Metropolitana',	'RM',	1),
(682,	43,	'Tarapaca',	'TA',	1),
(683,	43,	'Valparaiso',	'VS',	1),
(684,	44,	'Anhui',	'AN',	1),
(685,	44,	'Beijing',	'BE',	1),
(686,	44,	'Chongqing',	'CH',	1),
(687,	44,	'Fujian',	'FU',	1),
(688,	44,	'Gansu',	'GA',	1),
(689,	44,	'Guangdong',	'GU',	1),
(690,	44,	'Guangxi',	'GX',	1),
(691,	44,	'Guizhou',	'GZ',	1),
(692,	44,	'Hainan',	'HA',	1),
(693,	44,	'Hebei',	'HB',	1),
(694,	44,	'Heilongjiang',	'HL',	1),
(695,	44,	'Henan',	'HE',	1),
(696,	44,	'Hong Kong',	'HK',	1),
(697,	44,	'Hubei',	'HU',	1),
(698,	44,	'Hunan',	'HN',	1),
(699,	44,	'Inner Mongolia',	'IM',	1),
(700,	44,	'Jiangsu',	'JI',	1),
(701,	44,	'Jiangxi',	'JX',	1),
(702,	44,	'Jilin',	'JL',	1),
(703,	44,	'Liaoning',	'LI',	1),
(704,	44,	'Macau',	'MA',	1),
(705,	44,	'Ningxia',	'NI',	1),
(706,	44,	'Shaanxi',	'SH',	1),
(707,	44,	'Shandong',	'SA',	1),
(708,	44,	'Shanghai',	'SG',	1),
(709,	44,	'Shanxi',	'SX',	1),
(710,	44,	'Sichuan',	'SI',	1),
(711,	44,	'Tianjin',	'TI',	1),
(712,	44,	'Xinjiang',	'XI',	1),
(713,	44,	'Yunnan',	'YU',	1),
(714,	44,	'Zhejiang',	'ZH',	1),
(715,	46,	'Direction Island',	'D',	1),
(716,	46,	'Home Island',	'H',	1),
(717,	46,	'Horsburgh Island',	'O',	1),
(718,	46,	'South Island',	'S',	1),
(719,	46,	'West Island',	'W',	1),
(720,	47,	'Amazonas',	'AMZ',	1),
(721,	47,	'Antioquia',	'ANT',	1),
(722,	47,	'Arauca',	'ARA',	1),
(723,	47,	'Atlantico',	'ATL',	1),
(724,	47,	'Bogota D.C.',	'BDC',	1),
(725,	47,	'Bolivar',	'BOL',	1),
(726,	47,	'Boyaca',	'BOY',	1),
(727,	47,	'Caldas',	'CAL',	1),
(728,	47,	'Caqueta',	'CAQ',	1),
(729,	47,	'Casanare',	'CAS',	1),
(730,	47,	'Cauca',	'CAU',	1),
(731,	47,	'Cesar',	'CES',	1),
(732,	47,	'Choco',	'CHO',	1),
(733,	47,	'Cordoba',	'COR',	1),
(734,	47,	'Cundinamarca',	'CAM',	1),
(735,	47,	'Guainia',	'GNA',	1),
(736,	47,	'Guajira',	'GJR',	1),
(737,	47,	'Guaviare',	'GVR',	1),
(738,	47,	'Huila',	'HUI',	1),
(739,	47,	'Magdalena',	'MAG',	1),
(740,	47,	'Meta',	'MET',	1),
(741,	47,	'Narino',	'NAR',	1),
(742,	47,	'Norte de Santander',	'NDS',	1),
(743,	47,	'Putumayo',	'PUT',	1),
(744,	47,	'Quindio',	'QUI',	1),
(745,	47,	'Risaralda',	'RIS',	1),
(746,	47,	'San Andres y Providencia',	'SAP',	1),
(747,	47,	'Santander',	'SAN',	1),
(748,	47,	'Sucre',	'SUC',	1),
(749,	47,	'Tolima',	'TOL',	1),
(750,	47,	'Valle del Cauca',	'VDC',	1),
(751,	47,	'Vaupes',	'VAU',	1),
(752,	47,	'Vichada',	'VIC',	1),
(753,	48,	'Grande Comore',	'G',	1),
(754,	48,	'Anjouan',	'A',	1),
(755,	48,	'Moheli',	'M',	1),
(756,	49,	'Bouenza',	'BO',	1),
(757,	49,	'Brazzaville',	'BR',	1),
(758,	49,	'Cuvette',	'CU',	1),
(759,	49,	'Cuvette-Ouest',	'CO',	1),
(760,	49,	'Kouilou',	'KO',	1),
(761,	49,	'Lekoumou',	'LE',	1),
(762,	49,	'Likouala',	'LI',	1),
(763,	49,	'Niari',	'NI',	1),
(764,	49,	'Plateaux',	'PL',	1),
(765,	49,	'Pool',	'PO',	1),
(766,	49,	'Sangha',	'SA',	1),
(767,	50,	'Pukapuka',	'PU',	1),
(768,	50,	'Rakahanga',	'RK',	1),
(769,	50,	'Manihiki',	'MK',	1),
(770,	50,	'Penrhyn',	'PE',	1),
(771,	50,	'Nassau Island',	'NI',	1),
(772,	50,	'Surwarrow',	'SU',	1),
(773,	50,	'Palmerston',	'PA',	1),
(774,	50,	'Aitutaki',	'AI',	1),
(775,	50,	'Manuae',	'MA',	1),
(776,	50,	'Takutea',	'TA',	1),
(777,	50,	'Mitiaro',	'MT',	1),
(778,	50,	'Atiu',	'AT',	1),
(779,	50,	'Mauke',	'MU',	1),
(780,	50,	'Rarotonga',	'RR',	1),
(781,	50,	'Mangaia',	'MG',	1),
(782,	51,	'Alajuela',	'AL',	1),
(783,	51,	'Cartago',	'CA',	1),
(784,	51,	'Guanacaste',	'GU',	1),
(785,	51,	'Heredia',	'HE',	1),
(786,	51,	'Limon',	'LI',	1),
(787,	51,	'Puntarenas',	'PU',	1),
(788,	51,	'San Jose',	'SJ',	1),
(789,	52,	'Abengourou',	'ABE',	1),
(790,	52,	'Abidjan',	'ABI',	1),
(791,	52,	'Aboisso',	'ABO',	1),
(792,	52,	'Adiake',	'ADI',	1),
(793,	52,	'Adzope',	'ADZ',	1),
(794,	52,	'Agboville',	'AGB',	1),
(795,	52,	'Agnibilekrou',	'AGN',	1),
(796,	52,	'Alepe',	'ALE',	1),
(797,	52,	'Bocanda',	'BOC',	1),
(798,	52,	'Bangolo',	'BAN',	1),
(799,	52,	'Beoumi',	'BEO',	1),
(800,	52,	'Biankouma',	'BIA',	1),
(801,	52,	'Bondoukou',	'BDK',	1),
(802,	52,	'Bongouanou',	'BGN',	1),
(803,	52,	'Bouafle',	'BFL',	1),
(804,	52,	'Bouake',	'BKE',	1),
(805,	52,	'Bouna',	'BNA',	1),
(806,	52,	'Boundiali',	'BDL',	1),
(807,	52,	'Dabakala',	'DKL',	1),
(808,	52,	'Dabou',	'DBU',	1),
(809,	52,	'Daloa',	'DAL',	1),
(810,	52,	'Danane',	'DAN',	1),
(811,	52,	'Daoukro',	'DAO',	1),
(812,	52,	'Dimbokro',	'DIM',	1),
(813,	52,	'Divo',	'DIV',	1),
(814,	52,	'Duekoue',	'DUE',	1),
(815,	52,	'Ferkessedougou',	'FER',	1),
(816,	52,	'Gagnoa',	'GAG',	1),
(817,	52,	'Grand-Bassam',	'GBA',	1),
(818,	52,	'Grand-Lahou',	'GLA',	1),
(819,	52,	'Guiglo',	'GUI',	1),
(820,	52,	'Issia',	'ISS',	1),
(821,	52,	'Jacqueville',	'JAC',	1),
(822,	52,	'Katiola',	'KAT',	1),
(823,	52,	'Korhogo',	'KOR',	1),
(824,	52,	'Lakota',	'LAK',	1),
(825,	52,	'Man',	'MAN',	1),
(826,	52,	'Mankono',	'MKN',	1),
(827,	52,	'Mbahiakro',	'MBA',	1),
(828,	52,	'Odienne',	'ODI',	1),
(829,	52,	'Oume',	'OUM',	1),
(830,	52,	'Sakassou',	'SAK',	1),
(831,	52,	'San-Pedro',	'SPE',	1),
(832,	52,	'Sassandra',	'SAS',	1),
(833,	52,	'Seguela',	'SEG',	1),
(834,	52,	'Sinfra',	'SIN',	1),
(835,	52,	'Soubre',	'SOU',	1),
(836,	52,	'Tabou',	'TAB',	1),
(837,	52,	'Tanda',	'TAN',	1),
(838,	52,	'Tiebissou',	'TIE',	1),
(839,	52,	'Tingrela',	'TIN',	1),
(840,	52,	'Tiassale',	'TIA',	1),
(841,	52,	'Touba',	'TBA',	1),
(842,	52,	'Toulepleu',	'TLP',	1),
(843,	52,	'Toumodi',	'TMD',	1),
(844,	52,	'Vavoua',	'VAV',	1),
(845,	52,	'Yamoussoukro',	'YAM',	1),
(846,	52,	'Zuenoula',	'ZUE',	1),
(847,	53,	'Bjelovar-Bilogora',	'BB',	1),
(848,	53,	'City of Zagreb',	'CZ',	1),
(849,	53,	'Dubrovnik-Neretva',	'DN',	1),
(850,	53,	'Istra',	'IS',	1),
(851,	53,	'Karlovac',	'KA',	1),
(852,	53,	'Koprivnica-Krizevci',	'KK',	1),
(853,	53,	'Krapina-Zagorje',	'KZ',	1),
(854,	53,	'Lika-Senj',	'LS',	1),
(855,	53,	'Medimurje',	'ME',	1),
(856,	53,	'Osijek-Baranja',	'OB',	1),
(857,	53,	'Pozega-Slavonia',	'PS',	1),
(858,	53,	'Primorje-Gorski Kotar',	'PG',	1),
(859,	53,	'Sibenik',	'SI',	1),
(860,	53,	'Sisak-Moslavina',	'SM',	1),
(861,	53,	'Slavonski Brod-Posavina',	'SB',	1),
(862,	53,	'Split-Dalmatia',	'SD',	1),
(863,	53,	'Varazdin',	'VA',	1),
(864,	53,	'Virovitica-Podravina',	'VP',	1),
(865,	53,	'Vukovar-Srijem',	'VS',	1),
(866,	53,	'Zadar-Knin',	'ZK',	1),
(867,	53,	'Zagreb',	'ZA',	1),
(868,	54,	'Camaguey',	'CA',	1),
(869,	54,	'Ciego de Avila',	'CD',	1),
(870,	54,	'Cienfuegos',	'CI',	1),
(871,	54,	'Ciudad de La Habana',	'CH',	1),
(872,	54,	'Granma',	'GR',	1),
(873,	54,	'Guantanamo',	'GU',	1),
(874,	54,	'Holguin',	'HO',	1),
(875,	54,	'Isla de la Juventud',	'IJ',	1),
(876,	54,	'La Habana',	'LH',	1),
(877,	54,	'Las Tunas',	'LT',	1),
(878,	54,	'Matanzas',	'MA',	1),
(879,	54,	'Pinar del Rio',	'PR',	1),
(880,	54,	'Sancti Spiritus',	'SS',	1),
(881,	54,	'Santiago de Cuba',	'SC',	1),
(882,	54,	'Villa Clara',	'VC',	1),
(883,	55,	'Famagusta',	'F',	1),
(884,	55,	'Kyrenia',	'K',	1),
(885,	55,	'Larnaca',	'A',	1),
(886,	55,	'Limassol',	'I',	1),
(887,	55,	'Nicosia',	'N',	1),
(888,	55,	'Paphos',	'P',	1),
(889,	56,	'Ústecký',	'U',	1),
(890,	56,	'Jihočeský',	'C',	1),
(891,	56,	'Jihomoravský',	'B',	1),
(892,	56,	'Karlovarský',	'K',	1),
(893,	56,	'Královehradecký',	'H',	1),
(894,	56,	'Liberecký',	'L',	1),
(895,	56,	'Moravskoslezský',	'T',	1),
(896,	56,	'Olomoucký',	'M',	1),
(897,	56,	'Pardubický',	'E',	1),
(898,	56,	'Plzeňský',	'P',	1),
(899,	56,	'Praha',	'A',	1),
(900,	56,	'Středočeský',	'S',	1),
(901,	56,	'Vysočina',	'J',	1),
(902,	56,	'Zlínský',	'Z',	1),
(903,	57,	'Arhus',	'AR',	1),
(904,	57,	'Bornholm',	'BH',	1),
(905,	57,	'Copenhagen',	'CO',	1),
(906,	57,	'Faroe Islands',	'FO',	1),
(907,	57,	'Frederiksborg',	'FR',	1),
(908,	57,	'Fyn',	'FY',	1),
(909,	57,	'Kobenhavn',	'KO',	1),
(910,	57,	'Nordjylland',	'NO',	1),
(911,	57,	'Ribe',	'RI',	1),
(912,	57,	'Ringkobing',	'RK',	1),
(913,	57,	'Roskilde',	'RO',	1),
(914,	57,	'Sonderjylland',	'SO',	1),
(915,	57,	'Storstrom',	'ST',	1),
(916,	57,	'Vejle',	'VK',	1),
(917,	57,	'Vestj&aelig;lland',	'VJ',	1),
(918,	57,	'Viborg',	'VB',	1),
(919,	58,	'\'Ali Sabih',	'S',	1),
(920,	58,	'Dikhil',	'K',	1),
(921,	58,	'Djibouti',	'J',	1),
(922,	58,	'Obock',	'O',	1),
(923,	58,	'Tadjoura',	'T',	1),
(924,	59,	'Saint Andrew Parish',	'AND',	1),
(925,	59,	'Saint David Parish',	'DAV',	1),
(926,	59,	'Saint George Parish',	'GEO',	1),
(927,	59,	'Saint John Parish',	'JOH',	1),
(928,	59,	'Saint Joseph Parish',	'JOS',	1),
(929,	59,	'Saint Luke Parish',	'LUK',	1),
(930,	59,	'Saint Mark Parish',	'MAR',	1),
(931,	59,	'Saint Patrick Parish',	'PAT',	1),
(932,	59,	'Saint Paul Parish',	'PAU',	1),
(933,	59,	'Saint Peter Parish',	'PET',	1),
(934,	60,	'Distrito Nacional',	'DN',	1),
(935,	60,	'Azua',	'AZ',	1),
(936,	60,	'Baoruco',	'BC',	1),
(937,	60,	'Barahona',	'BH',	1),
(938,	60,	'Dajabon',	'DJ',	1),
(939,	60,	'Duarte',	'DU',	1),
(940,	60,	'Elias Pina',	'EL',	1),
(941,	60,	'El Seybo',	'SY',	1),
(942,	60,	'Espaillat',	'ET',	1),
(943,	60,	'Hato Mayor',	'HM',	1),
(944,	60,	'Independencia',	'IN',	1),
(945,	60,	'La Altagracia',	'AL',	1),
(946,	60,	'La Romana',	'RO',	1),
(947,	60,	'La Vega',	'VE',	1),
(948,	60,	'Maria Trinidad Sanchez',	'MT',	1),
(949,	60,	'Monsenor Nouel',	'MN',	1),
(950,	60,	'Monte Cristi',	'MC',	1),
(951,	60,	'Monte Plata',	'MP',	1),
(952,	60,	'Pedernales',	'PD',	1),
(953,	60,	'Peravia (Bani)',	'PR',	1),
(954,	60,	'Puerto Plata',	'PP',	1),
(955,	60,	'Salcedo',	'SL',	1),
(956,	60,	'Samana',	'SM',	1),
(957,	60,	'Sanchez Ramirez',	'SH',	1),
(958,	60,	'San Cristobal',	'SC',	1),
(959,	60,	'San Jose de Ocoa',	'JO',	1),
(960,	60,	'San Juan',	'SJ',	1),
(961,	60,	'San Pedro de Macoris',	'PM',	1),
(962,	60,	'Santiago',	'SA',	1),
(963,	60,	'Santiago Rodriguez',	'ST',	1),
(964,	60,	'Santo Domingo',	'SD',	1),
(965,	60,	'Valverde',	'VA',	1),
(966,	61,	'Aileu',	'AL',	1),
(967,	61,	'Ainaro',	'AN',	1),
(968,	61,	'Baucau',	'BA',	1),
(969,	61,	'Bobonaro',	'BO',	1),
(970,	61,	'Cova Lima',	'CO',	1),
(971,	61,	'Dili',	'DI',	1),
(972,	61,	'Ermera',	'ER',	1),
(973,	61,	'Lautem',	'LA',	1),
(974,	61,	'Liquica',	'LI',	1),
(975,	61,	'Manatuto',	'MT',	1),
(976,	61,	'Manufahi',	'MF',	1),
(977,	61,	'Oecussi',	'OE',	1),
(978,	61,	'Viqueque',	'VI',	1),
(979,	62,	'Azuay',	'AZU',	1),
(980,	62,	'Bolivar',	'BOL',	1),
(981,	62,	'Ca&ntilde;ar',	'CAN',	1),
(982,	62,	'Carchi',	'CAR',	1),
(983,	62,	'Chimborazo',	'CHI',	1),
(984,	62,	'Cotopaxi',	'COT',	1),
(985,	62,	'El Oro',	'EOR',	1),
(986,	62,	'Esmeraldas',	'ESM',	1),
(987,	62,	'Gal&aacute;pagos',	'GPS',	1),
(988,	62,	'Guayas',	'GUA',	1),
(989,	62,	'Imbabura',	'IMB',	1),
(990,	62,	'Loja',	'LOJ',	1),
(991,	62,	'Los Rios',	'LRO',	1),
(992,	62,	'Manab&iacute;',	'MAN',	1),
(993,	62,	'Morona Santiago',	'MSA',	1),
(994,	62,	'Napo',	'NAP',	1),
(995,	62,	'Orellana',	'ORE',	1),
(996,	62,	'Pastaza',	'PAS',	1),
(997,	62,	'Pichincha',	'PIC',	1),
(998,	62,	'Sucumb&iacute;os',	'SUC',	1),
(999,	62,	'Tungurahua',	'TUN',	1),
(1000,	62,	'Zamora Chinchipe',	'ZCH',	1),
(1001,	63,	'Ad Daqahliyah',	'DHY',	1),
(1002,	63,	'Al Bahr al Ahmar',	'BAM',	1),
(1003,	63,	'Al Buhayrah',	'BHY',	1),
(1004,	63,	'Al Fayyum',	'FYM',	1),
(1005,	63,	'Al Gharbiyah',	'GBY',	1),
(1006,	63,	'Al Iskandariyah',	'IDR',	1),
(1007,	63,	'Al Isma\'iliyah',	'IML',	1),
(1008,	63,	'Al Jizah',	'JZH',	1),
(1009,	63,	'Al Minufiyah',	'MFY',	1),
(1010,	63,	'Al Minya',	'MNY',	1),
(1011,	63,	'Al Qahirah',	'QHR',	1),
(1012,	63,	'Al Qalyubiyah',	'QLY',	1),
(1013,	63,	'Al Wadi al Jadid',	'WJD',	1),
(1014,	63,	'Ash Sharqiyah',	'SHQ',	1),
(1015,	63,	'As Suways',	'SWY',	1),
(1016,	63,	'Aswan',	'ASW',	1),
(1017,	63,	'Asyut',	'ASY',	1),
(1018,	63,	'Bani Suwayf',	'BSW',	1),
(1019,	63,	'Bur Sa\'id',	'BSD',	1),
(1020,	63,	'Dumyat',	'DMY',	1),
(1021,	63,	'Janub Sina\'',	'JNS',	1),
(1022,	63,	'Kafr ash Shaykh',	'KSH',	1),
(1023,	63,	'Matruh',	'MAT',	1),
(1024,	63,	'Qina',	'QIN',	1),
(1025,	63,	'Shamal Sina\'',	'SHS',	1),
(1026,	63,	'Suhaj',	'SUH',	1),
(1027,	64,	'Ahuachapan',	'AH',	1),
(1028,	64,	'Cabanas',	'CA',	1),
(1029,	64,	'Chalatenango',	'CH',	1),
(1030,	64,	'Cuscatlan',	'CU',	1),
(1031,	64,	'La Libertad',	'LB',	1),
(1032,	64,	'La Paz',	'PZ',	1),
(1033,	64,	'La Union',	'UN',	1),
(1034,	64,	'Morazan',	'MO',	1),
(1035,	64,	'San Miguel',	'SM',	1),
(1036,	64,	'San Salvador',	'SS',	1),
(1037,	64,	'San Vicente',	'SV',	1),
(1038,	64,	'Santa Ana',	'SA',	1),
(1039,	64,	'Sonsonate',	'SO',	1),
(1040,	64,	'Usulutan',	'US',	1),
(1041,	65,	'Provincia Annobon',	'AN',	1),
(1042,	65,	'Provincia Bioko Norte',	'BN',	1),
(1043,	65,	'Provincia Bioko Sur',	'BS',	1),
(1044,	65,	'Provincia Centro Sur',	'CS',	1),
(1045,	65,	'Provincia Kie-Ntem',	'KN',	1),
(1046,	65,	'Provincia Litoral',	'LI',	1),
(1047,	65,	'Provincia Wele-Nzas',	'WN',	1),
(1048,	66,	'Central (Maekel)',	'MA',	1),
(1049,	66,	'Anseba (Keren)',	'KE',	1),
(1050,	66,	'Southern Red Sea (Debub-Keih-Bahri)',	'DK',	1),
(1051,	66,	'Northern Red Sea (Semien-Keih-Bahri)',	'SK',	1),
(1052,	66,	'Southern (Debub)',	'DE',	1),
(1053,	66,	'Gash-Barka (Barentu)',	'BR',	1),
(1054,	67,	'Harjumaa (Tallinn)',	'HA',	1),
(1055,	67,	'Hiiumaa (Kardla)',	'HI',	1),
(1056,	67,	'Ida-Virumaa (Johvi)',	'IV',	1),
(1057,	67,	'Jarvamaa (Paide)',	'JA',	1),
(1058,	67,	'Jogevamaa (Jogeva)',	'JO',	1),
(1059,	67,	'Laane-Virumaa (Rakvere)',	'LV',	1),
(1060,	67,	'Laanemaa (Haapsalu)',	'LA',	1),
(1061,	67,	'Parnumaa (Parnu)',	'PA',	1),
(1062,	67,	'Polvamaa (Polva)',	'PO',	1),
(1063,	67,	'Raplamaa (Rapla)',	'RA',	1),
(1064,	67,	'Saaremaa (Kuessaare)',	'SA',	1),
(1065,	67,	'Tartumaa (Tartu)',	'TA',	1),
(1066,	67,	'Valgamaa (Valga)',	'VA',	1),
(1067,	67,	'Viljandimaa (Viljandi)',	'VI',	1),
(1068,	67,	'Vorumaa (Voru)',	'VO',	1),
(1069,	68,	'Afar',	'AF',	1),
(1070,	68,	'Amhara',	'AH',	1),
(1071,	68,	'Benishangul-Gumaz',	'BG',	1),
(1072,	68,	'Gambela',	'GB',	1),
(1073,	68,	'Hariai',	'HR',	1),
(1074,	68,	'Oromia',	'OR',	1),
(1075,	68,	'Somali',	'SM',	1),
(1076,	68,	'Southern Nations - Nationalities and Peoples Region',	'SN',	1),
(1077,	68,	'Tigray',	'TG',	1),
(1078,	68,	'Addis Ababa',	'AA',	1),
(1079,	68,	'Dire Dawa',	'DD',	1),
(1080,	71,	'Central Division',	'C',	1),
(1081,	71,	'Northern Division',	'N',	1),
(1082,	71,	'Eastern Division',	'E',	1),
(1083,	71,	'Western Division',	'W',	1),
(1084,	71,	'Rotuma',	'R',	1),
(1085,	72,	'Ahvenanmaan Laani',	'AL',	1),
(1086,	72,	'Etela-Suomen Laani',	'ES',	1),
(1087,	72,	'Ita-Suomen Laani',	'IS',	1),
(1088,	72,	'Lansi-Suomen Laani',	'LS',	1),
(1089,	72,	'Lapin Lanani',	'LA',	1),
(1090,	72,	'Oulun Laani',	'OU',	1),
(1091,	73,	'Alsace',	'AL',	1),
(1092,	73,	'Aquitaine',	'AQ',	1),
(1093,	73,	'Auvergne',	'AU',	1),
(1094,	73,	'Brittany',	'BR',	1),
(1095,	73,	'Burgundy',	'BU',	1),
(1096,	73,	'Center Loire Valley',	'CE',	1),
(1097,	73,	'Champagne',	'CH',	1),
(1098,	73,	'Corse',	'CO',	1),
(1099,	73,	'France Comte',	'FR',	1),
(1100,	73,	'Languedoc Roussillon',	'LA',	1),
(1101,	73,	'Limousin',	'LI',	1),
(1102,	73,	'Lorraine',	'LO',	1),
(1103,	73,	'Midi Pyrenees',	'MI',	1),
(1104,	73,	'Nord Pas de Calais',	'NO',	1),
(1105,	73,	'Normandy',	'NR',	1),
(1106,	73,	'Paris / Ill de France',	'PA',	1),
(1107,	73,	'Picardie',	'PI',	1),
(1108,	73,	'Poitou Charente',	'PO',	1),
(1109,	73,	'Provence',	'PR',	1),
(1110,	73,	'Rhone Alps',	'RH',	1),
(1111,	73,	'Riviera',	'RI',	1),
(1112,	73,	'Western Loire Valley',	'WE',	1),
(1113,	74,	'Etranger',	'Et',	1),
(1114,	74,	'Ain',	'01',	1),
(1115,	74,	'Aisne',	'02',	1),
(1116,	74,	'Allier',	'03',	1),
(1117,	74,	'Alpes de Haute Provence',	'04',	1),
(1118,	74,	'Hautes-Alpes',	'05',	1),
(1119,	74,	'Alpes Maritimes',	'06',	1),
(1120,	74,	'Ard&egrave;che',	'07',	1),
(1121,	74,	'Ardennes',	'08',	1),
(1122,	74,	'Ari&egrave;ge',	'09',	1),
(1123,	74,	'Aube',	'10',	1),
(1124,	74,	'Aude',	'11',	1),
(1125,	74,	'Aveyron',	'12',	1),
(1126,	74,	'Bouches du Rh&ocirc;ne',	'13',	1),
(1127,	74,	'Calvados',	'14',	1),
(1128,	74,	'Cantal',	'15',	1),
(1129,	74,	'Charente',	'16',	1),
(1130,	74,	'Charente Maritime',	'17',	1),
(1131,	74,	'Cher',	'18',	1),
(1132,	74,	'Corr&egrave;ze',	'19',	1),
(1133,	74,	'Corse du Sud',	'2A',	1),
(1134,	74,	'Haute Corse',	'2B',	1),
(1135,	74,	'C&ocirc;te d&#039;or',	'21',	1),
(1136,	74,	'C&ocirc;tes d&#039;Armor',	'22',	1),
(1137,	74,	'Creuse',	'23',	1),
(1138,	74,	'Dordogne',	'24',	1),
(1139,	74,	'Doubs',	'25',	1),
(1140,	74,	'Dr&ocirc;me',	'26',	1),
(1141,	74,	'Eure',	'27',	1),
(1142,	74,	'Eure et Loir',	'28',	1),
(1143,	74,	'Finist&egrave;re',	'29',	1),
(1144,	74,	'Gard',	'30',	1),
(1145,	74,	'Haute Garonne',	'31',	1),
(1146,	74,	'Gers',	'32',	1),
(1147,	74,	'Gironde',	'33',	1),
(1148,	74,	'H&eacute;rault',	'34',	1),
(1149,	74,	'Ille et Vilaine',	'35',	1),
(1150,	74,	'Indre',	'36',	1),
(1151,	74,	'Indre et Loire',	'37',	1),
(1152,	74,	'Is&eacute;re',	'38',	1),
(1153,	74,	'Jura',	'39',	1),
(1154,	74,	'Landes',	'40',	1),
(1155,	74,	'Loir et Cher',	'41',	1),
(1156,	74,	'Loire',	'42',	1),
(1157,	74,	'Haute Loire',	'43',	1),
(1158,	74,	'Loire Atlantique',	'44',	1),
(1159,	74,	'Loiret',	'45',	1),
(1160,	74,	'Lot',	'46',	1),
(1161,	74,	'Lot et Garonne',	'47',	1),
(1162,	74,	'Loz&egrave;re',	'48',	1),
(1163,	74,	'Maine et Loire',	'49',	1),
(1164,	74,	'Manche',	'50',	1),
(1165,	74,	'Marne',	'51',	1),
(1166,	74,	'Haute Marne',	'52',	1),
(1167,	74,	'Mayenne',	'53',	1),
(1168,	74,	'Meurthe et Moselle',	'54',	1),
(1169,	74,	'Meuse',	'55',	1),
(1170,	74,	'Morbihan',	'56',	1),
(1171,	74,	'Moselle',	'57',	1),
(1172,	74,	'Ni&egrave;vre',	'58',	1),
(1173,	74,	'Nord',	'59',	1),
(1174,	74,	'Oise',	'60',	1),
(1175,	74,	'Orne',	'61',	1),
(1176,	74,	'Pas de Calais',	'62',	1),
(1177,	74,	'Puy de D&ocirc;me',	'63',	1),
(1178,	74,	'Pyr&eacute;n&eacute;es Atlantiques',	'64',	1),
(1179,	74,	'Hautes Pyr&eacute;n&eacute;es',	'65',	1),
(1180,	74,	'Pyr&eacute;n&eacute;es Orientales',	'66',	1),
(1181,	74,	'Bas Rhin',	'67',	1),
(1182,	74,	'Haut Rhin',	'68',	1),
(1183,	74,	'Rh&ocirc;ne',	'69',	1),
(1184,	74,	'Haute Sa&ocirc;ne',	'70',	1),
(1185,	74,	'Sa&ocirc;ne et Loire',	'71',	1),
(1186,	74,	'Sarthe',	'72',	1),
(1187,	74,	'Savoie',	'73',	1),
(1188,	74,	'Haute Savoie',	'74',	1),
(1189,	74,	'Paris',	'75',	1),
(1190,	74,	'Seine Maritime',	'76',	1),
(1191,	74,	'Seine et Marne',	'77',	1),
(1192,	74,	'Yvelines',	'78',	1),
(1193,	74,	'Deux S&egrave;vres',	'79',	1),
(1194,	74,	'Somme',	'80',	1),
(1195,	74,	'Tarn',	'81',	1),
(1196,	74,	'Tarn et Garonne',	'82',	1),
(1197,	74,	'Var',	'83',	1),
(1198,	74,	'Vaucluse',	'84',	1),
(1199,	74,	'Vend&eacute;e',	'85',	1),
(1200,	74,	'Vienne',	'86',	1),
(1201,	74,	'Haute Vienne',	'87',	1),
(1202,	74,	'Vosges',	'88',	1),
(1203,	74,	'Yonne',	'89',	1),
(1204,	74,	'Territoire de Belfort',	'90',	1),
(1205,	74,	'Essonne',	'91',	1),
(1206,	74,	'Hauts de Seine',	'92',	1),
(1207,	74,	'Seine St-Denis',	'93',	1),
(1208,	74,	'Val de Marne',	'94',	1),
(1209,	74,	'Val d\'Oise',	'95',	1),
(1210,	76,	'Archipel des Marquises',	'M',	1),
(1211,	76,	'Archipel des Tuamotu',	'T',	1),
(1212,	76,	'Archipel des Tubuai',	'I',	1),
(1213,	76,	'Iles du Vent',	'V',	1),
(1214,	76,	'Iles Sous-le-Vent',	'S',	1),
(1215,	77,	'Iles Crozet',	'C',	1),
(1216,	77,	'Iles Kerguelen',	'K',	1),
(1217,	77,	'Ile Amsterdam',	'A',	1),
(1218,	77,	'Ile Saint-Paul',	'P',	1),
(1219,	77,	'Adelie Land',	'D',	1),
(1220,	78,	'Estuaire',	'ES',	1),
(1221,	78,	'Haut-Ogooue',	'HO',	1),
(1222,	78,	'Moyen-Ogooue',	'MO',	1),
(1223,	78,	'Ngounie',	'NG',	1),
(1224,	78,	'Nyanga',	'NY',	1),
(1225,	78,	'Ogooue-Ivindo',	'OI',	1),
(1226,	78,	'Ogooue-Lolo',	'OL',	1),
(1227,	78,	'Ogooue-Maritime',	'OM',	1),
(1228,	78,	'Woleu-Ntem',	'WN',	1),
(1229,	79,	'Banjul',	'BJ',	1),
(1230,	79,	'Basse',	'BS',	1),
(1231,	79,	'Brikama',	'BR',	1),
(1232,	79,	'Janjangbure',	'JA',	1),
(1233,	79,	'Kanifeng',	'KA',	1),
(1234,	79,	'Kerewan',	'KE',	1),
(1235,	79,	'Kuntaur',	'KU',	1),
(1236,	79,	'Mansakonko',	'MA',	1),
(1237,	79,	'Lower River',	'LR',	1),
(1238,	79,	'Central River',	'CR',	1),
(1239,	79,	'North Bank',	'NB',	1),
(1240,	79,	'Upper River',	'UR',	1),
(1241,	79,	'Western',	'WE',	1),
(1242,	80,	'Abkhazia',	'AB',	1),
(1243,	80,	'Ajaria',	'AJ',	1),
(1244,	80,	'Tbilisi',	'TB',	1),
(1245,	80,	'Guria',	'GU',	1),
(1246,	80,	'Imereti',	'IM',	1),
(1247,	80,	'Kakheti',	'KA',	1),
(1248,	80,	'Kvemo Kartli',	'KK',	1),
(1249,	80,	'Mtskheta-Mtianeti',	'MM',	1),
(1250,	80,	'Racha Lechkhumi and Kvemo Svanet',	'RL',	1),
(1251,	80,	'Samegrelo-Zemo Svaneti',	'SZ',	1),
(1252,	80,	'Samtskhe-Javakheti',	'SJ',	1),
(1253,	80,	'Shida Kartli',	'SK',	1),
(1254,	81,	'Baden-W&uuml;rttemberg',	'BAW',	1),
(1255,	81,	'Bayern',	'BAY',	1),
(1256,	81,	'Berlin',	'BER',	1),
(1257,	81,	'Brandenburg',	'BRG',	1),
(1258,	81,	'Bremen',	'BRE',	1),
(1259,	81,	'Hamburg',	'HAM',	1),
(1260,	81,	'Hessen',	'HES',	1),
(1261,	81,	'Mecklenburg-Vorpommern',	'MEC',	1),
(1262,	81,	'Niedersachsen',	'NDS',	1),
(1263,	81,	'Nordrhein-Westfalen',	'NRW',	1),
(1264,	81,	'Rheinland-Pfalz',	'RHE',	1),
(1265,	81,	'Saarland',	'SAR',	1),
(1266,	81,	'Sachsen',	'SAS',	1),
(1267,	81,	'Sachsen-Anhalt',	'SAC',	1),
(1268,	81,	'Schleswig-Holstein',	'SCN',	1),
(1269,	81,	'Th&uuml;ringen',	'THE',	1),
(1270,	82,	'Ashanti Region',	'AS',	1),
(1271,	82,	'Brong-Ahafo Region',	'BA',	1),
(1272,	82,	'Central Region',	'CE',	1),
(1273,	82,	'Eastern Region',	'EA',	1),
(1274,	82,	'Greater Accra Region',	'GA',	1),
(1275,	82,	'Northern Region',	'NO',	1),
(1276,	82,	'Upper East Region',	'UE',	1),
(1277,	82,	'Upper West Region',	'UW',	1),
(1278,	82,	'Volta Region',	'VO',	1),
(1279,	82,	'Western Region',	'WE',	1),
(1280,	84,	'Attica',	'AT',	1),
(1281,	84,	'Central Greece',	'CN',	1),
(1282,	84,	'Central Macedonia',	'CM',	1),
(1283,	84,	'Crete',	'CR',	1),
(1284,	84,	'East Macedonia and Thrace',	'EM',	1),
(1285,	84,	'Epirus',	'EP',	1),
(1286,	84,	'Ionian Islands',	'II',	1),
(1287,	84,	'North Aegean',	'NA',	1),
(1288,	84,	'Peloponnesos',	'PP',	1),
(1289,	84,	'South Aegean',	'SA',	1),
(1290,	84,	'Thessaly',	'TH',	1),
(1291,	84,	'West Greece',	'WG',	1),
(1292,	84,	'West Macedonia',	'WM',	1),
(1293,	85,	'Avannaa',	'A',	1),
(1294,	85,	'Tunu',	'T',	1),
(1295,	85,	'Kitaa',	'K',	1),
(1296,	86,	'Saint Andrew',	'A',	1),
(1297,	86,	'Saint David',	'D',	1),
(1298,	86,	'Saint George',	'G',	1),
(1299,	86,	'Saint John',	'J',	1),
(1300,	86,	'Saint Mark',	'M',	1),
(1301,	86,	'Saint Patrick',	'P',	1),
(1302,	86,	'Carriacou',	'C',	1),
(1303,	86,	'Petit Martinique',	'Q',	1),
(1304,	89,	'Alta Verapaz',	'AV',	1),
(1305,	89,	'Baja Verapaz',	'BV',	1),
(1306,	89,	'Chimaltenango',	'CM',	1),
(1307,	89,	'Chiquimula',	'CQ',	1),
(1308,	89,	'El Peten',	'PE',	1),
(1309,	89,	'El Progreso',	'PR',	1),
(1310,	89,	'El Quiche',	'QC',	1),
(1311,	89,	'Escuintla',	'ES',	1),
(1312,	89,	'Guatemala',	'GU',	1),
(1313,	89,	'Huehuetenango',	'HU',	1),
(1314,	89,	'Izabal',	'IZ',	1),
(1315,	89,	'Jalapa',	'JA',	1),
(1316,	89,	'Jutiapa',	'JU',	1),
(1317,	89,	'Quetzaltenango',	'QZ',	1),
(1318,	89,	'Retalhuleu',	'RE',	1),
(1319,	89,	'Sacatepequez',	'ST',	1),
(1320,	89,	'San Marcos',	'SM',	1),
(1321,	89,	'Santa Rosa',	'SR',	1),
(1322,	89,	'Solola',	'SO',	1),
(1323,	89,	'Suchitepequez',	'SU',	1),
(1324,	89,	'Totonicapan',	'TO',	1),
(1325,	89,	'Zacapa',	'ZA',	1),
(1326,	90,	'Conakry',	'CNK',	1),
(1327,	90,	'Beyla',	'BYL',	1),
(1328,	90,	'Boffa',	'BFA',	1),
(1329,	90,	'Boke',	'BOK',	1),
(1330,	90,	'Coyah',	'COY',	1),
(1331,	90,	'Dabola',	'DBL',	1),
(1332,	90,	'Dalaba',	'DLB',	1),
(1333,	90,	'Dinguiraye',	'DGR',	1),
(1334,	90,	'Dubreka',	'DBR',	1),
(1335,	90,	'Faranah',	'FRN',	1),
(1336,	90,	'Forecariah',	'FRC',	1),
(1337,	90,	'Fria',	'FRI',	1),
(1338,	90,	'Gaoual',	'GAO',	1),
(1339,	90,	'Gueckedou',	'GCD',	1),
(1340,	90,	'Kankan',	'KNK',	1),
(1341,	90,	'Kerouane',	'KRN',	1),
(1342,	90,	'Kindia',	'KND',	1),
(1343,	90,	'Kissidougou',	'KSD',	1),
(1344,	90,	'Koubia',	'KBA',	1),
(1345,	90,	'Koundara',	'KDA',	1),
(1346,	90,	'Kouroussa',	'KRA',	1),
(1347,	90,	'Labe',	'LAB',	1),
(1348,	90,	'Lelouma',	'LLM',	1),
(1349,	90,	'Lola',	'LOL',	1),
(1350,	90,	'Macenta',	'MCT',	1),
(1351,	90,	'Mali',	'MAL',	1),
(1352,	90,	'Mamou',	'MAM',	1),
(1353,	90,	'Mandiana',	'MAN',	1),
(1354,	90,	'Nzerekore',	'NZR',	1),
(1355,	90,	'Pita',	'PIT',	1),
(1356,	90,	'Siguiri',	'SIG',	1),
(1357,	90,	'Telimele',	'TLM',	1),
(1358,	90,	'Tougue',	'TOG',	1),
(1359,	90,	'Yomou',	'YOM',	1),
(1360,	91,	'Bafata Region',	'BF',	1),
(1361,	91,	'Biombo Region',	'BB',	1),
(1362,	91,	'Bissau Region',	'BS',	1),
(1363,	91,	'Bolama Region',	'BL',	1),
(1364,	91,	'Cacheu Region',	'CA',	1),
(1365,	91,	'Gabu Region',	'GA',	1),
(1366,	91,	'Oio Region',	'OI',	1),
(1367,	91,	'Quinara Region',	'QU',	1),
(1368,	91,	'Tombali Region',	'TO',	1),
(1369,	92,	'Barima-Waini',	'BW',	1),
(1370,	92,	'Cuyuni-Mazaruni',	'CM',	1),
(1371,	92,	'Demerara-Mahaica',	'DM',	1),
(1372,	92,	'East Berbice-Corentyne',	'EC',	1),
(1373,	92,	'Essequibo Islands-West Demerara',	'EW',	1),
(1374,	92,	'Mahaica-Berbice',	'MB',	1),
(1375,	92,	'Pomeroon-Supenaam',	'PM',	1),
(1376,	92,	'Potaro-Siparuni',	'PI',	1),
(1377,	92,	'Upper Demerara-Berbice',	'UD',	1),
(1378,	92,	'Upper Takutu-Upper Essequibo',	'UT',	1),
(1379,	93,	'Artibonite',	'AR',	1),
(1380,	93,	'Centre',	'CE',	1),
(1381,	93,	'Grand\'Anse',	'GA',	1),
(1382,	93,	'Nord',	'ND',	1),
(1383,	93,	'Nord-Est',	'NE',	1),
(1384,	93,	'Nord-Ouest',	'NO',	1),
(1385,	93,	'Ouest',	'OU',	1),
(1386,	93,	'Sud',	'SD',	1),
(1387,	93,	'Sud-Est',	'SE',	1),
(1388,	94,	'Flat Island',	'F',	1),
(1389,	94,	'McDonald Island',	'M',	1),
(1390,	94,	'Shag Island',	'S',	1),
(1391,	94,	'Heard Island',	'H',	1),
(1392,	95,	'Atlantida',	'AT',	1),
(1393,	95,	'Choluteca',	'CH',	1),
(1394,	95,	'Colon',	'CL',	1),
(1395,	95,	'Comayagua',	'CM',	1),
(1396,	95,	'Copan',	'CP',	1),
(1397,	95,	'Cortes',	'CR',	1),
(1398,	95,	'El Paraiso',	'PA',	1),
(1399,	95,	'Francisco Morazan',	'FM',	1),
(1400,	95,	'Gracias a Dios',	'GD',	1),
(1401,	95,	'Intibuca',	'IN',	1),
(1402,	95,	'Islas de la Bahia (Bay Islands)',	'IB',	1),
(1403,	95,	'La Paz',	'PZ',	1),
(1404,	95,	'Lempira',	'LE',	1),
(1405,	95,	'Ocotepeque',	'OC',	1),
(1406,	95,	'Olancho',	'OL',	1),
(1407,	95,	'Santa Barbara',	'SB',	1),
(1408,	95,	'Valle',	'VA',	1),
(1409,	95,	'Yoro',	'YO',	1),
(1410,	96,	'Central and Western Hong Kong Island',	'HCW',	1),
(1411,	96,	'Eastern Hong Kong Island',	'HEA',	1),
(1412,	96,	'Southern Hong Kong Island',	'HSO',	1),
(1413,	96,	'Wan Chai Hong Kong Island',	'HWC',	1),
(1414,	96,	'Kowloon City Kowloon',	'KKC',	1),
(1415,	96,	'Kwun Tong Kowloon',	'KKT',	1),
(1416,	96,	'Sham Shui Po Kowloon',	'KSS',	1),
(1417,	96,	'Wong Tai Sin Kowloon',	'KWT',	1),
(1418,	96,	'Yau Tsim Mong Kowloon',	'KYT',	1),
(1419,	96,	'Islands New Territories',	'NIS',	1),
(1420,	96,	'Kwai Tsing New Territories',	'NKT',	1),
(1421,	96,	'North New Territories',	'NNO',	1),
(1422,	96,	'Sai Kung New Territories',	'NSK',	1),
(1423,	96,	'Sha Tin New Territories',	'NST',	1),
(1424,	96,	'Tai Po New Territories',	'NTP',	1),
(1425,	96,	'Tsuen Wan New Territories',	'NTW',	1),
(1426,	96,	'Tuen Mun New Territories',	'NTM',	1),
(1427,	96,	'Yuen Long New Territories',	'NYL',	1),
(1428,	97,	'Bacs-Kiskun',	'BK',	1),
(1429,	97,	'Baranya',	'BA',	1),
(1430,	97,	'Bekes',	'BE',	1),
(1431,	97,	'Bekescsaba',	'BS',	1),
(1432,	97,	'Borsod-Abauj-Zemplen',	'BZ',	1),
(1433,	97,	'Budapest',	'BU',	1),
(1434,	97,	'Csongrad',	'CS',	1),
(1435,	97,	'Debrecen',	'DE',	1),
(1436,	97,	'Dunaujvaros',	'DU',	1),
(1437,	97,	'Eger',	'EG',	1),
(1438,	97,	'Fejer',	'FE',	1),
(1439,	97,	'Gyor',	'GY',	1),
(1440,	97,	'Gyor-Moson-Sopron',	'GM',	1),
(1441,	97,	'Hajdu-Bihar',	'HB',	1),
(1442,	97,	'Heves',	'HE',	1),
(1443,	97,	'Hodmezovasarhely',	'HO',	1),
(1444,	97,	'Jasz-Nagykun-Szolnok',	'JN',	1),
(1445,	97,	'Kaposvar',	'KA',	1),
(1446,	97,	'Kecskemet',	'KE',	1),
(1447,	97,	'Komarom-Esztergom',	'KO',	1),
(1448,	97,	'Miskolc',	'MI',	1),
(1449,	97,	'Nagykanizsa',	'NA',	1),
(1450,	97,	'Nograd',	'NO',	1),
(1451,	97,	'Nyiregyhaza',	'NY',	1),
(1452,	97,	'Pecs',	'PE',	1),
(1453,	97,	'Pest',	'PS',	1),
(1454,	97,	'Somogy',	'SO',	1),
(1455,	97,	'Sopron',	'SP',	1),
(1456,	97,	'Szabolcs-Szatmar-Bereg',	'SS',	1),
(1457,	97,	'Szeged',	'SZ',	1),
(1458,	97,	'Szekesfehervar',	'SE',	1),
(1459,	97,	'Szolnok',	'SL',	1),
(1460,	97,	'Szombathely',	'SM',	1),
(1461,	97,	'Tatabanya',	'TA',	1),
(1462,	97,	'Tolna',	'TO',	1),
(1463,	97,	'Vas',	'VA',	1),
(1464,	97,	'Veszprem',	'VE',	1),
(1465,	97,	'Zala',	'ZA',	1),
(1466,	97,	'Zalaegerszeg',	'ZZ',	1),
(1467,	98,	'Austurland',	'AL',	1),
(1468,	98,	'Hofuoborgarsvaeoi',	'HF',	1),
(1469,	98,	'Norourland eystra',	'NE',	1),
(1470,	98,	'Norourland vestra',	'NV',	1),
(1471,	98,	'Suourland',	'SL',	1),
(1472,	98,	'Suournes',	'SN',	1),
(1473,	98,	'Vestfiroir',	'VF',	1),
(1474,	98,	'Vesturland',	'VL',	1),
(1475,	99,	'Andaman and Nicobar Islands',	'AN',	1),
(1476,	99,	'Andhra Pradesh',	'AP',	1),
(1477,	99,	'Arunachal Pradesh',	'AR',	1),
(1478,	99,	'Assam',	'AS',	1),
(1479,	99,	'Bihar',	'BI',	1),
(1480,	99,	'Chandigarh',	'CH',	1),
(1481,	99,	'Dadra and Nagar Haveli',	'DA',	1),
(1482,	99,	'Daman and Diu',	'DM',	1),
(1483,	99,	'Delhi',	'DE',	1),
(1484,	99,	'Goa',	'GO',	1),
(1485,	99,	'Gujarat',	'GU',	1),
(1486,	99,	'Haryana',	'HA',	1),
(1487,	99,	'Himachal Pradesh',	'HP',	1),
(1488,	99,	'Jammu and Kashmir',	'JA',	1),
(1489,	99,	'Karnataka',	'KA',	1),
(1490,	99,	'Kerala',	'KE',	1),
(1491,	99,	'Lakshadweep Islands',	'LI',	1),
(1492,	99,	'Madhya Pradesh',	'MP',	1),
(1493,	99,	'Maharashtra',	'MA',	1),
(1494,	99,	'Manipur',	'MN',	1),
(1495,	99,	'Meghalaya',	'ME',	1),
(1496,	99,	'Mizoram',	'MI',	1),
(1497,	99,	'Nagaland',	'NA',	1),
(1498,	99,	'Orissa',	'OR',	1),
(1499,	99,	'Pondicherry',	'PO',	1),
(1500,	99,	'Punjab',	'PU',	1),
(1501,	99,	'Rajasthan',	'RA',	1),
(1502,	99,	'Sikkim',	'SI',	1),
(1503,	99,	'Tamil Nadu',	'TN',	1),
(1504,	99,	'Tripura',	'TR',	1),
(1505,	99,	'Uttar Pradesh',	'UP',	1),
(1506,	99,	'West Bengal',	'WB',	1),
(1507,	100,	'Aceh',	'AC',	1),
(1508,	100,	'Bali',	'BA',	1),
(1509,	100,	'Banten',	'BT',	1),
(1510,	100,	'Bengkulu',	'BE',	1),
(1511,	100,	'BoDeTaBek',	'BD',	1),
(1512,	100,	'Gorontalo',	'GO',	1),
(1513,	100,	'Jakarta Raya',	'JK',	1),
(1514,	100,	'Jambi',	'JA',	1),
(1515,	100,	'Jawa Barat',	'JB',	1),
(1516,	100,	'Jawa Tengah',	'JT',	1),
(1517,	100,	'Jawa Timur',	'JI',	1),
(1518,	100,	'Kalimantan Barat',	'KB',	1),
(1519,	100,	'Kalimantan Selatan',	'KS',	1),
(1520,	100,	'Kalimantan Tengah',	'KT',	1),
(1521,	100,	'Kalimantan Timur',	'KI',	1),
(1522,	100,	'Kepulauan Bangka Belitung',	'BB',	1),
(1523,	100,	'Lampung',	'LA',	1),
(1524,	100,	'Maluku',	'MA',	1),
(1525,	100,	'Maluku Utara',	'MU',	1),
(1526,	100,	'Nusa Tenggara Barat',	'NB',	1),
(1527,	100,	'Nusa Tenggara Timur',	'NT',	1),
(1528,	100,	'Papua',	'PA',	1),
(1529,	100,	'Riau',	'RI',	1),
(1530,	100,	'Sulawesi Selatan',	'SN',	1),
(1531,	100,	'Sulawesi Tengah',	'ST',	1),
(1532,	100,	'Sulawesi Tenggara',	'SG',	1),
(1533,	100,	'Sulawesi Utara',	'SA',	1),
(1534,	100,	'Sumatera Barat',	'SB',	1),
(1535,	100,	'Sumatera Selatan',	'SS',	1),
(1536,	100,	'Sumatera Utara',	'SU',	1),
(1537,	100,	'Yogyakarta',	'YO',	1),
(1538,	101,	'Tehran',	'TEH',	1),
(1539,	101,	'Qom',	'QOM',	1),
(1540,	101,	'Markazi',	'MKZ',	1),
(1541,	101,	'Qazvin',	'QAZ',	1),
(1542,	101,	'Gilan',	'GIL',	1),
(1543,	101,	'Ardabil',	'ARD',	1),
(1544,	101,	'Zanjan',	'ZAN',	1),
(1545,	101,	'East Azarbaijan',	'EAZ',	1),
(1546,	101,	'West Azarbaijan',	'WEZ',	1),
(1547,	101,	'Kurdistan',	'KRD',	1),
(1548,	101,	'Hamadan',	'HMD',	1),
(1549,	101,	'Kermanshah',	'KRM',	1),
(1550,	101,	'Ilam',	'ILM',	1),
(1551,	101,	'Lorestan',	'LRS',	1),
(1552,	101,	'Khuzestan',	'KZT',	1),
(1553,	101,	'Chahar Mahaal and Bakhtiari',	'CMB',	1),
(1554,	101,	'Kohkiluyeh and Buyer Ahmad',	'KBA',	1),
(1555,	101,	'Bushehr',	'BSH',	1),
(1556,	101,	'Fars',	'FAR',	1),
(1557,	101,	'Hormozgan',	'HRM',	1),
(1558,	101,	'Sistan and Baluchistan',	'SBL',	1),
(1559,	101,	'Kerman',	'KRB',	1),
(1560,	101,	'Yazd',	'YZD',	1),
(1561,	101,	'Esfahan',	'EFH',	1),
(1562,	101,	'Semnan',	'SMN',	1),
(1563,	101,	'Mazandaran',	'MZD',	1),
(1564,	101,	'Golestan',	'GLS',	1),
(1565,	101,	'North Khorasan',	'NKH',	1),
(1566,	101,	'Razavi Khorasan',	'RKH',	1),
(1567,	101,	'South Khorasan',	'SKH',	1),
(1568,	102,	'Baghdad',	'BD',	1),
(1569,	102,	'Salah ad Din',	'SD',	1),
(1570,	102,	'Diyala',	'DY',	1),
(1571,	102,	'Wasit',	'WS',	1),
(1572,	102,	'Maysan',	'MY',	1),
(1573,	102,	'Al Basrah',	'BA',	1),
(1574,	102,	'Dhi Qar',	'DQ',	1),
(1575,	102,	'Al Muthanna',	'MU',	1),
(1576,	102,	'Al Qadisyah',	'QA',	1),
(1577,	102,	'Babil',	'BB',	1),
(1578,	102,	'Al Karbala',	'KB',	1),
(1579,	102,	'An Najaf',	'NJ',	1),
(1580,	102,	'Al Anbar',	'AB',	1),
(1581,	102,	'Ninawa',	'NN',	1),
(1582,	102,	'Dahuk',	'DH',	1),
(1583,	102,	'Arbil',	'AL',	1),
(1584,	102,	'At Ta\'mim',	'TM',	1),
(1585,	102,	'As Sulaymaniyah',	'SL',	1),
(1586,	103,	'Carlow',	'CA',	1),
(1587,	103,	'Cavan',	'CV',	1),
(1588,	103,	'Clare',	'CL',	1),
(1589,	103,	'Cork',	'CO',	1),
(1590,	103,	'Donegal',	'DO',	1),
(1591,	103,	'Dublin',	'DU',	1),
(1592,	103,	'Galway',	'GA',	1),
(1593,	103,	'Kerry',	'KE',	1),
(1594,	103,	'Kildare',	'KI',	1),
(1595,	103,	'Kilkenny',	'KL',	1),
(1596,	103,	'Laois',	'LA',	1),
(1597,	103,	'Leitrim',	'LE',	1),
(1598,	103,	'Limerick',	'LI',	1),
(1599,	103,	'Longford',	'LO',	1),
(1600,	103,	'Louth',	'LU',	1),
(1601,	103,	'Mayo',	'MA',	1),
(1602,	103,	'Meath',	'ME',	1),
(1603,	103,	'Monaghan',	'MO',	1),
(1604,	103,	'Offaly',	'OF',	1),
(1605,	103,	'Roscommon',	'RO',	1),
(1606,	103,	'Sligo',	'SL',	1),
(1607,	103,	'Tipperary',	'TI',	1),
(1608,	103,	'Waterford',	'WA',	1),
(1609,	103,	'Westmeath',	'WE',	1),
(1610,	103,	'Wexford',	'WX',	1),
(1611,	103,	'Wicklow',	'WI',	1),
(1612,	104,	'Be\'er Sheva',	'BS',	1),
(1613,	104,	'Bika\'at Hayarden',	'BH',	1),
(1614,	104,	'Eilat and Arava',	'EA',	1),
(1615,	104,	'Galil',	'GA',	1),
(1616,	104,	'Haifa',	'HA',	1),
(1617,	104,	'Jehuda Mountains',	'JM',	1),
(1618,	104,	'Jerusalem',	'JE',	1),
(1619,	104,	'Negev',	'NE',	1),
(1620,	104,	'Semaria',	'SE',	1),
(1621,	104,	'Sharon',	'SH',	1),
(1622,	104,	'Tel Aviv (Gosh Dan)',	'TA',	1),
(3860,	105,	'Caltanissetta',	'CL',	1),
(3842,	105,	'Agrigento',	'AG',	1),
(3843,	105,	'Alessandria',	'AL',	1),
(3844,	105,	'Ancona',	'AN',	1),
(3845,	105,	'Aosta',	'AO',	1),
(3846,	105,	'Arezzo',	'AR',	1),
(3847,	105,	'Ascoli Piceno',	'AP',	1),
(3848,	105,	'Asti',	'AT',	1),
(3849,	105,	'Avellino',	'AV',	1),
(3850,	105,	'Bari',	'BA',	1),
(3851,	105,	'Belluno',	'BL',	1),
(3852,	105,	'Benevento',	'BN',	1),
(3853,	105,	'Bergamo',	'BG',	1),
(3854,	105,	'Biella',	'BI',	1),
(3855,	105,	'Bologna',	'BO',	1),
(3856,	105,	'Bolzano',	'BZ',	1),
(3857,	105,	'Brescia',	'BS',	1),
(3858,	105,	'Brindisi',	'BR',	1),
(3859,	105,	'Cagliari',	'CA',	1),
(1643,	106,	'Clarendon Parish',	'CLA',	1),
(1644,	106,	'Hanover Parish',	'HAN',	1),
(1645,	106,	'Kingston Parish',	'KIN',	1),
(1646,	106,	'Manchester Parish',	'MAN',	1),
(1647,	106,	'Portland Parish',	'POR',	1),
(1648,	106,	'Saint Andrew Parish',	'AND',	1),
(1649,	106,	'Saint Ann Parish',	'ANN',	1),
(1650,	106,	'Saint Catherine Parish',	'CAT',	1),
(1651,	106,	'Saint Elizabeth Parish',	'ELI',	1),
(1652,	106,	'Saint James Parish',	'JAM',	1),
(1653,	106,	'Saint Mary Parish',	'MAR',	1),
(1654,	106,	'Saint Thomas Parish',	'THO',	1),
(1655,	106,	'Trelawny Parish',	'TRL',	1),
(1656,	106,	'Westmoreland Parish',	'WML',	1),
(1657,	107,	'Aichi',	'AI',	1),
(1658,	107,	'Akita',	'AK',	1),
(1659,	107,	'Aomori',	'AO',	1),
(1660,	107,	'Chiba',	'CH',	1),
(1661,	107,	'Ehime',	'EH',	1),
(1662,	107,	'Fukui',	'FK',	1),
(1663,	107,	'Fukuoka',	'FU',	1),
(1664,	107,	'Fukushima',	'FS',	1),
(1665,	107,	'Gifu',	'GI',	1),
(1666,	107,	'Gumma',	'GU',	1),
(1667,	107,	'Hiroshima',	'HI',	1),
(1668,	107,	'Hokkaido',	'HO',	1),
(1669,	107,	'Hyogo',	'HY',	1),
(1670,	107,	'Ibaraki',	'IB',	1),
(1671,	107,	'Ishikawa',	'IS',	1),
(1672,	107,	'Iwate',	'IW',	1),
(1673,	107,	'Kagawa',	'KA',	1),
(1674,	107,	'Kagoshima',	'KG',	1),
(1675,	107,	'Kanagawa',	'KN',	1),
(1676,	107,	'Kochi',	'KO',	1),
(1677,	107,	'Kumamoto',	'KU',	1),
(1678,	107,	'Kyoto',	'KY',	1),
(1679,	107,	'Mie',	'MI',	1),
(1680,	107,	'Miyagi',	'MY',	1),
(1681,	107,	'Miyazaki',	'MZ',	1),
(1682,	107,	'Nagano',	'NA',	1),
(1683,	107,	'Nagasaki',	'NG',	1),
(1684,	107,	'Nara',	'NR',	1),
(1685,	107,	'Niigata',	'NI',	1),
(1686,	107,	'Oita',	'OI',	1),
(1687,	107,	'Okayama',	'OK',	1),
(1688,	107,	'Okinawa',	'ON',	1),
(1689,	107,	'Osaka',	'OS',	1),
(1690,	107,	'Saga',	'SA',	1),
(1691,	107,	'Saitama',	'SI',	1),
(1692,	107,	'Shiga',	'SH',	1),
(1693,	107,	'Shimane',	'SM',	1),
(1694,	107,	'Shizuoka',	'SZ',	1),
(1695,	107,	'Tochigi',	'TO',	1),
(1696,	107,	'Tokushima',	'TS',	1),
(1697,	107,	'Tokyo',	'TK',	1),
(1698,	107,	'Tottori',	'TT',	1),
(1699,	107,	'Toyama',	'TY',	1),
(1700,	107,	'Wakayama',	'WA',	1),
(1701,	107,	'Yamagata',	'YA',	1),
(1702,	107,	'Yamaguchi',	'YM',	1),
(1703,	107,	'Yamanashi',	'YN',	1),
(1704,	108,	'\'Amman',	'AM',	1),
(1705,	108,	'Ajlun',	'AJ',	1),
(1706,	108,	'Al \'Aqabah',	'AA',	1),
(1707,	108,	'Al Balqa\'',	'AB',	1),
(1708,	108,	'Al Karak',	'AK',	1),
(1709,	108,	'Al Mafraq',	'AL',	1),
(1710,	108,	'At Tafilah',	'AT',	1),
(1711,	108,	'Az Zarqa\'',	'AZ',	1),
(1712,	108,	'Irbid',	'IR',	1),
(1713,	108,	'Jarash',	'JA',	1),
(1714,	108,	'Ma\'an',	'MA',	1),
(1715,	108,	'Madaba',	'MD',	1),
(1716,	109,	'Алматинская область',	'AL',	1),
(1717,	109,	'Алматы - город республ-го значения',	'AC',	1),
(1718,	109,	'Акмолинская область',	'AM',	1),
(1719,	109,	'Актюбинская область',	'AQ',	1),
(1720,	109,	'Астана - город республ-го значения',	'AS',	1),
(1721,	109,	'Атырауская область',	'AT',	1),
(1722,	109,	'Западно-Казахстанская область',	'BA',	1),
(1723,	109,	'Байконур - город республ-го значения',	'BY',	1),
(1724,	109,	'Мангистауская область',	'MA',	1),
(1725,	109,	'Южно-Казахстанская область',	'ON',	1),
(1726,	109,	'Павлодарская область',	'PA',	1),
(1727,	109,	'Карагандинская область',	'QA',	1),
(1728,	109,	'Костанайская область',	'QO',	1),
(1729,	109,	'Кызылординская область',	'QY',	1),
(1730,	109,	'Восточно-Казахстанская область',	'SH',	1),
(1731,	109,	'Северо-Казахстанская область',	'SO',	1),
(1732,	109,	'Жамбылская область',	'ZH',	1),
(1733,	110,	'Central',	'CE',	1),
(1734,	110,	'Coast',	'CO',	1),
(1735,	110,	'Eastern',	'EA',	1),
(1736,	110,	'Nairobi Area',	'NA',	1),
(1737,	110,	'North Eastern',	'NE',	1),
(1738,	110,	'Nyanza',	'NY',	1),
(1739,	110,	'Rift Valley',	'RV',	1),
(1740,	110,	'Western',	'WE',	1),
(1741,	111,	'Abaiang',	'AG',	1),
(1742,	111,	'Abemama',	'AM',	1),
(1743,	111,	'Aranuka',	'AK',	1),
(1744,	111,	'Arorae',	'AO',	1),
(1745,	111,	'Banaba',	'BA',	1),
(1746,	111,	'Beru',	'BE',	1),
(1747,	111,	'Butaritari',	'bT',	1),
(1748,	111,	'Kanton',	'KA',	1),
(1749,	111,	'Kiritimati',	'KR',	1),
(1750,	111,	'Kuria',	'KU',	1),
(1751,	111,	'Maiana',	'MI',	1),
(1752,	111,	'Makin',	'MN',	1),
(1753,	111,	'Marakei',	'ME',	1),
(1754,	111,	'Nikunau',	'NI',	1),
(1755,	111,	'Nonouti',	'NO',	1),
(1756,	111,	'Onotoa',	'ON',	1),
(1757,	111,	'Tabiteuea',	'TT',	1),
(1758,	111,	'Tabuaeran',	'TR',	1),
(1759,	111,	'Tamana',	'TM',	1),
(1760,	111,	'Tarawa',	'TW',	1),
(1761,	111,	'Teraina',	'TE',	1),
(1762,	112,	'Chagang-do',	'CHA',	1),
(1763,	112,	'Hamgyong-bukto',	'HAB',	1),
(1764,	112,	'Hamgyong-namdo',	'HAN',	1),
(1765,	112,	'Hwanghae-bukto',	'HWB',	1),
(1766,	112,	'Hwanghae-namdo',	'HWN',	1),
(1767,	112,	'Kangwon-do',	'KAN',	1),
(1768,	112,	'P\'yongan-bukto',	'PYB',	1),
(1769,	112,	'P\'yongan-namdo',	'PYN',	1),
(1770,	112,	'Ryanggang-do (Yanggang-do)',	'YAN',	1),
(1771,	112,	'Rason Directly Governed City',	'NAJ',	1),
(1772,	112,	'P\'yongyang Special City',	'PYO',	1),
(1773,	113,	'Ch\'ungch\'ong-bukto',	'CO',	1),
(1774,	113,	'Ch\'ungch\'ong-namdo',	'CH',	1),
(1775,	113,	'Cheju-do',	'CD',	1),
(1776,	113,	'Cholla-bukto',	'CB',	1),
(1777,	113,	'Cholla-namdo',	'CN',	1),
(1778,	113,	'Inch\'on-gwangyoksi',	'IG',	1),
(1779,	113,	'Kangwon-do',	'KA',	1),
(1780,	113,	'Kwangju-gwangyoksi',	'KG',	1),
(1781,	113,	'Kyonggi-do',	'KD',	1),
(1782,	113,	'Kyongsang-bukto',	'KB',	1),
(1783,	113,	'Kyongsang-namdo',	'KN',	1),
(1784,	113,	'Pusan-gwangyoksi',	'PG',	1),
(1785,	113,	'Soul-t\'ukpyolsi',	'SO',	1),
(1786,	113,	'Taegu-gwangyoksi',	'TA',	1),
(1787,	113,	'Taejon-gwangyoksi',	'TG',	1),
(1788,	114,	'Al \'Asimah',	'AL',	1),
(1789,	114,	'Al Ahmadi',	'AA',	1),
(1790,	114,	'Al Farwaniyah',	'AF',	1),
(1791,	114,	'Al Jahra\'',	'AJ',	1),
(1792,	114,	'Hawalli',	'HA',	1),
(1793,	115,	'Bishkek',	'GB',	1),
(1794,	115,	'Batken',	'B',	1),
(1795,	115,	'Chu',	'C',	1),
(1796,	115,	'Jalal-Abad',	'J',	1),
(1797,	115,	'Naryn',	'N',	1),
(1798,	115,	'Osh',	'O',	1),
(1799,	115,	'Talas',	'T',	1),
(1800,	115,	'Ysyk-Kol',	'Y',	1),
(1801,	116,	'Vientiane',	'VT',	1),
(1802,	116,	'Attapu',	'AT',	1),
(1803,	116,	'Bokeo',	'BK',	1),
(1804,	116,	'Bolikhamxai',	'BL',	1),
(1805,	116,	'Champasak',	'CH',	1),
(1806,	116,	'Houaphan',	'HO',	1),
(1807,	116,	'Khammouan',	'KH',	1),
(1808,	116,	'Louang Namtha',	'LM',	1),
(1809,	116,	'Louangphabang',	'LP',	1),
(1810,	116,	'Oudomxai',	'OU',	1),
(1811,	116,	'Phongsali',	'PH',	1),
(1812,	116,	'Salavan',	'SL',	1),
(1813,	116,	'Savannakhet',	'SV',	1),
(1814,	116,	'Vientiane',	'VI',	1),
(1815,	116,	'Xaignabouli',	'XA',	1),
(1816,	116,	'Xekong',	'XE',	1),
(1817,	116,	'Xiangkhoang',	'XI',	1),
(1818,	116,	'Xaisomboun',	'XN',	1),
(1819,	117,	'Aizkraukles Rajons',	'AIZ',	1),
(1820,	117,	'Aluksnes Rajons',	'ALU',	1),
(1821,	117,	'Balvu Rajons',	'BAL',	1),
(1822,	117,	'Bauskas Rajons',	'BAU',	1),
(1823,	117,	'Cesu Rajons',	'CES',	1),
(1824,	117,	'Daugavpils Rajons',	'DGR',	1),
(1825,	117,	'Dobeles Rajons',	'DOB',	1),
(1826,	117,	'Gulbenes Rajons',	'GUL',	1),
(1827,	117,	'Jekabpils Rajons',	'JEK',	1),
(1828,	117,	'Jelgavas Rajons',	'JGR',	1),
(1829,	117,	'Kraslavas Rajons',	'KRA',	1),
(1830,	117,	'Kuldigas Rajons',	'KUL',	1),
(1831,	117,	'Liepajas Rajons',	'LPR',	1),
(1832,	117,	'Limbazu Rajons',	'LIM',	1),
(1833,	117,	'Ludzas Rajons',	'LUD',	1),
(1834,	117,	'Madonas Rajons',	'MAD',	1),
(1835,	117,	'Ogres Rajons',	'OGR',	1),
(1836,	117,	'Preilu Rajons',	'PRE',	1),
(1837,	117,	'Rezeknes Rajons',	'RZR',	1),
(1838,	117,	'Rigas Rajons',	'RGR',	1),
(1839,	117,	'Saldus Rajons',	'SAL',	1),
(1840,	117,	'Talsu Rajons',	'TAL',	1),
(1841,	117,	'Tukuma Rajons',	'TUK',	1),
(1842,	117,	'Valkas Rajons',	'VLK',	1),
(1843,	117,	'Valmieras Rajons',	'VLM',	1),
(1844,	117,	'Ventspils Rajons',	'VSR',	1),
(1845,	117,	'Daugavpils',	'DGV',	1),
(1846,	117,	'Jelgava',	'JGV',	1),
(1847,	117,	'Jurmala',	'JUR',	1),
(1848,	117,	'Liepaja',	'LPK',	1),
(1849,	117,	'Rezekne',	'RZK',	1),
(1850,	117,	'Riga',	'RGA',	1),
(1851,	117,	'Ventspils',	'VSL',	1),
(1852,	119,	'Berea',	'BE',	1),
(1853,	119,	'Butha-Buthe',	'BB',	1),
(1854,	119,	'Leribe',	'LE',	1),
(1855,	119,	'Mafeteng',	'MF',	1),
(1856,	119,	'Maseru',	'MS',	1),
(1857,	119,	'Mohale\'s Hoek',	'MH',	1),
(1858,	119,	'Mokhotlong',	'MK',	1),
(1859,	119,	'Qacha\'s Nek',	'QN',	1),
(1860,	119,	'Quthing',	'QT',	1),
(1861,	119,	'Thaba-Tseka',	'TT',	1),
(1862,	120,	'Bomi',	'BI',	1),
(1863,	120,	'Bong',	'BG',	1),
(1864,	120,	'Grand Bassa',	'GB',	1),
(1865,	120,	'Grand Cape Mount',	'CM',	1),
(1866,	120,	'Grand Gedeh',	'GG',	1),
(1867,	120,	'Grand Kru',	'GK',	1),
(1868,	120,	'Lofa',	'LO',	1),
(1869,	120,	'Margibi',	'MG',	1),
(1870,	120,	'Maryland',	'ML',	1),
(1871,	120,	'Montserrado',	'MS',	1),
(1872,	120,	'Nimba',	'NB',	1),
(1873,	120,	'River Cess',	'RC',	1),
(1874,	120,	'Sinoe',	'SN',	1),
(1875,	121,	'Ajdabiya',	'AJ',	1),
(1876,	121,	'Al \'Aziziyah',	'AZ',	1),
(1877,	121,	'Al Fatih',	'FA',	1),
(1878,	121,	'Al Jabal al Akhdar',	'JA',	1),
(1879,	121,	'Al Jufrah',	'JU',	1),
(1880,	121,	'Al Khums',	'KH',	1),
(1881,	121,	'Al Kufrah',	'KU',	1),
(1882,	121,	'An Nuqat al Khams',	'NK',	1),
(1883,	121,	'Ash Shati\'',	'AS',	1),
(1884,	121,	'Awbari',	'AW',	1),
(1885,	121,	'Az Zawiyah',	'ZA',	1),
(1886,	121,	'Banghazi',	'BA',	1),
(1887,	121,	'Darnah',	'DA',	1),
(1888,	121,	'Ghadamis',	'GD',	1),
(1889,	121,	'Gharyan',	'GY',	1),
(1890,	121,	'Misratah',	'MI',	1),
(1891,	121,	'Murzuq',	'MZ',	1),
(1892,	121,	'Sabha',	'SB',	1),
(1893,	121,	'Sawfajjin',	'SW',	1),
(1894,	121,	'Surt',	'SU',	1),
(1895,	121,	'Tarabulus (Tripoli)',	'TL',	1),
(1896,	121,	'Tarhunah',	'TH',	1),
(1897,	121,	'Tubruq',	'TU',	1),
(1898,	121,	'Yafran',	'YA',	1),
(1899,	121,	'Zlitan',	'ZL',	1),
(1900,	122,	'Vaduz',	'V',	1),
(1901,	122,	'Schaan',	'A',	1),
(1902,	122,	'Balzers',	'B',	1),
(1903,	122,	'Triesen',	'N',	1),
(1904,	122,	'Eschen',	'E',	1),
(1905,	122,	'Mauren',	'M',	1),
(1906,	122,	'Triesenberg',	'T',	1),
(1907,	122,	'Ruggell',	'R',	1),
(1908,	122,	'Gamprin',	'G',	1),
(1909,	122,	'Schellenberg',	'L',	1),
(1910,	122,	'Planken',	'P',	1),
(1911,	123,	'Alytus',	'AL',	1),
(1912,	123,	'Kaunas',	'KA',	1),
(1913,	123,	'Klaipeda',	'KL',	1),
(1914,	123,	'Marijampole',	'MA',	1),
(1915,	123,	'Panevezys',	'PA',	1),
(1916,	123,	'Siauliai',	'SI',	1),
(1917,	123,	'Taurage',	'TA',	1),
(1918,	123,	'Telsiai',	'TE',	1),
(1919,	123,	'Utena',	'UT',	1),
(1920,	123,	'Vilnius',	'VI',	1),
(1921,	124,	'Diekirch',	'DD',	1),
(1922,	124,	'Clervaux',	'DC',	1),
(1923,	124,	'Redange',	'DR',	1),
(1924,	124,	'Vianden',	'DV',	1),
(1925,	124,	'Wiltz',	'DW',	1),
(1926,	124,	'Grevenmacher',	'GG',	1),
(1927,	124,	'Echternach',	'GE',	1),
(1928,	124,	'Remich',	'GR',	1),
(1929,	124,	'Luxembourg',	'LL',	1),
(1930,	124,	'Capellen',	'LC',	1),
(1931,	124,	'Esch-sur-Alzette',	'LE',	1),
(1932,	124,	'Mersch',	'LM',	1),
(1933,	125,	'Our Lady Fatima Parish',	'OLF',	1),
(1934,	125,	'St. Anthony Parish',	'ANT',	1),
(1935,	125,	'St. Lazarus Parish',	'LAZ',	1),
(1936,	125,	'Cathedral Parish',	'CAT',	1),
(1937,	125,	'St. Lawrence Parish',	'LAW',	1),
(1938,	127,	'Antananarivo',	'AN',	1),
(1939,	127,	'Antsiranana',	'AS',	1),
(1940,	127,	'Fianarantsoa',	'FN',	1),
(1941,	127,	'Mahajanga',	'MJ',	1),
(1942,	127,	'Toamasina',	'TM',	1),
(1943,	127,	'Toliara',	'TL',	1),
(1944,	128,	'Balaka',	'BLK',	1),
(1945,	128,	'Blantyre',	'BLT',	1),
(1946,	128,	'Chikwawa',	'CKW',	1),
(1947,	128,	'Chiradzulu',	'CRD',	1),
(1948,	128,	'Chitipa',	'CTP',	1),
(1949,	128,	'Dedza',	'DDZ',	1),
(1950,	128,	'Dowa',	'DWA',	1),
(1951,	128,	'Karonga',	'KRG',	1),
(1952,	128,	'Kasungu',	'KSG',	1),
(1953,	128,	'Likoma',	'LKM',	1),
(1954,	128,	'Lilongwe',	'LLG',	1),
(1955,	128,	'Machinga',	'MCG',	1),
(1956,	128,	'Mangochi',	'MGC',	1),
(1957,	128,	'Mchinji',	'MCH',	1),
(1958,	128,	'Mulanje',	'MLJ',	1),
(1959,	128,	'Mwanza',	'MWZ',	1),
(1960,	128,	'Mzimba',	'MZM',	1),
(1961,	128,	'Ntcheu',	'NTU',	1),
(1962,	128,	'Nkhata Bay',	'NKB',	1),
(1963,	128,	'Nkhotakota',	'NKH',	1),
(1964,	128,	'Nsanje',	'NSJ',	1),
(1965,	128,	'Ntchisi',	'NTI',	1),
(1966,	128,	'Phalombe',	'PHL',	1),
(1967,	128,	'Rumphi',	'RMP',	1),
(1968,	128,	'Salima',	'SLM',	1),
(1969,	128,	'Thyolo',	'THY',	1),
(1970,	128,	'Zomba',	'ZBA',	1),
(1971,	129,	'Johor',	'JO',	1),
(1972,	129,	'Kedah',	'KE',	1),
(1973,	129,	'Kelantan',	'KL',	1),
(1974,	129,	'Labuan',	'LA',	1),
(1975,	129,	'Melaka',	'ME',	1),
(1976,	129,	'Negeri Sembilan',	'NS',	1),
(1977,	129,	'Pahang',	'PA',	1),
(1978,	129,	'Perak',	'PE',	1),
(1979,	129,	'Perlis',	'PR',	1),
(1980,	129,	'Pulau Pinang',	'PP',	1),
(1981,	129,	'Sabah',	'SA',	1),
(1982,	129,	'Sarawak',	'SR',	1),
(1983,	129,	'Selangor',	'SE',	1),
(1984,	129,	'Terengganu',	'TE',	1),
(1985,	129,	'Wilayah Persekutuan',	'WP',	1),
(1986,	130,	'Thiladhunmathi Uthuru',	'THU',	1),
(1987,	130,	'Thiladhunmathi Dhekunu',	'THD',	1),
(1988,	130,	'Miladhunmadulu Uthuru',	'MLU',	1),
(1989,	130,	'Miladhunmadulu Dhekunu',	'MLD',	1),
(1990,	130,	'Maalhosmadulu Uthuru',	'MAU',	1),
(1991,	130,	'Maalhosmadulu Dhekunu',	'MAD',	1),
(1992,	130,	'Faadhippolhu',	'FAA',	1),
(1993,	130,	'Male Atoll',	'MAA',	1),
(1994,	130,	'Ari Atoll Uthuru',	'AAU',	1),
(1995,	130,	'Ari Atoll Dheknu',	'AAD',	1),
(1996,	130,	'Felidhe Atoll',	'FEA',	1),
(1997,	130,	'Mulaku Atoll',	'MUA',	1),
(1998,	130,	'Nilandhe Atoll Uthuru',	'NAU',	1),
(1999,	130,	'Nilandhe Atoll Dhekunu',	'NAD',	1),
(2000,	130,	'Kolhumadulu',	'KLH',	1),
(2001,	130,	'Hadhdhunmathi',	'HDH',	1),
(2002,	130,	'Huvadhu Atoll Uthuru',	'HAU',	1),
(2003,	130,	'Huvadhu Atoll Dhekunu',	'HAD',	1),
(2004,	130,	'Fua Mulaku',	'FMU',	1),
(2005,	130,	'Addu',	'ADD',	1),
(2006,	131,	'Gao',	'GA',	1),
(2007,	131,	'Kayes',	'KY',	1),
(2008,	131,	'Kidal',	'KD',	1),
(2009,	131,	'Koulikoro',	'KL',	1),
(2010,	131,	'Mopti',	'MP',	1),
(2011,	131,	'Segou',	'SG',	1),
(2012,	131,	'Sikasso',	'SK',	1),
(2013,	131,	'Tombouctou',	'TB',	1),
(2014,	131,	'Bamako Capital District',	'CD',	1),
(2015,	132,	'Attard',	'ATT',	1),
(2016,	132,	'Balzan',	'BAL',	1),
(2017,	132,	'Birgu',	'BGU',	1),
(2018,	132,	'Birkirkara',	'BKK',	1),
(2019,	132,	'Birzebbuga',	'BRZ',	1),
(2020,	132,	'Bormla',	'BOR',	1),
(2021,	132,	'Dingli',	'DIN',	1),
(2022,	132,	'Fgura',	'FGU',	1),
(2023,	132,	'Floriana',	'FLO',	1),
(2024,	132,	'Gudja',	'GDJ',	1),
(2025,	132,	'Gzira',	'GZR',	1),
(2026,	132,	'Gargur',	'GRG',	1),
(2027,	132,	'Gaxaq',	'GXQ',	1),
(2028,	132,	'Hamrun',	'HMR',	1),
(2029,	132,	'Iklin',	'IKL',	1),
(2030,	132,	'Isla',	'ISL',	1),
(2031,	132,	'Kalkara',	'KLK',	1),
(2032,	132,	'Kirkop',	'KRK',	1),
(2033,	132,	'Lija',	'LIJ',	1),
(2034,	132,	'Luqa',	'LUQ',	1),
(2035,	132,	'Marsa',	'MRS',	1),
(2036,	132,	'Marsaskala',	'MKL',	1),
(2037,	132,	'Marsaxlokk',	'MXL',	1),
(2038,	132,	'Mdina',	'MDN',	1),
(2039,	132,	'Melliea',	'MEL',	1),
(2040,	132,	'Mgarr',	'MGR',	1),
(2041,	132,	'Mosta',	'MST',	1),
(2042,	132,	'Mqabba',	'MQA',	1),
(2043,	132,	'Msida',	'MSI',	1),
(2044,	132,	'Mtarfa',	'MTF',	1),
(2045,	132,	'Naxxar',	'NAX',	1),
(2046,	132,	'Paola',	'PAO',	1),
(2047,	132,	'Pembroke',	'PEM',	1),
(2048,	132,	'Pieta',	'PIE',	1),
(2049,	132,	'Qormi',	'QOR',	1),
(2050,	132,	'Qrendi',	'QRE',	1),
(2051,	132,	'Rabat',	'RAB',	1),
(2052,	132,	'Safi',	'SAF',	1),
(2053,	132,	'San Giljan',	'SGI',	1),
(2054,	132,	'Santa Lucija',	'SLU',	1),
(2055,	132,	'San Pawl il-Bahar',	'SPB',	1),
(2056,	132,	'San Gwann',	'SGW',	1),
(2057,	132,	'Santa Venera',	'SVE',	1),
(2058,	132,	'Siggiewi',	'SIG',	1),
(2059,	132,	'Sliema',	'SLM',	1),
(2060,	132,	'Swieqi',	'SWQ',	1),
(2061,	132,	'Ta Xbiex',	'TXB',	1),
(2062,	132,	'Tarxien',	'TRX',	1),
(2063,	132,	'Valletta',	'VLT',	1),
(2064,	132,	'Xgajra',	'XGJ',	1),
(2065,	132,	'Zabbar',	'ZBR',	1),
(2066,	132,	'Zebbug',	'ZBG',	1),
(2067,	132,	'Zejtun',	'ZJT',	1),
(2068,	132,	'Zurrieq',	'ZRQ',	1),
(2069,	132,	'Fontana',	'FNT',	1),
(2070,	132,	'Ghajnsielem',	'GHJ',	1),
(2071,	132,	'Gharb',	'GHR',	1),
(2072,	132,	'Ghasri',	'GHS',	1),
(2073,	132,	'Kercem',	'KRC',	1),
(2074,	132,	'Munxar',	'MUN',	1),
(2075,	132,	'Nadur',	'NAD',	1),
(2076,	132,	'Qala',	'QAL',	1),
(2077,	132,	'Victoria',	'VIC',	1),
(2078,	132,	'San Lawrenz',	'SLA',	1),
(2079,	132,	'Sannat',	'SNT',	1),
(2080,	132,	'Xagra',	'ZAG',	1),
(2081,	132,	'Xewkija',	'XEW',	1),
(2082,	132,	'Zebbug',	'ZEB',	1),
(2083,	133,	'Ailinginae',	'ALG',	1),
(2084,	133,	'Ailinglaplap',	'ALL',	1),
(2085,	133,	'Ailuk',	'ALK',	1),
(2086,	133,	'Arno',	'ARN',	1),
(2087,	133,	'Aur',	'AUR',	1),
(2088,	133,	'Bikar',	'BKR',	1),
(2089,	133,	'Bikini',	'BKN',	1),
(2090,	133,	'Bokak',	'BKK',	1),
(2091,	133,	'Ebon',	'EBN',	1),
(2092,	133,	'Enewetak',	'ENT',	1),
(2093,	133,	'Erikub',	'EKB',	1),
(2094,	133,	'Jabat',	'JBT',	1),
(2095,	133,	'Jaluit',	'JLT',	1),
(2096,	133,	'Jemo',	'JEM',	1),
(2097,	133,	'Kili',	'KIL',	1),
(2098,	133,	'Kwajalein',	'KWJ',	1),
(2099,	133,	'Lae',	'LAE',	1),
(2100,	133,	'Lib',	'LIB',	1),
(2101,	133,	'Likiep',	'LKP',	1),
(2102,	133,	'Majuro',	'MJR',	1),
(2103,	133,	'Maloelap',	'MLP',	1),
(2104,	133,	'Mejit',	'MJT',	1),
(2105,	133,	'Mili',	'MIL',	1),
(2106,	133,	'Namorik',	'NMK',	1),
(2107,	133,	'Namu',	'NAM',	1),
(2108,	133,	'Rongelap',	'RGL',	1),
(2109,	133,	'Rongrik',	'RGK',	1),
(2110,	133,	'Toke',	'TOK',	1),
(2111,	133,	'Ujae',	'UJA',	1),
(2112,	133,	'Ujelang',	'UJL',	1),
(2113,	133,	'Utirik',	'UTK',	1),
(2114,	133,	'Wotho',	'WTH',	1),
(2115,	133,	'Wotje',	'WTJ',	1),
(2116,	135,	'Adrar',	'AD',	1),
(2117,	135,	'Assaba',	'AS',	1),
(2118,	135,	'Brakna',	'BR',	1),
(2119,	135,	'Dakhlet Nouadhibou',	'DN',	1),
(2120,	135,	'Gorgol',	'GO',	1),
(2121,	135,	'Guidimaka',	'GM',	1),
(2122,	135,	'Hodh Ech Chargui',	'HC',	1),
(2123,	135,	'Hodh El Gharbi',	'HG',	1),
(2124,	135,	'Inchiri',	'IN',	1),
(2125,	135,	'Tagant',	'TA',	1),
(2126,	135,	'Tiris Zemmour',	'TZ',	1),
(2127,	135,	'Trarza',	'TR',	1),
(2128,	135,	'Nouakchott',	'NO',	1),
(2129,	136,	'Beau Bassin-Rose Hill',	'BR',	1),
(2130,	136,	'Curepipe',	'CU',	1),
(2131,	136,	'Port Louis',	'PU',	1),
(2132,	136,	'Quatre Bornes',	'QB',	1),
(2133,	136,	'Vacoas-Phoenix',	'VP',	1),
(2134,	136,	'Agalega Islands',	'AG',	1),
(2135,	136,	'Cargados Carajos Shoals (Saint Brandon Islands)',	'CC',	1),
(2136,	136,	'Rodrigues',	'RO',	1),
(2137,	136,	'Black River',	'BL',	1),
(2138,	136,	'Flacq',	'FL',	1),
(2139,	136,	'Grand Port',	'GP',	1),
(2140,	136,	'Moka',	'MO',	1),
(2141,	136,	'Pamplemousses',	'PA',	1),
(2142,	136,	'Plaines Wilhems',	'PW',	1),
(2143,	136,	'Port Louis',	'PL',	1),
(2144,	136,	'Riviere du Rempart',	'RR',	1),
(2145,	136,	'Savanne',	'SA',	1),
(2146,	138,	'Baja California Norte',	'BN',	1),
(2147,	138,	'Baja California Sur',	'BS',	1),
(2148,	138,	'Campeche',	'CA',	1),
(2149,	138,	'Chiapas',	'CI',	1),
(2150,	138,	'Chihuahua',	'CH',	1),
(2151,	138,	'Coahuila de Zaragoza',	'CZ',	1),
(2152,	138,	'Colima',	'CL',	1),
(2153,	138,	'Distrito Federal',	'DF',	1),
(2154,	138,	'Durango',	'DU',	1),
(2155,	138,	'Guanajuato',	'GA',	1),
(2156,	138,	'Guerrero',	'GE',	1),
(2157,	138,	'Hidalgo',	'HI',	1),
(2158,	138,	'Jalisco',	'JA',	1),
(2159,	138,	'Mexico',	'ME',	1),
(2160,	138,	'Michoacan de Ocampo',	'MI',	1),
(2161,	138,	'Morelos',	'MO',	1),
(2162,	138,	'Nayarit',	'NA',	1),
(2163,	138,	'Nuevo Leon',	'NL',	1),
(2164,	138,	'Oaxaca',	'OA',	1),
(2165,	138,	'Puebla',	'PU',	1),
(2166,	138,	'Queretaro de Arteaga',	'QA',	1),
(2167,	138,	'Quintana Roo',	'QR',	1),
(2168,	138,	'San Luis Potosi',	'SA',	1),
(2169,	138,	'Sinaloa',	'SI',	1),
(2170,	138,	'Sonora',	'SO',	1),
(2171,	138,	'Tabasco',	'TB',	1),
(2172,	138,	'Tamaulipas',	'TM',	1),
(2173,	138,	'Tlaxcala',	'TL',	1),
(2174,	138,	'Veracruz-Llave',	'VE',	1),
(2175,	138,	'Yucatan',	'YU',	1),
(2176,	138,	'Zacatecas',	'ZA',	1),
(2177,	139,	'Chuuk',	'C',	1),
(2178,	139,	'Kosrae',	'K',	1),
(2179,	139,	'Pohnpei',	'P',	1),
(2180,	139,	'Yap',	'Y',	1),
(2181,	140,	'Gagauzia',	'GA',	1),
(2182,	140,	'Chisinau',	'CU',	1),
(2183,	140,	'Balti',	'BA',	1),
(2184,	140,	'Cahul',	'CA',	1),
(2185,	140,	'Edinet',	'ED',	1),
(2186,	140,	'Lapusna',	'LA',	1),
(2187,	140,	'Orhei',	'OR',	1),
(2188,	140,	'Soroca',	'SO',	1),
(2189,	140,	'Tighina',	'TI',	1),
(2190,	140,	'Ungheni',	'UN',	1),
(2191,	140,	'St‚nga Nistrului',	'SN',	1),
(2192,	141,	'Fontvieille',	'FV',	1),
(2193,	141,	'La Condamine',	'LC',	1),
(2194,	141,	'Monaco-Ville',	'MV',	1),
(2195,	141,	'Monte-Carlo',	'MC',	1),
(2196,	142,	'Ulanbaatar',	'1',	1),
(2197,	142,	'Orhon',	'035',	1),
(2198,	142,	'Darhan uul',	'037',	1),
(2199,	142,	'Hentiy',	'039',	1),
(2200,	142,	'Hovsgol',	'041',	1),
(2201,	142,	'Hovd',	'043',	1),
(2202,	142,	'Uvs',	'046',	1),
(2203,	142,	'Tov',	'047',	1),
(2204,	142,	'Selenge',	'049',	1),
(2205,	142,	'Suhbaatar',	'051',	1),
(2206,	142,	'Omnogovi',	'053',	1),
(2207,	142,	'Ovorhangay',	'055',	1),
(2208,	142,	'Dzavhan',	'057',	1),
(2209,	142,	'DundgovL',	'059',	1),
(2210,	142,	'Dornod',	'061',	1),
(2211,	142,	'Dornogov',	'063',	1),
(2212,	142,	'Govi-Sumber',	'064',	1),
(2213,	142,	'Govi-Altay',	'065',	1),
(2214,	142,	'Bulgan',	'067',	1),
(2215,	142,	'Bayanhongor',	'069',	1),
(2216,	142,	'Bayan-Olgiy',	'071',	1),
(2217,	142,	'Arhangay',	'073',	1),
(2218,	143,	'Saint Anthony',	'A',	1),
(2219,	143,	'Saint Georges',	'G',	1),
(2220,	143,	'Saint Peter',	'P',	1),
(2221,	144,	'Agadir',	'AGD',	1),
(2222,	144,	'Al Hoceima',	'HOC',	1),
(2223,	144,	'Azilal',	'AZI',	1),
(2224,	144,	'Beni Mellal',	'BME',	1),
(2225,	144,	'Ben Slimane',	'BSL',	1),
(2226,	144,	'Boulemane',	'BLM',	1),
(2227,	144,	'Casablanca',	'CBL',	1),
(2228,	144,	'Chaouen',	'CHA',	1),
(2229,	144,	'El Jadida',	'EJA',	1),
(2230,	144,	'El Kelaa des Sraghna',	'EKS',	1),
(2231,	144,	'Er Rachidia',	'ERA',	1),
(2232,	144,	'Essaouira',	'ESS',	1),
(2233,	144,	'Fes',	'FES',	1),
(2234,	144,	'Figuig',	'FIG',	1),
(2235,	144,	'Guelmim',	'GLM',	1),
(2236,	144,	'Ifrane',	'IFR',	1),
(2237,	144,	'Kenitra',	'KEN',	1),
(2238,	144,	'Khemisset',	'KHM',	1),
(2239,	144,	'Khenifra',	'KHN',	1),
(2240,	144,	'Khouribga',	'KHO',	1),
(2241,	144,	'Laayoune',	'LYN',	1),
(2242,	144,	'Larache',	'LAR',	1),
(2243,	144,	'Marrakech',	'MRK',	1),
(2244,	144,	'Meknes',	'MKN',	1),
(2245,	144,	'Nador',	'NAD',	1),
(2246,	144,	'Ouarzazate',	'ORZ',	1),
(2247,	144,	'Oujda',	'OUJ',	1),
(2248,	144,	'Rabat-Sale',	'RSA',	1),
(2249,	144,	'Safi',	'SAF',	1),
(2250,	144,	'Settat',	'SET',	1),
(2251,	144,	'Sidi Kacem',	'SKA',	1),
(2252,	144,	'Tangier',	'TGR',	1),
(2253,	144,	'Tan-Tan',	'TAN',	1),
(2254,	144,	'Taounate',	'TAO',	1),
(2255,	144,	'Taroudannt',	'TRD',	1),
(2256,	144,	'Tata',	'TAT',	1),
(2257,	144,	'Taza',	'TAZ',	1),
(2258,	144,	'Tetouan',	'TET',	1),
(2259,	144,	'Tiznit',	'TIZ',	1),
(2260,	144,	'Ad Dakhla',	'ADK',	1),
(2261,	144,	'Boujdour',	'BJD',	1),
(2262,	144,	'Es Smara',	'ESM',	1),
(2263,	145,	'Cabo Delgado',	'CD',	1),
(2264,	145,	'Gaza',	'GZ',	1),
(2265,	145,	'Inhambane',	'IN',	1),
(2266,	145,	'Manica',	'MN',	1),
(2267,	145,	'Maputo (city)',	'MC',	1),
(2268,	145,	'Maputo',	'MP',	1),
(2269,	145,	'Nampula',	'NA',	1),
(2270,	145,	'Niassa',	'NI',	1),
(2271,	145,	'Sofala',	'SO',	1),
(2272,	145,	'Tete',	'TE',	1),
(2273,	145,	'Zambezia',	'ZA',	1),
(2274,	146,	'Ayeyarwady',	'AY',	1),
(2275,	146,	'Bago',	'BG',	1),
(2276,	146,	'Magway',	'MG',	1),
(2277,	146,	'Mandalay',	'MD',	1),
(2278,	146,	'Sagaing',	'SG',	1),
(2279,	146,	'Tanintharyi',	'TN',	1),
(2280,	146,	'Yangon',	'YG',	1),
(2281,	146,	'Chin State',	'CH',	1),
(2282,	146,	'Kachin State',	'KC',	1),
(2283,	146,	'Kayah State',	'KH',	1),
(2284,	146,	'Kayin State',	'KN',	1),
(2285,	146,	'Mon State',	'MN',	1),
(2286,	146,	'Rakhine State',	'RK',	1),
(2287,	146,	'Shan State',	'SH',	1),
(2288,	147,	'Caprivi',	'CA',	1),
(2289,	147,	'Erongo',	'ER',	1),
(2290,	147,	'Hardap',	'HA',	1),
(2291,	147,	'Karas',	'KR',	1),
(2292,	147,	'Kavango',	'KV',	1),
(2293,	147,	'Khomas',	'KH',	1),
(2294,	147,	'Kunene',	'KU',	1),
(2295,	147,	'Ohangwena',	'OW',	1),
(2296,	147,	'Omaheke',	'OK',	1),
(2297,	147,	'Omusati',	'OT',	1),
(2298,	147,	'Oshana',	'ON',	1),
(2299,	147,	'Oshikoto',	'OO',	1),
(2300,	147,	'Otjozondjupa',	'OJ',	1),
(2301,	148,	'Aiwo',	'AO',	1),
(2302,	148,	'Anabar',	'AA',	1),
(2303,	148,	'Anetan',	'AT',	1),
(2304,	148,	'Anibare',	'AI',	1),
(2305,	148,	'Baiti',	'BA',	1),
(2306,	148,	'Boe',	'BO',	1),
(2307,	148,	'Buada',	'BU',	1),
(2308,	148,	'Denigomodu',	'DE',	1),
(2309,	148,	'Ewa',	'EW',	1),
(2310,	148,	'Ijuw',	'IJ',	1),
(2311,	148,	'Meneng',	'ME',	1),
(2312,	148,	'Nibok',	'NI',	1),
(2313,	148,	'Uaboe',	'UA',	1),
(2314,	148,	'Yaren',	'YA',	1),
(2315,	149,	'Bagmati',	'BA',	1),
(2316,	149,	'Bheri',	'BH',	1),
(2317,	149,	'Dhawalagiri',	'DH',	1),
(2318,	149,	'Gandaki',	'GA',	1),
(2319,	149,	'Janakpur',	'JA',	1),
(2320,	149,	'Karnali',	'KA',	1),
(2321,	149,	'Kosi',	'KO',	1),
(2322,	149,	'Lumbini',	'LU',	1),
(2323,	149,	'Mahakali',	'MA',	1),
(2324,	149,	'Mechi',	'ME',	1),
(2325,	149,	'Narayani',	'NA',	1),
(2326,	149,	'Rapti',	'RA',	1),
(2327,	149,	'Sagarmatha',	'SA',	1),
(2328,	149,	'Seti',	'SE',	1),
(2329,	150,	'Drenthe',	'DR',	1),
(2330,	150,	'Flevoland',	'FL',	1),
(2331,	150,	'Friesland',	'FR',	1),
(2332,	150,	'Gelderland',	'GE',	1),
(2333,	150,	'Groningen',	'GR',	1),
(2334,	150,	'Limburg',	'LI',	1),
(2335,	150,	'Noord Brabant',	'NB',	1),
(2336,	150,	'Noord Holland',	'NH',	1),
(2337,	150,	'Overijssel',	'OV',	1),
(2338,	150,	'Utrecht',	'UT',	1),
(2339,	150,	'Zeeland',	'ZE',	1),
(2340,	150,	'Zuid Holland',	'ZH',	1),
(2341,	152,	'Iles Loyaute',	'L',	1),
(2342,	152,	'Nord',	'N',	1),
(2343,	152,	'Sud',	'S',	1),
(2344,	153,	'Auckland',	'AUK',	1),
(2345,	153,	'Bay of Plenty',	'BOP',	1),
(2346,	153,	'Canterbury',	'CAN',	1),
(2347,	153,	'Coromandel',	'COR',	1),
(2348,	153,	'Gisborne',	'GIS',	1),
(2349,	153,	'Fiordland',	'FIO',	1),
(2350,	153,	'Hawke\'s Bay',	'HKB',	1),
(2351,	153,	'Marlborough',	'MBH',	1),
(2352,	153,	'Manawatu-Wanganui',	'MWT',	1),
(2353,	153,	'Mt Cook-Mackenzie',	'MCM',	1),
(2354,	153,	'Nelson',	'NSN',	1),
(2355,	153,	'Northland',	'NTL',	1),
(2356,	153,	'Otago',	'OTA',	1),
(2357,	153,	'Southland',	'STL',	1),
(2358,	153,	'Taranaki',	'TKI',	1),
(2359,	153,	'Wellington',	'WGN',	1),
(2360,	153,	'Waikato',	'WKO',	1),
(2361,	153,	'Wairprarapa',	'WAI',	1),
(2362,	153,	'West Coast',	'WTC',	1),
(2363,	154,	'Atlantico Norte',	'AN',	1),
(2364,	154,	'Atlantico Sur',	'AS',	1),
(2365,	154,	'Boaco',	'BO',	1),
(2366,	154,	'Carazo',	'CA',	1),
(2367,	154,	'Chinandega',	'CI',	1),
(2368,	154,	'Chontales',	'CO',	1),
(2369,	154,	'Esteli',	'ES',	1),
(2370,	154,	'Granada',	'GR',	1),
(2371,	154,	'Jinotega',	'JI',	1),
(2372,	154,	'Leon',	'LE',	1),
(2373,	154,	'Madriz',	'MD',	1),
(2374,	154,	'Managua',	'MN',	1),
(2375,	154,	'Masaya',	'MS',	1),
(2376,	154,	'Matagalpa',	'MT',	1),
(2377,	154,	'Nuevo Segovia',	'NS',	1),
(2378,	154,	'Rio San Juan',	'RS',	1),
(2379,	154,	'Rivas',	'RI',	1),
(2380,	155,	'Agadez',	'AG',	1),
(2381,	155,	'Diffa',	'DF',	1),
(2382,	155,	'Dosso',	'DS',	1),
(2383,	155,	'Maradi',	'MA',	1),
(2384,	155,	'Niamey',	'NM',	1),
(2385,	155,	'Tahoua',	'TH',	1),
(2386,	155,	'Tillaberi',	'TL',	1),
(2387,	155,	'Zinder',	'ZD',	1),
(2388,	156,	'Abia',	'AB',	1),
(2389,	156,	'Abuja Federal Capital Territory',	'CT',	1),
(2390,	156,	'Adamawa',	'AD',	1),
(2391,	156,	'Akwa Ibom',	'AK',	1),
(2392,	156,	'Anambra',	'AN',	1),
(2393,	156,	'Bauchi',	'BC',	1),
(2394,	156,	'Bayelsa',	'BY',	1),
(2395,	156,	'Benue',	'BN',	1),
(2396,	156,	'Borno',	'BO',	1),
(2397,	156,	'Cross River',	'CR',	1),
(2398,	156,	'Delta',	'DE',	1),
(2399,	156,	'Ebonyi',	'EB',	1),
(2400,	156,	'Edo',	'ED',	1),
(2401,	156,	'Ekiti',	'EK',	1),
(2402,	156,	'Enugu',	'EN',	1),
(2403,	156,	'Gombe',	'GO',	1),
(2404,	156,	'Imo',	'IM',	1),
(2405,	156,	'Jigawa',	'JI',	1),
(2406,	156,	'Kaduna',	'KD',	1),
(2407,	156,	'Kano',	'KN',	1),
(2408,	156,	'Katsina',	'KT',	1),
(2409,	156,	'Kebbi',	'KE',	1),
(2410,	156,	'Kogi',	'KO',	1),
(2411,	156,	'Kwara',	'KW',	1),
(2412,	156,	'Lagos',	'LA',	1),
(2413,	156,	'Nassarawa',	'NA',	1),
(2414,	156,	'Niger',	'NI',	1),
(2415,	156,	'Ogun',	'OG',	1),
(2416,	156,	'Ondo',	'ONG',	1),
(2417,	156,	'Osun',	'OS',	1),
(2418,	156,	'Oyo',	'OY',	1),
(2419,	156,	'Plateau',	'PL',	1),
(2420,	156,	'Rivers',	'RI',	1),
(2421,	156,	'Sokoto',	'SO',	1),
(2422,	156,	'Taraba',	'TA',	1),
(2423,	156,	'Yobe',	'YO',	1),
(2424,	156,	'Zamfara',	'ZA',	1),
(2425,	159,	'Northern Islands',	'N',	1),
(2426,	159,	'Rota',	'R',	1),
(2427,	159,	'Saipan',	'S',	1),
(2428,	159,	'Tinian',	'T',	1),
(2429,	160,	'Akershus',	'AK',	1),
(2430,	160,	'Aust-Agder',	'AA',	1),
(2431,	160,	'Buskerud',	'BU',	1),
(2432,	160,	'Finnmark',	'FM',	1),
(2433,	160,	'Hedmark',	'HM',	1),
(2434,	160,	'Hordaland',	'HL',	1),
(2435,	160,	'More og Romdal',	'MR',	1),
(2436,	160,	'Nord-Trondelag',	'NT',	1),
(2437,	160,	'Nordland',	'NL',	1),
(2438,	160,	'Ostfold',	'OF',	1),
(2439,	160,	'Oppland',	'OP',	1),
(2440,	160,	'Oslo',	'OL',	1),
(2441,	160,	'Rogaland',	'RL',	1),
(2442,	160,	'Sor-Trondelag',	'ST',	1),
(2443,	160,	'Sogn og Fjordane',	'SJ',	1),
(2444,	160,	'Svalbard',	'SV',	1),
(2445,	160,	'Telemark',	'TM',	1),
(2446,	160,	'Troms',	'TR',	1),
(2447,	160,	'Vest-Agder',	'VA',	1),
(2448,	160,	'Vestfold',	'VF',	1),
(2449,	161,	'Ad Dakhiliyah',	'DA',	1),
(2450,	161,	'Al Batinah',	'BA',	1),
(2451,	161,	'Al Wusta',	'WU',	1),
(2452,	161,	'Ash Sharqiyah',	'SH',	1),
(2453,	161,	'Az Zahirah',	'ZA',	1),
(2454,	161,	'Masqat',	'MA',	1),
(2455,	161,	'Musandam',	'MU',	1),
(2456,	161,	'Zufar',	'ZU',	1),
(2457,	162,	'Balochistan',	'B',	1),
(2458,	162,	'Federally Administered Tribal Areas',	'T',	1),
(2459,	162,	'Islamabad Capital Territory',	'I',	1),
(2460,	162,	'North-West Frontier',	'N',	1),
(2461,	162,	'Punjab',	'P',	1),
(2462,	162,	'Sindh',	'S',	1),
(2463,	163,	'Aimeliik',	'AM',	1),
(2464,	163,	'Airai',	'AR',	1),
(2465,	163,	'Angaur',	'AN',	1),
(2466,	163,	'Hatohobei',	'HA',	1),
(2467,	163,	'Kayangel',	'KA',	1),
(2468,	163,	'Koror',	'KO',	1),
(2469,	163,	'Melekeok',	'ME',	1),
(2470,	163,	'Ngaraard',	'NA',	1),
(2471,	163,	'Ngarchelong',	'NG',	1),
(2472,	163,	'Ngardmau',	'ND',	1),
(2473,	163,	'Ngatpang',	'NT',	1),
(2474,	163,	'Ngchesar',	'NC',	1),
(2475,	163,	'Ngeremlengui',	'NR',	1),
(2476,	163,	'Ngiwal',	'NW',	1),
(2477,	163,	'Peleliu',	'PE',	1),
(2478,	163,	'Sonsorol',	'SO',	1),
(2479,	164,	'Bocas del Toro',	'BT',	1),
(2480,	164,	'Chiriqui',	'CH',	1),
(2481,	164,	'Cocle',	'CC',	1),
(2482,	164,	'Colon',	'CL',	1),
(2483,	164,	'Darien',	'DA',	1),
(2484,	164,	'Herrera',	'HE',	1),
(2485,	164,	'Los Santos',	'LS',	1),
(2486,	164,	'Panama',	'PA',	1),
(2487,	164,	'San Blas',	'SB',	1),
(2488,	164,	'Veraguas',	'VG',	1),
(2489,	165,	'Bougainville',	'BV',	1),
(2490,	165,	'Central',	'CE',	1),
(2491,	165,	'Chimbu',	'CH',	1),
(2492,	165,	'Eastern Highlands',	'EH',	1),
(2493,	165,	'East New Britain',	'EB',	1),
(2494,	165,	'East Sepik',	'ES',	1),
(2495,	165,	'Enga',	'EN',	1),
(2496,	165,	'Gulf',	'GU',	1),
(2497,	165,	'Madang',	'MD',	1),
(2498,	165,	'Manus',	'MN',	1),
(2499,	165,	'Milne Bay',	'MB',	1),
(2500,	165,	'Morobe',	'MR',	1),
(2501,	165,	'National Capital',	'NC',	1),
(2502,	165,	'New Ireland',	'NI',	1),
(2503,	165,	'Northern',	'NO',	1),
(2504,	165,	'Sandaun',	'SA',	1),
(2505,	165,	'Southern Highlands',	'SH',	1),
(2506,	165,	'Western',	'WE',	1),
(2507,	165,	'Western Highlands',	'WH',	1),
(2508,	165,	'West New Britain',	'WB',	1),
(2509,	166,	'Alto Paraguay',	'AG',	1),
(2510,	166,	'Alto Parana',	'AN',	1),
(2511,	166,	'Amambay',	'AM',	1),
(2512,	166,	'Asuncion',	'AS',	1),
(2513,	166,	'Boqueron',	'BO',	1),
(2514,	166,	'Caaguazu',	'CG',	1),
(2515,	166,	'Caazapa',	'CZ',	1),
(2516,	166,	'Canindeyu',	'CN',	1),
(2517,	166,	'Central',	'CE',	1),
(2518,	166,	'Concepcion',	'CC',	1),
(2519,	166,	'Cordillera',	'CD',	1),
(2520,	166,	'Guaira',	'GU',	1),
(2521,	166,	'Itapua',	'IT',	1),
(2522,	166,	'Misiones',	'MI',	1),
(2523,	166,	'Neembucu',	'NE',	1),
(2524,	166,	'Paraguari',	'PA',	1),
(2525,	166,	'Presidente Hayes',	'PH',	1),
(2526,	166,	'San Pedro',	'SP',	1),
(2527,	167,	'Amazonas',	'AM',	1),
(2528,	167,	'Ancash',	'AN',	1),
(2529,	167,	'Apurimac',	'AP',	1),
(2530,	167,	'Arequipa',	'AR',	1),
(2531,	167,	'Ayacucho',	'AY',	1),
(2532,	167,	'Cajamarca',	'CJ',	1),
(2533,	167,	'Callao',	'CL',	1),
(2534,	167,	'Cusco',	'CU',	1),
(2535,	167,	'Huancavelica',	'HV',	1),
(2536,	167,	'Huanuco',	'HO',	1),
(2537,	167,	'Ica',	'IC',	1),
(2538,	167,	'Junin',	'JU',	1),
(2539,	167,	'La Libertad',	'LD',	1),
(2540,	167,	'Lambayeque',	'LY',	1),
(2541,	167,	'Lima',	'LI',	1),
(2542,	167,	'Loreto',	'LO',	1),
(2543,	167,	'Madre de Dios',	'MD',	1),
(2544,	167,	'Moquegua',	'MO',	1),
(2545,	167,	'Pasco',	'PA',	1),
(2546,	167,	'Piura',	'PI',	1),
(2547,	167,	'Puno',	'PU',	1),
(2548,	167,	'San Martin',	'SM',	1),
(2549,	167,	'Tacna',	'TA',	1),
(2550,	167,	'Tumbes',	'TU',	1),
(2551,	167,	'Ucayali',	'UC',	1),
(2552,	168,	'Abra',	'ABR',	1),
(2553,	168,	'Agusan del Norte',	'ANO',	1),
(2554,	168,	'Agusan del Sur',	'ASU',	1),
(2555,	168,	'Aklan',	'AKL',	1),
(2556,	168,	'Albay',	'ALB',	1),
(2557,	168,	'Antique',	'ANT',	1),
(2558,	168,	'Apayao',	'APY',	1),
(2559,	168,	'Aurora',	'AUR',	1),
(2560,	168,	'Basilan',	'BAS',	1),
(2561,	168,	'Bataan',	'BTA',	1),
(2562,	168,	'Batanes',	'BTE',	1),
(2563,	168,	'Batangas',	'BTG',	1),
(2564,	168,	'Biliran',	'BLR',	1),
(2565,	168,	'Benguet',	'BEN',	1),
(2566,	168,	'Bohol',	'BOL',	1),
(2567,	168,	'Bukidnon',	'BUK',	1),
(2568,	168,	'Bulacan',	'BUL',	1),
(2569,	168,	'Cagayan',	'CAG',	1),
(2570,	168,	'Camarines Norte',	'CNO',	1),
(2571,	168,	'Camarines Sur',	'CSU',	1),
(2572,	168,	'Camiguin',	'CAM',	1),
(2573,	168,	'Capiz',	'CAP',	1),
(2574,	168,	'Catanduanes',	'CAT',	1),
(2575,	168,	'Cavite',	'CAV',	1),
(2576,	168,	'Cebu',	'CEB',	1),
(2577,	168,	'Compostela',	'CMP',	1),
(2578,	168,	'Davao del Norte',	'DNO',	1),
(2579,	168,	'Davao del Sur',	'DSU',	1),
(2580,	168,	'Davao Oriental',	'DOR',	1),
(2581,	168,	'Eastern Samar',	'ESA',	1),
(2582,	168,	'Guimaras',	'GUI',	1),
(2583,	168,	'Ifugao',	'IFU',	1),
(2584,	168,	'Ilocos Norte',	'INO',	1),
(2585,	168,	'Ilocos Sur',	'ISU',	1),
(2586,	168,	'Iloilo',	'ILO',	1),
(2587,	168,	'Isabela',	'ISA',	1),
(2588,	168,	'Kalinga',	'KAL',	1),
(2589,	168,	'Laguna',	'LAG',	1),
(2590,	168,	'Lanao del Norte',	'LNO',	1),
(2591,	168,	'Lanao del Sur',	'LSU',	1),
(2592,	168,	'La Union',	'UNI',	1),
(2593,	168,	'Leyte',	'LEY',	1),
(2594,	168,	'Maguindanao',	'MAG',	1),
(2595,	168,	'Marinduque',	'MRN',	1),
(2596,	168,	'Masbate',	'MSB',	1),
(2597,	168,	'Mindoro Occidental',	'MIC',	1),
(2598,	168,	'Mindoro Oriental',	'MIR',	1),
(2599,	168,	'Misamis Occidental',	'MSC',	1),
(2600,	168,	'Misamis Oriental',	'MOR',	1),
(2601,	168,	'Mountain',	'MOP',	1),
(2602,	168,	'Negros Occidental',	'NOC',	1),
(2603,	168,	'Negros Oriental',	'NOR',	1),
(2604,	168,	'North Cotabato',	'NCT',	1),
(2605,	168,	'Northern Samar',	'NSM',	1),
(2606,	168,	'Nueva Ecija',	'NEC',	1),
(2607,	168,	'Nueva Vizcaya',	'NVZ',	1),
(2608,	168,	'Palawan',	'PLW',	1),
(2609,	168,	'Pampanga',	'PMP',	1),
(2610,	168,	'Pangasinan',	'PNG',	1),
(2611,	168,	'Quezon',	'QZN',	1),
(2612,	168,	'Quirino',	'QRN',	1),
(2613,	168,	'Rizal',	'RIZ',	1),
(2614,	168,	'Romblon',	'ROM',	1),
(2615,	168,	'Samar',	'SMR',	1),
(2616,	168,	'Sarangani',	'SRG',	1),
(2617,	168,	'Siquijor',	'SQJ',	1),
(2618,	168,	'Sorsogon',	'SRS',	1),
(2619,	168,	'South Cotabato',	'SCO',	1),
(2620,	168,	'Southern Leyte',	'SLE',	1),
(2621,	168,	'Sultan Kudarat',	'SKU',	1),
(2622,	168,	'Sulu',	'SLU',	1),
(2623,	168,	'Surigao del Norte',	'SNO',	1),
(2624,	168,	'Surigao del Sur',	'SSU',	1),
(2625,	168,	'Tarlac',	'TAR',	1),
(2626,	168,	'Tawi-Tawi',	'TAW',	1),
(2627,	168,	'Zambales',	'ZBL',	1),
(2628,	168,	'Zamboanga del Norte',	'ZNO',	1),
(2629,	168,	'Zamboanga del Sur',	'ZSU',	1),
(2630,	168,	'Zamboanga Sibugay',	'ZSI',	1),
(2631,	170,	'Dolnoslaskie',	'DO',	1),
(2632,	170,	'Kujawsko-Pomorskie',	'KP',	1),
(2633,	170,	'Lodzkie',	'LO',	1),
(2634,	170,	'Lubelskie',	'LL',	1),
(2635,	170,	'Lubuskie',	'LU',	1),
(2636,	170,	'Malopolskie',	'ML',	1),
(2637,	170,	'Mazowieckie',	'MZ',	1),
(2638,	170,	'Opolskie',	'OP',	1),
(2639,	170,	'Podkarpackie',	'PP',	1),
(2640,	170,	'Podlaskie',	'PL',	1),
(2641,	170,	'Pomorskie',	'PM',	1),
(2642,	170,	'Slaskie',	'SL',	1),
(2643,	170,	'Swietokrzyskie',	'SW',	1),
(2644,	170,	'Warminsko-Mazurskie',	'WM',	1),
(2645,	170,	'Wielkopolskie',	'WP',	1),
(2646,	170,	'Zachodniopomorskie',	'ZA',	1),
(2647,	198,	'Saint Pierre',	'P',	1),
(2648,	198,	'Miquelon',	'M',	1),
(2649,	171,	'A&ccedil;ores',	'AC',	1),
(2650,	171,	'Aveiro',	'AV',	1),
(2651,	171,	'Beja',	'BE',	1),
(2652,	171,	'Braga',	'BR',	1),
(2653,	171,	'Bragan&ccedil;a',	'BA',	1),
(2654,	171,	'Castelo Branco',	'CB',	1),
(2655,	171,	'Coimbra',	'CO',	1),
(2656,	171,	'&Eacute;vora',	'EV',	1),
(2657,	171,	'Faro',	'FA',	1),
(2658,	171,	'Guarda',	'GU',	1),
(2659,	171,	'Leiria',	'LE',	1),
(2660,	171,	'Lisboa',	'LI',	1),
(2661,	171,	'Madeira',	'ME',	1),
(2662,	171,	'Portalegre',	'PO',	1),
(2663,	171,	'Porto',	'PR',	1),
(2664,	171,	'Santar&eacute;m',	'SA',	1),
(2665,	171,	'Set&uacute;bal',	'SE',	1),
(2666,	171,	'Viana do Castelo',	'VC',	1),
(2667,	171,	'Vila Real',	'VR',	1),
(2668,	171,	'Viseu',	'VI',	1),
(2669,	173,	'Ad Dawhah',	'DW',	1),
(2670,	173,	'Al Ghuwayriyah',	'GW',	1),
(2671,	173,	'Al Jumayliyah',	'JM',	1),
(2672,	173,	'Al Khawr',	'KR',	1),
(2673,	173,	'Al Wakrah',	'WK',	1),
(2674,	173,	'Ar Rayyan',	'RN',	1),
(2675,	173,	'Jarayan al Batinah',	'JB',	1),
(2676,	173,	'Madinat ash Shamal',	'MS',	1),
(2677,	173,	'Umm Sa\'id',	'UD',	1),
(2678,	173,	'Umm Salal',	'UL',	1),
(2679,	175,	'Alba',	'AB',	1),
(2680,	175,	'Arad',	'AR',	1),
(2681,	175,	'Arges',	'AG',	1),
(2682,	175,	'Bacau',	'BC',	1),
(2683,	175,	'Bihor',	'BH',	1),
(2684,	175,	'Bistrita-Nasaud',	'BN',	1),
(2685,	175,	'Botosani',	'BT',	1),
(2686,	175,	'Brasov',	'BV',	1),
(2687,	175,	'Braila',	'BR',	1),
(2688,	175,	'Bucuresti',	'B',	1),
(2689,	175,	'Buzau',	'BZ',	1),
(2690,	175,	'Caras-Severin',	'CS',	1),
(2691,	175,	'Calarasi',	'CL',	1),
(2692,	175,	'Cluj',	'CJ',	1),
(2693,	175,	'Constanta',	'CT',	1),
(2694,	175,	'Covasna',	'CV',	1),
(2695,	175,	'Dimbovita',	'DB',	1),
(2696,	175,	'Dolj',	'DJ',	1),
(2697,	175,	'Galati',	'GL',	1),
(2698,	175,	'Giurgiu',	'GR',	1),
(2699,	175,	'Gorj',	'GJ',	1),
(2700,	175,	'Harghita',	'HR',	1),
(2701,	175,	'Hunedoara',	'HD',	1),
(2702,	175,	'Ialomita',	'IL',	1),
(2703,	175,	'Iasi',	'IS',	1),
(2704,	175,	'Ilfov',	'IF',	1),
(2705,	175,	'Maramures',	'MM',	1),
(2706,	175,	'Mehedinti',	'MH',	1),
(2707,	175,	'Mures',	'MS',	1),
(2708,	175,	'Neamt',	'NT',	1),
(2709,	175,	'Olt',	'OT',	1),
(2710,	175,	'Prahova',	'PH',	1),
(2711,	175,	'Satu-Mare',	'SM',	1),
(2712,	175,	'Salaj',	'SJ',	1),
(2713,	175,	'Sibiu',	'SB',	1),
(2714,	175,	'Suceava',	'SV',	1),
(2715,	175,	'Teleorman',	'TR',	1),
(2716,	175,	'Timis',	'TM',	1),
(2717,	175,	'Tulcea',	'TL',	1),
(2718,	175,	'Vaslui',	'VS',	1),
(2719,	175,	'Valcea',	'VL',	1),
(2720,	175,	'Vrancea',	'VN',	1),
(2721,	176,	'Республика Хакасия',	'KK',	1),
(2722,	176,	'Московская область',	'MOS',	1),
(2723,	176,	'Чукотский АО',	'CHU',	1),
(2724,	176,	'Архангельская область',	'ARK',	1),
(2725,	176,	'Астраханская область',	'AST',	1),
(2726,	176,	'Алтайский край',	'ALT',	1),
(2727,	176,	'Белгородская область',	'BEL',	1),
(2728,	176,	'Еврейская АО',	'YEV',	1),
(2729,	176,	'Амурская область',	'AMU',	1),
(2730,	176,	'Брянская область',	'BRY',	1),
(2731,	176,	'Чувашская Республика',	'CU',	1),
(2732,	176,	'Челябинская область',	'CHE',	1),
(2733,	176,	'Карачаево-Черкеcсия',	'KC',	1),
(2734,	176,	'Забайкальский край',	'ZAB',	1),
(2735,	176,	'Ленинградская область',	'LEN',	1),
(2736,	176,	'Республика Калмыкия',	'KL',	1),
(2737,	176,	'Сахалинская область',	'SAK',	1),
(2738,	176,	'Республика Алтай',	'AL',	1),
(2739,	176,	'Чеченская Республика',	'CE',	1),
(2740,	176,	'Иркутская область',	'IRK',	1),
(2741,	176,	'Ивановская область',	'IVA',	1),
(2742,	176,	'Удмуртская Республика',	'UD',	1),
(2743,	176,	'Калининградская область',	'KGD',	1),
(2744,	176,	'Калужская область',	'KLU',	1),
(2746,	176,	'Республика Татарстан',	'TA',	1),
(2747,	176,	'Кемеровская область',	'KEM',	1),
(2748,	176,	'Хабаровский край',	'KHA',	1),
(2749,	176,	'Ханты-Мансийский АО - Югра',	'KHM',	1),
(2750,	176,	'Костромская область',	'KOS',	1),
(2751,	176,	'Краснодарский край',	'KDA',	1),
(2752,	176,	'Красноярский край',	'KYA',	1),
(2754,	176,	'Курганская область',	'KGN',	1),
(2755,	176,	'Курская область',	'KRS',	1),
(2756,	176,	'Республика Тыва',	'TY',	1),
(2757,	176,	'Липецкая область',	'LIP',	1),
(2758,	176,	'Магаданская область',	'MAG',	1),
(2759,	176,	'Республика Дагестан',	'DA',	1),
(2760,	176,	'Республика Адыгея',	'AD',	1),
(2761,	176,	'Москва',	'MOW',	1),
(2762,	176,	'Мурманская область',	'MUR',	1),
(2763,	176,	'Республика Кабардино-Балкария',	'KB',	1),
(2764,	176,	'Ненецкий АО',	'NEN',	1),
(2765,	176,	'Республика Ингушетия',	'IN',	1),
(2766,	176,	'Нижегородская область',	'NIZ',	1),
(2767,	176,	'Новгородская область',	'NGR',	1),
(2768,	176,	'Новосибирская область',	'NVS',	1),
(2769,	176,	'Омская область',	'OMS',	1),
(2770,	176,	'Орловская область',	'ORL',	1),
(2771,	176,	'Оренбургская область',	'ORE',	1),
(2773,	176,	'Пензенская область',	'PNZ',	1),
(2774,	176,	'Пермский край',	'PER',	1),
(2775,	176,	'Камчатский край',	'KAM',	1),
(2776,	176,	'Республика Карелия',	'KR',	1),
(2777,	176,	'Псковская область',	'PSK',	1),
(2778,	176,	'Ростовская область',	'ROS',	1),
(2779,	176,	'Рязанская область',	'RYA',	1),
(2780,	176,	'Ямало-Ненецкий АО',	'YAN',	1),
(2781,	176,	'Самарская область',	'SAM',	1),
(2782,	176,	'Республика Мордовия',	'MO',	1),
(2783,	176,	'Саратовская область',	'SAR',	1),
(2784,	176,	'Смоленская область',	'SMO',	1),
(2785,	176,	'Санкт-Петербург',	'SPE',	1),
(2786,	176,	'Ставропольский край',	'STA',	1),
(2787,	176,	'Республика Коми',	'KO',	1),
(2788,	176,	'Тамбовская область',	'TAM',	1),
(2789,	176,	'Томская область',	'TOM',	1),
(2790,	176,	'Тульская область',	'TUL',	1),
(2792,	176,	'Тверская область',	'TVE',	1),
(2793,	176,	'Тюменская область',	'TYU',	1),
(2794,	176,	'Республика Башкортостан',	'BA',	1),
(2795,	176,	'Ульяновская область',	'ULY',	1),
(2796,	176,	'Республика Бурятия',	'BU',	1),
(2798,	176,	'Республика Северная Осетия',	'SE',	1),
(2799,	176,	'Владимирская область',	'VLA',	1),
(2800,	176,	'Приморский край',	'PRI',	1),
(2801,	176,	'Волгоградская область',	'VGG',	1),
(2802,	176,	'Вологодская область',	'VLG',	1),
(2803,	176,	'Воронежская область',	'VOR',	1),
(2804,	176,	'Кировская область',	'KIR',	1),
(2805,	176,	'Республика Саха',	'SA',	1),
(2806,	176,	'Ярославская область',	'YAR',	1),
(2807,	176,	'Свердловская область',	'SVE',	1),
(2808,	176,	'Республика Марий Эл',	'ME',	1),
(2809,	177,	'Butare',	'BU',	1),
(2810,	177,	'Byumba',	'BY',	1),
(2811,	177,	'Cyangugu',	'CY',	1),
(2812,	177,	'Gikongoro',	'GK',	1),
(2813,	177,	'Gisenyi',	'GS',	1),
(2814,	177,	'Gitarama',	'GT',	1),
(2815,	177,	'Kibungo',	'KG',	1),
(2816,	177,	'Kibuye',	'KY',	1),
(2817,	177,	'Kigali Rurale',	'KR',	1),
(2818,	177,	'Kigali-ville',	'KV',	1),
(2819,	177,	'Ruhengeri',	'RU',	1),
(2820,	177,	'Umutara',	'UM',	1),
(2821,	178,	'Christ Church Nichola Town',	'CCN',	1),
(2822,	178,	'Saint Anne Sandy Point',	'SAS',	1),
(2823,	178,	'Saint George Basseterre',	'SGB',	1),
(2824,	178,	'Saint George Gingerland',	'SGG',	1),
(2825,	178,	'Saint James Windward',	'SJW',	1),
(2826,	178,	'Saint John Capesterre',	'SJC',	1),
(2827,	178,	'Saint John Figtree',	'SJF',	1),
(2828,	178,	'Saint Mary Cayon',	'SMC',	1),
(2829,	178,	'Saint Paul Capesterre',	'CAP',	1),
(2830,	178,	'Saint Paul Charlestown',	'CHA',	1),
(2831,	178,	'Saint Peter Basseterre',	'SPB',	1),
(2832,	178,	'Saint Thomas Lowland',	'STL',	1),
(2833,	178,	'Saint Thomas Middle Island',	'STM',	1),
(2834,	178,	'Trinity Palmetto Point',	'TPP',	1),
(2835,	179,	'Anse-la-Raye',	'AR',	1),
(2836,	179,	'Castries',	'CA',	1),
(2837,	179,	'Choiseul',	'CH',	1),
(2838,	179,	'Dauphin',	'DA',	1),
(2839,	179,	'Dennery',	'DE',	1),
(2840,	179,	'Gros-Islet',	'GI',	1),
(2841,	179,	'Laborie',	'LA',	1),
(2842,	179,	'Micoud',	'MI',	1),
(2843,	179,	'Praslin',	'PR',	1),
(2844,	179,	'Soufriere',	'SO',	1),
(2845,	179,	'Vieux-Fort',	'VF',	1),
(2846,	180,	'Charlotte',	'C',	1),
(2847,	180,	'Grenadines',	'R',	1),
(2848,	180,	'Saint Andrew',	'A',	1),
(2849,	180,	'Saint David',	'D',	1),
(2850,	180,	'Saint George',	'G',	1),
(2851,	180,	'Saint Patrick',	'P',	1),
(2852,	181,	'A\'ana',	'AN',	1),
(2853,	181,	'Aiga-i-le-Tai',	'AI',	1),
(2854,	181,	'Atua',	'AT',	1),
(2855,	181,	'Fa\'asaleleaga',	'FA',	1),
(2856,	181,	'Gaga\'emauga',	'GE',	1),
(2857,	181,	'Gagaifomauga',	'GF',	1),
(2858,	181,	'Palauli',	'PA',	1),
(2859,	181,	'Satupa\'itea',	'SA',	1),
(2860,	181,	'Tuamasaga',	'TU',	1),
(2861,	181,	'Va\'a-o-Fonoti',	'VF',	1),
(2862,	181,	'Vaisigano',	'VS',	1),
(2863,	182,	'Acquaviva',	'AC',	1),
(2864,	182,	'Borgo Maggiore',	'BM',	1),
(2865,	182,	'Chiesanuova',	'CH',	1),
(2866,	182,	'Domagnano',	'DO',	1),
(2867,	182,	'Faetano',	'FA',	1),
(2868,	182,	'Fiorentino',	'FI',	1),
(2869,	182,	'Montegiardino',	'MO',	1),
(2870,	182,	'Citta di San Marino',	'SM',	1),
(2871,	182,	'Serravalle',	'SE',	1),
(2872,	183,	'Sao Tome',	'S',	1),
(2873,	183,	'Principe',	'P',	1),
(2874,	184,	'Al Bahah',	'BH',	1),
(2875,	184,	'Al Hudud ash Shamaliyah',	'HS',	1),
(2876,	184,	'Al Jawf',	'JF',	1),
(2877,	184,	'Al Madinah',	'MD',	1),
(2878,	184,	'Al Qasim',	'QS',	1),
(2879,	184,	'Ar Riyad',	'RD',	1),
(2880,	184,	'Ash Sharqiyah (Eastern)',	'AQ',	1),
(2881,	184,	'\'Asir',	'AS',	1),
(2882,	184,	'Ha\'il',	'HL',	1),
(2883,	184,	'Jizan',	'JZ',	1),
(2884,	184,	'Makkah',	'ML',	1),
(2885,	184,	'Najran',	'NR',	1),
(2886,	184,	'Tabuk',	'TB',	1),
(2887,	185,	'Dakar',	'DA',	1),
(2888,	185,	'Diourbel',	'DI',	1),
(2889,	185,	'Fatick',	'FA',	1),
(2890,	185,	'Kaolack',	'KA',	1),
(2891,	185,	'Kolda',	'KO',	1),
(2892,	185,	'Louga',	'LO',	1),
(2893,	185,	'Matam',	'MA',	1),
(2894,	185,	'Saint-Louis',	'SL',	1),
(2895,	185,	'Tambacounda',	'TA',	1),
(2896,	185,	'Thies',	'TH',	1),
(2897,	185,	'Ziguinchor',	'ZI',	1),
(2898,	186,	'Anse aux Pins',	'AP',	1),
(2899,	186,	'Anse Boileau',	'AB',	1),
(2900,	186,	'Anse Etoile',	'AE',	1),
(2901,	186,	'Anse Louis',	'AL',	1),
(2902,	186,	'Anse Royale',	'AR',	1),
(2903,	186,	'Baie Lazare',	'BL',	1),
(2904,	186,	'Baie Sainte Anne',	'BS',	1),
(2905,	186,	'Beau Vallon',	'BV',	1),
(2906,	186,	'Bel Air',	'BA',	1),
(2907,	186,	'Bel Ombre',	'BO',	1),
(2908,	186,	'Cascade',	'CA',	1),
(2909,	186,	'Glacis',	'GL',	1),
(2910,	186,	'Grand\' Anse (on Mahe)',	'GM',	1),
(2911,	186,	'Grand\' Anse (on Praslin)',	'GP',	1),
(2912,	186,	'La Digue',	'DG',	1),
(2913,	186,	'La Riviere Anglaise',	'RA',	1),
(2914,	186,	'Mont Buxton',	'MB',	1),
(2915,	186,	'Mont Fleuri',	'MF',	1),
(2916,	186,	'Plaisance',	'PL',	1),
(2917,	186,	'Pointe La Rue',	'PR',	1),
(2918,	186,	'Port Glaud',	'PG',	1),
(2919,	186,	'Saint Louis',	'SL',	1),
(2920,	186,	'Takamaka',	'TA',	1),
(2921,	187,	'Eastern',	'E',	1),
(2922,	187,	'Northern',	'N',	1),
(2923,	187,	'Southern',	'S',	1),
(2924,	187,	'Western',	'W',	1),
(2925,	189,	'Banskobystrický',	'BA',	1),
(2926,	189,	'Bratislavský',	'BR',	1),
(2927,	189,	'Košický',	'KO',	1),
(2928,	189,	'Nitriansky',	'NI',	1),
(2929,	189,	'Prešovský',	'PR',	1),
(2930,	189,	'Trenčiansky',	'TC',	1),
(2931,	189,	'Trnavský',	'TV',	1),
(2932,	189,	'Žilinský',	'ZI',	1),
(2933,	191,	'Central',	'CE',	1),
(2934,	191,	'Choiseul',	'CH',	1),
(2935,	191,	'Guadalcanal',	'GC',	1),
(2936,	191,	'Honiara',	'HO',	1),
(2937,	191,	'Isabel',	'IS',	1),
(2938,	191,	'Makira',	'MK',	1),
(2939,	191,	'Malaita',	'ML',	1),
(2940,	191,	'Rennell and Bellona',	'RB',	1),
(2941,	191,	'Temotu',	'TM',	1),
(2942,	191,	'Western',	'WE',	1),
(2943,	192,	'Awdal',	'AW',	1),
(2944,	192,	'Bakool',	'BK',	1),
(2945,	192,	'Banaadir',	'BN',	1),
(2946,	192,	'Bari',	'BR',	1),
(2947,	192,	'Bay',	'BY',	1),
(2948,	192,	'Galguduud',	'GA',	1),
(2949,	192,	'Gedo',	'GE',	1),
(2950,	192,	'Hiiraan',	'HI',	1),
(2951,	192,	'Jubbada Dhexe',	'JD',	1),
(2952,	192,	'Jubbada Hoose',	'JH',	1),
(2953,	192,	'Mudug',	'MU',	1),
(2954,	192,	'Nugaal',	'NU',	1),
(2955,	192,	'Sanaag',	'SA',	1),
(2956,	192,	'Shabeellaha Dhexe',	'SD',	1),
(2957,	192,	'Shabeellaha Hoose',	'SH',	1),
(2958,	192,	'Sool',	'SL',	1),
(2959,	192,	'Togdheer',	'TO',	1),
(2960,	192,	'Woqooyi Galbeed',	'WG',	1),
(2961,	193,	'Eastern Cape',	'EC',	1),
(2962,	193,	'Free State',	'FS',	1),
(2963,	193,	'Gauteng',	'GT',	1),
(2964,	193,	'KwaZulu-Natal',	'KN',	1),
(2965,	193,	'Limpopo',	'LP',	1),
(2966,	193,	'Mpumalanga',	'MP',	1),
(2967,	193,	'North West',	'NW',	1),
(2968,	193,	'Northern Cape',	'NC',	1),
(2969,	193,	'Western Cape',	'WC',	1),
(2970,	195,	'La Coru&ntilde;a',	'CA',	1),
(2971,	195,	'&Aacute;lava',	'AL',	1),
(2972,	195,	'Albacete',	'AB',	1),
(2973,	195,	'Alicante',	'AC',	1),
(2974,	195,	'Almeria',	'AM',	1),
(2975,	195,	'Asturias',	'AS',	1),
(2976,	195,	'&Aacute;vila',	'AV',	1),
(2977,	195,	'Badajoz',	'BJ',	1),
(2978,	195,	'Baleares',	'IB',	1),
(2979,	195,	'Barcelona',	'BA',	1),
(2980,	195,	'Burgos',	'BU',	1),
(2981,	195,	'C&aacute;ceres',	'CC',	1),
(2982,	195,	'C&aacute;diz',	'CZ',	1),
(2983,	195,	'Cantabria',	'CT',	1),
(2984,	195,	'Castell&oacute;n',	'CL',	1),
(2985,	195,	'Ceuta',	'CE',	1),
(2986,	195,	'Ciudad Real',	'CR',	1),
(2987,	195,	'C&oacute;rdoba',	'CD',	1),
(2988,	195,	'Cuenca',	'CU',	1),
(2989,	195,	'Girona',	'GI',	1),
(2990,	195,	'Granada',	'GD',	1),
(2991,	195,	'Guadalajara',	'GJ',	1),
(2992,	195,	'Guip&uacute;zcoa',	'GP',	1),
(2993,	195,	'Huelva',	'HL',	1),
(2994,	195,	'Huesca',	'HS',	1),
(2995,	195,	'Ja&eacute;n',	'JN',	1),
(2996,	195,	'La Rioja',	'RJ',	1),
(2997,	195,	'Las Palmas',	'PM',	1),
(2998,	195,	'Leon',	'LE',	1),
(2999,	195,	'Lleida',	'LL',	1),
(3000,	195,	'Lugo',	'LG',	1),
(3001,	195,	'Madrid',	'MD',	1),
(3002,	195,	'Malaga',	'MA',	1),
(3003,	195,	'Melilla',	'ML',	1),
(3004,	195,	'Murcia',	'MU',	1),
(3005,	195,	'Navarra',	'NV',	1),
(3006,	195,	'Ourense',	'OU',	1),
(3007,	195,	'Palencia',	'PL',	1),
(3008,	195,	'Pontevedra',	'PO',	1),
(3009,	195,	'Salamanca',	'SL',	1),
(3010,	195,	'Santa Cruz de Tenerife',	'SC',	1),
(3011,	195,	'Segovia',	'SG',	1),
(3012,	195,	'Sevilla',	'SV',	1),
(3013,	195,	'Soria',	'SO',	1),
(3014,	195,	'Tarragona',	'TA',	1),
(3015,	195,	'Teruel',	'TE',	1),
(3016,	195,	'Toledo',	'TO',	1),
(3017,	195,	'Valencia',	'VC',	1),
(3018,	195,	'Valladolid',	'VD',	1),
(3019,	195,	'Vizcaya',	'VZ',	1),
(3020,	195,	'Zamora',	'ZM',	1),
(3021,	195,	'Zaragoza',	'ZR',	1),
(3022,	196,	'Central',	'CE',	1),
(3023,	196,	'Eastern',	'EA',	1),
(3024,	196,	'North Central',	'NC',	1),
(3025,	196,	'Northern',	'NO',	1),
(3026,	196,	'North Western',	'NW',	1),
(3027,	196,	'Sabaragamuwa',	'SA',	1),
(3028,	196,	'Southern',	'SO',	1),
(3029,	196,	'Uva',	'UV',	1),
(3030,	196,	'Western',	'WE',	1),
(3031,	197,	'Ascension',	'A',	1),
(3032,	197,	'Saint Helena',	'S',	1),
(3033,	197,	'Tristan da Cunha',	'T',	1),
(3034,	199,	'A\'ali an Nil',	'ANL',	1),
(3035,	199,	'Al Bahr al Ahmar',	'BAM',	1),
(3036,	199,	'Al Buhayrat',	'BRT',	1),
(3037,	199,	'Al Jazirah',	'JZR',	1),
(3038,	199,	'Al Khartum',	'KRT',	1),
(3039,	199,	'Al Qadarif',	'QDR',	1),
(3040,	199,	'Al Wahdah',	'WDH',	1),
(3041,	199,	'An Nil al Abyad',	'ANB',	1),
(3042,	199,	'An Nil al Azraq',	'ANZ',	1),
(3043,	199,	'Ash Shamaliyah',	'ASH',	1),
(3044,	199,	'Bahr al Jabal',	'BJA',	1),
(3045,	199,	'Gharb al Istiwa\'iyah',	'GIS',	1),
(3046,	199,	'Gharb Bahr al Ghazal',	'GBG',	1),
(3047,	199,	'Gharb Darfur',	'GDA',	1),
(3048,	199,	'Gharb Kurdufan',	'GKU',	1),
(3049,	199,	'Janub Darfur',	'JDA',	1),
(3050,	199,	'Janub Kurdufan',	'JKU',	1),
(3051,	199,	'Junqali',	'JQL',	1),
(3052,	199,	'Kassala',	'KSL',	1),
(3053,	199,	'Nahr an Nil',	'NNL',	1),
(3054,	199,	'Shamal Bahr al Ghazal',	'SBG',	1),
(3055,	199,	'Shamal Darfur',	'SDA',	1),
(3056,	199,	'Shamal Kurdufan',	'SKU',	1),
(3057,	199,	'Sharq al Istiwa\'iyah',	'SIS',	1),
(3058,	199,	'Sinnar',	'SNR',	1),
(3059,	199,	'Warab',	'WRB',	1),
(3060,	200,	'Brokopondo',	'BR',	1),
(3061,	200,	'Commewijne',	'CM',	1),
(3062,	200,	'Coronie',	'CR',	1),
(3063,	200,	'Marowijne',	'MA',	1),
(3064,	200,	'Nickerie',	'NI',	1),
(3065,	200,	'Para',	'PA',	1),
(3066,	200,	'Paramaribo',	'PM',	1),
(3067,	200,	'Saramacca',	'SA',	1),
(3068,	200,	'Sipaliwini',	'SI',	1),
(3069,	200,	'Wanica',	'WA',	1),
(3070,	202,	'Hhohho',	'H',	1),
(3071,	202,	'Lubombo',	'L',	1),
(3072,	202,	'Manzini',	'M',	1),
(3073,	202,	'Shishelweni',	'S',	1),
(3074,	203,	'Blekinge',	'K',	1),
(3075,	203,	'Dalarna',	'W',	1),
(3076,	203,	'G&auml;vleborg',	'X',	1),
(3077,	203,	'Gotland',	'I',	1),
(3078,	203,	'Halland',	'N',	1),
(3079,	203,	'J&auml;mtland',	'Z',	1),
(3080,	203,	'J&ouml;nk&ouml;ping',	'F',	1),
(3081,	203,	'Kalmar',	'H',	1),
(3082,	203,	'Kronoberg',	'G',	1),
(3083,	203,	'Norrbotten',	'BD',	1),
(3084,	203,	'&Ouml;rebro',	'T',	1),
(3085,	203,	'&Ouml;sterg&ouml;tland',	'E',	1),
(3086,	203,	'Sk&aring;ne',	'M',	1),
(3087,	203,	'S&ouml;dermanland',	'D',	1),
(3088,	203,	'Stockholm',	'AB',	1),
(3089,	203,	'Uppsala',	'C',	1),
(3090,	203,	'V&auml;rmland',	'S',	1),
(3091,	203,	'V&auml;sterbotten',	'AC',	1),
(3092,	203,	'V&auml;sternorrland',	'Y',	1),
(3093,	203,	'V&auml;stmanland',	'U',	1),
(3094,	203,	'V&auml;stra G&ouml;taland',	'O',	1),
(3095,	204,	'Aargau',	'AG',	1),
(3096,	204,	'Appenzell Ausserrhoden',	'AR',	1),
(3097,	204,	'Appenzell Innerrhoden',	'AI',	1),
(3098,	204,	'Basel-Stadt',	'BS',	1),
(3099,	204,	'Basel-Landschaft',	'BL',	1),
(3100,	204,	'Bern',	'BE',	1),
(3101,	204,	'Fribourg',	'FR',	1),
(3102,	204,	'Gen&egrave;ve',	'GE',	1),
(3103,	204,	'Glarus',	'GL',	1),
(3104,	204,	'Graub&uuml;nden',	'GR',	1),
(3105,	204,	'Jura',	'JU',	1),
(3106,	204,	'Luzern',	'LU',	1),
(3107,	204,	'Neuch&acirc;tel',	'NE',	1),
(3108,	204,	'Nidwald',	'NW',	1),
(3109,	204,	'Obwald',	'OW',	1),
(3110,	204,	'St. Gallen',	'SG',	1),
(3111,	204,	'Schaffhausen',	'SH',	1),
(3112,	204,	'Schwyz',	'SZ',	1),
(3113,	204,	'Solothurn',	'SO',	1),
(3114,	204,	'Thurgau',	'TG',	1),
(3115,	204,	'Ticino',	'TI',	1),
(3116,	204,	'Uri',	'UR',	1),
(3117,	204,	'Valais',	'VS',	1),
(3118,	204,	'Vaud',	'VD',	1),
(3119,	204,	'Zug',	'ZG',	1),
(3120,	204,	'Z&uuml;rich',	'ZH',	1),
(3121,	205,	'Al Hasakah',	'HA',	1),
(3122,	205,	'Al Ladhiqiyah',	'LA',	1),
(3123,	205,	'Al Qunaytirah',	'QU',	1),
(3124,	205,	'Ar Raqqah',	'RQ',	1),
(3125,	205,	'As Suwayda',	'SU',	1),
(3126,	205,	'Dara',	'DA',	1),
(3127,	205,	'Dayr az Zawr',	'DZ',	1),
(3128,	205,	'Dimashq',	'DI',	1),
(3129,	205,	'Halab',	'HL',	1),
(3130,	205,	'Hamah',	'HM',	1),
(3131,	205,	'Hims',	'HI',	1),
(3132,	205,	'Idlib',	'ID',	1),
(3133,	205,	'Rif Dimashq',	'RD',	1),
(3134,	205,	'Tartus',	'TA',	1),
(3135,	206,	'Chang-hua',	'CH',	1),
(3136,	206,	'Chia-i',	'CI',	1),
(3137,	206,	'Hsin-chu',	'HS',	1),
(3138,	206,	'Hua-lien',	'HL',	1),
(3139,	206,	'I-lan',	'IL',	1),
(3140,	206,	'Kao-hsiung county',	'KH',	1),
(3141,	206,	'Kin-men',	'KM',	1),
(3142,	206,	'Lien-chiang',	'LC',	1),
(3143,	206,	'Miao-li',	'ML',	1),
(3144,	206,	'Nan-t\'ou',	'NT',	1),
(3145,	206,	'P\'eng-hu',	'PH',	1),
(3146,	206,	'P\'ing-tung',	'PT',	1),
(3147,	206,	'T\'ai-chung',	'TG',	1),
(3148,	206,	'T\'ai-nan',	'TA',	1),
(3149,	206,	'T\'ai-pei county',	'TP',	1),
(3150,	206,	'T\'ai-tung',	'TT',	1),
(3151,	206,	'T\'ao-yuan',	'TY',	1),
(3152,	206,	'Yun-lin',	'YL',	1),
(3153,	206,	'Chia-i city',	'CC',	1),
(3154,	206,	'Chi-lung',	'CL',	1),
(3155,	206,	'Hsin-chu',	'HC',	1),
(3156,	206,	'T\'ai-chung',	'TH',	1),
(3157,	206,	'T\'ai-nan',	'TN',	1),
(3158,	206,	'Kao-hsiung city',	'KC',	1),
(3159,	206,	'T\'ai-pei city',	'TC',	1),
(3160,	207,	'Gorno-Badakhstan',	'GB',	1),
(3161,	207,	'Khatlon',	'KT',	1),
(3162,	207,	'Sughd',	'SU',	1),
(3163,	208,	'Arusha',	'AR',	1),
(3164,	208,	'Dar es Salaam',	'DS',	1),
(3165,	208,	'Dodoma',	'DO',	1),
(3166,	208,	'Iringa',	'IR',	1),
(3167,	208,	'Kagera',	'KA',	1),
(3168,	208,	'Kigoma',	'KI',	1),
(3169,	208,	'Kilimanjaro',	'KJ',	1),
(3170,	208,	'Lindi',	'LN',	1),
(3171,	208,	'Manyara',	'MY',	1),
(3172,	208,	'Mara',	'MR',	1),
(3173,	208,	'Mbeya',	'MB',	1),
(3174,	208,	'Morogoro',	'MO',	1),
(3175,	208,	'Mtwara',	'MT',	1),
(3176,	208,	'Mwanza',	'MW',	1),
(3177,	208,	'Pemba North',	'PN',	1),
(3178,	208,	'Pemba South',	'PS',	1),
(3179,	208,	'Pwani',	'PW',	1),
(3180,	208,	'Rukwa',	'RK',	1),
(3181,	208,	'Ruvuma',	'RV',	1),
(3182,	208,	'Shinyanga',	'SH',	1),
(3183,	208,	'Singida',	'SI',	1),
(3184,	208,	'Tabora',	'TB',	1),
(3185,	208,	'Tanga',	'TN',	1),
(3186,	208,	'Zanzibar Central/South',	'ZC',	1),
(3187,	208,	'Zanzibar North',	'ZN',	1),
(3188,	208,	'Zanzibar Urban/West',	'ZU',	1),
(3189,	209,	'Amnat Charoen',	'Amnat Charoen',	1),
(3190,	209,	'Ang Thong',	'Ang Thong',	1),
(3191,	209,	'Ayutthaya',	'Ayutthaya',	1),
(3192,	209,	'Bangkok',	'Bangkok',	1),
(3193,	209,	'Buriram',	'Buriram',	1),
(3194,	209,	'Chachoengsao',	'Chachoengsao',	1),
(3195,	209,	'Chai Nat',	'Chai Nat',	1),
(3196,	209,	'Chaiyaphum',	'Chaiyaphum',	1),
(3197,	209,	'Chanthaburi',	'Chanthaburi',	1),
(3198,	209,	'Chiang Mai',	'Chiang Mai',	1),
(3199,	209,	'Chiang Rai',	'Chiang Rai',	1),
(3200,	209,	'Chon Buri',	'Chon Buri',	1),
(3201,	209,	'Chumphon',	'Chumphon',	1),
(3202,	209,	'Kalasin',	'Kalasin',	1),
(3203,	209,	'Kamphaeng Phet',	'Kamphaeng Phet',	1),
(3204,	209,	'Kanchanaburi',	'Kanchanaburi',	1),
(3205,	209,	'Khon Kaen',	'Khon Kaen',	1),
(3206,	209,	'Krabi',	'Krabi',	1),
(3207,	209,	'Lampang',	'Lampang',	1),
(3208,	209,	'Lamphun',	'Lamphun',	1),
(3209,	209,	'Loei',	'Loei',	1),
(3210,	209,	'Lop Buri',	'Lop Buri',	1),
(3211,	209,	'Mae Hong Son',	'Mae Hong Son',	1),
(3212,	209,	'Maha Sarakham',	'Maha Sarakham',	1),
(3213,	209,	'Mukdahan',	'Mukdahan',	1),
(3214,	209,	'Nakhon Nayok',	'Nakhon Nayok',	1),
(3215,	209,	'Nakhon Pathom',	'Nakhon Pathom',	1),
(3216,	209,	'Nakhon Phanom',	'Nakhon Phanom',	1),
(3217,	209,	'Nakhon Ratchasima',	'Nakhon Ratchasima',	1),
(3218,	209,	'Nakhon Sawan',	'Nakhon Sawan',	1),
(3219,	209,	'Nakhon Si Thammarat',	'Nakhon Si Thammarat',	1),
(3220,	209,	'Nan',	'Nan',	1),
(3221,	209,	'Narathiwat',	'Narathiwat',	1),
(3222,	209,	'Nong Bua Lamphu',	'Nong Bua Lamphu',	1),
(3223,	209,	'Nong Khai',	'Nong Khai',	1),
(3224,	209,	'Nonthaburi',	'Nonthaburi',	1),
(3225,	209,	'Pathum Thani',	'Pathum Thani',	1),
(3226,	209,	'Pattani',	'Pattani',	1),
(3227,	209,	'Phangnga',	'Phangnga',	1),
(3228,	209,	'Phatthalung',	'Phatthalung',	1),
(3229,	209,	'Phayao',	'Phayao',	1),
(3230,	209,	'Phetchabun',	'Phetchabun',	1),
(3231,	209,	'Phetchaburi',	'Phetchaburi',	1),
(3232,	209,	'Phichit',	'Phichit',	1),
(3233,	209,	'Phitsanulok',	'Phitsanulok',	1),
(3234,	209,	'Phrae',	'Phrae',	1),
(3235,	209,	'Phuket',	'Phuket',	1),
(3236,	209,	'Prachin Buri',	'Prachin Buri',	1),
(3237,	209,	'Prachuap Khiri Khan',	'Prachuap Khiri Khan',	1),
(3238,	209,	'Ranong',	'Ranong',	1),
(3239,	209,	'Ratchaburi',	'Ratchaburi',	1),
(3240,	209,	'Rayong',	'Rayong',	1),
(3241,	209,	'Roi Et',	'Roi Et',	1),
(3242,	209,	'Sa Kaeo',	'Sa Kaeo',	1),
(3243,	209,	'Sakon Nakhon',	'Sakon Nakhon',	1),
(3244,	209,	'Samut Prakan',	'Samut Prakan',	1),
(3245,	209,	'Samut Sakhon',	'Samut Sakhon',	1),
(3246,	209,	'Samut Songkhram',	'Samut Songkhram',	1),
(3247,	209,	'Sara Buri',	'Sara Buri',	1),
(3248,	209,	'Satun',	'Satun',	1),
(3249,	209,	'Sing Buri',	'Sing Buri',	1),
(3250,	209,	'Sisaket',	'Sisaket',	1),
(3251,	209,	'Songkhla',	'Songkhla',	1),
(3252,	209,	'Sukhothai',	'Sukhothai',	1),
(3253,	209,	'Suphan Buri',	'Suphan Buri',	1),
(3254,	209,	'Surat Thani',	'Surat Thani',	1),
(3255,	209,	'Surin',	'Surin',	1),
(3256,	209,	'Tak',	'Tak',	1),
(3257,	209,	'Trang',	'Trang',	1),
(3258,	209,	'Trat',	'Trat',	1),
(3259,	209,	'Ubon Ratchathani',	'Ubon Ratchathani',	1),
(3260,	209,	'Udon Thani',	'Udon Thani',	1),
(3261,	209,	'Uthai Thani',	'Uthai Thani',	1),
(3262,	209,	'Uttaradit',	'Uttaradit',	1),
(3263,	209,	'Yala',	'Yala',	1),
(3264,	209,	'Yasothon',	'Yasothon',	1),
(3265,	210,	'Kara',	'K',	1),
(3266,	210,	'Plateaux',	'P',	1),
(3267,	210,	'Savanes',	'S',	1),
(3268,	210,	'Centrale',	'C',	1),
(3269,	210,	'Maritime',	'M',	1),
(3270,	211,	'Atafu',	'A',	1),
(3271,	211,	'Fakaofo',	'F',	1),
(3272,	211,	'Nukunonu',	'N',	1),
(3273,	212,	'Ha\'apai',	'H',	1),
(3274,	212,	'Tongatapu',	'T',	1),
(3275,	212,	'Vava\'u',	'V',	1),
(3276,	213,	'Couva/Tabaquite/Talparo',	'CT',	1),
(3277,	213,	'Diego Martin',	'DM',	1),
(3278,	213,	'Mayaro/Rio Claro',	'MR',	1),
(3279,	213,	'Penal/Debe',	'PD',	1),
(3280,	213,	'Princes Town',	'PT',	1),
(3281,	213,	'Sangre Grande',	'SG',	1),
(3282,	213,	'San Juan/Laventille',	'SL',	1),
(3283,	213,	'Siparia',	'SI',	1),
(3284,	213,	'Tunapuna/Piarco',	'TP',	1),
(3285,	213,	'Port of Spain',	'PS',	1),
(3286,	213,	'San Fernando',	'SF',	1),
(3287,	213,	'Arima',	'AR',	1),
(3288,	213,	'Point Fortin',	'PF',	1),
(3289,	213,	'Chaguanas',	'CH',	1),
(3290,	213,	'Tobago',	'TO',	1),
(3291,	214,	'Ariana',	'AR',	1),
(3292,	214,	'Beja',	'BJ',	1),
(3293,	214,	'Ben Arous',	'BA',	1),
(3294,	214,	'Bizerte',	'BI',	1),
(3295,	214,	'Gabes',	'GB',	1),
(3296,	214,	'Gafsa',	'GF',	1),
(3297,	214,	'Jendouba',	'JE',	1),
(3298,	214,	'Kairouan',	'KR',	1),
(3299,	214,	'Kasserine',	'KS',	1),
(3300,	214,	'Kebili',	'KB',	1),
(3301,	214,	'Kef',	'KF',	1),
(3302,	214,	'Mahdia',	'MH',	1),
(3303,	214,	'Manouba',	'MN',	1),
(3304,	214,	'Medenine',	'ME',	1),
(3305,	214,	'Monastir',	'MO',	1),
(3306,	214,	'Nabeul',	'NA',	1),
(3307,	214,	'Sfax',	'SF',	1),
(3308,	214,	'Sidi',	'SD',	1),
(3309,	214,	'Siliana',	'SL',	1),
(3310,	214,	'Sousse',	'SO',	1),
(3311,	214,	'Tataouine',	'TA',	1),
(3312,	214,	'Tozeur',	'TO',	1),
(3313,	214,	'Tunis',	'TU',	1),
(3314,	214,	'Zaghouan',	'ZA',	1),
(3315,	215,	'Adana',	'ADA',	1),
(3316,	215,	'Adıyaman',	'ADI',	1),
(3317,	215,	'Afyonkarahisar',	'AFY',	1),
(3318,	215,	'Ağrı',	'AGR',	1),
(3319,	215,	'Aksaray',	'AKS',	1),
(3320,	215,	'Amasya',	'AMA',	1),
(3321,	215,	'Ankara',	'ANK',	1),
(3322,	215,	'Antalya',	'ANT',	1),
(3323,	215,	'Ardahan',	'ARD',	1),
(3324,	215,	'Artvin',	'ART',	1),
(3325,	215,	'Aydın',	'AYI',	1),
(3326,	215,	'Balıkesir',	'BAL',	1),
(3327,	215,	'Bartın',	'BAR',	1),
(3328,	215,	'Batman',	'BAT',	1),
(3329,	215,	'Bayburt',	'BAY',	1),
(3330,	215,	'Bilecik',	'BIL',	1),
(3331,	215,	'Bingöl',	'BIN',	1),
(3332,	215,	'Bitlis',	'BIT',	1),
(3333,	215,	'Bolu',	'BOL',	1),
(3334,	215,	'Burdur',	'BRD',	1),
(3335,	215,	'Bursa',	'BRS',	1),
(3336,	215,	'Çanakkale',	'CKL',	1),
(3337,	215,	'Çankırı',	'CKR',	1),
(3338,	215,	'Çorum',	'COR',	1),
(3339,	215,	'Denizli',	'DEN',	1),
(3340,	215,	'Diyarbakır',	'DIY',	1),
(3341,	215,	'Düzce',	'DUZ',	1),
(3342,	215,	'Edirne',	'EDI',	1),
(3343,	215,	'Elazığ',	'ELA',	1),
(3344,	215,	'Erzincan',	'EZC',	1),
(3345,	215,	'Erzurum',	'EZR',	1),
(3346,	215,	'Eskişehir',	'ESK',	1),
(3347,	215,	'Gaziantep',	'GAZ',	1),
(3348,	215,	'Giresun',	'GIR',	1),
(3349,	215,	'Gümüşhane',	'GMS',	1),
(3350,	215,	'Hakkari',	'HKR',	1),
(3351,	215,	'Hatay',	'HTY',	1),
(3352,	215,	'Iğdır',	'IGD',	1),
(3353,	215,	'Isparta',	'ISP',	1),
(3354,	215,	'İstanbul',	'IST',	1),
(3355,	215,	'İzmir',	'IZM',	1),
(3356,	215,	'Kahramanmaraş',	'KAH',	1),
(3357,	215,	'Karabük',	'KRB',	1),
(3358,	215,	'Karaman',	'KRM',	1),
(3359,	215,	'Kars',	'KRS',	1),
(3360,	215,	'Kastamonu',	'KAS',	1),
(3361,	215,	'Kayseri',	'KAY',	1),
(3362,	215,	'Kilis',	'KLS',	1),
(3363,	215,	'Kırıkkale',	'KRK',	1),
(3364,	215,	'Kırklareli',	'KLR',	1),
(3365,	215,	'Kırşehir',	'KRH',	1),
(3366,	215,	'Kocaeli',	'KOC',	1),
(3367,	215,	'Konya',	'KON',	1),
(3368,	215,	'Kütahya',	'KUT',	1),
(3369,	215,	'Malatya',	'MAL',	1),
(3370,	215,	'Manisa',	'MAN',	1),
(3371,	215,	'Mardin',	'MAR',	1),
(3372,	215,	'Mersin',	'MER',	1),
(3373,	215,	'Muğla',	'MUG',	1),
(3374,	215,	'Muş',	'MUS',	1),
(3375,	215,	'Nevşehir',	'NEV',	1),
(3376,	215,	'Niğde',	'NIG',	1),
(3377,	215,	'Ordu',	'ORD',	1),
(3378,	215,	'Osmaniye',	'OSM',	1),
(3379,	215,	'Rize',	'RIZ',	1),
(3380,	215,	'Sakarya',	'SAK',	1),
(3381,	215,	'Samsun',	'SAM',	1),
(3382,	215,	'Şanlıurfa',	'SAN',	1),
(3383,	215,	'Siirt',	'SII',	1),
(3384,	215,	'Sinop',	'SIN',	1),
(3385,	215,	'Şırnak',	'SIR',	1),
(3386,	215,	'Sivas',	'SIV',	1),
(3387,	215,	'Tekirdağ',	'TEL',	1),
(3388,	215,	'Tokat',	'TOK',	1),
(3389,	215,	'Trabzon',	'TRA',	1),
(3390,	215,	'Tunceli',	'TUN',	1),
(3391,	215,	'Uşak',	'USK',	1),
(3392,	215,	'Van',	'VAN',	1),
(3393,	215,	'Yalova',	'YAL',	1),
(3394,	215,	'Yozgat',	'YOZ',	1),
(3395,	215,	'Zonguldak',	'ZON',	1),
(3396,	216,	'Ahal Welayaty',	'A',	1),
(3397,	216,	'Balkan Welayaty',	'B',	1),
(3398,	216,	'Dashhowuz Welayaty',	'D',	1),
(3399,	216,	'Lebap Welayaty',	'L',	1),
(3400,	216,	'Mary Welayaty',	'M',	1),
(3401,	217,	'Ambergris Cays',	'AC',	1),
(3402,	217,	'Dellis Cay',	'DC',	1),
(3403,	217,	'French Cay',	'FC',	1),
(3404,	217,	'Little Water Cay',	'LW',	1),
(3405,	217,	'Parrot Cay',	'RC',	1),
(3406,	217,	'Pine Cay',	'PN',	1),
(3407,	217,	'Salt Cay',	'SL',	1),
(3408,	217,	'Grand Turk',	'GT',	1),
(3409,	217,	'South Caicos',	'SC',	1),
(3410,	217,	'East Caicos',	'EC',	1),
(3411,	217,	'Middle Caicos',	'MC',	1),
(3412,	217,	'North Caicos',	'NC',	1),
(3413,	217,	'Providenciales',	'PR',	1),
(3414,	217,	'West Caicos',	'WC',	1),
(3415,	218,	'Nanumanga',	'NMG',	1),
(3416,	218,	'Niulakita',	'NLK',	1),
(3417,	218,	'Niutao',	'NTO',	1),
(3418,	218,	'Funafuti',	'FUN',	1),
(3419,	218,	'Nanumea',	'NME',	1),
(3420,	218,	'Nui',	'NUI',	1),
(3421,	218,	'Nukufetau',	'NFT',	1),
(3422,	218,	'Nukulaelae',	'NLL',	1),
(3423,	218,	'Vaitupu',	'VAI',	1),
(3424,	219,	'Kalangala',	'KAL',	1),
(3425,	219,	'Kampala',	'KMP',	1),
(3426,	219,	'Kayunga',	'KAY',	1),
(3427,	219,	'Kiboga',	'KIB',	1),
(3428,	219,	'Luwero',	'LUW',	1),
(3429,	219,	'Masaka',	'MAS',	1),
(3430,	219,	'Mpigi',	'MPI',	1),
(3431,	219,	'Mubende',	'MUB',	1),
(3432,	219,	'Mukono',	'MUK',	1),
(3433,	219,	'Nakasongola',	'NKS',	1),
(3434,	219,	'Rakai',	'RAK',	1),
(3435,	219,	'Sembabule',	'SEM',	1),
(3436,	219,	'Wakiso',	'WAK',	1),
(3437,	219,	'Bugiri',	'BUG',	1),
(3438,	219,	'Busia',	'BUS',	1),
(3439,	219,	'Iganga',	'IGA',	1),
(3440,	219,	'Jinja',	'JIN',	1),
(3441,	219,	'Kaberamaido',	'KAB',	1),
(3442,	219,	'Kamuli',	'KML',	1),
(3443,	219,	'Kapchorwa',	'KPC',	1),
(3444,	219,	'Katakwi',	'KTK',	1),
(3445,	219,	'Kumi',	'KUM',	1),
(3446,	219,	'Mayuge',	'MAY',	1),
(3447,	219,	'Mbale',	'MBA',	1),
(3448,	219,	'Pallisa',	'PAL',	1),
(3449,	219,	'Sironko',	'SIR',	1),
(3450,	219,	'Soroti',	'SOR',	1),
(3451,	219,	'Tororo',	'TOR',	1),
(3452,	219,	'Adjumani',	'ADJ',	1),
(3453,	219,	'Apac',	'APC',	1),
(3454,	219,	'Arua',	'ARU',	1),
(3455,	219,	'Gulu',	'GUL',	1),
(3456,	219,	'Kitgum',	'KIT',	1),
(3457,	219,	'Kotido',	'KOT',	1),
(3458,	219,	'Lira',	'LIR',	1),
(3459,	219,	'Moroto',	'MRT',	1),
(3460,	219,	'Moyo',	'MOY',	1),
(3461,	219,	'Nakapiripirit',	'NAK',	1),
(3462,	219,	'Nebbi',	'NEB',	1),
(3463,	219,	'Pader',	'PAD',	1),
(3464,	219,	'Yumbe',	'YUM',	1),
(3465,	219,	'Bundibugyo',	'BUN',	1),
(3466,	219,	'Bushenyi',	'BSH',	1),
(3467,	219,	'Hoima',	'HOI',	1),
(3468,	219,	'Kabale',	'KBL',	1),
(3469,	219,	'Kabarole',	'KAR',	1),
(3470,	219,	'Kamwenge',	'KAM',	1),
(3471,	219,	'Kanungu',	'KAN',	1),
(3472,	219,	'Kasese',	'KAS',	1),
(3473,	219,	'Kibaale',	'KBA',	1),
(3474,	219,	'Kisoro',	'KIS',	1),
(3475,	219,	'Kyenjojo',	'KYE',	1),
(3476,	219,	'Masindi',	'MSN',	1),
(3477,	219,	'Mbarara',	'MBR',	1),
(3478,	219,	'Ntungamo',	'NTU',	1),
(3479,	219,	'Rukungiri',	'RUK',	1),
(3480,	220,	'Черкасская область',	'71',	1),
(3481,	220,	'Черниговская область',	'74',	1),
(3482,	220,	'Черновицкая область',	'77',	1),
(3483,	220,	'Автономная Республика Крым',	'43',	1),
(3484,	220,	'Днепропетровская область',	'12',	1),
(3485,	220,	'Донецкая область',	'14',	1),
(3486,	220,	'Ивано-Франковская область',	'26',	1),
(3487,	220,	'Херсонская область',	'65',	1),
(3488,	220,	'Хмельницкая область',	'68',	1),
(3489,	220,	'Кировоградская область',	'35',	1),
(3490,	220,	'Киев',	'30',	1),
(3491,	220,	'Киевская область',	'32',	1),
(3492,	220,	'Луганская область',	'09',	1),
(3493,	220,	'Львовская область',	'46',	1),
(3494,	220,	'Николаевская область',	'48',	1),
(3495,	220,	'Одесская область',	'51',	1),
(3496,	220,	'Полтавская область',	'53',	1),
(3497,	220,	'Ровненская область',	'56',	1),
(3498,	220,	'Севастополь',	'40',	1),
(3499,	220,	'Сумская область',	'59',	1),
(3500,	220,	'Тернопольская область',	'61',	1),
(3501,	220,	'Винницкая область',	'05',	1),
(3502,	220,	'Волынская область',	'07',	1),
(3503,	220,	'Закарпатская область',	'21',	1),
(3504,	220,	'Запорожская область',	'23',	1),
(3505,	220,	'Житомирская область',	'18',	1),
(3506,	221,	'Abu Dhabi',	'ADH',	1),
(3507,	221,	'\'Ajman',	'AJ',	1),
(3508,	221,	'Al Fujayrah',	'FU',	1),
(3509,	221,	'Ash Shariqah',	'SH',	1),
(3510,	221,	'Dubai',	'DU',	1),
(3511,	221,	'R\'as al Khaymah',	'RK',	1),
(3512,	221,	'Umm al Qaywayn',	'UQ',	1),
(3513,	222,	'Aberdeen',	'ABN',	1),
(3514,	222,	'Aberdeenshire',	'ABNS',	1),
(3515,	222,	'Anglesey',	'ANG',	1),
(3516,	222,	'Angus',	'AGS',	1),
(3517,	222,	'Argyll and Bute',	'ARY',	1),
(3518,	222,	'Bedfordshire',	'BEDS',	1),
(3519,	222,	'Berkshire',	'BERKS',	1),
(3520,	222,	'Blaenau Gwent',	'BLA',	1),
(3521,	222,	'Bridgend',	'BRI',	1),
(3522,	222,	'Bristol',	'BSTL',	1),
(3523,	222,	'Buckinghamshire',	'BUCKS',	1),
(3524,	222,	'Caerphilly',	'CAE',	1),
(3525,	222,	'Cambridgeshire',	'CAMBS',	1),
(3526,	222,	'Cardiff',	'CDF',	1),
(3527,	222,	'Carmarthenshire',	'CARM',	1),
(3528,	222,	'Ceredigion',	'CDGN',	1),
(3529,	222,	'Cheshire',	'CHES',	1),
(3530,	222,	'Clackmannanshire',	'CLACK',	1),
(3531,	222,	'Conwy',	'CON',	1),
(3532,	222,	'Cornwall',	'CORN',	1),
(3533,	222,	'Denbighshire',	'DNBG',	1),
(3534,	222,	'Derbyshire',	'DERBY',	1),
(3535,	222,	'Devon',	'DVN',	1),
(3536,	222,	'Dorset',	'DOR',	1),
(3537,	222,	'Dumfries and Galloway',	'DGL',	1),
(3538,	222,	'Dundee',	'DUND',	1),
(3539,	222,	'Durham',	'DHM',	1),
(3540,	222,	'East Ayrshire',	'ARYE',	1),
(3541,	222,	'East Dunbartonshire',	'DUNBE',	1),
(3542,	222,	'East Lothian',	'LOTE',	1),
(3543,	222,	'East Renfrewshire',	'RENE',	1),
(3544,	222,	'East Riding of Yorkshire',	'ERYS',	1),
(3545,	222,	'East Sussex',	'SXE',	1),
(3546,	222,	'Edinburgh',	'EDIN',	1),
(3547,	222,	'Essex',	'ESX',	1),
(3548,	222,	'Falkirk',	'FALK',	1),
(3549,	222,	'Fife',	'FFE',	1),
(3550,	222,	'Flintshire',	'FLINT',	1),
(3551,	222,	'Glasgow',	'GLAS',	1),
(3552,	222,	'Gloucestershire',	'GLOS',	1),
(3553,	222,	'Greater London',	'LDN',	1),
(3554,	222,	'Greater Manchester',	'MCH',	1),
(3555,	222,	'Gwynedd',	'GDD',	1),
(3556,	222,	'Hampshire',	'HANTS',	1),
(3557,	222,	'Herefordshire',	'HWR',	1),
(3558,	222,	'Hertfordshire',	'HERTS',	1),
(3559,	222,	'Highlands',	'HLD',	1),
(3560,	222,	'Inverclyde',	'IVER',	1),
(3561,	222,	'Isle of Wight',	'IOW',	1),
(3562,	222,	'Kent',	'KNT',	1),
(3563,	222,	'Lancashire',	'LANCS',	1),
(3564,	222,	'Leicestershire',	'LEICS',	1),
(3565,	222,	'Lincolnshire',	'LINCS',	1),
(3566,	222,	'Merseyside',	'MSY',	1),
(3567,	222,	'Merthyr Tydfil',	'MERT',	1),
(3568,	222,	'Midlothian',	'MLOT',	1),
(3569,	222,	'Monmouthshire',	'MMOUTH',	1),
(3570,	222,	'Moray',	'MORAY',	1),
(3571,	222,	'Neath Port Talbot',	'NPRTAL',	1),
(3572,	222,	'Newport',	'NEWPT',	1),
(3573,	222,	'Norfolk',	'NOR',	1),
(3574,	222,	'North Ayrshire',	'ARYN',	1),
(3575,	222,	'North Lanarkshire',	'LANN',	1),
(3576,	222,	'North Yorkshire',	'YSN',	1),
(3577,	222,	'Northamptonshire',	'NHM',	1),
(3578,	222,	'Northumberland',	'NLD',	1),
(3579,	222,	'Nottinghamshire',	'NOT',	1),
(3580,	222,	'Orkney Islands',	'ORK',	1),
(3581,	222,	'Oxfordshire',	'OFE',	1),
(3582,	222,	'Pembrokeshire',	'PEM',	1),
(3583,	222,	'Perth and Kinross',	'PERTH',	1),
(3584,	222,	'Powys',	'PWS',	1),
(3585,	222,	'Renfrewshire',	'REN',	1),
(3586,	222,	'Rhondda Cynon Taff',	'RHON',	1),
(3587,	222,	'Rutland',	'RUT',	1),
(3588,	222,	'Scottish Borders',	'BOR',	1),
(3589,	222,	'Shetland Islands',	'SHET',	1),
(3590,	222,	'Shropshire',	'SPE',	1),
(3591,	222,	'Somerset',	'SOM',	1),
(3592,	222,	'South Ayrshire',	'ARYS',	1),
(3593,	222,	'South Lanarkshire',	'LANS',	1),
(3594,	222,	'South Yorkshire',	'YSS',	1),
(3595,	222,	'Staffordshire',	'SFD',	1),
(3596,	222,	'Stirling',	'STIR',	1),
(3597,	222,	'Suffolk',	'SFK',	1),
(3598,	222,	'Surrey',	'SRY',	1),
(3599,	222,	'Swansea',	'SWAN',	1),
(3600,	222,	'Torfaen',	'TORF',	1),
(3601,	222,	'Tyne and Wear',	'TWR',	1),
(3602,	222,	'Vale of Glamorgan',	'VGLAM',	1),
(3603,	222,	'Warwickshire',	'WARKS',	1),
(3604,	222,	'West Dunbartonshire',	'WDUN',	1),
(3605,	222,	'West Lothian',	'WLOT',	1),
(3606,	222,	'West Midlands',	'WMD',	1),
(3607,	222,	'West Sussex',	'SXW',	1),
(3608,	222,	'West Yorkshire',	'YSW',	1),
(3609,	222,	'Western Isles',	'WIL',	1),
(3610,	222,	'Wiltshire',	'WLT',	1),
(3611,	222,	'Worcestershire',	'WORCS',	1),
(3612,	222,	'Wrexham',	'WRX',	1),
(3613,	223,	'Alabama',	'AL',	1),
(3614,	223,	'Alaska',	'AK',	1),
(3615,	223,	'American Samoa',	'AS',	1),
(3616,	223,	'Arizona',	'AZ',	1),
(3617,	223,	'Arkansas',	'AR',	1),
(3618,	223,	'Armed Forces Africa',	'AF',	1),
(3619,	223,	'Armed Forces Americas',	'AA',	1),
(3620,	223,	'Armed Forces Canada',	'AC',	1),
(3621,	223,	'Armed Forces Europe',	'AE',	1),
(3622,	223,	'Armed Forces Middle East',	'AM',	1),
(3623,	223,	'Armed Forces Pacific',	'AP',	1),
(3624,	223,	'California',	'CA',	1),
(3625,	223,	'Colorado',	'CO',	1),
(3626,	223,	'Connecticut',	'CT',	1),
(3627,	223,	'Delaware',	'DE',	1),
(3628,	223,	'District of Columbia',	'DC',	1),
(3629,	223,	'Federated States Of Micronesia',	'FM',	1),
(3630,	223,	'Florida',	'FL',	1),
(3631,	223,	'Georgia',	'GA',	1),
(3632,	223,	'Guam',	'GU',	1),
(3633,	223,	'Hawaii',	'HI',	1),
(3634,	223,	'Idaho',	'ID',	1),
(3635,	223,	'Illinois',	'IL',	1),
(3636,	223,	'Indiana',	'IN',	1),
(3637,	223,	'Iowa',	'IA',	1),
(3638,	223,	'Kansas',	'KS',	1),
(3639,	223,	'Kentucky',	'KY',	1),
(3640,	223,	'Louisiana',	'LA',	1),
(3641,	223,	'Maine',	'ME',	1),
(3642,	223,	'Marshall Islands',	'MH',	1),
(3643,	223,	'Maryland',	'MD',	1),
(3644,	223,	'Massachusetts',	'MA',	1),
(3645,	223,	'Michigan',	'MI',	1),
(3646,	223,	'Minnesota',	'MN',	1),
(3647,	223,	'Mississippi',	'MS',	1),
(3648,	223,	'Missouri',	'MO',	1),
(3649,	223,	'Montana',	'MT',	1),
(3650,	223,	'Nebraska',	'NE',	1),
(3651,	223,	'Nevada',	'NV',	1),
(3652,	223,	'New Hampshire',	'NH',	1),
(3653,	223,	'New Jersey',	'NJ',	1),
(3654,	223,	'New Mexico',	'NM',	1),
(3655,	223,	'New York',	'NY',	1),
(3656,	223,	'North Carolina',	'NC',	1),
(3657,	223,	'North Dakota',	'ND',	1),
(3658,	223,	'Northern Mariana Islands',	'MP',	1),
(3659,	223,	'Ohio',	'OH',	1),
(3660,	223,	'Oklahoma',	'OK',	1),
(3661,	223,	'Oregon',	'OR',	1),
(3662,	223,	'Palau',	'PW',	1),
(3663,	223,	'Pennsylvania',	'PA',	1),
(3664,	223,	'Puerto Rico',	'PR',	1),
(3665,	223,	'Rhode Island',	'RI',	1),
(3666,	223,	'South Carolina',	'SC',	1),
(3667,	223,	'South Dakota',	'SD',	1),
(3668,	223,	'Tennessee',	'TN',	1),
(3669,	223,	'Texas',	'TX',	1),
(3670,	223,	'Utah',	'UT',	1),
(3671,	223,	'Vermont',	'VT',	1),
(3672,	223,	'Virgin Islands',	'VI',	1),
(3673,	223,	'Virginia',	'VA',	1),
(3674,	223,	'Washington',	'WA',	1),
(3675,	223,	'West Virginia',	'WV',	1),
(3676,	223,	'Wisconsin',	'WI',	1),
(3677,	223,	'Wyoming',	'WY',	1),
(3678,	224,	'Baker Island',	'BI',	1),
(3679,	224,	'Howland Island',	'HI',	1),
(3680,	224,	'Jarvis Island',	'JI',	1),
(3681,	224,	'Johnston Atoll',	'JA',	1),
(3682,	224,	'Kingman Reef',	'KR',	1),
(3683,	224,	'Midway Atoll',	'MA',	1),
(3684,	224,	'Navassa Island',	'NI',	1),
(3685,	224,	'Palmyra Atoll',	'PA',	1),
(3686,	224,	'Wake Island',	'WI',	1),
(3687,	225,	'Artigas',	'AR',	1),
(3688,	225,	'Canelones',	'CA',	1),
(3689,	225,	'Cerro Largo',	'CL',	1),
(3690,	225,	'Colonia',	'CO',	1),
(3691,	225,	'Durazno',	'DU',	1),
(3692,	225,	'Flores',	'FS',	1),
(3693,	225,	'Florida',	'FA',	1),
(3694,	225,	'Lavalleja',	'LA',	1),
(3695,	225,	'Maldonado',	'MA',	1),
(3696,	225,	'Montevideo',	'MO',	1),
(3697,	225,	'Paysandu',	'PA',	1),
(3698,	225,	'Rio Negro',	'RN',	1),
(3699,	225,	'Rivera',	'RV',	1),
(3700,	225,	'Rocha',	'RO',	1),
(3701,	225,	'Salto',	'SL',	1),
(3702,	225,	'San Jose',	'SJ',	1),
(3703,	225,	'Soriano',	'SO',	1),
(3704,	225,	'Tacuarembo',	'TA',	1),
(3705,	225,	'Treinta y Tres',	'TT',	1),
(3706,	226,	'Andijon',	'AN',	1),
(3707,	226,	'Buxoro',	'BU',	1),
(3708,	226,	'Farg\'ona',	'FA',	1),
(3709,	226,	'Jizzax',	'JI',	1),
(3710,	226,	'Namangan',	'NG',	1),
(3711,	226,	'Navoiy',	'NW',	1),
(3712,	226,	'Qashqadaryo',	'QA',	1),
(3713,	226,	'Qoraqalpog\'iston Republikasi',	'QR',	1),
(3714,	226,	'Samarqand',	'SA',	1),
(3715,	226,	'Sirdaryo',	'SI',	1),
(3716,	226,	'Surxondaryo',	'SU',	1),
(3717,	226,	'Toshkent City',	'TK',	1),
(3718,	226,	'Toshkent Region',	'TO',	1),
(3719,	226,	'Xorazm',	'XO',	1),
(3720,	227,	'Malampa',	'MA',	1),
(3721,	227,	'Penama',	'PE',	1),
(3722,	227,	'Sanma',	'SA',	1),
(3723,	227,	'Shefa',	'SH',	1),
(3724,	227,	'Tafea',	'TA',	1),
(3725,	227,	'Torba',	'TO',	1),
(3726,	229,	'Amazonas',	'AM',	1),
(3727,	229,	'Anzoategui',	'AN',	1),
(3728,	229,	'Apure',	'AP',	1),
(3729,	229,	'Aragua',	'AR',	1),
(3730,	229,	'Barinas',	'BA',	1),
(3731,	229,	'Bolivar',	'BO',	1),
(3732,	229,	'Carabobo',	'CA',	1),
(3733,	229,	'Cojedes',	'CO',	1),
(3734,	229,	'Delta Amacuro',	'DA',	1),
(3735,	229,	'Dependencias Federales',	'DF',	1),
(3736,	229,	'Distrito Federal',	'DI',	1),
(3737,	229,	'Falcon',	'FA',	1),
(3738,	229,	'Guarico',	'GU',	1),
(3739,	229,	'Lara',	'LA',	1),
(3740,	229,	'Merida',	'ME',	1),
(3741,	229,	'Miranda',	'MI',	1),
(3742,	229,	'Monagas',	'MO',	1),
(3743,	229,	'Nueva Esparta',	'NE',	1),
(3744,	229,	'Portuguesa',	'PO',	1),
(3745,	229,	'Sucre',	'SU',	1),
(3746,	229,	'Tachira',	'TA',	1),
(3747,	229,	'Trujillo',	'TR',	1),
(3748,	229,	'Vargas',	'VA',	1),
(3749,	229,	'Yaracuy',	'YA',	1),
(3750,	229,	'Zulia',	'ZU',	1),
(3751,	230,	'An Giang',	'AG',	1),
(3752,	230,	'Bac Giang',	'BG',	1),
(3753,	230,	'Bac Kan',	'BK',	1),
(3754,	230,	'Bac Lieu',	'BL',	1),
(3755,	230,	'Bac Ninh',	'BC',	1),
(3756,	230,	'Ba Ria-Vung Tau',	'BR',	1),
(3757,	230,	'Ben Tre',	'BN',	1),
(3758,	230,	'Binh Dinh',	'BH',	1),
(3759,	230,	'Binh Duong',	'BU',	1),
(3760,	230,	'Binh Phuoc',	'BP',	1),
(3761,	230,	'Binh Thuan',	'BT',	1),
(3762,	230,	'Ca Mau',	'CM',	1),
(3763,	230,	'Can Tho',	'CT',	1),
(3764,	230,	'Cao Bang',	'CB',	1),
(3765,	230,	'Dak Lak',	'DL',	1),
(3766,	230,	'Dak Nong',	'DG',	1),
(3767,	230,	'Da Nang',	'DN',	1),
(3768,	230,	'Dien Bien',	'DB',	1),
(3769,	230,	'Dong Nai',	'DI',	1),
(3770,	230,	'Dong Thap',	'DT',	1),
(3771,	230,	'Gia Lai',	'GL',	1),
(3772,	230,	'Ha Giang',	'HG',	1),
(3773,	230,	'Hai Duong',	'HD',	1),
(3774,	230,	'Hai Phong',	'HP',	1),
(3775,	230,	'Ha Nam',	'HM',	1),
(3776,	230,	'Ha Noi',	'HI',	1),
(3777,	230,	'Ha Tay',	'HT',	1),
(3778,	230,	'Ha Tinh',	'HH',	1),
(3779,	230,	'Hoa Binh',	'HB',	1),
(3780,	230,	'Ho Chi Minh City',	'HC',	1),
(3781,	230,	'Hau Giang',	'HU',	1),
(3782,	230,	'Hung Yen',	'HY',	1),
(3783,	232,	'Saint Croix',	'C',	1),
(3784,	232,	'Saint John',	'J',	1),
(3785,	232,	'Saint Thomas',	'T',	1),
(3786,	233,	'Alo',	'A',	1),
(3787,	233,	'Sigave',	'S',	1),
(3788,	233,	'Wallis',	'W',	1),
(3789,	235,	'Abyan',	'AB',	1),
(3790,	235,	'Adan',	'AD',	1),
(3791,	235,	'Amran',	'AM',	1),
(3792,	235,	'Al Bayda',	'BA',	1),
(3793,	235,	'Ad Dali',	'DA',	1),
(3794,	235,	'Dhamar',	'DH',	1),
(3795,	235,	'Hadramawt',	'HD',	1),
(3796,	235,	'Hajjah',	'HJ',	1),
(3797,	235,	'Al Hudaydah',	'HU',	1),
(3798,	235,	'Ibb',	'IB',	1),
(3799,	235,	'Al Jawf',	'JA',	1),
(3800,	235,	'Lahij',	'LA',	1),
(3801,	235,	'Ma\'rib',	'MA',	1),
(3802,	235,	'Al Mahrah',	'MR',	1),
(3803,	235,	'Al Mahwit',	'MW',	1),
(3804,	235,	'Sa\'dah',	'SD',	1),
(3805,	235,	'San\'a',	'SN',	1),
(3806,	235,	'Shabwah',	'SH',	1),
(3807,	235,	'Ta\'izz',	'TA',	1),
(3812,	237,	'Bas-Congo',	'BC',	1),
(3813,	237,	'Bandundu',	'BN',	1),
(3814,	237,	'Equateur',	'EQ',	1),
(3815,	237,	'Katanga',	'KA',	1),
(3816,	237,	'Kasai-Oriental',	'KE',	1),
(3817,	237,	'Kinshasa',	'KN',	1),
(3818,	237,	'Kasai-Occidental',	'KW',	1),
(3819,	237,	'Maniema',	'MA',	1),
(3820,	237,	'Nord-Kivu',	'NK',	1),
(3821,	237,	'Orientale',	'OR',	1),
(3822,	237,	'Sud-Kivu',	'SK',	1),
(3823,	238,	'Central',	'CE',	1),
(3824,	238,	'Copperbelt',	'CB',	1),
(3825,	238,	'Eastern',	'EA',	1),
(3826,	238,	'Luapula',	'LP',	1),
(3827,	238,	'Lusaka',	'LK',	1),
(3828,	238,	'Northern',	'NO',	1),
(3829,	238,	'North-Western',	'NW',	1),
(3830,	238,	'Southern',	'SO',	1),
(3831,	238,	'Western',	'WE',	1),
(3832,	239,	'Bulawayo',	'BU',	1),
(3833,	239,	'Harare',	'HA',	1),
(3834,	239,	'Manicaland',	'ML',	1),
(3835,	239,	'Mashonaland Central',	'MC',	1),
(3836,	239,	'Mashonaland East',	'ME',	1),
(3837,	239,	'Mashonaland West',	'MW',	1),
(3838,	239,	'Masvingo',	'MV',	1),
(3839,	239,	'Matabeleland North',	'MN',	1),
(3840,	239,	'Matabeleland South',	'MS',	1),
(3841,	239,	'Midlands',	'MD',	1),
(3861,	105,	'Campobasso',	'CB',	1),
(3862,	105,	'Carbonia-Iglesias',	'CI',	1),
(3863,	105,	'Caserta',	'CE',	1),
(3864,	105,	'Catania',	'CT',	1),
(3865,	105,	'Catanzaro',	'CZ',	1),
(3866,	105,	'Chieti',	'CH',	1),
(3867,	105,	'Como',	'CO',	1),
(3868,	105,	'Cosenza',	'CS',	1),
(3869,	105,	'Cremona',	'CR',	1),
(3870,	105,	'Crotone',	'KR',	1),
(3871,	105,	'Cuneo',	'CN',	1),
(3872,	105,	'Enna',	'EN',	1),
(3873,	105,	'Ferrara',	'FE',	1),
(3874,	105,	'Firenze',	'FI',	1),
(3875,	105,	'Foggia',	'FG',	1),
(3876,	105,	'Forli-Cesena',	'FC',	1),
(3877,	105,	'Frosinone',	'FR',	1),
(3878,	105,	'Genova',	'GE',	1),
(3879,	105,	'Gorizia',	'GO',	1),
(3880,	105,	'Grosseto',	'GR',	1),
(3881,	105,	'Imperia',	'IM',	1),
(3882,	105,	'Isernia',	'IS',	1),
(3883,	105,	'L&#39;Aquila',	'AQ',	1),
(3884,	105,	'La Spezia',	'SP',	1),
(3885,	105,	'Latina',	'LT',	1),
(3886,	105,	'Lecce',	'LE',	1),
(3887,	105,	'Lecco',	'LC',	1),
(3888,	105,	'Livorno',	'LI',	1),
(3889,	105,	'Lodi',	'LO',	1),
(3890,	105,	'Lucca',	'LU',	1),
(3891,	105,	'Macerata',	'MC',	1),
(3892,	105,	'Mantova',	'MN',	1),
(3893,	105,	'Massa-Carrara',	'MS',	1),
(3894,	105,	'Matera',	'MT',	1),
(3895,	105,	'Medio Campidano',	'VS',	1),
(3896,	105,	'Messina',	'ME',	1),
(3897,	105,	'Milano',	'MI',	1),
(3898,	105,	'Modena',	'MO',	1),
(3899,	105,	'Napoli',	'NA',	1),
(3900,	105,	'Novara',	'NO',	1),
(3901,	105,	'Nuoro',	'NU',	1),
(3902,	105,	'Ogliastra',	'OG',	1),
(3903,	105,	'Olbia-Tempio',	'OT',	1),
(3904,	105,	'Oristano',	'OR',	1),
(3905,	105,	'Padova',	'PD',	1),
(3906,	105,	'Palermo',	'PA',	1),
(3907,	105,	'Parma',	'PR',	1),
(3908,	105,	'Pavia',	'PV',	1),
(3909,	105,	'Perugia',	'PG',	1),
(3910,	105,	'Pesaro e Urbino',	'PU',	1),
(3911,	105,	'Pescara',	'PE',	1),
(3912,	105,	'Piacenza',	'PC',	1),
(3913,	105,	'Pisa',	'PI',	1),
(3914,	105,	'Pistoia',	'PT',	1),
(3915,	105,	'Pordenone',	'PN',	1),
(3916,	105,	'Potenza',	'PZ',	1),
(3917,	105,	'Prato',	'PO',	1),
(3918,	105,	'Ragusa',	'RG',	1),
(3919,	105,	'Ravenna',	'RA',	1),
(3920,	105,	'Reggio Calabria',	'RC',	1),
(3921,	105,	'Reggio Emilia',	'RE',	1),
(3922,	105,	'Rieti',	'RI',	1),
(3923,	105,	'Rimini',	'RN',	1),
(3924,	105,	'Roma',	'RM',	1),
(3925,	105,	'Rovigo',	'RO',	1),
(3926,	105,	'Salerno',	'SA',	1),
(3927,	105,	'Sassari',	'SS',	1),
(3928,	105,	'Savona',	'SV',	1),
(3929,	105,	'Siena',	'SI',	1),
(3930,	105,	'Siracusa',	'SR',	1),
(3931,	105,	'Sondrio',	'SO',	1),
(3932,	105,	'Taranto',	'TA',	1),
(3933,	105,	'Teramo',	'TE',	1),
(3934,	105,	'Terni',	'TR',	1),
(3935,	105,	'Torino',	'TO',	1),
(3936,	105,	'Trapani',	'TP',	1),
(3937,	105,	'Trento',	'TN',	1),
(3938,	105,	'Treviso',	'TV',	1),
(3939,	105,	'Trieste',	'TS',	1),
(3940,	105,	'Udine',	'UD',	1),
(3941,	105,	'Varese',	'VA',	1),
(3942,	105,	'Venezia',	'VE',	1),
(3943,	105,	'Verbano-Cusio-Ossola',	'VB',	1),
(3944,	105,	'Vercelli',	'VC',	1),
(3945,	105,	'Verona',	'VR',	1),
(3946,	105,	'Vibo Valentia',	'VV',	1),
(3947,	105,	'Vicenza',	'VI',	1),
(3948,	105,	'Viterbo',	'VT',	1),
(3949,	222,	'County Antrim',	'ANT',	1),
(3950,	222,	'County Armagh',	'ARM',	1),
(3951,	222,	'County Down',	'DOW',	1),
(3952,	222,	'County Fermanagh',	'FER',	1),
(3953,	222,	'County Londonderry',	'LDY',	1),
(3954,	222,	'County Tyrone',	'TYR',	1),
(3955,	222,	'Cumbria',	'CMA',	1),
(3956,	190,	'Pomurska',	'1',	1),
(3957,	190,	'Podravska',	'2',	1),
(3958,	190,	'Koroška',	'3',	1),
(3959,	190,	'Savinjska',	'4',	1),
(3960,	190,	'Zasavska',	'5',	1),
(3961,	190,	'Spodnjeposavska',	'6',	1),
(3962,	190,	'Jugovzhodna Slovenija',	'7',	1),
(3963,	190,	'Osrednjeslovenska',	'8',	1),
(3964,	190,	'Gorenjska',	'9',	1),
(3965,	190,	'Notranjsko-kraška',	'10',	1),
(3966,	190,	'Goriška',	'11',	1),
(3967,	190,	'Obalno-kraška',	'12',	1),
(3968,	33,	'Ruse',	'',	1),
(3969,	101,	'Alborz',	'ALB',	1),
(3971,	138,	'Aguascalientes',	'AG',	1),
(3973,	242,	'Andrijevica',	'01',	1),
(3974,	242,	'Bar',	'02',	1),
(3975,	242,	'Berane',	'03',	1),
(3976,	242,	'Bijelo Polje',	'04',	1),
(3977,	242,	'Budva',	'05',	1),
(3978,	242,	'Cetinje',	'06',	1),
(3979,	242,	'Danilovgrad',	'07',	1),
(3980,	242,	'Herceg-Novi',	'08',	1),
(3981,	242,	'Kolašin',	'09',	1),
(3982,	242,	'Kotor',	'10',	1),
(3983,	242,	'Mojkovac',	'11',	1),
(3984,	242,	'Nikšić',	'12',	1),
(3985,	242,	'Plav',	'13',	1),
(3986,	242,	'Pljevlja',	'14',	1),
(3987,	242,	'Plužine',	'15',	1),
(3988,	242,	'Podgorica',	'16',	1),
(3989,	242,	'Rožaje',	'17',	1),
(3990,	242,	'Šavnik',	'18',	1),
(3991,	242,	'Tivat',	'19',	1),
(3992,	242,	'Ulcinj',	'20',	1),
(3993,	242,	'Žabljak',	'21',	1),
(3994,	243,	'Belgrade',	'00',	1),
(3995,	243,	'North Bačka',	'01',	1),
(3996,	243,	'Central Banat',	'02',	1),
(3997,	243,	'North Banat',	'03',	1),
(3998,	243,	'South Banat',	'04',	1),
(3999,	243,	'West Bačka',	'05',	1),
(4000,	243,	'South Bačka',	'06',	1),
(4001,	243,	'Srem',	'07',	1),
(4002,	243,	'Mačva',	'08',	1),
(4003,	243,	'Kolubara',	'09',	1),
(4004,	243,	'Podunavlje',	'10',	1),
(4005,	243,	'Braničevo',	'11',	1),
(4006,	243,	'Šumadija',	'12',	1),
(4007,	243,	'Pomoravlje',	'13',	1),
(4008,	243,	'Bor',	'14',	1),
(4009,	243,	'Zaječar',	'15',	1),
(4010,	243,	'Zlatibor',	'16',	1),
(4011,	243,	'Moravica',	'17',	1),
(4012,	243,	'Raška',	'18',	1),
(4013,	243,	'Rasina',	'19',	1),
(4014,	243,	'Nišava',	'20',	1),
(4015,	243,	'Toplica',	'21',	1),
(4016,	243,	'Pirot',	'22',	1),
(4017,	243,	'Jablanica',	'23',	1),
(4018,	243,	'Pčinja',	'24',	1),
(4020,	245,	'Bonaire',	'BO',	1),
(4021,	245,	'Saba',	'SA',	1),
(4022,	245,	'Sint Eustatius',	'SE',	1),
(4023,	248,	'Central Equatoria',	'EC',	1),
(4024,	248,	'Eastern Equatoria',	'EE',	1),
(4025,	248,	'Jonglei',	'JG',	1),
(4026,	248,	'Lakes',	'LK',	1),
(4027,	248,	'Northern Bahr el-Ghazal',	'BN',	1),
(4028,	248,	'Unity',	'UY',	1),
(4029,	248,	'Upper Nile',	'NU',	1),
(4030,	248,	'Warrap',	'WR',	1),
(4031,	248,	'Western Bahr el-Ghazal',	'BW',	1),
(4032,	248,	'Western Equatoria',	'EW',	1),
(4036,	117,	'Ainaži, Salacgrīvas novads',	'0661405',	1),
(4037,	117,	'Aizkraukle, Aizkraukles novads',	'0320201',	1),
(4038,	117,	'Aizkraukles novads',	'0320200',	1),
(4039,	117,	'Aizpute, Aizputes novads',	'0640605',	1),
(4040,	117,	'Aizputes novads',	'0640600',	1),
(4041,	117,	'Aknīste, Aknīstes novads',	'0560805',	1),
(4042,	117,	'Aknīstes novads',	'0560800',	1),
(4043,	117,	'Aloja, Alojas novads',	'0661007',	1),
(4044,	117,	'Alojas novads',	'0661000',	1),
(4045,	117,	'Alsungas novads',	'0624200',	1),
(4046,	117,	'Alūksne, Alūksnes novads',	'0360201',	1),
(4047,	117,	'Alūksnes novads',	'0360200',	1),
(4048,	117,	'Amatas novads',	'0424701',	1),
(4049,	117,	'Ape, Apes novads',	'0360805',	1),
(4050,	117,	'Apes novads',	'0360800',	1),
(4051,	117,	'Auce, Auces novads',	'0460805',	1),
(4052,	117,	'Auces novads',	'0460800',	1),
(4053,	117,	'Ādažu novads',	'0804400',	1),
(4054,	117,	'Babītes novads',	'0804900',	1),
(4055,	117,	'Baldone, Baldones novads',	'0800605',	1),
(4056,	117,	'Baldones novads',	'0800600',	1),
(4057,	117,	'Baloži, Ķekavas novads',	'0800807',	1),
(4058,	117,	'Baltinavas novads',	'0384400',	1),
(4059,	117,	'Balvi, Balvu novads',	'0380201',	1),
(4060,	117,	'Balvu novads',	'0380200',	1),
(4061,	117,	'Bauska, Bauskas novads',	'0400201',	1),
(4062,	117,	'Bauskas novads',	'0400200',	1),
(4063,	117,	'Beverīnas novads',	'0964700',	1),
(4064,	117,	'Brocēni, Brocēnu novads',	'0840605',	1),
(4065,	117,	'Brocēnu novads',	'0840601',	1),
(4066,	117,	'Burtnieku novads',	'0967101',	1),
(4067,	117,	'Carnikavas novads',	'0805200',	1),
(4068,	117,	'Cesvaine, Cesvaines novads',	'0700807',	1),
(4069,	117,	'Cesvaines novads',	'0700800',	1),
(4070,	117,	'Cēsis, Cēsu novads',	'0420201',	1),
(4071,	117,	'Cēsu novads',	'0420200',	1),
(4072,	117,	'Ciblas novads',	'0684901',	1),
(4073,	117,	'Dagda, Dagdas novads',	'0601009',	1),
(4074,	117,	'Dagdas novads',	'0601000',	1),
(4075,	117,	'Daugavpils',	'0050000',	1),
(4076,	117,	'Daugavpils novads',	'0440200',	1),
(4077,	117,	'Dobele, Dobeles novads',	'0460201',	1),
(4078,	117,	'Dobeles novads',	'0460200',	1),
(4079,	117,	'Dundagas novads',	'0885100',	1),
(4080,	117,	'Durbe, Durbes novads',	'0640807',	1),
(4081,	117,	'Durbes novads',	'0640801',	1),
(4082,	117,	'Engures novads',	'0905100',	1),
(4083,	117,	'Ērgļu novads',	'0705500',	1),
(4084,	117,	'Garkalnes novads',	'0806000',	1),
(4085,	117,	'Grobiņa, Grobiņas novads',	'0641009',	1),
(4086,	117,	'Grobiņas novads',	'0641000',	1),
(4087,	117,	'Gulbene, Gulbenes novads',	'0500201',	1),
(4088,	117,	'Gulbenes novads',	'0500200',	1),
(4089,	117,	'Iecavas novads',	'0406400',	1),
(4090,	117,	'Ikšķile, Ikšķiles novads',	'0740605',	1),
(4091,	117,	'Ikšķiles novads',	'0740600',	1),
(4092,	117,	'Ilūkste, Ilūkstes novads',	'0440807',	1),
(4093,	117,	'Ilūkstes novads',	'0440801',	1),
(4094,	117,	'Inčukalna novads',	'0801800',	1),
(4095,	117,	'Jaunjelgava, Jaunjelgavas novads',	'0321007',	1),
(4096,	117,	'Jaunjelgavas novads',	'0321000',	1),
(4097,	117,	'Jaunpiebalgas novads',	'0425700',	1),
(4098,	117,	'Jaunpils novads',	'0905700',	1),
(4099,	117,	'Jelgava',	'0090000',	1),
(4100,	117,	'Jelgavas novads',	'0540200',	1),
(4101,	117,	'Jēkabpils',	'0110000',	1),
(4102,	117,	'Jēkabpils novads',	'0560200',	1),
(4103,	117,	'Jūrmala',	'0130000',	1),
(4104,	117,	'Kalnciems, Jelgavas novads',	'0540211',	1),
(4105,	117,	'Kandava, Kandavas novads',	'0901211',	1),
(4106,	117,	'Kandavas novads',	'0901201',	1),
(4107,	117,	'Kārsava, Kārsavas novads',	'0681009',	1),
(4108,	117,	'Kārsavas novads',	'0681000',	1),
(4109,	117,	'Kocēnu novads ,bij. Valmieras)',	'0960200',	1),
(4110,	117,	'Kokneses novads',	'0326100',	1),
(4111,	117,	'Krāslava, Krāslavas novads',	'0600201',	1),
(4112,	117,	'Krāslavas novads',	'0600202',	1),
(4113,	117,	'Krimuldas novads',	'0806900',	1),
(4114,	117,	'Krustpils novads',	'0566900',	1),
(4115,	117,	'Kuldīga, Kuldīgas novads',	'0620201',	1),
(4116,	117,	'Kuldīgas novads',	'0620200',	1),
(4117,	117,	'Ķeguma novads',	'0741001',	1),
(4118,	117,	'Ķegums, Ķeguma novads',	'0741009',	1),
(4119,	117,	'Ķekavas novads',	'0800800',	1),
(4120,	117,	'Lielvārde, Lielvārdes novads',	'0741413',	1),
(4121,	117,	'Lielvārdes novads',	'0741401',	1),
(4122,	117,	'Liepāja',	'0170000',	1),
(4123,	117,	'Limbaži, Limbažu novads',	'0660201',	1),
(4124,	117,	'Limbažu novads',	'0660200',	1),
(4125,	117,	'Līgatne, Līgatnes novads',	'0421211',	1),
(4126,	117,	'Līgatnes novads',	'0421200',	1),
(4127,	117,	'Līvāni, Līvānu novads',	'0761211',	1),
(4128,	117,	'Līvānu novads',	'0761201',	1),
(4129,	117,	'Lubāna, Lubānas novads',	'0701413',	1),
(4130,	117,	'Lubānas novads',	'0701400',	1),
(4131,	117,	'Ludza, Ludzas novads',	'0680201',	1),
(4132,	117,	'Ludzas novads',	'0680200',	1),
(4133,	117,	'Madona, Madonas novads',	'0700201',	1),
(4134,	117,	'Madonas novads',	'0700200',	1),
(4135,	117,	'Mazsalaca, Mazsalacas novads',	'0961011',	1),
(4136,	117,	'Mazsalacas novads',	'0961000',	1),
(4137,	117,	'Mālpils novads',	'0807400',	1),
(4138,	117,	'Mārupes novads',	'0807600',	1),
(4139,	117,	'Mērsraga novads',	'0887600',	1),
(4140,	117,	'Naukšēnu novads',	'0967300',	1),
(4141,	117,	'Neretas novads',	'0327100',	1),
(4142,	117,	'Nīcas novads',	'0647900',	1),
(4143,	117,	'Ogre, Ogres novads',	'0740201',	1),
(4144,	117,	'Ogres novads',	'0740202',	1),
(4145,	117,	'Olaine, Olaines novads',	'0801009',	1),
(4146,	117,	'Olaines novads',	'0801000',	1),
(4147,	117,	'Ozolnieku novads',	'0546701',	1),
(4148,	117,	'Pārgaujas novads',	'0427500',	1),
(4149,	117,	'Pāvilosta, Pāvilostas novads',	'0641413',	1),
(4150,	117,	'Pāvilostas novads',	'0641401',	1),
(4151,	117,	'Piltene, Ventspils novads',	'0980213',	1),
(4152,	117,	'Pļaviņas, Pļaviņu novads',	'0321413',	1),
(4153,	117,	'Pļaviņu novads',	'0321400',	1),
(4154,	117,	'Preiļi, Preiļu novads',	'0760201',	1),
(4155,	117,	'Preiļu novads',	'0760202',	1),
(4156,	117,	'Priekule, Priekules novads',	'0641615',	1),
(4157,	117,	'Priekules novads',	'0641600',	1),
(4158,	117,	'Priekuļu novads',	'0427300',	1),
(4159,	117,	'Raunas novads',	'0427700',	1),
(4160,	117,	'Rēzekne',	'0210000',	1),
(4161,	117,	'Rēzeknes novads',	'0780200',	1),
(4162,	117,	'Riebiņu novads',	'0766300',	1),
(4163,	117,	'Rīga',	'0010000',	1),
(4164,	117,	'Rojas novads',	'0888300',	1),
(4165,	117,	'Ropažu novads',	'0808400',	1),
(4166,	117,	'Rucavas novads',	'0648500',	1),
(4167,	117,	'Rugāju novads',	'0387500',	1),
(4168,	117,	'Rundāles novads',	'0407700',	1),
(4169,	117,	'Rūjiena, Rūjienas novads',	'0961615',	1),
(4170,	117,	'Rūjienas novads',	'0961600',	1),
(4171,	117,	'Sabile, Talsu novads',	'0880213',	1),
(4172,	117,	'Salacgrīva, Salacgrīvas novads',	'0661415',	1),
(4173,	117,	'Salacgrīvas novads',	'0661400',	1),
(4174,	117,	'Salas novads',	'0568700',	1),
(4175,	117,	'Salaspils novads',	'0801200',	1),
(4176,	117,	'Salaspils, Salaspils novads',	'0801211',	1),
(4177,	117,	'Saldus novads',	'0840200',	1),
(4178,	117,	'Saldus, Saldus novads',	'0840201',	1),
(4179,	117,	'Saulkrasti, Saulkrastu novads',	'0801413',	1),
(4180,	117,	'Saulkrastu novads',	'0801400',	1),
(4181,	117,	'Seda, Strenču novads',	'0941813',	1),
(4182,	117,	'Sējas novads',	'0809200',	1),
(4183,	117,	'Sigulda, Siguldas novads',	'0801615',	1),
(4184,	117,	'Siguldas novads',	'0801601',	1),
(4185,	117,	'Skrīveru novads',	'0328200',	1),
(4186,	117,	'Skrunda, Skrundas novads',	'0621209',	1),
(4187,	117,	'Skrundas novads',	'0621200',	1),
(4188,	117,	'Smiltene, Smiltenes novads',	'0941615',	1),
(4189,	117,	'Smiltenes novads',	'0941600',	1),
(4190,	117,	'Staicele, Alojas novads',	'0661017',	1),
(4191,	117,	'Stende, Talsu novads',	'0880215',	1),
(4192,	117,	'Stopiņu novads',	'0809600',	1),
(4193,	117,	'Strenči, Strenču novads',	'0941817',	1),
(4194,	117,	'Strenču novads',	'0941800',	1),
(4195,	117,	'Subate, Ilūkstes novads',	'0440815',	1),
(4196,	117,	'Talsi, Talsu novads',	'0880201',	1),
(4197,	117,	'Talsu novads',	'0880200',	1),
(4198,	117,	'Tērvetes novads',	'0468900',	1),
(4199,	117,	'Tukuma novads',	'0900200',	1),
(4200,	117,	'Tukums, Tukuma novads',	'0900201',	1),
(4201,	117,	'Vaiņodes novads',	'0649300',	1),
(4202,	117,	'Valdemārpils, Talsu novads',	'0880217',	1),
(4203,	117,	'Valka, Valkas novads',	'0940201',	1),
(4204,	117,	'Valkas novads',	'0940200',	1),
(4205,	117,	'Valmiera',	'0250000',	1),
(4206,	117,	'Vangaži, Inčukalna novads',	'0801817',	1),
(4207,	117,	'Varakļāni, Varakļānu novads',	'0701817',	1),
(4208,	117,	'Varakļānu novads',	'0701800',	1),
(4209,	117,	'Vārkavas novads',	'0769101',	1),
(4210,	117,	'Vecpiebalgas novads',	'0429300',	1),
(4211,	117,	'Vecumnieku novads',	'0409500',	1),
(4212,	117,	'Ventspils',	'0270000',	1),
(4213,	117,	'Ventspils novads',	'0980200',	1),
(4214,	117,	'Viesīte, Viesītes novads',	'0561815',	1),
(4215,	117,	'Viesītes novads',	'0561800',	1),
(4216,	117,	'Viļaka, Viļakas novads',	'0381615',	1),
(4217,	117,	'Viļakas novads',	'0381600',	1),
(4218,	117,	'Viļāni, Viļānu novads',	'0781817',	1),
(4219,	117,	'Viļānu novads',	'0781800',	1),
(4220,	117,	'Zilupe, Zilupes novads',	'0681817',	1),
(4221,	117,	'Zilupes novads',	'0681801',	1),
(4222,	43,	'Arica y Parinacota',	'AP',	1),
(4223,	43,	'Los Rios',	'LR',	1),
(4224,	220,	'Харьковская область',	'63',	1),
(4225,	118,	'Beirut',	'LB-BR',	1),
(4226,	118,	'Bekaa',	'LB-BE',	1),
(4227,	118,	'Mount Lebanon',	'LB-ML',	1),
(4228,	118,	'Nabatieh',	'LB-NB',	1),
(4229,	118,	'North',	'LB-NR',	1),
(4230,	118,	'South',	'LB-ST',	1),
(4231,	99,	'Telangana',	'TS',	1),
(4232,	44,	'Qinghai',	'QH',	1),
(4233,	100,	'Papua Barat',	'PB',	1),
(4234,	100,	'Sulawesi Barat',	'SR',	1),
(4235,	100,	'Kepulauan Riau',	'KR',	1);
ALTER TABLE `oc_zone` ENABLE KEYS;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

ALTER TABLE `oc_zone_to_geo_zone` DISABLE KEYS;

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57,	176,	0,	3,	'2015-11-11 15:56:24',	'0000-00-00 00:00:00');
ALTER TABLE `oc_zone_to_geo_zone` ENABLE KEYS;



COMMIT;
-- THE END
