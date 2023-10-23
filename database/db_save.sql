-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 23 oct. 2023 à 15:36
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`) VALUES
(1, 'Capture The Flag', '1'),
(2, 'What Did You Said ?', '2');

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

--
-- Déchargement des données de la table `progress`
--

INSERT INTO `progress` (`user_id`, `quiz_id`, `progress_value`) VALUES
(1, 1, '70'),
(1, 2, '34'),
(1, 3, '55');

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
-- Structure de la table `question_wdys`
--

DROP TABLE IF EXISTS `question_wdys`;
CREATE TABLE IF NOT EXISTS `question_wdys` (
  `question_WDYS_id` int NOT NULL AUTO_INCREMENT,
  `question_WDYS_sentence` varchar(50) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_name`, `quiz_difficulty`, `quiz_image`, `category_id`) VALUES
(1, 'Europe', 0, 1, 1),
(2, 'Asia', 0, 1, 1),
(3, 'Africa', 0, 1, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_password`, `user_pp`, `user_privilege`) VALUES
(1, 'test', '$2a$10$Q4idckxY1rDBnp3qi1LYu.6T1eyyAQfLzSkOBzhCWFioVolyd88KS', 2, 1),
(2, 'testrgred', 'test', 2, 1),
(3, 'new', 'test', 2, 1),
(4, 'tests', '$2a$10$eOWsAEsyDvN2Nrs83rtk7emEng2lrVu.T8vKIF98w1.SLhYZp30gK', 1, 0),
(5, 'test8', '$2a$10$9f.CZOskcN.be2ZTPG87FuXlCGgcqCNRvRUiNdttJ3H4CfTUDccR6', 1, 0);
COMMIT;