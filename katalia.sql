-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.11-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for katalia
CREATE DATABASE IF NOT EXISTS `katalia` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `katalia`;

-- Dumping structure for table katalia.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.categories: ~0 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table katalia.category_details
CREATE TABLE IF NOT EXISTS `category_details` (
  `id` varchar(10) NOT NULL,
  `snippet_id` varchar(10) NOT NULL,
  `categories_name` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.category_details: ~0 rows (approximately)
DELETE FROM `category_details`;
/*!40000 ALTER TABLE `category_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_details` ENABLE KEYS */;

-- Dumping structure for table katalia.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` varchar(10) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `snippet_id` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.comments: ~0 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table katalia.saved
CREATE TABLE IF NOT EXISTS `saved` (
  `id` varchar(10) NOT NULL,
  `snippet_id` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.saved: ~0 rows (approximately)
DELETE FROM `saved`;
/*!40000 ALTER TABLE `saved` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved` ENABLE KEYS */;

-- Dumping structure for table katalia.snippets
CREATE TABLE IF NOT EXISTS `snippets` (
  `id` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `descb` varchar(255) DEFAULT NULL,
  `snippet` varchar(5000) NOT NULL,
  `username` varchar(10) NOT NULL,
  `upvote_id` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.snippets: ~0 rows (approximately)
DELETE FROM `snippets`;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;

-- Dumping structure for table katalia.upvotes
CREATE TABLE IF NOT EXISTS `upvotes` (
  `id` varchar(10) NOT NULL,
  `upvote` int(11) NOT NULL,
  `snippet_id` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.upvotes: ~0 rows (approximately)
DELETE FROM `upvotes`;
/*!40000 ALTER TABLE `upvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `upvotes` ENABLE KEYS */;

-- Dumping structure for table katalia.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
