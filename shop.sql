-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 Ara 2021, 16:39:38
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.0.13

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
(1, 'admin@eticaret.com', 'd033e22ae348aeb5660fc2140aec35850c4da997');

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
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `adress_id`, `option_id`, `quantity`, `total_price`, `order_no`, `is_completed`, `purchase_date`) VALUES
(108, 14, 69, 14, 13, 1, '329.00', '37608451', 1, '2021-12-24 15:45:09'),
(109, 14, 10, 14, 0, 1, '1599.00', '05896231', 1, '2021-12-24 15:45:54'),
(110, 14, 7, 14, 0, 1, '189.90', '05896231', 1, '2021-12-24 15:45:54'),
(112, 14, 64, 14, 0, 1, '17371.08', '54712398', 1, '2021-12-24 15:49:58'),
(113, 14, 68, 14, 9, 1, '254.90', '03945871', 0, '2021-12-24 15:51:31'),
(115, 18, 69, 15, 15, 1, '329.00', '37280695', 0, '2021-12-25 15:07:18'),
(116, 18, 70, 15, 18, 1, '6826.05', '19538204', 1, '2021-12-25 15:08:17'),
(117, 18, 63, 15, 0, 1, '8775.00', '37291648', 0, '2021-12-25 15:34:54'),
(118, 18, 72, 15, 0, 1, '4300.00', '35046192', 0, '2021-12-25 15:37:10');

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
(4, 'Apple MacBook Air M1 Çip 8GB 256GB SSD macOS 13\" QHD Taşınabilir Bilgisayar Uzay Grisi MGN63TU/A', '13499.00', 11, '10983949860914.jpg', '2021-12-05 14:25:56', 'apple-macbook-air-m1-cip-8gb-256gb-ssd-macos-13-qhd-tasinabilir-bilgisayar-uzay-grisi-mgn63tua', 1),
(5, 'Xiaomi Redmi Note 10S 128 GB 6 GB Ram (Xiaomi Türkiye Garantili)', '4069.00', 10, '110000045850384.jpg', '2021-12-05 14:27:33', 'xiaomi-redmi-note-10s-128-gb-6-gb-ram-xiaomi-turkiye-garantili', 1),
(6, 'Msı Rtx 3060 Ti Gamıng Z Trıo Lhr 8gb Gddr6 256BIT Ekran Kartı RTX-3060-TI-GAMING-Z-TRIO-8G-LHR', '21664.09', 13, '110000055071814.jpg', '2021-12-05 14:28:26', 'msi-rtx-3060-ti-gaming-z-trio-lhr-8gb-gddr6-256bit-ekran-karti-rtx-3060-ti-gaming-z-trio-8g-lhr', 1),
(7, 'Yüzüklerin Efendisi 3 Cilt Takım (Yüzük Kardeşliği, İki Kule, Kralın Dönüşü)\r\n', '189.90', 15, '10481312071730.jpg', '2021-12-05 14:29:57', 'yuzuklerin-efendisi-3-cilt-takim-yuzuk-kardesligi-iki-kule-kralin-donusu', 1),
(8, 'MSI B450M Bazooka AM4 DDR4 3466 (OC )HDMI M.2 USB3.2 WIFI MATX Anakart\r\n', '1009.62', 13, '11259522875442.jpg', '2021-12-05 14:31:08', 'msi-b450m-bazooka-am4-ddr4-3466-oc-hdmi-m2-usb32-wifi-matx-anakart', 1),
(9, 'ASUS ROG STRIX Z690 Intel 6400MHz DDR5 LGA1700 ATX Anakart ROG STRIX Z690-F GAMING WIFI\r\n', '9177.78', 13, '110000087968069.jpg', '2021-12-07 22:29:17', 'asus-rog-strix-z690-intel-6400mhz-ddr5-lga1700-atx-anakart-rog-strix-z690-f-gaming-wifi', 1),
(10, 'Corsair Vengeance RGB Pro 16GB (2x8GB) 3600MHz DDR4 Ram CMW16GX4M2Z3600C18\r\n', '1599.00', 13, '10336656261170.jpg', '2021-12-07 22:31:10', 'corsair-vengeance-rgb-pro-16gb-2x8gb-3600mhz-ddr4-ram-cmw16gx4m2z3600c18', 1),
(11, 'Amd Ryzen 5 5600X 3.7ghz 35MB Cache Soket Am4 Işlemci', '4398.99', 13, '10938125287474.jpg', '2021-12-07 23:17:13', 'amd-ryzen-5-5600x-37ghz-35mb-cache-soket-am4-islemci', 1),
(63, 'Roborock S6 MaxV Vacuum Cleaner', '8775.00', 12, '1a47a1376d93fa4931a231934dcedc26.jpg', '2021-12-21 21:00:34', 'roborock-s6-maxv-vacuum-cleaner', 1),
(64, 'MSI GF63 THIN 11SC-035XTR Intel Core I5-11400H 8GB 512GB SSD GTX1650 Freedos 15.6 FHD Taşınabilir Bilgisayar', '17371.08', 11, '4093aad43a145941ad4adc2f4d5d6246.jpg', '2021-12-21 21:03:50', 'msi-gf63-thin-11sc-035xtr-intel-core-i5-11400h-8gb-512gb-ssd-gtx1650-freedos-15-6-fhd-tasinabilir-bilgisayar', 1),
(65, 'Deneme ürün başlık', '120.00', 12, '2f2baf752a7308db285dc70520052b19.jpg', '2021-12-21 21:09:31', 'deneme-urun-baslik', 1),
(66, 'Deneme ürün başlık', '120.00', 12, '0b22a58d5d4e4b0751e3daa9e1c51613.jpg', '2021-12-21 21:10:00', 'deneme-urun-baslik', 1),
(67, 'Deneme ürün başlık', '120.00', 12, '79db4421bd3cfdefe1a92a0d7c8ea479.jpg', '2021-12-21 21:10:54', 'deneme-urun-baslik', 1),
(68, 'Slazenger Peer Oversize Kadın Sweatshirt', '254.90', 20, '3ada973472838290eb274fc4b1a95d30.jpg', '2021-12-21 21:14:07', 'slazenger-peer-oversize-kadin-sweatshirt', 1),
(69, 'Kiğılı Kapüşonlu Spor Kaban', '329.00', 20, 'cd000ee2904d6ec59230ea07c28336ba.jpg', '2021-12-21 21:16:14', 'kigili-kapusonlu-spor-kaban', 1),
(70, 'Apple iPad 8. Nesil 32 GB 10.2&quot; WiFi Tablet - MYL92TU/A', '6826.05', 12, '1549d3bd7a713c98dba7dbe677af23b4.jpg', '2021-12-21 21:20:52', 'apple-ipad-8-nesil-32-gb-10-2-wifi-tablet-myl92tu-a', 1),
(71, 'Karaca Çaysever Konuşan Çay Makinesi', '1034.90', 12, 'bbde1f077c58670e3277fe5f5d3d4c82.jpg', '2021-12-22 09:41:28', 'karaca-caysever-konusan-cay-makinesi', 1),
(72, 'Gymholix SquatC Compact Katlanabilir Fitness İstasyonu V.2', '4300.00', 20, '166d1f32ec15dd6d722d01291f01b9c2.jpg', '2021-12-25 15:36:40', 'gymholix-squatc-compact-katlanabilir-fitness-istasyonu-v-2', 1);

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
(9, 4, '10983949893682.jpg'),
(10, 4, '10983949926450.jpg'),
(11, 4, '10983949959218.jpg'),
(12, 4, '10983949991986.jpg'),
(13, 4, '110000015075876.jpg'),
(14, 5, '110000046078981.jpg'),
(15, 5, '110000045841105.jpg'),
(16, 5, '110000045841078.jpg'),
(17, 6, '110000055071815.jpg'),
(18, 6, '110000055071816.jpg'),
(19, 6, '110000055071817.jpg'),
(20, 6, '110000055071818.jpg'),
(21, 7, '10481312104498.jpg'),
(22, 8, '11259522908210.jpg'),
(24, 9, '110000087968070.jpg'),
(25, 9, '110000087968071.jpg'),
(26, 9, '110000087968072.jpg'),
(27, 9, '110000087968073.jpg'),
(28, 10, '10336656293938.jpg'),
(29, 10, '10336656326706.jpg'),
(30, 10, '10336656359474.jpg'),
(31, 11, '10938125320242.jpg'),
(32, 11, '10938125353010.jpg'),
(33, 63, '2a5be7cac2ff759ee38b9393164e7e9b.jpg'),
(34, 63, '23064e2f312e1b14aa734a993cb56af7.jpg'),
(35, 63, 'aa5788d87ea4189a031f914e92212662.jpg'),
(36, 63, '7b77e861e1cbf6852c1160546dd580bd.jpg'),
(37, 64, '54c131d03ae293fb312c4d9856ac63a9.jpg'),
(38, 64, '5ec95910dffe2bd8321e3d5e73948885.jpg'),
(39, 64, 'fa64c8780349ea3e30b57d05bd2af347.jpg'),
(40, 64, '6681db7166cb9032ebe7457a7d545d3b.jpg'),
(41, 68, '44478e53507cdeb29ace22fcaf009ad2.jpg'),
(42, 68, 'de58ca28ffe5b45b2289cec41ace85d6.jpg'),
(43, 68, '98115e6467b1f4ba1ed4597bcf724d15.jpg'),
(44, 68, '5cfb1c6d52fd9b53bb447a013b226bba.jpg'),
(45, 69, 'b50c4ae08f4e6615b194f0ee4158db33.jpg'),
(46, 69, 'c7aad490d9eb70755ac9f4b77b9b0157.jpg'),
(47, 70, '8648946c8214790deadfa991e555baea.jpg'),
(48, 70, 'ccb30c88c70bd063d9fc4228689cf040.jpg'),
(49, 70, 'a175118e5720a48d46b2f93bf6f0bfa1.jpg'),
(50, 71, '93c05e32ac74f25149ea87e696ae5778.jpg'),
(51, 71, '353d628559dbd6dc05fbdd4afe528986.jpg'),
(52, 71, '355568286f5b9ccfb73c97660f683654.jpg'),
(53, 72, 'a671d9d2c1c14cad3dbab43367b47831.jpg'),
(54, 72, '06ee3d2a29293c3c7db49bbf25ea75c6.jpg');

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
(6, 5, 'Beyaz'),
(7, 5, 'Gri'),
(8, 5, 'Mavi'),
(9, 68, 'S'),
(10, 68, 'M'),
(11, 68, 'L'),
(12, 68, 'XL'),
(13, 69, 'S'),
(14, 69, 'M'),
(15, 69, 'L'),
(16, 70, 'Altın'),
(17, 70, 'Gümüş'),
(18, 70, 'Uzay Grisi'),
(19, 71, 'Siyah');

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
(14, 'Tutkun Turan', 'unl.c.emre@gmail.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5', '2021-12-07 21:33:17'),
(15, 'Hüseyin Kurban', 'huseyinkurban123@outlook.com', '23cee43d3dc575b387def6197ce46d51073ed50b', '2021-12-12 18:38:21'),
(16, 'deneme deneme', 'deneme@codeigniter.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5', '2021-12-13 12:31:12'),
(17, 'Tutkun Turan', 'turan123@gmail.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5', '2021-12-21 21:18:40'),
(18, 'Deneme Kullanici', 'deneme@kullanici.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5', '2021-12-25 15:05:35');

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
(10, 15, 'Hüseyinin Evi', 'Hüseyin Kurban', '', 31, 431, 'Kütahya / Tavşanlı, No:12 D:1', '65458121223'),
(12, 16, 'EV', 'Deneme Kullanıcı', '', 23, 291, 'Burdur / Ağlasun myo.', '11692698710'),
(13, 17, 'Tutkunun Ev&#039;i', 'Tutkun Turan', '', 3, 93, 'İzmir/Torbalı, Barış yapı, no:5 kat:2 d:2', '25695958484'),
(14, 14, 'Tutkunun Ev&#039;i', 'Emrecan Ünlü', '', 3, 93, 'No:124, Orta Mahalle Caddesi.\r\nÇamlıca Apartmanı, Kat:5, Daire: 30', '14445595959'),
(15, 18, 'Ev Adresim', 'Emrecan Ünlü', '', 3, 93, 'İzmir / Torbalı, Muratbey Mahallesi, No:12, D:1, 3506 Sk.', '11692698710');

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
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Tablo için AUTO_INCREMENT değeri `product_options`
--
ALTER TABLE `product_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `user_adress`
--
ALTER TABLE `user_adress`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
