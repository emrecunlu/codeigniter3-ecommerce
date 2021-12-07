-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Ara 2021, 00:29:57
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
(11, 'Amd Ryzen 5 5600X 3.7ghz 35MB Cache Soket Am4 Işlemci', '4398.99', 13, '10938125287474.jpg', '2021-12-07 23:17:13', 'amd-ryzen-5-5600x-37ghz-35mb-cache-soket-am4-islemci', 1);

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
(32, 11, '10938125353010.jpg');

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
(8, 5, 'Mavi');

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
(14, 'Emrecan Ünlü', 'unl.c.emre@gmail.com', 'b2c1d08e7451a706833cbb8a4fcc93a15c74c0f5', '2021-12-07 21:33:17');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

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
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Tablo için AUTO_INCREMENT değeri `product_options`
--
ALTER TABLE `product_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
