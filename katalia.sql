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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.categories: ~13 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'frontend', '2021-11-15 08:00:05', '2021-11-15 08:00:05'),
	(2, 'backend', '2021-11-15 08:00:10', '2021-11-15 08:00:10'),
	(3, 'react', '2021-11-15 08:00:15', '2021-11-15 08:00:15'),
	(4, 'node', '2021-11-15 08:00:20', '2021-11-15 08:00:20'),
	(5, 'vue', '2021-11-15 08:00:25', '2021-11-15 08:00:25'),
	(6, 'vanillajs', '2021-11-15 08:00:37', '2021-11-15 08:00:37'),
	(7, 'svelte', '2021-11-15 08:00:45', '2021-11-15 08:00:45'),
	(8, 'angular', '2021-11-15 08:00:51', '2021-11-15 08:00:51'),
	(9, 'oneliner', '2021-11-15 08:00:57', '2021-11-15 08:00:57'),
	(10, 'styling', '2021-11-15 08:01:13', '2021-11-15 08:01:13'),
	(11, 'template', '2021-11-15 08:01:41', '2021-11-15 08:01:41'),
	(12, 'algorithm', '2021-11-15 08:01:49', '2021-11-15 08:01:49'),
	(13, 'es6', '2021-11-15 08:01:59', '2021-11-15 08:01:59');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table katalia.category_details
CREATE TABLE IF NOT EXISTS `category_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snippet_id` varchar(10) NOT NULL,
  `categories_name` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_category_details_snippets` (`snippet_id`),
  KEY `FK_category_details_categories` (`categories_name`),
  CONSTRAINT `FK_category_details_categories` FOREIGN KEY (`categories_name`) REFERENCES `categories` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_category_details_snippets` FOREIGN KEY (`snippet_id`) REFERENCES `snippets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.category_details: ~0 rows (approximately)
DELETE FROM `category_details`;
/*!40000 ALTER TABLE `category_details` DISABLE KEYS */;
INSERT INTO `category_details` (`id`, `snippet_id`, `categories_name`, `created_at`, `updated_at`) VALUES
	(1, 'dPcbDac_K-', 'react', '2021-11-15 08:49:24', '2021-11-15 08:49:24'),
	(2, 'dPcbDac_K-', 'frontend', '2021-11-15 08:49:31', '2021-11-15 08:49:31'),
	(3, 'mxhr9O4Nad', 'vanillajs', '2021-11-15 08:49:44', '2021-11-15 08:49:44'),
	(4, 'mxhr9O4Nad', 'algorithm', '2021-11-15 08:49:53', '2021-11-15 08:49:53');
/*!40000 ALTER TABLE `category_details` ENABLE KEYS */;

-- Dumping structure for table katalia.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` varchar(10) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `snippet_id` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `Snippet` (`snippet_id`),
  KEY `Username` (`username`),
  CONSTRAINT `Snippet` FOREIGN KEY (`snippet_id`) REFERENCES `snippets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.comments: ~1 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `msg`, `snippet_id`, `username`, `created_at`, `updated_at`) VALUES
	('nygd_r1YIU', 'keren gan', 'dPcbDac_K-', 'enjinerd', '2021-11-15 08:48:14', '2021-11-15 08:48:14');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table katalia.saved
CREATE TABLE IF NOT EXISTS `saved` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `snippet_id` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_saved_snippets` (`snippet_id`),
  KEY `FK_saved_users` (`username`),
  CONSTRAINT `FK_saved_snippets` FOREIGN KEY (`snippet_id`) REFERENCES `snippets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_saved_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.saved: ~5 rows (approximately)
DELETE FROM `saved`;
/*!40000 ALTER TABLE `saved` DISABLE KEYS */;
INSERT INTO `saved` (`id`, `snippet_id`, `username`, `created_at`, `updated_at`) VALUES
	(1, 'pMQwEbmozl', 'enjinerd', '2021-11-15 08:47:05', '2021-11-15 08:47:05'),
	(2, 'mxhr9O4Nad', 'enjinerd', '2021-11-15 08:47:13', '2021-11-15 08:47:13'),
	(3, 'dPcbDac_K-', 'bisita', '2021-11-15 08:47:21', '2021-11-15 08:47:21'),
	(4, 'DL3M9bZEyn', 'bisita', '2021-11-15 08:47:32', '2021-11-15 08:47:32'),
	(5, '_i89Fu_XzJ', 'denida', '2021-11-15 08:47:42', '2021-11-15 08:47:42');
/*!40000 ALTER TABLE `saved` ENABLE KEYS */;

-- Dumping structure for table katalia.snippets
CREATE TABLE IF NOT EXISTS `snippets` (
  `id` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `descb` varchar(255) DEFAULT NULL,
  `snippet` varchar(5000) NOT NULL,
  `username` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `Index 2` (`id`),
  KEY `FK_snippets_users` (`username`),
  CONSTRAINT `FK_snippets_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.snippets: ~5 rows (approximately)
DELETE FROM `snippets`;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` (`id`, `title`, `descb`, `snippet`, `username`, `created_at`, `updated_at`) VALUES
	('DL3M9bZEyn', 'String Reverse', 'Reverse string from behind.', 'const stringReverse = str => str.split(\'\').reverse().join(\'\');', 'denida', '2021-11-15 07:58:46', '2021-11-15 07:58:46'),
	('dPcbDac_K-', 'React useKeyPress Hoosk', 'Listens for changes in the pressed state of a given key.', 'Listens for changes in the pressed state of a given key.', 'enjinerd', '2021-11-15 08:40:23', '2021-11-15 08:40:23'),
	('mxhr9O4Nad', 'Heap Sort Array of Number', 'Sorts an array of numbers, using the heapsort algorithm.', 'const heapsort = arr => {\r\n  const a = [...arr];\r\n  let l = a.length;\r\n\r\n  const heapify = (a, i) => {\r\n    const left = 2 * i + 1;\r\n    const right = 2 * i + 2;\r\n    let max = i;\r\n    if (left < l && a[left] > a[max]) max = left;\r\n    if (right < l && a[right] > a[max]) max = right;\r\n    if (max !== i) {\r\n      [a[max], a[i]] = [a[i], a[max]];\r\n      heapify(a, max);\r\n    }\r\n  };\r\n\r\n  for (let i = Math.floor(l / 2); i >= 0; i -= 1) heapify(a, i);\r\n  for (i = a.length - 1; i > 0; i--) {\r\n    [a[0], a[i]] = [a[i], a[0]];\r\n    l--;\r\n    heapify(a, 0);\r\n  }\r\n  return a;\r\n};\r\n', 'bisita', '2021-11-15 08:12:59', '2021-11-15 08:14:04'),
	('pMQwEbmozl', 'Capitalize String', 'Capitalized first char at string.', 'const capitalize = str => str.charAt(0).toUpperCase() + str.slice(1)', 'enjinerd', '2021-11-15 07:57:04', '2021-11-15 07:57:04'),
	('_i89Fu_XzJ', 'Get URI Parameter', 'Get URI parameter from url.', 'const getURIParameters = url =>  (url.match(/([^?=&]+)(=([^&]*))/g) || []).reduce(    (a, v) => (      (a[v.slice(0, v.indexOf(\'=\'))] = v.slice(v.indexOf(\'=\') + 1)), a    ),    {}  );', 'bisita', '2021-11-15 07:58:04', '2021-11-15 07:58:04');
/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;

-- Dumping structure for table katalia.upvotes
CREATE TABLE IF NOT EXISTS `upvotes` (
  `id` varchar(10) NOT NULL,
  `upvote` int(11) NOT NULL DEFAULT 0,
  `snippet_id` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `snippet_id` (`snippet_id`),
  KEY `Index 3` (`upvote`),
  CONSTRAINT `FK_upvotes_snippets` FOREIGN KEY (`snippet_id`) REFERENCES `snippets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table katalia.upvotes: ~5 rows (approximately)
DELETE FROM `upvotes`;
/*!40000 ALTER TABLE `upvotes` DISABLE KEYS */;
INSERT INTO `upvotes` (`id`, `upvote`, `snippet_id`, `created_at`, `updated_at`) VALUES
	('b5iswkfCzI', 0, 'dPcbDac_K-', '2021-11-15 08:45:42', '2021-11-15 08:45:42'),
	('i46iDQcv_I', 0, '_i89Fu_XzJ', '2021-11-15 08:26:11', '2021-11-15 08:26:11'),
	('OZQREpuUNx', 0, 'pMQwEbmozl', '2021-11-15 15:25:54', '2021-11-15 08:25:54'),
	('TCNLnL_9IA', 0, 'mxhr9O4Nad', '2021-11-15 08:26:28', '2021-11-15 08:26:28'),
	('Xd1d-IloRP', 0, 'DL3M9bZEyn', '2021-11-15 08:26:52', '2021-11-15 08:26:52');
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

-- Dumping data for table katalia.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `email`, `password`, `created_at`, `updated_at`) VALUES
	('bisita', 'bis@ita.com', '221133', '2021-11-15 07:30:07', '2021-11-15 07:30:07'),
	('denida', 'deni@ida.com', '1112222', '2021-11-15 07:30:29', '2021-11-15 07:30:29'),
	('enjinerd', 'dev@dev.com', '112233', '2021-11-15 07:29:04', '2021-11-15 07:29:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
