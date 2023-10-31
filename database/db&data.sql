-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 31 oct. 2023 à 09:03
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `progress`
--

INSERT INTO `progress` (`user_id`, `quiz_id`, `progress_value`) VALUES
(26, 3, '0'),
(26, 2, '0'),
(26, 1, '0'),
(29, 6, '69'),
(29, 7, '40'),
(27, 8, '0'),
(27, 6, '0'),
(27, 5, '0'),
(27, 4, '0'),
(27, 3, '0'),
(27, 2, '0'),
(27, 1, '0'),
(26, 6, '0'),
(26, 5, '0'),
(26, 4, '0'),
(29, 5, '25'),
(29, 4, '47'),
(29, 3, '13'),
(26, 7, '0'),
(29, 2, '80'),
(27, 7, '0'),
(26, 8, '0'),
(29, 8, '0'),
(29, 1, '93'),
(27, 9, '0'),
(26, 9, '0'),
(29, 9, '36'),
(26, 10, '0'),
(29, 10, '69'),
(27, 10, '0'),
(26, 11, '0'),
(29, 11, '19'),
(27, 11, '0'),
(26, 12, '0'),
(29, 12, '24'),
(27, 12, '0'),
(26, 13, '0'),
(29, 13, '38'),
(27, 13, '0'),
(26, 14, '0'),
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
(26, 15, '0'),
(30, 15, '0'),
(27, 16, '0'),
(26, 16, '0'),
(30, 16, '0'),
(27, 17, '0'),
(26, 17, '0'),
(30, 17, '0'),
(27, 18, '0'),
(26, 18, '0'),
(30, 18, '0'),
(27, 19, '0'),
(26, 19, '0'),
(30, 19, '0'),
(27, 20, '0'),
(26, 20, '0'),
(30, 20, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4;

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
(199, 'morocco', 'morocco', 'tanzania', 'zimbabwe', 'botswana', 12),
(200, 'south_africa', 'south_africa', 'morocco', 'botswana', 'namibia', 12),
(201, 'egypt', 'egypt', 'zimbabwe', 'algeria', 'tanzania', 12),
(202, 'tunisia', 'tunisia', 'egypt', 'namibia', 'south_africa', 12),
(203, 'algeria', 'algeria', 'botswana', 'nigeria', 'namibia', 12),
(204, 'zimbabwe', 'zimbabwe', 'morocco', 'tanzania', 'mozambique', 12),
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
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(50) NOT NULL,
  `quiz_difficulty` tinyint NOT NULL,
  `quiz_image` tinyint NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

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
(20, 'Europe - 3', 0, 2, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_username`, `user_password`, `user_pp`, `user_privilege`) VALUES
(30, 'user5', '$2a$10$bPwDRIF7C9XoVC0WdHuVFucSt0F8aaz33MRwzEuQy.RvAK6IC7n9e', 35, 0),
(29, 'user31', '$2a$10$R.0QK2wxnJKvVPyeIv1NWeixJwVPyp4rdB5DzseL1qfgjvaO4ndiK', 29, 0),
(27, 'user3', '$2a$10$SQoJtRIfBI2tKyMyUY23UOAJFLVeUiRm4wdUu2MXO8kOkPW84Mev6', 14, 0),
(26, 'user1', '$2a$10$SC5jsBDkIUnLXeW9k5N4y.y35tWkzCd5cdoZh4aEBT3dHvJjqIgNO', 16, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
