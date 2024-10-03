

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Βάση δεδομένων: `web_db`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
('2d5f74de114747fd824ca8a6a9d687fa', 'Προστασία Υγείας'),
('662418cbd02e435280148dbb8892782a', 'Για κατοικίδια'),
('8016e637b54241f8ad242ed1699bf2da', 'Βρεφικά Είδη'),
('8e8117f7d9d64cf1a931a351eb15bd69', 'Προσωπική φροντίδα'),
('a8ac6be68b53443bbd93b229e2f9cd34', 'Ποτά - Αναψυκτικά'),
('d41744460283406a86f8e4bd5010a66d', 'Καθαριότητα'),
('e4b4de2e31fc43b7b68a0fe4fbfad2e6', 'Αντισηπτικά'),
('ee0022e7b1b34eb2b834ea334cda52e7', 'Τρόφιμα');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `discount_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `price` double(8,2) NOT NULL,
  `date_entered` date NOT NULL,
  `stock` int(255) NOT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `discount_product_id_foreign` (`product_id`),
  KEY `discount_store_id_foreign` (`store_id`),
  KEY `discount_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `discount`
--

INSERT INTO `discount` (`discount_id`, `user_id`, `product_id`, `store_id`, `price`, `date_entered`, `stock`) VALUES
(104, 13, 673, 1815896581, 2.00, '2023-10-04', 1),
(103, 1, 673, 7673935764, 2.00, '2023-10-02', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `dislike`
--

DROP TABLE IF EXISTS `dislike`;
CREATE TABLE IF NOT EXISTS `dislike` (
  `dislike_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `discount_id` int(255) NOT NULL,
  PRIMARY KEY (`dislike_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `dislike`
--

INSERT INTO `dislike` (`dislike_id`, `user_id`, `discount_id`) VALUES
(43, '13', 103),
(42, '4', 80),
(41, '4', 80),
(40, '1', 79),
(39, '1', 76),
(38, '1', 62),
(26, '5', 2),
(27, '5', 33),
(28, '1', 1),
(29, '1', 1),
(30, '8', 52),
(31, '1', 56),
(32, '6', 63),
(33, '6', 62),
(34, '6', 56),
(35, '7', 69),
(36, '7', 64),
(37, '7', 68);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `like`
--

DROP TABLE IF EXISTS `like`;
CREATE TABLE IF NOT EXISTS `like` (
  `like_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `discount_id` int(255) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `like`
--

INSERT INTO `like` (`like_id`, `user_id`, `discount_id`) VALUES
(158, '13', 103),
(157, '1', 101),
(156, '1', 82),
(155, '1', 81),
(154, '1', 81),
(153, '1', 81),
(152, '9', 80),
(151, '4', 80),
(150, '4', 80),
(149, '1', 79);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `monthly_score`
--

DROP TABLE IF EXISTS `monthly_score`;
CREATE TABLE IF NOT EXISTS `monthly_score` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `monthly_score`
--

INSERT INTO `monthly_score` (`user_id`, `points`) VALUES
(1, 14),
(13, 50);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE IF NOT EXISTS `prices` (
  `product_id` varchar(255) NOT NULL,
  `latest_date` date NOT NULL,
  `newest_date` date NOT NULL,
  `price1` decimal(10,2) DEFAULT NULL,
  `price2` decimal(10,2) DEFAULT NULL,
  `price3` decimal(10,2) DEFAULT NULL,
  `price4` decimal(10,2) DEFAULT NULL,
  `price5` decimal(10,2) DEFAULT NULL,
  `price_avg` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `prices`
--

INSERT INTO `prices` (`product_id`, `latest_date`, `newest_date`, `price1`, `price2`, `price3`, `price4`, `price5`, `price_avg`) VALUES
('689', '2022-06-12', '2022-01-12', '1.72', '1.78', '1.73', '1.73', '1.71', '1.73'),
('826', '2022-06-12', '2022-01-12', '0.64', '0.65', '0.64', '0.65', '0.65', '0.65'),
('748', '2022-06-12', '2022-01-12', '0.80', '0.81', '0.80', '0.79', '0.79', '0.80'),
('316', '2022-06-12', '2022-01-12', '1.63', '1.62', '1.67', '1.65', '1.63', '1.64'),
('756', '2022-06-12', '2022-01-12', '2.13', '2.26', '2.27', '2.23', '2.25', '2.23'),
('1222', '2022-06-12', '2022-01-12', '0.79', '0.81', '0.80', '0.81', '0.81', '0.80'),
('869', '2022-06-12', '2022-01-12', '1.47', '1.49', '1.50', '1.46', '1.42', '1.47'),
('1275', '2022-06-12', '2022-01-12', '1.45', '1.45', '1.46', '1.44', '1.41', '1.44'),
('1199', '2022-06-12', '2022-01-12', '0.86', '0.86', '0.86', '0.86', '0.86', '0.86'),
('332', '2022-06-12', '2022-01-12', '1.53', '1.56', '1.52', '1.53', '1.56', '1.54'),
('673', '2022-06-12', '2022-01-12', '1.42', '1.42', '1.42', '1.43', '1.43', '1.42'),
('184', '2022-06-12', '2022-01-12', '1.84', '1.85', '1.82', '1.87', '1.88', '1.85'),
('1229', '2022-06-12', '2022-01-12', '1.71', '1.78', '1.76', '1.77', '1.79', '1.76'),
('639', '2022-06-12', '2022-01-12', '0.99', '1.00', '1.04', '1.03', '1.04', '1.02'),
('251', '2022-06-12', '2022-01-12', '1.15', '1.17', '1.20', '1.27', '1.22', '1.20'),
('388', '2022-06-12', '2022-01-12', '1.78', '1.78', '1.78', '1.78', '1.70', '1.76'),
('394', '2022-06-12', '2022-01-12', '1.70', '1.69', '1.70', '1.70', '1.70', '1.70'),
('1166', '2022-06-12', '2022-01-12', '0.72', '0.71', '0.71', '0.71', '0.70', '0.71'),
('558', '2022-06-12', '2022-01-12', '0.83', '0.82', '0.84', '0.82', '0.86', '0.83'),
('517', '2022-06-12', '2022-01-12', '1.14', '1.18', '1.25', '1.18', '1.18', '1.19'),
('168', '2022-06-12', '2022-01-12', '0.96', '0.97', '0.93', '0.96', '0.97', '0.96'),
('936', '2022-06-12', '2022-01-12', '1.56', '1.55', '1.54', '1.55', '1.55', '1.55'),
('1015', '2022-06-12', '2022-01-12', '1.02', '1.00', '1.06', '1.03', '1.03', '1.03'),
('725', '2022-06-12', '2022-01-12', '0.91', '0.89', '0.93', '0.94', '0.93', '0.92'),
('951', '2022-06-12', '2022-01-12', '1.31', '1.32', '1.30', '1.31', '1.31', '1.31'),
('1030', '2022-06-12', '2022-01-12', '1.26', '1.25', '1.23', '1.25', '1.21', '1.24'),
('934', '2022-06-12', '2022-01-12', '1.26', '1.26', '1.26', '1.27', '1.26', '1.26'),
('593', '2022-06-12', '2022-01-12', '2.38', '2.39', '2.40', '2.40', '2.38', '2.39'),
('883', '2022-06-12', '2022-01-12', '2.62', '2.64', '2.62', '2.64', '2.63', '2.63'),
('648', '2022-06-12', '2022-01-12', '4.25', '4.13', '4.22', '4.08', '4.09', '4.15'),
('662', '2022-06-12', '2022-01-12', '3.98', '3.86', '3.90', '3.91', '3.91', '3.91'),
('268', '2022-06-12', '2022-01-12', '3.66', '3.67', '3.67', '3.68', '3.68', '3.67'),
('757', '2022-06-12', '2022-01-12', '2.10', '2.09', '2.09', '2.12', '2.13', '2.11'),
('19', '2022-06-12', '2022-01-12', '2.61', '2.61', '2.56', '2.61', '2.58', '2.59'),
('906', '2022-06-12', '2022-01-12', '0.40', '0.41', '0.43', '0.39', '0.39', '0.40'),
('1072', '2022-06-12', '2022-01-12', '0.41', '0.43', '0.44', '0.40', '0.40', '0.42'),
('1128', '2022-06-12', '2022-01-12', '0.57', '0.57', '0.57', '0.57', '0.57', '0.57'),
('483', '2022-06-12', '2022-01-12', '0.68', '0.68', '0.68', '0.68', '0.68', '0.68'),
('1328', '2022-06-12', '2022-01-12', '0.92', '0.93', '0.94', '0.93', '0.93', '0.93');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) NOT NULL,
  `subcategory_id` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_subcategory_id_foreign` (`subcategory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1353 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `products`
--

INSERT INTO `products` (`product_id`, `name`, `category_id`, `subcategory_id`) VALUES
(689, 'Κουρτάκη Ρετσίνα 500ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '3d01f4ce48ad422b90b50c62b1f8e7f2'),
(316, 'Μαλαματίνα Ρετσίνα 500ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '3d01f4ce48ad422b90b50c62b1f8e7f2'),
(756, 'Don Simon Kρασί Sangria Χαρτ 1λιτ', 'a8ac6be68b53443bbd93b229e2f9cd34', '3d01f4ce48ad422b90b50c62b1f8e7f2'),
(757, 'Αλλοτινό Οίνος Ερυθρ Ημιγλυκ 0,5ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '3d01f4ce48ad422b90b50c62b1f8e7f2'),
(19, 'Κρασί Της Παρέας Λευκό 1λιτ', 'a8ac6be68b53443bbd93b229e2f9cd34', '3d01f4ce48ad422b90b50c62b1f8e7f2'),
(906, 'Λακώνια Χυμός Νέκταρ Πορ/Μηλ/Βερ 250ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '4f1993ca5bd244329abf1d59746315b8'),
(1072, 'Λακώνια Φυσ Χυμός Πορτοκάλι 250ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '4f1993ca5bd244329abf1d59746315b8'),
(1128, 'Peppa Pig Φρουτοποτό Τροπ Φτούτα 250ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '4f1993ca5bd244329abf1d59746315b8'),
(1328, 'Amita Motion Φυσικός Χυμός 330ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '4f1993ca5bd244329abf1d59746315b8'),
(483, 'Ribena Φρουτοποτό Φραγκοστάφυλλο 250ml', 'a8ac6be68b53443bbd93b229e2f9cd34', '4f1993ca5bd244329abf1d59746315b8'),
(826, 'Whiskas Γατ/Φή Πουλ Σε Σάλτσα 100γρ', '662418cbd02e435280148dbb8892782a', '926262c303fe402a8542a5d5cf3ac7eb'),
(748, 'Purina Gold Gourmet Γατ/Φή Βοδ/Κοτ 85γρ', '662418cbd02e435280148dbb8892782a', '926262c303fe402a8542a5d5cf3ac7eb'),
(1222, 'Purina Gold Gourmet Γατ/Φή Μους Ψάρι 85γρ', '662418cbd02e435280148dbb8892782a', '926262c303fe402a8542a5d5cf3ac7eb'),
(869, 'Friskies Γατ/Φή Πατέ Μοσχάρι 400γρ', '662418cbd02e435280148dbb8892782a', '926262c303fe402a8542a5d5cf3ac7eb'),
(1275, 'Friskies Γατ/Φή Πατέ Κοτ/Λαχ 400γρ', '662418cbd02e435280148dbb8892782a', '926262c303fe402a8542a5d5cf3ac7eb'),
(1199, 'Pedigree Schmackos Μπισκότα Σκύλου 43γρ', '662418cbd02e435280148dbb8892782a', '0c6e42d52765495dbbd06c189a4fc80f'),
(332, 'Friskies Σκυλ/Φή Βοδ/Κοτ/Λαχ 400γρ', '662418cbd02e435280148dbb8892782a', '0c6e42d52765495dbbd06c189a4fc80f'),
(673, 'Cesar Clasicos Σκυλ/Φή Μοσχ 150γρ', '662418cbd02e435280148dbb8892782a', '0c6e42d52765495dbbd06c189a4fc80f'),
(184, 'Pedigree Υγ Σκυλ/Φή 3 Ποικ Πουλερικών 400γρ', '662418cbd02e435280148dbb8892782a', '0c6e42d52765495dbbd06c189a4fc80f'),
(1229, 'Pedigree Rodeo Σκυλ/Φή Μοσχ 70γρ', '662418cbd02e435280148dbb8892782a', '0c6e42d52765495dbbd06c189a4fc80f'),
(639, 'Scotch Brite Σύρμα Πράσινο Κουζίνας', 'd41744460283406a86f8e4bd5010a66d', 'b5d54a3d8dd045fb88d5c31ea794dcc5'),
(251, 'Scotch Brite Σφουγγ Κουζ Γίγας Αντιβ', 'd41744460283406a86f8e4bd5010a66d', 'b5d54a3d8dd045fb88d5c31ea794dcc5'),
(388, 'Sanitas Σακ Απορ Ultra 52Χ75cm 10τεμ', 'd41744460283406a86f8e4bd5010a66d', 'b5d54a3d8dd045fb88d5c31ea794dcc5'),
(394, 'Sanitas Παγοκυψέλες 2 Σε 1', 'd41744460283406a86f8e4bd5010a66d', 'b5d54a3d8dd045fb88d5c31ea794dcc5'),
(1166, 'Vanish Pink Πολυκαθαριστικό Λεκέδων 30γρ', 'd41744460283406a86f8e4bd5010a66d', '3be81b50494d4b5495d5fea3081759a6'),
(558, 'Εύρηκα Λευκαντικό 60γρ', 'd41744460283406a86f8e4bd5010a66d', '3be81b50494d4b5495d5fea3081759a6'),
(517, 'Scotch Brite Σφουγγαράκι Πράσ Κλασ 1τεμ', 'd41744460283406a86f8e4bd5010a66d', '3be81b50494d4b5495d5fea3081759a6'),
(168, 'Tuboflo Αποφρακτικό Σκόνη Φάκελ 100g', 'd41744460283406a86f8e4bd5010a66d', '3be81b50494d4b5495d5fea3081759a6'),
(936, 'Ajax Τζαμιών 450ml', 'd41744460283406a86f8e4bd5010a66d', '3be81b50494d4b5495d5fea3081759a6'),
(1015, 'Danone Activia Επιδ Τραγαν Απολ Δημ 200γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', '0364b4be226146699140e81a469d04a1'),
(725, 'Μεβγάλ Παραδοσιακό Γιαούρτι Αγελαδ 220γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', '0364b4be226146699140e81a469d04a1'),
(951, 'Μεβγάλ Παραδ Γιαούρτι Αιγοπρ Ελαφ 2Χ220γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', '0364b4be226146699140e81a469d04a1'),
(1030, 'Μεβγάλ Παραδοσιακό Γιαούρτι Προβ 220γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', '0364b4be226146699140e81a469d04a1'),
(934, 'Φάγε Total Γιαούρτι 5% 200γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', '0364b4be226146699140e81a469d04a1'),
(593, 'Παυλίδης Μερέντα 360γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', 'e397ddcfb34a4640a42b8fa5e999b8c8'),
(883, 'Ζωγράφος Μαρμελ Φράουλ Φρουκτ 415γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', 'e397ddcfb34a4640a42b8fa5e999b8c8'),
(648, 'Μακεδονικό Ταχίνι Σε Βάζο 300γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', 'e397ddcfb34a4640a42b8fa5e999b8c8'),
(662, 'Αττική Μέλι 250γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', 'e397ddcfb34a4640a42b8fa5e999b8c8'),
(268, 'Παυλίδης Μέρεντα Με Φουντούκι 570γρ', 'ee0022e7b1b34eb2b834ea334cda52e7', 'e397ddcfb34a4640a42b8fa5e999b8c8');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `score_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `points` bigint(20) NOT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `score`
--

INSERT INTO `score` (`score_id`, `user_id`, `date`, `points`) VALUES
(109, 1, '2023-09-22 19:20:42', 50),
(110, 1, '2023-09-22 19:21:26', 5),
(111, 1, '2023-09-22 19:21:30', -1),
(112, 1, '2023-09-26 14:02:15', 0),
(113, 1, '2023-09-26 14:02:31', 5),
(114, 1, '2023-09-26 14:02:41', -1),
(115, 1, '2023-09-26 14:04:13', 5),
(116, 1, '2023-09-26 14:04:14', -1),
(117, 1, '2023-09-26 15:49:36', 5),
(118, 9, '2023-09-26 15:50:16', 0),
(119, 9, '2023-09-26 17:00:17', 5),
(120, 9, '2023-09-26 17:00:50', 5),
(121, 9, '2023-09-26 17:01:23', 5),
(122, 1, '2023-09-26 17:05:17', 0),
(123, 1, '2023-10-02 10:24:04', 5),
(124, 1, '2023-10-02 15:04:17', 0),
(125, 1, '2023-10-02 15:04:22', 5),
(126, 1, '2023-10-02 15:34:30', 0),
(127, 1, '2023-10-02 15:36:13', 0),
(128, 13, '2023-10-04 11:19:50', 0),
(129, 1, '2023-10-04 11:21:49', -1),
(130, 13, '2023-10-04 11:27:31', 50),
(131, 1, '2023-10-04 11:28:23', 5);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `store_id` varchar(255) NOT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `store_latitude` float NOT NULL,
  `store_longitude` float NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `store_latitude`, `store_longitude`) VALUES
('1643373636', 'Σκλαβενίτης', 38.3013, 21.7815),
('1643373639', NULL, 38.2949, 21.7904),
('1643713403', NULL, 38.2852, 21.7667),
('1643713405', NULL, 38.2911, 21.7715),
('1643713406', NULL, 38.2913, 21.7666),
('1643818244', NULL, 38.2779, 21.7625),
('1643818267', NULL, 38.2752, 21.7574),
('1643818277', NULL, 38.2757, 21.7629),
('1643818281', 'Σκλαβενίτης', 38.2596, 21.749),
('1643825320', NULL, 38.2945, 21.7883),
('1643889596', NULL, 38.2126, 21.7569),
('1657132006', 'Ρουμελιώτης SUPER Market', 38.2614, 21.7436),
('1657132008', 'Σκλαβενίτης', 38.2585, 21.7416),
('1657962066', NULL, 38.2991, 21.7855),
('1695934267', NULL, 38.2915, 21.7713),
('1763830009', 'My market', 38.2324, 21.7473),
('1763830474', 'ΑΒ Βασιλόπουλος', 38.2322, 21.7257),
('1770994538', 'Markoulas', 38.2645, 21.7604),
('1771512424', NULL, 38.2658, 21.7593),
('1815896581', 'Lidl', 38.3068, 21.8051),
('1971240515', 'Ανδρικόπουλος', 38.24, 21.7364),
('1971240518', NULL, 38.2377, 21.7399),
('1971247760', 'Σκλαβενίτης', 38.2365, 21.7373),
('1971249846', 'My Market', 38.2427, 21.7342),
('1997401665', NULL, 38.2804, 21.7689),
('1997401682', NULL, 38.2767, 21.7646),
('3144355008', 'My market', 38.2569, 21.7397),
('3354481184', 'Ανδρικόπουλος', 38.1952, 21.7323),
('354449389', 'Lidl', 38.208, 21.7127),
('360217468', 'The Mart', 38.2893, 21.7807),
('360226900', 'Lidl', 38.2634, 21.7434),
('364381224', 'Σουπερμάρκετ Ανδρικόπουλος', 38.2952, 21.7908),
('364463568', 'Σκλαβενίτης', 38.2104, 21.7642),
('4101518891', 'ΑΒ ΒΑΣΙΛΟΠΟΥΛΟΣ', 38.2566, 21.7418),
('4356067891', NULL, 38.245, 21.7365),
('4356183595', 'Σκλαβενίτης', 38.2435, 21.7333),
('4357098895', NULL, 38.2438, 21.734),
('4357217589', NULL, 38.2524, 21.7414),
('4357425491', NULL, 38.2513, 21.7424),
('4357589496', 'Ανδρικόπουλος', 38.2428, 21.7303),
('4358244594', NULL, 38.2454, 21.7337),
('4372108797', 'Mini Market', 38.2726, 21.8365),
('4484528391', 'Carna', 38.2795, 21.7667),
('4752810729', 'Mini Market', 38.3052, 21.777),
('4931300543', 'Kronos', 38.2426, 21.7296),
('4953268497', 'Φίλιππας', 38.2586, 21.7505),
('4969309651', NULL, 38.3015, 21.7941),
('5005384516', 'No supermarket', 38.2498, 21.7363),
('5005409493', 'Kiosk', 38.2491, 21.7351),
('5005409494', 'Kiosk', 38.2493, 21.7349),
('5005409495', 'Kiosk', 38.249, 21.7344),
('5005476710', 'Kiosk', 38.257, 21.7413),
('5005476711', 'Kiosk', 38.2561, 21.741),
('5132918123', NULL, 38.2524, 21.7401),
('5164678230', 'Ανδρικόπουλος - Supermarket', 38.2692, 21.7481),
('5164741179', 'Σκλαβενίτης', 38.2691, 21.7497),
('5350727524', NULL, 38.2338, 21.7252),
('5396345464', 'Mini Market', 38.3277, 21.8764),
('5620198221', 'ΑΒ Βασιλόπουλος', 38.2171, 21.7358),
('5620208927', 'Mini Market', 38.216, 21.7321),
('5783486253', NULL, 38.3127, 21.8203),
('5909978406', NULL, 38.2452, 21.7312),
('598279836', 'Papakos', 38.2355, 21.7623),
('633369803', NULL, 38.2613, 21.754),
('7673935764', '3A', 38.2505, 21.7397),
('7673976786', 'Spar', 38.2486, 21.739),
('7673986831', 'ΑΝΔΡΙΚΟΠΟΥΛΟΣ', 38.2482, 21.7383),
('7674120315', 'ΑΝΔΡΙΚΟΠΟΥΛΟΣ', 38.2429, 21.7308),
('7677225097', 'MyMarket', 38.2393, 21.7265),
('7914886761', NULL, 38.2653, 21.7575),
('8214753473', 'Ena Cash And Carry', 38.2347, 21.7253),
('8214854586', 'ΚΡΟΝΟΣ - (Σκαγιοπουλείου)', 38.2358, 21.7295),
('8214887295', 'Ανδρικόπουλος Super Market', 38.2379, 21.7306),
('8214887306', '3Α Αράπης', 38.2375, 21.7329),
('8214910532', 'Γαλαξίας', 38.2361, 21.7338),
('8215010716', 'Super Market Θεοδωρόπουλος', 38.236, 21.7283),
('8215157448', 'Super Market ΚΡΟΝΟΣ', 38.239, 21.7341),
('8753329904', NULL, 38.2642, 21.7397),
('8753329905', NULL, 38.2658, 21.7399),
('8777081651', 'Σκλαβενίτης', 38.2602, 21.7429),
('8777171555', '3A ARAPIS', 38.2586, 21.746),
('8805335004', 'Μασούτης', 38.2455, 21.7355),
('8805467220', 'ΑΒ Shop & Go', 38.2496, 21.738),
('8806495733', '3Α ΑΡΑΠΗΣ', 38.2399, 21.7456),
('9651304117', 'Περίπτερο', 38.2554, 21.7409),
('9785182275', NULL, 38.1494, 21.6232),
('9785182280', NULL, 38.1477, 21.6206),
('9785335420', NULL, 38.1563, 21.6455),
('980515550', 'Lidl', 38.2313, 21.7401);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `subcategory_id` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `subcategory_category_id_foreign` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `subcategory`
--

INSERT INTO `subcategory` (`subcategory_id`, `name`, `category_id`) VALUES
('034941f08ca34f7baaf5932427d7e635', 'Χαρτικά', 'd41744460283406a86f8e4bd5010a66d'),
('0364b4be226146699140e81a469d04a1', 'Γιαούρτια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('08f280dee57c4b679be0102a8ba1343b', 'Ποτά', 'a8ac6be68b53443bbd93b229e2f9cd34'),
('0936072fcb3947f3baf83e31bb5c1cab', 'Φρέσκα/Αρνί', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('09f2e090f72c4487bc44e5ba4fcea466', 'Βαφές μαλλιών', '8e8117f7d9d64cf1a931a351eb15bd69'),
('0bf072374a8e4c40b915e4972990a417', 'Πάνες ενηλίκων', '8e8117f7d9d64cf1a931a351eb15bd69'),
('0c347b96540a427e9823f321861ce58e', 'Ζυμαρικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('0c6e42d52765495dbbd06c189a4fc80f', 'Pet shop/Τροφή σκύλου', '662418cbd02e435280148dbb8892782a'),
('0e1982336d8e4bdc867f1620a2bce3be', 'Φούρνος/Τσουρέκια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('181add033f2d4d95b46844abf619dd30', 'Στοματικά διαλύματα', '8e8117f7d9d64cf1a931a351eb15bd69'),
('19c54e78d74d4b64afbb1fd124f01dfc', 'Σνάκς/Κρουασάν', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('1b59d5b58fb04816b8f6a74a4866580a', 'Επίδεσμοι', '8e8117f7d9d64cf1a931a351eb15bd69'),
('1e9187fb112749ff888b11fd64d79680', 'Λάδι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('1eb56e6ffa2a449296fb1acc7b714cc5', 'Κατεψυγμένα/Πίτες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('1eef696c0f874603a59aed909e1b4ce2', 'Έτοιμα γεύματα/Σούπες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('21051788a9ff4d5d9869d526182b9a5f', 'Αποσμητικά Χώρου', 'd41744460283406a86f8e4bd5010a66d'),
('26e416b6efa745218f810c34678734b2', 'Στοματική υγιεινή', '8e8117f7d9d64cf1a931a351eb15bd69'),
('2ad2e93c1c0c41b4b9769fe06c149393', 'Μπαχαρικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('2bce84e7df694ab1b81486aa2baf555d', 'Σερβιέτες', '8e8117f7d9d64cf1a931a351eb15bd69'),
('2d711ee19d17429fa7f964d56fe611db', 'Ροφήματα', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('2df01835007545a880dc43f69b5cae07', 'Ξυριστικά - Αποτριχωτικά', '8e8117f7d9d64cf1a931a351eb15bd69'),
('3010aca5cbdc401e8dfe1d39320a8d1a', 'Αναψυκτικά - Ενεργειακά Ποτά', 'a8ac6be68b53443bbd93b229e2f9cd34'),
('329bdd842f9f41688a0aa017b74ffde4', 'Μπύρες', 'a8ac6be68b53443bbd93b229e2f9cd34'),
('35410eeb676b4262b651997da9f42777', 'Αποσμητικά', '8e8117f7d9d64cf1a931a351eb15bd69'),
('35cce434592f489a9ed37596951992b3', 'Σνάκς/Μπισκότα', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('3935d6afbf50454595f1f2b99285ce8c', 'Κύβοι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('3be81b50494d4b5495d5fea3081759a6', 'Είδη γενικού καθαρισμού', 'd41744460283406a86f8e4bd5010a66d'),
('3d01f4ce48ad422b90b50c62b1f8e7f2', 'Κρασιά', 'a8ac6be68b53443bbd93b229e2f9cd34'),
('3d0c29b055f8417eb1c679fbfdc37da0', 'Σαμπουάν - Αφρόλουτρα', '8016e637b54241f8ad242ed1699bf2da'),
('3d22916b908b40b385bebe4b478cf107', 'Φρέσκα/Ψάρι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('3f38edda7854447a837956d64a2530fa', 'Κατεψυγμένα/Πίτσες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('463e30b829274933ab7eb8e4b349e2c5', 'Τυποποιημένα κρεατικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('46b02b6b4f4c4d5d8a0efe21d0981027', 'Σαμπουάν - Αφρόλουτρα', '8e8117f7d9d64cf1a931a351eb15bd69'),
('4c73d0eccd1e4dde8bb882e436a64ebb', 'Τυριά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('4e4cf5616e0f43aaa985c1300dc7109e', 'Κρέμες γάλακτος', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('4f1993ca5bd244329abf1d59746315b8', 'Χυμοί', 'a8ac6be68b53443bbd93b229e2f9cd34'),
('4f205aaec31746b89f40f4d5d845b13e', 'Έτοιμα γεύματα/Σαλάτες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('509b949f61cc44f58c2f25093f7fc3eb', 'Επιδόρπια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('50e8a35122854b2b9cf0e97356072f94', 'Όσπρια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('5935ab588fa444f0a71cc424ad651d12', 'Προϊόντα μαλλιών', '8e8117f7d9d64cf1a931a351eb15bd69'),
('5a2a0575959c40d6a46614ab99b2d9af', 'Περιποίηση προσώπου', '8e8117f7d9d64cf1a931a351eb15bd69'),
('5aba290bf919489da5810c6122f0bc9b', 'Πελτές τομάτας', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('5c5e625b739b4f19a117198efae8df21', 'Κατεψυγμένα/Πατάτες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('5d0be05c3b414311bcda335b036202f1', 'Ρύζι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('5dca69b976c94eccbf1341ee4ee68b95', 'Ξύδι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('6d084e8eab4945cdb4563d7ff49f0dc3', 'Κατεψυγμένα/Λαχανικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('6d2babbc7355444ca0d27633207e4743', 'Αυγά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('6db091264f494c86b9cf22a562593c82', 'Οδοντόβουρτσες', '8e8117f7d9d64cf1a931a351eb15bd69'),
('724700777199431e9d42861b2ed63cd5', 'Γιαούρτια', '8016e637b54241f8ad242ed1699bf2da'),
('79728a412a1749ac8315501eb77550f9', 'Μάσκες Προσώπου', '2d5f74de114747fd824ca8a6a9d687fa'),
('7ca5dc60dd00483897249e0f8516ee91', 'Κατεψυγμένα/Ψάρια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('7cfab59a5d9c4f0d855712290fc20c7f', 'Προφυλακτικά', '8e8117f7d9d64cf1a931a351eb15bd69'),
('7cfe21f0f1944b379f0fead1c8702099', 'Καραμέλες - Τσίχλες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('7e86994327f64e3ca967c09b5803966a', 'Βρεφικές τροφές', '8016e637b54241f8ad242ed1699bf2da'),
('8851b315e2f0486180be07facbc3b21f', 'Σνάκς/Ποπ κορν', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('8ef82da99b284c69884cc7f3479df1ac', 'Φρέσκα/Κοτόπουλο', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('8f1b83b1ab3e4ad1a62df8170d1a0a25', 'Αντισηπτικά', 'e4b4de2e31fc43b7b68a0fe4fbfad2e6'),
('8f98818a7a55419fb42ef1d673f0bb64', 'Εντομoκτόνα - Εντομοαπωθητικά', 'd41744460283406a86f8e4bd5010a66d'),
('916a76ac76b3462baf2db6dc508b296b', 'Δημητριακά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('926262c303fe402a8542a5d5cf3ac7eb', 'Pet shop/Τροφή γάτας', '662418cbd02e435280148dbb8892782a'),
('92680b33561c4a7e94b7e7a96b5bb153', 'Μωρομάντηλα', '8016e637b54241f8ad242ed1699bf2da'),
('991276688c8c4a91b5524b1115122ec1', 'Απορρυπαντικά', '8016e637b54241f8ad242ed1699bf2da'),
('9b7795175cbc4a6d9ca37b8ee9bf5815', 'Κατεψυγμένα/Κρεατικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('9bc82778d6b44152b303698e8f72c429', 'Φρέσκα/Λαχανικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('9c86a88f56064f8588d42eee167d1f8a', 'Κρεμοσάπουνα - Σαπούνι', '8e8117f7d9d64cf1a931a351eb15bd69'),
('a02951b1c083449b9e7fab2fabd67198', 'Χυμός τομάτας', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('a1a1c2c477b74504b58ad847f7e0c8e1', 'Είδη Ζαχαροπλαστικής', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('a240e48245964b02ba73d1a86a2739be', 'Βούτυρο - Μαργαρίνη', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('a483dd538ecd4ce0bdbba36e99ab5eb1', 'Φούρνος/Φρυγανίες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('a610ce2a98a94ee788ee5f94b4be82c2', 'Λοιπά προϊόντα', '8e8117f7d9d64cf1a931a351eb15bd69'),
('a73f11a7f08b41c081ef287009387579', 'Φρέσκα/Χοιρινό', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('a885d8cd1057442c9092af37e79bf7a7', 'Ζάχαρη - Υποκατάστατα ζάχαρης', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('af538008f3ab40989d67f971e407a85c', 'Βαμβάκια', '8e8117f7d9d64cf1a931a351eb15bd69'),
('b1866f1365a54e2d84c28ad2ca7ab5af', 'Ειδική διατροφή', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('b3992eb422c2495ca02dd19de9d16ad1', 'Γάλα', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('b5d54a3d8dd045fb88d5c31ea794dcc5', 'Είδη κουζίνας - Μπάνιου', 'd41744460283406a86f8e4bd5010a66d'),
('b89cb8dd198748dd8c4e195e4ab2168e', 'Καφέδες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('bc4d21162fbd4663b0e60aa9bd65115e', 'Εμφιαλωμένα νερά', 'a8ac6be68b53443bbd93b229e2f9cd34'),
('bc66b1d812374aa48d6878730497ede7', 'Παγωτά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('bcebd8cc2f554017864dbf1ce0069ac5', 'Φούρνος/Παξιμάδια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('be04eae3ca484928a86984d73bf3cc3a', 'Αλλαντικά', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('c2ce05f4653c4f4fa8f39892bbb98960', 'Φρέσκα/Μοσχάρι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('c44b50bef9674aaeb06b578122bf4445', 'Κρέμα Σώματος', '8e8117f7d9d64cf1a931a351eb15bd69'),
('c487e038079e407fb1a356599c2aec3e', 'Φρέσκα/Αφρόψαρο', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('c761cd8b18a246eb81fb21858ac10093', 'Αλεύρι - Σιμιγδάλι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('c928573dd7bc4b7894d450eadd7f5d18', 'Φούρνος/Ψωμί', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('ce4802b6c9f44776a6e572b3daf93ab1', 'Σάλτσες - Dressings', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('cf079c66251342b690040650104e160f', 'Κρέμες μαλλιών', '8e8117f7d9d64cf1a931a351eb15bd69'),
('d1315c04b3d64aed93472e41d6e5a6f8', 'Κατεψυγμένα/Φύλλα - Βάσεις', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('d3385ff161f0423aa364017d4413fa77', 'Φρέσκα/Κατσίκι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('dca17e0bfb4e469c93c011f8dc8ab512', 'Γλυκά/Σοκολάτες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('ddb733df68324cfc8469c890b32e716d', 'Περιποιήση σώματος', '8016e637b54241f8ad242ed1699bf2da'),
('de77af9321844b1f863803f338f4a0c2', 'Κρέμα ημέρας', '8e8117f7d9d64cf1a931a351eb15bd69'),
('df10062ca2a04789bd43d18217008b5f', 'Κονσέρβες', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('df433029824c4b4194b6637db26f69eb', 'Σνάκς/Μπάρες - Ράβδοι', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('e0efaa1776714351a4c17a3a9d412602', 'Πάνες', '8016e637b54241f8ad242ed1699bf2da'),
('e2f81e96f70e45fb9552452e381529d3', 'Αντρική περιποίηση', '8e8117f7d9d64cf1a931a351eb15bd69'),
('e397ddcfb34a4640a42b8fa5e999b8c8', 'Γλυκά αλλείματα', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('e60aca31a37a40db8a83ccf93bd116b1', 'Απορρυπαντικά', 'd41744460283406a86f8e4bd5010a66d'),
('e63b2caa8dd84e6ea687168200859baa', 'Γλυκά/Κέικ', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('ea47b5f0016f4f0eb79e3a4b932f7577', 'Σνάκς/Αρτοσκευάσματα', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('ea47cc6b2f6743169188da125e1f3761', 'Φρέσκα/Φρούτα', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('ec9d10b5d68c4d8b8998d51bf6d67188', 'Σνάκς/Πατατάκια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('f4d8a256e3944c05a3e7b8904b863882', 'Υγρομάντηλα', '8e8117f7d9d64cf1a931a351eb15bd69'),
('f6007309d91c4410adf000ffd5e8129e', 'Πουρές', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('f87bed0b4b8e44c3b532f2c03197aff9', 'Σνάκς/Γαριδάκια', 'ee0022e7b1b34eb2b834ea334cda52e7'),
('fc71b59318b5410d8ed9da8b42904d77', 'Γάλα', '8016e637b54241f8ad242ed1699bf2da'),
('fefa136c714945a3b6bcdcb4ee9e8921', 'Κρέμες ενυδάτωσης', '8e8117f7d9d64cf1a931a351eb15bd69');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `user_id` int(11) NOT NULL,
  `total_tokens` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `tokens`
--

INSERT INTO `tokens` (`user_id`, `total_tokens`) VALUES
(11, 840),
(1, 71920),
(4, 840),
(5, 840),
(6, 840),
(7, 840),
(8, 840),
(9, 840),
(10, 840),
(12, 820),
(13, 13580);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `total_sum_of_score`
--

DROP TABLE IF EXISTS `total_sum_of_score`;
CREATE TABLE IF NOT EXISTS `total_sum_of_score` (
  `user_id` int(11) NOT NULL,
  `total_sum_of_points` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `total_sum_of_score`
--

INSERT INTO `total_sum_of_score` (`user_id`, `total_sum_of_points`) VALUES
(1, 49920),
(5, 2560),
(6, 2560),
(7, 3840);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `total_sum_of_tokens`
--

DROP TABLE IF EXISTS `total_sum_of_tokens`;
CREATE TABLE IF NOT EXISTS `total_sum_of_tokens` (
  `user_id` int(11) NOT NULL,
  `sum_of_tokens` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `total_sum_of_tokens`
--

INSERT INTO `total_sum_of_tokens` (`user_id`, `sum_of_tokens`) VALUES
(1, 151040),
(5, 151040),
(6, 151040),
(7, 151040),
(4, 12800),
(8, 12800),
(9, 12800),
(10, 12800),
(11, 12800);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`) VALUES
(1, 'argiriskanellos@gmail.com', 'argkan13', 'Ak1999!\"'),
(4, 'admin@gmail.com', 'admin', 'Ak1999!\"'),
(5, 'argiriskanellos1@gmail.com', 'a.kanellos', 'Ak1999!\"'),
(6, 'xara@gmail.com', 'xarakan13', 'Ak1999!\"'),
(7, 'argiriskanellos2@gmail.com', 'SPYROS', 'Ak1999!\"'),
(8, 'argiriskanellos3@gmail.com', 'MARIA', 'Ak1999!\"\r\n'),
(12, 'argiriskanellos1024@gmail.com', 'argiriskanellos', 'Ak1999!\"'),
(9, 'argiriskanellos112@gmail.com', 'SPYROS123', 'aK1999!\"'),
(10, 'argiriskanellos12345677@gmail.com', 'SPYROS3456', 'Ak1999!\"'),
(11, 'argiriskanellos12221@gmail.com', 'SPYROSasd', 'Ak1999!\"'),
(13, 'argiriskanellos9999@gmail.com', 'test1', 'Ak1999!\"');

DELIMITER $$
--
-- Συμβάντα
--
DROP EVENT `Insert_Into_Monthly_Score`$$
CREATE DEFINER=`root`@`localhost` EVENT `Insert_Into_Monthly_Score` ON SCHEDULE EVERY 1 SECOND STARTS '2023-09-15 22:09:50' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  -- Create or update the monthly_score table based on the score table
  INSERT INTO `monthly_score` (`user_id`, `points`)
  SELECT `user_id`, SUM(`points`)
  FROM `score`
  WHERE DATE_FORMAT(`date`, '%Y-%m') = DATE_FORMAT(NOW(), '%Y-%m')
  GROUP BY `user_id`
  ON DUPLICATE KEY UPDATE `points` = VALUES(`points`);
END$$

DROP EVENT `Clear_Score_Table`$$
CREATE DEFINER=`root`@`localhost` EVENT `Clear_Score_Table` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-09-15 22:27:09' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  -- Delete all records from the score table
  DELETE FROM `score`;
END$$

DROP EVENT `Clear_Monthly_Score_Table`$$
CREATE DEFINER=`root`@`localhost` EVENT `Clear_Monthly_Score_Table` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-09-15 22:34:33' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  -- Delete all records from the monthly_score table
  DELETE FROM `monthly_score`;
END$$

DROP EVENT `Update_Monthly_Score_Tokens_Event`$$
CREATE DEFINER=`root`@`localhost` EVENT `Update_Monthly_Score_Tokens_Event` ON SCHEDULE EVERY 1 SECOND STARTS '2023-09-20 13:01:34' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  DECLARE total_users_to_monthly_score INT;
  DECLARE total_users INT;
  DECLARE total_tokens_to_give INT;

  -- Calculate the total number of users in monthly_score
  SELECT COUNT(*) INTO total_users FROM users;
  
  SELECT COUNT(*) INTO total_users_to_monthly_score FROM monthly_score;

  -- Calculate the total tokens to give
  SET total_tokens_to_give = total_users * 80;

  -- Update the tokens table for monthly_score users
  INSERT INTO tokens (user_id, total_tokens)
  SELECT m.user_id, (total_tokens_to_give / total_users_to_monthly_score)
  FROM monthly_score m
  ON DUPLICATE KEY UPDATE
    total_tokens = total_tokens + (total_tokens_to_give / total_users_to_monthly_score);
    
END$$

DROP EVENT `Insert_Into_Total_Sum_Of_Tokens_Event`$$
CREATE DEFINER=`root`@`localhost` EVENT `Insert_Into_Total_Sum_Of_Tokens_Event` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-09-20 13:38:23' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  -- Insert data into total_sum_of_tokens from the tokens table
  INSERT INTO total_sum_of_tokens (user_id, sum_of_tokens)
  SELECT user_id, total_tokens
  FROM tokens
  ON DUPLICATE KEY UPDATE
    sum_of_tokens = sum_of_tokens + sum_of_tokens;
END$$

DROP EVENT `Clear_Expired_Discounts`$$
CREATE DEFINER=`root`@`localhost` EVENT `Clear_Expired_Discounts` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-10-02 17:22:07' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
    DELETE FROM discount
    WHERE DATEDIFF(NOW(), 'date_entered') > 7;
END$$

DROP EVENT `Update_All_Users_Tokens_Event`$$
CREATE DEFINER=`root`@`localhost` EVENT `Update_All_Users_Tokens_Event` ON SCHEDULE EVERY 1 SECOND STARTS '2023-09-20 13:01:26' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  DECLARE total_users INT;
  DECLARE total_tokens_to_give_all INT;

  -- Calculate the total number of users in the users table
  SELECT COUNT(*) INTO total_users FROM users;

  -- Calculate the total tokens to give for all users
  SET total_tokens_to_give_all = total_users * 20;

  -- Update the tokens table for all users
  INSERT INTO tokens (user_id, total_tokens)
  SELECT u.id, (total_tokens_to_give_all / total_users)
  FROM users u
  ON DUPLICATE KEY UPDATE
    total_tokens = total_tokens + (total_tokens_to_give_all / total_users);
END$$

DROP EVENT `Insert_Into_Total_Sum_Of_Score_Event`$$
CREATE DEFINER=`root`@`localhost` EVENT `Insert_Into_Total_Sum_Of_Score_Event` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-09-20 13:48:11' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
 
  INSERT INTO total_sum_of_score (user_id, total_sum_of_points)
  SELECT user_id, points
  FROM monthly_score
  ON DUPLICATE KEY UPDATE
    total_sum_of_points = total_sum_of_points + total_sum_of_points;
END$$

DROP EVENT `Clear_Tokens_Table`$$
CREATE DEFINER=`root`@`localhost` EVENT `Clear_Tokens_Table` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-09-20 14:11:28' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
  TRUNCATE TABLE tokens;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
