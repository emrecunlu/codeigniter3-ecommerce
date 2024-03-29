-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 Oca 2022, 11:33:47
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `my_shop`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_monthlyOrder` ()  BEGIN
	SET lc_time_names = 'tr_TR';
	SELECT SUM(orders.quantity) as "qty", SUM(orders.total_price) as "subtotal", MONTHNAME(orders.purchase_date) as "month" FROM orders WHERE orders.is_completed = 1 GROUP BY month ORDER BY month ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_monthlySales` ()  BEGIN
SELECT SUM(orders.quantity) as "qty", SUM(orders.total_price) as "subtotal" FROM orders WHERE orders.purchase_date >= NOW() - INTERVAL 1 month AND orders.is_completed = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_weeklySales` ()  BEGIN
SELECT SUM(orders.quantity) as "qty", SUM(orders.total_price) as "subtotal" FROM orders WHERE orders.purchase_date >= NOW() - INTERVAL 1 week AND orders.is_completed = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'unl.c.emre@gmail.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_url` varchar(524) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_url`) VALUES
(10, 'Telefon', 'telefon'),
(11, 'Bilgisayar', 'bilgisayar'),
(12, 'Tv, Ev Elektroniği', 'tv-ev-elektronigi'),
(13, 'Bilgisayar Parçaları', 'bilgisayar-parcalari'),
(14, 'Foto, Kamera', 'foto-kamera'),
(15, 'Ofis, Kırtasiye', 'ofis-kirtasiye'),
(16, 'Aksesuar', 'aksesuar'),
(17, 'Oyun, Hobi', 'oyun-hobi'),
(18, 'Ev, Mutfak', 'ev-mutfak'),
(19, 'Kişisel Bakım', 'kisisel-bakim'),
(20, 'Spor, Outdoor', 'spor-outdoor');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cities`
--

CREATE TABLE `cities` (
  `sehir_id` int(2) NOT NULL,
  `sehir_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sehir_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cities`
--

INSERT INTO `cities` (`sehir_id`, `sehir_title`, `sehir_key`) VALUES
(1, 'İSTANBUL', 34),
(2, 'ANKARA', 6),
(3, 'İZMİR', 35),
(4, 'BURSA', 16),
(5, 'ADANA', 1),
(6, 'ADIYAMAN', 2),
(7, 'AFYONKARAHİSAR', 3),
(8, 'AĞRI', 4),
(9, 'AKSARAY', 68),
(10, 'AMASYA', 5),
(11, 'ANTALYA', 7),
(12, 'ARDAHAN', 75),
(13, 'ARTVİN', 8),
(14, 'AYDIN', 9),
(15, 'BALIKESİR', 10),
(16, 'BARTIN', 74),
(17, 'BATMAN', 72),
(18, 'BAYBURT', 69),
(19, 'BİLECİK', 11),
(20, 'BİNGÖL', 12),
(21, 'BİTLİS', 13),
(22, 'BOLU', 14),
(23, 'BURDUR', 15),
(24, 'ÇANAKKALE', 17),
(25, 'ÇANKIRI', 18),
(26, 'ÇORUM', 19),
(27, 'DENİZLİ', 20),
(28, 'DİYARBAKIR', 21),
(29, 'KOCAELİ', 41),
(30, 'KONYA', 42),
(31, 'KÜTAHYA', 43),
(32, 'MALATYA', 44),
(33, 'MANİSA', 45),
(34, 'MARDİN', 47),
(35, 'MERSİN', 33),
(36, 'MUĞLA', 48),
(37, 'MUŞ', 49),
(38, 'NEVŞEHİR', 50),
(39, 'NİĞDE', 51),
(40, 'ORDU', 52),
(41, 'OSMANİYE', 80),
(42, 'RİZE', 53),
(43, 'SAKARYA', 54),
(44, 'SAMSUN', 55),
(45, 'SİİRT', 56),
(46, 'SİNOP', 57),
(47, 'ŞIRNAK', 73),
(48, 'SİVAS', 58),
(49, 'TEKİRDAĞ', 59),
(50, 'TOKAT', 60),
(51, 'TRABZON', 61),
(52, 'TUNCELİ', 62),
(53, 'ŞANLIURFA', 63),
(54, 'UŞAK', 64),
(55, 'VAN', 65),
(56, 'YALOVA', 77),
(57, 'YOZGAT', 66),
(58, 'ZONGULDAK', 67),
(59, 'DÜZCE', 81),
(60, 'EDİRNE', 22),
(61, 'ELAZIĞ', 23),
(62, 'ERZİNCAN', 24),
(63, 'ERZURUM', 25),
(64, 'ESKİŞEHİR', 26),
(65, 'GAZİANTEP', 27),
(66, 'GİRESUN', 28),
(67, 'GÜMÜŞHANE', 29),
(68, 'HAKKARİ', 30),
(69, 'HATAY', 31),
(70, 'IĞDIR', 76),
(71, 'ISPARTA', 32),
(72, 'KAHRAMANMARAŞ', 46),
(73, 'KARABÜK', 78),
(74, 'KARAMAN', 70),
(75, 'KARS', 36),
(76, 'KASTAMONU', 37),
(77, 'KAYSERİ', 38),
(78, 'KİLİS', 79),
(79, 'KIRIKKALE', 71),
(80, 'KIRKLARELİ', 39),
(81, 'KIRŞEHİR', 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `counties`
--

CREATE TABLE `counties` (
  `ilce_id` int(11) NOT NULL,
  `ilce_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ilce_key` int(11) NOT NULL,
  `ilce_sehirkey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `counties`
--

INSERT INTO `counties` (`ilce_id`, `ilce_title`, `ilce_key`, `ilce_sehirkey`) VALUES
(1, 'ADALAR', 1103, 34),
(2, 'ARNAVUTKÖY', 2048, 34),
(3, 'ATAŞEHİR', 2049, 34),
(4, 'AVCILAR', 2003, 34),
(5, 'BAĞCILAR', 2004, 34),
(6, 'BAHÇELİEVLER', 2005, 34),
(7, 'BAKIRKÖY', 1166, 34),
(8, 'BAŞAKŞEHİR', 2050, 34),
(9, 'BAYRAMPAŞA', 1886, 34),
(10, 'BEŞİKTAŞ', 1183, 34),
(11, 'BEYKOZ', 1185, 34),
(12, 'BEYLİKDÜZÜ', 2051, 34),
(13, 'BEYOĞLU', 1186, 34),
(14, 'BÜYÜKÇEKMECE', 1782, 34),
(15, 'ÇATALCA', 1237, 34),
(16, 'ÇEKMEKÖY', 2052, 34),
(17, 'ESENLER', 2016, 34),
(18, 'ESENYURT', 2053, 34),
(19, 'EYÜP', 1325, 34),
(20, 'FATİH', 1327, 34),
(21, 'GAZİOSMANPAŞA', 1336, 34),
(22, 'GÜNGÖREN', 2010, 34),
(23, 'KADIKÖY', 1421, 34),
(24, 'KAĞITHANE', 1810, 34),
(25, 'KARTAL', 1449, 34),
(26, 'KÜÇÜKÇEKMECE', 1823, 34),
(27, 'MALTEPE', 2012, 34),
(28, 'PENDİK', 1835, 34),
(29, 'SANCAKTEPE', 2054, 34),
(30, 'SARIYER', 1604, 34),
(31, 'SİLİVRİ', 1622, 34),
(32, 'SULTANBEYLİ', 2014, 34),
(33, 'SULTANGAZİ', 2055, 34),
(34, 'ŞİLE', 1659, 34),
(35, 'ŞİŞLİ', 1663, 34),
(36, 'TUZLA', 2015, 34),
(37, 'ÜMRANİYE', 1852, 34),
(38, 'ÜSKÜDAR', 1708, 34),
(39, 'ZEYTİNBURNU', 1739, 34),
(40, 'AKYURT', 1872, 6),
(41, 'ALTINDAĞ', 1130, 6),
(42, 'AYAŞ', 1157, 6),
(43, 'BALA', 1167, 6),
(44, 'BEYPAZARI', 1187, 6),
(45, 'ÇAMLIDERE', 1227, 6),
(46, 'ÇANKAYA', 1231, 6),
(47, 'ÇUBUK', 1260, 6),
(48, 'ELMADAĞ', 1302, 6),
(49, 'ETİMESGUT', 1922, 6),
(50, 'EVREN', 1924, 6),
(51, 'GÖLBAŞI', 1744, 6),
(52, 'GÜDÜL', 1365, 6),
(53, 'HAYMANA', 1387, 6),
(54, 'KAHRAMANKAZAN', 1815, 6),
(55, 'KALECİK', 1427, 6),
(56, 'KEÇİÖREN', 1745, 6),
(57, 'KIZILCAHAMAM', 1473, 6),
(58, 'MAMAK', 1746, 6),
(59, 'NALLIHAN', 1539, 6),
(60, 'POLATLI', 1578, 6),
(61, 'PURSAKLAR', 2034, 6),
(62, 'SİNCAN', 1747, 6),
(63, 'ŞEREFLİKOÇHİSAR', 1658, 6),
(64, 'YENİMAHALLE', 1723, 6),
(65, 'ALİAĞA', 1128, 35),
(66, 'BALÇOVA', 2006, 35),
(67, 'BAYINDIR', 1178, 35),
(68, 'BAYRAKLI', 2056, 35),
(69, 'BERGAMA', 1181, 35),
(70, 'BEYDAĞ', 1776, 35),
(71, 'BORNOVA', 1203, 35),
(72, 'BUCA', 1780, 35),
(73, 'ÇEŞME', 1251, 35),
(74, 'ÇİĞLİ', 2007, 35),
(75, 'DİKİLİ', 1280, 35),
(76, 'FOÇA', 1334, 35),
(77, 'GAZİEMİR', 2009, 35),
(78, 'GÜZELBAHÇE', 2018, 35),
(79, 'KARABAĞLAR', 2057, 35),
(80, 'KARABURUN', 1432, 35),
(81, 'KARŞIYAKA', 1448, 35),
(82, 'KEMALPAŞA', 1461, 35),
(83, 'KINIK', 1467, 35),
(84, 'KİRAZ', 1477, 35),
(85, 'KONAK', 1819, 35),
(86, 'MENDERES', 1826, 35),
(87, 'MENEMEN', 1521, 35),
(88, 'NARLIDERE', 2013, 35),
(89, 'ÖDEMİŞ', 1563, 35),
(90, 'SEFERİHİSAR', 1611, 35),
(91, 'SELÇUK', 1612, 35),
(92, 'TİRE', 1677, 35),
(93, 'TORBALI', 1682, 35),
(94, 'URLA', 1703, 35),
(95, 'BÜYÜKORHAN', 1783, 16),
(96, 'GEMLİK', 1343, 16),
(97, 'GÜRSU', 1935, 16),
(98, 'HARMANCIK', 1799, 16),
(99, 'İNEGÖL', 1411, 16),
(100, 'İZNİK', 1420, 16),
(101, 'KARACABEY', 1434, 16),
(102, 'KELES', 1457, 16),
(103, 'KESTEL', 1960, 16),
(104, 'MUDANYA', 1530, 16),
(105, 'MUSTAFAKEMALPAŞA', 1535, 16),
(106, 'NİLÜFER', 1829, 16),
(107, 'ORHANELİ', 1553, 16),
(108, 'ORHANGAZİ', 1554, 16),
(109, 'OSMANGAZİ', 1832, 16),
(110, 'YENİŞEHİR', 1725, 16),
(111, 'YILDIRIM', 1859, 16),
(112, 'ALADAĞ', 1757, 1),
(113, 'CEYHAN', 1219, 1),
(114, 'ÇUKUROVA', 2033, 1),
(115, 'FEKE', 1329, 1),
(116, 'İMAMOĞLU', 1806, 1),
(117, 'KARAİSALI', 1437, 1),
(118, 'KARATAŞ', 1443, 1),
(119, 'KOZAN', 1486, 1),
(120, 'POZANTI', 1580, 1),
(121, 'SAİMBEYLİ', 1588, 1),
(122, 'SARIÇAM', 2032, 1),
(123, 'SEYHAN', 1104, 1),
(124, 'TUFANBEYLİ', 1687, 1),
(125, 'YUMURTALIK', 1734, 1),
(126, 'YÜREĞİR', 1748, 1),
(127, 'BESNİ', 1182, 2),
(128, 'ÇELİKHAN', 1246, 2),
(129, 'GERGER', 1347, 2),
(130, 'GÖLBAŞI', 1354, 2),
(131, 'KAHTA', 1425, 2),
(132, 'MERKEZ', 1105, 2),
(133, 'SAMSAT', 1592, 2),
(134, 'SİNCİK', 1985, 2),
(135, 'TUT', 1989, 2),
(136, 'BAŞMAKÇI', 1771, 3),
(137, 'BAYAT', 1773, 3),
(138, 'BOLVADİN', 1200, 3),
(139, 'ÇAY', 1239, 3),
(140, 'ÇOBANLAR', 1906, 3),
(141, 'DAZKIRI', 1267, 3),
(142, 'DİNAR', 1281, 3),
(143, 'EMİRDAĞ', 1306, 3),
(144, 'EVCİLER', 1923, 3),
(145, 'HOCALAR', 1944, 3),
(146, 'İHSANİYE', 1404, 3),
(147, 'İSCEHİSAR', 1809, 3),
(148, 'KIZILÖREN', 1961, 3),
(149, 'MERKEZ', 1108, 3),
(150, 'SANDIKLI', 1594, 3),
(151, 'SİNANPAŞA', 1626, 3),
(152, 'SULTANDAĞI', 1639, 3),
(153, 'ŞUHUT', 1664, 3),
(154, 'DİYADİN', 1283, 4),
(155, 'DOĞUBAYAZIT', 1287, 4),
(156, 'ELEŞKİRT', 1301, 4),
(157, 'HAMUR', 1379, 4),
(158, 'MERKEZ', 1111, 4),
(159, 'PATNOS', 1568, 4),
(160, 'TAŞLIÇAY', 1667, 4),
(161, 'TUTAK', 1691, 4),
(162, 'AĞAÇÖREN', 1860, 68),
(163, 'ESKİL', 1921, 68),
(164, 'GÜLAĞAÇ', 1932, 68),
(165, 'GÜZELYURT', 1861, 68),
(166, 'MERKEZ', 1120, 68),
(167, 'ORTAKÖY', 1557, 68),
(168, 'SARIYAHŞİ', 1866, 68),
(169, 'GÖYNÜCEK', 1363, 5),
(170, 'GÜMÜŞHACIKÖY', 1368, 5),
(171, 'HAMAMÖZÜ', 1938, 5),
(172, 'MERKEZ', 1134, 5),
(173, 'MERZİFON', 1524, 5),
(174, 'SULUOVA', 1641, 5),
(175, 'TAŞOVA', 1668, 5),
(176, 'AKSEKİ', 1121, 7),
(177, 'AKSU', 2035, 7),
(178, 'ALANYA', 1126, 7),
(179, 'DEMRE', 1811, 7),
(180, 'DÖŞEMEALTI', 2036, 7),
(181, 'ELMALI', 1303, 7),
(182, 'FİNİKE', 1333, 7),
(183, 'GAZİPAŞA', 1337, 7),
(184, 'GÜNDOĞMUŞ', 1370, 7),
(185, 'İBRADI', 1946, 7),
(186, 'KAŞ', 1451, 7),
(187, 'KEMER', 1959, 7),
(188, 'KEPEZ', 2037, 7),
(189, 'KONYAALTI', 2038, 7),
(190, 'KORKUTELİ', 1483, 7),
(191, 'KUMLUCA', 1492, 7),
(192, 'MANAVGAT', 1512, 7),
(193, 'MURATPAŞA', 2039, 7),
(194, 'SERİK', 1616, 7),
(195, 'ÇILDIR', 1252, 75),
(196, 'DAMAL', 2008, 75),
(197, 'GÖLE', 1356, 75),
(198, 'HANAK', 1380, 75),
(199, 'MERKEZ', 1144, 75),
(200, 'POSOF', 1579, 75),
(201, 'ARDANUÇ', 1145, 8),
(202, 'ARHAVİ', 1147, 8),
(203, 'BORÇKA', 1202, 8),
(204, 'HOPA', 1395, 8),
(205, 'MERKEZ', 1152, 8),
(206, 'MURGUL', 1828, 8),
(207, 'ŞAVŞAT', 1653, 8),
(208, 'YUSUFELİ', 1736, 8),
(209, 'BOZDOĞAN', 1206, 9),
(210, 'BUHARKENT', 1781, 9),
(211, 'ÇİNE', 1256, 9),
(212, 'DİDİM', 2000, 9),
(213, 'EFELER', 2076, 9),
(214, 'GERMENCİK', 1348, 9),
(215, 'İNCİRLİOVA', 1807, 9),
(216, 'KARACASU', 1435, 9),
(217, 'KARPUZLU', 1957, 9),
(218, 'KOÇARLI', 1479, 9),
(219, 'KÖŞK', 1968, 9),
(220, 'KUŞADASI', 1497, 9),
(221, 'KUYUCAK', 1498, 9),
(222, 'NAZİLLİ', 1542, 9),
(223, 'SÖKE', 1637, 9),
(224, 'SULTANHİSAR', 1640, 9),
(225, 'YENİPAZAR', 1724, 9),
(226, 'ALTIEYLÜL', 2077, 10),
(227, 'AYVALIK', 1161, 10),
(228, 'BALYA', 1169, 10),
(229, 'BANDIRMA', 1171, 10),
(230, 'BİGADİÇ', 1191, 10),
(231, 'BURHANİYE', 1216, 10),
(232, 'DURSUNBEY', 1291, 10),
(233, 'EDREMİT', 1294, 10),
(234, 'ERDEK', 1310, 10),
(235, 'GÖMEÇ', 1928, 10),
(236, 'GÖNEN', 1360, 10),
(237, 'HAVRAN', 1384, 10),
(238, 'İVRİNDİ', 1418, 10),
(239, 'KARESİ', 2078, 10),
(240, 'KEPSUT', 1462, 10),
(241, 'MANYAS', 1514, 10),
(242, 'MARMARA', 1824, 10),
(243, 'SAVAŞTEPE', 1608, 10),
(244, 'SINDIRGI', 1619, 10),
(245, 'SUSURLUK', 1644, 10),
(246, 'AMASRA', 1761, 74),
(247, 'KURUCAŞİLE', 1496, 74),
(248, 'MERKEZ', 1172, 74),
(249, 'ULUS', 1701, 74),
(250, 'BEŞİRİ', 1184, 72),
(251, 'GERCÜŞ', 1345, 72),
(252, 'HASANKEYF', 1941, 72),
(253, 'KOZLUK', 1487, 72),
(254, 'MERKEZ', 1174, 72),
(255, 'SASON', 1607, 72),
(256, 'AYDINTEPE', 1767, 69),
(257, 'DEMİRÖZÜ', 1788, 69),
(258, 'MERKEZ', 1176, 69),
(259, 'BOZÜYÜK', 1210, 11),
(260, 'GÖLPAZARI', 1359, 11),
(261, 'İNHİSAR', 1948, 11),
(262, 'MERKEZ', 1192, 11),
(263, 'OSMANELİ', 1559, 11),
(264, 'PAZARYERİ', 1571, 11),
(265, 'SÖĞÜT', 1636, 11),
(266, 'YENİPAZAR', 1857, 11),
(267, 'ADAKLI', 1750, 12),
(268, 'GENÇ', 1344, 12),
(269, 'KARLIOVA', 1446, 12),
(270, 'KİĞI', 1475, 12),
(271, 'MERKEZ', 1193, 12),
(272, 'SOLHAN', 1633, 12),
(273, 'YAYLADERE', 1855, 12),
(274, 'YEDİSU', 1996, 12),
(275, 'ADİLCEVAZ', 1106, 13),
(276, 'AHLAT', 1112, 13),
(277, 'GÜROYMAK', 1798, 13),
(278, 'HİZAN', 1394, 13),
(279, 'MERKEZ', 1196, 13),
(280, 'MUTKİ', 1537, 13),
(281, 'TATVAN', 1669, 13),
(282, 'DÖRTDİVAN', 1916, 14),
(283, 'GEREDE', 1346, 14),
(284, 'GÖYNÜK', 1364, 14),
(285, 'KIBRISCIK', 1466, 14),
(286, 'MENGEN', 1522, 14),
(287, 'MERKEZ', 1199, 14),
(288, 'MUDURNU', 1531, 14),
(289, 'SEBEN', 1610, 14),
(290, 'YENİÇAĞA', 1997, 14),
(291, 'AĞLASUN', 1109, 15),
(292, 'ALTINYAYLA', 1874, 15),
(293, 'BUCAK', 1211, 15),
(294, 'ÇAVDIR', 1899, 15),
(295, 'ÇELTİKÇİ', 1903, 15),
(296, 'GÖLHİSAR', 1357, 15),
(297, 'KARAMANLI', 1813, 15),
(298, 'KEMER', 1816, 15),
(299, 'MERKEZ', 1215, 15),
(300, 'TEFENNİ', 1672, 15),
(301, 'YEŞİLOVA', 1728, 15),
(302, 'AYVACIK', 1160, 17),
(303, 'BAYRAMİÇ', 1180, 17),
(304, 'BİGA', 1190, 17),
(305, 'BOZCAADA', 1205, 17),
(306, 'ÇAN', 1229, 17),
(307, 'ECEABAT', 1293, 17),
(308, 'EZİNE', 1326, 17),
(309, 'GELİBOLU', 1340, 17),
(310, 'GÖKÇEADA', 1408, 17),
(311, 'LAPSEKİ', 1503, 17),
(312, 'MERKEZ', 1230, 17),
(313, 'YENİCE', 1722, 17),
(314, 'ATKARACALAR', 1765, 18),
(315, 'BAYRAMÖREN', 1885, 18),
(316, 'ÇERKEŞ', 1248, 18),
(317, 'ELDİVAN', 1300, 18),
(318, 'ILGAZ', 1399, 18),
(319, 'KIZILIRMAK', 1817, 18),
(320, 'KORGUN', 1963, 18),
(321, 'KURŞUNLU', 1494, 18),
(322, 'MERKEZ', 1232, 18),
(323, 'ORTA', 1555, 18),
(324, 'ŞABANÖZÜ', 1649, 18),
(325, 'YAPRAKLI', 1718, 18),
(326, 'ALACA', 1124, 19),
(327, 'BAYAT', 1177, 19),
(328, 'BOĞAZKALE', 1778, 19),
(329, 'DODURGA', 1911, 19),
(330, 'İSKİLİP', 1414, 19),
(331, 'KARGI', 1445, 19),
(332, 'LAÇİN', 1972, 19),
(333, 'MECİTÖZÜ', 1520, 19),
(334, 'MERKEZ', 1259, 19),
(335, 'OĞUZLAR', 1976, 19),
(336, 'ORTAKÖY', 1556, 19),
(337, 'OSMANCIK', 1558, 19),
(338, 'SUNGURLU', 1642, 19),
(339, 'UĞURLUDAĞ', 1850, 19),
(340, 'ACIPAYAM', 1102, 20),
(341, 'BABADAĞ', 1769, 20),
(342, 'BAKLAN', 1881, 20),
(343, 'BEKİLLİ', 1774, 20),
(344, 'BEYAĞAÇ', 1888, 20),
(345, 'BOZKURT', 1889, 20),
(346, 'BULDAN', 1214, 20),
(347, 'ÇAL', 1224, 20),
(348, 'ÇAMELİ', 1226, 20),
(349, 'ÇARDAK', 1233, 20),
(350, 'ÇİVRİL', 1257, 20),
(351, 'GÜNEY', 1371, 20),
(352, 'HONAZ', 1803, 20),
(353, 'KALE', 1426, 20),
(354, 'MERKEZEFENDİ', 2079, 20),
(355, 'PAMUKKALE', 1871, 20),
(356, 'SARAYKÖY', 1597, 20),
(357, 'SERİNHİSAR', 1840, 20),
(358, 'TAVAS', 1670, 20),
(359, 'BAĞLAR', 2040, 21),
(360, 'BİSMİL', 1195, 21),
(361, 'ÇERMİK', 1249, 21),
(362, 'ÇINAR', 1253, 21),
(363, 'ÇÜNGÜŞ', 1263, 21),
(364, 'DİCLE', 1278, 21),
(365, 'EĞİL', 1791, 21),
(366, 'ERGANİ', 1315, 21),
(367, 'HANİ', 1381, 21),
(368, 'HAZRO', 1389, 21),
(369, 'KAYAPINAR', 2041, 21),
(370, 'KOCAKÖY', 1962, 21),
(371, 'KULP', 1490, 21),
(372, 'LİCE', 1504, 21),
(373, 'SİLVAN', 1624, 21),
(374, 'SUR', 2042, 21),
(375, 'YENİŞEHİR', 2043, 21),
(376, 'BAŞİSKELE', 2058, 41),
(377, 'ÇAYIROVA', 2059, 41),
(378, 'DARICA', 2060, 41),
(379, 'DERİNCE', 2030, 41),
(380, 'DİLOVASI', 2061, 41),
(381, 'GEBZE', 1338, 41),
(382, 'GÖLCÜK', 1355, 41),
(383, 'İZMİT', 2062, 41),
(384, 'KANDIRA', 1430, 41),
(385, 'KARAMÜRSEL', 1440, 41),
(386, 'KARTEPE', 2063, 41),
(387, 'KÖRFEZ', 1821, 41),
(388, 'AHIRLI', 1868, 42),
(389, 'AKÖREN', 1753, 42),
(390, 'AKŞEHİR', 1122, 42),
(391, 'ALTINEKİN', 1760, 42),
(392, 'BEYŞEHİR', 1188, 42),
(393, 'BOZKIR', 1207, 42),
(394, 'CİHANBEYLİ', 1222, 42),
(395, 'ÇELTİK', 1902, 42),
(396, 'ÇUMRA', 1262, 42),
(397, 'DERBENT', 1907, 42),
(398, 'DEREBUCAK', 1789, 42),
(399, 'DOĞANHİSAR', 1285, 42),
(400, 'EMİRGAZİ', 1920, 42),
(401, 'EREĞLİ', 1312, 42),
(402, 'GÜNEYSINIR', 1933, 42),
(403, 'HADİM', 1375, 42),
(404, 'HALKAPINAR', 1937, 42),
(405, 'HÜYÜK', 1804, 42),
(406, 'ILGIN', 1400, 42),
(407, 'KADINHANI', 1422, 42),
(408, 'KARAPINAR', 1441, 42),
(409, 'KARATAY', 1814, 42),
(410, 'KULU', 1491, 42),
(411, 'MERAM', 1827, 42),
(412, 'SARAYÖNÜ', 1598, 42),
(413, 'SELÇUKLU', 1839, 42),
(414, 'SEYDİŞEHİR', 1617, 42),
(415, 'TAŞKENT', 1848, 42),
(416, 'TUZLUKÇU', 1990, 42),
(417, 'YALIHÜYÜK', 1994, 42),
(418, 'YUNAK', 1735, 42),
(419, 'ALTINTAŞ', 1132, 43),
(420, 'ASLANAPA', 1764, 43),
(421, 'ÇAVDARHİSAR', 1898, 43),
(422, 'DOMANİÇ', 1288, 43),
(423, 'DUMLUPINAR', 1790, 43),
(424, 'EMET', 1304, 43),
(425, 'GEDİZ', 1339, 43),
(426, 'HİSARCIK', 1802, 43),
(427, 'MERKEZ', 1500, 43),
(428, 'PAZARLAR', 1979, 43),
(429, 'SİMAV', 1625, 43),
(430, 'ŞAPHANE', 1843, 43),
(431, 'TAVŞANLI', 1671, 43),
(432, 'AKÇADAĞ', 1114, 44),
(433, 'ARAPGİR', 1143, 44),
(434, 'ARGUVAN', 1148, 44),
(435, 'BATTALGAZİ', 1772, 44),
(436, 'DARENDE', 1265, 44),
(437, 'DOĞANŞEHİR', 1286, 44),
(438, 'DOĞANYOL', 1914, 44),
(439, 'HEKİMHAN', 1390, 44),
(440, 'KALE', 1953, 44),
(441, 'KULUNCAK', 1969, 44),
(442, 'PÜTÜRGE', 1582, 44),
(443, 'YAZIHAN', 1995, 44),
(444, 'YEŞİLYURT', 1729, 44),
(445, 'AHMETLİ', 1751, 45),
(446, 'AKHİSAR', 1118, 45),
(447, 'ALAŞEHİR', 1127, 45),
(448, 'DEMİRCİ', 1269, 45),
(449, 'GÖLMARMARA', 1793, 45),
(450, 'GÖRDES', 1362, 45),
(451, 'KIRKAĞAÇ', 1470, 45),
(452, 'KÖPRÜBAŞI', 1965, 45),
(453, 'KULA', 1489, 45),
(454, 'SALİHLİ', 1590, 45),
(455, 'SARIGÖL', 1600, 45),
(456, 'SARUHANLI', 1606, 45),
(457, 'SELENDİ', 1613, 45),
(458, 'SOMA', 1634, 45),
(459, 'ŞEHZADELER', 2086, 45),
(460, 'TURGUTLU', 1689, 45),
(461, 'YUNUSEMRE', 2087, 45),
(462, 'ARTUKLU', 2088, 47),
(463, 'DARGEÇİT', 1787, 47),
(464, 'DERİK', 1273, 47),
(465, 'KIZILTEPE', 1474, 47),
(466, 'MAZIDAĞI', 1519, 47),
(467, 'MİDYAT', 1526, 47),
(468, 'NUSAYBİN', 1547, 47),
(469, 'ÖMERLİ', 1564, 47),
(470, 'SAVUR', 1609, 47),
(471, 'YEŞİLLİ', 2002, 47),
(472, 'AKDENİZ', 2064, 33),
(473, 'ANAMUR', 1135, 33),
(474, 'AYDINCIK', 1766, 33),
(475, 'BOZYAZI', 1779, 33),
(476, 'ÇAMLIYAYLA', 1892, 33),
(477, 'ERDEMLİ', 1311, 33),
(478, 'GÜLNAR', 1366, 33),
(479, 'MEZİTLİ', 2065, 33),
(480, 'MUT', 1536, 33),
(481, 'SİLİFKE', 1621, 33),
(482, 'TARSUS', 1665, 33),
(483, 'TOROSLAR', 2066, 33),
(484, 'YENİŞEHİR', 2067, 33),
(485, 'BODRUM', 1197, 48),
(486, 'DALAMAN', 1742, 48),
(487, 'DATÇA', 1266, 48),
(488, 'FETHİYE', 1331, 48),
(489, 'KAVAKLIDERE', 1958, 48),
(490, 'KÖYCEĞİZ', 1488, 48),
(491, 'MARMARİS', 1517, 48),
(492, 'MENTEŞE', 2089, 48),
(493, 'MİLAS', 1528, 48),
(494, 'ORTACA', 1831, 48),
(495, 'SEYDİKEMER', 2090, 48),
(496, 'ULA', 1695, 48),
(497, 'YATAĞAN', 1719, 48),
(498, 'BULANIK', 1213, 49),
(499, 'HASKÖY', 1801, 49),
(500, 'KORKUT', 1964, 49),
(501, 'MALAZGİRT', 1510, 49),
(502, 'MERKEZ', 1534, 49),
(503, 'VARTO', 1711, 49),
(504, 'ACIGÖL', 1749, 50),
(505, 'AVANOS', 1155, 50),
(506, 'DERİNKUYU', 1274, 50),
(507, 'GÜLŞEHİR', 1367, 50),
(508, 'HACIBEKTAŞ', 1374, 50),
(509, 'KOZAKLI', 1485, 50),
(510, 'MERKEZ', 1543, 50),
(511, 'ÜRGÜP', 1707, 50),
(512, 'ALTUNHİSAR', 1876, 51),
(513, 'BOR', 1201, 51),
(514, 'ÇAMARDI', 1225, 51),
(515, 'ÇİFTLİK', 1904, 51),
(516, 'MERKEZ', 1544, 51),
(517, 'ULUKIŞLA', 1700, 51),
(518, 'AKKUŞ', 1119, 52),
(519, 'ALTINORDU', 2103, 52),
(520, 'AYBASTI', 1158, 52),
(521, 'ÇAMAŞ', 1891, 52),
(522, 'ÇATALPINAR', 1897, 52),
(523, 'ÇAYBAŞI', 1900, 52),
(524, 'FATSA', 1328, 52),
(525, 'GÖLKÖY', 1358, 52),
(526, 'GÜLYALI', 1795, 52),
(527, 'GÜRGENTEPE', 1797, 52),
(528, 'İKİZCE', 1947, 52),
(529, 'KABADÜZ', 1950, 52),
(530, 'KABATAŞ', 1951, 52),
(531, 'KORGAN', 1482, 52),
(532, 'KUMRU', 1493, 52),
(533, 'MESUDİYE', 1525, 52),
(534, 'PERŞEMBE', 1573, 52),
(535, 'ULUBEY', 1696, 52),
(536, 'ÜNYE', 1706, 52),
(537, 'BAHÇE', 1165, 80),
(538, 'DÜZİÇİ', 1743, 80),
(539, 'HASANBEYLİ', 2027, 80),
(540, 'KADİRLİ', 1423, 80),
(541, 'MERKEZ', 1560, 80),
(542, 'SUMBAS', 2028, 80),
(543, 'TOPRAKKALE', 2029, 80),
(544, 'ARDEŞEN', 1146, 53),
(545, 'ÇAMLIHEMŞİN', 1228, 53),
(546, 'ÇAYELİ', 1241, 53),
(547, 'DEREPAZARI', 1908, 53),
(548, 'FINDIKLI', 1332, 53),
(549, 'GÜNEYSU', 1796, 53),
(550, 'HEMŞİN', 1943, 53),
(551, 'İKİZDERE', 1405, 53),
(552, 'İYİDERE', 1949, 53),
(553, 'KALKANDERE', 1428, 53),
(554, 'MERKEZ', 1586, 53),
(555, 'PAZAR', 1569, 53),
(556, 'ADAPAZARI', 2068, 54),
(557, 'AKYAZI', 1123, 54),
(558, 'ARİFİYE', 2069, 54),
(559, 'ERENLER', 2070, 54),
(560, 'FERİZLİ', 1925, 54),
(561, 'GEYVE', 1351, 54),
(562, 'HENDEK', 1391, 54),
(563, 'KARAPÜRÇEK', 1955, 54),
(564, 'KARASU', 1442, 54),
(565, 'KAYNARCA', 1453, 54),
(566, 'KOCAALİ', 1818, 54),
(567, 'PAMUKOVA', 1833, 54),
(568, 'SAPANCA', 1595, 54),
(569, 'SERDİVAN', 2071, 54),
(570, 'SÖĞÜTLÜ', 1986, 54),
(571, 'TARAKLI', 1847, 54),
(572, 'ALAÇAM', 1125, 55),
(573, 'ASARCIK', 1763, 55),
(574, 'ATAKUM', 2072, 55),
(575, 'AYVACIK', 1879, 55),
(576, 'BAFRA', 1164, 55),
(577, 'CANİK', 2073, 55),
(578, 'ÇARŞAMBA', 1234, 55),
(579, 'HAVZA', 1386, 55),
(580, 'İLKADIM', 2074, 55),
(581, 'KAVAK', 1452, 55),
(582, 'LADİK', 1501, 55),
(583, 'SALIPAZARI', 1838, 55),
(584, 'TEKKEKÖY', 1849, 55),
(585, 'TERME', 1676, 55),
(586, 'VEZİRKÖPRÜ', 1712, 55),
(587, 'YAKAKENT', 1993, 55),
(588, '19 MAYIS', 1830, 55),
(589, 'BAYKAN', 1179, 56),
(590, 'ERUH', 1317, 56),
(591, 'KURTALAN', 1495, 56),
(592, 'MERKEZ', 1620, 56),
(593, 'PERVARİ', 1575, 56),
(594, 'ŞİRVAN', 1662, 56),
(595, 'TİLLO', 1878, 56),
(596, 'AYANCIK', 1156, 57),
(597, 'BOYABAT', 1204, 57),
(598, 'DİKMEN', 1910, 57),
(599, 'DURAĞAN', 1290, 57),
(600, 'ERFELEK', 1314, 57),
(601, 'GERZE', 1349, 57),
(602, 'MERKEZ', 1627, 57),
(603, 'SARAYDÜZÜ', 1981, 57),
(604, 'TÜRKELİ', 1693, 57),
(605, 'BEYTÜŞŞEBAP', 1189, 73),
(606, 'CİZRE', 1223, 73),
(607, 'GÜÇLÜKONAK', 1931, 73),
(608, 'İDİL', 1403, 73),
(609, 'MERKEZ', 1661, 73),
(610, 'SİLOPİ', 1623, 73),
(611, 'ULUDERE', 1698, 73),
(612, 'AKINCILAR', 1870, 58),
(613, 'ALTINYAYLA', 1875, 58),
(614, 'DİVRİĞİ', 1282, 58),
(615, 'DOĞANŞAR', 1913, 58),
(616, 'GEMEREK', 1342, 58),
(617, 'GÖLOVA', 1927, 58),
(618, 'GÜRÜN', 1373, 58),
(619, 'HAFİK', 1376, 58),
(620, 'İMRANLI', 1407, 58),
(621, 'KANGAL', 1431, 58),
(622, 'KOYULHİSAR', 1484, 58),
(623, 'MERKEZ', 1628, 58),
(624, 'SUŞEHRİ', 1646, 58),
(625, 'ŞARKIŞLA', 1650, 58),
(626, 'ULAŞ', 1991, 58),
(627, 'YILDIZELİ', 1731, 58),
(628, 'ZARA', 1738, 58),
(629, 'ÇERKEZKÖY', 1250, 59),
(630, 'ÇORLU', 1258, 59),
(631, 'ERGENE', 2094, 59),
(632, 'HAYRABOLU', 1388, 59),
(633, 'KAPAKLI', 2095, 59),
(634, 'MALKARA', 1511, 59),
(635, 'MARMARAEREĞLİSİ', 1825, 59),
(636, 'MURATLI', 1538, 59),
(637, 'SARAY', 1596, 59),
(638, 'SÜLEYMANPAŞA', 2096, 59),
(639, 'ŞARKÖY', 1652, 59),
(640, 'ALMUS', 1129, 60),
(641, 'ARTOVA', 1151, 60),
(642, 'BAŞÇİFTLİK', 1883, 60),
(643, 'ERBAA', 1308, 60),
(644, 'MERKEZ', 1679, 60),
(645, 'NİKSAR', 1545, 60),
(646, 'PAZAR', 1834, 60),
(647, 'REŞADİYE', 1584, 60),
(648, 'SULUSARAY', 1987, 60),
(649, 'TURHAL', 1690, 60),
(650, 'YEŞİLYURT', 1858, 60),
(651, 'ZİLE', 1740, 60),
(652, 'AKÇAABAT', 1113, 61),
(653, 'ARAKLI', 1141, 61),
(654, 'ARSİN', 1150, 61),
(655, 'BEŞİKDÜZÜ', 1775, 61),
(656, 'ÇARŞIBAŞI', 1896, 61),
(657, 'ÇAYKARA', 1244, 61),
(658, 'DERNEKPAZARI', 1909, 61),
(659, 'DÜZKÖY', 1917, 61),
(660, 'HAYRAT', 1942, 61),
(661, 'KÖPRÜBAŞI', 1966, 61),
(662, 'MAÇKA', 1507, 61),
(663, 'OF', 1548, 61),
(664, 'ORTAHİSAR', 2097, 61),
(665, 'SÜRMENE', 1647, 61),
(666, 'ŞALPAZARI', 1842, 61),
(667, 'TONYA', 1681, 61),
(668, 'VAKFIKEBİR', 1709, 61),
(669, 'YOMRA', 1732, 61),
(670, 'ÇEMİŞGEZEK', 1247, 62),
(671, 'HOZAT', 1397, 62),
(672, 'MAZGİRT', 1518, 62),
(673, 'MERKEZ', 1688, 62),
(674, 'NAZIMİYE', 1541, 62),
(675, 'OVACIK', 1562, 62),
(676, 'PERTEK', 1574, 62),
(677, 'PÜLÜMÜR', 1581, 62),
(678, 'AKÇAKALE', 1115, 63),
(679, 'BİRECİK', 1194, 63),
(680, 'BOZOVA', 1209, 63),
(681, 'CEYLANPINAR', 1220, 63),
(682, 'EYYÜBİYE', 2091, 63),
(683, 'HALFETİ', 1378, 63),
(684, 'HALİLİYE', 2092, 63),
(685, 'HARRAN', 1800, 63),
(686, 'HİLVAN', 1393, 63),
(687, 'KARAKÖPRÜ', 2093, 63),
(688, 'SİVEREK', 1630, 63),
(689, 'SURUÇ', 1643, 63),
(690, 'VİRANŞEHİR', 1713, 63),
(691, 'BANAZ', 1170, 64),
(692, 'EŞME', 1323, 64),
(693, 'KARAHALLI', 1436, 64),
(694, 'MERKEZ', 1704, 64),
(695, 'SİVASLI', 1629, 64),
(696, 'ULUBEY', 1697, 64),
(697, 'BAHÇESARAY', 1770, 65),
(698, 'BAŞKALE', 1175, 65),
(699, 'ÇALDIRAN', 1786, 65),
(700, 'ÇATAK', 1236, 65),
(701, 'EDREMİT', 1918, 65),
(702, 'ERCİŞ', 1309, 65),
(703, 'GEVAŞ', 1350, 65),
(704, 'GÜRPINAR', 1372, 65),
(705, 'İPEKYOLU', 2098, 65),
(706, 'MURADİYE', 1533, 65),
(707, 'ÖZALP', 1565, 65),
(708, 'SARAY', 1980, 65),
(709, 'TUŞBA', 2099, 65),
(710, 'ALTINOVA', 2019, 77),
(711, 'ARMUTLU', 2020, 77),
(712, 'ÇINARCIK', 2021, 77),
(713, 'ÇİFTLİKKÖY', 2022, 77),
(714, 'MERKEZ', 1716, 77),
(715, 'TERMAL', 2026, 77),
(716, 'AKDAĞMADENİ', 1117, 66),
(717, 'AYDINCIK', 1877, 66),
(718, 'BOĞAZLIYAN', 1198, 66),
(719, 'ÇANDIR', 1895, 66),
(720, 'ÇAYIRALAN', 1242, 66),
(721, 'ÇEKEREK', 1245, 66),
(722, 'KADIŞEHRİ', 1952, 66),
(723, 'MERKEZ', 1733, 66),
(724, 'SARAYKENT', 1982, 66),
(725, 'SARIKAYA', 1602, 66),
(726, 'SORGUN', 1635, 66),
(727, 'ŞEFAATLİ', 1655, 66),
(728, 'YENİFAKILI', 1998, 66),
(729, 'YERKÖY', 1726, 66),
(730, 'ALAPLI', 1758, 67),
(731, 'ÇAYCUMA', 1240, 67),
(732, 'DEVREK', 1276, 67),
(733, 'EREĞLİ', 1313, 67),
(734, 'GÖKÇEBEY', 1926, 67),
(735, 'KİLİMLİ', 2100, 67),
(736, 'KOZLU', 2101, 67),
(737, 'MERKEZ', 1741, 67),
(738, 'AKÇAKOCA', 1116, 81),
(739, 'CUMAYERİ', 1784, 81),
(740, 'ÇİLİMLİ', 1905, 81),
(741, 'GÖLYAKA', 1794, 81),
(742, 'GÜMÜŞOVA', 2017, 81),
(743, 'KAYNAŞLI', 2031, 81),
(744, 'MERKEZ', 1292, 81),
(745, 'YIĞILCA', 1730, 81),
(746, 'ENEZ', 1307, 22),
(747, 'HAVSA', 1385, 22),
(748, 'İPSALA', 1412, 22),
(749, 'KEŞAN', 1464, 22),
(750, 'LALAPAŞA', 1502, 22),
(751, 'MERİÇ', 1523, 22),
(752, 'MERKEZ', 1295, 22),
(753, 'SÜLOĞLU', 1988, 22),
(754, 'UZUNKÖPRÜ', 1705, 22),
(755, 'AĞIN', 1110, 23),
(756, 'ALACAKAYA', 1873, 23),
(757, 'ARICAK', 1762, 23),
(758, 'BASKİL', 1173, 23),
(759, 'KARAKOÇAN', 1438, 23),
(760, 'KEBAN', 1455, 23),
(761, 'KOVANCILAR', 1820, 23),
(762, 'MADEN', 1506, 23),
(763, 'MERKEZ', 1298, 23),
(764, 'PALU', 1566, 23),
(765, 'SİVRİCE', 1631, 23),
(766, 'ÇAYIRLI', 1243, 24),
(767, 'İLİÇ', 1406, 24),
(768, 'KEMAH', 1459, 24),
(769, 'KEMALİYE', 1460, 24),
(770, 'MERKEZ', 1318, 24),
(771, 'OTLUKBELİ', 1977, 24),
(772, 'REFAHİYE', 1583, 24),
(773, 'TERCAN', 1675, 24),
(774, 'ÜZÜMLÜ', 1853, 24),
(775, 'AŞKALE', 1153, 25),
(776, 'AZİZİYE', 1945, 25),
(777, 'ÇAT', 1235, 25),
(778, 'HINIS', 1392, 25),
(779, 'HORASAN', 1396, 25),
(780, 'İSPİR', 1416, 25),
(781, 'KARAÇOBAN', 1812, 25),
(782, 'KARAYAZI', 1444, 25),
(783, 'KÖPRÜKÖY', 1967, 25),
(784, 'NARMAN', 1540, 25),
(785, 'OLTU', 1550, 25),
(786, 'OLUR', 1551, 25),
(787, 'PALANDÖKEN', 2044, 25),
(788, 'PASİNLER', 1567, 25),
(789, 'PAZARYOLU', 1865, 25),
(790, 'ŞENKAYA', 1657, 25),
(791, 'TEKMAN', 1674, 25),
(792, 'TORTUM', 1683, 25),
(793, 'UZUNDERE', 1851, 25),
(794, 'YAKUTİYE', 2045, 25),
(795, 'ALPU', 1759, 26),
(796, 'BEYLİKOVA', 1777, 26),
(797, 'ÇİFTELER', 1255, 26),
(798, 'GÜNYÜZÜ', 1934, 26),
(799, 'HAN', 1939, 26),
(800, 'İNÖNÜ', 1808, 26),
(801, 'MAHMUDİYE', 1508, 26),
(802, 'MİHALGAZİ', 1973, 26),
(803, 'MİHALIÇÇIK', 1527, 26),
(804, 'ODUNPAZARI', 2046, 26),
(805, 'SARICAKAYA', 1599, 26),
(806, 'SEYİTGAZİ', 1618, 26),
(807, 'SİVRİHİSAR', 1632, 26),
(808, 'TEPEBAŞI', 2047, 26),
(809, 'ARABAN', 1139, 27),
(810, 'İSLAHİYE', 1415, 27),
(811, 'KARKAMIŞ', 1956, 27),
(812, 'NİZİP', 1546, 27),
(813, 'NURDAĞI', 1974, 27),
(814, 'OĞUZELİ', 1549, 27),
(815, 'ŞAHİNBEY', 1841, 27),
(816, 'ŞEHİTKAMİL', 1844, 27),
(817, 'YAVUZELİ', 1720, 27),
(818, 'ALUCRA', 1133, 28),
(819, 'BULANCAK', 1212, 28),
(820, 'ÇAMOLUK', 1893, 28),
(821, 'ÇANAKÇI', 1894, 28),
(822, 'DERELİ', 1272, 28),
(823, 'DOĞANKENT', 1912, 28),
(824, 'ESPİYE', 1320, 28),
(825, 'EYNESİL', 1324, 28),
(826, 'GÖRELE', 1361, 28),
(827, 'GÜCE', 1930, 28),
(828, 'KEŞAP', 1465, 28),
(829, 'MERKEZ', 1352, 28),
(830, 'PİRAZİZ', 1837, 28),
(831, 'ŞEBİNKARAHİSAR', 1654, 28),
(832, 'TİREBOLU', 1678, 28),
(833, 'YAĞLIDERE', 1854, 28),
(834, 'KELKİT', 1458, 29),
(835, 'KÖSE', 1822, 29),
(836, 'KÜRTÜN', 1971, 29),
(837, 'MERKEZ', 1369, 29),
(838, 'ŞİRAN', 1660, 29),
(839, 'TORUL', 1684, 29),
(840, 'ÇUKURCA', 1261, 30),
(841, 'MERKEZ', 1377, 30),
(842, 'ŞEMDİNLİ', 1656, 30),
(843, 'YÜKSEKOVA', 1737, 30),
(844, 'ALTINÖZÜ', 1131, 31),
(845, 'ANTAKYA', 2080, 31),
(846, 'ARSUZ', 2081, 31),
(847, 'BELEN', 1887, 31),
(848, 'DEFNE', 2082, 31),
(849, 'DÖRTYOL', 1289, 31),
(850, 'ERZİN', 1792, 31),
(851, 'HASSA', 1382, 31),
(852, 'İSKENDERUN', 1413, 31),
(853, 'KIRIKHAN', 1468, 31),
(854, 'KUMLU', 1970, 31),
(855, 'PAYAS', 2083, 31),
(856, 'REYHANLI', 1585, 31),
(857, 'SAMANDAĞ', 1591, 31),
(858, 'YAYLADAĞI', 1721, 31),
(859, 'ARALIK', 1142, 76),
(860, 'KARAKOYUNLU', 2011, 76),
(861, 'MERKEZ', 1398, 76),
(862, 'TUZLUCA', 1692, 76),
(863, 'AKSU', 1755, 32),
(864, 'ATABEY', 1154, 32),
(865, 'EĞİRDİR', 1297, 32),
(866, 'GELENDOST', 1341, 32),
(867, 'GÖNEN', 1929, 32),
(868, 'KEÇİBORLU', 1456, 32),
(869, 'MERKEZ', 1401, 32),
(870, 'SENİRKENT', 1615, 32),
(871, 'SÜTÇÜLER', 1648, 32),
(872, 'ŞARKİKARAAĞAÇ', 1651, 32),
(873, 'ULUBORLU', 1699, 32),
(874, 'YALVAÇ', 1717, 32),
(875, 'YENİŞARBADEMLİ', 2001, 32),
(876, 'AFŞİN', 1107, 46),
(877, 'ANDIRIN', 1136, 46),
(878, 'ÇAĞLAYANCERİT', 1785, 46),
(879, 'DULKADİROĞLU', 2084, 46),
(880, 'EKİNÖZÜ', 1919, 46),
(881, 'ELBİSTAN', 1299, 46),
(882, 'GÖKSUN', 1353, 46),
(883, 'NURHAK', 1975, 46),
(884, 'ONİKİŞUBAT', 2085, 46),
(885, 'PAZARCIK', 1570, 46),
(886, 'TÜRKOĞLU', 1694, 46),
(887, 'EFLANİ', 1296, 78),
(888, 'ESKİPAZAR', 1321, 78),
(889, 'MERKEZ', 1433, 78),
(890, 'OVACIK', 1561, 78),
(891, 'SAFRANBOLU', 1587, 78),
(892, 'YENİCE', 1856, 78),
(893, 'AYRANCI', 1768, 70),
(894, 'BAŞYAYLA', 1884, 70),
(895, 'ERMENEK', 1316, 70),
(896, 'KAZIMKARABEKİR', 1862, 70),
(897, 'MERKEZ', 1439, 70),
(898, 'SARIVELİLER', 1983, 70),
(899, 'AKYAKA', 1756, 36),
(900, 'ARPAÇAY', 1149, 36),
(901, 'DİGOR', 1279, 36),
(902, 'KAĞIZMAN', 1424, 36),
(903, 'MERKEZ', 1447, 36),
(904, 'SARIKAMIŞ', 1601, 36),
(905, 'SELİM', 1614, 36),
(906, 'SUSUZ', 1645, 36),
(907, 'ABANA', 1101, 37),
(908, 'AĞLI', 1867, 37),
(909, 'ARAÇ', 1140, 37),
(910, 'AZDAVAY', 1162, 37),
(911, 'BOZKURT', 1208, 37),
(912, 'CİDE', 1221, 37),
(913, 'ÇATALZEYTİN', 1238, 37),
(914, 'DADAY', 1264, 37),
(915, 'DEVREKANİ', 1277, 37),
(916, 'DOĞANYURT', 1915, 37),
(917, 'HANÖNÜ', 1940, 37),
(918, 'İHSANGAZİ', 1805, 37),
(919, 'İNEBOLU', 1410, 37),
(920, 'KÜRE', 1499, 37),
(921, 'MERKEZ', 1450, 37),
(922, 'PINARBAŞI', 1836, 37),
(923, 'SEYDİLER', 1984, 37),
(924, 'ŞENPAZAR', 1845, 37),
(925, 'TAŞKÖPRÜ', 1666, 37),
(926, 'TOSYA', 1685, 37),
(927, 'AKKIŞLA', 1752, 38),
(928, 'BÜNYAN', 1218, 38),
(929, 'DEVELİ', 1275, 38),
(930, 'FELAHİYE', 1330, 38),
(931, 'HACILAR', 1936, 38),
(932, 'İNCESU', 1409, 38),
(933, 'KOCASİNAN', 1863, 38),
(934, 'MELİKGAZİ', 1864, 38),
(935, 'ÖZVATAN', 1978, 38),
(936, 'PINARBAŞI', 1576, 38),
(937, 'SARIOĞLAN', 1603, 38),
(938, 'SARIZ', 1605, 38),
(939, 'TALAS', 1846, 38),
(940, 'TOMARZA', 1680, 38),
(941, 'YAHYALI', 1715, 38),
(942, 'YEŞİLHİSAR', 1727, 38),
(943, 'ELBEYLİ', 2023, 79),
(944, 'MERKEZ', 1476, 79),
(945, 'MUSABEYLİ', 2024, 79),
(946, 'POLATELİ', 2025, 79),
(947, 'BAHŞİLİ', 1880, 71),
(948, 'BALIŞEYH', 1882, 71),
(949, 'ÇELEBİ', 1901, 71),
(950, 'DELİCE', 1268, 71),
(951, 'KARAKEÇİLİ', 1954, 71),
(952, 'KESKİN', 1463, 71),
(953, 'MERKEZ', 1469, 71),
(954, 'SULAKYURT', 1638, 71),
(955, 'YAHŞİHAN', 1992, 71),
(956, 'BABAESKİ', 1163, 39),
(957, 'DEMİRKÖY', 1270, 39),
(958, 'KOFÇAZ', 1480, 39),
(959, 'LÜLEBURGAZ', 1505, 39),
(960, 'MERKEZ', 1471, 39),
(961, 'PEHLİVANKÖY', 1572, 39),
(962, 'PINARHİSAR', 1577, 39),
(963, 'VİZE', 1714, 39),
(964, 'AKÇAKENT', 1869, 40),
(965, 'AKPINAR', 1754, 40),
(966, 'BOZTEPE', 1890, 40),
(967, 'ÇİÇEKDAĞI', 1254, 40),
(968, 'KAMAN', 1429, 40),
(969, 'MERKEZ', 1472, 40),
(970, 'MUCUR', 1529, 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `adress_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `user_ip` varchar(25) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `adress_id`, `option_id`, `quantity`, `total_price`, `order_no`, `user_ip`, `is_completed`, `purchase_date`) VALUES
(138, 22, 2, 21, 20, 1, '24471.05', '12437698', '::1', 1, '2021-01-29 09:43:07'),
(139, 22, 3, 21, 24, 1, '5099.00', '64185293', '::1', 0, '2021-12-29 10:43:47'),
(140, 22, 6, 21, 0, 1, '1554.00', '05931824', '::1', 0, '2021-12-29 15:58:46'),
(141, 22, 6, 21, 0, 1, '1554.00', '20781649', '::1', 1, '2022-01-09 10:35:17'),
(142, 22, 7, 21, 0, 1, '34899.32', '20781649', '::1', 1, '2021-12-05 10:35:17'),
(143, 22, 6, 22, 0, 1, '1554.00', '71409568', '::1', 0, '2022-01-13 19:46:32'),
(144, 22, 6, 22, 0, 2, '3108.00', '98654120', '::1', 1, '2022-01-13 19:51:27'),
(145, 22, 7, 22, 0, 1, '34899.32', '51304278', '::1', 1, '2022-01-13 19:52:31'),
(146, 22, 8, 22, 29, 1, '5333.90', '03426875', '::1', 0, '2022-01-24 18:32:23'),
(147, 22, 12, 22, 31, 1, '139.90', '03426875', '::1', 0, '2022-01-24 18:32:23'),
(148, 22, 11, 22, 0, 1, '10498.99', '95143082', '::1', 0, '2022-01-24 18:34:42'),
(149, 22, 12, 22, 32, 1, '139.90', '97234508', '::1', 1, '2022-01-24 18:36:32'),
(150, 22, 11, 22, 0, 1, '10498.99', '95836041', '::1', 0, '2022-01-24 18:40:59'),
(151, 22, 11, 22, 0, 1, '10498.99', '36829754', '::1', 0, '2022-01-24 19:50:19'),
(152, 22, 11, 22, 0, 1, '10498.99', '78256104', '::1', 0, '2022-01-24 19:52:50'),
(153, 22, 10, 22, 0, 1, '2099.00', '30456918', '::1', 0, '2022-01-24 19:53:32'),
(154, 22, 10, 22, 0, 1, '2099.00', '50389427', '::1', 0, '2022-01-24 19:55:20'),
(155, 22, 12, 22, 30, 1, '139.90', '74813205', '::1', 0, '2022-01-24 19:55:45'),
(156, 22, 12, 22, 30, 1, '139.90', '18746925', '::1', 0, '2022-01-24 19:58:04'),
(157, 22, 10, 22, 0, 1, '2099.00', '05382674', '::1', 1, '2022-01-24 19:59:20'),
(158, 22, 9, 22, 0, 1, '14599.00', '31576498', '::1', 0, '2022-01-25 09:04:00'),
(159, 23, 11, 23, 0, 1, '10498.99', '02378495', '::1', 0, '2022-01-25 09:07:32'),
(160, 22, 10, 22, 0, 1, '2099.00', '61984257', '::1', 1, '2022-01-25 09:12:20'),
(161, 22, 10, 22, 0, 2, '4198.00', '72316584', '::1', 0, '2022-01-25 09:45:57'),
(162, 22, 13, 22, 33, 1, '1598.99', '49507368', '::1', 0, '2022-01-25 09:52:27'),
(163, 22, 13, 22, 33, 1, '1598.99', '82365947', '::1', 0, '2022-01-25 09:54:56');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(524) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_entry_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_url` varchar(524) NOT NULL,
  `is_live` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `category_id`, `product_image`, `product_entry_date`, `product_url`, `is_live`) VALUES
(8, 'Dreame Bot D9 Max Robot Vakum ve Paspas', '5333.90', 12, '8663e27906d6d648bdac4fc9a23b710f.jpg', '2022-01-24 18:25:46', 'dreame-bot-d9-max-robot-vakum-ve-paspas', 1),
(9, 'Dell Gaming G15 AMD Ryzen 5-5600H 8GB 512GB SSD RTX3050 4GB VGA 15.6” FHD Windows 11 Home Taşınabilir Bilgisayar G15-FGR556W85N', '14599.00', 11, 'bd68fcdbcd3b5867408a53e523b39db6.jpg', '2022-01-24 18:27:25', 'dell-gaming-g15-amd-ryzen-5-5600h-8gb-512gb-ssd-rtx3050-4gb-vga-15-6-fhd-windows-11-home-tasinabilir-bilgisayar-g15-fgr556w85n', 1),
(10, 'Intel Core i5 10400F 2.90GHz LGA1200 12MB Cache İşlemci', '2099.00', 13, '509e5cecabd87224f200decde80749c5.jpg', '2022-01-24 18:28:25', 'intel-core-i5-10400f-2-90ghz-lga1200-12mb-cache-islemci', 1),
(11, 'EVGA GeForce RTX 2060 KO ULTRA GAMING 6GB GDDR6 192Bit Nvidia DX12 Ekran Kartı', '10498.99', 13, '4beba1bee15bd57d7875decabbd8efe9.jpg', '2022-01-24 18:29:13', 'evga-geforce-rtx-2060-ko-ultra-gaming-6gb-gddr6-192bit-nvidia-dx12-ekran-karti', 1),
(12, 'Hummel Leon Unisex Spor Ayakkabı 900102-7986', '139.90', 20, '463de6421f72797e0cad96ffa8878dd6.jpg', '2022-01-24 18:30:34', 'hummel-leon-unisex-spor-ayakkabi-900102-7986', 1),
(13, 'Viewsonic VA2405-H 23.6&quot; 75Hz 3ms (HDMI+Analog) Full HD Led Monitör', '1598.99', 12, 'deb229bd5b4ee0425a7b25f6827afc7d.jpg', '2022-01-25 09:51:58', 'viewsonic-va2405-h-23-6-75hz-3ms-hdmi-analog-full-hd-led-monitor', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_path`) VALUES
(71, 5, 'd41371a3add7be660f04c4169838b804.jpg'),
(72, 5, '280ad917e6e9e4379b03070a25e22d9b.jpg'),
(73, 5, 'c9dd1a293a9468e6250ef6d201bb456f.jpg'),
(74, 5, '035ba7b34f22b126adac9e595bc061ce.jpg'),
(77, 8, '84e93815b6bb052957fb89cde8ed8d1a.jpg'),
(78, 8, 'e5a84a039b6146964534bdacb032f6ae.jpg'),
(79, 9, 'adaeb2b9f3706c733f6ff437138e0d29.jpg'),
(80, 9, 'bdac544bd180fbf103f0a96e8f810fec.jpg'),
(81, 9, 'b04249ad1a6db80705ce9bcd57e01e91.jpg'),
(82, 9, '18d6dc5af581fd65f58e06770198c6af.jpg'),
(83, 11, 'cd6a6552e4f6bf13aea39ba19e07cdce.jpg'),
(84, 11, '2fe4000c7db2eb14c3a9a7aa3d845416.jpg'),
(85, 11, '9fe4c900d3b079e5cfab217a98616c44.jpg'),
(86, 11, '2835e84372c3336681954032224e45ca.jpg'),
(87, 12, '07751c2c229b89b5aeb3ff98095f561d.jpg'),
(88, 13, 'e73719deefc439aaef9e7677183adb7e.jpg'),
(89, 13, '1557f5fc8091dba54ff33f653993cc93.jpg'),
(90, 13, '6f8284b45f88f9860a19974ab692c7cf.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_options`
--

CREATE TABLE `product_options` (
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_options`
--

INSERT INTO `product_options` (`option_id`, `product_id`, `option_value`) VALUES
(29, 8, 'Siyah'),
(30, 12, 'Gri'),
(31, 12, 'Siyah'),
(32, 12, 'Mavi'),
(33, 13, 'Siyah');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `slider_imgPath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_register_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_register_date`) VALUES
(21, 'Umut Erozan', 'umut.erozan@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2021-12-27 10:29:26'),
(22, 'Emrecan Unlu', 'unl.c.emre@gmail.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5', '2021-12-27 16:00:00'),
(23, 'Oğuzhan İlüfer', 'oguzha.ilufer@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2022-01-25 09:05:55');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_adress`
--

CREATE TABLE `user_adress` (
  `adress_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `adress_title` varchar(30) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_tel` varchar(10) NOT NULL,
  `user_city` int(11) NOT NULL,
  `user_district` int(11) NOT NULL,
  `user_adress` varchar(255) NOT NULL,
  `user_tc` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `user_adress`
--

INSERT INTO `user_adress` (`adress_id`, `user_id`, `adress_title`, `user_name`, `user_tel`, `user_city`, `user_district`, `user_adress`, `user_tc`) VALUES
(19, 20, 'Umut&#039;un Evi', 'Umut Erozan', '5062645455', 14, 213, 'No:124, Orta Mahalle Caddesi.\r\nÇamlıca Apartmanı, Kat:5, Daire: 30', '31314314134'),
(20, 21, 'Umut&#039;un Ev&#039;i', 'Umut Erozan', '4848485494', 6, 128, 'No:124, Orta Mahalle Caddesi.\r\nÇamlıca Apartmanı, Kat:5, Daire: 30', '31241331341'),
(22, 22, 'Ev', 'Emrecan Ünlü', '5061547830', 3, 93, 'No:124, Orta Mahalle Caddesi.\r\nÇamlıca Apartmanı, Kat:5, Daire: 30', '11692698710'),
(23, 23, 'Ev', 'Oğuzhan İlüfer', '5061454888', 1, 9, 'İstanbul / Bayrampaşa no:124', '11692588961'),
(24, 22, 'Ev Adresim 2', 'Emrecan Ünlü', '5061547830', 3, 93, 'İzmir/Torbalı, Muratbey Mahallesi, No:3506 Kat:1, Daire:1', '11692698710');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `visitors`
--

CREATE TABLE `visitors` (
  `visitor_id` int(11) NOT NULL,
  `ip_address` varchar(25) NOT NULL,
  `referrer` varchar(512) DEFAULT NULL,
  `platform` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `page` varchar(512) NOT NULL,
  `entry_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `visitors`
--

INSERT INTO `visitors` (`visitor_id`, `ip_address`, `referrer`, `platform`, `browser`, `page`, `entry_time`) VALUES
(16, '::1', NULL, 'Windows 10', 'Chrome', '', '2022-01-25 12:48:03'),
(17, '::1', NULL, 'Windows 10', 'Chrome', 'evga-geforce-rtx-2060-ko-ultra-gaming-6gb-gddr6-192bit-nvidia-dx12-ekran-karti', '2022-01-25 12:48:07'),
(18, '::1', NULL, 'Windows 10', 'Chrome', 'evga-geforce-rtx-2060-ko-ultra-gaming-6gb-gddr6-192bit-nvidia-dx12-ekran-karti', '2022-01-25 12:48:39'),
(19, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:48:41'),
(20, '::1', NULL, 'Windows 10', 'Chrome', 'adminauth/login', '2022-01-25 12:49:11'),
(21, '::1', NULL, 'Windows 10', 'Chrome', 'admin/dashboard_cart', '2022-01-25 12:49:12'),
(22, '::1', NULL, 'Windows 10', 'Chrome', 'admin/add_product', '2022-01-25 12:51:58'),
(23, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:52:01'),
(24, '::1', NULL, 'Windows 10', 'Chrome', 'viewsonic-va2405-h-23-6-75hz-3ms-hdmi-analog-full-hd-led-monitor', '2022-01-25 12:52:04'),
(25, '::1', NULL, 'Windows 10', 'Chrome', 'api/add_basket', '2022-01-25 12:52:11'),
(26, '::1', NULL, 'Windows 10', 'Chrome', 'sepet', '2022-01-25 12:52:14'),
(27, '::1', NULL, 'Windows 10', 'Chrome', 'giris-yap', '2022-01-25 12:52:17'),
(28, '::1', NULL, 'Windows 10', 'Chrome', 'user/login', '2022-01-25 12:52:21'),
(29, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:52:21'),
(30, '::1', NULL, 'Windows 10', 'Chrome', 'sepet', '2022-01-25 12:52:23'),
(31, '::1', NULL, 'Windows 10', 'Chrome', 'siparisi-tamamla', '2022-01-25 12:52:25'),
(32, '::1', NULL, 'Windows 10', 'Chrome', 'odeme', '2022-01-25 12:52:27'),
(33, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:53:28'),
(34, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:54:16'),
(35, '::1', NULL, 'Windows 10', 'Chrome', 'hesap-ayarlari', '2022-01-25 12:54:19'),
(36, '::1', NULL, 'Windows 10', 'Chrome', 'sepet', '2022-01-25 12:54:22'),
(37, '::1', NULL, 'Windows 10', 'Chrome', 'siparisi-tamamla', '2022-01-25 12:54:53'),
(38, '::1', NULL, 'Windows 10', 'Chrome', 'odeme', '2022-01-25 12:54:55'),
(39, '::1', NULL, 'Windows 10', 'Chrome', 'giris-yap', '2022-01-25 12:55:35'),
(40, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:55:38'),
(41, '::1', NULL, 'Windows 10', 'Chrome', 'Anasayfa', '2022-01-25 12:57:45'),
(42, '::1', NULL, 'Windows 10', 'Chrome', 'giris-yap', '2022-01-25 12:57:51');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Tablo için indeksler `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`sehir_id`);

--
-- Tablo için indeksler `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`ilce_id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Tablo için indeksler `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Tablo için indeksler `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Tablo için indeksler `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Tablo için indeksler `user_adress`
--
ALTER TABLE `user_adress`
  ADD PRIMARY KEY (`adress_id`);

--
-- Tablo için indeksler `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`visitor_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `cities`
--
ALTER TABLE `cities`
  MODIFY `sehir_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `counties`
--
ALTER TABLE `counties`
  MODIFY `ilce_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=971;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Tablo için AUTO_INCREMENT değeri `product_options`
--
ALTER TABLE `product_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Tablo için AUTO_INCREMENT değeri `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Tablo için AUTO_INCREMENT değeri `user_adress`
--
ALTER TABLE `user_adress`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `visitors`
--
ALTER TABLE `visitors`
  MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
