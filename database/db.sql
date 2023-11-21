-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 21 nov. 2023 à 20:34
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `terraquiz_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_image` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `progress`
--

DROP TABLE IF EXISTS `progress`;
CREATE TABLE IF NOT EXISTS `progress` (
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `progress_value` decimal(4,0) NOT NULL,
  PRIMARY KEY (`user_id`,`quiz_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question_ctf`
--

DROP TABLE IF EXISTS `question_ctf`;
CREATE TABLE IF NOT EXISTS `question_ctf` (
  `question_CTF_id` int NOT NULL AUTO_INCREMENT,
  `question_CTF_flag` varchar(50) NOT NULL,
  `question_CTF_answer` varchar(50) NOT NULL,
  `question_CTF_bad1` varchar(50) NOT NULL,
  `question_CTF_bad2` varchar(50) NOT NULL,
  `question_CTF_bad3` varchar(50) NOT NULL,
  `quiz_id` int NOT NULL,
  PRIMARY KEY (`question_CTF_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question_ftc`
--

DROP TABLE IF EXISTS `question_ftc`;
CREATE TABLE IF NOT EXISTS `question_ftc` (
  `question_FTC_id` int NOT NULL AUTO_INCREMENT,
  `question_FTC_capital` varchar(50) NOT NULL,
  `question_FTC_answer` varchar(50) NOT NULL,
  `question_FTC_bad1` varchar(50) NOT NULL,
  `question_FTC_bad2` varchar(50) NOT NULL,
  `question_FTC_bad3` varchar(50) NOT NULL,
  `quiz_id` int NOT NULL,
  PRIMARY KEY (`question_FTC_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question_wdys`
--

DROP TABLE IF EXISTS `question_wdys`;
CREATE TABLE IF NOT EXISTS `question_wdys` (
  `question_WDYS_id` int NOT NULL AUTO_INCREMENT,
  `question_WDYS_sentence` varchar(50) NOT NULL,
  `question_WDYS_lang_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `question_WDYS_answer` varchar(50) NOT NULL,
  `question_WDYS_bad1` varchar(50) NOT NULL,
  `question_WDYS_bad2` varchar(50) NOT NULL,
  `question_WDYS_bad3` varchar(50) NOT NULL,
  `quiz_id` int NOT NULL,
  PRIMARY KEY (`question_WDYS_id`),
  KEY `quiz_id` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(50) NOT NULL,
  `quiz_difficulty` tinyint NOT NULL,
  `quiz_image` tinyint NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_pp` tinyint NOT NULL,
  `user_privilege` tinyint NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
