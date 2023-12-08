-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 08 déc. 2023 à 11:38
-- Version du serveur :  8.0.35
-- Version de PHP : 7.4.33

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

CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_image` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`) VALUES
(1, 'Capture The Flag', '1'),
(2, 'What Did You Say ?', '2'),
(3, 'Find The Capital', '3');

-- --------------------------------------------------------

--
-- Structure de la table `progress`
--

CREATE TABLE `progress` (
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `progress_value` decimal(4,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `progress`
--

INSERT INTO `progress` (`user_id`, `quiz_id`, `progress_value`) VALUES
(34, 32, '0'),
(34, 33, '0'),
(34, 34, '0'),
(29, 6, '69'),
(29, 7, '40'),
(27, 8, '0'),
(27, 6, '0'),
(27, 5, '0'),
(27, 4, '0'),
(27, 3, '0'),
(27, 2, '0'),
(27, 1, '0'),
(34, 29, '0'),
(34, 30, '0'),
(34, 31, '0'),
(29, 5, '25'),
(29, 4, '47'),
(29, 3, '13'),
(34, 28, '0'),
(29, 2, '80'),
(27, 7, '0'),
(34, 27, '0'),
(29, 8, '0'),
(29, 1, '93'),
(27, 9, '0'),
(34, 26, '0'),
(29, 9, '36'),
(34, 25, '0'),
(29, 10, '69'),
(27, 10, '0'),
(34, 24, '0'),
(29, 11, '19'),
(27, 11, '0'),
(34, 23, '0'),
(29, 12, '24'),
(27, 12, '0'),
(34, 22, '0'),
(29, 13, '38'),
(27, 13, '0'),
(34, 21, '0'),
(29, 14, '13'),
(27, 14, '0'),
(30, 1, '0'),
(30, 2, '0'),
(30, 3, '0'),
(30, 4, '0'),
(30, 5, '0'),
(30, 6, '0'),
(30, 7, '0'),
(30, 8, '0'),
(30, 9, '0'),
(30, 10, '0'),
(30, 11, '0'),
(30, 12, '0'),
(30, 13, '0'),
(30, 14, '0'),
(27, 15, '0'),
(34, 20, '0'),
(30, 15, '0'),
(27, 16, '0'),
(34, 19, '0'),
(30, 16, '0'),
(27, 17, '0'),
(34, 18, '0'),
(30, 17, '0'),
(27, 18, '0'),
(34, 17, '0'),
(30, 18, '0'),
(27, 19, '0'),
(34, 16, '0'),
(30, 19, '0'),
(27, 20, '0'),
(34, 15, '0'),
(30, 20, '0'),
(31, 1, '0'),
(31, 2, '0'),
(31, 3, '0'),
(31, 4, '0'),
(31, 5, '0'),
(31, 6, '0'),
(31, 7, '0'),
(31, 8, '0'),
(31, 9, '0'),
(31, 10, '0'),
(31, 11, '0'),
(31, 12, '0'),
(31, 13, '0'),
(31, 14, '0'),
(31, 15, '0'),
(31, 16, '0'),
(31, 17, '0'),
(31, 18, '0'),
(31, 19, '0'),
(31, 20, '0'),
(32, 1, '0'),
(32, 2, '0'),
(32, 3, '0'),
(32, 4, '0'),
(32, 5, '0'),
(32, 6, '0'),
(32, 7, '0'),
(32, 8, '0'),
(32, 9, '0'),
(32, 10, '0'),
(32, 11, '0'),
(32, 12, '77'),
(32, 13, '0'),
(32, 14, '47'),
(32, 15, '0'),
(32, 16, '0'),
(32, 17, '0'),
(32, 18, '0'),
(32, 19, '0'),
(32, 20, '0'),
(27, 21, '0'),
(34, 14, '0'),
(30, 21, '0'),
(31, 21, '0'),
(32, 21, '0'),
(27, 22, '0'),
(34, 13, '0'),
(30, 22, '0'),
(31, 22, '0'),
(32, 22, '0'),
(27, 23, '0'),
(34, 12, '0'),
(30, 23, '0'),
(31, 23, '0'),
(32, 23, '0'),
(27, 24, '0'),
(34, 11, '0'),
(30, 24, '0'),
(31, 24, '0'),
(32, 24, '0'),
(27, 25, '0'),
(34, 10, '0'),
(30, 25, '0'),
(31, 25, '0'),
(32, 25, '0'),
(27, 26, '0'),
(34, 9, '0'),
(30, 26, '0'),
(31, 26, '0'),
(32, 26, '0'),
(27, 27, '0'),
(34, 8, '0'),
(30, 27, '0'),
(31, 27, '0'),
(32, 27, '0'),
(27, 28, '0'),
(34, 7, '0'),
(30, 28, '0'),
(31, 28, '0'),
(32, 28, '0'),
(27, 29, '0'),
(34, 6, '0'),
(30, 29, '0'),
(31, 29, '0'),
(32, 29, '0'),
(27, 30, '0'),
(34, 5, '0'),
(30, 30, '0'),
(31, 30, '0'),
(32, 30, '0'),
(27, 31, '0'),
(34, 4, '0'),
(30, 31, '0'),
(31, 31, '0'),
(32, 31, '0'),
(27, 32, '0'),
(34, 3, '0'),
(30, 32, '0'),
(31, 32, '0'),
(32, 32, '0'),
(27, 33, '0'),
(34, 2, '0'),
(30, 33, '0'),
(31, 33, '0'),
(32, 33, '0'),
(27, 34, '0'),
(34, 1, '0'),
(30, 34, '0'),
(31, 34, '0'),
(32, 34, '0'),
(46, 1, '0'),
(46, 2, '0'),
(46, 3, '0'),
(46, 4, '0'),
(46, 5, '0'),
(46, 6, '0'),
(46, 7, '0'),
(46, 8, '0'),
(46, 9, '0'),
(46, 10, '0'),
(46, 11, '0'),
(46, 12, '0'),
(46, 13, '0'),
(46, 14, '0'),
(46, 15, '0'),
(46, 16, '0'),
(46, 17, '0'),
(46, 18, '0'),
(46, 19, '0'),
(46, 20, '0'),
(46, 21, '0'),
(46, 22, '0'),
(46, 23, '0'),
(46, 24, '0'),
(46, 25, '0'),
(46, 26, '0'),
(46, 27, '0'),
(46, 28, '0'),
(46, 29, '0'),
(46, 30, '0'),
(46, 31, '0'),
(46, 32, '0'),
(46, 33, '0'),
(46, 34, '0'),
(47, 1, '0'),
(47, 2, '0'),
(47, 3, '0'),
(47, 4, '0'),
(47, 5, '0'),
(47, 6, '0'),
(47, 7, '0'),
(47, 8, '0'),
(47, 9, '0'),
(47, 10, '0'),
(47, 11, '0'),
(47, 12, '0'),
(47, 13, '0'),
(47, 14, '0'),
(47, 15, '0'),
(47, 16, '0'),
(47, 17, '0'),
(47, 18, '0'),
(47, 19, '0'),
(47, 20, '0'),
(47, 21, '0'),
(47, 22, '0'),
(47, 23, '0'),
(47, 24, '0'),
(47, 25, '0'),
(47, 26, '0'),
(47, 27, '0'),
(47, 28, '0'),
(47, 29, '0'),
(47, 30, '0'),
(47, 31, '0'),
(47, 32, '0'),
(47, 33, '0'),
(47, 34, '0'),
(48, 1, '0'),
(48, 2, '0'),
(48, 3, '0'),
(48, 4, '0'),
(48, 5, '0'),
(48, 6, '0'),
(48, 7, '0'),
(48, 8, '0'),
(48, 9, '0'),
(48, 10, '0'),
(48, 11, '0'),
(48, 12, '0'),
(48, 13, '0'),
(48, 14, '0'),
(48, 15, '0'),
(48, 16, '0'),
(48, 17, '0'),
(48, 18, '0'),
(48, 19, '0'),
(48, 20, '0'),
(48, 21, '0'),
(48, 22, '60'),
(48, 23, '0'),
(48, 24, '0'),
(48, 25, '0'),
(48, 26, '0'),
(48, 27, '0'),
(48, 28, '0'),
(48, 29, '0'),
(48, 30, '0'),
(48, 31, '0'),
(48, 32, '0'),
(48, 33, '0'),
(48, 34, '0'),
(49, 1, '100'),
(49, 2, '87'),
(49, 3, '60'),
(49, 4, '87'),
(49, 5, '81'),
(49, 6, '0'),
(49, 7, '50'),
(49, 8, '0'),
(49, 9, '100'),
(49, 10, '69'),
(49, 11, '94'),
(49, 12, '77'),
(49, 13, '56'),
(49, 14, '0'),
(49, 15, '0'),
(49, 16, '69'),
(49, 17, '0'),
(49, 18, '73'),
(49, 19, '67'),
(49, 20, '0'),
(49, 21, '100'),
(49, 22, '67'),
(49, 23, '100'),
(49, 24, '79'),
(49, 25, '83'),
(49, 26, '57'),
(49, 27, '0'),
(49, 28, '0'),
(49, 29, '100'),
(49, 30, '69'),
(49, 31, '0'),
(49, 32, '69'),
(49, 33, '0'),
(49, 34, '0'),
(50, 1, '43'),
(50, 2, '0'),
(50, 3, '0'),
(50, 4, '0'),
(50, 5, '0'),
(50, 6, '0'),
(50, 7, '0'),
(50, 8, '0'),
(50, 9, '0'),
(50, 10, '0'),
(50, 11, '0'),
(50, 12, '0'),
(50, 13, '0'),
(50, 14, '0'),
(50, 15, '0'),
(50, 16, '0'),
(50, 17, '0'),
(50, 18, '0'),
(50, 19, '0'),
(50, 20, '0'),
(50, 21, '0'),
(50, 22, '0'),
(50, 23, '0'),
(50, 24, '0'),
(50, 25, '0'),
(50, 26, '0'),
(50, 27, '0'),
(50, 28, '0'),
(50, 29, '0'),
(50, 30, '0'),
(50, 31, '0'),
(50, 32, '0'),
(50, 33, '60'),
(50, 34, '58'),
(51, 1, '86'),
(51, 2, '87'),
(51, 3, '73'),
(51, 4, '80'),
(51, 5, '0'),
(51, 6, '0'),
(51, 7, '0'),
(51, 8, '0'),
(51, 9, '0'),
(51, 10, '0'),
(51, 11, '0'),
(51, 12, '0'),
(51, 13, '0'),
(51, 14, '0'),
(51, 15, '63'),
(51, 16, '69'),
(51, 17, '0'),
(51, 18, '73'),
(51, 19, '0'),
(51, 20, '0'),
(51, 21, '100'),
(51, 22, '100'),
(51, 23, '27'),
(51, 24, '100'),
(51, 25, '0'),
(51, 26, '0'),
(51, 27, '0'),
(51, 28, '0'),
(51, 29, '0'),
(51, 30, '63'),
(51, 31, '100'),
(51, 32, '0'),
(51, 33, '0'),
(51, 34, '0');

-- --------------------------------------------------------

--
-- Structure de la table `question_ctf`
--

CREATE TABLE `question_ctf` (
  `question_CTF_id` int NOT NULL,
  `question_CTF_flag` varchar(50) NOT NULL,
  `question_CTF_answer` varchar(50) NOT NULL,
  `question_CTF_bad1` varchar(50) NOT NULL,
  `question_CTF_bad2` varchar(50) NOT NULL,
  `question_CTF_bad3` varchar(50) NOT NULL,
  `quiz_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `question_ctf`
--

INSERT INTO `question_ctf` (`question_CTF_id`, `question_CTF_flag`, `question_CTF_answer`, `question_CTF_bad1`, `question_CTF_bad2`, `question_CTF_bad3`, `quiz_id`) VALUES
(51, 'hungary', 'hungary', 'turkey', 'greece', 'croatia', 1),
(52, 'croatia', 'croatia', 'italy', 'netherlands', 'germany', 1),
(50, 'netherlands', 'netherlands', 'turkey', 'greece', 'spain', 1),
(49, 'poland', 'poland', 'hungary', 'croatia', 'turkey', 1),
(48, 'portugal', 'portugal', 'netherlands', 'greece', 'united_kingdom', 1),
(46, 'greece', 'greece', 'italy', 'united_kingdom', 'portugal', 1),
(47, 'russian_federation', 'russian_federation', 'spain', 'portugal', 'croatia', 1),
(45, 'austria', 'austria', 'germany', 'hungary', 'russian_federation', 1),
(43, 'turkey', 'turkey', 'greece', 'france', 'netherlands', 1),
(44, 'germany', 'germany', 'netherlands', 'hungary', 'turkey', 1),
(42, 'united_kingdom', 'united_kingdom', 'france', 'russian_federation', 'italy', 1),
(41, 'italy', 'italy', 'united_kingdom', 'germany', 'russian_federation', 1),
(40, 'spain', 'spain', 'poland', 'greece', 'netherlands', 1),
(39, 'france', 'france', 'turkey', 'croatia', 'portugal', 1),
(53, 'ukraine', 'ukraine', 'denmark', 'bulgaria', 'finland', 2),
(54, 'czech_republic', 'czech_republic', 'sweden', 'switzerland', 'denmark', 2),
(55, 'switzerland', 'switzerland', 'slovenia', 'finland', 'sweden', 2),
(56, 'denmark', 'denmark', 'czech_republic', 'albania', 'slovakia', 2),
(57, 'ireland', 'ireland', 'estonia', 'czech_republic', 'slovenia', 2),
(58, 'bulgaria', 'bulgaria', 'switzerland', 'slovenia', 'norway', 2),
(59, 'belgium', 'belgium', 'albania', 'finland', 'sweden', 2),
(60, 'sweden', 'sweden', 'bulgaria', 'czech_republic', 'switzerland', 2),
(61, 'norway', 'norway', 'cyprus', 'sweden', 'czech_republic', 2),
(62, 'slovakia', 'slovakia', 'ukraine', 'slovenia', 'czech_republic', 2),
(63, 'albania', 'albania', 'slovakia', 'norway', 'sweden', 2),
(64, 'cyprus', 'cyprus', 'slovenia', 'finland', 'estonia', 2),
(65, 'slovenia', 'slovenia', 'ukraine', 'ireland', 'norway', 2),
(66, 'estonia', 'estonia', 'ukraine', 'slovakia', 'finland', 2),
(67, 'finland', 'finland', 'estonia', 'albania', 'norway', 2),
(68, 'andorra', 'andorra', 'lithuania', 'belarus', 'serbia', 3),
(69, 'romania', 'romania', 'north_macedonia', 'serbia', 'andorra', 3),
(70, 'lithuania', 'lithuania', 'san_marino', 'serbia', 'montenegro', 3),
(71, 'malta', 'malta', 'north_macedonia', 'liechtenstein', 'belarus', 3),
(72, 'iceland', 'iceland', 'belarus', 'romania', 'malta', 3),
(73, 'belarus', 'belarus', 'luxembourg', 'north_macedonia', 'montenegro', 3),
(74, 'montenegro', 'montenegro', 'republic_of_moldova', 'serbia', 'lithuania', 3),
(75, 'serbia', 'serbia', 'monaco', 'belarus', 'liechtenstein', 3),
(76, 'luxembourg', 'luxembourg', 'serbia', 'belarus', 'andorra', 3),
(77, 'bosnia_and_herzegovina', 'bosnia_and_herzegovina', 'luxembourg', 'san_marino', 'republic_of_moldova', 3),
(78, 'north_macedonia', 'north_macedonia', 'serbia', 'lithuania', 'liechtenstein', 3),
(79, 'monaco', 'monaco', 'san_marino', 'malta', 'bosnia_and_herzegovina', 3),
(80, 'republic_of_moldova', 'republic_of_moldova', 'belarus', 'lithuania', 'serbia', 3),
(81, 'liechtenstein', 'liechtenstein', 'republic_of_moldova', 'romania', 'north_macedonia', 3),
(82, 'san_marino', 'san_marino', 'luxembourg', 'belarus', 'north_macedonia', 3),
(83, 'united_states_of_america', 'united_states_of_america', 'costa_rica', 'peru', 'dominican_republic', 4),
(84, 'mexico', 'mexico', 'colombia', 'costa_rica', 'panama', 4),
(85, 'canada', 'canada', 'dominican_republic', 'colombia', 'peru', 4),
(86, 'argentina', 'argentina', 'mexico', 'panama', 'colombia', 4),
(87, 'brazil', 'brazil', 'united_states_of_america', 'uruguay', 'colombia', 4),
(88, 'chile', 'chile', 'mexico', 'united_states_of_america', 'brazil', 4),
(89, 'dominican_republic', 'dominican_republic', 'mexico', 'costa_rica', 'jamaica', 4),
(90, 'peru', 'peru', 'dominican_republic', 'canada', 'uruguay', 4),
(91, 'colombia', 'colombia', 'cuba', 'panama', 'united_states_of_america', 4),
(92, 'cuba', 'cuba', 'peru', 'puerto_rico', 'united_states_of_america', 4),
(93, 'puerto_rico', 'puerto_rico', 'panama', 'brazil', 'mexico', 4),
(94, 'uruguay', 'uruguay', 'peru', 'canada', 'brazil', 4),
(95, 'costa_rica', 'costa_rica', 'brazil', 'argentina', 'jamaica', 4),
(96, 'jamaica', 'jamaica', 'panama', 'puerto_rico', 'chile', 4),
(97, 'panama', 'panama', 'brazil', 'united_states_of_america', 'puerto_rico', 4),
(98, 'nicaragua', 'nicaragua', 'barbados', 'paraguay', 'haiti', 5),
(99, 'guatemala', 'guatemala', 'ecuador', 'honduras', 'bolivia', 5),
(100, 'ecuador', 'ecuador', 'belize', 'el_salvador', 'haiti', 5),
(101, 'el_salvador', 'el_salvador', 'u.s._virgin_islands', 'haiti', 'paraguay', 5),
(102, 'paraguay', 'paraguay', 'barbados', 'guadeloupe', 'bolivia', 5),
(103, 'bahamas', 'bahamas', 'guadeloupe', 'nicaragua', 'barbados', 5),
(104, 'aruba', 'aruba', 'ecuador', 'paraguay', 'bolivia', 5),
(105, 'bolivia', 'bolivia', 'haiti', 'barbados', 'ecuador', 5),
(106, 'honduras', 'honduras', 'guatemala', 'belize', 'ecuador', 5),
(107, 'u.s._virgin_islands', 'u.s._virgin_islands', 'ecuador', 'guadeloupe', 'aruba', 5),
(108, 'barbados', 'barbados', 'el_salvador', 'belize', 'martinique', 5),
(109, 'guadeloupe', 'guadeloupe', 'bolivia', 'bahamas', 'haiti', 5),
(110, 'venezuela', 'venezuela', 'guatemala', 'barbados', 'aruba', 5),
(111, 'martinique', 'martinique', 'guadeloupe', 'honduras', 'ecuador', 5),
(112, 'haiti', 'haiti', 'aruba', 'nicaragua', 'honduras', 5),
(113, 'belize', 'belize', 'el_salvador', 'venezuela', 'nicaragua', 5),
(114, 'cayman_islands', 'cayman_islands', 'saint_kitts_and_nevis', 'antigua_and_barbuda', 'british_virgin_islands', 6),
(115, 'turks_and_caicos_islands', 'turks_and_caicos_islands', 'british_virgin_islands', 'anguilla', 'saint_lucia', 6),
(116, 'saint_martin', 'saint_martin', 'cayman_islands', 'montserrat', 'antigua_and_barbuda', 6),
(117, 'curacao', 'curacao', 'cayman_islands', 'bermuda', 'guyana', 6),
(118, 'trinidad_and_tobago', 'trinidad_and_tobago', 'anguilla', 'saint_kitts_and_nevis', 'turks_and_caicos_islands', 6),
(119, 'saint_lucia', 'saint_lucia', 'cayman_islands', 'antigua_and_barbuda', 'trinidad_and_tobago', 6),
(120, 'british_virgin_islands', 'british_virgin_islands', 'cayman_islands', 'trinidad_and_tobago', 'curacao', 6),
(121, 'suriname', 'suriname', 'montserrat', 'turks_and_caicos_islands', 'trinidad_and_tobago', 6),
(122, 'bermuda', 'bermuda', 'turks_and_caicos_islands', 'saint_lucia', 'cayman_islands', 6),
(123, 'antigua_and_barbuda', 'antigua_and_barbuda', 'guyana', 'french_guiana', 'saint_kitts_and_nevis', 6),
(124, 'guyana', 'guyana', 'grenada', 'trinidad_and_tobago', 'cayman_islands', 6),
(125, 'french_guiana', 'french_guiana', 'montserrat', 'saint_lucia', 'antigua_and_barbuda', 6),
(126, 'grenada', 'grenada', 'cayman_islands', 'bermuda', 'trinidad_and_tobago', 6),
(127, 'saint_kitts_and_nevis', 'saint_kitts_and_nevis', 'saint_martin', 'grenada', 'guyana', 6),
(128, 'anguilla', 'anguilla', 'curacao', 'saint_martin', 'bermuda', 6),
(129, 'montserrat', 'montserrat', 'saint_martin', 'bermuda', 'trinidad_and_tobago', 6),
(130, 'indonesia', 'indonesia', 'papua_new_guinea', 'fiji', 'french_polynesia', 7),
(131, 'australia', 'australia', 'northern_mariana_islands', 'new_zealand', 'guam', 7),
(132, 'new_zealand', 'new_zealand', 'cook_islands', 'french_polynesia', 'papua_new_guinea', 7),
(133, 'guam', 'guam', 'cook_islands', 'papua_new_guinea', 'australia', 7),
(134, 'fiji', 'fiji', 'french_polynesia', 'australia', 'french_polynesia', 7),
(135, 'northern_mariana_islands', 'northern_mariana_islands', 'indonesia', 'cook_islands', 'guam', 7),
(136, 'french_polynesia', 'french_polynesia', 'northern_mariana_islands', 'guam', 'australia', 7),
(137, 'papua_new_guinea', 'papua_new_guinea', 'fiji', 'samoa', 'northern_mariana_islands', 7),
(138, 'cook_islands', 'cook_islands', 'new_zealand', 'samoa', 'fiji', 7),
(139, 'samoa', 'samoa', 'guam', 'french_polynesia', 'indonesia', 7),
(140, 'palau', 'palau', 'american_samoa', 'marshall_islands', 'new_caledonia', 8),
(141, 'new_caledonia', 'new_caledonia', 'palau', 'solomon_islands', 'marshall_islands', 8),
(142, 'vanuatu', 'vanuatu', 'niue', 'solomon_islands', 'tuvalu', 8),
(143, 'tonga', 'tonga', 'vanuatu', 'american_samoa', 'federated_states_of_micronesia', 8),
(144, 'federated_states_of_micronesia', 'federated_states_of_micronesia', 'vanuatu', 'american_samoa', 'marshall_islands', 8),
(145, 'solomon_islands', 'solomon_islands', 'palau', 'vanuatu', 'tonga', 8),
(146, 'american_samoa', 'american_samoa', 'vanuatu', 'palau', 'federated_states_of_micronesia', 8),
(147, 'niue', 'niue', 'new_caledonia', 'tuvalu', 'kiribati', 8),
(148, 'marshall_islands', 'marshall_islands', 'tonga', 'kiribati', 'new_caledonia', 8),
(149, 'kiribati', 'kiribati', 'marshall_islands', 'american_samoa', 'tonga', 8),
(150, 'tuvalu', 'tuvalu', 'tonga', 'vanuatu', 'american_samoa', 8),
(151, 'china', 'china', 'japan', 'taiwan', 'india', 9),
(152, 'turkey', 'turkey', 'hong_kong', 'thailand', 'malaysia', 9),
(153, 'thailand', 'thailand', 'china', 'japan', 'vietnam', 9),
(154, 'japan', 'japan', 'malaysia', 'china', 'hong_kong', 9),
(155, 'hong_kong', 'hong_kong', 'saudi_arabia', 'malaysia', 'south_korea', 9),
(156, 'malaysia', 'malaysia', 'indonesia', 'hong_kong', 'taiwan', 9),
(157, 'macao', 'macao', 'hong_kong', 'south_korea', 'turkey', 9),
(158, 'saudi_arabia', 'saudi_arabia', 'vietnam', 'macao', 'south_korea', 9),
(159, 'united_arab_emirates', 'united_arab_emirates', 'india', 'china', 'japan', 9),
(160, 'india', 'india', 'vietnam', 'turkey', 'malaysia', 9),
(161, 'singapore', 'singapore', 'south_korea', 'thailand', 'macao', 9),
(162, 'south_korea', 'south_korea', 'syrian_arab_republic', 'united_arab_emirates', 'turkey', 9),
(163, 'indonesia', 'indonesia', 'china', 'hong_kong', 'japan', 9),
(164, 'vietnam', 'vietnam', 'united_arab_emirates', 'turkey', 'south_korea', 9),
(165, 'taiwan', 'taiwan', 'macao', 'turkey', 'singapore', 9),
(166, 'syrian_arab_republic', 'syrian_arab_republic', 'singapore', 'china', 'vietnam', 9),
(167, 'philippines', 'philippines', 'cyprus', 'jordan', 'iran', 10),
(168, 'cambodia', 'cambodia', 'cyprus', 'azerbaijan', 'bahrain', 10),
(169, 'iran', 'iran', 'kyrgyzstan', 'cambodia', 'laos', 10),
(170, 'kazakhstan', 'kazakhstan', 'kyrgyzstan', 'jordan', 'laos', 10),
(171, 'bahrain', 'bahrain', 'sri_lanka', 'azerbaijan', 'qatar', 10),
(172, 'jordan', 'jordan', 'azerbaijan', 'israel', 'qatar', 10),
(173, 'cyprus', 'cyprus', 'kazakhstan', 'georgia', 'cambodia', 10),
(174, 'israel', 'israel', 'philippines', 'iran', 'qatar', 10),
(175, 'georgia', 'georgia', 'bahrain', 'myanmar', 'kyrgyzstan', 10),
(176, 'myanmar', 'myanmar', 'iran', 'cambodia', 'israel', 10),
(177, 'laos', 'laos', 'kazakhstan', 'qatar', 'georgia', 10),
(178, 'kyrgyzstan', 'kyrgyzstan', 'bahrain', 'jordan', 'bahrain', 10),
(179, 'azerbaijan', 'azerbaijan', 'qatar', 'israel', 'jordan', 10),
(180, 'oman', 'oman', 'cyprus', 'bahrain', 'cambodia', 10),
(181, 'qatar', 'qatar', 'philippines', 'bahrain', 'kyrgyzstan', 10),
(182, 'sri_lanka', 'sri_lanka', 'kyrgyzstan', 'cyprus', 'azerbaijan', 10),
(183, 'lebanon', 'lebanon', 'nepal', 'maldives', 'palestine', 11),
(184, 'iraq', 'iraq', 'armenia', 'lebanon', 'uzbekistan', 11),
(185, 'armenia', 'armenia', 'tajikistan', 'iraq', 'timor-leste', 11),
(186, 'maldives', 'maldives', 'yemen', 'nepal', 'timor-leste', 11),
(187, 'uzbekistan', 'uzbekistan', 'maldives', 'nepal', 'mongolia', 11),
(188, 'pakistan', 'pakistan', 'armenia', 'palestine', 'tajikistan', 11),
(189, 'nepal', 'nepal', 'kuwait', 'uzbekistan', 'mongolia', 11),
(190, 'palestine', 'palestine', 'nepal', 'bangladesh', 'armenia', 11),
(191, 'mongolia', 'mongolia', 'tajikistan', 'mongolia', 'palestine', 11),
(192, 'tajikistan', 'tajikistan', 'kuwait', 'nepal', 'lebanon', 11),
(193, 'yemen', 'yemen', 'lebanon', 'maldives', 'mongolia', 11),
(194, 'brunei', 'brunei', 'nepal', 'maldives', 'timor-leste', 11),
(195, 'bhutan', 'bhutan', 'armenia', 'bangladesh', 'lebanon', 11),
(196, 'kuwait', 'kuwait', 'uzbekistan', 'palestine', 'uzbekistan', 11),
(197, 'bangladesh', 'bangladesh', 'pakistan', 'kuwait', 'armenia', 11),
(198, 'timor-leste', 'timor-leste', 'bhutan', 'palestine', 'mongolia', 11),
(205, 'morocco', 'morocco', 'tanzania', 'zimbabwe', 'botswana', 12),
(206, 'south_africa', 'south_africa', 'morocco', 'botswana', 'namibia', 12),
(207, 'egypt', 'egypt', 'zimbabwe', 'algeria', 'tanzania', 12),
(208, 'tunisia', 'tunisia', 'egypt', 'namibia', 'south_africa', 12),
(209, 'algeria', 'algeria', 'botswana', 'nigeria', 'namibia', 12),
(210, 'zimbabwe', 'zimbabwe', 'morocco', 'tanzania', 'mozambique', 12),
(211, 'nigeria', 'nigeria', 'south_africa', 'mauritius', 'côte_d\'ivoire', 12),
(212, 'côte_d\'ivoire', 'côte_d\'ivoire', 'egypt', 'botswana', 'algeria', 12),
(213, 'mozambique', 'mozambique', 'kenya', 'namibia', 'morocco', 12),
(214, 'botswana', 'botswana', 'egypt', 'senegal', 'tunisia', 12),
(215, 'namibia', 'namibia', 'côte_d\'ivoire', 'senegal', 'egypt', 12),
(216, 'kenya', 'kenya', 'mozambique', 'zimbabwe', 'tanzania', 12),
(217, 'mauritius', 'mauritius', 'uganda', 'south_africa', 'mozambique', 12),
(218, 'uganda', 'uganda', 'tunisia', 'nigeria', 'côte_d\'ivoire', 12),
(219, 'tanzania', 'tanzania', 'mozambique', 'nigeria', 'nigeria', 12),
(220, 'senegal', 'senegal', 'kenya', 'mauritius', 'egypt', 12),
(221, 'zambia', 'zambia', 'the_democratic_republic_of_the_congo', 'benin', 'malawi', 13),
(222, 'swaziland', 'swaziland', 'the_democratic_republic_of_the_congo', 'togo', 'cameroon', 13),
(223, 'ghana', 'ghana', 'swaziland', 'angola', 'malawi', 13),
(224, 'ethiopia', 'ethiopia', 'cape_verde', 'benin', 'lesotho', 13),
(225, 'malawi', 'malawi', 'zambia', 'angola', 'réunion', 13),
(226, 'sudan', 'sudan', 'ghana', 'angola', 'the_democratic_republic_of_the_congo', 13),
(227, 'cape_verde', 'cape_verde', 'ghana', 'lesotho', 'zambia', 13),
(228, 'cameroon', 'cameroon', 'the_democratic_republic_of_the_congo', 'benin', 'cape_verde', 13),
(229, 'réunion', 'réunion', 'ethiopia', 'zambia', 'swaziland', 13),
(230, 'togo', 'togo', 'cameroon', 'benin', 'the_democratic_republic_of_the_congo', 13),
(231, 'lesotho', 'lesotho', 'benin', 'angola', 'seychelles', 13),
(232, 'angola', 'angola', 'madagascar', 'zambia', 'ghana', 13),
(233, 'the_democratic_republic_of_the_congo', 'the_democratic_republic_of_the_congo', 'angola', 'cape_verde', 'zambia', 13),
(234, 'seychelles', 'seychelles', 'the_democratic_republic_of_the_congo', 'ethiopia', 'cape_verde', 13),
(235, 'benin', 'benin', 'zambia', 'swaziland', 'ethiopia', 13),
(236, 'madagascar', 'madagascar', 'cape_verde', 'benin', 'swaziland', 13),
(237, 'republic_of_the_congo', 'republic_of_the_congo', 'burkina_faso', 'eritrea', 'comoros', 14),
(238, 'mali', 'mali', 'djibouti', 'burundi', 'sierra_leone', 14),
(239, 'burundi', 'burundi', 'eritrea', 'sao_tome_and_principe', 'niger', 14),
(240, 'gambia', 'gambia', 'burundi', 'central_african_republic', 'sierra_leone', 14),
(241, 'niger', 'niger', 'burundi', 'mali', 'central_african_republic', 14),
(242, 'burkina_faso', 'burkina_faso', 'chad', 'burundi', 'guinea', 14),
(243, 'eritrea', 'eritrea', 'republic_of_the_congo', 'burkina_faso', 'niger', 14),
(244, 'central_african_republic', 'central_african_republic', 'republic_of_the_congo', 'gambia', 'guinea', 14),
(245, 'chad', 'chad', 'sierra_leone', 'mali', 'eritrea', 14),
(246, 'guinea', 'guinea', 'chad', 'niger', 'sierra_leone', 14),
(247, 'sierra_leone', 'sierra_leone', 'republic_of_the_congo', 'sao_tome_and_principe', 'eritrea', 14),
(248, 'djibouti', 'djibouti', 'guinea', 'central_african_republic', 'sierra_leone', 14),
(249, 'guinea-bissau', 'guinea-bissau', 'mali', 'guinea', 'sao_tome_and_principe', 14),
(250, 'sao_tome_and_principe', 'sao_tome_and_principe', 'comoros', 'republic_of_the_congo', 'guinea-bissau', 14),
(251, 'comoros', 'comoros', 'djibouti', 'niger', 'mali', 14);

-- --------------------------------------------------------

--
-- Structure de la table `question_ftc`
--

CREATE TABLE `question_ftc` (
  `question_FTC_id` int NOT NULL,
  `question_FTC_capital` varchar(50) NOT NULL,
  `question_FTC_answer` varchar(50) NOT NULL,
  `question_FTC_bad1` varchar(50) NOT NULL,
  `question_FTC_bad2` varchar(50) NOT NULL,
  `question_FTC_bad3` varchar(50) NOT NULL,
  `quiz_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `question_ftc`
--

INSERT INTO `question_ftc` (`question_FTC_id`, `question_FTC_capital`, `question_FTC_answer`, `question_FTC_bad1`, `question_FTC_bad2`, `question_FTC_bad3`, `quiz_id`) VALUES
(1, 'paris', 'france', 'netherlands', 'italy', 'spain', 21),
(2, 'madrid', 'spain', 'france', 'croatia', 'portugal', 21),
(3, 'rome', 'italy', 'croatia', 'france', 'turkey', 21),
(4, 'london', 'united_kingdom', 'france', 'russian_federation', 'poland', 21),
(5, 'ankara', 'turkey', 'spain', 'russian_federation', 'france', 21),
(6, 'berlin', 'germany', 'poland', 'austria', 'united_kingdom', 21),
(7, 'vienna', 'austria', 'hungary', 'poland', 'united_kingdom', 21),
(8, 'athens', 'greece', 'russian_federation', 'spain', 'germany', 21),
(9, 'moscow', 'russian_federation', 'united_kingdom', 'hungary', 'portugal', 21),
(10, 'lisbon', 'portugal', 'united_kingdom', 'germany', 'netherlands', 21),
(11, 'warsaw', 'poland', 'united_kingdom', 'hungary', 'russian_federation', 21),
(12, 'amsterdam', 'netherlands', 'france', 'germany', 'russian_federation', 21),
(13, 'budapest', 'hungary', 'poland', 'netherlands', 'greece', 21),
(14, 'zagre', 'croatia', 'austria', 'russian_federation', 'italy', 21),
(15, 'Kiev', 'ukraine', 'cyprus', 'albania', 'slovenia', 22),
(16, 'Prague', 'czech_republic', 'ireland', 'slovenia', 'cyprus', 22),
(17, 'Berne', 'switzerland', 'belgium', 'estonia', 'slovakia', 22),
(18, 'Copenhagen', 'denmark', 'sweden', 'ukraine', 'bulgaria', 22),
(19, 'Dublin', 'ireland', 'ukraine', 'sweden', 'denmark', 22),
(20, 'Sofia', 'bulgaria', 'cyprus', 'albania', 'czech_republic', 22),
(21, 'Brussels', 'belgium', 'denmark', 'bulgaria', 'cyprus', 22),
(22, 'Stockholm', 'sweden', 'ukraine', 'ireland', 'slovenia', 22),
(23, 'Oslo', 'norway', 'albania', 'belgium', 'sweden', 22),
(24, 'Bratislava', 'slovakia', 'bulgaria', 'belgium', 'albania', 22),
(25, 'Tirane', 'albania', 'czech_republic', 'finland', 'sweden', 22),
(26, 'Nicosia', 'cyprus', 'slovenia', 'ireland', 'denmark', 22),
(27, 'Ljubljana', 'slovenia', 'ireland', 'estonia', 'belgium', 22),
(28, 'Tallinn', 'estonia', 'bulgaria', 'slovenia', 'slovakia', 22),
(29, 'Helsink', 'finland', 'estonia', 'slovakia', 'bulgaria', 22),
(30, 'Andorra la Vella', 'andorra', 'serbia', 'malta', 'liechtenstein', 23),
(31, 'Bucharest', 'romania', 'san_marino', 'malta', 'liechtenstein', 23),
(32, 'Vilnius', 'lithuania', 'andorra', 'serbia', 'malta', 23),
(33, 'Valletta', 'malta', 'lithuania', 'serbia', 'republic_of_moldova', 23),
(34, 'Reykjavik', 'iceland', 'romania', 'serbia', 'liechtenstein', 23),
(35, 'Minsk', 'belarus', 'north_macedonia', 'montenegro', 'republic_of_moldova', 23),
(36, 'Podgorica', 'montenegro', 'andorra', 'liechtenstein', 'belarus', 23),
(37, 'Belgrade', 'serbia', 'monaco', 'liechtenstein', 'andorra', 23),
(38, 'Luxembourg', 'luxembourg', 'malta', 'serbia', 'romania', 23),
(39, 'Sarajevo', 'bosnia_and_herzegovina', 'republic_of_moldova', 'liechtenstein', 'romania', 23),
(40, 'Skopje', 'north_macedonia', 'serbia', 'monaco', 'bosnia_and_herzegovina', 23),
(41, 'Monte Carlo', 'monaco', 'lithuania', 'belarus', 'bosnia_and_herzegovina', 23),
(42, 'Chisinau', 'republic_of_moldova', 'luxembourg', 'belarus', 'monaco', 23),
(43, 'Vaduz', 'liechtenstein', 'luxembourg', 'malta', 'belarus', 23),
(44, 'San Marin', 'san_marino', 'romania', 'montenegro', 'belarus', 23),
(45, 'Washington D.C.', 'united states of america', 'brazil', 'panama', 'dominican republic', 24),
(46, 'Mexico City', 'mexico', 'canada', 'brazil', 'uruguay', 24),
(47, 'Ottawa', 'canada', 'jamaica', 'colombia', 'chile', 24),
(48, 'Buenos Aires', 'argentina', 'panama', 'colombia', 'dominican republic', 24),
(49, 'Brasilia', 'brazil', 'argentina', 'costa rica', 'mexico', 24),
(50, 'Santiago', 'chile', 'argentina', 'panama', 'jamaica', 24),
(51, 'Santo Domingo', 'dominican republic', 'costa rica', 'chile', 'united states of america', 24),
(52, 'Lima', 'peru', 'united states of america', 'costa rica', 'mexico', 24),
(53, 'Bogota', 'colombia', 'uruguay', 'dominican republic', 'united states of america', 24),
(54, 'Havana', 'cuba', 'panama', 'dominican republic', 'chile', 24),
(55, 'Montevideo', 'uruguay', 'mexico', 'united states of america', 'canada', 24),
(56, 'San Jose', 'costa rica', 'uruguay', 'colombia', 'united states of america', 24),
(57, 'Kingston', 'jamaica', 'costa rica', 'cuba', 'canada', 24),
(58, 'Panama City', 'panama', 'united states of america', 'canada', 'mexico', 24),
(59, 'Managua', 'nicaragua', 'el salvador', 'bahamas', 'guatemala', 25),
(60, 'Guatemala City', 'guatemala', 'paraguay', 'el salvador', 'ecuador', 25),
(61, 'Quito', 'ecuador', 'bahamas', 'nicaragua', 'bolivia', 25),
(62, 'San Salvador', 'el salvador', 'honduras', 'bahamas', 'ecuador', 25),
(63, 'Asuncion', 'paraguay', 'venezuela', 'barbados', 'el salvador', 25),
(64, 'Nassau', 'bahamas', 'honduras', 'ecuador', 'haiti', 25),
(65, 'La Paz', 'bolivia', 'haiti', 'honduras', 'el salvador', 25),
(66, 'Tegucigalpa', 'honduras', 'guatemala', 'venezuela', 'bahamas', 25),
(67, 'Bridgetown', 'barbados', 'guatemala', 'nicaragua', 'venezuela', 25),
(68, 'Caracas', 'venezuela', 'honduras', 'guatemala', 'bahamas', 25),
(69, 'Port-au-Prince', 'haiti', 'barbados', 'ecuador', 'paraguay', 25),
(70, 'Belmopan', 'belize', 'paraguay', 'haiti', 'guatemala', 25),
(71, 'Port-of-Spain', 'trinidad and tobago', 'antigua and barbuda', 'saint kitts and nevis', 'saint lucia', 26),
(72, 'Castries', 'saint lucia', 'saint kitts and nevis', 'guyana', 'antigua and barbuda', 26),
(73, 'Paramaribo', 'suriname', 'trinidad and tobago', 'saint kitts and nevis', 'trinidad and tobago', 26),
(74, 'Saint John\'s', 'antigua and barbuda', 'saint lucia', 'antigua and barbuda', 'saint kitts and nevis', 26),
(75, 'Georgetown', 'guyana', 'antigua and barbuda', 'saint kitts and nevis', 'saint lucia', 26),
(76, 'Saint George\'s', 'grenada', 'guyana', 'antigua and barbuda', 'suriname', 26),
(77, 'Basseterre', 'saint kitts and nevis', 'saint lucia', 'antigua and barbuda', 'grenada', 26),
(78, 'Jakarta', 'indonesia', 'papua new guinea', 'fiji', 'australia', 27),
(79, 'Canberra', 'australia', 'papua new guinea', 'samoa', 'new zealand', 27),
(80, 'Wellington', 'new zealand', 'papua new guinea', 'indonesia', 'australia', 27),
(81, 'Suva', 'fiji', 'indonesia', 'new zealand', 'papua new guinea', 27),
(82, 'Port Moresby', 'papua new guinea', 'fiji', 'samoa', 'papua new guinea', 27),
(83, 'Apia', 'samoa', 'new zealand', 'new zealand', 'papua new guinea', 27),
(84, 'Melekeok', 'palau', 'vanuatu', 'tonga', 'tuvalu', 28),
(85, 'Port-Vila', 'vanuatu', 'kiribati', 'federated states of micronesia', 'solomon islands', 28),
(86, 'Nuku\'alofa', 'tonga', 'federated states of micronesia', 'solomon islands', 'palau', 28),
(87, 'Palikir', 'federated states of micronesia', 'palau', 'tonga', 'kiribati', 28),
(88, 'Honiara', 'solomon islands', 'federated states of micronesia', 'solomon islands', 'tonga', 28),
(89, 'Tarawa Atoll', 'kiribati', 'solomon islands', 'palau', 'solomon islands', 28),
(90, 'Vaiaku village', 'tuvalu', 'solomon islands', 'vanuatu', 'solomon islands', 28),
(91, 'Beijing', 'china', 'turkey', 'thailand', 'vietnam', 29),
(92, 'Ankara', 'turkey', 'japan', 'saudi arabia', 'singapore', 29),
(93, 'Bangkok', 'thailand', 'turkey', 'japan', 'singapore', 29),
(94, 'Tokyo', 'japan', 'singapore', 'south korea', 'vietnam', 29),
(95, 'Kuala Lumpur', 'malaysia', 'china', 'syrian arab republic', 'united arab emirates', 29),
(96, 'Riyadh', 'saudi arabia', 'japan', 'singapore', 'syrian arab republic', 29),
(97, 'Abu Dhabi', 'united arab emirates', 'singapore', 'syrian arab republic', 'china', 29),
(98, 'New Delhi', 'india', 'united arab emirates', 'thailand', 'saudi arabia', 29),
(99, 'Singapore', 'singapore', 'india', 'saudi arabia', 'vietnam', 29),
(100, 'Seoul', 'south korea', 'india', 'japan', 'syrian arab republic', 29),
(101, 'Jakarta', 'indonesia', 'taiwan', 'thailand', 'japan', 29),
(102, 'Hanoi', 'vietnam', 'syrian arab republic', 'indonesia', 'turkey', 29),
(103, 'Taipei', 'taiwan', 'south korea', 'malaysia', 'japan', 29),
(104, 'Damascus', 'syrian arab republic', 'south korea', 'thailand', 'malaysia', 29),
(105, 'Manila', 'philippines', 'bahrain', 'iran', 'kyrgyzstan', 30),
(106, 'Phnom Penh', 'cambodia', 'israel', 'qatar', 'cyprus', 30),
(107, 'Tehran', 'iran', 'georgia', 'qatar', 'bahrain', 30),
(108, 'Nur Sultan', 'kazakhstan', 'israel', 'bahrain', 'sri lanka', 30),
(109, 'Manama', 'bahrain', 'qatar', 'myanmar', 'kazakhstan', 30),
(110, 'Amman', 'jordan', 'cambodia', 'israel', 'oman', 30),
(111, 'Nicosia', 'cyprus', 'azerbaijan', 'bahrain', 'philippines', 30),
(112, 'Jerusalem', 'israel', 'azerbaijan', 'philippines', 'myanmar', 30),
(113, 'Tbilisi', 'georgia', 'laos', 'philippines', 'jordan', 30),
(114, 'Nay Pyi Taw', 'myanmar', 'oman', 'sri lanka', 'georgia', 30),
(115, 'Vientiane', 'laos', 'georgia', 'myanmar', 'cyprus', 30),
(116, 'Bishkek', 'kyrgyzstan', 'israel', 'cyprus', 'oman', 30),
(117, 'Baku', 'azerbaijan', 'sri lanka', 'cyprus', 'myanmar', 30),
(118, 'Muscat', 'oman', 'kyrgyzstan', 'georgia', 'laos', 30),
(119, 'Doha', 'qatar', 'israel', 'cyprus', 'azerbaijan', 30),
(120, 'Colombo', 'sri lanka', 'iran', 'qatar', 'bahrain', 30),
(121, 'Beirut', 'lebanon', 'iraq', 'bhutan', 'brunei', 31),
(122, 'Baghdad', 'iraq', 'mongolia', 'lebanon', 'nepal', 31),
(123, 'Yerevan', 'armenia', 'iraq', 'kuwait', 'palestine', 31),
(124, 'Male', 'maldives', 'tajikistan', 'yemen', 'bangladesh', 31),
(125, 'Tashkent', 'uzbekistan', 'armenia', 'palestine', 'maldives', 31),
(126, 'Islamabad', 'pakistan', 'yemen', 'lebanon', 'kuwait', 31),
(127, 'Kathmandu', 'nepal', 'lebanon', 'yemen', 'brunei', 31),
(128, 'Ramallah, East Jerusalem', 'palestine', 'tajikistan', 'brunei', 'kuwait', 31),
(129, 'Ulaanbaatar', 'mongolia', 'lebanon', 'bhutan', 'uzbekistan', 31),
(130, 'Dushanbe', 'tajikistan', 'kuwait', 'brunei', 'iraq', 31),
(131, 'Sanaa', 'yemen', 'uzbekistan', 'pakistan', 'kuwait', 31),
(132, 'Bandar Seri Begawan', 'brunei', 'nepal', 'pakistan', 'bangladesh', 31),
(133, 'Thimphu', 'bhutan', 'brunei', 'bangladesh', 'lebanon', 31),
(134, 'Kuwait City', 'kuwait', 'lebanon', 'tajikistan', 'brunei', 31),
(135, 'Dhaka', 'bangladesh', 'mongolia', 'bhutan', 'kuwait', 31),
(136, 'Rabat', 'morocco', 'namibia', 'mozambique', 'tanzania', 32),
(137, 'Cape Town', 'south africa', 'zimbabwe', 'côte d\'ivoire', 'uganda', 32),
(138, 'Cairo', 'egypt', 'tunisia', 'zimbabwe', 'senegal', 32),
(139, 'Tunis', 'tunisia', 'kenya', 'uganda', 'south africa', 32),
(140, 'Algiers', 'algeria', 'tanzania', 'kenya', 'mauritius', 32),
(141, 'Harare', 'zimbabwe', 'uganda', 'tanzania', 'botswana', 32),
(142, 'Abuja', 'nigeria', 'côte d\'ivoire', 'mozambique', 'tunisia', 32),
(143, 'Yamoussoukro', 'côte d\'ivoire', 'tanzania', 'kenya', 'senegal', 32),
(144, 'Maputo', 'mozambique', 'morocco', 'mauritius', 'nigeria', 32),
(145, 'Gaborone', 'botswana', 'mauritius', 'côte d\'ivoire', 'egypt', 32),
(146, 'Windhoek', 'namibia', 'tunisia', 'zimbabwe', 'uganda', 32),
(147, 'Nairobi', 'kenya', 'tanzania', 'uganda', 'south africa', 32),
(148, 'Port Louis', 'mauritius', 'nigeria', 'côte d\'ivoire', 'mozambique', 32),
(149, 'Kampala', 'uganda', 'senegal', 'zimbabwe', 'kenya', 32),
(150, 'Dar es Salaam', 'tanzania', 'mozambique', 'namibia', 'uganda', 32),
(151, 'Dakar', 'senegal', 'nigeria', 'tanzania', 'namibia', 32),
(152, 'Lusaka', 'zambia', 'ghana', 'ethiopia', 'madagascar', 33),
(153, 'Mbabane', 'swaziland', 'togo', 'the democratic republic of the congo', 'seychelles', 33),
(154, 'Accra', 'ghana', 'togo', 'swaziland', 'cameroon', 33),
(155, 'Addis Ababa', 'ethiopia', 'lesotho', 'sudan', 'madagascar', 33),
(156, 'Lilongwe', 'malawi', 'cameroon', 'benin', 'togo', 33),
(157, 'Khartoum', 'sudan', 'togo', 'lesotho', 'cameroon', 33),
(158, 'Praia', 'cape verde', 'cameroon', 'the democratic republic of the congo', 'seychelles', 33),
(159, 'Yaounde', 'cameroon', 'zambia', 'ethiopia', 'benin', 33),
(160, 'Lome', 'togo', 'seychelles', 'the democratic republic of the congo', 'sudan', 33),
(161, 'Maseru', 'lesotho', 'angola', 'togo', 'swaziland', 33),
(162, 'Luanda', 'angola', 'zambia', 'sudan', 'benin', 33),
(163, 'Kinshasa', 'the democratic republic of the congo', 'angola', 'lesotho', 'seychelles', 33),
(164, 'Victoria', 'seychelles', 'lesotho', 'togo', 'angola', 33),
(165, 'Porto-Novo', 'benin', 'swaziland', 'cape verde', 'ghana', 33),
(166, 'Antananarivo', 'madagascar', 'lesotho', 'sudan', 'togo', 33),
(167, 'Brazzaville', 'republic of the congo', 'guinea-bissau', 'central african republic', 'mali', 34),
(168, 'Bamako', 'mali', 'eritrea', 'central african republic', 'burkina faso', 34),
(169, 'Gitega', 'burundi', 'niger', 'eritrea', 'chad', 34),
(170, 'Niamey', 'niger', 'comoros', 'chad', 'burkina faso', 34),
(171, 'Ouagadougou', 'burkina faso', 'comoros', 'chad', 'burundi', 34),
(172, 'Asmara', 'eritrea', 'mali', 'central african republic', 'niger', 34),
(173, 'Bangui', 'central african republic', 'burundi', 'eritrea', 'guinea', 34),
(174, 'N\'Djamena', 'chad', 'djibouti', 'burkina faso', 'mali', 34),
(175, 'Conakry', 'guinea', 'republic of the congo', 'mali', 'republic of the congo', 34),
(176, 'Djibouti', 'djibouti', 'eritrea', 'niger', 'mali', 34),
(177, 'Bissau', 'guinea-bissau', 'niger', 'mali', 'burkina faso', 34),
(178, 'Moron', 'comoros', 'djibouti', 'mali', 'burkina faso', 34);

-- --------------------------------------------------------

--
-- Structure de la table `question_wdys`
--

CREATE TABLE `question_wdys` (
  `question_WDYS_id` int NOT NULL,
  `question_WDYS_sentence` varchar(50) NOT NULL,
  `question_WDYS_lang_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `question_WDYS_answer` varchar(50) NOT NULL,
  `question_WDYS_bad1` varchar(50) NOT NULL,
  `question_WDYS_bad2` varchar(50) NOT NULL,
  `question_WDYS_bad3` varchar(50) NOT NULL,
  `quiz_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `question_wdys`
--

INSERT INTO `question_wdys` (`question_WDYS_id`, `question_WDYS_sentence`, `question_WDYS_lang_code`, `question_WDYS_answer`, `question_WDYS_bad1`, `question_WDYS_bad2`, `question_WDYS_bad3`, `quiz_id`) VALUES
(30, 'آرامش در دل انسان به روزهای بی کاری می‌آید.', 'fa', 'Farsi', 'Arabic', 'Turkish', 'Urdu', 16),
(28, 'Ukufunda akukhomba amathuba.', 'zu', 'Zulu', 'Xhosa', 'Swazi', 'Sotho', 15),
(29, 'Səmimi gülmə insanın ürəyini açar.', 'az', 'Azeri', 'English', 'Turkish', 'Russian', 16),
(27, 'Ukufunda kuyiindlela yokwenza imisebenzi emihle.', 'xh', 'Xhosa', 'Zulu', 'Sotho', 'Swazi', 15),
(26, 'Ku dyondzisa ku nghena emhlabeni.', 'ts', 'Tsonga', 'Zulu', 'Xhosa', 'Swazi', 15),
(25, 'Tshwaragano ke kgomo ya bolwetsi.', 'tn', 'Tswana', 'Zulu', 'Xhosa', 'Sotho', 15),
(24, 'Maarifa ni nguvu.', 'sw', 'Swahili', 'Arabic', 'French', 'English', 15),
(23, 'Tshedza ke go tlhokomela bogosi.', 'ns', 'Northern Sotho', 'Zulu', 'Xhosa', 'Tswana', 15),
(21, 'Ek is lief vir die reuk van vars brood.', 'af', 'Afrikaans', 'English', 'French', 'German', 15),
(22, 'العلم يعطي الحكمة.', 'ar', 'Arabic', 'English', 'French', 'Spanish', 15),
(31, 'વિદ્યા વિના જીવન અદૂર છે.', 'gu', 'Gujarati', 'Hindi', 'Marathi', 'Punjabi', 16),
(32, 'הבשורה על פי מתי.', 'he', 'Hebrew', 'Arabic', 'Yiddish', 'Russian', 16),
(33, 'सपने वो नहीं जो हम सोते समय देखते हैं, सपने वो हैं', 'hi', 'Hindi', 'English', 'Urdu', 'Bengali', 16),
(34, 'Գիտելիքը զինվորվում է ամեն դեպի բարձրություն.', 'hy', 'Armenian', 'Russian', 'Georgian', 'Turkish', 16),
(35, 'Hidup adalah seni, dan setiap orang seniman.', 'id', 'Indonesian', 'Malay', 'Filipino', 'Javanese', 16),
(36, '虎穴に入らずんば虎子を得ず。', 'ja', 'Japanese', 'Chinese', 'Korean', 'Vietnamese', 16),
(37, 'გონება სულს დაეხმარება.', 'ka', 'Georgian', 'Armenian', 'Azerbaijani', 'Russian', 16),
(38, 'Білім мәнен жүр.', 'kk', 'Kazakh', 'Kyrgyz', 'Uzbek', 'Tatar', 16),
(39, 'ಹಸಿವಿನಿಂದ ಹುಟ್ಟುವ ಹುಳು ಮೇಲಿದೆ.', 'kn', 'Kannada', 'Telugu', 'Tamil', 'Malayalam', 16),
(40, '지식은 힘입니다.', 'ko', 'Korean', 'Chinese', 'Japanese', 'Vietnamese', 16),
(41, 'मनस्सांतां फल वाहून घ्यावं.', 'kok', 'Konkani', 'Marathi', 'Gujarati', 'Kannada', 16),
(42, 'Билим бир алдымдың казынасы болсо да, ондай болгон', 'ky', 'Kyrgyz', 'Kazakh', 'Uzbek', 'Tajik', 16),
(43, 'Мэргэжил нь оршин суугаа бол хамгийн сайн ижил бай', 'mn', 'Mongolian', 'Kazakh', 'Kyrgyz', 'Uzbek', 16),
(44, 'ज्ञानाने संग्रह केलेलं काम कधीचित्कार न करता.', 'mr', 'Marathi', 'Hindi', 'Gujarati', 'Kannada', 16),
(45, 'Ilmu adalah harta yang paling berharga.', 'ms', 'Malay', 'Indonesian', 'Filipino', 'Javanese', 17),
(46, 'ਜਾਣਕਾਰੀ ਸਬ ਤੋਂ ਵੱਡਾ ਸਮ੍ਹਾਲਾ ਹੈ.', 'pa', 'Punjabi', 'Hindi', 'Urdu', 'Bengali', 17),
(47, 'ځان او پوه ځان ژوند دې په ارمانو کې دې.', 'ps', 'Pashto', 'Persian', 'Urdu', 'Arabic', 17),
(48, 'विद्या ददाति विनयं.', 'sa', 'Sanskrit', 'Hindi', 'Marathi', 'Bengali', 17),
(49, 'ܫܠܡܐ ܬܪܥܐ ܘܬܒܘܚܐ ܐܦ ܡܕܡܢܚܐ ܩܕܝܡܐ.', 'syr', 'Syriac', 'Arabic', 'Hebrew', 'Assyrian', 17),
(50, 'அறிவு ஆற்றுவது மிகுந்த ஐசுவார்த்தியம்.', 'ta', 'Tamil', 'Telugu', 'Kannada', 'Malayalam', 17),
(51, 'పరిజ్ఞానం శక్తి.', 'te', 'Telugu', 'Tamil', 'Kannada', 'Malayalam', 17),
(52, 'ความรู้คือพลัง.', 'th', 'Thai', 'Chinese', 'Japanese', 'Vietnamese', 17),
(53, 'Ang edukasyon ay susi sa tagumpay.', 'tl', 'Tagalog', 'Spanish', 'English', 'French', 17),
(54, 'Bilgi güçtür.', 'tr', 'Turkish', 'Azerbaijani', 'Uzbek', 'Kyrgyz', 17),
(55, 'Белем - аңыз.', 'tt', 'Tatar', 'Kazakh', 'Kyrgyz', 'Uzbek', 17),
(56, 'علم سے زندگی میں اتنی کامیابی آتی ہے جیسے روشنی کے', 'ur', 'Urdu', 'Arabic', 'Persian', 'Turkish', 17),
(57, 'Bilim kuchdir.', 'uz', 'Uzbek', 'Kazakh', 'Kyrgyz', 'Turkmen', 17),
(58, 'Tri thức là sức mạnh.', 'vi', 'Vietnamese', 'Chinese', 'Korean', 'Japanese', 17),
(59, '知识改变命运。', 'zh', 'Chinese', 'Japanese', 'Korean', 'Vietnamese', 17),
(121, 'Elämä on kuin polkupyörä. Jotta pysyisi tasapainos', 'fi', 'Finnish', 'Swedish', 'Norwegian', 'Danish', 18),
(120, 'Elämä on kuin polkupyörä. Jotta pysyisi tasapainos', 'fi', 'Finnish', 'Swedish', 'Norwegian', 'Danish', 1),
(119, 'Txoria txori da.', 'eu', 'Basque', 'Spanish', 'French', 'Italian', 18),
(118, 'Õnn naeratab neile, kes ootavad.', 'et', 'Estonian', 'Finnish', 'Latvian', 'Lithuanian', 18),
(117, 'La vida es un sueño, y los sueños, sueños son.', 'es', 'Spanish', 'English', 'French', 'Italian', 18),
(116, 'Time flies when you\'re having fun.', 'en', 'English', 'Spanish', 'French', 'German', 18),
(115, 'Η γνώση είναι φως και η άγνοια είναι σκοτάδι.', 'el', 'Greek', 'English', 'French', 'Italian', 18),
(114, 'Die Welt ist ein Buch. Wer nie reist, sieht nur ei', 'de', 'German', 'English', 'French', 'Spanish', 18),
(113, 'Solen skinner på den blå himmel.', 'da', 'Danish', 'Swedish', 'Norwegian', 'German', 18),
(112, 'Čas je nejlepší lék.', 'cs', 'Czech', 'Slovak', 'Polish', 'Russian', 18),
(111, 'El gat està dormint a la butxaca.', 'ca', 'Catalan', 'Spanish', 'French', 'Italian', 18),
(110, 'Мудрасць - у самасаведамасці.', 'be', 'Belarusian', 'Russian', 'Ukrainian', 'Polish', 18),
(133, 'Kennis is macht.', 'nl', 'Dutch', 'German', 'English', 'French', 19),
(132, 'Kunnskap er makt.', 'nb', 'Norwegian', 'Danish', 'Swedish', 'Finnish', 19),
(131, 'L-isforz ta\' l-edukazzjoni huwa l-arma l-aktar qaw', 'mt', 'Maltese', 'English', 'Italian', 'Spanish', 19),
(130, 'Знаењето е силата.', 'mk', 'Macedonian', 'Bulgarian', 'Serbian', 'Slovenian', 19),
(129, 'Zināšanas ir spēks.', 'lv', 'Latvian', 'Lithuanian', 'Estonian', 'Finnish', 19),
(128, 'Išmintis - tai geriausias turtas.', 'lt', 'Lithuanian', 'Latvian', 'Estonian', 'Finnish', 19),
(127, 'La vita è un sogno, e sognare è vivere due volte.', 'it', 'Italian', 'Spanish', 'French', 'English', 19),
(126, 'Það er enginn hollusta nema heilsa.', 'is', 'Icelandic', 'Danish', 'Swedish', 'Norwegian', 19),
(125, 'Az élet szép, mint a virágok.', 'hu', 'Hungarian', 'Slovak', 'Romanian', 'Czech', 19),
(124, 'Znanje je ključ uspjeha.', 'hr', 'Croatian', 'Slovenian', 'Serbian', 'Bosnian', 19),
(123, 'A lingua é a patria.', 'gl', 'Galician', 'Portuguese', 'Spanish', 'Italian', 19),
(122, 'La vie est belle.', 'fr', 'French', 'Spanish', 'English', 'Italian', 19),
(98, 'Kunnskap er nøkkelen til suksess.', 'nn-NO', 'Norwegian', 'Danish', 'Swedish', 'Finnish', 20),
(99, 'Wiedza to potęga.', 'pl', 'Polish', 'Czech', 'Slovak', 'Russian', 20),
(100, 'A sabedoria é a principal riqueza.', 'pt', 'Portuguese', 'Spanish', 'Italian', 'French', 20),
(101, 'Cunoașterea este putere.', 'ro', 'Romanian', 'Italian', 'Spanish', 'Portuguese', 20),
(102, 'Знание - сила.', 'ru', 'Russian', 'Ukrainian', 'Belarusian', 'Polish', 20),
(103, 'Dáidda lea fámu.', 'se', 'Sami', 'Finnish', 'Norwegian', 'Swedish', 20),
(104, 'Vedomosti sú sila.', 'sk', 'Slovak', 'Czech', 'Polish', 'Hungarian', 20),
(105, 'Znanje je moč.', 'sl', 'Slovenian', 'Croatian', 'Serbian', 'Bosnian', 20),
(106, 'Dija është fuqi.', 'sq', 'Albanian', 'Italian', 'Spanish', 'French', 20),
(107, 'Знање је светло у тами.', 'sr-BA', 'Serbian', 'Croatian', 'Bosnian', 'Montenegrin', 20),
(108, 'Kunskap är makt.', 'sv', 'Swedish', 'Danish', 'Norwegian', 'Finnish', 20),
(109, 'Знання - це сила.', 'uk', 'Ukrainian', 'Russian', 'Polish', 'Belarusian', 20);

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int NOT NULL,
  `quiz_name` varchar(50) NOT NULL,
  `quiz_difficulty` tinyint NOT NULL,
  `quiz_image` tinyint NOT NULL,
  `category_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `quiz_name`, `quiz_difficulty`, `quiz_image`, `category_id`) VALUES
(1, 'Europe - Easy', 0, 1, 1),
(5, 'America - Medium', 1, 1, 1),
(3, 'Europe - Hard', 2, 1, 1),
(4, 'America - Easy', 0, 1, 1),
(2, 'Europe - Medium', 1, 1, 1),
(6, 'America - Hard', 2, 1, 1),
(7, 'Oceania - Easy', 0, 1, 1),
(8, 'Oceania - Medium', 1, 1, 1),
(9, 'Asia - Easy', 0, 1, 1),
(10, 'Asia - Medium', 1, 1, 1),
(11, 'Asia - Hard', 2, 1, 1),
(12, 'Africa - Easy', 0, 1, 1),
(13, 'Africa - Medium', 1, 1, 1),
(14, 'Africa - Hard', 2, 1, 1),
(15, 'Africa', 0, 2, 2),
(16, 'Asia - 1', 0, 2, 2),
(17, 'Asia - 2', 0, 2, 2),
(18, 'Europe - 1', 0, 2, 2),
(19, 'Europe - 2', 0, 2, 2),
(20, 'Europe - 3', 0, 2, 2),
(21, 'Europe - Easy', 0, 3, 3),
(22, 'Europe - Medium', 1, 3, 3),
(23, 'Europe - Hard', 2, 3, 3),
(24, 'America - Easy', 0, 3, 3),
(25, 'America - Medium', 1, 3, 3),
(26, 'America - Hard', 2, 3, 3),
(27, 'Oceania - Easy', 0, 3, 3),
(28, 'Oceania - Medium', 1, 3, 3),
(29, 'Asia - Easy', 0, 3, 3),
(30, 'Asia - Medium', 1, 3, 3),
(31, 'Asia - Hard', 2, 3, 3),
(32, 'Africa - Easy', 0, 3, 3),
(33, 'Africa - Medium', 1, 3, 3),
(34, 'Africa - Hard', 2, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_pp` tinyint NOT NULL,
  `user_privilege` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_password`, `user_pp`, `user_privilege`) VALUES
(32, 'user8', '$2a$10$7cEd9XgrpQPTlq87wPHRpebiU9YrBkekDhx64yplrdlvc3GrOrCPK', 31, 0),
(31, 'user33', '$2a$10$xWvF4F7PMZyPcC84YIs31uH1VJzFQ/WKZlc.iMsKmcdTjxZ8IWbhG', 24, 1),
(30, 'user5', '$2a$10$bPwDRIF7C9XoVC0WdHuVFucSt0F8aaz33MRwzEuQy.RvAK6IC7n9e', 35, 0),
(29, 'user31', '$2a$10$R.0QK2wxnJKvVPyeIv1NWeixJwVPyp4rdB5DzseL1qfgjvaO4ndiK', 29, 0),
(27, 'user3', '$2a$10$SQoJtRIfBI2tKyMyUY23UOAJFLVeUiRm4wdUu2MXO8kOkPW84Mev6', 14, 1),
(49, 'user', '$2b$10$X9HVl/.OSUiYJXR2owcVye9fTfEOQC072BwvmZSTZgHYqNK7IUSkS', 10, 2),
(34, 'user9', '$2a$10$GTvG3GUdpRPMJKhbbkIlP.EM1kRpQVXt7K7/sTPghJmn57HIHWozC', 23, 0),
(36, 'user8812', '$2b$10$Q2Pb6DP6dosRVFDTcZz1V.4EsnkLgEGlE/9ekAT4LEImqduPhFGpC', 23, 0),
(37, 'user74856&', '$2b$10$tHuoSAzaRLOYl7sgjP4dmOKIsiCJZxKH59/MR.gOmF0R0NouTqU2a', 20, 0),
(46, 'onlinetest', '$2b$10$7UU/SYWGXcQoCuxcv9fDAOCVF7vhP/w9RSZV36zEt23efey7j0c4O', 11, 0),
(47, 'user44', '$2b$10$knE9Kgj.P3MPqDPw0CQrP.SMzmrVvhOkK318fGk4eqlFslwcsjQSm', 30, 0),
(48, 'popo', '$2b$10$a08wH0hJ5JeUOqim2kmCbOll/sH4puwceTkS9FmyZL7XAnkX3snFi', 29, 0),
(50, 'melestia', '$2b$10$9U94E0Cb5lt8vkmc.jKXJORgT4qdq86dOcfYzN4n9wEObRtJB2vCC', 12, 0),
(51, 'carlux', '$2b$10$fzfRuYx0BF6uxTVjJTRVo.Q2P7F3JjkMSjTo7kBm5ADF1Bqy7IYge', 14, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Index pour la table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`user_id`,`quiz_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Index pour la table `question_ctf`
--
ALTER TABLE `question_ctf`
  ADD PRIMARY KEY (`question_CTF_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Index pour la table `question_ftc`
--
ALTER TABLE `question_ftc`
  ADD PRIMARY KEY (`question_FTC_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Index pour la table `question_wdys`
--
ALTER TABLE `question_wdys`
  ADD PRIMARY KEY (`question_WDYS_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_username` (`user_username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `question_ctf`
--
ALTER TABLE `question_ctf`
  MODIFY `question_CTF_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT pour la table `question_ftc`
--
ALTER TABLE `question_ftc`
  MODIFY `question_FTC_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT pour la table `question_wdys`
--
ALTER TABLE `question_wdys`
  MODIFY `question_WDYS_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT pour la table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
