-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for qbus
CREATE DATABASE IF NOT EXISTS `qbus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `qbus`;

-- Dumping structure for table qbus.gas_station_balance
CREATE TABLE IF NOT EXISTS `gas_station_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbus.gas_station_balance: ~1 rows (approximately)
/*!40000 ALTER TABLE `gas_station_balance` DISABLE KEYS */;
INSERT INTO `gas_station_balance` (`id`, `gas_station_id`, `income`, `title`, `amount`, `date`) VALUES
	(34, 'gas_station_27', b'0', 'Money deposited', 100, 1632778923),
	(35, 'gas_station_27', b'0', 'Money deposited', 100, 1632778926),
	(36, 'gas_station_27', b'0', 'Money deposited', 1000000, 1632778935),
	(37, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778937),
	(38, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778939),
	(39, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778940),
	(40, 'gas_station_27', b'1', 'Upgrade purchased: Truck capacity', 45000, 1632778942),
	(41, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778944),
	(42, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778945),
	(43, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778947),
	(44, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778948),
	(45, 'gas_station_27', b'1', 'Upgrade purchased: Relationship', 60000, 1632778949),
	(46, 'gas_station_27', b'0', 'Delivery worker removed: 10', 220, 1632778954),
	(47, 'gas_station_27', b'1', 'Delivery job created: 10', 220, 1632778959),
	(48, 'gas_station_27', b'1', 'Stock purchased: Small cargo of 75 Liters', 1575, 1632778994),
	(49, 'gas_station_27', b'1', 'Money withdrawn', 558625, 1632779180),
	(50, 'gas_station_27', b'0', 'Money deposited', 10000000, 1632779185),
	(51, 'gas_station_27', b'1', 'Stock purchased: Small cargo of 75 Liters', 1575, 1632779349),
	(52, 'gas_station_27', b'0', 'Fuel sold (4 Liters)', 2, 1632782381),
	(53, 'gas_station_27', b'0', 'Fuel sold (6 Liters)', 3, 1632782416);
/*!40000 ALTER TABLE `gas_station_balance` ENABLE KEYS */;

-- Dumping structure for table qbus.gas_station_business
CREATE TABLE IF NOT EXISTS `gas_station_business` (
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `stock_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `truck_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `relationship_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `total_money_spent` int(10) unsigned NOT NULL DEFAULT 0,
  `gas_bought` int(10) unsigned NOT NULL DEFAULT 0,
  `gas_sold` int(10) unsigned NOT NULL DEFAULT 0,
  `distance_traveled` double unsigned NOT NULL DEFAULT 0,
  `total_visits` int(10) unsigned NOT NULL DEFAULT 0,
  `customers` int(10) unsigned NOT NULL DEFAULT 0,
  `timer` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`gas_station_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbus.gas_station_business: ~1 rows (approximately)
/*!40000 ALTER TABLE `gas_station_business` DISABLE KEYS */;
INSERT INTO `gas_station_business` (`gas_station_id`, `user_id`, `stock`, `price`, `stock_upgrade`, `truck_upgrade`, `relationship_upgrade`, `money`, `total_money_earned`, `total_money_spent`, `gas_bought`, `gas_sold`, `distance_traveled`, `total_visits`, `customers`, `timer`) VALUES
	('gas_station_27', 'ZAR72950', 115, 49, 5, 5, 5, 9998430, 5, 630260, 125, 10, 2.3899999999999997, 30, 2, 0);
/*!40000 ALTER TABLE `gas_station_business` ENABLE KEYS */;

-- Dumping structure for table qbus.gas_station_jobs
CREATE TABLE IF NOT EXISTS `gas_station_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `reward` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `progress` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbus.gas_station_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `gas_station_jobs` DISABLE KEYS */;
INSERT INTO `gas_station_jobs` (`id`, `gas_station_id`, `name`, `reward`, `amount`, `progress`) VALUES
	(3, 'gas_station_27', '10', 10, 10, b'0');
/*!40000 ALTER TABLE `gas_station_jobs` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
